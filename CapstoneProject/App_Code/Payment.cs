using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Payment
/// </summary>
public class Payment
{
    private int PaymentID;
    private string OrgName;
    private string PaymentType;
    private int CheckNumber;
    private double PaymentAmount;
    private DateTime DateOfPayment;
    private int OrgID;
    private DateTime LastUpdated;
    private string LastUpdatedBy;

    public Payment()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}