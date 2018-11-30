using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Animal
/// </summary>
public class Animal : dbConnect
{
    public Animal()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Animal(string animalName, string animalType, Boolean checkedInStatus, DateTime lastUpdated, string lastUpdatedBy)
    {
        this.AnimalName = animalName;
        this.AnimalType = animalType;
        this.CheckedInStatus = checkedInStatus;
        this.LastUpdated = lastUpdated;
        this.LastUpdatedBy = lastUpdatedBy;
    }

    public Animal(int id, string name, Boolean active)
    {
        AnimalID = id;
        AnimalName = name;
        Active = active;
    }

    public static void insertAnimal(Animal toInsert)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insertAnimal";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@AnimalName", toInsert.AnimalName);
        cmd.Parameters.AddWithValue("@AnimalType", toInsert.AnimalType);
        cmd.Parameters.AddWithValue("@CheckedInStatus", toInsert.CheckedInStatus);
        cmd.Parameters.AddWithValue("@LastUpdatedBy", toInsert.LastUpdatedBy);
        cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);

        executeNonQuery(cmd);
    }

    public static List<Animal> getAnimalList() 
    {
        List<Animal> list = new List<Animal>();
        string query = "SELECT AnimalID, AnimalName, active FROM Animal;";
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
                    string name = reader.GetString(1);
                    Boolean active = reader.GetBoolean(2);
                    Animal newAnimal = new Animal(id, name, active);
                    list.Add(newAnimal);
                }
            }
        }

        return list;
    }

    public static void setCheckedOut(String AnimalName)
    {
        try
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmdOne;
            bool checkedIn;
            //checking user type 

            cmdOne = new SqlCommand("update Animal set CheckedOut = 1 where AnimalName='" + AnimalName + "'", con);
            cmdOne.ExecuteNonQuery();

            con.Close();
        }


        catch (System.Data.SqlClient.SqlException sqlException)
        {
            Debug.WriteLine(sqlException.Message);

        }

    }

    public static void setCheckedIn(String AnimalName)
    {
        try
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmdOne;
            bool checkedIn;
            //checking user type 

            cmdOne = new SqlCommand("update Animal set CheckedOut = 0 where AnimalName='" + AnimalName + "'", con);
            cmdOne.ExecuteNonQuery();

            con.Close();
        }


        catch (System.Data.SqlClient.SqlException sqlException)
        {
            Debug.WriteLine(sqlException.Message);

        }

    }


    public int AnimalID { get; set; }
    public string AnimalName { get; set; }
    public string AnimalType { get; set; }
    public string AnimalSpecies { get; set; }
    public bool CheckedInStatus { get; set; }
    public DateTime LastUpdated { get; set; }
    public string LastUpdatedBy { get; set; }
    public bool Active { get; set; }
}