using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for AnimalProgram
/// </summary>
public class AnimalProgram : dbConnect
{
    private int animalID;
    private int programID;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public AnimalProgram()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public AnimalProgram(int animalID, int programID)
    {
        AnimalID = animalID;
        ProgramID = programID;
        this.LastUpdated = DateTime.Now;
        this.LastUpdatedBy = "User";
    }

    public static void insertAnimalProgram(AnimalProgram toInsert)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insertAnimalProgram";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@AnimalID", toInsert.AnimalID);
        cmd.Parameters.AddWithValue("@ProgramID", toInsert.ProgramID);
        cmd.Parameters.AddWithValue("@LastUpdatedBy", toInsert.LastUpdatedBy);
        cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        executeNonQuery(cmd);

    }

    public int AnimalID { get => animalID; set => animalID = value; }
    public int ProgramID { get => programID; set => programID = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
}