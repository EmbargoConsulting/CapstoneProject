using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for Program
/// </summary>
public class Program : dbConnect
{
    private static ArrayList programList = new ArrayList();
    private List<string> programAnimals;
    private List<string> programEducators;

    public DateTime LastUpdated { get; set; }
    public string LastUpdatedBy { get; set; }
    public int InvoiceID { get; set; }
    public string ProgramName { get; set; }
    public DateTime DateTime { get; set; }
    public string ProgramType { get; set; }
    public int ChildCount { get; set; }
    public int AdultCount { get; set; }
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
        this.InvoiceID = invoiceID;
        this.ProgramName = programName;
        this.DateTime = DateTime.Parse(date.ToShortDateString() + " " + time.ToShortTimeString());
        this.ProgramType = programType;
        this.ChildCount = childCount;
        this.AdultCount = adultCount;
        this.programAnimals = programAnimals;
        this.programEducators = programEducators;
        this.LastUpdated = DateTime.Now;
        this.LastUpdatedBy = "User";
    }

    public static Program insertProgram(Program toInsert)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insertProgram";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@InvoiceID", toInsert.InvoiceID);
        cmd.Parameters.AddWithValue("@ProgramName", toInsert.ProgramName);
        cmd.Parameters.AddWithValue("@ProgramType", toInsert.ProgramType);
        cmd.Parameters.AddWithValue("@DateTime", toInsert.DateTime);
        cmd.Parameters.AddWithValue("@ChildAttendance", toInsert.ChildCount);
        cmd.Parameters.AddWithValue("@AdultAttendance", toInsert.AdultCount);
        cmd.Parameters.AddWithValue("@LastUpdatedBy", toInsert.LastUpdatedBy);
        cmd.Parameters.AddWithValue("@LastUpdated", toInsert.LastUpdated);

        executeNonQuery(cmd);

        int programID = (Int32)cmd.Parameters["@ProgramID"].Value;
        toInsert.ProgramID = programID;
        return toInsert;
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