using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Web;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class AutoDrCrDAL : DALBase
    {
        Database m_DataBase;

        public AutoDrCrDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public AutoDrCrDAL()
            : base()
        {

        }

        static string TableName = "AutoDrCrLog";
        static string TransactionTableName = "DC_TransactionDetails";

        internal void Insert(DataStructs.AutoDrCrLog_DT objAutoDrCrLog_DT, string[] AFieldLog)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            //objAutoDrCrLog_DT.Status = "Pending";
            cmdInsert = qb.GetInsertCommand(objAutoDrCrLog_DT, TableName, AFieldLog);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }
       

        internal void Update(string ChannelId,  string ApplicationId)
        {
            int ResultRow;
            string Query = "";
            string t_TransactionId = "";
            DataTable oDataTable = new DataTable();

            t_TransactionId = GetTrnId(ApplicationId, ChannelId);            

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            Query = "Update " + TableName + " set TransactionID = '" + t_TransactionId + "', Status = 'Approved'  Where ApplicationId ='" + ApplicationId + "' And KIOSKId = '" + ChannelId + "'";

            ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
        }

        internal string GetTrnId(string ApplicationId, string ChannelId)
        {
            string t_TransactionId = "";
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select TrnID from DC_TransactionDetails Where channel_id = @channel_id And AppID = @AppID ";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@channel_id", DbType.AnsiString, ChannelId);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, ApplicationId);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                t_TransactionId = oDataTable.Rows[0]["TrnID"].ToString();
                return t_TransactionId;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal void InsertIntoTransaction(DataStructs.Transaction_DT objTransaction_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objTransaction_DT, TransactionTableName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }
    }
}
