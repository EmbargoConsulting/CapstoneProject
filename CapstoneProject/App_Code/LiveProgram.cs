using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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

    public string Address { get; set; }
    public int OnOffSite { get; set; }
    public string City { get; set; }
    public string County { get; set; }
    public DateTime LastUpdated { get; set; }
    public string LastUpdatedBy { get; set; }
}