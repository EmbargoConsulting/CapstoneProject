using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

/// <summary>
/// Summary description for Program
/// </summary>
public class Program
{
    private static ArrayList programList = new ArrayList();

    private string programID;
    private string onOffSite;
    private string status;
    private string organization;
    private string address;
    private string reportMonth;
    private DateTime dateTime;
    private string programType;
    private string[] educators;
    private string[] animals;
    private int childrenCount;
    private int adultCount;
    private bool waitingPayment;
    private string city;
    private string county;

    public Program()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Program(string onOffSite, string status, string organization, string address, string reportMonth, DateTime dateTime, string programType, string[] educators, string[] animals, int childrenCount, int adultCount, bool waitingPayment, string city, string county)
    {
        this.onOffSite = onOffSite;
        this.status = status;
        this.organization = organization;
        this.address = address;
        this.reportMonth = reportMonth;
        this.dateTime = dateTime;
        this.programType = programType;
        this.educators = educators;
        this.animals = animals;
        this.childrenCount = childrenCount;
        this.adultCount = adultCount;
        this.waitingPayment = waitingPayment;
        this.city = city;
        this.county = county;
    }

    public static void populateList()
    {

    }

}