using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawnHedgeMaintenance
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnContfrmsubmit_Click(object sender, EventArgs e)
        {
            //take action (store in db)
            //clear form
            TxtCntfrmName.Text = "";
            TxtCntfrmEmail.Text = "";
            TxtCntfrmSubj.Text = "";
            TxtCntfrmMsg.Text = "";
            lblCntfrmMsg.Text = "Message successfully sent";
            
        }
    }
}