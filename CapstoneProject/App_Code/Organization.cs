using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Organization
/// </summary>
public class Organization : dbConnect
{
    private int orgID;
    private string orgName;
    private string orgPhoneNumber;
    private string orgAddress;
    private string orgContact;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public Organization()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Organization(string orgName, string orgPhoneNumber, string orgAddress, string orgContact)
    {
        this.OrgName = orgName;
        this.OrgPhoneNumber = orgPhoneNumber;
        this.OrgAddress = orgAddress;
        this.OrgContact = orgContact;
    }

    public int OrgID { get => orgID; set => orgID = value; }
    public string OrgName { get => orgName; set => orgName = value; }
    public string OrgPhoneNumber { get => orgPhoneNumber; set => orgPhoneNumber = value; }
    public string OrgAddress { get => orgAddress; set => orgAddress = value; }
    public string OrgContact { get => orgContact; set => orgContact = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
}