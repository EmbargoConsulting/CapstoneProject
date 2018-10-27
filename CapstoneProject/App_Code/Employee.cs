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

    public Employee(int id, string firstName, string lastName)
    {
        EmployeeID = id;
        FirstName = firstName;
        LastName = lastName;
    }

    public static List<Employee> getEmployeeList()
    {
        List<Employee> list = new List<Employee>();
        string query = "SELECT EmployeeID, FirstName, LastName FROM Employee;";
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
                    string firstName = reader.GetString(1);
                    string lastName = reader.GetString(2);
                    Employee newEmployee = new Employee(id, firstName, lastName);
                    list.Add(newEmployee);
                }
            }
        }
    
            return list;
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

    public string getFullName()
    {
        return FirstName + " " + LastName;
    }

    public int EmployeeID { get; set; }
    public string FirstName { get; set; }
    public string MiddleName { get; set; }
    public string LastName { get; set; }
    public string EmployeeType { get; set; }
    public DateTime LastUpdated { get; set; }
    public string LastUpdatedBy { get; set; }
}