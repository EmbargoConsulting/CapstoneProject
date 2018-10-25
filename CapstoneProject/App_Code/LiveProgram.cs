using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for LiveProgram
/// </summary>
public class LiveProgram : Program
{
    private string address;
    private Boolean onOffSite;
    private string city;
    private string county;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public LiveProgram()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public LiveProgram(int programID, string address, bool onOffSite, string city, string county, DateTime lastUpdated, string lastUpdatedBy)
    {
        this.ProgramID = programID;
        this.address = address;
        this.onOffSite = onOffSite;
        this.city = city;
        this.county = county;
        this.lastUpdated = lastUpdated;
        this.lastUpdatedBy = lastUpdatedBy;
    }

    public string Address { get => address; set => address = value; }
    public bool OnOffSite { get => onOffSite; set => onOffSite = value; }
    public string City { get => city; set => city = value; }
    public string County { get => county; set => county = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
}