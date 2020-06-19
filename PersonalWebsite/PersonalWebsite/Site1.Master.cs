using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PersonalWebsite
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string page = Path.GetFileNameWithoutExtension(Request.AppRelativeCurrentExecutionFilePath);

            if(page != null && page.Length >0)
            {
                switch(page)
                {
                    case "Default":
                        home_nav.CssClass = "current";
                        break;
                    case "Resume":
                        resume_nav.CssClass = "current";
                        break;
                    case "Projects":
                        projects_nav.CssClass = "current";
                        break;
                    case "Gallery":
                        gallery_nav.CssClass = "current";
                        break;
                    default:
                        home_nav.CssClass = "current";
                        break;
                }
            }

        }
    }
}