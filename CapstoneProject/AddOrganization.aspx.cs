using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddOrganization : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Organization organization = new Organization(txtOrgName.Text, txtOrgCity.Text, txtOrgZip.Text, DropDownListState.SelectedValue, txtOrgZip.Text, txtOrganizationContact.Text, DateTime.Now, "User");
        Organization.insertOrganization(organization);
        clear();
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
}