using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using CitizenPortalLib.DataStructs;

namespace CitizenPortalLib.DAL
{
    public class CitizenRegistrationDAL : DALBase
    {
        Database m_DataBase;

        public CitizenRegistrationDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public CitizenRegistrationDAL()
            : base()
        {

        }

        static string TableName = "Citizen_RegistrationDetails";
        static string ContactTableName = "trnAddress";
        //static string m_AddressConnectionString = "Address";
        static string m_UsersTableName = "mstUsers";

        internal void Insert(DataStructs.CitizenRegistration_DT objCitizenRegistration_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objCitizenRegistration_DT, TableName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal void InsertAddress(DataStructs.CitizenAddress_DT objContactPerson_DT, string[] AContactFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objContactPerson_DT, ContactTableName, AContactFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal DataSet GetUserDetail(string m_UserID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetUserDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, m_UserID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails" });
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

        internal int CitizenShortRegistration(DataStructs.CitizenRegistration_DT objCitizenRegistration_DT)
        {
            int strResult = 1;
            DataSet ds = new DataSet();
            SqlConnection obSqlConnection = null;
            SqlCommand obSqlCommand = null;
            string Param = "<ROOT><ROW UserID='" + objCitizenRegistration_DT.UserID + "' FirstName='" + objCitizenRegistration_DT.FirstName + "' LastName='" + objCitizenRegistration_DT.LastName + "' MobileNo='" + objCitizenRegistration_DT.MobileNo + "' EmailID='" + objCitizenRegistration_DT.EmailID + "' AadharNo='" + objCitizenRegistration_DT.AadharNo + "' Password='" + objCitizenRegistration_DT.Password + "' /></ROOT>";

            try
            {

                obSqlConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings[this.ConnectionString].ToString());
                obSqlConnection.Open();

                obSqlCommand = new SqlCommand();
                obSqlCommand.Connection = obSqlConnection;

                obSqlCommand.Parameters.Add("@Flag", SqlDbType.VarChar);
                obSqlCommand.Parameters["@Flag"].Value = "CitizenShortRegistration";

                obSqlCommand.Parameters.Add("@Param", SqlDbType.NVarChar);
                obSqlCommand.Parameters["@Param"].Value = Param;


                obSqlCommand.CommandText = "CitizenDetails";
                obSqlCommand.CommandType = CommandType.StoredProcedure;

                strResult = Convert.ToInt32(obSqlCommand.ExecuteScalar());
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                obSqlConnection.Close();
            }

            return strResult;
        }

        internal int checkUserID(string userID)
        {
            int strResult = 1;
            DataSet ds = new DataSet();
            SqlConnection obSqlConnection = null;
            SqlCommand obSqlCommand = null;
            string Param = "<ROOT><ROW UserID='" + userID + "' /></ROOT>";


            try
            {

                obSqlConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings[this.ConnectionString].ToString());
                obSqlConnection.Open();

                obSqlCommand = new SqlCommand();
                obSqlCommand.Connection = obSqlConnection;

                obSqlCommand.Parameters.Add("@Flag", SqlDbType.VarChar);
                obSqlCommand.Parameters["@Flag"].Value = "CheckUserID";

                obSqlCommand.Parameters.Add("@Param", SqlDbType.NVarChar);
                obSqlCommand.Parameters["@Param"].Value = Param;


                obSqlCommand.CommandText = "CitizenDetails";
                obSqlCommand.CommandType = CommandType.StoredProcedure;

                strResult = Convert.ToInt32(obSqlCommand.ExecuteScalar());
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                obSqlConnection.Close();
            }

            return strResult;
        }

        internal DataSet GetUIDDetail(string UID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetUIDDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@UID", DbType.AnsiString, UID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails" });
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

        internal DataTable CheckMobileNo(string MobileNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetMobileCountSP");
                m_DataBase.AddInParameter(selectCommand, "@MobileNo", DbType.AnsiString, MobileNo);
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

        internal string GenerateID(DataStructs.CitizenRegistration_DT objCitizenRegistration_DT)
        {
            string t_CitizenID = "";
            string t_SeqNo = "";
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select SeqNo From GetCitizenID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                t_SeqNo = oDataTable.Rows[0]["SeqNo"].ToString();
                t_CitizenID = t_SeqNo;

                selectCommand = null;
                selectCommand = DatabaseObject.GetSqlStringCommand("UPDATE " + TableName + " SET CitizenID=@CitizenID WHERE KeyField=@KeyField");
                DatabaseObject.AddInParameter(selectCommand, "@CitizenID", DbType.String, t_CitizenID);
                DatabaseObject.AddInParameter(selectCommand, "@KeyField", DbType.String, objCitizenRegistration_DT.KeyField);
                int count = (int)DatabaseObject.ExecuteNonQuery(selectCommand);

                return t_CitizenID;
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

        internal DataTable InsertLoginDetail(LoginDetail_DT objLoginDetail_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objLoginDetail_DT, "InsertLoginDetailSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable CheckLoginAvability(string userId)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCitizeLoginCountSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginId", DbType.AnsiString, userId);
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

        internal int ValidateEmail(string EmailID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select count(loginID) As EmailCount from mstUsers where LoginID = @email_id";
                //Select count(EmailID) As EmailCount from Citizen_RegistrationDetails where EmailID = @email_id And IsNull(VerificationCode, '') <> ''";
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


        internal void InsertCitizen(DataStructs.CitizenUsers_DT UserDetails, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(UserDetails, m_UsersTableName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal void QuickAccess(DataStructs.CitizenRegistration_DT objCitizenRegistration_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objCitizenRegistration_DT, TableName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal DataTable GetCitizenDetail(string EmailID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select * from Citizen_RegistrationDetails where EmailID = @email_id";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@email_id", DbType.String, EmailID);

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

        internal DataTable GetUserDetail(string LoginID, string RegType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select * from mstUsers where UserType = 'Citizen' and LoginID = @LoginID And RegistrationType = @RegType";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.String, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@RegType", DbType.String, RegType);
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

        internal void UpdateCitizen(DataStructs.CitizenRegistration_DT objCitizenRegistration_DT, string[] AFields, string[] ACitizen)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetUpdateCommand(objCitizenRegistration_DT, TableName, AFields, ACitizen);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal void UpdateUser(DataStructs.CitizenUsers_DT objCitizenUser_DT, string[] AUsersUpdateFields, string[] AUser)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetUpdateCommand(objCitizenUser_DT, m_UsersTableName, AUsersUpdateFields, AUser);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal DataSet GetG2GUserDetail(string m_UserID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetG2GUserDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, m_UserID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails" });
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
