using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawnHedgeMaintenance
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnResetPwd_Click(object sender, EventArgs e)
        {
            //save new password in the database using cookie
            HttpCookie aCookie = Request.Cookies["aResetUser"];
            if (aCookie != null)
            {
                string email = aCookie["emailID"];

            }

            lblSuccessMsg.Text = "Password has been reset.";
        }
    }
}