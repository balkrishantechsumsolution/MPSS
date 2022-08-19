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

    internal class AttendentSheetDAL : DALBase
    {
        Database m_DataBase;
        int m_TimeOut = 360;

        internal DataSet GetAttendentSheetDetails(string m_BranchCode,string m_CollegeCode,string m_ExamType,string m_ExamYear, string m_Semester, string Range, string m_RollNo, string m_ServiceID, string m_Registration, string m_PrintFlag)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("[GetAttendentSheetDetailSP]");
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, m_BranchCode);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, m_CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, m_ExamType);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, m_ExamYear);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, m_Semester);
                m_DataBase.AddInParameter(selectCommand, "@Range", DbType.AnsiString, Range);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, m_RollNo);
                m_DataBase.AddInParameter(selectCommand, "@SvcID", DbType.AnsiString, m_ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@Registration", DbType.AnsiString, m_Registration);
                m_DataBase.AddInParameter(selectCommand, "@PrintFlag", DbType.AnsiString, m_PrintFlag);

                selectCommand.CommandTimeout = m_TimeOut;
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

        internal DataSet GetAttendentPaperDetails(string m_RollNo, string m_Semester, string m_PrintFlag)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetAttendentPaperDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, m_Semester);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, m_RollNo);
                m_DataBase.AddInParameter(selectCommand, "@PrintFlag", DbType.AnsiString, m_PrintFlag);

                selectCommand.CommandTimeout = m_TimeOut;
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "PaperDetails" });
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

        internal DataSet GetExamCardDetail(string m_BranchCode, string m_CollegeCode, string m_ExamType, string m_ExamYear, string Range, string m_RollNo, string m_ServiceID, string m_Registration, string m_PrintFlag)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetBulkExamCardSP");
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, m_BranchCode);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, m_CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, m_ExamType);
                m_DataBase.AddInParameter(selectCommand, "@AdmissionYear", DbType.AnsiString, m_ExamYear);
                m_DataBase.AddInParameter(selectCommand, "@Range", DbType.AnsiString, Range);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, m_RollNo);
                m_DataBase.AddInParameter(selectCommand, "@PrintFlag", DbType.AnsiString, m_PrintFlag);

                selectCommand.CommandTimeout = m_TimeOut;
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

        internal DataSet GetBulkExamPaperDetail(string m_RollNo, string m_Year, string m_PrintFlag)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetBulkExamPaperDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@AdmissionYear", DbType.AnsiString, m_Year);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, m_RollNo);
                m_DataBase.AddInParameter(selectCommand, "@PrintFlag", DbType.AnsiString, m_PrintFlag);

                selectCommand.CommandTimeout = m_TimeOut;
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "PaperDetail1SEM", "PaperDetail2SEM", "PaperDetail3SEM", "PaperDetail4SEM", "PaperDetail5SEM", "PaperDetail6SEM", "SemLabelDetail" });
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
