using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class TopUpApprovalDAL : DALBase
    {
        Database m_DataBase;

        public TopUpApprovalDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public TopUpApprovalDAL()
            : base()
        {

        }

        static string TableName = "DC_KioskTopUp";

        static string TableLedgerName = "DC_Ledger";

        static string TransactionTableName = "DC_TransactionDetails";
        

        internal void UpdateTopUp(string RowID, string TopUpStatus, string FinanceComment, string TransactionID)
        {
            int ResultRow;
            string Query = "";

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            Query = "Update " + TableName + " Set Status = '" + TopUpStatus + "', Comment = '" + FinanceComment + "', Updatedate = GetDate(), UpdatedBy ='System', TrnID='" + TransactionID + "' Where RowID = " + RowID;

            ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
        }


        internal void UpdateIntoLedger(double Amount, string MonthColumn, string KioskID, int Year)
        {
            int ResultRow;
            string Query = "";

            Year = CommonUtility.GetFinancialYear();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            Query = "Update " + TableLedgerName + " set dc_clo_bal = dc_clo_bal + " + Amount + ", yrly_crtot = yrly_crtot + " + Amount + ", " + 
                MonthColumn + " = IsNull(" + MonthColumn + ", 0) + " + Amount + " Where channel_id ='" + KioskID + "' and year = " + Year;

            ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
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

        //internal string GetSequenceNo()
        //{
        //    DataTable oDataTable = new DataTable();
        //    IDataReader Reader = null;
        //    string t_SequenceNo = "";
        //    m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
        //    try
        //    {
        //        DbCommand selectCommand;
        //        String SQLCommand = "Select Max(IsNull(Cast(SequenceNo As int), 0)) + 1 As SequenceNo From " + TransactionTableName;
        //        selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
        //        Reader = m_DataBase.ExecuteReader(selectCommand);
        //        if (Reader != null)
        //            oDataTable.Load(Reader);

        //        t_SequenceNo = oDataTable.Rows[0]["SequenceNo"].ToString();
        //        t_SequenceNo = t_SequenceNo.PadLeft(8, '0');

        //        return t_SequenceNo;
        //    }
        //    finally
        //    {
        //        if (Reader != null)
        //        {
        //            Reader.Close();
        //        }
        //    }
        //}

        internal void UpdateSequenceNo(string KioskID, string Service_ID, double DC_CLO_BAL, string TransactionID, string SequenceNo)
        {
            string t_SeqNo = "";
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;

                selectCommand = null;
                selectCommand = DatabaseObject.GetSqlStringCommand("UPDATE " + TransactionTableName + " SET TrnID=@TrnID, SequenceNo = @SequenceNo Where channel_id = @Channel_ID And service_id = @Service_ID And trans_type = @TrnType And Total = @Total And TrnID Is Null");
                DatabaseObject.AddInParameter(selectCommand, "@TrnID", DbType.AnsiString, TransactionID);
                DatabaseObject.AddInParameter(selectCommand, "@SequenceNo", DbType.AnsiString, SequenceNo);
                DatabaseObject.AddInParameter(selectCommand, "@Channel_ID", DbType.AnsiString, KioskID);
                DatabaseObject.AddInParameter(selectCommand, "@Service_ID", DbType.AnsiString, Service_ID);
                DatabaseObject.AddInParameter(selectCommand, "@TrnType", DbType.AnsiString, "CR");
                DatabaseObject.AddInParameter(selectCommand, "@Total", DbType.Double, DC_CLO_BAL);
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

        public DataTable GetCount()
        {
            string m_Role = string.Empty;
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"select 
                                        Sum (Case When Status = 'A' Then 1 Else 0 End) as  'Approved',                                       
                                        Sum (Case when Status = 'R' Then 1 Else 0 End) as 'Rejected',
                                        Sum (Case When Status IS NULL Then 1 Else 0 End) as  'Pending'
                                        from DC_KioskTopUp";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
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
