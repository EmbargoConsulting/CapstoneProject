using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for OnlineProgram
/// </summary>
public class OnlineProgram : Program
{
    private string StateCountry;
    private string Grade;
    private string TeacherName;
    private string Email;

    public OnlineProgram()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public OnlineProgram(string stateCountry, string grade, string teacherName, string email)
    {
        StateCountry = stateCountry;
        Grade = grade;
        TeacherName = teacherName;
        Email = email;
    }
}