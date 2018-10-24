using System;
using System.Collections.Generic;
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
    private int typeOfEmployee;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public Employee()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Employee(string firstName, string middleName, string lastName, int typeOfEmployee)
    {
        this.FirstName = firstName;
        this.MiddleName = middleName;
        this.LastName = lastName;
        this.TypeOfEmployee = typeOfEmployee;
    }

    public int EmployeeID { get => employeeID; set => employeeID = value; }
    public string FirstName { get => firstName; set => firstName = value; }
    public string MiddleName { get => middleName; set => middleName = value; }
    public string LastName { get => lastName; set => lastName = value; }
    public int TypeOfEmployee { get => typeOfEmployee; set => typeOfEmployee = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
}