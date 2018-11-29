using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// 
///
/// 

public partial class Educators : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Volunteer"] != null)
        {
            Response.Redirect("http://localhost:57713/ViewProgram.aspx");
        }
    }

    protected void btnClearAll_Click(object sender, EventArgs e)
    {
        txtEmpFirst.Text = "";
        txtEmpLast.Text = "";
        ddlEmpType.SelectedIndex = 0;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if(ddlEmpType.SelectedIndex > 0)
        {
            Employee employee = new Employee(HttpUtility.HtmlEncode(txtEmpFirst.Text), HttpUtility.HtmlEncode(txtEmpLast.Text), HttpUtility.HtmlEncode(ddlEmpType.Text), DateTime.Now, "User");
            Employee.insertEmployee(employee);

            txtEmpFirst.Text = "";
            txtEmpLast.Text = "";
            ddlEmpType.SelectedIndex = 0;
            GridView1.DataBind();
        }

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //OrganizationDataSource.DeleteCommand = "DELETE FROM Organization WHERE OrganizationID = @OrganizationID";
        //OrganizationDataSource.DeleteParameters.Add("OrganizationID", GridView1.DataKeys[e.RowIndex].Values["OrganizationID"].ToString());
        SqlDataSource_ViewEmployee.Delete();
        GridView1.DataBind();
    }


    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["EmployeeID"]);
        SqlDataSource_ViewEmployee.UpdateCommand = "UPDATE Employee set firstname = @firstname, EmployeeType = @EmployeeType, lastname = @lastname, active = @active WHERE EmployeeID = @EmployeeID;";
        SqlDataSource_ViewEmployee.UpdateParameters.Add("firstname", GridView1.Rows[e.RowIndex].FindControl("FirstName").ToString());
        SqlDataSource_ViewEmployee.UpdateParameters.Add("EmployeeType", GridView1.DataKeys[e.RowIndex].Values["EmployeeType"].ToString());
        SqlDataSource_ViewEmployee.UpdateParameters.Add("lastname", GridView1.DataKeys[e.RowIndex].Values["LastName"].ToString());

        SqlDataSource_ViewEmployee.Update();

        GridView1.DataBind();
    }

    protected void btnExcelExport_Click(object sender, EventArgs e)
    {
        Response.ClearContent();

        Response.AppendHeader("content-disposition", "attachment;filename=Educators" + DateTime.Now.ToShortDateString() + ".xls");
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

}