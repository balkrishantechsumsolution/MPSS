using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;
using System.Web;
using CitizenPortalLib.DataStructs;


namespace CitizenPortalLib.DAL
{
    class ConfirmPaymentDAL : DALBase
    {
        Database m_DataBase;
        int m_TimeOut = 60;
        public ConfirmPaymentDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public ConfirmPaymentDAL()
            : base()
        {
            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            m_DataBase = Factory.Create(this.ConnectionString);
        }

        static string TableName = "TransactionDetailsTb";
        static string LedgerTableName = "LedgerTb";
        static string PayBreakUpTable = "mstPayBreakupTb";
        static string ServicesTableName = "mstServices";
        static string PaymentConfirmationTableName = "PaymentConfirmationDetailsTb";
        static string PaymentReversalTableName = "PaymentReversalDetailsTb";
        static string m_LangId = "1";

        internal string GetLangID()
        {            
            if (HttpContext.Current != null && HttpContext.Current.Session != null)
            {
                if (HttpContext.Current.Session["CurrentCulture"] != null && HttpContext.Current.Session["CurrentCulture"].ToString() == "mr-IN")
                    m_LangId = "2";
                else
                    m_LangId = "1";
            }
            return m_LangId;
        }

        internal void Insert(DataStructs.Transaction_DT objConfirmPayment_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV2(objConfirmPayment_DT, TableName, AFields);
            cmdInsert.CommandTimeout = m_TimeOut;
            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal int UpdateLedger(DataStructs.LedgerTable_DT objConfirmPayment_DT, string[] LedgerFields, string[] LedgerKeyColumns)
        {
            int ResultRow;
            DbCommand cmdUpdate;

            QueryBuilder qb = new QueryBuilder();

            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdUpdate = qb.GetUpdateCommand(objConfirmPayment_DT, LedgerTableName, LedgerFields, LedgerKeyColumns);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdUpdate);
            return ResultRow;
        }

        internal DataTable GetPayBreakup(string ServiceID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            try
            {
                DbCommand selectCommand;
                //String SQLCommand = "Select * From " + PayBreakUpTable + " Where ServiceID = @ServiceID";
                String SQLCommand = "Select A.* From " + PayBreakUpTable + " A Join mstServices B On A.PayBreakupID = B.PayBreakupID Where B.SvcID = @ServiceID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
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

        internal DataTable GetLedgerDetail(string KioskID, int Year)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            Year = CommonUtility.GetFinancialYear();

            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select * From " + LedgerTableName + " Where Channel_ID = @KioskID And Year = @Year";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@KioskID", DbType.AnsiString, KioskID);
                m_DataBase.AddInParameter(selectCommand, "@Year", DbType.AnsiString, Year);
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

        internal DataTable GetServiceToPayAtCSC(string KioskID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            QueryBuilder qb = new QueryBuilder();
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CSC_GetServiceToPayAtCSCSP");
                m_DataBase.AddInParameter(selectCommand, "@KioskID", DbType.AnsiString, KioskID);
                
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

        internal DataTable VerifyApplication(string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            QueryBuilder qb = new QueryBuilder();
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CSC_VerifyApplicationSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);               

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
        internal DataTable VerifyApplicationAndPayment(string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            QueryBuilder qb = new QueryBuilder();
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CSC_VerifyApplicationAndPaymentSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);

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

        internal string GetSequenceNo()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            string t_SequenceNo = "";
            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;

                selectCommand = null;

                
                selectCommand = DatabaseObject.GetSqlStringCommand("UPDATE trn_TransSequenceNo SET SequenceNo = SequenceNo + 1 WHERE ApplicationName = @ApplicationName");                
                DatabaseObject.AddInParameter(selectCommand, "@ApplicationName", DbType.AnsiString, "Transaction");

                selectCommand.CommandTimeout = m_TimeOut;

                int count = (int)DatabaseObject.ExecuteNonQuery(selectCommand);

                //String SQLCommand = "Select Max(IsNull(Cast(SequenceNo As int), 0)) + 1 As SequenceNo From " + TableName;
                string SQLCommand = "Select SequenceNo From trn_TransSequenceNo Where ApplicationName = 'Transaction'";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                t_SequenceNo = oDataTable.Rows[0]["SequenceNo"].ToString();
                t_SequenceNo = t_SequenceNo.PadLeft(8, '0');

                return t_SequenceNo;
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

        internal void UpdateSequenceNo(string KioskID, string AppID, string TransactionID, string SequenceNo)
        {
            string t_SeqNo = "";
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;

                selectCommand = null;                
                selectCommand = DatabaseObject.GetSqlStringCommand("UPDATE " + TableName + " SET TrnID=@TrnID, SequenceNo = @SequenceNo WHERE Channel_ID = @Channel_ID And AppID = @AppID");
                DatabaseObject.AddInParameter(selectCommand, "@TrnID", DbType.AnsiString, TransactionID);
                DatabaseObject.AddInParameter(selectCommand, "@SequenceNo", DbType.AnsiString, SequenceNo);
                DatabaseObject.AddInParameter(selectCommand, "@Channel_ID", DbType.AnsiString, KioskID);
                DatabaseObject.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);

                selectCommand.CommandTimeout = m_TimeOut;

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

        internal bool IfSCALedgerPresent(string SCAID, int Year)
        {
            bool t_Result = false;

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select Count(Channel_ID) As Cnt From " + LedgerTableName + " Where Channel_ID = @SCAID And Year = @Year";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@SCAID", DbType.AnsiString, SCAID);
                m_DataBase.AddInParameter(selectCommand, "@Year", DbType.Int32, Year);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                t_Result = Convert.ToInt16(oDataTable.Rows[0]["Cnt"].ToString()) > 0;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }

            return t_Result;
        }

        internal void InsertLedger(DataStructs.LedgerTable_DT objLedgerTable_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objLedgerTable_DT, LedgerTableName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal string GetServiceName(string ServiceID)
        {
            m_LangId = GetLangID();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            string t_ServiceName = "";
            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select SvcName As ServiceName, SvcNameLL As MarathiServiceName From " + ServicesTableName + " Where SvcID = @ServiceID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                if (m_LangId == "2")
                    t_ServiceName = oDataTable.Rows[0]["MarathiServiceName"].ToString();
                else if (m_LangId == "1")
                    t_ServiceName = oDataTable.Rows[0]["ServiceName"].ToString();

            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
            return t_ServiceName;
        }

        internal void InsertIntoPaymentConfirmation(DataStructs.DC_PaymentConfirmationDetails objDC_PaymentConfirmationDetails, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV2(objDC_PaymentConfirmationDetails, PaymentConfirmationTableName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal int GetAppCount(string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            int t_AppCount = 0;
            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                //String SQLCommand = "Select Count(AppID) from dbo.DC_TransactionDetails Where AppID = '" + AppID + "' And Paid_Status = 'Y'"; //Commented on 2013-12-05 for verifying the same from the Archived View
                String SQLCommand = "Select Count(AppID) from dbo.vwDCTransaction Where AppID = '" + AppID + "' And Paid_Status = 'Y'";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                t_AppCount = Convert.ToInt16(oDataTable.Rows[0][0].ToString());

                return t_AppCount;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal void UpdateTrackStatus(string LoginID, string AppId, string TransactionID)
        {
            try
            {
                DbCommand selectCommand;

                selectCommand = null;
                selectCommand = DatabaseObject.GetSqlStringCommand("Update TrackStatus set PayFlag='Y', ModifiedBy='" + LoginID + "',ModifiedOn=GETDATE(), TransactionID = '" + 
                TransactionID + "' where ApplicantID='" + AppId + "'");

                selectCommand.CommandTimeout = m_TimeOut;

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

        internal double GetSCAAmountToDeduct(int PayBreakUpID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            double t_SCAAmount = 0;
            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select SCAAmount from mstPayBreakUp Where PayBreakUpID = @PayBreakUpID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@PayBreakUpID", DbType.AnsiString, PayBreakUpID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                if (oDataTable.Rows.Count > 0 && oDataTable.Rows[0]["SCAAmount"].ToString() != "")
                    t_SCAAmount = Convert.ToDouble(oDataTable.Rows[0]["SCAAmount"].ToString());

                return t_SCAAmount;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal double GetSCAAmountToDeductV2(string SCAID, string KioskID, string VLEID, int ServiceID, string AppID, int PayBreakUpID)
        {
            /*
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            double t_SCAAmount = 0;
            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select SCAAmount from mstPayBreakUp Where PayBreakUpID = @PayBreakUpID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@PayBreakUpID", DbType.AnsiString, PayBreakUpID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                if (oDataTable.Rows.Count > 0 && oDataTable.Rows[0]["SCAAmount"].ToString() != "")
                    t_SCAAmount = Convert.ToDouble(oDataTable.Rows[0]["SCAAmount"].ToString());

                return t_SCAAmount;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
            */

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            double t_SCAAmount = 0;
            string t_AutoCommission = "Y";
            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select AutoCommission from mstPayBreakUpCustom Where SCAID = @SCAID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@SCAID", DbType.AnsiString, SCAID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                if (oDataTable.Rows.Count > 0 && oDataTable.Rows[0]["AutoCommission"].ToString() != "")
                {
                    t_AutoCommission = oDataTable.Rows[0]["AutoCommission"].ToString().ToUpper();
                }

                Reader = null;
                oDataTable = null;
                oDataTable = new DataTable();

                SQLCommand = "Select SCAAmount, Total from mstPayBreakUp Where PayBreakUpID = @PayBreakUpID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@PayBreakUpID", DbType.AnsiString, PayBreakUpID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                if (oDataTable.Rows.Count > 0 && oDataTable.Rows[0]["SCAAmount"].ToString() != "")
                    t_SCAAmount = Convert.ToDouble(oDataTable.Rows[0]["SCAAmount"].ToString());

                if (t_AutoCommission == "N")
                {
                    t_SCAAmount = Convert.ToDouble(oDataTable.Rows[0]["Total"].ToString());
                }

                return t_SCAAmount;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }


        }

        internal string InsertSPVWalletTransaction(Transaction_DT objTransaction_DT, string[] aFields)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            QueryBuilder qb = new QueryBuilder();
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;

                selectCommand = qb.GetInsertCommandV3(objTransaction_DT, "AppPaymentSPVSP", aFields);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable.Rows[0]["TransactionID"].ToString();
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal string InsertV3(Transaction_DT objTransaction_DT, string[] aFields)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            QueryBuilder qb = new QueryBuilder();
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                //selectCommand = m_DataBase.GetStoredProcCommand("AppPaymentSP");
                //m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                //m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                //m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CreatedBy);
                
                selectCommand = qb.GetInsertCommandV3(objTransaction_DT, "AppPaymentSP", aFields);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable.Rows[0]["TransactionID"].ToString();
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataSet GetPaymentDetails(string ServiceID, string AppID, string UserType)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetPaymentInfoSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@UserType", DbType.AnsiString, UserType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails", "PaymentDetails"});
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

        internal DataSet GetSPVPaymentDetails(string ServiceID, string AppID, string UserType)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetSPVPaymentInfoSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@UserType", DbType.AnsiString, UserType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails", "PaymentDetails" });
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
        internal string GetAppName(string AppID, out string EnglishName, out string MarathiName)
        {
            m_LangId = GetLangID();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            string t_AppName = "";

            EnglishName = "";
            MarathiName = "";

            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select FullName, FullName_LL from trnaddress (NoLock) where childkey = @ApplicantType and parentkey = @AppID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@ApplicantType", DbType.AnsiString, "Applicant Address");
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                if (oDataTable.Rows.Count > 0)
                {
                    if (m_LangId == "1")
                    {
                        t_AppName = oDataTable.Rows[0]["FullName"].ToString();
                    }
                    else if (m_LangId == "2")
                    {
                        t_AppName = oDataTable.Rows[0]["FullName_LL"].ToString();
                    }

                    EnglishName = oDataTable.Rows[0]["FullName"].ToString();
                    MarathiName = oDataTable.Rows[0]["FullName_LL"].ToString();
                }
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }

            return t_AppName;
        }

        internal string GetAppNameV2(string ServiceID, string LangID, string AppID, out string EnglishName, out string MarathiName)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            string t_AppName = "", t_TableList = "", t_TableName = "";
            string[] t_TableListArr = null;

            EnglishName = "";
            MarathiName = "";
            
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "";

                SQLCommand = "Select TableList From MOLMenus Where MenuID = @MenuID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@MenuID", DbType.AnsiString, ServiceID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                if (oDataTable.Rows.Count == 0)
                {
                    return "";
                }

                t_TableList = oDataTable.Rows[0]["TableList"].ToString();
                t_TableListArr = t_TableList.Split(new char[] { ',' });
                t_TableName = t_TableListArr[0];
                oDataTable = new DataTable();
                SQLCommand = "Select Name, Name_LL from " + t_TableName + " Where TransactionID = @AppID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);                
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                if (oDataTable.Rows.Count > 0)
                {
                    if (LangID == "1")
                    {
                        t_AppName = oDataTable.Rows[0]["Name"].ToString();
                    }
                    else if (LangID == "2")
                    {
                        t_AppName = oDataTable.Rows[0]["Name_LL"].ToString();
                    }

                    EnglishName = oDataTable.Rows[0]["Name"].ToString();
                    MarathiName = oDataTable.Rows[0]["Name_LL"].ToString();
                }
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }

            return t_AppName;
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

                selectCommand.CommandTimeout = m_TimeOut;

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

                selectCommand.CommandTimeout = m_TimeOut;

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

        internal bool VerifySCADeduction(string p_SCAID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            bool t_SCADeduction = false;
            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select SCADeduction from SCA_RegistrationDetails Where SCAID = @SCAID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@SCAID", DbType.AnsiString, p_SCAID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                t_SCADeduction = oDataTable.Rows[0]["SCADeduction"].ToString().ToUpper() == "Y";

                return t_SCADeduction;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }            
        }

        internal int ExecuteProcedure(string ServiceID, string ApplicationID, string TransactionID, string OfficeID, string CreatedBy)
        {
            int ResultRow;
            DbCommand insertCommand = null;

            insertCommand = DatabaseObject.GetStoredProcCommand("ProcessPostPayment");
            DatabaseObject.AddInParameter(insertCommand, "@ServiceID", DbType.Int32, ServiceID);
            DatabaseObject.AddInParameter(insertCommand, "@ApplicationID", DbType.AnsiString, ApplicationID);
            DatabaseObject.AddInParameter(insertCommand, "@TransactionID", DbType.AnsiString, TransactionID);
            DatabaseObject.AddInParameter(insertCommand, "@OfficeID", DbType.AnsiString, OfficeID);
            DatabaseObject.AddInParameter(insertCommand, "@UserID", DbType.AnsiString, CreatedBy);

            DatabaseObject = DatabaseFactory.CreateDatabase(this.ConnectionString);            
            ResultRow = DatabaseObject.ExecuteNonQuery(insertCommand);
            return ResultRow;
        }

        internal string SendToEDistrict(string ServiceID, string KioskID, string VLEID, string UNQ, string ApplicationID)
        {
            string ResultRow;
            DbCommand insertCommand = null;

            string DistrictCode, SubDistrictCode, VillageCode, PinCode;
            DistrictCode= SubDistrictCode= VillageCode= PinCode = "";

            DataTable ApplicantLocation = GetApplicantLocation(ApplicationID);

            if (ApplicantLocation != null && ApplicantLocation.Rows.Count > 0)
            {
                DistrictCode = ApplicantLocation.Rows[0]["DistrictCode"].ToString();
                SubDistrictCode = ApplicantLocation.Rows[0]["SubDistrictCode"].ToString();
                VillageCode = ApplicantLocation.Rows[0]["VillageCode"].ToString();
                PinCode = ApplicantLocation.Rows[0]["PinCode"].ToString();
            }

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;

            if (DistrictCode == "519")
            {
                try
                {
                    DbCommand selectCommand;
                    String SQLCommand = "Select OfficeID from OfficeMaster Where TalukaCode = @SubDistrictCode";
                    selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                    m_DataBase.AddInParameter(selectCommand, "@SubDistrictCode", DbType.AnsiString, SubDistrictCode);
                    Reader = m_DataBase.ExecuteReader(selectCommand);
                    if (Reader != null)
                        oDataTable.Load(Reader);

                    if (oDataTable.Rows.Count > 0)
                    {
                        ResultRow = oDataTable.Rows[0]["OfficeID"].ToString();
                    }
                    else
                        ResultRow = "";
                }
                finally
                {
                    if (Reader != null)
                    {
                        Reader.Close();
                    }
                }


            }
            else
            {
                insertCommand = DatabaseObject.GetStoredProcCommand("GetOfficeID");
                DatabaseObject.AddInParameter(insertCommand, "@ServiceID", DbType.Int32, ServiceID);
                DatabaseObject.AddInParameter(insertCommand, "@KioskID", DbType.AnsiString, KioskID);
                DatabaseObject.AddInParameter(insertCommand, "@VLEID", DbType.AnsiString, VLEID);
                DatabaseObject.AddInParameter(insertCommand, "@UNQ", DbType.AnsiString, UNQ);

                DatabaseObject.AddOutParameter(insertCommand, "@ReturnOfficeID", DbType.AnsiString, 100);

                DatabaseObject = DatabaseFactory.CreateDatabase(this.ConnectionString);
                DatabaseObject.ExecuteNonQuery(insertCommand);

                ResultRow = insertCommand.Parameters["@ReturnOfficeID"].Value.ToString();
            }

            return ResultRow;

        }

        internal void InsertIntoPaymentReversal(DataStructs.DC_PaymentReversalDetails objDC_PaymentReversalDetails, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            //m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objDC_PaymentReversalDetails, PaymentReversalTableName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal bool IsCustomAmount(string p_ServiceID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            bool t_IsCustomAmount = false;            
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select IsCustomAmount from mstServices Where SvcID = @SvcID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@SvcID", DbType.AnsiString, p_ServiceID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                t_IsCustomAmount = oDataTable.Rows[0]["IsCustomAmount"].ToString().ToUpper() == "Y";

                return t_IsCustomAmount;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }  
        }

        internal decimal GetCustomAmount(string p_ServiceID, string p_ApplicationID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            decimal t_CustomAmount = 0;            
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select Amount from TrackStatus (NoLock) Where ServiceID = @ServiceID And ApplicantID = @ApplicantID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, p_ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@ApplicantID", DbType.AnsiString, p_ApplicationID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                if (oDataTable.Rows.Count > 0 && oDataTable.Rows[0]["Amount"].ToString() != "")
                    t_CustomAmount = Convert.ToDecimal(oDataTable.Rows[0]["Amount"].ToString());

                return t_CustomAmount;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }  
        }


        internal string GetTransactionID(string ServiceID, string ApplicationID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            string t_Result = "";
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select TrnID from DC_TransactionDetails (NoLock) Where Service_ID = @ServiceID And AppID = @ApplicationID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@ApplicationID", DbType.AnsiString, ApplicationID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                t_Result = oDataTable.Rows[0]["TrnID"].ToString();

                return t_Result;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal bool VerifyRequestAlreadySentOrNot(string KioskID, string AppID, string CreatedBy, string VLEID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            bool t_Result = false;
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select Count(1) As Cnt From DC_PaymentConfirmationDetails Where TrnID = PaymentStatus And KioskID = @KioskID And CreatedBy = @CreatedBy And VLEID = @VLEID And TrnID = @TrnID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@KioskID", DbType.AnsiString, KioskID);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@VLEID", DbType.AnsiString, VLEID);
                m_DataBase.AddInParameter(selectCommand, "@TrnID", DbType.AnsiString, AppID);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                t_Result = Convert.ToInt32(oDataTable.Rows[0]["Cnt"].ToString()) > 0;

                return t_Result;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal void UpdateIntoPaymentConfirmation(DataStructs.DC_PaymentConfirmationDetails objDC_PaymentConfirmationDetails, string[] AFields, string[] AKeyFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            cmdInsert = qb.GetUpdateCommand(objDC_PaymentConfirmationDetails, "DC_PaymentConfirmationDetails", AFields, AKeyFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal DataTable GetCustomBreakUp(string ServiceID, string SCAID, string KioskID, string VLEID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            try
            {
                DbCommand selectCommand;                
                String SQLCommand = "";
                string t_DistrictCode = "";
                string t_PayBreakUpID = "";

                if (VLEID != "")
                {
                    SQLCommand = "Select DistrictCode From AllVLEDetails Where SCAID = @SCAID And VLEID = @VLEID";
                }
                else
                {
                    SQLCommand = "Select DistrictCode From AllVLEDetails Where SCAID = @SCAID And KioskID = @KioskID";
                }

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);                
                m_DataBase.AddInParameter(selectCommand, "@SCAID", DbType.AnsiString, SCAID);
                m_DataBase.AddInParameter(selectCommand, "@KioskID", DbType.AnsiString, KioskID);
                m_DataBase.AddInParameter(selectCommand, "@VLEID", DbType.AnsiString, VLEID);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                Reader = null;

                if (oDataTable == null) return null;
                if (oDataTable != null && oDataTable.Rows.Count == 0) return null;                

                t_DistrictCode = oDataTable.Rows[0]["DistrictCode"].ToString();

                SQLCommand = "Select PayBreakUpID From CustomPayBreakUp Where SCAID = @SCAID And DistrictCode = @DistrictCode And SvcID = @ServiceID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);                
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@SCAID", DbType.AnsiString, SCAID);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, t_DistrictCode);                

                Reader = m_DataBase.ExecuteReader(selectCommand);
                
                oDataTable = null;

                if (Reader != null)
                {
                    oDataTable = new DataTable();
                    oDataTable.Load(Reader);
                }

                Reader = null;

                if (oDataTable == null) return null;
                if (oDataTable != null && oDataTable.Rows.Count == 0) return null;

                t_PayBreakUpID = oDataTable.Rows[0]["PayBreakUpID"].ToString();

                SQLCommand = "Select * From mstPayBreakup Where PayBreakUpID = @PayBreakUpID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);                
                m_DataBase.AddInParameter(selectCommand, "@PayBreakUpID", DbType.AnsiString, t_PayBreakUpID);                

                Reader = m_DataBase.ExecuteReader(selectCommand);

                oDataTable = null;

                if (Reader != null)
                {
                    oDataTable = new DataTable();
                    oDataTable.Load(Reader);
                }

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

        internal DataTable GetCustomBreakUpForSCA(string SCAID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select A.* From CustomPayBreakUpForSCA A Where A.CustomPayBreakUp = 'True' And A.SCAID = @SCAID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@SCAID", DbType.AnsiString, SCAID);
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

        internal int VerifyImages(string AppID, string ServiceID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "";
                string t_ServiceID = ServiceID;
                string t_LangID = "";
                int t_Count = 0, t_ImageCount = 0;

                SQLCommand = "Select Count(1) As Cnt From mstServices Where SvcID = @SvcID And ValidateImages = 'True'";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@SvcID", DbType.AnsiString, t_ServiceID);

                Reader = m_DataBase.ExecuteReader(selectCommand);

                oDataTable = null;

                if (Reader != null)
                {
                    oDataTable = new DataTable();
                    oDataTable.Load(Reader);
                }

                Reader = null;

                if (oDataTable == null) return 1;
                if (oDataTable != null && oDataTable.Rows.Count == 0) return 1;

                t_Count = Convert.ToInt32(oDataTable.Rows[0]["Cnt"].ToString());

                if (t_Count == 0) return 1;// Count > 0 i.e. Images need to be uploaded for the application else Count = 0, i.e. Images need not be uploaded in system for the Service.

                SQLCommand = "Select ServiceID, LangID From TrackStatus Where ApplicantID = @AppID";
        
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                Reader = null;

                if (oDataTable == null) return 0;
                if (oDataTable != null && oDataTable.Rows.Count == 0) return 0;

                t_ServiceID = oDataTable.Rows[0]["ServiceID"].ToString();
                t_LangID = oDataTable.Rows[0]["LangID"].ToString();
                
                SQLCommand = "Select Count(1) As Cnt From TrnDocs Where ApplicantID = @AppID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);

                Reader = m_DataBase.ExecuteReader(selectCommand);

                oDataTable = null;

                if (Reader != null)
                {
                    oDataTable = new DataTable();
                    oDataTable.Load(Reader);
                }

                Reader = null;

                if (oDataTable == null) return 0;
                if (oDataTable != null && oDataTable.Rows.Count == 0) return 0;

                t_Count = Convert.ToInt32(oDataTable.Rows[0]["Cnt"].ToString()); // Count of Images uploaded for the application.

                if (t_Count == 0) return 0; // If the images are not uploaded, throw a message

                SQLCommand = "Select Count(1) As Cnt From mstPicsOwner Where ServiceID = @ServiceID And LangID = @LangID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, t_ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@LangID", DbType.AnsiString, t_LangID);

                Reader = m_DataBase.ExecuteReader(selectCommand);

                oDataTable = null;

                if (Reader != null)
                {
                    oDataTable = new DataTable();
                    oDataTable.Load(Reader);
                }

                Reader = null;

                if (oDataTable != null && oDataTable.Rows.Count > 0)
                {
                    t_ImageCount = Convert.ToInt32(oDataTable.Rows[0]["Cnt"].ToString()); // Count of all the Images required to be uploaded for the application.

                    if (t_ImageCount > 0 && t_Count != t_ImageCount)
                        t_Count = 0; // all Images are required to be uploaded for the application.
                }

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

        internal int VerifyDocs(string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "";
                string t_ServiceID = "";
                string t_LangID = "";
                int t_Count = 0, t_ImageCount = 0;

                SQLCommand = "Select Count(1) As Cnt From TrackStatus Where ApplicantID = @AppID And IsIneDistrict = 'Y' ";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                Reader = null;

                if (oDataTable == null) return 0;
                if (oDataTable != null && oDataTable.Rows.Count == 0) return 0;

                t_Count = Convert.ToInt32(oDataTable.Rows[0]["Cnt"].ToString());

                if (t_Count == 0) return 1;//No need to validate as the application is not going to be submitted in eDistrict.

                SQLCommand = "Select Count(1) As Cnt From AttachDocument Where ApplicantID = @AppID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);

                Reader = m_DataBase.ExecuteReader(selectCommand);

                oDataTable = null;

                if (Reader != null)
                {
                    oDataTable = new DataTable();
                    oDataTable.Load(Reader);
                }

                Reader = null;

                if (oDataTable == null) return 0;
                if (oDataTable != null && oDataTable.Rows.Count == 0) return 0;

                t_Count = Convert.ToInt32(oDataTable.Rows[0]["Cnt"].ToString());

                if (t_Count == 0) return 0;
                if (t_Count > 0) return t_Count;

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

        internal string GetVLELocation(string ServiceID, string KioskID, string VLEID, string UNQ)
        {
            string ResultRow;
            DbCommand insertCommand = null;

            insertCommand = DatabaseObject.GetStoredProcCommand("GetVLELocation");
            DatabaseObject.AddInParameter(insertCommand, "@ServiceID", DbType.Int32, ServiceID);
            DatabaseObject.AddInParameter(insertCommand, "@KioskID", DbType.AnsiString, KioskID);
            DatabaseObject.AddInParameter(insertCommand, "@VLEID", DbType.AnsiString, VLEID);
            DatabaseObject.AddInParameter(insertCommand, "@UNQ", DbType.AnsiString, UNQ);

            DatabaseObject.AddOutParameter(insertCommand, "@ReturnLocation", DbType.AnsiString, 100);

            DatabaseObject = DatabaseFactory.CreateDatabase(this.ConnectionString);
            DatabaseObject.ExecuteNonQuery(insertCommand);

            ResultRow = insertCommand.Parameters["@ReturnLocation"].Value.ToString();

            return ResultRow;
        }

        internal DataTable GetApplicantLocation(string ApplicationID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            try
            {
                DbCommand selectCommand;                
                selectCommand = m_DataBase.GetStoredProcCommand("GetAddressDetails");
                m_DataBase.AddInParameter(selectCommand, "@ApplicationID", DbType.AnsiString, ApplicationID);
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
        internal string InsertPGAppRequest(PGAppRequest_DT ObjPGAppRequest_DT, string[] aFields)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            QueryBuilder qb = new QueryBuilder();
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
              selectCommand = qb.GetInsertCommandV3(ObjPGAppRequest_DT, "InsertPGAppRequestSP", aFields);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return  oDataTable.Rows[0]["Result"].ToString();
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        internal string InsertPGAppResponse(PGAppResponse_DT ObjPGAppResponse_DT, string[] aFields)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            QueryBuilder qb = new QueryBuilder();
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = qb.GetInsertCommandV3(ObjPGAppResponse_DT, "InsertPGAppResponseSP", aFields);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable.Rows[0]["Result"].ToString();
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetPaymentSMSData(string AppID, string ServiceID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetPaymentSMSDataSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
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

        internal string InsertSafeXRequest(SafeXPayRequest_DT ObjPGAppRequest_DT, string[] aFields)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            QueryBuilder qb = new QueryBuilder();
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = qb.GetInsertCommandV3(ObjPGAppRequest_DT, "InsertSafeXRequestSP", aFields);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable.Rows[0]["Result"].ToString();
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal string InsertSafeXResponse(SafeXPayResponse_DT ObjPGAppResponse_DT, string[] aFields)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            QueryBuilder qb = new QueryBuilder();
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = qb.GetInsertCommandV3(ObjPGAppResponse_DT, "InsertSafeXResponseSP", aFields);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable.Rows[0]["Result"].ToString();
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataSet InsertSafeXWebhookResponse(string AppID, string OrderNo, string agRef, string pgRef, string txnDate, string Amount)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("InsertSafeXWebhookResponseSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@OrderNo", DbType.AnsiString, OrderNo);
                m_DataBase.AddInParameter(selectCommand, "@pgRef", DbType.AnsiString, pgRef);
                m_DataBase.AddInParameter(selectCommand, "@agRef", DbType.AnsiString, agRef);
                m_DataBase.AddInParameter(selectCommand, "@txnDate", DbType.AnsiString, txnDate);
                m_DataBase.AddInParameter(selectCommand, "@Amount", DbType.AnsiString, Amount);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "SafexpayRequest", "SafexpayWebhook" });
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

        internal DataTable CheckSafexPayStatus(string AppID, string OrderNo, string agRef, string pgRef, string txnDate, string Amount)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CheckSafexPayStatusSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@OrderNo", DbType.AnsiString, OrderNo);
                m_DataBase.AddInParameter(selectCommand, "@pgRef", DbType.AnsiString, pgRef);
                m_DataBase.AddInParameter(selectCommand, "@agRef", DbType.AnsiString, agRef);
                m_DataBase.AddInParameter(selectCommand, "@txnDate", DbType.AnsiString, txnDate);
                m_DataBase.AddInParameter(selectCommand, "@Amount", DbType.AnsiString, Amount);
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
