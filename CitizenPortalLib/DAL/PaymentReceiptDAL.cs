using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class PaymentReceiptDAL : DALBase
    {
        Database m_DataBase;

        public PaymentReceiptDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public PaymentReceiptDAL()
            : base()
        {

        }

        static string TableName = "Citizen_RegistrationDetails";
        static string ContactTableName = "trnAddress";
        //static string m_AddressConnectionString = "Address";
        static string m_UsersTableName = "mstUsers";

        internal void InsertAddress(DataStructs.CitizenAddress_DT objContactPerson_DT, string[] AContactFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objContactPerson_DT, ContactTableName, AContactFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal DataSet GetPaymentDetail(string ServiceID, string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetPaymentDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
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

        internal DataSet GenerateQRCodeDegree(string ServiceID, string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetQRCodeDegreeSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
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
        internal int ValidateEmail(string EmailID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select count(EmailID) As EmailCount from Citizen_RegistrationDetails where EmailID = @email_id And IsNull(VerificationCode, '') <> ''";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@email_id", DbType.String, EmailID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                int t_Count = Convert.ToInt32(oDataTable.Rows[0]["EmailCount"].ToString());

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


        internal DataTable GetTransDetail(string TrnID, string KIOSKID, string ServiceID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"SELECT A.RowID, A.channel_id, A.AppID, A.TrnID, A.trans_date, A.service_id, B.SvcName As 'Service Name',B.SvcNameLL, A.paid_status, A.user_type, A.ClosingBalance, A.trans_amt, A.base_amt, A.Portal_serv_Fee, A.misc_charges_01, A.CreatedBy, A.CreatedOn, A.Dept,A.Govt, A.Other, A.Total
                                        from DC_TransactionDetails (NoLock) A Inner Join mstServices B on A.service_id = b.SvcID
                                        where A.TrnID = @TrnID And A.channel_id = @KioskID And B.SvcID = @SvcID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);

                m_DataBase.AddInParameter(selectCommand, "@TrnID", DbType.AnsiString, TrnID);
                m_DataBase.AddInParameter(selectCommand, "@KIOSKID", DbType.AnsiString, KIOSKID);
                m_DataBase.AddInParameter(selectCommand, "@SvcID", DbType.AnsiString, ServiceID);                

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


        internal DataTable GetTransDetailV2(string AppId, string KIOSKID, string ServiceID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"SELECT A.RowID, A.channel_id, A.AppID, A.TrnID, A.trans_date, A.service_id, B.SvcName As 'Service Name',B.SvcNameLL, A.paid_status, A.user_type, A.ClosingBalance, A.trans_amt, A.base_amt, A.Portal_serv_Fee, A.misc_charges_01, A.CreatedBy, A.CreatedOn, A.Dept,A.Govt, A.Other, A.Total
                                        from DC_TransactionDetails (NoLock) A Inner Join mstServices B on A.service_id = b.SvcID
                                        where A.AppID = @TrnID And A.channel_id = @KioskID And B.SvcID = @SvcID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@TrnID", DbType.String, AppId);
                m_DataBase.AddInParameter(selectCommand, "@KIOSKID", DbType.String, KIOSKID);
                m_DataBase.AddInParameter(selectCommand, "@SvcID", DbType.String, ServiceID);
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

        internal DataSet GetApplicationDetail(string ServiceID, string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetApplicationDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
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

        internal DataSet GetStudentDetail(string ServiceID, string RollNo)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
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
    }
}
