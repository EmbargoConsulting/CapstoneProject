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

public partial class AddEmployee : System.Web.UI.Page
{

    protected void btnClearAll_Click(object sender, EventArgs e)
    {
        txtEmpFirst.Text = "";
        txtEmpMiddle.Text = "";
        txtEmpLast.Text = "";
        ddlEmpType.SelectedIndex = 0;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if(ddlEmpType.SelectedIndex > 0)
        {
            Employee employee = new Employee(txtEmpFirst.Text, txtEmpMiddle.Text, txtEmpLast.Text, ddlEmpType.Text, DateTime.Now, "User");
            Employee.insertEmployee(employee);

            txtEmpFirst.Text = "";
            txtEmpMiddle.Text = "";
            txtEmpLast.Text = "";
            ddlEmpType.SelectedIndex = 0;
            GridView1.DataBind();
        }

    }

    protected void btnExcelExport_Click(object sender, EventArgs e)
    {
        Response.ClearContent();

        Response.AppendHeader("content-disposition", "attachment;filename=Educators" + DateTime.Now + ".xls");
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