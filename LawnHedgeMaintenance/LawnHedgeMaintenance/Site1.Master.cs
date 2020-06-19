using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawnHedgeMaintenance
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if on Register page
            HttpCookie auCookie = Request.Cookies["aUser"];
            HttpCookie aCookie = Request.Cookies["aLoggedUser"];
            if (auCookie != null && aCookie == null)
            {
                NotLoggedIn.Visible = true;
            }
            else
            {
                //After Login  
                if (aCookie != null)
                {
                    LblLoggedUname.Visible = true;
                    LblLoggedUname.Text = "Welcome " + aCookie["userId"] + "!!";
                    LoggedInPH.Visible = true;
                    NotLoggedIn.Visible = false;
                }
                //After Log out or default case
                else
                {
                    LoggedInPH.Visible = false;
                    NotLoggedIn.Visible = true;
                    LblLoggedUname.Visible = false;
                }
                
            }

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void ListItemReg_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            HttpCookie aCookie = Request.Cookies["aLoggedUser"];
            if (aCookie != null)
            {
                Response.Cookies["aLoggedUser"].Expires = DateTime.Now.AddHours(-5);
                Response.Redirect("Default.aspx");
            }
        }
    }
}