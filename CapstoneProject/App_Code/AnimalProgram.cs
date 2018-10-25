using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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

    public AnimalProgram(int animalID, int programID, DateTime lastUpdated, string lastUpdatedBy)
    {
        AnimalID = animalID;
        ProgramID = programID;
        this.LastUpdated = lastUpdated;
        this.LastUpdatedBy = lastUpdatedBy;
    }

    public int AnimalID { get => animalID; set => animalID = value; }
    public int ProgramID { get => programID; set => programID = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
}