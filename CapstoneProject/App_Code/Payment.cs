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
    private string orgName;
    private string paymentType;
    private int checkNumber;
    private double paymentAmount;
    private DateTime dateOfPayment;
    private int orgID;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public Payment()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Payment(string orgName, string paymentType, int checkNumber, double paymentAmount, DateTime dateOfPayment, int orgID)
    {
        this.orgName = orgName;
        this.paymentType = paymentType;
        this.checkNumber = checkNumber;
        this.paymentAmount = paymentAmount;
        this.dateOfPayment = dateOfPayment;
        this.orgID = orgID;
    }

    public string OrgName { get => orgName; set => orgName = value; }
    public string PaymentType { get => paymentType; set => paymentType = value; }
    public int CheckNumber { get => checkNumber; set => checkNumber = value; }
    public double PaymentAmount { get => paymentAmount; set => paymentAmount = value; }
    public DateTime DateOfPayment { get => dateOfPayment; set => dateOfPayment = value; }
    public int OrgID { get => orgID; set => orgID = value; }
}