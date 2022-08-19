using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    class CommonDAL : DALBase
    {
        Database m_DataBase;

        public CommonDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public CommonDAL()
            : base()
        {

        }

        internal DataTable ExecuteCommand(string Query)
        {
            DataTable oDataTable = new DataTable();
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = Query;
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                oDataTable = m_DataBase.ExecuteDataSet(selectCommand).Tables[0];
                return oDataTable;
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                throw ex;
            }

        }

        internal DataTable ExecuteCommand(string CustomConnectionString, string Query)
        {
            DataTable oDataTable = new DataTable();
            if (CustomConnectionString != "")
                m_DataBase = DatabaseFactory.CreateDatabase(CustomConnectionString);
            else
                m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = Query;
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                oDataTable = m_DataBase.ExecuteDataSet(selectCommand).Tables[0];
                return oDataTable;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        internal string InsertMailDetails(string ServiceID, string AppID, string ProfileID
            , string ToAddress, string CCAddress, string BCCAddress, string Subject, string Body, string IsBodyHtml)
        {
            /*
             * 
            string[] aFields = {  };
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objOISF_DT, "InsertOISFProfileV2SP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);
           */


            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings[this.ConnectionString].ToString();
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(connectionString);
            System.Data.SqlClient.SqlCommand cmd = null;
            //  cmd = con.CreateCommand();
            cmd = new System.Data.SqlClient.SqlCommand("InsertMailDetailSP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ServiceID", ServiceID);
            cmd.Parameters.AddWithValue("@AppID", AppID);
            cmd.Parameters.AddWithValue("@ProfileID", ProfileID);
            cmd.Parameters.AddWithValue("@ToAddress", ToAddress);
            cmd.Parameters.AddWithValue("@CCAddress", CCAddress);
            cmd.Parameters.AddWithValue("@BCCAddress", BCCAddress);
            cmd.Parameters.AddWithValue("@Subject", Subject);
            cmd.Parameters.AddWithValue("@Body", Body);
            cmd.Parameters.AddWithValue("@IsBodyHtml", IsBodyHtml);

            try
            {

                con.Open();


                string modified = cmd.ExecuteScalar().ToString();


                return modified;

            }
            catch (Exception ex)
            {
                // trans.Rollback();
                return "";

            }
            finally
            {
                // trans.Dispose();
                // con.Dispose();
                con.Close();

            }

        }

        internal DataTable GetDBObjects(string DB)
        {
            DataTable t_DT;

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
           
            using (DbConnection connection = m_DataBase.CreateConnection())
            {
                connection.Open();
                connection.ChangeDatabase(DB);

                DataTable schema = connection.GetSchema("Tables");
                
                t_DT = new DataTable();
                DataRow t_Row = null;

                t_DT.Columns.Add("Object_Name", typeof(string));

                t_DT.AcceptChanges();

                foreach (DataRow row in schema.Rows)
                {
                    t_Row = t_DT.NewRow();
                    t_Row["Object_Name"] = row[2].ToString();
                    t_DT.Rows.Add(t_Row);
                }

                t_DT.AcceptChanges();
                schema = null;

                t_DT.DefaultView.Sort = "Object_Name ASC";
                
                return t_DT;
            }
        }


        internal DataTable ExecuteOnDB(string DBName, string SQLQuery)
        {
            DataSet t_DS = new DataSet();            
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            using (IDbConnection connection = m_DataBase.CreateConnection())
            {
                connection.Open();
                connection.ChangeDatabase(DBName);

                using (IDbCommand selectCommand = connection.CreateCommand())
                {
                    String SQLCommand = SQLQuery;

                    try
                    {
                        IDbDataAdapter t_dataAdapter = new System.Data.SqlClient.SqlDataAdapter();

                        selectCommand.CommandText = SQLQuery;
                        selectCommand.Connection = connection;
                        t_dataAdapter.SelectCommand = selectCommand;
                        t_dataAdapter.Fill(t_DS);

                        t_dataAdapter = null;
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                    
                    return t_DS.Tables[0];
                }
            }
        }

        internal DataTable SaveUserRoleAccessPage(string UserID, string UserRole, string UserType, string PageURL, string CreatedBy)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("RoleBaseAccessPageSP");
                m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, UserID);
                m_DataBase.AddInParameter(selectCommand, "@UserRole", DbType.AnsiString, UserRole);
                m_DataBase.AddInParameter(selectCommand, "@UserType", DbType.AnsiString, UserType);
                m_DataBase.AddInParameter(selectCommand, "@PageURL", DbType.AnsiString, PageURL);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CreatedBy);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetUserMenuAccess(string menuRole, string PageURL, string UserID, string UserType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("MenuRoleAccessSP");
                m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, UserID);
                m_DataBase.AddInParameter(selectCommand, "@UserRole", DbType.AnsiString, menuRole);
                m_DataBase.AddInParameter(selectCommand, "@PageURL", DbType.AnsiString, PageURL);
                m_DataBase.AddInParameter(selectCommand, "@UserType", DbType.AnsiString, UserType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
    }
}
