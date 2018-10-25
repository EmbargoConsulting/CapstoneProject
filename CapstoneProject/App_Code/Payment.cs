using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Payment
/// </summary>
public class Payment : dbConnect
{
    private int paymentID;
    private int invoiceID;
    private string paymentType;
    private int checkNumber;
    private double paymentAmount;
    private DateTime paymentTotal;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public Payment()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Payment(int paymentID, int invoiceID, string paymentType, int checkNumber, double paymentAmount, DateTime paymentTotal, DateTime lastUpdated, string lastUpdatedBy)
    {
        this.PaymentID = paymentID;
        this.InvoiceID = invoiceID;
        this.PaymentType = paymentType;
        this.CheckNumber = checkNumber;
        this.PaymentAmount = paymentAmount;
        this.PaymentTotal = paymentTotal;
        this.LastUpdated = lastUpdated;
        this.LastUpdatedBy = lastUpdatedBy;
    }

    public int PaymentID { get => paymentID; set => paymentID = value; }
    public int InvoiceID { get => invoiceID; set => invoiceID = value; }
    public string PaymentType { get => paymentType; set => paymentType = value; }
    public int CheckNumber { get => checkNumber; set => checkNumber = value; }
    public double PaymentAmount { get => paymentAmount; set => paymentAmount = value; }
    public DateTime PaymentTotal { get => paymentTotal; set => paymentTotal = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
}