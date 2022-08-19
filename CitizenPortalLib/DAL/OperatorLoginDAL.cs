using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;
using System.Security.Cryptography;
using System.Data.SqlClient;

namespace CitizenPortalLib.DAL
{
    public class OperatorLoginDAL : DALBase
    {
        Database m_DataBase;

        public OperatorLoginDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public OperatorLoginDAL()
            : base()
        {

        }

        static string TablemstUser = "mstUsers";     

        //internal DataTable ValidateLogin(string LoginID, string Password)
        //{
        //    DataTable oDataTable = new DataTable();
        //    IDataReader Reader = null;
        //    m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
        //    try
        //    {
        //        DbCommand selectCommand;
        //        String SQLCommand = "SELECT [LoginID], [KioskID],[UserType],[FullName] As OperatorName FROM [mstUsers] where Active = '1' And LoginID = @LoginID";
        //        selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
        //        m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.String, LoginID);
        //        Reader = m_DataBase.ExecuteReader(selectCommand);
        //        if (Reader != null)
        //            oDataTable.Load(Reader);
        //        return oDataTable;
        //    }
        //    finally
        //    {
        //        if (Reader != null)
        //        {
        //            Reader.Close();
        //        }
        //    }
        //}

        internal DataTable ValidateOperator(string KIOSKID, string LoginID, string Password)
        {
            DataTable oDataTable = new DataTable();
            /*IDataReader Reader = null;
            byte[] PasswordHash;
            using (SHA512Managed sha = new SHA512Managed())
            {
                if (Password != "")
                {
                    byte[] dataToHashNewPwd = Encoding.UTF8.GetBytes(Password);
                    PasswordHash = sha.ComputeHash(dataToHashNewPwd);
                }
                else
                {
                    PasswordHash = null;
                }
            }*/ //hdfkshfdk fsdkfhksk
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {

                //int ResultRow;
                //DbCommand insertCommand = null;

                //insertCommand = DatabaseObject.GetStoredProcCommand("ValidateOperator");
                //DatabaseObject.AddInParameter(insertCommand, "@KIOSKID", DbType.AnsiString, KIOSKID);
                //DatabaseObject.AddInParameter(insertCommand, "@UNQ", DbType.AnsiString, LoginID);
                //DatabaseObject.AddInParameter(insertCommand, "@bPassword", DbType.Binary, PasswordHash);                

                //DatabaseObject = DatabaseFactory.CreateDatabase(this.ConnectionString);
                //ResultRow = DatabaseObject.ExecuteNonQuery(insertCommand);
                //return ResultRow;

                using (SqlConnection conn = new SqlConnection(m_DataBase.ConnectionString))
                {
                    SqlCommand sqlComm = new SqlCommand("ValidateOperator", conn);
                    sqlComm.Parameters.Add("@KIOSKID", SqlDbType.VarChar,50);
                    sqlComm.Parameters["@KIOSKID"].Value = KIOSKID;

                    sqlComm.Parameters.Add("@UNQ", SqlDbType.VarChar, 10);
                    sqlComm.Parameters["@UNQ"].Value = LoginID;

                    sqlComm.Parameters.Add("@strPassword", SqlDbType.VarChar,200);
                    sqlComm.Parameters["@strPassword"].Value = Password;

                    sqlComm.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = sqlComm;
                    da.Fill(oDataTable);
                }

            }
            finally
            {
                //if (Reader != null)
                //{
                //    Reader.Close();
                //}
            }
            return oDataTable;
        }

    }
}
