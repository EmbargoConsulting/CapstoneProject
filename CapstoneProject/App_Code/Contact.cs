using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Contact
/// </summary>
public class Contact : dbConnect
{
    private string name;
    private string email;
    private string phone;
    private int orgID;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public Contact()
    {

        //
        // TODO: Add constructor logic here
        //
    }

    public Contact(string name, string email, string phone, int orgID)
    {
        this.Name = name;
        this.Email = email;
        this.Phone = phone;
        this.LastUpdated = DateTime.Now;
        this.LastUpdatedBy = "Admin";
        this.OrgID = orgID;
    }

    public static void insertContact(Contact toInsert)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insertContact";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Name", toInsert.Name);
        cmd.Parameters.AddWithValue("@Email", toInsert.Email);
        cmd.Parameters.AddWithValue("@Phone", toInsert.Phone);
        cmd.Parameters.AddWithValue("@OrgID", toInsert.OrgID + 1);
        cmd.Parameters.AddWithValue("@LastUpdatedBy", toInsert.LastUpdated);
        cmd.Parameters.AddWithValue("@LastUpdated", "Admin");
        cmd.Parameters.Add("@ContactID", SqlDbType.Int).Direction = ParameterDirection.Output;
        executeNonQuery(cmd);

    }

    public string Name { get => name; set => name = value; }
    public string Email { get => email; set => email = value; }
    public string Phone { get => phone; set => phone = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
    public int OrgID { get => orgID; set => orgID = value; }
}