using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net.Mail;
using System.Text;


namespace LawnHedgeMaintenance
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnResetPwd_Click(object sender, EventArgs e)
        {
            //save a cookie with email id
            HttpCookie auCookie = new HttpCookie("aResetUser");
            auCookie.Values["emailId"] = TxtEmail.Text;
            auCookie.Expires.AddHours(1);
            Response.Cookies.Add(auCookie);


            //send email with reset password link
            MailMessage mailMsg = new MailMessage("lawnhedgemaintenance@gmail.com", TxtEmail.Text);
            StringBuilder emailBody = new StringBuilder();
            emailBody.Append("Hi<br/><br/>");
            emailBody.Append("We have got a request from you to reset password.<br/><br/> ");
            emailBody.Append("If it were you, paste the link below into your browser.<br/><br/>");
            emailBody.Append("http://localhost:62404/ResetPassword.aspx"+"<br/>");
            emailBody.Append("If it weren't you, please contact our team.<br/><br/>");
            emailBody.Append("Thank you." + "<br/><br/>");
            emailBody.Append("LHM Team");
            mailMsg.IsBodyHtml = true;
            mailMsg.Subject = "Reset Password Link";
            mailMsg.Body = emailBody.ToString();
            SmtpClient smtpclient = new SmtpClient();
            smtpclient.Send(mailMsg);
            lblResetPwdmsg.Text = "A link to reset your password has been sent on your email address. Please check!!";
        }
    }
}