using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawnHedgeMaintenance.Admin
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie aCookie = Request.Cookies["aAdmin"];
            if (aCookie == null)
            {
                Response.Redirect("../Default.aspx");
            }
            else if (!IsPostBack)
            {
                DataAccessLayer.populateCustGridView(customerMngt);
            }
        }

        protected void customerMngt_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string result = "default";
            if (e.CommandName.Equals("AddNew"))
                DataAccessLayer.AddNewCRecord(customerMngt, out result);
            lblErrorMessage.Text = result;
            lblErrorMessage.Visible = true;

        }

        protected void customerMngt_RowEditing(object sender, GridViewEditEventArgs e)
        {
            customerMngt.EditIndex = e.NewEditIndex;
            DataAccessLayer.populateCustGridView(customerMngt);
        }

        protected void customerMngt_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            customerMngt.EditIndex = -1;
            DataAccessLayer.populateCustGridView(customerMngt);
        }

        protected void customerMngt_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string result = "default";
            DataAccessLayer.UpdateCRecord(customerMngt, e.RowIndex, out result);
            lblErrorMessage. Text = result;
            lblErrorMessage.Visible = true;
        }

        protected void customerMngt_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string result = "default";
            DataAccessLayer.DeleteCRecord(customerMngt, e.RowIndex, out result);
            lblErrorMessage.Text = result;
            lblErrorMessage.Visible = true;
        }

        protected void BtnServSrch_Click(object sender, EventArgs e)
        {
            //search customers based on category and display
            string category = DdlSrchCategory.SelectedValue;
            string value = TxtServSrchBox.Text;
            DataAccessLayer.populateCustGridView(category, value, customerMngt);
        }

        protected void BtnShowAllServ_Click(object sender, EventArgs e)
        {
            //display all customers
            DataAccessLayer.populateCustGridView(customerMngt);
        }

        //public static void lbl_errorMsg(string msg)
        //{
        //    lblErrorMessage.Text = msg;
        //}

        //public static void lbl_successMsg(string msg)
        //{
        //    lblSuccessMessage.Text = msg;
        //}
    }
}