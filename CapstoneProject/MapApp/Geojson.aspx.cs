using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Geojson : System.Web.UI.Page
{
    public static string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    string mydocpath = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
    Animal animal = new Animal();

    protected void Page_Load(object sender, EventArgs e)
    {
       //String file = File.Exists("C:/Users/huntw/source/repos/CIS484WildlifeProject/Maptest/JS/Coordinates.js") ? "Yes" : createGeoJson();
    }

    protected void TestSubmit_ServerClick(object sender, EventArgs e)
    {
        using (SqlConnection openCon = new SqlConnection(connectionString))
        {
            foreach(ListItem item in ListBox.Items)
            {
                if(item.Selected)
                Animal.setCheckedOut(item.Text);
            }
            ListBox1.DataBind();
            ListBox.DataBind();

            string saveStaff = "INSERT into userlocation values (@Name,@Latitude,@Longitude)";
            string update = "update userLocation set Latitude = @Latitude, Longitude = @Longitude where Name = @Name";

            SqlCommand check_User_Name = new SqlCommand("select name from userLocation where name = @Name", openCon);
            check_User_Name.Parameters.AddWithValue("@Name", TextBox1.Text);

            openCon.Open();
            Object UserExist = check_User_Name.ExecuteScalar();
            openCon.Close();

            if (UserExist != null)
            {
                using(SqlCommand updateSaveStaff = new SqlCommand(update))
                {
                    updateSaveStaff.Connection = openCon;
                    updateSaveStaff.Parameters.Add("@Name", SqlDbType.VarChar, 50).Value = TextBox1.Text;
                    updateSaveStaff.Parameters.Add("@Latitude", SqlDbType.VarChar, 50).Value = TextBox2.Text;
                    updateSaveStaff.Parameters.Add("@Longitude", SqlDbType.VarChar, 50).Value = TextBox3.Text;

                    try
                    {
                        openCon.Open();
                        int recordsAffected = updateSaveStaff.ExecuteNonQuery();
                        //appendToGeoJson();
                    }
                    catch (SqlException)
                    {
                        // error here
                    }
                    finally
                    {
                        openCon.Close();
                    }
                }
            }
            else
            {
                using (SqlCommand querySaveStaff = new SqlCommand(saveStaff))
                {
                    querySaveStaff.Connection = openCon;
                    querySaveStaff.Parameters.Add("@Name", SqlDbType.VarChar, 50).Value = TextBox1.Text;
                    querySaveStaff.Parameters.Add("@Latitude", SqlDbType.VarChar, 50).Value = TextBox2.Text;
                    querySaveStaff.Parameters.Add("@Longitude", SqlDbType.VarChar, 50).Value = TextBox3.Text;

                    try
                    {
                        openCon.Open();
                        int recordsAffected = querySaveStaff.ExecuteNonQuery();
                        //appendToGeoJson();
                    }
                    catch (SqlException)
                    {
                        // error here
                    }
                    finally
                    {
                        openCon.Close();
                    }
                }
            }


        }
    } 

    //public string createGeoJson()
    //{
    //    using (StreamWriter outputFile = new StreamWriter("C:/Users/huntw/source/repos/CIS484WildlifeProject/Maptest/JS/Coordinates.js"))
    //    {
    //        {
    //            outputFile.WriteLine("geojson_callback({ \"type\": \"FeatureCollection\", \"features\": [");
    //            return "no";
    //        }
    //    }
    //}

    //public void appendToGeoJson()
    //{


    //    using (StreamWriter outputFile = File.AppendText("C:/Users/huntw/source/repos/CIS484WildlifeProject/Maptest/JS/Coordinates.js"))
    //    {
    //        {
    //            outputFile.WriteLine("{\"type\": \"Feature\", \"geometry\": { \"type\": \"Point\", \"coordinates\": [" + TextBox3.Text + "," + TextBox2.Text + "]}, \"properties\": {\"name\": \"" + TextBox1.Text + "\"}},");
    //        }
    //    }

    //}

    //public void closeFile()
    //{
    //    using (StreamWriter outputFile = File.AppendText("C:/Users/huntw/source/repos/CIS484WildlifeProject/Maptest/JS/Coordinates.js"))
    //    {
    //        {
    //            outputFile.WriteLine("]})");
    //        }
    //    }
    //}


    protected void TestFinish_ServerClick(object sender, EventArgs e)
    {
    }


    protected void Button4_Click(object sender, EventArgs e)
    {
        foreach (ListItem item in ListBox1.Items)
        {
            if (item.Selected)
                Animal.setCheckedIn(item.Text);
        }
        ListBox.DataBind();
        ListBox1.DataBind();


    }
}