using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawnHedgeMaintenance.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAdmlogout_Click(object sender, EventArgs e)
        {
            HttpCookie aCookie = Request.Cookies["aAdmin"];
            if (aCookie != null)
            {
                Response.Cookies["adminId"].Expires = DateTime.Now.AddMinutes(-5);
                Response.Redirect("../Default.aspx");
            }
        }
    }
}