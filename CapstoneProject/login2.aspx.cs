using System;
using System.Collections.Generic;
using System.Web;
using System.Linq;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Diagnostics;

public partial class login2 : System.Web.UI.Page
{
    public static string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Project"].ConnectionString; //uses config file as requested
    SqlConnection cnn;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        User user = new User();
        if (PasswordHash.ValidatePassword(inputPassword.Value, user.getPasswordHash(inputEmail.Value)) == true)
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                SqlCommand cmdOne;
                bool type;
                //checking user type 

                cmdOne = new SqlCommand("select Admin from dbo.users where Username='" + inputEmail.Value + "'", con);
                type = (bool)cmdOne.ExecuteScalar();
                if (!type)
                {
                    Session["Volunteer"] = inputEmail.Value;
                    Response.Redirect("http://localhost:57713/ViewProgram.aspx");
                }
                con.Close();
            }


            catch (System.Data.SqlClient.SqlException sqlException)
            {
                Debug.WriteLine(sqlException.Message);

            }
        
            //Session["User"] = inputEmail.Value;
            //Response.Redirect("http://localhost:57713/dashboard.aspx");
            FormsAuthentication.RedirectFromLoginPage(inputEmail.Value, false);
        }
        //Session["User"] = inputEmail.Value;
        //Response.Redirect("http://localhost:57713/dashboard.aspx");
        FormsAuthentication.RedirectFromLoginPage(inputEmail.Value, false);





        }
    }
