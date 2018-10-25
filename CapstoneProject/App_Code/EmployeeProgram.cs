using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EmployeeProgram
/// </summary>
/// 

public class EmployeeProgram : dbConnect
{
    private int employeeID;
    private int programID;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public EmployeeProgram()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public EmployeeProgram(int employeeID, int programID, DateTime lastUpdated, string lastUpdatedBy)
    {
        this.EmployeeID = employeeID;
        this.ProgramID = programID;
        this.LastUpdated = lastUpdated;
        this.LastUpdatedBy = lastUpdatedBy;
    }

    public int EmployeeID { get => employeeID; set => employeeID = value; }
    public int ProgramID { get => programID; set => programID = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
}