using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SqlHelper
/// </summary>
namespace SqlHelper
{
    public class data
    {
        private string _conString = string.Empty;

        public data(string connectionStringName)
        {
            //  _conString = "Data Source=10.125.242.206;Initial Catalog=MAPIT;Persist Security Info=True;User ID=sa;Password=xtpl@bpl;Max Pool Size=1200";


            //    _conString =  ConfigurationManager.ConnectionStrings["SQLCONN"].ConnectionString;
            _conString = ConfigurationManager.ConnectionStrings[connectionStringName].ToString();

        }

        public data()
        {
            //  _conString = "Data Source=10.125.242.206;Initial Catalog=MAPIT;Persist Security Info=True;User ID=sa;Password=xtpl@bpl;Max Pool Size=1200";


            //    _conString =  ConfigurationManager.ConnectionStrings["SQLCONN"].ConnectionString;
            _conString = ConfigurationManager.ConnectionStrings["MasterDB"].ToString();

        }
        public int ExecuteNonQuery(string query)
        {
            SqlConnection cnn = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand(query, cnn);
            if (query.StartsWith("INSERT") | query.StartsWith("insert") | query.StartsWith("UPDATE") | query.StartsWith("update") | query.StartsWith("DELETE") | query.StartsWith("delete"))
            {
                cmd.CommandType = CommandType.Text;
            }
            else
            {
                cmd.CommandType = CommandType.StoredProcedure;
            }
            int retval;
            try
            {
                cnn.Open();
                cmd.CommandTimeout = 300;
                retval = cmd.ExecuteNonQuery();
            }
            catch (Exception exp)
            {
                throw exp;
            }
            finally
            {
                if (cnn.State == ConnectionState.Open)
                {
                    cnn.Close();
                }
            }
            return retval;
        }
        public int ExecuteNonQuery(string query, params SqlParameter[] parameters)
        {
            SqlConnection cnn = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand(query, cnn);
            if (query.StartsWith("INSERT") | query.StartsWith("insert") | query.StartsWith("UPDATE") | query.StartsWith("update") | query.StartsWith("DELETE") | query.StartsWith("delete"))
            {
                cmd.CommandType = CommandType.Text;
            }
            else
            {
                cmd.CommandType = CommandType.StoredProcedure;
            }
            for (int i = 0; i <= parameters.Length - 1; i++)
            {
                cmd.Parameters.Add(parameters[i]);
            }
            cnn.Open();
            cmd.CommandTimeout = 300;
            int retval = cmd.ExecuteNonQuery();
            cnn.Close();

            if (cmd.Parameters.Count > 0)
            {
                cmd.Parameters.Clear();
            }

            return retval;
        }
        public object ExecuteScalar(string query)
        {
            SqlConnection cnn = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand(query, cnn);
            if (query.StartsWith("SELECT") | query.StartsWith("select"))
            {
                cmd.CommandType = CommandType.Text;
            }
            else
            {
                cmd.CommandType = CommandType.StoredProcedure;
            }
            cmd.CommandTimeout = 300;
            cnn.Open();
            object retval = cmd.ExecuteNonQuery();
            cnn.Close();
            return retval;
        }
        public object ExecuteScalar(string query, params SqlParameter[] parameters)
        {
            SqlConnection cnn = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand(query, cnn);
            if (query.StartsWith("SELECT") | query.StartsWith("select"))
            {
                cmd.CommandType = CommandType.Text;
            }
            else
            {
                cmd.CommandType = CommandType.StoredProcedure;
            }
            for (int i = 0; i <= parameters.Length - 1; i++)
            {
                cmd.Parameters.Add(parameters[i]);
            }
            cmd.CommandTimeout = 300;
            cnn.Open();
            object retval = cmd.ExecuteScalar();
            cnn.Close();

            if (cmd.Parameters.Count > 0)
            {
                cmd.Parameters.Clear();
            }

            return retval;
        }
        public SqlDataReader ExecuteReader(string query)
        {
            SqlConnection cnn = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand(query, cnn);
            cmd.CommandTimeout = 300;
            if (query.StartsWith("SELECT") | query.StartsWith("select"))
            {
                cmd.CommandType = CommandType.Text;
                cnn.Open();
            }
            else
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cnn.Open();
            }
            return cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
        public SqlDataReader ExecuteReader(string query, params SqlParameter[] parameters)
        {
            SqlConnection cnn = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand(query, cnn);
            cmd.CommandTimeout = 300;
            if (query.StartsWith("SELECT") | query.StartsWith("select"))
            {
                cmd.CommandType = CommandType.Text;
            }
            else
            {
                cmd.CommandType = CommandType.StoredProcedure;
            }
            for (int i = 0; i <= parameters.Length - 1; i++)
            {
                cmd.Parameters.Add(parameters[i]);
            }
            cnn.Open();
            return cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
        public DataSet ExecuteDataSet(string query)
        {
            SqlConnection cnn = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand(query, cnn);
            if (query.StartsWith("SELECT") | query.StartsWith("select") | query.StartsWith("exec"))
            {
                cmd.CommandType = CommandType.Text;
            }
            else
            {
                cmd.CommandType = CommandType.StoredProcedure;
            }
            cmd.CommandTimeout = 300;

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public DataSet ExecuteDataSet(string query, params SqlParameter[] parameters)
        {
            SqlConnection cnn = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand(query, cnn);
            if (query.StartsWith("SELECT") | query.StartsWith("select"))
            {
                cmd.CommandType = CommandType.Text;
            }
            else
            {
                cmd.CommandType = CommandType.StoredProcedure;
            }
            for (int i = 0; i <= parameters.Length - 1; i++)
            {
                cmd.Parameters.Add(parameters[i]);
            }
            cmd.CommandTimeout = 300;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);

            if (cmd.Parameters.Count > 0)
            {
                cmd.Parameters.Clear();
            }

            return ds;
        }
        public DataTable ExecuteDataTable(string query)
        {
            SqlConnection cnn = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand(query, cnn);
            if (query.StartsWith("SELECT") | query.StartsWith("select"))
            {
                cmd.CommandType = CommandType.Text;
            }
            else
            {
                cmd.CommandType = CommandType.StoredProcedure;
            }
            cmd.CommandTimeout = 300;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (cmd.Parameters.Count > 0)
            {
                cmd.Parameters.Clear();
            }

            return dt;
        }
        public DataTable ExecuteDataTable(string query, params SqlParameter[] parameters)
        {
            SqlConnection cnn = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand(query, cnn);
            if (query.StartsWith("SELECT") | query.StartsWith("select"))
            {
                cmd.CommandType = CommandType.Text;
            }
            else
            {
                cmd.CommandType = CommandType.StoredProcedure;
            }
            for (int i = 0; i <= parameters.Length - 1; i++)
            {
                cmd.Parameters.Add(parameters[i]);
            }
            cmd.CommandTimeout = 1200;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (cmd.Parameters.Count > 0)
            {
                cmd.Parameters.Clear();
            }

            return dt;
        }
        // Return Stored Procedure return 
        public Int32 ReturnValue(string query, params SqlParameter[] parameters)
        {
            Int32 retval = -101;
            SqlConnection cnn = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand(query, cnn);
            cmd.CommandTimeout = 300;
            if (query.StartsWith("SELECT") | query.StartsWith("select"))
            {
                cmd.CommandType = CommandType.Text;
            }
            else
            {
                cmd.CommandType = CommandType.StoredProcedure;
            }
            for (int i = 0; i <= parameters.Length - 1; i++)
            {
                cmd.Parameters.Add(parameters[i]);
            }
            SqlParameter param = new SqlParameter();
            param.ParameterName = "@return_value";
            param.DbType = DbType.Int32;
            param.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(param);

            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                retval = (Int32)cmd.Parameters["@return_value"].Value;
            }
            catch (Exception exp)
            {
                throw exp;
            }
            finally
            {
                if (cnn.State == ConnectionState.Open)
                {
                    cnn.Close();
                }
            }


            return retval;
        }

        public DataSet ExecuteDataTableNon(string query, params SqlParameter[] parameters)
        {
            SqlConnection cnn = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand(query, cnn);
            try
            {
                if (query.StartsWith("INSERT") | query.StartsWith("insert") | query.StartsWith("UPDATE") | query.StartsWith("update") | query.StartsWith("DELETE") | query.StartsWith("delete"))
                {
                    cmd.CommandType = CommandType.Text;
                }
                else
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                }
                for (int i = 0; i <= parameters.Length - 1; i++)
                {
                    cmd.Parameters.Add(parameters[i]);
                }
                cnn.Open();
                cmd.CommandTimeout = 300;
                DataSet ds = new DataSet();

                SqlDataAdapter adap = new SqlDataAdapter(cmd);
                adap.Fill(ds, "MasterTable");
                return ds;

               

                cnn.Close();

                if (cmd.Parameters.Count > 0)
                {
                    cmd.Parameters.Clear();
                }

                return ds;
            }
            catch (Exception e)
            {
                DataSet ds = new DataSet();
                DataTable dte = new DataTable();
                dte.Columns.Add("ErrorMessage");
                object[] o = { e.Message };
                dte.Rows.Add(o);
                ds.Tables.Add(dte);
                return ds;
            }

        }
    }
}