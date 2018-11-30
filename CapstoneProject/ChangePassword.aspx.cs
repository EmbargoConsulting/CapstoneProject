﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// 
///
/// 

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Volunteer"] != null)
        {
            Response.Redirect("~/ViewProgram.aspx");
        }
    }

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        string hash = "";
        hash = PasswordHash.HashPassword(txtNewPassword1.Text);

        User user = new User(HttpUtility.HtmlEncode(txtEmail.Text), hash, 1);
        user.updateData();
    }

}