using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for OnlineProgram
/// </summary>
public class OnlineProgram : Program
{
    private string state;
    private string country;
    private string grade;
    private string teacherName;
    private string teacherEmail;


    public OnlineProgram(string state, string country, string grade, string teacherName, string teacherEmail, int invoiceID, string programName, DateTime date, DateTime time, string programType, int childCount, int adultCount, List<string> programAnimals, List<string> programEducators, DateTime lastUpdated, string lastUpdatedBy) : base(invoiceID, programName, date, time, programType, childCount, adultCount, programAnimals, programEducators)
    {
        //this.ProgramID = programID;
        this.State = state;
        this.Country = country;
        this.Grade = grade;
        this.TeacherName = teacherName;
        this.TeacherEmail = teacherEmail;
    }



    public string State { get => state; set => state = value; }
    public string Country { get => country; set => country = value; }
    public string Grade { get => grade; set => grade = value; }
    public string TeacherName { get => teacherName; set => teacherName = value; }
    public string TeacherEmail { get => teacherEmail; set => teacherEmail = value; }
}