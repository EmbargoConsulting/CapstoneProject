using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Program
/// </summary>
public class Program : dbConnect
{
    private static ArrayList programList = new ArrayList();
    private string onOffSite;
    private string status;
    private string organization;
    private string address;
    private string reportMonth;
    private DateTime dateTime;
    private string programType;
    private int childrenCount;
    private int adultCount;
    private bool waitingPayment;
    private string city;
    private string county;
    private List<string> programAnimals;
    private List<string> programEducators;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public string ProgramID { get; set; }

    public Program()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Program(string onOffSite, string status, string organization, string address, string reportMonth, DateTime date, DateTime time, string programType, int childrenCount, int adultCount, bool waitingPayment, string city, string county, List<string> animals, List<string> educators)
    {
        this.onOffSite = onOffSite;
        this.status = status;
        this.organization = organization;
        this.address = address;
        this.dateTime = DateTime.Parse(date.ToShortDateString() + " " + time.ToShortTimeString());
        this.reportMonth = reportMonth;
        this.programType = programType;
        this.childrenCount = childrenCount;
        this.adultCount = adultCount;
        this.waitingPayment = waitingPayment;
        this.city = city;
        this.county = county;
        this.programAnimals = new List<string>();
    }

    public static int commitProgram(Program toCommit)
    {
        //Create string, command, and parameters
        string sqlString = "INSERT INTO Program (OnOffSite, Status, OrgName, Address, ReportMonth, ProgramTheme, ChildrenCount, AdultCount, AwaitingPayment, City, County) VALUES (@site, @status, @orgname, @address, @month, @theme, @children, @adults, @payment, @city, @county); SELECT Scope_Identity()";
        SqlCommand cmd = new SqlCommand(sqlString);
        cmd.Parameters.AddWithValue("@site", toCommit.onOffSite);
        cmd.Parameters.AddWithValue("@status", toCommit.status);
        cmd.Parameters.AddWithValue("@orgname", toCommit.organization);
        cmd.Parameters.AddWithValue("@address", toCommit.address);
        cmd.Parameters.AddWithValue("@month", toCommit.reportMonth);
        //cmd.Parameters.AddWithValue("@date", toCommit.dateTime);
        cmd.Parameters.AddWithValue("@theme", toCommit.programType);
        cmd.Parameters.AddWithValue("@children", toCommit.childrenCount);
        cmd.Parameters.AddWithValue("@adults", toCommit.adultCount);
        cmd.Parameters.AddWithValue("@payment", toCommit.waitingPayment);
        cmd.Parameters.AddWithValue("@city", toCommit.city);
        cmd.Parameters.AddWithValue("@county", toCommit.county);
        //cmd.Parameters.AddWithValue("@lastUpdated", toCommit.lastUpdatedBy);
        //cmd.Parameters.AddWithValue("@lastUpdatedBy", toCommit.lastUpdated);

        //This executes code from inherited dbConnect class
        int id = executeScalarQuery(cmd);
        return id;


    }


    public static void populateList()
    {
       
    }

    public static void addToList(int value)
    {
        
    }

    public void addEducator(int id)
    {
        this.programEducators.Add(id.ToString());   
    }

    public void addAnimal(int id)
    {
        this.programAnimals.Add(id.ToString());
    }

}