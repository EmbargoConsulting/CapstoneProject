using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Program : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string pageName = this.Request.Url.Segments.Last();

        if (pageName.Contains("AddLiveProgram.aspx"))
        {
            //btnOnlineProgram.CssClass = "btn btn-default";
            //btnLiveProgram.CssClass = "btn btn-primary";
            btnViewProgram.CssClass = "btn btn-default";
            lblProgramHeader.Text = "<h2 class=\"page-header\">Add Live Program</h2>";

        } else if (pageName.Contains("AddOnlineProgram.aspx"))
        {
            //btnOnlineProgram.CssClass = "btn btn-primary";
            //btnLiveProgram.CssClass = "btn btn-default";
            btnViewProgram.CssClass = "btn btn-default";
            lblProgramHeader.Text = "<h2 class=\"page-header\">Add Online Program</h2>";
        } else if (pageName.Contains("ViewProgram.aspx"))
        {
            //btnLiveProgram.CssClass = "btn btn-default";
            //btnOnlineProgram.CssClass = "btn btn-default";
            btnViewProgram.CssClass = "btn btn-primary";
            lblProgramHeader.Text = "<h2 class=\"page-header\">Programs</h2>";
            btnGroupDrop1.CssClass = "btn btn-default";
        }
    }

    protected void btnLiveProgram_Click(object sender, EventArgs e)
    {

    }
}
