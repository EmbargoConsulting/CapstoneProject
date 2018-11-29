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

    public Employee(string firstName, string lastName, string employeeType, DateTime lastUpdated, string lastUpdatedBy)
    {
        this.FirstName = firstName;
        this.LastName = lastName;
        this.EmployeeType = employeeType;
        this.LastUpdated = lastUpdated;
        this.LastUpdatedBy = lastUpdatedBy;
    }

    public Employee(int id, string firstName, string lastName, Boolean active)
    {
        EmployeeID = id;
        FirstName = firstName;
        LastName = lastName;
        Active = active;
    }

    public static List<Employee> getEmployeeList()
    {
        List<Employee> list = new List<Employee>();
        string query = "SELECT EmployeeID, FirstName, LastName, active FROM Employee;";
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
                    Boolean active = reader.GetBoolean(3);
                    Employee newEmployee = new Employee(id, firstName, lastName, active);
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
        cmd.Parameters.AddWithValue("@LastName", toInsert.LastName);
        cmd.Parameters.AddWithValue("@MiddleName", "");
        cmd.Parameters.AddWithValue("@EmployeeType", toInsert.EmployeeType);
        cmd.Parameters.AddWithValue("@LastUpdatedBy", toInsert.LastUpdatedBy);
        cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        cmd.Parameters.Add("@EmployeeID", SqlDbType.Int).Direction = ParameterDirection.Output;
        executeNonQuery(cmd);

    }

    public string getFullName()
    {
        return FirstName + " " + LastName;
    }

    public int EmployeeID { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string EmployeeType { get; set; }
    public DateTime LastUpdated { get; set; }
    public string LastUpdatedBy { get; set; }
    public Boolean Active { get; set; }
}