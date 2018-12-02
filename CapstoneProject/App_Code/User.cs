using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User : dbConnect
{
    string username;
    string passwordHash;

    SqlConnection cnn;

    public User()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public User(string username, string passwordHash, int type)
    {
        this.username = username;
        this.passwordHash = passwordHash;
        Type = type;
    }

    //Inserts Data
    public Boolean insertData()
    {
        cnn = new SqlConnection(connectionString);

        try
        {
            cnn.Open();
            Debug.WriteLine("Connection Open ! ");

            SqlCommand Cmd = new SqlCommand("INSERT INTO dbo.Users ([Username],[PasswordHash], [LastUpdatedBy], [LastUpdated], [Admin])" +
                        "VALUES(@Username, @Passwordhash, @LastUpdatedBy, @LastUpdated, @Type)", cnn);

            //Cmd.Parameters.Add("@DepartmentID", System.Data.SqlDbType.Int).Value = DepartmentID;
            Cmd.Parameters.Add("@Username", System.Data.SqlDbType.VarChar, 50).Value = Username;
            Cmd.Parameters.Add("@PasswordHash", System.Data.SqlDbType.VarChar, 50).Value = PasswordHash;
            Cmd.Parameters.Add("@Type", System.Data.SqlDbType.Bit).Value = Type;
            Cmd.Parameters.AddWithValue("@LastUpdatedBy", System.Security.Principal.WindowsIdentity.GetCurrent().Name);
            Cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);


            executeNonQuery(Cmd);

            cnn.Close();

            return true;
        }

        catch (System.Data.SqlClient.SqlException sqlException)
        {
            Debug.WriteLine(sqlException.Message);
            return false;
        }
    }

    public Boolean updateData()
    {
        cnn = new SqlConnection(connectionString);

        try
        {
            if (getUsername(Username))
            {
                cnn.Open();
                Debug.WriteLine("Connection Open ! ");

                SqlCommand Cmd = new SqlCommand("update dbo.Users set [PasswordHash] = @PasswordHash", cnn);

                //Cmd.Parameters.Add("@DepartmentID", System.Data.SqlDbType.Int).Value = DepartmentID;
                Cmd.Parameters.Add("@PasswordHash", System.Data.SqlDbType.VarChar, 50).Value = PasswordHash;


                executeNonQuery(Cmd);

                cnn.Close();

                return true;
            }
        }

        catch (System.Data.SqlClient.SqlException sqlException)
        {
            Debug.WriteLine(sqlException.Message);
            return false;
        }

        return false;
    }

    public string getPasswordHash(string username)
    {
        cnn = new SqlConnection(connectionString);
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

    public bool getUsername(string username)
    {
        cnn = new SqlConnection(connectionString);
        string hash = "";
        int x = 0;
        try
        {
            cnn.Open();
            Debug.WriteLine("Connection Open ! ");

            SqlCommand Cmd = new SqlCommand("select username from dbo.Users where Username = @Username", cnn);
            Cmd.Parameters.Add("@Username", System.Data.SqlDbType.VarChar, 100).Value = username;

            SqlDataReader myreader;

            myreader = Cmd.ExecuteReader();

            while (myreader.Read())
            {
                hash = myreader[0].ToString();
                x++;
            }

            cnn.Close();


            if (x >= 1)
                return true;

            return false;
        }

        catch (System.Data.SqlClient.SqlException sqlException)
        {
            Debug.WriteLine(sqlException.Message);
            return false;
        }
    }

    public string Username { get => username; set => username = value; }
    public string PasswordHash { get => passwordHash; set => passwordHash = value; }
    public int Type { get; set; }
}