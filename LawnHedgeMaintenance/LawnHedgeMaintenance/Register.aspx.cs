using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawnHedgeMaintenance
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        HttpCookie auCookie;
        protected void Page_Load(object sender, EventArgs e)
        {
            auCookie = new HttpCookie("aUser");
            auCookie.Values["userId"] = TxtRegUname.Text;
            auCookie.Expires.AddHours(1);
            Response.Cookies.Add(auCookie);
        }

        protected void BtnSaveRegForm_Click(object sender, EventArgs e)
        {
            //hash password
            string pwd = Admin.Security.getHash(TxtRegUname.Text, TxtRegPwd.Text);

            string address = TxtRegAddrStreet.Text + ";" + TxtRegAddrSuburb.Text + ";" + TxtRegAddrCity.Text;
            long numPh = Convert.ToInt64(TxtRegMob.Text);
            customer c = new customer(TxtRegName.Text, numPh, TxtRegEmail.Text, address, TxtRegUname.Text, pwd);
            
            //save details in database
            Admin.DataAccessLayer.SaveCustomerDetails(c);

            //remove user cookie
            auCookie = Request.Cookies["aUser"];
            Response.Cookies["aUser"].Expires = DateTime.Now.AddHours(-5);

            //add logged user cookie
            HttpCookie aCookie = new HttpCookie("aLoggedUser");
            aCookie.Values["userId"] = TxtRegUname.Text;
            aCookie.Expires.AddHours(1);
            Response.Cookies.Add(aCookie);

            //redirect to default
            Response.Redirect("Default.aspx");
        }

        //check username availability as user types into the textbox
        protected void CheckUname_Click(object sender, EventArgs e)
        {
            //check for username availability
            bool check = Admin.DataAccessLayer.checkAvailability(TxtRegUname.Text);

            //check to fire validation error message
            if (!check)
            {
                lblUNavail.Text = "unavailable";
            }
            else
            {
                lblUNavail.ForeColor = System.Drawing.Color.Green;
                lblUNavail.Text = "available";
                BtnSaveRegForm.Enabled = true;
            }
        }
    }

    public struct customer
    {
        public string name;
        public long phno;
        public string email;
        public string addr;
        public string uname;
        public string pwd;

        public customer(string cname, long cph, string cmail, string caddr, string cun, string cpwd)
        {
            name = cname;
            phno = cph;
            email = cmail;
            addr = caddr;
            uname = cun;
            pwd = cpwd;
        }
    }
}