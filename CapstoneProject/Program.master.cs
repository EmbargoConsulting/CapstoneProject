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
            btnOnlineProgram.CssClass = "btn btn-default";

        } else if (pageName.Contains("AddOnlineProgram.aspx"))
        {
            btnLiveProgram.CssClass = "btn btn-default";
        }
    }

    protected void btnLiveProgram_Click(object sender, EventArgs e)
    {

    }
}
