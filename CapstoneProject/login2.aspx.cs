using System;
using System.Collections.Generic;
using System.Web;
using System.Linq;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        User user = new User();
        if (PasswordHash.ValidatePassword(inputPassword.Value, user.getPasswordHash(inputEmail.Value)) == true)
        {
            //Session["User"] = inputEmail.Value;
            //Response.Redirect("http://localhost:57713/dashboard.aspx");
            FormsAuthentication.RedirectFromLoginPage(inputEmail.Value, false);





        }
    }
}