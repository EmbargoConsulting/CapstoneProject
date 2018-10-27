﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

    }

    protected void btnCreateUser_Click(object sender, EventArgs e)
    {
        string hash = "";
        hash = PasswordHash.HashPassword(txt_password.Text);

        User user = new User(txt_name.Text, hash);
        user.insertData();
    }

    protected void btnClearAll_Click(object sender, EventArgs e)
    {
        txt_name.Text = "";
        txt_password.Text = "";
        txt_password2.Text = "";
    }
}