using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Organization
/// </summary>
public class Organization : dbConnect
{
    private int organizationID;
    private string organizationName;
    private string organizationAddress;
    private string organizationContact;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public Organization()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Organization(int organizationID, string organizationName, string organizationAddress, string organizationContact, DateTime lastUpdated, string lastUpdatedBy)
    {
        this.OrganizationID = organizationID;
        this.OrganizationName = organizationName;
        this.OrganizationAddress = organizationAddress;
        this.OrganizationContact = organizationContact;
        this.LastUpdated = lastUpdated;
        this.LastUpdatedBy = lastUpdatedBy;
    }

    public int OrganizationID { get => organizationID; set => organizationID = value; }
    public string OrganizationName { get => organizationName; set => organizationName = value; }
    public string OrganizationAddress { get => organizationAddress; set => organizationAddress = value; }
    public string OrganizationContact { get => organizationContact; set => organizationContact = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
}