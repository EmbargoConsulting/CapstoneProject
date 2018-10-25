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
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public OnlineProgram()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public OnlineProgram(int programID, string state, string country, string grade, string teacherName, string teacherEmail, DateTime lastUpdated, string lastUpdatedBy)
    {
        this.ProgramID = programID;
        this.State = state;
        this.Country = country;
        this.Grade = grade;
        this.TeacherName = teacherName;
        this.TeacherEmail = teacherEmail;
        this.LastUpdated = lastUpdated;
        this.LastUpdatedBy = lastUpdatedBy;
    }

    public string State { get => state; set => state = value; }
    public string Country { get => country; set => country = value; }
    public string Grade { get => grade; set => grade = value; }
    public string TeacherName { get => teacherName; set => teacherName = value; }
    public string TeacherEmail { get => teacherEmail; set => teacherEmail = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
}