using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

/// 
///
/// 

public partial class Animals : System.Web.UI.Page
{
    string cs = System.Configuration.ConfigurationManager.ConnectionStrings["Project"].ConnectionString; //uses config file as requested

    protected void Page_Load(object sender, EventArgs e)
    {
        output.Visible = false;
        if (!Page.IsPostBack)
        {
            details.Visible = false;
            tableau.Visible = true;

            foreach (Animal animal in Animal.getAnimalList())
            {
                ddlAnimals.Items.Add(new ListItem(animal.AnimalName, animal.AnimalID.ToString()));
                

            }

            //details.Visible = false;
            //MainGridView.DataSourceID = "";
            //showData();


        }

        //MainGridView.DataBind();
    }
    protected void clear()
    {
        txtAnimalName.Text = "";
        ddlAnimalType.SelectedIndex = 0;
    }

    protected void btnClearAll_Click(object sender, EventArgs e)
    {
        clear();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Animal animal = new Animal(txtAnimalName.Text, ddlAnimalType.SelectedItem.Text, true, DateTime.Now, "User");
        Animal.insertAnimal(animal);
        clear();

        ddlAnimals.Items.Clear();
        foreach (Animal a in Animal.getAnimalList())
        {
            ddlAnimals.Items.Add(new ListItem(a.AnimalName, a.AnimalID.ToString()));
        }

    }
    //protected void showData()
    //{


    //    DataTable dt = new DataTable();
    //    SqlConnection con = new SqlConnection(cs);
    //    con.Open();
    //    SqlDataAdapter adapt = new SqlDataAdapter("SELECT Animal.AnimalID, Animal.AnimalName, COUNT(Program.ProgramID) AS 'Programs', SUM(Program.ChildAttendance) + SUM(Program.AdultAttendance) as 'People' FROM Animal LEFT OUTER JOIN AnimalProgram ON Animal.AnimalID = AnimalProgram.AnimalID LEFT OUTER JOIN Program ON AnimalProgram.ProgramID = Program.ProgramID GROUP BY Animal.AnimalName, Animal.AnimalID", con);
    //    adapt.Fill(dt);
    //    if (dt.Rows.Count > 0)
    //    {
    //        MainGridView.DataSource = dt;
    //        MainGridView.DataBind();
    //    }
    //    con.Close();
    //}

    //protected void showSearchData()
    //{
    //    if(txtSearchAnimals.Text == "")
    //    {
    //        showData();
    //    } else
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
    //            MainGridView.DataSource = dt;
    //            MainGridView.DataBind();
    //        }
    //        else
    //        {
    //            //lbl_Results.Text = "No results found";
    //            showData();
    //        }
    //        con.Close();
    //    }
        
    //}

   
    protected void btnSearchAnimals_Click(object sender, EventArgs e)
    {
        //showSearchData();
    }

    protected void MainGridView_Sorting(object sender, GridViewSortEventArgs e)
    {
        //showData();
        //MainGridView.DataBind();
    }

    protected void ddlAnimals_SelectedIndexChanged(object sender, EventArgs e)
    { 
        output.Visible = false;
        tableau.Visible = false;
        string searchQuery = "SELECT DATEPART(MONTH, Program.DateTime) as num, DATENAME(month, Program.DateTime) AS 'Month', COUNT(CASE WHEN OnOffSite = 1 THEN 1 END) AS 'On-Site', COUNT(CASE WHEN LiveProgram.OnOffSite = 0 THEN 1 END) AS 'Off-Site', COUNT(*) AS 'Total Programs',  SUM(Program.ChildAttendance) AS 'Children', SUM(Program.AdultAttendance) AS 'Adults', SUM(Program.AdultAttendance) + SUM(Program.ChildAttendance) AS 'Total People', Animal.AnimalID FROM LiveProgram INNER JOIN Program ON LiveProgram.ProgramID = Program.ProgramID INNER JOIN AnimalProgram ON Program.ProgramID = AnimalProgram.ProgramID INNER JOIN Animal ON AnimalProgram.AnimalID = Animal.AnimalID WHERE Animal.AnimalID = @AnimalID GROUP BY DATENAME(month, Program.DateTime), Animal.AnimalID, DATEPART(month, Program.DateTime) ORDER BY Datepart(month, program.datetime) asc";
        SqlConnection con = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand(searchQuery, con);
        cmd.Parameters.AddWithValue("@AnimalID", ddlAnimals.SelectedValue);
        DataTable dt = new DataTable();
        con.Open();
        SqlDataAdapter adapt = new SqlDataAdapter(cmd);
        adapt.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            //lbl_Results.Text = "Returned " + dt.Rows.Count + " results";
            DetailsGridView.DataSource = dt;
            DetailsGridView.DataBind();
            results.Visible = false;
            details.Visible = true;
        }
        else
        {
            details.Visible = false;
            results.Visible = true;
            tableau.Visible = true;
            //lbl_Results.Text = "No results found";
            //showData();
        }
        con.Close();

        searchQuery = "SELECT DATEPART(YEAR, Program.DateTime) AS 'Year', COUNT(CASE WHEN OnOffSite = 1 THEN 1 END) AS 'On-Site', COUNT(CASE WHEN LiveProgram.OnOffSite = 0 THEN 1 END) AS 'Off-Site', COUNT(*) AS 'Total Programs',  SUM(Program.ChildAttendance) AS 'Children', SUM(Program.AdultAttendance) AS 'Adults', SUM(Program.AdultAttendance) + SUM(Program.ChildAttendance) AS 'Total People', Animal.AnimalID FROM LiveProgram INNER JOIN Program ON LiveProgram.ProgramID = Program.ProgramID INNER JOIN AnimalProgram ON Program.ProgramID = AnimalProgram.ProgramID INNER JOIN Animal ON AnimalProgram.AnimalID = Animal.AnimalID WHERE Animal.AnimalID = @AnimalID GROUP BY Animal.AnimalID, DATEPART(Year, Program.DateTime)";
        cmd.CommandText = searchQuery;
        con.Open();
        dt.Clear();
        adapt.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            //lbl_Results.Text = "Returned " + dt.Rows.Count + " results";
            yearGridView.DataSource = dt;
            yearGridView.DataBind();
        }

        txtSearch.Text = "";
        panelMonth.InnerText = "Monthly Break-Down for " + ddlAnimals.SelectedItem;
        panelYear.InnerText = "Yearly Break-Down for " + ddlAnimals.SelectedItem;

    }

    protected void showError()
    {
        output.InnerText = "No results found for " + txtSearch.Text;
        output.Visible = true;
        tableau.Visible = true;
    }

    protected void btnSearchAnimal_Click(object sender, EventArgs e)
    {
        if (txtSearch.Text != "")
        {
            output.Visible = false;
            tableau.Visible = false;
            int value = -1;
            string nameQuery = "SELECT AnimalID FROM Animal WHERE AnimalName = @name;";
            using (SqlConnection connection = new SqlConnection(cs))
            {
                SqlCommand command = new SqlCommand(nameQuery, connection);
                command.Parameters.AddWithValue("@name", txtSearch.Text);
                connection.Open();
                try
                {
                    value = (Int32)command.ExecuteScalar();
                } catch(NullReferenceException)
                {
                    value = -1;
                }
            }

            if (value >= 0)
            {
                string searchQuery = "SELECT DATEPART(MONTH, Program.DateTime) as num, DATENAME(month, Program.DateTime) AS 'Month', COUNT(CASE WHEN OnOffSite = 1 THEN 1 END) AS 'On-Site', COUNT(CASE WHEN LiveProgram.OnOffSite = 0 THEN 1 END) AS 'Off-Site', COUNT(*) AS 'Total Programs',  SUM(Program.ChildAttendance) AS 'Children', SUM(Program.AdultAttendance) AS 'Adults', SUM(Program.AdultAttendance) + SUM(Program.ChildAttendance) AS 'Total People', Animal.AnimalID FROM LiveProgram INNER JOIN Program ON LiveProgram.ProgramID = Program.ProgramID INNER JOIN AnimalProgram ON Program.ProgramID = AnimalProgram.ProgramID INNER JOIN Animal ON AnimalProgram.AnimalID = Animal.AnimalID WHERE Animal.AnimalID = @AnimalID GROUP BY DATENAME(month, Program.DateTime), Animal.AnimalID, DATEPART(month, Program.DateTime) ORDER BY Datepart(month, program.datetime) asc";
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(searchQuery, con);
                cmd.Parameters.AddWithValue("@AnimalID", value);
                DataTable dt = new DataTable();
                con.Open();
                SqlDataAdapter adapt = new SqlDataAdapter(cmd);
                adapt.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    //lbl_Results.Text = "Returned " + dt.Rows.Count + " results";
                    DetailsGridView.DataSource = dt;
                    DetailsGridView.DataBind();
                    results.Visible = false;
                    details.Visible = true;
                }
                else
                {
                    details.Visible = false;
                    results.InnerText = "No data for " + txtSearch.Text;
                    results.Visible = true;
                    //lbl_Results.Text = "No results found";
                    //showData();
                }
                con.Close();

                searchQuery = "SELECT DATEPART(YEAR, Program.DateTime) AS 'Year', COUNT(CASE WHEN OnOffSite = 1 THEN 1 END) AS 'On-Site', COUNT(CASE WHEN LiveProgram.OnOffSite = 0 THEN 1 END) AS 'Off-Site', COUNT(*) AS 'Total Programs',  SUM(Program.ChildAttendance) AS 'Children', SUM(Program.AdultAttendance) AS 'Adults', SUM(Program.AdultAttendance) + SUM(Program.ChildAttendance) AS 'Total People', Animal.AnimalID FROM LiveProgram INNER JOIN Program ON LiveProgram.ProgramID = Program.ProgramID INNER JOIN AnimalProgram ON Program.ProgramID = AnimalProgram.ProgramID INNER JOIN Animal ON AnimalProgram.AnimalID = Animal.AnimalID WHERE Animal.AnimalID = @AnimalID GROUP BY Animal.AnimalID, DATEPART(Year, Program.DateTime)";
                cmd.CommandText = searchQuery;
                con.Open();
                dt.Clear();
                adapt.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    //lbl_Results.Text = "Returned " + dt.Rows.Count + " results";
                    yearGridView.DataSource = dt;
                    yearGridView.DataBind();
                }
            } else
            {
                showError();
            }
            
        } else
        {


        }
        ddlAnimals.SelectedIndex = 0;
        panelMonth.InnerText = "Monthly Break-Down for " + txtSearch.Text;
        panelYear.InnerText = "Yearly Break-Down for " + txtSearch.Text;
        
    }
}
