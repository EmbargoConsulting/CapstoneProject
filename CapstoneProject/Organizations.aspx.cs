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

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Organization organization = new Organization(txtOrgName.Text, txtOrgCity.Text, DropDownListState.SelectedValue, txtOrgZip.Text, txtOrganizationContact.Text, DateTime.Now, "User");
        Organization.insertOrganization(organization);
        clear();
        GridView1.DataBind();
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


    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["OrganizationID"]);
        OrganizationDataSource.UpdateCommand = "UPDATE Organization SET OrganizationName = @name, OrganizationContact = @contact WHERE OrganizationID = @OrganizationID;";
        OrganizationDataSource.UpdateParameters.Add("name", GridView1.Rows[e.RowIndex].FindControl("OrganizationName").ToString());
        OrganizationDataSource.UpdateParameters.Add("contact", GridView1.DataKeys[e.RowIndex].Values["OrganizationContact"].ToString());

        OrganizationDataSource.Update();
   
        GridView1.DataBind();
    }
}
