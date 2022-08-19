using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class TopupWalletDAL:DALBase
    {
        Database m_DataBase;

        public TopupWalletDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public TopupWalletDAL()
            : base()
        {

        }

        static string TableName = "WalletBal";
        static string DC_RegistrationDetails = "DC_RegistrationDetails";
        static string LedgerTableName = "DC_Ledger";
        static string TransactionTableName = "DC_TransactionDetails";

        internal DataTable GetCurrentBal(string KOISKID)
        {
            //string Query = "Select * From " + TableName + " Where RowID = " + RowID;
            string Query = @"Select *
                            From " + LedgerTableName + @" 
                            Where channel_id = '" + KOISKID + "'";

            return ExecuteCommand(Query);
        }

        internal DataTable GetDC_RegistrationDetails(string KOISKID)
        {
            //string Query = "Select * From " + TableName + " Where RowID = " + RowID;
            string Query = @"Select *
                            From " + DC_RegistrationDetails + @" 
                            Where KioskID = '" + KOISKID + "'";

            return ExecuteCommand(Query);
        }

        internal string GetSequenceNo()
        {
            string Seq_No = string.Empty;
            string Query = @"Select Max(Convert(int,SequenceNo)) as SequenceNo
                            From " + TableName;

            DataTable dt= ExecuteCommand(Query);
            if (dt.Rows.Count != 0)
            {
                Seq_No = Convert.ToString(dt.Rows[0]["SequenceNo"]);
            }

            return Seq_No;
        }

        internal string GetTrnsSequenceNo()
        {
            string Seq_No = string.Empty;
            string Query = @"Select Max(Convert(int,SequenceNo)) as SequenceNo
                            From " + TransactionTableName;

            DataTable dt = ExecuteCommand(Query);
            if (dt.Rows.Count != 0)
            {
                Seq_No = Convert.ToString(dt.Rows[0]["SequenceNo"]);
            }

            return Seq_No;
        }

        internal DataTable GetDisSubDistCode(string KOISKID)
        {
            string Seq_No = string.Empty;
            string Query = @"select District_Code,Taluka_code from trnaddress TrnAdd inner join DC_RegistrationDetails DCR ON TrnAdd.ParentKey=DCR.KeyField WHERE DCR.KioskID='" + KOISKID + "' and childkey='KIOSK'";

            DataTable dt = ExecuteCommand(Query);

            return dt;
        }

        internal DataTable GetWalletBal(string TrnID)
        {
            //string Query = "Select * From " + TableName + " Where RowID = " + RowID;
            string Query = @"Select *
                            From " + TableName + @" 
                            Where PGTrnID = " + TrnID;

            return ExecuteCommand(Query);
        }

        

        internal int Insert(DataStructs.WalletBal_DT objWalletBal_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objWalletBal_DT, TableName, AFields);

            return ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal void Insert(DataStructs.Transaction_DT objTransaction_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objTransaction_DT, TransactionTableName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal void Update(DataStructs.LedgerTable_DT objLedgerTable_DT, string[] AFields, string[] AFieldsKey)
        {
            int ResultRow;
            DbCommand cmdUpdate;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdUpdate = qb.GetUpdateCommand(objLedgerTable_DT, LedgerTableName, AFields, AFieldsKey);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdUpdate);
        }

        internal void Update(DataStructs.WalletBal_DT objWalletBal_DT, string[] AFields, string[] AFieldsKey)
        {
            int ResultRow;
            DbCommand cmdUpdate;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdUpdate = qb.GetUpdateCommand(objWalletBal_DT, TableName, AFields, AFieldsKey);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdUpdate);
        }
    }
}
