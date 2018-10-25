using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for LiveProgram
/// </summary>
public class LiveProgram : Program
{
    public LiveProgram()
    {
        
        //i
        // TODO: Add constructor logic here
        //
    }

    public LiveProgram(int invoiceID, string programName, DateTime date, DateTime time, string programType, int childCount, int adultCount, List<string> programAnimals, List<string> programEducators, string address, int onOffSite, string city, string county, DateTime lastUpdated, string lastUpdatedBy) : base(invoiceID, programName, date, time, programType, childCount, adultCount, programAnimals, programEducators)
    {
        //this.ProgramID = programID;
        this.Address = address;
        this.OnOffSite = onOffSite;
        this.City = city;
        this.County = county;
    }

    public static void insertLiveProgram(LiveProgram toInsert)
    {
        SqlCommand skillInsert = new SqlCommand();
        skillInsert.CommandText = "insertLiveProgram";
        skillInsert.CommandType = CommandType.StoredProcedure;
        skillInsert.Parameters.AddWithValue("@ProgramID", toInsert.InvoiceID);
        skillInsert.Parameters.AddWithValue("@Address", toInsert.ProgramName);
        skillInsert.Parameters.AddWithValue("@City", toInsert.ProgramType);
        skillInsert.Parameters.AddWithValue("@County", toInsert.DateTime);
        skillInsert.Parameters.AddWithValue("@OnOffSite", toInsert.ChildCount);
        skillInsert.Parameters.AddWithValue("@LastUpdatedBy", toInsert.AdultCount);
        skillInsert.Parameters.AddWithValue("@LastUpdated", toInsert.LastUpdatedBy);

        executeNonQuery(skillInsert);

    }

    public string Address { get; set; }
    public int OnOffSite { get; set; }
    public string City { get; set; }
    public string County { get; set; }
    public DateTime LastUpdated { get; set; }
    public string LastUpdatedBy { get; set; }
}