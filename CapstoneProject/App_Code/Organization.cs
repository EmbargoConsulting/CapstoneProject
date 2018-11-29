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
    private string city;
    private string state;
    private string zip;
    private string organizationContact;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public Organization()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Organization(int id, string name, Boolean active)
    {
        OrganizationID = id;
        OrganizationName = name;
    }

    public Organization(string organizationName, string city, string state, string zip, string organizationContact, DateTime lastUpdated, string lastUpdatedBy)
    {
        this.OrganizationName = organizationName;
        this.City = city;
        this.State = state;
        this.Zip = zip;
        this.OrganizationContact = organizationContact;
        this.LastUpdated = lastUpdated;
        this.LastUpdatedBy = lastUpdatedBy;
    }

    public static List<Organization> getOrgList()
    {
        List<Organization> list = new List<Organization>();
        string query = "SELECT OrganizationID, OrganizationName, Active FROM Organization;";
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
                    Boolean active = reader.GetBoolean(2);
                    Organization newOrg = new Organization(id, orgName, active);
                    list.Add(newOrg);
                }
            }

        }
        return list;
    }

    public static void insertOrganization(Organization toInsert)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insertOrganization";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@OrganizationName", toInsert.OrganizationName);
        cmd.Parameters.AddWithValue("@State", toInsert.State);
        cmd.Parameters.AddWithValue("@City", toInsert.City);
        cmd.Parameters.AddWithValue("@Zip", toInsert.Zip);
        cmd.Parameters.AddWithValue("@OrganizationContact", toInsert.OrganizationContact);
        cmd.Parameters.AddWithValue("@LastUpdatedBy", toInsert.LastUpdatedBy);
        cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        cmd.Parameters.Add("@OrganizationID", SqlDbType.Int).Direction = ParameterDirection.Output;

        executeNonQuery(cmd);

    }

    public int OrganizationID { get => organizationID; set => organizationID = value; }
    public string OrganizationName { get => organizationName; set => organizationName = value; }
    public string OrganizationAddress { get => organizationAddress; set => organizationAddress = value; }
    public string OrganizationContact { get => organizationContact; set => organizationContact = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
    public string City { get => city; set => city = value; }
    public string State { get => state; set => state = value; }
    public string Zip { get => zip; set => zip = value; }
    public Boolean Activate { get; set; }

}