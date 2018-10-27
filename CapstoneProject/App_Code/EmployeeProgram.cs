using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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

    public EmployeeProgram(int employeeID, int programID)
    {
        this.EmployeeID = employeeID;
        this.ProgramID = programID;
        this.LastUpdated = DateTime.Now;
        this.LastUpdatedBy = "User";
    }

    public static void insertEmployeeProgram(EmployeeProgram toInsert)
    {
        SqlCommand cmd = new SqlCommand();

        cmd.CommandText = "insertEmployeeProgram";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@EmployeeID", toInsert.EmployeeID);
        cmd.Parameters.AddWithValue("@ProgramID", toInsert.ProgramID);
        cmd.Parameters.AddWithValue("@LastUpdatedBy", toInsert.LastUpdatedBy);
        cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        executeNonQuery(cmd);

    }

    public int EmployeeID { get => employeeID; set => employeeID = value; }
    public int ProgramID { get => programID; set => programID = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
}