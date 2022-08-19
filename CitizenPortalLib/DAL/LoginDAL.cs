using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class LoginDAL : DALBase
    {
        Database m_DataBase;

        public LoginDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public LoginDAL()
            : base()
        {

        }

        static string TablemstUser = "mstUsers";     

        internal DataTable ValidateLogin(string LoginID, string Password)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                //String SQLCommand = "SELECT A.KioskID,A.UserType,A.FullName As KioskName, C.Village_Code, A.PaymentFlag FROM mstUsers A Inner Join DC_RegistrationDetails B On A.KioskID = B.KioskID Inner Join TrnAddress C On B.KeyField = C.ParentKey And C.ChildKey = 'KIOSK' where A.Active = '1' And A.LoginID = @LoginID And A.Password = @Password And A.UserType = 'KIOSK'";
                String SQLCommand = "SELECT * FROM mstUsers Where LoginID = @LoginID And Password = @Password";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.String, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@Password", DbType.String, Password);
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

        internal DataTable GetVillageCode(string KIOSKID, string UserType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "SELECT A.KioskID,A.UserType,A.FullName As KioskName, C.Village_Code, A.PaymentFlag FROM mstUsers A Inner Join DC_RegistrationDetails B On A.KioskID = B.KioskID Inner Join TrnAddress C On B.KeyField = C.ParentKey And C.ChildKey = @UserType where A.Active = '1' And A.KIOSKID = @KIOSKID And A.UserType = @UserType ";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@KIOSKID", DbType.String, KIOSKID);
                m_DataBase.AddInParameter(selectCommand, "@UserType", DbType.String, UserType);
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

        internal DataTable GetKioskDetail(string LoginID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("Login_GetKioskDataSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
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

        internal DataTable GetCitizenDetail(string LoginID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("Login_GetCitizenDataSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
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

        internal DataTable GetG2GDetail(string LoginID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("Login_GetG2GDataSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
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

        internal DataSet GetUserData(string LoginID, string UserType)
        {
            DataSet oDataSet = new DataSet();
            m_DataBase = Factory.Create(this.ConnectionString);

            DbCommand selectCommand;
            selectCommand = m_DataBase.GetStoredProcCommand("Login_GetUserDataSP");
            m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
            m_DataBase.AddInParameter(selectCommand, "@UserType", DbType.AnsiString, UserType);
            oDataSet = m_DataBase.ExecuteDataSet(selectCommand);
            return oDataSet;

        }

        internal string GetPasswordByLoginID(string LoginID, string UserType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("Login_GetPasswordSP");                
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@UserType", DbType.AnsiString, UserType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return (oDataTable.Rows.Count > 0 ? oDataTable.Rows[0][0].ToString() : "");
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }


        internal DataTable ValidateLoginDetail(string LoginID, string CurrentPassword, int Flag)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("ValidateLoginDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@CurrentPassword", DbType.AnsiString, CurrentPassword);
                m_DataBase.AddInParameter(selectCommand, "@Flag", DbType.AnsiString, Flag);
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


        internal DataTable GetChangePasswordDetail(string LoginID, string CurrentPassword, string NewPassword, string UserType,int Flag)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetChangePasswordDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@CurrentPassword", DbType.AnsiString, CurrentPassword);
                m_DataBase.AddInParameter(selectCommand, "@NewPassword", DbType.AnsiString, NewPassword);
                m_DataBase.AddInParameter(selectCommand, "@UserType", DbType.AnsiString, UserType);
                m_DataBase.AddInParameter(selectCommand, "@Flag", DbType.AnsiString, Flag);
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
        internal DataTable GetChangePasswordDetailEncrypt(string LoginID, string CurrentPassword, string NewPassword, string UserType, string NewEncPassword, int Flag)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetChangeEncryptPasswordDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@CurrentPassword", DbType.AnsiString, CurrentPassword);
                m_DataBase.AddInParameter(selectCommand, "@NewPassword", DbType.AnsiString, NewPassword);                
                m_DataBase.AddInParameter(selectCommand, "@NewEncPassword", DbType.AnsiString, NewEncPassword);
                m_DataBase.AddInParameter(selectCommand, "@UserType", DbType.AnsiString, UserType);
                m_DataBase.AddInParameter(selectCommand, "@Flag", DbType.AnsiString, Flag);
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
        internal DataTable GetPassword(string ProfileID, string strCheckOldPassword, string strNewPassword, string UserType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("UserChangePasswordSP");
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, ProfileID);
                m_DataBase.AddInParameter(selectCommand, "@strCheckOldPassword", DbType.AnsiString, strCheckOldPassword);
                m_DataBase.AddInParameter(selectCommand, "@strNewPassword", DbType.AnsiString, strNewPassword);               
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
        internal DataSet UserSaltKeyAndPass(string strLoginUser, int Flag)
        {
            DataSet oDataSet = new DataSet();
            m_DataBase = Factory.Create(this.ConnectionString);

            DbCommand selectCommand;
            selectCommand = m_DataBase.GetStoredProcCommand("GetUserSaltKeyAndPass");
            m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, strLoginUser);
            m_DataBase.AddInParameter(selectCommand, "@Flag", DbType.AnsiString, Flag);
            oDataSet = m_DataBase.ExecuteDataSet(selectCommand);
            return oDataSet;

        }

        internal string GetEncryptPasswordByLoginID(string LoginID, string UserType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("Login_GetPasswordEncryptSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@UserType", DbType.AnsiString, UserType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return (oDataTable.Rows.Count > 0 ? oDataTable.Rows[0][0].ToString() : "");
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        internal DataTable GetChangePasswordDetail(string LoginID, string CurrentPassword, string NewPassword, string UserType, int Flag, string SaltKey)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetChangePasswordDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@CurrentPassword", DbType.AnsiString, CurrentPassword);
                m_DataBase.AddInParameter(selectCommand, "@NewPassword", DbType.AnsiString, NewPassword);
                m_DataBase.AddInParameter(selectCommand, "@UserType", DbType.AnsiString, UserType);
                m_DataBase.AddInParameter(selectCommand, "@Flag", DbType.AnsiString, Flag);
                m_DataBase.AddInParameter(selectCommand, "@SaltKey", DbType.AnsiString, SaltKey);
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
        internal DataTable AuditTrialStatus(string IPAddress, string CreatedBy, string UserID, string Status, string module)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("InsertAuditTrialSP");
                m_DataBase.AddInParameter(selectCommand, "@IPAddress", DbType.AnsiString, IPAddress);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, UserID);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@module", DbType.AnsiString, module);
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

        internal DataSet UserSaltKeyAndPassCSVTU(string strLoginUser, int Flag)
        {
            DataSet oDataSet = new DataSet();
            m_DataBase = Factory.Create(this.ConnectionString);

            DbCommand selectCommand;
            selectCommand = m_DataBase.GetStoredProcCommand("GetUserSaltKeyAndPassCSVTUSP");
            m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, strLoginUser);
            m_DataBase.AddInParameter(selectCommand, "@Flag", DbType.AnsiString, Flag);
            oDataSet = m_DataBase.ExecuteDataSet(selectCommand);
            return oDataSet;

        }

        internal DataTable GetCitizenDetailCSVTU(string LoginID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("Login_GetCitizenDataCSVTUSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
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
