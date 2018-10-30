using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for ProgramReport
/// </summary>
public class ProgramReport : dbConnect
{
    private static int yearOnSite;
    private static int yearOffSite;
    private static int yearTotalPrograms;
    private static int yearTotalChildren;
    private static int yearTotalAdults;
    private static int yearTotalPeople;

    public ProgramReport()
    {

    }

    public ProgramReport(string monthName, int monthNum, int onSite, int offSite, int totalProgram, int totalChildren, int totalAdults, int totalPeople)
    {
        MonthName = monthName;
        MonthNum = monthNum;
        OnSite = onSite;
        OffSite = offSite;
        TotalProgram = totalProgram;
        TotalChildren = totalChildren;
        TotalAdults = totalAdults;
        TotalPeople = totalPeople;

        yearOnSite += OnSite;
        yearOffSite += OffSite;
        yearTotalPrograms += TotalProgram;
        yearTotalChildren += TotalChildren;
        yearTotalAdults += TotalAdults;
        yearTotalPeople += TotalPeople;
    }

    public static List<ProgramReport> getProgramReport()
    {
        string tempMonthName;
        int tempMonthNum;
        int tempOnSite;
        int tempOffSite;
        int tempTotalProgram;
        int tempTotalChildren;
        int tempTotalAdults;
        int tempTotalPeople;
        List<ProgramReport> list = new List<ProgramReport>();



        for (int i = 1; i < 13; i++)
        {
         string  query = "SELECT COUNT(CASE WHEN OnOffSite=1 THEN 1 END) as 'On-Site', Count(Case when LiveProgram.OnOffSite=0 then 1 end) as 'Off-Site', Count(*) as 'Total Programs', SUM(Program.ChildAttendance) as 'Children', SUM(Program.AdultAttendance) 'Adults', SUM(Program.AdultAttendance) + SUM(Program.ChildAttendance) as 'Total People' " +
"FROM LiveProgram INNER JOIN Program ON LiveProgram.ProgramID = Program.ProgramID" +
"where datepart(month, program.datetime) = @month GROUP BY datename(month, program.datetime)";

            switch (i)
            {
                case 1:
                    tempMonthName = "January";
                    break;
                case 2:
                    tempMonthName = "February";
                    break;
                case 3:
                    tempMonthName = "March";
                    break;
                case 4:
                    tempMonthName = "April";
                    break;
                case 5:
                    tempMonthName = "May";
                    break;
                case 6:
                    tempMonthName = "June";
                    break;
                case 7:
                    tempMonthName = "July";
                    break;
                case 8:
                    tempMonthName = "August";
                    break;
                case 9:
                    tempMonthName = "September";
                    break;
                case 10:
                    tempMonthName = "October";
                    break;
                case 11:
                    tempMonthName = "November";
                    break;
                case 12:
                    tempMonthName = "December";
                    break;
            }

            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Project"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@month", i);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        tempMonthName = reader.GetString(0);
                        tempOnSite = reader.GetInt32(1);
                        tempOffSite = reader.GetInt32(2);
                        tempTotalProgram = reader.GetInt32(3);
                        tempTotalChildren = reader.GetInt32(4);
                        tempTotalAdults = reader.GetInt32(5);
                        tempTotalPeople = reader.GetInt32(6);

                        ProgramReport newMonth = new ProgramReport(tempMonthName, i, tempOnSite, tempOffSite, tempTotalProgram, tempTotalChildren, tempTotalAdults, tempTotalPeople);
                        list.Add(newMonth);

                        //ProgramReport newMonth = new 
                        //list.Add(newAnimal);
                    }
                }
            }

        }




        return list;
    }



    public string MonthName { get; set; }
    public int MonthNum { get; set; }
    public int OnSite { get; set; }
    public int OffSite { get; set; }
    public int TotalProgram { get; set; }
    public int TotalChildren { get; set; }
    public int TotalAdults { get; set; }
    public int TotalPeople { get; set; }
}