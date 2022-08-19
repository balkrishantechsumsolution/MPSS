using CitizenPortalLib.DataStructs;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    internal class OTPDAL : DALBase
    {
        private Database m_DataBase;

        internal DataTable InsertOTP(OTP_DT objOTP_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objOTP_DT, "InsertOTPSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable GetUIDJSon(string UID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetUIDJSonSP");
                m_DataBase.AddInParameter(selectCommand, "@UID", DbType.AnsiString, UID);
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

        internal DataTable ValidateOTP(OTP_DT objOTP_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objOTP_DT, "ValidateOTPSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable ValidateMobile(string MobileNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("ValidateMobileSP");
                m_DataBase.AddInParameter(selectCommand, "@Mobile", DbType.AnsiString, MobileNo);
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

        internal DataTable GetCitizenProfile(string MobileNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCitizenUIDJSonSP");
                m_DataBase.AddInParameter(selectCommand, "@UID", DbType.AnsiString, MobileNo);
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

        internal void History(string profileid, string Newpassword, string mobile, string otp)
        {
            string mobileNumber = "", email = "";
            DataTable dt = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                int NumLen = mobile.ToString().Length;
                if (NumLen == 10)
                {
                    mobileNumber = mobile;
                }
                else
                {
                    email = mobile;
                }
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("ForgetPasswordSP");
                m_DataBase.AddInParameter(selectCommand, "@profileid", DbType.AnsiString, profileid);
                m_DataBase.AddInParameter(selectCommand, "@mobile", DbType.AnsiString, mobileNumber);
                m_DataBase.AddInParameter(selectCommand, "@emailid", DbType.AnsiString, email);
                m_DataBase.AddInParameter(selectCommand, "@NewPassword", DbType.AnsiString, Newpassword);
                m_DataBase.AddInParameter(selectCommand, "@otp", DbType.AnsiString, otp);

                m_DataBase.ExecuteReader(selectCommand);
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal void ForgetPasswordHistory(string ProfileID, string newPassword, string Mobile, string Otp, string UType)
        {
            string mobileNumber = "", email = "";
            DataTable dt = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                int NumLen = Mobile.ToString().Length;
                if (NumLen == 10)
                {
                    mobileNumber = Mobile;
                }
                else
                {
                    email = Mobile;
                }
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("SendForgetPasswordSP");
                m_DataBase.AddInParameter(selectCommand, "@profileid", DbType.AnsiString, ProfileID);
                m_DataBase.AddInParameter(selectCommand, "@mobile", DbType.AnsiString, mobileNumber);
                m_DataBase.AddInParameter(selectCommand, "@emailid", DbType.AnsiString, email);
                m_DataBase.AddInParameter(selectCommand, "@NewPassword", DbType.AnsiString, newPassword);
                m_DataBase.AddInParameter(selectCommand, "@otp", DbType.AnsiString, Otp);
                m_DataBase.AddInParameter(selectCommand, "@UType", DbType.AnsiString, UType);

                m_DataBase.ExecuteReader(selectCommand);
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable SendSMSOnUserMobile(OTP_DT objOTP_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objOTP_DT, "ValidateMobileOTPSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        //
        internal DataTable InsertMobileOTP(OTP_DT objOTP_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objOTP_DT, "InsertMobileOTPSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        //
        internal DataTable InsertCitizenOTP(OTP_DT objOTP_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objOTP_DT, "InsertCitizenOTPSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable GetCitizenUIDJSon(string MobileNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCitizenUIDJSonSP");
                m_DataBase.AddInParameter(selectCommand, "@UID", DbType.AnsiString, MobileNo);
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

        internal DataTable ValidateCitizenOTP(OTP_DT objOTP_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objOTP_DT, "ValidateCitizenOTPSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetOTPDataSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails", "TransDetails" });
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

        internal DataTable ValidateOUATOTP(OTP_DT objOTP_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objOTP_DT, "ValidateOUATOTPSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable ValidateAgroOUATOTP(OTP_DT objOTP_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objOTP_DT, "ValidateAgroOUATOTPSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }
    }
}