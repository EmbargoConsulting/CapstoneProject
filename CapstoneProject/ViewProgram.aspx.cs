using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// 
///
/// 

public partial class ViewProgram : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ddlViewOptions.SelectedIndex = 0;
            MultiView1.ActiveViewIndex = 0;
        }
    }

    protected void btnClearAll_Click(object sender, EventArgs e)
    {

    }

    protected void ddlViewOptions_SelectedIndexChanged(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = Int32.Parse(ddlViewOptions.SelectedValue);
    }
}