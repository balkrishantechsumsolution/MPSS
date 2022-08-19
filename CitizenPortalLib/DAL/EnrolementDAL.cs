using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CitizenPortalLib.DataStructs;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace CitizenPortalLib.DAL
{
    internal class EnrolementDAL : DALBase
    {
        Database m_DataBase;

        internal DataTable GetBranchList()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetBranchListSP");
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
        internal DataTable SearchStudentEnrolementSP(string EnrolementNo, string Name, string MobileNo, DateTime DOB, string Branch)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("SearchStudentEnrolementSP");
                m_DataBase.AddInParameter(selectCommand, "@EnrolementNo", DbType.AnsiString, EnrolementNo);
                m_DataBase.AddInParameter(selectCommand, "@Name", DbType.AnsiString, Name);
                m_DataBase.AddInParameter(selectCommand, "@MobileNo", DbType.AnsiString, MobileNo);
                m_DataBase.AddInParameter(selectCommand, "@DOB", DbType.DateTime, DOB);
                m_DataBase.AddInParameter(selectCommand, "@Branch", DbType.AnsiString, Branch);
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
        internal DataTable GetStudentData(string EnrolementNo, string Branch)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentDataBasedOnEnrolementNoSP");
                m_DataBase.AddInParameter(selectCommand, "@EnrolementNo", DbType.AnsiString, EnrolementNo);
                m_DataBase.AddInParameter(selectCommand, "@Branch", DbType.AnsiString, Branch);
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

        internal DataSet GetStudentDetails(string EnrolementNo, string Branch)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentDataBasedOnEnrolementNoSP");
                m_DataBase.AddInParameter(selectCommand, "@EnrolementNo", DbType.AnsiString, EnrolementNo);
                m_DataBase.AddInParameter(selectCommand, "@Branch", DbType.AnsiString, Branch);
                // m_DataBase.AddInParameter(selectCommand, "@SubjectType", DbType.AnsiString, SubjectType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "ApplicationTB" });
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

        internal DataTable InsertEnrolementFormData(EnrolementAdmissionForm_DT objEnrolementForm_DT, string[] aFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objEnrolementForm_DT, "InsertEnrolementFormSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataSet GetStudentEnrolementData(string ServiceID, string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetEnrolementFormDataSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentDataTb", "LastCourseTb", "AdmissionTb", "DOBTb", "DocumentTb", "TransactionTb", "ActionHistory" });
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
