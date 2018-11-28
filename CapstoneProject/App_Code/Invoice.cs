using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Invoice
/// </summary>
public class Invoice : dbConnect
{
    private int invoiceID;
    private int programID;
    private int organizationID;
    private string invoiceAmount;
    private Boolean cancelledYN;
    private string PaymentTotal;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public Invoice()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Invoice(int invoiceID, int programID, int organizationID)
    {
        InvoiceID = invoiceID;
        ProgramID = programID;
        OrganizationID = organizationID;
    }

    public Invoice(int invoiceID, int programID, int organizationID, string invoiceAmount, bool cancelledYN, string paymentTotal, DateTime lastUpdated, string lastUpdatedBy)
    {
        this.InvoiceID = invoiceID;
        this.ProgramID = programID;
        this.OrganizationID = organizationID;
        this.InvoiceAmount = invoiceAmount;
        this.CancelledYN = cancelledYN;
        PaymentTotal1 = paymentTotal;
        this.LastUpdated = lastUpdated;
        this.LastUpdatedBy = lastUpdatedBy;
    }

    public Invoice(int invoiceID, string invoiceAmount, int cancelledYN)
    {
        this.InvoiceID = invoiceID;
        //this.ProgramID = programID;
        //this.OrganizationID = organizationID;
        this.InvoiceAmount = invoiceAmount;
        this.CancelledYN = Convert.ToBoolean(cancelledYN);
        this.LastUpdated = DateTime.Now;
        this.LastUpdatedBy = "User";
    }

    public static void insertInvoice(Invoice toInsert)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insertInvoice";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@InvoiceID", toInsert.InvoiceID);
        cmd.Parameters.AddWithValue("@InvoiceAmount", toInsert.InvoiceAmount);
        cmd.Parameters.AddWithValue("@CancelledYN", toInsert.CancelledYN);
        cmd.Parameters.AddWithValue("@LastUpdatedBy", "User");
        cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);

        cmd.Parameters.AddWithValue("@ProgramID", DBNull.Value);
        cmd.Parameters.AddWithValue("@OrganizationID", DBNull.Value);
        cmd.Parameters.AddWithValue("@PaymentTotal", 0);

        //cmd.Parameters.Add("@InvoiceID", SqlDbType.Int).Direction = ParameterDirection.Output;
        executeNonQuery(cmd);

    }

    public static List<Invoice> getInvoiceList()
    {
        List<Invoice> list = new List<Invoice>();
        string query = "SELECT ProgramID, FirstName, LastName FROM Employee;";
        using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Project"].ConnectionString))
        {
            SqlCommand cmdSelect = new SqlCommand(query, con);
            con.Open();
            SqlDataReader reader = cmdSelect.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    int id = reader.GetInt32(0);
                    string firstName = reader.GetString(1);
                    string lastName = reader.GetString(2);
                    Employee newEmployee = new Employee(id, firstName, lastName);
                    //list.Add(newEmployee);
                }
            }
        }

        return list;
    }

    public int InvoiceID { get => invoiceID; set => invoiceID = value; }
    public int ProgramID { get => programID; set => programID = value; }
    public int OrganizationID { get => organizationID; set => organizationID = value; }
    public string InvoiceAmount { get => invoiceAmount; set => invoiceAmount = value; }
    public bool CancelledYN { get => cancelledYN; set => cancelledYN = value; }
    public string PaymentTotal1 { get => PaymentTotal; set => PaymentTotal = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
}