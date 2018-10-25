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

    public LiveProgram(int invoiceID, string programName, DateTime date, DateTime time, string programType, int childCount, int adultCount, List<string> programAnimals, List<string> programEducators, string address, int onOffSite, string city, string county) : base(invoiceID, programName, date, time, programType, childCount, adultCount, programAnimals, programEducators)
    {
        //this.ProgramID = programID;
        this.Address = address;
        this.OnOffSite = onOffSite;
        this.City = city;
        this.County = county;
    }

    public static void insertLiveProgram(LiveProgram toInsert)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insertProgram";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@InvoiceID", toInsert.InvoiceID);
        cmd.Parameters.AddWithValue("@ProgramName", toInsert.ProgramName);
        cmd.Parameters.AddWithValue("@ProgramType", toInsert.ProgramType);
        cmd.Parameters.AddWithValue("@DateTime", "1/1/2001");
        cmd.Parameters.AddWithValue("@ChildAttendance", toInsert.ChildCount);
        cmd.Parameters.AddWithValue("@AdultAttendance", toInsert.AdultCount);
        cmd.Parameters.AddWithValue("@LastUpdatedBy", toInsert.LastUpdatedBy);
        cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        cmd.Parameters.Add("@ProgramID", SqlDbType.Int).Direction = ParameterDirection.Output;


        executeNonQuery(cmd);

        int programID = (Int32)cmd.Parameters["@ProgramID"].Value;
        toInsert.ProgramID = programID;

        cmd.Parameters.Clear();

        cmd.CommandText = "insertLiveProgram";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ProgramID", toInsert.ProgramID);
        cmd.Parameters.AddWithValue("@Address", toInsert.Address);
        cmd.Parameters.AddWithValue("@City", toInsert.City);
        cmd.Parameters.AddWithValue("@County", toInsert.County);
        cmd.Parameters.AddWithValue("@OnOffSite", toInsert.OnOffSite);
        cmd.Parameters.AddWithValue("@LastUpdatedBy", toInsert.LastUpdatedBy);
        cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);

        executeNonQuery(cmd);

    }

    public string Address { get; set; }
    public int OnOffSite { get; set; }
    public string City { get; set; }
    public string County { get; set; }

}