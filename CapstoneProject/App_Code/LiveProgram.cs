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

    public LiveProgram(int orgID, string status, string invoiceID, DateTime date, DateTime time, string programTheme, int childCount, int adultCount, List<int> programAnimals, List<int> programEducators, string address, int onOffSite, string city, string county) : base(date, time, programTheme, childCount, adultCount, programAnimals, programEducators)
    {
        //this.ProgramID = programID;
        Address = address;
        OnOffSite = onOffSite;
        City = city;
        County = county;
        InvoiceID = invoiceID;
        Status = status;
        OrganizationID = orgID;
    }

    public static void insertLiveProgram(LiveProgram toInsert)
    {
        SqlCommand cmd = new SqlCommand();

        //Insert Supertype
        cmd.CommandText = "insertProgram";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ProgramTheme", toInsert.ProgramTheme);
        cmd.Parameters.AddWithValue("@DateTime", toInsert.DateTime.ToString("yyyy-MM-dd hh:mm:ss"));
        cmd.Parameters.AddWithValue("@ChildAttendance", toInsert.ChildCount);
        cmd.Parameters.AddWithValue("@AdultAttendance", toInsert.AdultCount);
        cmd.Parameters.AddWithValue("@LastUpdatedBy", toInsert.LastUpdatedBy);
        cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        cmd.Parameters.Add("@ProgramID", SqlDbType.Int).Direction = ParameterDirection.Output;
        executeNonQuery(cmd);

        int programID = (Int32)cmd.Parameters["@ProgramID"].Value;
        toInsert.ProgramID = programID;

        cmd.Parameters.Clear();

        //Insert Subtype
        cmd.CommandText = "insertLiveProgram";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ProgramID", toInsert.ProgramID);
        cmd.Parameters.AddWithValue("@Status", toInsert.Status);
        cmd.Parameters.AddWithValue("@Address", toInsert.Address);
        cmd.Parameters.AddWithValue("@City", toInsert.City);
        cmd.Parameters.AddWithValue("@County", toInsert.County);
        cmd.Parameters.AddWithValue("@OnOffSite", toInsert.OnOffSite);
        cmd.Parameters.AddWithValue("@LastUpdatedBy", toInsert.LastUpdatedBy);
        cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        executeNonQuery(cmd);

        //Insert Employees
        foreach(int id in toInsert.ProgramEducators)
        {
            EmployeeProgram newEmployeeProgram = new EmployeeProgram(id, programID);
            EmployeeProgram.insertEmployeeProgram(newEmployeeProgram);
        }

        //Insert Animals
        foreach(int id in toInsert.ProgramAnimals)
        {
            AnimalProgram newAnimalProgram = new AnimalProgram(id, programID);
            AnimalProgram.insertAnimalProgram(newAnimalProgram);
        }

        //Insert Invoice
        cmd.CommandText = "insertInvoice";
        cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@InvoiceID", toInsert.InvoiceID);
        cmd.Parameters.AddWithValue("@ProgramID", toInsert.ProgramID);
        cmd.Parameters.AddWithValue("@OrganizationID", toInsert.OrganizationID);
        cmd.Parameters.AddWithValue("@InvoiceAmount", 0);
        cmd.Parameters.AddWithValue("@CancelledYN", 0);
        cmd.Parameters.AddWithValue("@PaymentTotal",0);
        cmd.Parameters.AddWithValue("@LastUpdatedBy", "User");
        cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now.ToShortDateString());
        executeNonQuery(cmd);


    }

    public string Address { get; set; }
    public int OnOffSite { get; set; }
    public string City { get; set; }
    public string County { get; set; }
    public string InvoiceID { get; set; }
    public string Status { get; set; }
    public int OrganizationID { get; set; }

}