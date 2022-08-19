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
    internal class EnrollmentDAL : DALBase
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
        internal DataTable SearchStudentEnrollmentSP(string EnrollmentNo, string Name, string MobileNo, DateTime DOB, string Branch)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("SearchStudentEnrollmentSP");
                m_DataBase.AddInParameter(selectCommand, "@EnrollmentNo", DbType.AnsiString, EnrollmentNo);
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
        internal DataTable GetStudentData(string EnrollmentNo, string Branch)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentDataBasedOnEnrollmentNoSP");
                m_DataBase.AddInParameter(selectCommand, "@EnrollmentNo", DbType.AnsiString, EnrollmentNo);
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

        internal DataSet GetStudentDetails(string EnrollmentNo, string Branch)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentDataBasedOnEnrollmentNoSP");
                m_DataBase.AddInParameter(selectCommand, "@EnrollmentNo", DbType.AnsiString, EnrollmentNo);
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

        internal DataTable InsertEnrollmentFormData(EnrollmentData_DT objEnrollmentForm_DT, string[] aFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objEnrollmentForm_DT, "InsertEnrollmentDataSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataSet GetStudentEnrollmentData(string ServiceID, string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetEnrollmentFormDataSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentDataTb", "LastCourseTb", "AdmissionTb", "DOBTb", "DocumentTb", "TransactionTb","TransDetail", "ActionHistory" });
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

        internal DataSet ValidateEnrollmentAge(string CourseCode, string ProgramCode, string Category, string Gender, string Age, string Domicile)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("ValidateEnrollmentAgeSP");
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, CourseCode);
                m_DataBase.AddInParameter(selectCommand, "@ProgramCode", DbType.AnsiString, ProgramCode);
                m_DataBase.AddInParameter(selectCommand, "@Category", DbType.AnsiString, Category);
                m_DataBase.AddInParameter(selectCommand, "@Gender", DbType.AnsiString, Gender);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, Age);
                m_DataBase.AddInParameter(selectCommand, "@Domicile", DbType.AnsiString, Domicile);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AgeTB" });
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

        internal DataTable InsertEnrollmentPartTime(EnrollmentData_DT objEnrollmentForm_DT, string[] aFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objEnrollmentForm_DT, "InsertEnrollmentPartTimeSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataSet GetStudentEnrollmentPartTime(string ServiceID, string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentEnrollmentPartTimeSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentDataTb", "LastCourseTb", "AdmissionTb", "DOBTb", "DocumentTb", "TransactionTb", "TransDetail", "ActionHistory" });
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

        internal DataSet GetEnrollmentDetails(string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetEnrollmentDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                // m_DataBase.AddInParameter(selectCommand, "@SubjectType", DbType.AnsiString, SubjectType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "ApplicationTB", "PhotographTB", "AddressTB", "EducationTB", "AgeTB", "TrackStatus", "TransactionDetail", "ActionHistory" });
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

        internal DataTable UpdateEnrollmentData(EnrollmentData_DT objEnrollmentForm_DT, string[] aFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objEnrollmentForm_DT, "UpdateEnrollmentDataSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }
    }
}
