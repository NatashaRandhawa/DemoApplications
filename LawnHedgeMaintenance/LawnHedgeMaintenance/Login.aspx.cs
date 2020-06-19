using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawnHedgeMaintenance
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            //validate login from database
            string user = Admin.DataAccessLayer.Authenticate(TxtLoginUname.Text, TxtLoginPwd.Text);

            //if cutomer Logins
            if(user=="customer")
            {
                //add a cookie
                HttpCookie auCookie = new HttpCookie("aLoggedUser");
                auCookie.Values["userId"] = TxtLoginUname.Text;
                auCookie.Expires.AddHours(1);
                Response.Cookies.Add(auCookie);

                //Return to page from which login was fired
                if (Request.QueryString["ReturnUrl"] != null)
                {
                    Response.Redirect(Request.QueryString["ReturnUrl"].ToString());
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
           
            //if admin logins
            else if(user=="admin")
            {
                //add a cookie
                HttpCookie aCookie = new HttpCookie("aAdmin");
                aCookie.Values["adminId"] = TxtLoginUname.Text;
                aCookie.Expires.AddMinutes(20);
                Response.Cookies.Add(aCookie);
                Response.Redirect("~/Admin/AdminHome.aspx");

            }
            else if(user=="fail")
            {
                lbluserAuth.Text = "Combination of username or password is incorrect";
            }


        }

        //protected void AdmLogin_Authenticate(object sender, AuthenticateEventArgs e)
        //{
        //    if(Admin.DataAccessLayer.Authenticate(AdmLogin.UserName,AdmLogin.Password))
        //    {
        //        HttpCookie aCookie = new HttpCookie("aAdmin");
        //        aCookie.Values["adminId"] = AdmLogin.UserName;
        //        aCookie.Expires.AddMinutes(20);
        //        Response.Cookies.Add(aCookie);
        //        Response.Redirect("~/Admin/AdminHome.aspx");
        //    }
        //}
    }
}