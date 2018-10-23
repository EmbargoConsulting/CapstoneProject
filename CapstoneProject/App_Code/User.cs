using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    string username;
    string passwordHash;

    string connectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    SqlConnection cnn;

    public User()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public User(string username, string passwordHash)
    {
        this.username = username;
        this.passwordHash = passwordHash;
    }

    //Inserts Data
    public Boolean insertData()
    {
        cnn = new SqlConnection(connectionStrings);

        try
        {
            cnn.Open();
            Debug.WriteLine("Connection Open ! ");

            SqlCommand Cmd = new SqlCommand("INSERT INTO dbo.Users ([Username],[PasswordHash])" +
                        "VALUES(@Username, @Passwordhash)", cnn);

            //Cmd.Parameters.Add("@DepartmentID", System.Data.SqlDbType.Int).Value = DepartmentID;
            Cmd.Parameters.Add("@Username", System.Data.SqlDbType.VarChar, 50).Value = Username;
            Cmd.Parameters.Add("@PasswordHash", System.Data.SqlDbType.VarChar, 50).Value = PasswordHash;


            Cmd.ExecuteNonQuery();

            cnn.Close();

            return true;
        }

        catch (System.Data.SqlClient.SqlException sqlException)
        {
            Debug.WriteLine(sqlException.Message);
            return false;
        }
    }

    public string getPasswordHash(string username)
    {
        cnn = new SqlConnection(connectionStrings);
        string hash = "";

        try
        {
            cnn.Open();
            Debug.WriteLine("Connection Open ! ");

            SqlCommand Cmd = new SqlCommand("select PasswordHash from dbo.Users where Username = @Username", cnn);
            Cmd.Parameters.Add("@Username", System.Data.SqlDbType.VarChar, 100).Value = username;

            SqlDataReader myreader;

            myreader = Cmd.ExecuteReader();

            while (myreader.Read())
            {
                hash = myreader[0].ToString();
            }


            cnn.Close();

            return hash;
        }

        catch (System.Data.SqlClient.SqlException sqlException)
        {
            Debug.WriteLine(sqlException.Message);
            return "Didn't Work";
        }
    }

    public string Username { get => username; set => username = value; }
    public string PasswordHash { get => passwordHash; set => passwordHash = value; }
}