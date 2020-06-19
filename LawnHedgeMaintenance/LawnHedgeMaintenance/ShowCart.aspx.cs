using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawnHedgeMaintenance
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie aCookie = Request.Cookies["aLoggedUser"];
            if(aCookie==null)
            {
                string OriginalUrl = HttpContext.Current.Request.RawUrl;
                string LoginPageUrl = "Login.aspx";
                HttpContext.Current.Response.Redirect(String.Format("{0}?ReturnUrl={1}", LoginPageUrl, OriginalUrl));
            }
            else if(!IsPostBack)
            {
                string uname = aCookie["userId"];
                DataTable dt = Admin.DataAccessLayer.showCart(uname);
                DataList1.DataSource = dt;
                DataList1.DataBind();
                DataList1.Visible = true;
                if(dt.Rows.Count < 1)
                {
                    lblCartMsg.Text = "No item in your cart";
                    BtnCheckout.Enabled = false;
                    BtnBookServices.Enabled = false;
                }
                //else
                //{
                //    BtnCheckout.Enabled = true;
                //}

            }

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            switch(e.CommandName)
            {
                case "delFromCart":
                    HttpCookie aCookie = Request.Cookies["aLoggedUser"];
                    if (aCookie != null)
                    {
                        string uname = aCookie["userId"];
                        string ServName = ((Label)e.Item.FindControl("servNameLabel2")).Text;
                        Admin.DataAccessLayer.DelFromCart(uname, ServName);
                        DataTable dt = Admin.DataAccessLayer.showCart(uname);
                        DataList1.DataSource = dt;
                        DataList1.DataBind();
                        DataList1.Visible = true;
                        if (dt.Rows.Count < 1)
                        {
                            lblCartMsg.Text = "No item in your cart";
                            BtnCheckout.Enabled = false;
                            BtnBookServices.Enabled = false;
                        }
                    }
                    break;
            }
        }

        protected void BtnBookServices_Click(object sender, EventArgs e)
        {
            //empty cart
            HttpCookie aCookie = Request.Cookies["aLoggedUser"];
            string uname = aCookie["userId"];
            Admin.DataAccessLayer.EmptyCart(uname);
            
            Response.Redirect("Booked.aspx");
        }

        protected void BtnCheckout_Click(object sender, EventArgs e)
        {
            BtnBookServices.Enabled = true;
            BtnCheckout.Enabled = false;

        }
    }
}