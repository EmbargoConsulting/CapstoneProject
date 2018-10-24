using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for OnlineProgram
/// </summary>
public class OnlineProgram : Program
{
    private string stateCountry;
    private string grade;
    private string teacherName;
    private string email;

    public OnlineProgram()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public OnlineProgram(string stateCountry, string grade, string teacherName, string email)
    {
        this.stateCountry = stateCountry;
        this.grade = grade;
        this.teacherName = teacherName;
        this.email = email;
    }
}