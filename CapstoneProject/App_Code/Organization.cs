using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

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

    public Organization(int id, string name)
    {
        OrganizationID = id;
        OrganizationName = name;
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

    public static List<Organization> getOrgList()
    {
        List<Organization> list = new List<Organization>();
        string query = "SELECT OrganizationID, OrganizationName FROM Organization;";
        using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Project"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    int id = reader.GetInt32(0);
                    string orgName = reader.GetString(1);
                    Organization newOrg = new Organization(id, orgName);
                    list.Add(newOrg);
                }
            }

        }
        return list;
    }

    public int OrganizationID { get => organizationID; set => organizationID = value; }
    public string OrganizationName { get => organizationName; set => organizationName = value; }
    public string OrganizationAddress { get => organizationAddress; set => organizationAddress = value; }
    public string OrganizationContact { get => organizationContact; set => organizationContact = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
}