using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for Theme
/// </summary>
public class ProgramTheme : dbConnect
{
    public ProgramTheme(int ID, string theme)
    {
        ThemeName = theme;
        ThemeID = ID;
    }
    public ProgramTheme(string theme)
    {
        ThemeName = theme;
    }


    public static List<ProgramTheme> getThemes()
    {
        List<ProgramTheme> list = new List<ProgramTheme>();
        string query = "SELECT ThemeID, ThemeName FROM ProgramThemes;";
        using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Project"].ConnectionString))
        {
            SqlCommand cmdSelect = new SqlCommand(query, con);
            con.Open();
            SqlDataReader reader = cmdSelect.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    int id = reader.GetInt32(0);
                    string theme = reader.GetString(1);
                    ProgramTheme newTheme = new ProgramTheme(id, theme);
                    list.Add(newTheme);
                }
            }
        }

        return list;
    }

    public static void insertTheme(ProgramTheme toInsert)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insertTheme";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ThemeName", toInsert.ThemeName);
        cmd.Parameters.AddWithValue("@LastUpdatedBy", "User");
        cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);

        executeNonQuery(cmd);
        
    }


    public int ThemeID { get; set; }
    public string ThemeName { get; set; }
}