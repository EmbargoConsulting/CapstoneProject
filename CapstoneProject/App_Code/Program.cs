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
    private int programID;
    private int invoiceID;
    private string programName;
    private DateTime dateTime;
    private string programType;
    private int childCount;
    private int adultCount;
    private List<string> programAnimals;
    private List<string> programEducators;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public int ProgramID { get; set; }

    public Program()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    //public Program(string onOffSite, string status, string organization, string address, string reportMonth, DateTime date, DateTime time, string programType, int childrenCount, int adultCount, bool waitingPayment, string city, string county, List<string> animals, List<string> educators)
    //{
    //    this.dateTime = DateTime.Parse(date.ToShortDateString() + " " + time.ToShortTimeString());
    //    this.programType = programType;
    //    this.adultCount = adultCount;
    //    this.programAnimals = new List<string>();
    //}

    public Program(int invoiceID, string programName, DateTime date, DateTime time, string programType, int childCount, int adultCount, List<string> programAnimals, List<string> programEducators)
    {
        //this.programID = programID;
        this.invoiceID = invoiceID;
        this.programName = programName;
        this.dateTime = DateTime.Parse(date.ToShortDateString() + " " + time.ToShortTimeString());
        this.programType = programType;
        this.childCount = childCount;
        this.adultCount = adultCount;
        this.programAnimals = programAnimals;
        this.programEducators = programEducators;
        this.lastUpdated = DateTime.Now;
        this.lastUpdatedBy = "User";
    }

    public static int commitProgram(Program toCommit)
    {


        //    //Create string, command, and parameters
        //    //string sqlString = "INSERT INTO Program (OnOffSite, Status, OrgName, Address, ReportMonth, ProgramTheme, ChildrenCount, AdultCount, AwaitingPayment, City, County) VALUES (@site, @status, @orgname, @address, @month, @theme, @children, @adults, @payment, @city, @county); SELECT Scope_Identity()";
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.Parameters.AddWithValue("@InvoiceID", toCommit.onOffSite);
        //    cmd.Parameters.AddWithValue("@ProgramName", toCommit.status);
        //    cmd.Parameters.AddWithValue("@ProgramType", toCommit.organization);
        //    cmd.Parameters.AddWithValue("@DateTime", toCommit.address);
        //    cmd.Parameters.AddWithValue("@ChildAttendence", toCommit.reportMonth);
        //    //cmd.Parameters.AddWithValue("@date", toCommit.dateTime);
        //    cmd.Parameters.AddWithValue("@AdultAttendance", toCommit.programType);
        //    cmd.Parameters.AddWithValue("@children", toCommit.childrenCount);
        //    cmd.Parameters.AddWithValue("@adults", toCommit.adultCount);
        //    cmd.Parameters.AddWithValue("@payment", toCommit.waitingPayment);
        //    cmd.Parameters.AddWithValue("@city", toCommit.city);
        //    cmd.Parameters.AddWithValue("@county", toCommit.county);
        //    //cmd.Parameters.AddWithValue("@lastUpdated", toCommit.lastUpdatedBy);
        //    //cmd.Parameters.AddWithValue("@lastUpdatedBy", toCommit.lastUpdated);

        //    //This executes code from inherited dbConnect class
        //    int id = executeScalarQuery(cmd);
        //    return id;


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