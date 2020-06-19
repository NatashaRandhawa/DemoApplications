using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawnHedgeMaintenance.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
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
                DataAccessLayer.populateGridView(servicesMngt);
            }
        }

        protected void servicesMngt_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
                DataAccessLayer.AddNewRecord(servicesMngt);

        }

        protected void servicesMngt_RowEditing(object sender, GridViewEditEventArgs e)
        {
            servicesMngt.EditIndex = e.NewEditIndex;
            DataAccessLayer.populateGridView(servicesMngt);
        }

        protected void servicesMngt_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            servicesMngt.EditIndex = -1;
            DataAccessLayer.populateGridView(servicesMngt);
        }

        protected void servicesMngt_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DataAccessLayer.UpdateRecord(servicesMngt, e.RowIndex);
        }

        protected void servicesMngt_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataAccessLayer.DeleteRecord(servicesMngt, e.RowIndex);
        }

        protected void BtnServSrch_Click(object sender, EventArgs e)
        {
            DataAccessLayer.populateGridView(servicesMngt, TxtServSrchBox.Text);
        }

        protected void BtnShowAllServ_Click(object sender, EventArgs e)
        {
            DataAccessLayer.populateGridView(servicesMngt);
        }
    }
}