using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class OperatorRegistrationDAL : DALBase
    {
        Database m_DataBase;
        
        public OperatorRegistrationDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public OperatorRegistrationDAL()
            : base()
        {

        }

        static string TableName = "mstUsers";        

        internal void Insert(DataStructs.OperatorRegistration_DT objOperatorRegistration_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objOperatorRegistration_DT, TableName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal int ValidateOperator(string OperatorID, string KIOSKID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                //String SQLCommand = "Select COUNT(LoginID) As LoginCount from mstUsers Where LoginID = @OperatorID And KioskID = @KIOSKID";
                String SQLCommand = "Select COUNT(LoginID) As LoginCount from mstUsers Where LoginID = @OperatorID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@OperatorID", DbType.String, OperatorID);
                m_DataBase.AddInParameter(selectCommand, "@KIOSKID", DbType.String, KIOSKID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                int t_Count = Convert.ToInt32(oDataTable.Rows[0]["LoginCount"].ToString());

                return t_Count;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }


        internal string GetDistrictCode(string KioskID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            string t_DistrictCode = "";
            try
            {
                DbCommand selectCommand;                
                String SQLCommand = "Select Dist from mstUsers Where KioskID = @KioskID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@KioskID", DbType.String, KioskID);                
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                if (oDataTable.Rows.Count > 0) t_DistrictCode = oDataTable.Rows[0]["Dist"].ToString();

                return t_DistrictCode;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }


        internal void UpdateOperator(string RowId, string Password, string Status)
        {
            
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;

                selectCommand = null;
                selectCommand = DatabaseObject.GetSqlStringCommand("Update mstusers set Active = Case When Active = 1 Then 0  else 1 End, Password = NEWID() where ser = '" + RowId + "'");

                int count = (int)m_DataBase.ExecuteNonQuery(selectCommand);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }

            /*m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            int ResultRow;
            string Query = "";

            Query = "Update mstusers set Active = Case When Active = 1 Then 0  else 1 End, Password = '" + Password + "' where ser = '" + RowId + "'";
            ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);*/
        }
    }
}
