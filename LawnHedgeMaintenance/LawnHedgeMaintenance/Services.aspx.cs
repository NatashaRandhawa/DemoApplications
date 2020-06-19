using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawnHedgeMaintenance
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string uname;
            switch (e.CommandName)
            {
                case "addToCart":
                    HttpCookie aCookie = Request.Cookies["aLoggedUser"];
                    if (aCookie == null)
                    {
                        string OriginalUrl = HttpContext.Current.Request.RawUrl;
                        string LoginPageUrl = "Login.aspx";
                        HttpContext.Current.Response.Redirect(String.Format("{0}?ReturnUrl={1}", LoginPageUrl, OriginalUrl));
                        //Response.Redirect("Login.aspx");
                    }
                    uname = aCookie["userId"];
                    //string name = ((Label)DataList1.Controls[0].FindControl("servNameLabel")).Text;          
                    int id = Convert.ToInt32(((Label)e.Item.FindControl("servIDLabel")).Text);
                    Admin.DataAccessLayer.savetoCart(uname,id);

                    break;
            }
            
        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string uname;
            switch (e.CommandName)
            {
                case "addToCart":
                    HttpCookie aCookie = Request.Cookies["aLoggedUser"];
                    if (aCookie == null)
                    {
                        string OriginalUrl = HttpContext.Current.Request.RawUrl;
                        string LoginPageUrl = "Login.aspx";
                        HttpContext.Current.Response.Redirect(String.Format("{0}?ReturnUrl={1}", LoginPageUrl, OriginalUrl));
                        //Response.Redirect("Login.aspx");
                    }
                    uname = aCookie["userId"];
                    //string name = ((Label)DataList1.Controls[0].FindControl("servNameLabel")).Text;
                    int id = Convert.ToInt32(((Label)e.Item.FindControl("servIDLabel2")).Text);
                    Admin.DataAccessLayer.savetoCart(uname, id);

                    break;
            }

        }

        protected void BtnServSrch_Click(object sender, EventArgs e)
        {
            DataTable dt = Admin.DataAccessLayer.searchTable(TxtServSrchBox.Text);
            if(dt.Rows.Count > 0)
            {
                lblSrchRes.Text = "";
                DataList2.DataSource = dt;
                DataList2.DataBind();
                DataList1.Visible = false;
                DataList2.Visible = true;

            }
            else
            {
                lblSrchRes.Text = "No record found";
                DataList1.Visible = false;
                DataList2.Visible = false;
            }
        }

        protected void BtnShowAllServ_Click(object sender, EventArgs e)
        {
            lblSrchRes.Text = "";
            DataList2.Visible = false;
            DataList1.Visible = true;
        }
    }
}