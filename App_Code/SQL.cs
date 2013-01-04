using System;
using System.Data.SqlClient;
using Conf = System.Configuration.ConfigurationManager;
using System.Data;
using System.Web;
using System.Text;
using System.Data.SqlTypes;
using System.Collections.Generic;

namespace Eaztimate
{
    public static class SQL
    {
        private static string m_connectionString = string.Empty;

        private static SqlConnection CreateConnection()
        {
            if (m_connectionString.Length == 0)
            {
                m_connectionString = Conf.ConnectionStrings["SQLConnectionString"].ConnectionString;
            }
            SqlConnection result = new SqlConnection(m_connectionString);
            result.Open();

            return result;
        }

        private static SqlDataReader ExecuteProcedure(string name, params object[] parameters)
        {
            SqlConnection con = CreateConnection();
            using (SqlCommand cmd = con.CreateCommand())
            {
                cmd.CommandTimeout = int.Parse(Conf.AppSettings["SQLCommandTimeoutSec"]);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = name;
                for (int x = 0; x + 1 < parameters.Length; x += 2)
                {
                    SqlParameter p = cmd.Parameters.AddWithValue((string)parameters[x], parameters[x + 1]);
                    if (parameters[x + 1] is string)
                    {
                        p.DbType = DbType.AnsiString;
                    }
                }
                return cmd.ExecuteReader(CommandBehavior.CloseConnection);
            }
        }

        public static int ExecuteProcedureNoReader(string name, params object[] parameters)
        {
            SqlConnection con = CreateConnection();
            using (SqlCommand cmd = con.CreateCommand())
            {
                cmd.CommandTimeout = int.Parse(Conf.AppSettings["SQLCommandTimeoutSec"]);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = name;
                for (int x = 0; x + 1 < parameters.Length; x += 2)
                {
                    SqlParameter p = cmd.Parameters.AddWithValue((string)parameters[x], parameters[x + 1]);
                    if (parameters[x + 1] is string)
                    {
                        p.DbType = DbType.AnsiString;
                    }
                }
                return cmd.ExecuteNonQuery();
            }
        }

        public static SqlDataReader ExecuteQuery(string query, params object[] parameters)
        {
            SqlConnection con = CreateConnection();
            using (SqlCommand cmd = con.CreateCommand())
            {
                cmd.CommandTimeout = int.Parse(Conf.AppSettings["SQLCommandTimeoutSec"]);
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = query;
                for (int x = 0; x < parameters.Length; x++)
                {
                    SqlParameter p = cmd.Parameters.AddWithValue("@" + (x + 1), parameters[x]);
                    if (parameters[x] is string)
                    {
                        p.DbType = DbType.AnsiString;
                    }
                }
                return cmd.ExecuteReader(CommandBehavior.CloseConnection);
            }
        }
    }
}
