using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;

namespace CitizenPortalLib.DAL
{
    public class SPVReceiveDAL : DALBase
    {
        Database m_DataBase;

        public SPVReceiveDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public SPVReceiveDAL()
            : base()
        {
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
        }

        static string TransactionTableName = "DC_TransactionDetails";
        static string ReverseTransactionTableName = "SPVReverseTransaction";

        internal void InsertIntoTransaction(DataStructs.Transaction_DT objTransaction_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objTransaction_DT, TransactionTableName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal void Insert(DataStructs.SPVReverseTransaction_DT objSPVReverseTransaction_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objSPVReverseTransaction_DT, ReverseTransactionTableName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal void UpdateSequenceNo(string ChannelID, string AppID, string TransactionID, string SequenceNo)
        {
            string t_SeqNo = "";            
            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;

                selectCommand = null;
                selectCommand = DatabaseObject.GetSqlStringCommand("UPDATE " + TransactionTableName + " SET TrnID=@TrnID, SequenceNo = @SequenceNo Where Channel_ID = @ChannelID And AppID = @AppID And TrnID Is Null And Trans_Type = @Trans_Type");
                
                DatabaseObject.AddInParameter(selectCommand, "@TrnID", DbType.AnsiString, TransactionID);
                DatabaseObject.AddInParameter(selectCommand, "@SequenceNo", DbType.AnsiString, SequenceNo);
                DatabaseObject.AddInParameter(selectCommand, "@ChannelID", DbType.AnsiString, ChannelID);
                DatabaseObject.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                DatabaseObject.AddInParameter(selectCommand, "@Trans_Type", DbType.AnsiString, "CR");
                
                int count = (int)DatabaseObject.ExecuteNonQuery(selectCommand);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }

        internal void UpdateModifiedByInLedger(string p_ModifiedBy, string p_KioskID, int p_Year)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;

                selectCommand = null;
                selectCommand = DatabaseObject.GetSqlStringCommand("UPDATE DC_Ledger SET ModifiedBy = @ModifiedBy, ModifiedOn = GetDate() WHERE Channel_ID = @KioskID And Year = @Year");
                DatabaseObject.AddInParameter(selectCommand, "@ModifiedBy", DbType.AnsiString, p_ModifiedBy);
                DatabaseObject.AddInParameter(selectCommand, "@KioskID", DbType.AnsiString, p_KioskID);
                DatabaseObject.AddInParameter(selectCommand, "@Year", DbType.AnsiString, p_Year);
                int count = (int)DatabaseObject.ExecuteNonQuery(selectCommand);
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
        }

        internal void UpdateModifiedByIntrn_TransSequenceNo(string p_ModifiedBy)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;

                selectCommand = null;
                selectCommand = DatabaseObject.GetSqlStringCommand("UPDATE trn_TransSequenceNo SET ModifiedBy = @ModifiedBy, ModifiedOn = GetDate() WHERE ApplicationName = @ApplicationName");
                DatabaseObject.AddInParameter(selectCommand, "@ModifiedBy", DbType.AnsiString, p_ModifiedBy);
                DatabaseObject.AddInParameter(selectCommand, "@ApplicationName", DbType.AnsiString, "Transaction");
                int count = (int)DatabaseObject.ExecuteNonQuery(selectCommand);
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
        }


    }
}
