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

    public DateTime LastUpdated { get; set; }
    public string LastUpdatedBy { get; set; }
    public DateTime DateTime { get; set; }
    public string ProgramTheme { get; set; }
    public int ChildCount { get; set; }
    public int AdultCount { get; set; }
    public int ProgramID { get; set; }
    public List<int> ProgramAnimals { get; set; }
    public List<int> ProgramEducators { get; set; }

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

    public Program(DateTime date, DateTime time, string programTheme, int childCount, int adultCount, List<int> programAnimals, List<int> programEducators)
    {
        //this.programID = programID;
        this.DateTime = DateTime.Parse(date.ToShortDateString() + " " + time.ToShortTimeString());
        this.ProgramTheme = programTheme;
        this.ChildCount = childCount;
        this.AdultCount = adultCount;
        this.ProgramAnimals = programAnimals;
        this.ProgramEducators = programEducators;
        this.LastUpdated = DateTime.Now;
        this.LastUpdatedBy = "User";
    }



    public static void populateList()
    {
       
    }

    public static void addToList(int value)
    {
        
    }

    public void addEducator(int id)
    {
        this.ProgramEducators.Add(id);   
    }

    public void addAnimal(int id)
    {
        this.ProgramAnimals.Add(id);
    }

}