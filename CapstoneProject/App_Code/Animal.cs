using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Animal
/// </summary>
public class Animal : dbConnect
{
    private int animalID;
    private string animalName;
    private string animalType;
    private string animalSpecies;
    private Boolean checkedInStatus;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public Animal()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Animal(string animalName, string animalType, string animalSpecies, Boolean checkedInStatus, DateTime lastUpdated, string lastUpdatedBy)
    {
        this.AnimalName = animalName;
        this.AnimalType = animalType;
        this.AnimalSpecies = animalSpecies;
        this.CheckedInStatus = checkedInStatus;
        this.LastUpdated = lastUpdated;
        this.LastUpdatedBy = lastUpdatedBy;
    }

    public static void insertAnimal(Animal toInsert)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insertAnimal";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@AnimalName", toInsert.AnimalName);
        cmd.Parameters.AddWithValue("@AnimalType", toInsert.AnimalType);
        cmd.Parameters.AddWithValue("@AnimalSpecies", toInsert.AnimalSpecies);
        cmd.Parameters.AddWithValue("@CheckedInStatus", toInsert.CheckedInStatus);
        cmd.Parameters.AddWithValue("@LastUpdatedBy", toInsert.LastUpdatedBy);
        cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);

        executeNonQuery(cmd);
    }

    public int AnimalID { get => animalID; set => animalID = value; }
    public string AnimalName { get => animalName; set => animalName = value; }
    public string AnimalType { get => animalType; set => animalType = value; }
    public string AnimalSpecies { get => animalSpecies; set => animalSpecies = value; }
    public bool CheckedInStatus { get => checkedInStatus; set => checkedInStatus = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
}