using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawnHedgeMaintenance.Admin
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie aCookie = Request.Cookies["aAdmin"];
            if (aCookie == null)
            {
                Response.Redirect("../Default.aspx");
            }
            else
            {
                TxtAdminName.Text = "Welcome " + aCookie["adminId"] + " !!";
            }
            
        }
    }
}