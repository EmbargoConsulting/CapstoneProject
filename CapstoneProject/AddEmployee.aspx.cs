using System;
using System.Collections.Generic;
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
}