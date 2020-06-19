using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;


namespace LawnHedgeMaintenance.Admin
{
    public class DataAccessLayer
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["lawnandhedgemaintenanceConnectionString"].ConnectionString;

        /* ---------- Login -----------*/

        public static string Authenticate(String userName, String pwd)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
         
            if (con.State == ConnectionState.Open)
            {
                //check in admin table first
                string qry = "";
                qry = "select username,password from admins where username= '" + userName + "' and password='" + pwd + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    return "admin";
                }
                //check in customer table next
                else
                {
                    reader.Close();
                    //get hashed password
                    string password = Security.getHash(userName, pwd);
                    string newqry = "select username,password from customers where username= '" + userName + "' and password='" + password + "'";
                    SqlCommand newcmd = new SqlCommand(newqry, con);
                    SqlDataReader newreader = newcmd.ExecuteReader();
                    if (newreader.Read())
                    {
                        return "customer";
                    }
                }
            }
            return "fail";
        }

        /*------------- Reset Password ---------------*/

        public static void ResetPwd(string emailid, string pwd)
        {
            //get username from email id
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "select username from customers where email = '" + emailid + "'";
            SqlCommand sqlCmd = new SqlCommand(query, con);
            SqlDataReader newreader = sqlCmd.ExecuteReader();
            string uname = newreader.GetValue(0).ToString();


            //hash password
            string hashpwd = Security.getHash(uname, pwd);
            
            //save new password in the database
            string newquery = "update customers set password = '" + hashpwd + "' where username = '" + uname + "'";
            SqlCommand newsqlCmd = new SqlCommand(newquery, con);
            newsqlCmd.ExecuteNonQuery();

        }


        /* --------- Services Management -----------*/
        public static void populateGridView(GridView servicesMngt)
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM servicestable", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                servicesMngt.DataSource = dtbl;
                servicesMngt.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                servicesMngt.DataSource = dtbl;
                servicesMngt.DataBind();
                servicesMngt.Rows[0].Cells.Clear();
                servicesMngt.Rows[0].Cells.Add(new TableCell());
                servicesMngt.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                servicesMngt.Rows[0].Cells[0].Text = "No Data Found ..!";
                servicesMngt.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        //Overload populate gridview for search result

        public static void populateGridView(GridView servicesMngt, string sName)
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM servicestable where servName like '%" + sName + "%'", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                servicesMngt.DataSource = dtbl;
                servicesMngt.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                servicesMngt.DataSource = dtbl;
                servicesMngt.DataBind();
                servicesMngt.Rows[0].Cells.Clear();
                servicesMngt.Rows[0].Cells.Add(new TableCell());
                servicesMngt.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                servicesMngt.Rows[0].Cells[0].Text = "No Data Found ..!";
                servicesMngt.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        public static void AddNewRecord(GridView servicesMngt)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "INSERT INTO servicestable (servID,servName,servImg) VALUES (@servID,@servName,@servImg)";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@servID", (servicesMngt.FooterRow.FindControl("txtservIDFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@servName", (servicesMngt.FooterRow.FindControl("txtservNameFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@servImg", (servicesMngt.FooterRow.FindControl("txtservImgFooter") as TextBox).Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    populateGridView(servicesMngt);
                    // FormDataControlDemo.lblSuccessMessage.Text = "New Record Added";
                    //  FormDataControlDemo.lblErrorMessage.Text = "";                             /* labels throwing null exception error */
                }
            }
            catch (Exception ex)
            {
                // FormDataControlDemo.lblSuccessMessage.Text = "Row Successfully added";
                // FormDataControlDemo.lblErrorMessage.Text = ex.Message;
            }

        }

        public static void UpdateRecord(GridView servicesMngt, int index)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "UPDATE servicestable SET servID=@servID,servName=@servName,servImg=@servImg WHERE servID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@servID", (servicesMngt.Rows[index].FindControl("txtFirstName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@servName", (servicesMngt.Rows[index].FindControl("txtLastName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@servImg", (servicesMngt.Rows[index].FindControl("txtContact") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(servicesMngt.DataKeys[index].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    servicesMngt.EditIndex = -1;
                    populateGridView(servicesMngt);
                    // FormDataControlDemo.lblSuccessMessage.Text = "Selected Record Updated";
                    // FormDataControlDemo.lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                //FormDataControlDemo.lblSuccessMessage.Text = "Row Successfully updated";
                // FormDataControlDemo.lblErrorMessage.Text = ex.Message;
            }
        }

        public static void DeleteRecord(GridView servicesMngt, int index)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM servicestable WHERE servID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(servicesMngt.DataKeys[index].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    populateGridView(servicesMngt);
                    //FormDataControlDemo.lblSuccessMessage.Text = "Selected Record Deleted";
                    //FormDataControlDemo.lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                //FormDataControlDemo.lblSuccessMessage.Text = "Row Successfully deleted";
                //FormDataControlDemo.lblErrorMessage.Text = ex.Message;
            }
        }



        /* ----------------- Customer Details ------------------- */

            //Check username availibility
        public static bool checkAvailability(string username)
        {
            bool check = checkuname(username);
            return check;
        }

        private static bool checkuname(string uname)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            //select customer with same username(if applicable)
            string query = "select * from customers where username ='" + uname + "'";

            SqlCommand command = new SqlCommand(query, connection);

            SqlDataReader reader = command.ExecuteReader();

            //check availability by assesing if select query returns any row
            if(reader.HasRows)
            {
                return false;
            }
            else
            {
                return true;
            }

        }

        public static void SaveCustomerDetails(customer cust)
        {
            saveCustomer(cust);
            saveCustomerAddr(cust.uname, cust.addr);
        }
        private static void saveCustomer(customer newCust)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            //insert details into customers table
            string query = "insert into customers values('" + newCust.name + "', " + newCust.phno + ", '" + newCust.email + "', '" + newCust.uname + "', '" + newCust.pwd + "')";

            SqlCommand command = new SqlCommand(query, connection);

            command.ExecuteNonQuery();

            connection.Close();
            connection = null;
        }

        private static void saveCustomerAddr(string username, string address)
        {
            //insert address into customer_addr table 
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();

                string[] addr = address.Split(';');
                string query = "insert into customer_addr values('" + username + "', '" + addr[0] + "', '" + addr[1] + "', '" + addr[2] + "')";
                SqlCommand command = new SqlCommand(query, connection);

                command.ExecuteNonQuery();

                connection.Close();
                connection = null;
            }
            catch (SqlException e)
            {
                WebForm9.lblDBerrormsg.Text = e.Message;
            }

        }

        /* ----------------- Search services (customer view) ------------------*/

        public static DataTable searchTable(string name)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lawnandhedgemaintenanceConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            SqlDataAdapter adapt = new SqlDataAdapter("select * from servicestable where servName like '%" + name + "%'", con);
            DataTable dt = new DataTable();
            adapt.Fill(dt);
            return dt;
        }
             
        /* ----------------- Save to Cart ------------------- */

        public static void savetoCart(string username, int serviceID)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            //insert into cart table
            string query = "insert into cart values('" + username + "', " + serviceID + ")";

            SqlCommand command = new SqlCommand(query, connection);

            command.ExecuteNonQuery();

            connection.Close();
            connection = null;
        }

        /*------------------------- Show Cart ---------------------------*/

        public static DataTable showCart(string username)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lawnandhedgemaintenanceConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter("select servicestable.servName, servicestable.servImg, servicestable.servDesc from servicestable inner join cart on cart.servID = servicestable.servID where cart.custUname = '" + username + "'", con);
            adapt.Fill(dt);

            return dt;
        }

        /*---------------- Delete from Cart --------------------*/

        public static void DelFromCart(string username, string serviceName)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lawnandhedgemaintenanceConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string query = "Delete c from cart c INNER JOIN servicestable s on c.servID = s.servID where c.custUname = '" + username + "' AND s.servName = '" + serviceName + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
        }

        /*--------------------- Empty Cart -----------------------*/

        public static void EmptyCart(string username)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lawnandhedgemaintenanceConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string query = "Delete from cart where custUname = '" + username + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
        }


        /* --------- Customer Management -----------*/
        public static void populateCustGridView(GridView customerMngt)
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select c.*, ca.address_street, ca.address_suburb, ca.address_city from customers c inner join customer_addr ca on c.username = ca.username", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                customerMngt.DataSource = dtbl;
                customerMngt.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                customerMngt.DataSource = dtbl;
                customerMngt.DataBind();
                customerMngt.Rows[0].Cells.Clear();
                customerMngt.Rows[0].Cells.Add(new TableCell());
                customerMngt.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                customerMngt.Rows[0].Cells[0].Text = "No Data Found ..!";
                customerMngt.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        //Populate grid view after search
        public static void populateCustGridView(string category, string value, GridView customerMngt)
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select c.*, ca.address_street, ca.address_suburb, ca.address_city from customers c inner join customer_addr ca on c.username = ca.username where " + category + " like '%" + value + "%'", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                customerMngt.DataSource = dtbl;
                customerMngt.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                customerMngt.DataSource = dtbl;
                customerMngt.DataBind();
                customerMngt.Rows[0].Cells.Clear();
                customerMngt.Rows[0].Cells.Add(new TableCell());
                customerMngt.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                customerMngt.Rows[0].Cells[0].Text = "No Data Found ..!";
                customerMngt.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        public static void AddNewCRecord(GridView customerMngt, out string result) //add refernce parameter for return msg and add value here...depending on the value add label msg
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string pwd = (customerMngt.FooterRow.FindControl("txtPwdFooter") as TextBox).Text;
                    string uname = (customerMngt.FooterRow.FindControl("txtUnameFooter") as TextBox).Text;
                    string hashPwd = Security.getHash(uname, pwd);
                    long phn = Convert.ToInt64((customerMngt.FooterRow.FindControl("txtContactFooter") as TextBox).Text.Trim());

                    string query = "INSERT INTO customers VALUES (@name,@phone,@email,@username,@password)";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@name", (customerMngt.FooterRow.FindControl("txtNameFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@phone", phn);
                    sqlCmd.Parameters.AddWithValue("@email", (customerMngt.FooterRow.FindControl("txtcustemailFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@username", uname);
                    sqlCmd.Parameters.AddWithValue("@password", hashPwd);
                    sqlCmd.ExecuteNonQuery();

                    string newquery = "INSERT INTO customer_addr VALUES (@username,@streetno,@suburb,@city)";
                    SqlCommand newsqlcmd = new SqlCommand(newquery, sqlCon);
                    newsqlcmd.Parameters.AddWithValue("@username", uname);
                    newsqlcmd.Parameters.AddWithValue("@streetno", (customerMngt.FooterRow.FindControl("txtStreetFooter") as TextBox).Text.Trim());
                    newsqlcmd.Parameters.AddWithValue("@suburb", (customerMngt.FooterRow.FindControl("txtSuburbFooter") as TextBox).Text.Trim());
                    newsqlcmd.Parameters.AddWithValue("@city", (customerMngt.FooterRow.FindControl("txtCityFooter") as TextBox).Text.Trim());
                    
                    newsqlcmd.ExecuteNonQuery();
                    populateGridView(customerMngt);
                    result = "New Record Added";
                                                 /* labels throwing null exception error */
                }
            }
            catch (Exception ex)
            {
                //result = "action unsuccessful";
                result = "Action Unsuccessful. Error: " + ex.Message;
            }

        }

        public static void UpdateCRecord(GridView customerMngt, int index, out string result)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    string pwd = (customerMngt.FooterRow.FindControl("txtPwd") as TextBox).Text;
                    string uname = (customerMngt.FooterRow.FindControl("txtUname") as TextBox).Text;
                    string hashPwd = Security.getHash(uname, pwd);
                    long phn = Convert.ToInt64((customerMngt.FooterRow.FindControl("txtContactFooter") as TextBox).Text.Trim());

                    sqlCon.Open();
                    string query = "UPDATE customers SET name=@name,phone=@phone,email=@email,username=@username,password=@password WHERE username = @username";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@name", (customerMngt.FooterRow.FindControl("txtName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@phone", phn);
                    sqlCmd.Parameters.AddWithValue("@email", (customerMngt.FooterRow.FindControl("txtcustemail") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@username", uname);
                    sqlCmd.Parameters.AddWithValue("@password", hashPwd);
                    sqlCmd.ExecuteNonQuery();

                    string newquery = "UPDATE customer_addr SET username=@username,address_street=@streetno,address_suburb=@suburb,address_city=@city WHERE username = @username";
                    SqlCommand newsqlcmd = new SqlCommand(newquery, sqlCon);
                    newsqlcmd.Parameters.AddWithValue("@username", uname);
                    newsqlcmd.Parameters.AddWithValue("@streetno", (customerMngt.FooterRow.FindControl("txtStreet") as TextBox).Text.Trim());
                    newsqlcmd.Parameters.AddWithValue("@suburb", (customerMngt.FooterRow.FindControl("txtSuburb") as TextBox).Text.Trim());
                    newsqlcmd.Parameters.AddWithValue("@city", (customerMngt.FooterRow.FindControl("txtCity") as TextBox).Text.Trim());
                    newsqlcmd.ExecuteNonQuery();

                    customerMngt.EditIndex = -1;
                    populateGridView(customerMngt);
                    result = "Selected Record Updated";
                }
            }
            catch (Exception ex)
            {
                // WebForm2.lbl_errorMsg("action unsuccessful");
                result = "Action Unsuccessful. Error: " + ex.Message;
            }
        }

        public static void DeleteCRecord(GridView servicesMngt, int index, out string result)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM customers WHERE username = @username";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@username", servicesMngt.DataKeys[index].Value.ToString());
                    sqlCmd.ExecuteNonQuery();

                    string newquery = "DELETE FROM customer_addr WHERE username = @username";
                    SqlCommand newsqlCmd = new SqlCommand(newquery, sqlCon);
                    newsqlCmd.Parameters.AddWithValue("@username", servicesMngt.DataKeys[index].Value.ToString());
                    newsqlCmd.ExecuteNonQuery();

                    populateGridView(servicesMngt);
                    result = "Selected Record Deleted";
                }
            }
            catch (Exception ex)
            {
                // WebForm2.lbl_errorMsg("action unsuccessful");
                result = "Action Unsuccessful. Error: " + ex.Message;
            }
        }

    }
}