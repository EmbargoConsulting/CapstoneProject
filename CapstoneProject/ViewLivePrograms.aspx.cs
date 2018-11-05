using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void showData()
    {
        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["Project"].ConnectionString; //uses config file as requested


        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(cs);
        con.Open();
        SqlDataAdapter adapt = new SqlDataAdapter("SELECT Animal.AnimalID, Animal.AnimalName, COUNT(Program.ProgramID) AS 'Programs', SUM(Program.ChildAttendance) + SUM(Program.AdultAttendance) as 'People' FROM Animal LEFT OUTER JOIN AnimalProgram ON Animal.AnimalID = AnimalProgram.AnimalID LEFT OUTER JOIN Program ON AnimalProgram.ProgramID = Program.ProgramID GROUP BY Animal.AnimalName, Animal.AnimalID", con);
        adapt.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            PrimaryGridView.DataSource = dt;
            PrimaryGridView.DataBind();
        }
        con.Close();
    }

    //protected void showSearchData()
    //{
    //    if (txtSearchAnimals.Text == "")
    //    {
    //        showData();
    //    }
    //    else
    //    {
    //        string searchQuery = "SELECT Animal.AnimalID, Animal.AnimalName, COUNT(Program.ProgramID) AS 'Programs', SUM(Program.ChildAttendance) + SUM(Program.AdultAttendance) as 'People' FROM Animal LEFT OUTER JOIN AnimalProgram ON Animal.AnimalID = AnimalProgram.AnimalID LEFT OUTER JOIN Program ON AnimalProgram.ProgramID = Program.ProgramID WHERE Animal.AnimalName like '%" + txtSearchAnimals.Text + "%' GROUP BY Animal.AnimalName, Animal.AnimalID";
    //        SqlConnection con = new SqlConnection(cs);
    //        SqlCommand cmd = new SqlCommand(searchQuery, con);
    //        cmd.Parameters.AddWithValue("@search", txtSearchAnimals.Text);
    //        DataTable dt = new DataTable();
    //        con.Open();
    //        SqlDataAdapter adapt = new SqlDataAdapter(searchQuery, con);
    //        adapt.Fill(dt);
    //        if (dt.Rows.Count > 0)
    //        {
    //            //lbl_Results.Text = "Returned " + dt.Rows.Count + " results";
    //            PrimaryGridView.DataSource = dt;
    //            PrimaryGridView.DataBind();
    //        }
    //        else
    //        {
    //            //lbl_Results.Text = "No results found";
    //            showData();
    //        }
    //        con.Close();
    //    }

    //}

}