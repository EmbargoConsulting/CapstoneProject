using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Organizations : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            if (Session["Volunteer"] != null)
            {
                Response.Redirect("http://localhost:57713/ViewProgram.aspx");
            }
       
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Organization organization = new Organization(HttpUtility.HtmlEncode(txtOrgName.Text), HttpUtility.HtmlEncode(txtOrgCity.Text), DropDownListState.SelectedValue, HttpUtility.HtmlEncode(txtOrgZip.Text), HttpUtility.HtmlEncode(txtOrganizationContact.Text), DateTime.Now, "User");
        Organization.insertOrganization(organization);
        clear();
        GridView1.DataBind();
    }

    protected void btnContactSubmit_Click(object sender, EventArgs e)
    {
        Contact contact = new Contact(txtContactName.Text, contactPhone.Text, contactEmail.Text, orgDDL.SelectedIndex);
        Contact.insertContact(contact);
        //clear();
        //GridView1.DataBind();
    }


    protected void btnClearAll_Click(object sender, EventArgs e)
    {
        clear();
    }

    public void clear()
    {
        txtOrganizationContact.Text = "";
        txtOrgCity.Text = "";
        txtOrgName.Text = "";
        txtOrgZip.Text = "";
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //OrganizationDataSource.DeleteCommand = "DELETE FROM Organization WHERE OrganizationID = @OrganizationID";
        //OrganizationDataSource.DeleteParameters.Add("OrganizationID", GridView1.DataKeys[e.RowIndex].Values["OrganizationID"].ToString());
        OrganizationDataSource.Delete();
        GridView1.DataBind();
    }


    //protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    //{
    //    GridViewRow row = GridView1.Rows[e.RowIndex];
    //    int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["OrganizationID"]);
    //    OrganizationDataSource.UpdateCommand = "UPDATE Organization SET OrganizationName = @name, OrganizationContact = @contact WHERE OrganizationID = @OrganizationID;";
    //    OrganizationDataSource.UpdateParameters.Add("name", GridView1.Rows[e.RowIndex].FindControl("OrganizationName").ToString());
    //    OrganizationDataSource.UpdateParameters.Add("contact", GridView1.DataKeys[e.RowIndex].Values["OrganizationContact"].ToString());

    //    OrganizationDataSource.Update();
   
    //    GridView1.DataBind();
    //}

    protected void btnExcelExport_Click(object sender, EventArgs e)
    {
        Response.ClearContent();

        Response.AppendHeader("content-disposition", "attachment;filename=Organizations" + DateTime.Now.ToShortDateString() + ".xls");
        Response.ContentType = "application/excel";



        System.IO.StringWriter stringWrite = new System.IO.StringWriter();

        System.Web.UI.HtmlTextWriter htmlWrite =
        new HtmlTextWriter(stringWrite);

        GridView1.RenderControl(htmlWrite);

        Response.Write(stringWrite.ToString());

        Response.End();
    }

    //Required
    public override void VerifyRenderingInServerForm(Control control)
    {
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        GridView2.Visible = true;
    }
}
