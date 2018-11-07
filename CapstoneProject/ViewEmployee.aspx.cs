using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// 
///
/// 

public partial class ViewEmployee : System.Web.UI.Page
{

    //This is required to be able to render the gridview else we get an exception
    public override void VerifyRenderingInServerForm(Control control)
    {
        //base.VerifyRenderingInServerForm(control);
    }

    protected void btnClearAll_Click(object sender, EventArgs e)
    {
        
    }


    protected void exportToExcel_Click(object sender, EventArgs e)
    {
        Response.ClearContent();

        Response.AppendHeader("content-disposition", "attachment;filename=GridViewExport.xls");
        Response.ContentType = "application/excel";

        System.IO.StringWriter stringWrite = new System.IO.StringWriter();

        System.Web.UI.HtmlTextWriter htmlWrite =
        new HtmlTextWriter(stringWrite);

        GridView1.RenderControl(htmlWrite);

        Response.Write(stringWrite.ToString());

        Response.End();

      
    }
}