using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Employee
/// </summary>
public class Employee : dbConnect
{
    private int employeeID;
    private string firstName;
    private string middleName;
    private string lastName;
    private string employeeType;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public Employee()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Employee(string firstName, string middleName, string lastName, string employeeType, DateTime lastUpdated, string lastUpdatedBy)
    {
        this.FirstName = firstName;
        this.MiddleName = middleName;
        this.LastName = lastName;
        this.EmployeeType = employeeType;
        this.LastUpdated = lastUpdated;
        this.LastUpdatedBy = lastUpdatedBy;
    }

    public static void insertEmployee(Employee toInsert)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insertEmployee";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@FirstName", toInsert.FirstName);
        cmd.Parameters.AddWithValue("@MiddleName", toInsert.MiddleName);
        cmd.Parameters.AddWithValue("@LastName", toInsert.LastName);
        cmd.Parameters.AddWithValue("@EmployeeType", toInsert.EmployeeType);
        cmd.Parameters.AddWithValue("@LastUpdatedBy", toInsert.LastUpdatedBy);
        cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        cmd.Parameters.Add("@EmployeeID", SqlDbType.Int).Direction = ParameterDirection.Output;

        executeNonQuery(cmd);

        //The below was testing inserting employee program.
        //Get ID of inserted employee to reference as parent
        //int employeeID = (Int32)cmd.Parameters["@EmployeeID"].Value;
        //toInsert.EmployeeID = employeeID;

        //cmd.Parameters.Clear();

        //cmd.CommandText = "insertEmployeeProgram";
        //cmd.CommandType = CommandType.StoredProcedure;
        //cmd.Parameters.AddWithValue("@EmployeeID", toInsert.EmployeeID);
        //cmd.Parameters.AddWithValue("@ProgramID", 1);
        //cmd.Parameters.AddWithValue("@LastUpdatedBy", toInsert.LastUpdatedBy);
        //cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);

        //executeNonQuery(cmd);

    }

    public int EmployeeID { get => employeeID; set => employeeID = value; }
    public string FirstName { get => firstName; set => firstName = value; }
    public string MiddleName { get => middleName; set => middleName = value; }
    public string LastName { get => lastName; set => lastName = value; }
    public string EmployeeType { get => employeeType; set => employeeType = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
}