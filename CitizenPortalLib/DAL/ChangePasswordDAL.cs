using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;
using CitizenPortalLib.DataStructs;

namespace CitizenPortalLib.DAL
{
    public class ChangePasswordDAL : DALBase
    {
           Database m_DataBase;
        
        public ChangePasswordDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public ChangePasswordDAL()
            : base()
        {

        }

        static string TableName = "mstUsers";

        internal void UpdatePassword(string Password, string KioskID, string LoginID, string ModifiedBy)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;

                selectCommand = null;
                selectCommand = DatabaseObject.GetSqlStringCommand("UPDATE " + TableName + " SET Password=@Password, ModifiedBy = @ModifiedBy, ModifiedOn = GetDate(), TempPassword=@TempPassword WHERE LoginID = @LoginID And KioskID = @KioskID");
                DatabaseObject.AddInParameter(selectCommand, "@Password", DbType.String, Password);
                DatabaseObject.AddInParameter(selectCommand, "@ModifiedBy", DbType.String, ModifiedBy);                
                DatabaseObject.AddInParameter(selectCommand, "@LoginID", DbType.String, LoginID);
                DatabaseObject.AddInParameter(selectCommand, "@KioskID", DbType.String, KioskID);
                DatabaseObject.AddInParameter(selectCommand, "@TempPassword", DbType.String, "P");                
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

        internal DataTable StudentSearch(string regNo, string dob, string name, string rollno, string father)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GETStudentSearchSp");
                m_DataBase.AddInParameter(selectCommand, "@RegdNo", DbType.AnsiString, regNo);
                m_DataBase.AddInParameter(selectCommand, "@DOB", DbType.AnsiString, dob);
                m_DataBase.AddInParameter(selectCommand, "@Name", DbType.AnsiString, name);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, rollno);
                m_DataBase.AddInParameter(selectCommand, "@Father", DbType.AnsiString, father);
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

        internal DataSet GetStudentDetails(string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentChangePasswordSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "ApplicationTB", "AgeTB" });
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

        internal DataTable InsertPasswordDetail(UpdateStudentPassword_DT data, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(data, "InsertStudentChangePasswordSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

    }
}