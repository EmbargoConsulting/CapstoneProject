﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// 
///
/// 

public partial class Default : System.Web.UI.Page
{

    protected void btnClearAll_Click(object sender, EventArgs e)
    {
        txtAnimalName.Text = "";
        txtAnimalDesc.Text = "";
        ddlAnimalType.SelectedIndex = 0;
    }
}