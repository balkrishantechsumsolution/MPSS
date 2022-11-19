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
    internal class StudentResultDAL : DALBase
    {
        Database m_DataBase;
        int m_TimeOut = 20000;

        internal DataTable GetStudentData(string StudentResultNo, string Branch)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentDataBasedOnStudentResultNoSP");
                m_DataBase.AddInParameter(selectCommand, "@StudentResultNo", DbType.AnsiString, StudentResultNo);
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

        internal DataSet GetStudentDetails(string StudentResultNo, string Branch)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentDataBasedOnStudentResultNoSP");
                m_DataBase.AddInParameter(selectCommand, "@StudentResultNo", DbType.AnsiString, StudentResultNo);
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
                
        internal DataSet Resultdetails(string rollNo, string semester, string examType, string examYear)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetResultData");
                selectCommand.CommandTimeout = m_TimeOut;
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, rollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, examYear);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, examType);
                Reader = m_DataBase.ExecuteReader(selectCommand);

                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentResult" });
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

        internal DataSet BacklogResultdetails(string rollNo, string semester, string examType, string examYear)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetResultBacklogStudnts");
                selectCommand.CommandTimeout = m_TimeOut;
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, rollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, examYear);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, examType);
                Reader = m_DataBase.ExecuteReader(selectCommand);

                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentResult" });
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
        internal DataTable GetStudentCalCPi(string RollNo, string Semester, string ExamSession)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("SP_GetCPINEW");
                selectCommand.CommandTimeout = m_TimeOut;
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamSession);
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

        internal DataTable GetStudentResultData(string Rollno, string Semester, string ExamYear, string ExamType, string Result)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentResultDataSP");
                selectCommand.CommandTimeout = m_TimeOut;
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, Rollno);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@Result", DbType.AnsiString, Result);
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

        internal DataSet GetStudentSemesterResultData(string RollNo, string ExamYear, string ExamType, string Semester)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentSemesterResultSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentDetail","SubjectDetailRegular", "SubjectDetailBacklog", "SubjectDetailAGBacklog", "PaymentDetail" });
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

        internal DataTable GetStudentBasicInfo(string Rollno)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentBasicInfoSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, Rollno);
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

        internal DataSet ResultBacklogStudent(string rollNo, string semester, string examType, string examYear)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentDetailsBacklog_SP");
                selectCommand.CommandTimeout = m_TimeOut;
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, rollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, examYear);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, examType);
                Reader = m_DataBase.ExecuteReader(selectCommand);

                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentResult" });
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

        internal DataSet ResultStudent(string rollNo, string semester, string examType, string examYear)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentDetailsEligible_SP");
                selectCommand.CommandTimeout = m_TimeOut;
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, rollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, examYear);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, examType);
                Reader = m_DataBase.ExecuteReader(selectCommand);

                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentResult" });
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

        internal DataSet ResultPassFailStudent(string rollNo, string semester, string examType, string examYear)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetPassFailResultDetails");
                selectCommand.CommandTimeout = m_TimeOut;
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, rollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, examYear);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, examType);
                Reader = m_DataBase.ExecuteReader(selectCommand);

                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentResult" });
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

        internal DataTable StudentResultData(string College, string CourseCode, string ProgramCode, string RollNo, string t_Year, string ExamType, string Semester)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("StudentResultDataSP");
                selectCommand.CommandTimeout = m_TimeOut;
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, t_Year);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, College);
                m_DataBase.AddInParameter(selectCommand, "@Course", DbType.AnsiString, CourseCode);
                m_DataBase.AddInParameter(selectCommand, "@ProgramCode", DbType.AnsiString, ProgramCode);
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

        internal DataSet CgpaValuecheck(string rollNo, string semester, string examType, string examYear, string EnrollmentNo, string cgpa)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CheckifExists");
                selectCommand.CommandTimeout = m_TimeOut;
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, rollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, examYear);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, examType);
                m_DataBase.AddInParameter(selectCommand, "@Enrollment", DbType.AnsiString, EnrollmentNo);
                m_DataBase.AddInParameter(selectCommand, "@CGPA", DbType.AnsiString, cgpa);
                Reader = m_DataBase.ExecuteReader(selectCommand);

                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentResult" });
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

        internal DataSet CgpaValueInsert(string RollNo, string semester, string examType, string examYear, string EnrollmentNo, string CGPA, string Createdon)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("InsertCGPA");
                selectCommand.CommandTimeout = m_TimeOut;
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, examYear);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, examType);
                m_DataBase.AddInParameter(selectCommand, "@Enrollment", DbType.AnsiString, EnrollmentNo);
                m_DataBase.AddInParameter(selectCommand, "@CPI", DbType.AnsiString, CGPA);
                m_DataBase.AddInParameter(selectCommand, "@CreatedOn", DbType.DateTime, Createdon);
                Reader = m_DataBase.ExecuteReader(selectCommand);

                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentResult" });
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

        internal DataTable GetCollegeCSVTU()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCollegeCSVTUSP");
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

        internal DataTable GetCourseCSVTU()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCourseMasterCSVTUSP");
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

        internal DataSet GetAttendentSheetDetails(string m_coursecode, string m_CollegeCode, string m_Semester, string m_ExamType, string m_ExamYear, string Range, string m_RollNo, string nextset)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentDetailsEligible_MarksheetSP");
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, m_coursecode);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, m_CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, m_Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, m_ExamType);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, m_ExamYear);
                m_DataBase.AddInParameter(selectCommand, "@rollno", DbType.AnsiString, m_RollNo);
                m_DataBase.AddInParameter(selectCommand, "@OffSet", DbType.AnsiString, Range);
                m_DataBase.AddInParameter(selectCommand, "@NextSet", DbType.AnsiString, nextset);
                //m_DataBase.AddInParameter(selectCommand, "@PrintFlag", DbType.AnsiString, m_PrintFlag);

                // selectCommand.CommandTimeout = m_TimeOut;
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentResult" });
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

        internal DataSet GetResultData(string m_RollNo, string m_Semester, string m_ExamType, string m_ExamYear)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetResultData_Marksheet");
                m_DataBase.AddInParameter(selectCommand, "@rollno", DbType.AnsiString, m_RollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, m_Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, m_ExamType);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, m_ExamYear);
                //m_DataBase.AddInParameter(selectCommand, "@OffSet", DbType.AnsiString, Range);
                //m_DataBase.AddInParameter(selectCommand, "@NextSet", DbType.AnsiString, nextset);
                // selectCommand.CommandTimeout = m_TimeOut;
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentResult" });
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

        internal DataSet GetAggregareDetetails(string m_RollNo, string m_Semester, string m_ExamYear, string m_ExamType)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetResultDetails");
                m_DataBase.AddInParameter(selectCommand, "@rollno", DbType.AnsiString, m_RollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, m_Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, m_ExamYear);
                m_DataBase.AddInParameter(selectCommand, "@Examtype", DbType.AnsiString, m_ExamType);
                //m_DataBase.AddInParameter(selectCommand, "@OffSet", DbType.AnsiString, Range);
                //m_DataBase.AddInParameter(selectCommand, "@NextSet", DbType.AnsiString, nextset);
                // selectCommand.CommandTimeout = m_TimeOut;
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentResult" });
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

        internal DataSet GetQRCode(string m_RollNo, string m_Semester, string m_ExamType, string m_ExamYear)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("Get_QRCodeMarksheetvalues");
                m_DataBase.AddInParameter(selectCommand, "@rollno", DbType.AnsiString, m_RollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, m_Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, m_ExamYear);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, m_ExamType);
                // selectCommand.CommandTimeout = m_TimeOut;
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentResult" });
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

        internal DataSet GetTotalBox(string m_RollNo)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetTotalSemestersObtSP");
                m_DataBase.AddInParameter(selectCommand, "@rollno", DbType.AnsiString, m_RollNo);
                // selectCommand.CommandTimeout = m_TimeOut;
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentResult" });
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
