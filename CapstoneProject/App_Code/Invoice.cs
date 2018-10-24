using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Invoice
/// </summary>
public class Invoice : dbConnect
{
    private int paymentID;
    private int orgID;
    private double monthlyTotal;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public Invoice()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Invoice(int paymentID, int orgID, double monthlyTotal)
    {
        this.PaymentID = paymentID;
        this.OrgID = orgID;
        this.MonthlyTotal = monthlyTotal;
    }

    public int PaymentID { get => paymentID; set => paymentID = value; }
    public int OrgID { get => orgID; set => orgID = value; }
    public double MonthlyTotal { get => monthlyTotal; set => monthlyTotal = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
}