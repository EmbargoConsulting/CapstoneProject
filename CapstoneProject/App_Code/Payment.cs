using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Payment
/// </summary>
public class Payment
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
}