using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for OnlineProgram
/// </summary>
public class OnlineProgram : Program
{

    //Auto-properties
    public string State { get; set; }
    public string Country { get; set; }
    public string Grade { get; set; }
    public string TeacherName { get; set; }
    public string TeacherEmail { get; set; }


    public OnlineProgram(string state, string country, string grade, string teacherName, string teacherEmail, int invoiceID, string programName, DateTime date, DateTime time, string programType, int childCount, int adultCount, List<int> programAnimals, List<int> programEducators) : base(invoiceID, programName, date, time, programType, childCount, adultCount, programAnimals, programEducators)
    {
        State = state;
        Country = country;
        Grade = grade;
        TeacherName = teacherName;
        TeacherEmail = teacherEmail;
    }

    public static void insertOnlineProgram(OnlineProgram toInsert)
    {
        //Insert program supertype
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insertProgram";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@InvoiceID", toInsert.InvoiceID);
        cmd.Parameters.AddWithValue("@ProgramName", toInsert.ProgramName);
        cmd.Parameters.AddWithValue("@ProgramType", toInsert.ProgramType);
        cmd.Parameters.AddWithValue("@DateTime", toInsert.DateTime.ToString("yyyy-MM-dd hh:mm:ss"));
        cmd.Parameters.AddWithValue("@ChildAttendance", toInsert.ChildCount);
        cmd.Parameters.AddWithValue("@AdultAttendance", toInsert.AdultCount);
        cmd.Parameters.AddWithValue("@LastUpdatedBy", toInsert.LastUpdatedBy);
        cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        cmd.Parameters.Add("@ProgramID", SqlDbType.Int).Direction = ParameterDirection.Output;

        executeNonQuery(cmd);

        //Get ID of inserted program to reference as parent
        int programID = (Int32)cmd.Parameters["@ProgramID"].Value;
        toInsert.ProgramID = programID;

        cmd.Parameters.Clear();

        //Insert online program subtype
        cmd.CommandText = "insertOnlineProgram";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ProgramID", toInsert.ProgramID);
        cmd.Parameters.AddWithValue("@State", toInsert.State);
        cmd.Parameters.AddWithValue("@Country", toInsert.Country);
        cmd.Parameters.AddWithValue("@Grade", toInsert.Grade);
        cmd.Parameters.AddWithValue("@TeacherName", toInsert.TeacherName);
        cmd.Parameters.AddWithValue("@TeacherEmail", toInsert.TeacherEmail);
        cmd.Parameters.AddWithValue("@LastUpdatedBy", toInsert.LastUpdatedBy);
        cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        executeNonQuery(cmd);

        //Insert Employees
        foreach (int id in toInsert.ProgramEducators)
        {
            EmployeeProgram newEmployeeProgram = new EmployeeProgram(id, programID);
            EmployeeProgram.insertEmployeeProgram(newEmployeeProgram);
        }

        //Insert Animals
        foreach (int id in toInsert.ProgramAnimals)
        {
            AnimalProgram newAnimalProgram = new AnimalProgram(id, programID);
            AnimalProgram.insertAnimalProgram(newAnimalProgram);
        }

    }

}