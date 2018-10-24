using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

public class dbConnect
{

    public static string connectionString = "Data Source=LocalHost;Initial Catalog=AdventureWorks2014;Integrated Security=True";

    public dbConnect()
    {
    }

    protected static void executeNonQuery(SqlCommand q)
    {

        try
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
        {
            q.Connection = connection;
            connection.Open();
            q.ExecuteNonQuery();

        }
        }
        catch (SqlException e)
        {
        }
    }

    protected static void executeNonQuery(String query)
    {
        try
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
        catch (Exception e)
        {

        }
    }

    protected static int executeScalarQuery(string query)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            int value = 0;
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            try
            {
                value = (Int32)command.ExecuteScalar();
            }
            catch (InvalidCastException e)
            {
            }
            return value;

        }
    }

}
