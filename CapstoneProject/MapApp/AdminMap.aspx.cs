using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMap : System.Web.UI.Page
{
    private SqlConnection Conn;
    static string workingDir = System.AppDomain.CurrentDomain.BaseDirectory + "";
    static string foldPath = "MapApp\\JS\\Coordinates.js";
    string path = Path.Combine(workingDir, foldPath);

    protected void Page_Load(object sender, EventArgs e)
    {
        getData();
        Response.Redirect("~/MapApp/mapWithNames.aspx");
    }

    public void getData()
    {
        string sql = "SELECT * FROM userlocation";
        string name, latitude, longitude;
        using (var connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Project"].ConnectionString))
        using (var command = new SqlCommand(sql, connection))
        {
            if (File.Exists(path))
            {
                File.Delete(path);
            }

            connection.Open();
            using (var reader = command.ExecuteReader())
            {
                createGeoJson();
                //Check the reader has data:
                while (reader.Read())
                {
                    name = reader.GetString(reader.GetOrdinal("name"));
                    latitude = reader.GetString(reader.GetOrdinal("latitude"));
                    longitude = reader.GetString(reader.GetOrdinal("longitude"));
                    appendToGeoJson(name, latitude, longitude);                  

                }
                closeFile();
            }
        }

    }
    public string createGeoJson()
    {
        using (StreamWriter outputFile = new StreamWriter(path))
        {
            {
                outputFile.WriteLine("geojson_callback({ \"type\": \"FeatureCollection\", \"features\": [");
                return "no";
            }
        }
    }

    public void appendToGeoJson(string name, string latitude, string longitude)
    {


        using (StreamWriter outputFile = File.AppendText(path))
        {
            {
                outputFile.WriteLine("{\"type\": \"Feature\", \"geometry\": { \"type\": \"Point\", \"coordinates\": [" + latitude + "," + longitude + "]}, \"properties\": {\"name\": \"" + name + "\"}},");
            }
        }

    }

    public void closeFile()
    {
        using (StreamWriter outputFile = File.AppendText(path))
        {
            {
                outputFile.WriteLine("]})");
            }
        }
    }
}