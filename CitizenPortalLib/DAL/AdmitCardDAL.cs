using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CitizenPortalLib.DataStructs;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace CitizenPortalLib.DAL
{
    internal class AdmitCardDAL : DALBase
    {
        Database m_DataBase;
        int m_TimeOut = 120;

        internal DataSet GetAdmitCard(string m_ServiceID, string m_RollNo, string m_Semester)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetAdmitCardDetailsSP");
                m_DataBase.AddInParameter(selectCommand, "@SvcID", DbType.AnsiString, m_ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, m_RollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, m_Semester);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails", "SubjectDetails", "TransDetails", "SubjectDT" });
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

        internal DataTable AdmitCardLog(string rollNo, string appId)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("InsertAdmitCardSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, rollNo);
                m_DataBase.AddInParameter(selectCommand, "@AppId", DbType.AnsiString, appId);

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

        internal DataTable GetStudentPaperDetails(string RollNo, string Semester)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentPaperDetailsSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@Flag", DbType.AnsiString, "Select");
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

        internal DataTable GetStudentSubjectList(string RollNo, string AppID, string SubType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentSubjectList");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@SubType", DbType.AnsiString, SubType);
                m_DataBase.AddInParameter(selectCommand, "@Flag", DbType.AnsiString, "Select");
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

        internal DataTable InsertStudentSubject(int RowID, string RollNo, string AppID, string SubCode, string SubValue)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentSubjectList");
                m_DataBase.AddInParameter(selectCommand, "@RowID", DbType.AnsiString, RowID);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, SubCode);
                m_DataBase.AddInParameter(selectCommand, "@SubjectName", DbType.AnsiString, SubValue);
                m_DataBase.AddInParameter(selectCommand, "@Flag", DbType.AnsiString, "Insert");
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

        internal DataTable InsertStudentSubject(string RollNo, string AppID, string SubCode, string SubValue)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentSubjectList");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, SubCode);
                m_DataBase.AddInParameter(selectCommand, "@SubjectName", DbType.AnsiString, SubValue);
                m_DataBase.AddInParameter(selectCommand, "@Flag", DbType.AnsiString, "InsertNew");
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

        internal DataSet EditSubjectDetail(string m_ServiceID, string m_RollNo, string m_Semester)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("EditSubjectDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@SvcID", DbType.AnsiString, m_ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, m_RollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, m_Semester);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails", "SubjectDetails", "TransDetails", "SubjectDT", "SubjectCount" });
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

        internal DataTable InsertEditStudentList(int RowID, string RollNo, string AppID, string OldSubjectCode, string SubCode, string SubValue, string Remark, string CreatedBy, string SubjectType, string Semester, string Session, string ExamType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("UpdateSubjectListSP");
                m_DataBase.AddInParameter(selectCommand, "@RowID", DbType.AnsiString, RowID);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@OldSubjectCode", DbType.AnsiString, OldSubjectCode);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, SubCode);
                m_DataBase.AddInParameter(selectCommand, "@SubjectName", DbType.AnsiString, SubValue);
                m_DataBase.AddInParameter(selectCommand, "@Flag", DbType.AnsiString, "Insert");
                m_DataBase.AddInParameter(selectCommand, "@Remark", DbType.AnsiString, Remark);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@SubType", DbType.AnsiString, SubjectType);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@Session", DbType.AnsiString, Session);
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

        internal DataTable InsertEditStudentListV2(int RowID, string RollNo, string AppID, string OldSubjectCode, string SubCode, string SubValue, string Remark, string CreatedBy, string Semester, string ExamYear, string ExamType, string Session, string Branch, string College, string SubjectType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("UpdateSubjectListSP");
                m_DataBase.AddInParameter(selectCommand, "@RowID", DbType.AnsiString, RowID);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@OldSubjectCode", DbType.AnsiString, OldSubjectCode);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, SubCode);
                m_DataBase.AddInParameter(selectCommand, "@SubjectName", DbType.AnsiString, SubValue);
                m_DataBase.AddInParameter(selectCommand, "@Flag", DbType.AnsiString, "Insert");
                m_DataBase.AddInParameter(selectCommand, "@Remark", DbType.AnsiString, Remark);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@Session", DbType.AnsiString, Session);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, Branch);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, College);
                m_DataBase.AddInParameter(selectCommand, "@SubType", DbType.AnsiString, SubjectType);
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

        internal DataSet GetExaminationCard( string m_RollNo)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetExaminationCardSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, m_RollNo);
                oDataTable = m_DataBase.ExecuteDataSet(selectCommand);
                //if (Reader != null)
                //    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails", "PaperDetail1SEM", "PaperDetail2SEM", "PaperDetail3SEM", "PaperDetail4SEM", "PaperDetail5SEM", "PaperDetail6SEM" });
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

        internal DataSet GetQRStudentDetail(string RollNo)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetQRStudentDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                oDataTable = m_DataBase.ExecuteDataSet(selectCommand);                
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
