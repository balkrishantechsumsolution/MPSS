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
   internal class FacultyModuleDAL:DALBase
    {
        Database m_DataBase;
        int m_TimeOut = 12000;
        internal DataTable GetCourseCSVTU(string CollegeCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCourseMasterCSVTUSP");
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
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

        internal DataTable GetProgramCSVTU(string CourseCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetProgramCSVTUSP");
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, CourseCode);
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

        internal DataTable GetDepartment()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetDepartmentSP");
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
        internal DataTable GetReportType()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetReportTypeSP");
                //m_DataBase.AddInParameter(selectCommand, "@ReportType", DbType.AnsiString, ReportType);
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
        internal DataTable GetFacultySubjectCSVTU(string CourseCode, string ProgramCode, string Semester, string ExamSession, string SubjectType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetFacultySubjectCSVTUSP");
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, CourseCode);
                m_DataBase.AddInParameter(selectCommand, "@ProgramCode", DbType.AnsiString, ProgramCode);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamSession", DbType.AnsiString, ExamSession);
                m_DataBase.AddInParameter(selectCommand, "@SubjectType", DbType.AnsiString, SubjectType);
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

        internal DataTable GetSemesterCSVTU(string CourseCode, string ProgramCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetSemesterCSVTUSP");
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, CourseCode);
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


        internal DataTable GetNominateFacultyData(string LoginID, string CollegeCode, string Department, string Coures, string Program, string ExamSession
            , string Semester, string SubjectCode, string Status, string FacultyID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetNominateFacultyDataSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@Program", DbType.AnsiString, Program);
                m_DataBase.AddInParameter(selectCommand, "@Coures", DbType.AnsiString, Coures);
                m_DataBase.AddInParameter(selectCommand, "@ExamSession", DbType.AnsiString, ExamSession);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, SubjectCode);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, FacultyID);

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

        internal DataTable GetCollegeReport(string LoginID, string CollegeCode, string Department, string Coures, string Program, string ExamSession
            , string Semester, string SubjectCode, string Status, string RollNo, string ReportType, string ExamType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCollegeReportSP");
                selectCommand.CommandTimeout = 15000;
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@Program", DbType.AnsiString, Program);
                m_DataBase.AddInParameter(selectCommand, "@Coures", DbType.AnsiString, Coures);
                m_DataBase.AddInParameter(selectCommand, "@ExamSession", DbType.AnsiString, ExamSession);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, SubjectCode);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@ReportType", DbType.AnsiString, ReportType);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);

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

        internal DataTable GetUniversityReport(string LoginID, string CollegeCode, string Department, string Coures, string Program, string ExamSession
            , string Semester, string SubjectCode, string Status, string RollNo, string ReportType, string AdmissionYear)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetUniversityReportSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@Program", DbType.AnsiString, Program);
                m_DataBase.AddInParameter(selectCommand, "@Coures", DbType.AnsiString, Coures);
                m_DataBase.AddInParameter(selectCommand, "@ExamSession", DbType.AnsiString, ExamSession);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, SubjectCode);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@ReportType", DbType.AnsiString, ReportType);
                m_DataBase.AddInParameter(selectCommand, "@AdmissionYear", DbType.AnsiString, AdmissionYear);

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
        internal DataTable InsertNominatedFaculty(NominateFaculty_TB obj_DT, string[] AFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(obj_DT, "InsertNominatedFacultySP", AFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable GetNominatedFaculty(string LoginID, string DepartmentCode, string CourseCode, string ProgramCode, string SubjectCode, string ExamSession, string Semester, string Status, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetNominatedFacultySP");
                m_DataBase.AddInParameter(selectCommand, "@DepartmentCode", DbType.AnsiString, DepartmentCode);
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, CourseCode);
                m_DataBase.AddInParameter(selectCommand, "@ProgramCode", DbType.AnsiString, ProgramCode);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, SubjectCode);
                m_DataBase.AddInParameter(selectCommand, "@ExamSession", DbType.AnsiString, ExamSession);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
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

        internal DataTable InsertRecommendedFaculty(NominateFaculty_TB obj_DT, string[] AFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(obj_DT, "InsertRecommendedFacultySP", AFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable GetElectiveData(string LoginID, string CollegeCode, string Coures, string Program, string ExamSession
            , string Semester, string SubjectCode, string Status, string RollNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetElectiveDataSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@Program", DbType.AnsiString, Program);
                m_DataBase.AddInParameter(selectCommand, "@Coures", DbType.AnsiString, Coures);
                m_DataBase.AddInParameter(selectCommand, "@ExamSession", DbType.AnsiString, ExamSession);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, SubjectCode);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, RollNo);

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

        internal DataTable GetSubjectType(string CourseCode, string ProgramCode, string Semester, string SubjectType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetSubjectbyType");
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, CourseCode);
                m_DataBase.AddInParameter(selectCommand, "@ProgramCode", DbType.AnsiString, ProgramCode);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@SubjectType", DbType.AnsiString, SubjectType);
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

        internal DataTable InsertElectiveSubject(ElectiveSubject_TB obj_DT, string[] AFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(obj_DT, "InsertElectiveSubjectSP", AFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }


        internal DataTable InsertElectiveSubject(string loginID, string collegeCode, string coures, string program, string examSession, string semester, string subjectCode, string subjectCode2)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("InsertElectiveSubjectSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, loginID);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, collegeCode);
                m_DataBase.AddInParameter(selectCommand, "@Program", DbType.AnsiString, program);
                m_DataBase.AddInParameter(selectCommand, "@Coures", DbType.AnsiString, coures);
                m_DataBase.AddInParameter(selectCommand, "@ExamSession", DbType.AnsiString, examSession);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, semester);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, subjectCode);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode2", DbType.AnsiString, subjectCode2);

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

        internal DataTable GetAcceptance(string LoginID, string DepartmentCode, string CourseCode, string ProgramCode, string SubjectCode, string ExamSession, string Semester, string Status, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetFacultyQPSP");
                m_DataBase.AddInParameter(selectCommand, "@DepartmentCode", DbType.AnsiString, DepartmentCode);
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, CourseCode);
                m_DataBase.AddInParameter(selectCommand, "@ProgramCode", DbType.AnsiString, ProgramCode);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, SubjectCode);
                m_DataBase.AddInParameter(selectCommand, "@ExamSession", DbType.AnsiString, ExamSession);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
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

        internal DataSet InsertApprovedFaculty(NominateFaculty_TB obj_DT, string[] AFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(obj_DT, "InsertApprovedFacultySP", AFields);

            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "ApprovedData", "FacultyData", "SubjectData" });

            return oDataTable;
        }

        internal DataTable GetEnrollmentData(string LoginID, string CollegeCode, string Department, string Coures, string Program, string ExamSession
           , string Semester, string SubjectCode, string Status, string RollNo, string ReportType, string Category)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetEnrollmentDataSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@Program", DbType.AnsiString, Program);
                m_DataBase.AddInParameter(selectCommand, "@Coures", DbType.AnsiString, Coures);
                m_DataBase.AddInParameter(selectCommand, "@ExamSession", DbType.AnsiString, ExamSession);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, SubjectCode);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@ReportType", DbType.AnsiString, ReportType);
                m_DataBase.AddInParameter(selectCommand, "@Category", DbType.AnsiString, Category);

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

        internal DataSet GetAppointmentLetter(string LoginID, string RowId)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetAppointmentLetterSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@RowId", DbType.AnsiString, RowId);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "FacultyData", "SubjectData" });
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

        internal DataTable ApprovalSyetem(string LoginID, string CollegeCode, string Department, string Coures, string Program, string ExamSession
           , string Semester, string SubjectCode, string Status, string RollNo, string ReportType, string ExaamType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetApprovalDataSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@Program", DbType.AnsiString, Program);
                m_DataBase.AddInParameter(selectCommand, "@Coures", DbType.AnsiString, Coures);
                m_DataBase.AddInParameter(selectCommand, "@ExamSession", DbType.AnsiString, ExamSession);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, SubjectCode);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@ReportType", DbType.AnsiString, ReportType);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExaamType);
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

        internal DataTable CSVTUMarkEntryData(CSVTUMarkEntry_DT t_CSVTUMarkEntry_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(t_CSVTUMarkEntry_DT, "InsertMarkEntryCSVTUSP", aFields);
            cmdInsert.CommandTimeout = 12000;
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataSet MarkEntrySummaryPrint(string mCollege, string mCourse, string mProgram, string mSemester, string mSubject, string mYear, string mType)
        {
            DataSet oDataSet = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetEnteredMarkSummarySP");
                selectCommand.CommandTimeout = m_TimeOut;
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, mCollege);
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, mCourse);
                m_DataBase.AddInParameter(selectCommand, "@ProgramCode", DbType.AnsiString, mProgram);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, mType);
                m_DataBase.AddInParameter(selectCommand, "@ExamSession", DbType.AnsiString, mYear);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, mSubject);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, mSemester);
                Reader = m_DataBase.ExecuteReader(selectCommand);

                if (Reader != null)
                    oDataSet.Load(Reader, LoadOption.OverwriteChanges, new string[] { "Table1", "Table2", "Table3", "Table4" });
                return oDataSet;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataSet GetAttendanceStudentDetail(string College, string ExamType, string Course, string Program, string t_Year, string Semester, string PaperCode, string RollNo, string SubjectType)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetAttendanceStudentDetailSP");
                selectCommand.CommandTimeout = m_TimeOut;
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, College);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, Course);
                m_DataBase.AddInParameter(selectCommand, "@ProgramCode", DbType.AnsiString, Program);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, t_Year);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, PaperCode);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@SubjectType", DbType.AnsiString, SubjectType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "Table1", "Table2", "Table3", "Table4" });
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

        internal DataTable MarkedAttendanceData(MarkAttendance_DT t_MarkAttendance_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(t_MarkAttendance_DT, "InsertAttendanceDataSP", aFields);
            cmdInsert.CommandTimeout = 12000;
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataSet AttendanceSummaryPrint(string mCollege, string mCourse, string mProgram, string mSemester, string mSubject, string mYear, string mType)
        {
            DataSet oDataSet = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetAttendanceSummarySP");
                selectCommand.CommandTimeout = m_TimeOut;
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, mCollege);
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, mCourse);
                m_DataBase.AddInParameter(selectCommand, "@ProgramCode", DbType.AnsiString, mProgram);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, mType);
                m_DataBase.AddInParameter(selectCommand, "@ExamSession", DbType.AnsiString, mYear);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, mSubject);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, mSemester);
                Reader = m_DataBase.ExecuteReader(selectCommand);

                if (Reader != null)
                    oDataSet.Load(Reader, LoadOption.OverwriteChanges, new string[] { "Table1", "Table2", "Table3", "Table4" });
                return oDataSet;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetCSVTUStudentHistory(string G2GUser, int Department, string FromDate, string ToDate, string RollNo, string RegNo, string CollegeCode, string Course, string Program, string Session)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentDetailsSP");
                selectCommand.CommandTimeout = 15 * 60;
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@RegNo", DbType.AnsiString, RegNo);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@ProgramCode", DbType.AnsiString, Program);
                m_DataBase.AddInParameter(selectCommand, "@Session", DbType.AnsiString, Session);
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, Course);
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

        internal DataTable CSVTUPracticalMarkEntryData(CSVTUMarkEntry_DT t_CSVTUMarkEntry_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(t_CSVTUMarkEntry_DT, "InsertPracticalMarkCSVTUSP", aFields);
            cmdInsert.CommandTimeout = 12000;
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataSet PracticalSummaryPrint(string mCollege, string mCourse, string mProgram, string mSemester, string mSubject, string mYear, string mType)
        {
            DataSet oDataSet = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("PracticalSummaryPrintSP");
                selectCommand.CommandTimeout = m_TimeOut;
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, mCollege);
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, mCourse);
                m_DataBase.AddInParameter(selectCommand, "@ProgramCode", DbType.AnsiString, mProgram);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, mType);
                m_DataBase.AddInParameter(selectCommand, "@ExamSession", DbType.AnsiString, mYear);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, mSubject);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, mSemester);
                Reader = m_DataBase.ExecuteReader(selectCommand);

                if (Reader != null)
                    oDataSet.Load(Reader, LoadOption.OverwriteChanges, new string[] { "Table1", "Table2", "Table3", "Table4" });
                return oDataSet;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetCBAReport(string LoginID, string CollegeCode, string Coures, string Program, string Status, string RollNo, string ReportType, string DeliveryType, string FromDate, string ToDate)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCBAReportSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@Program", DbType.AnsiString, Program);
                m_DataBase.AddInParameter(selectCommand, "@Coures", DbType.AnsiString, Coures);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@ReportType", DbType.AnsiString, ReportType);
                m_DataBase.AddInParameter(selectCommand, "@DeliveryType", DbType.AnsiString, DeliveryType);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
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

        internal DataTable GetElectiveDataSelect(string LoginID, string CollegeCode, string Coures, string Program, string ExamSession
            , string Semester, string SubjectCode, string Status, string RollNo, string ExamType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetElectiveDataSelectSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@Program", DbType.AnsiString, Program);
                m_DataBase.AddInParameter(selectCommand, "@Coures", DbType.AnsiString, Coures);
                m_DataBase.AddInParameter(selectCommand, "@ExamSession", DbType.AnsiString, ExamSession);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, SubjectCode);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);

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

        internal DataTable InsertElectiveSubjectSelect(ElectiveSubject_TB obj_DT, string[] AFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(obj_DT, "InsertElectiveSubjectSelectSP", AFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable InsertElectiveSubjectSelectNew(ElectiveSubject_TB obj_DT, string[] AFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(obj_DT, "InsertElectiveSubjectSelectNewSP", AFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }
        internal DataTable GetOfflineExamData(string LoginID, string College, string ExamType, string ExamSession, string Course, string Program, string paymentStatus, string RollNo, string Semester)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetOfflineExamDataSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, College);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@ExamSession", DbType.AnsiString, ExamSession);
                m_DataBase.AddInParameter(selectCommand, "@Course", DbType.AnsiString, Course);
                m_DataBase.AddInParameter(selectCommand, "@Program", DbType.AnsiString, Program);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, paymentStatus);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
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

        internal DataTable GenerateBatch_BulkPay(string Data, string Remarks, string SvcID, string CreatedBy, string BranchName, string ExamType, string Semester, string ExamYear)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GenerateBatchBulkPaySP");
                m_DataBase.AddInParameter(selectCommand, "@Data", DbType.AnsiString, Data);
                m_DataBase.AddInParameter(selectCommand, "@Remarks", DbType.AnsiString, Remarks);
                m_DataBase.AddInParameter(selectCommand, "@ServiceId", DbType.AnsiString, SvcID);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@BranchName", DbType.AnsiString, BranchName);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);
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

        internal DataTable GetNominatedFacultyNew(string LoginID, string DepartmentCode, string CourseCode, string ProgramCode, string SubjectCode, string ExamSession, string Semester, string Status, string FacultyProg, string FacultySubject)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetNominatedFacultyNewSP");
                m_DataBase.AddInParameter(selectCommand, "@DepartmentCode", DbType.AnsiString, DepartmentCode);
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, CourseCode);
                m_DataBase.AddInParameter(selectCommand, "@ProgramCode", DbType.AnsiString, ProgramCode);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, SubjectCode);
                m_DataBase.AddInParameter(selectCommand, "@ExamSession", DbType.AnsiString, ExamSession);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@FacultyProgram", DbType.AnsiString, FacultyProg);
                m_DataBase.AddInParameter(selectCommand, "@FacultySubject", DbType.AnsiString, FacultySubject);
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

        internal DataTable GetCBAActivity(string LoginID, string CollegeCode, string Coures, string Program, string Status, string RollNo, string ReportType, string DeliveryType, string FromDate, string ToDate)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCBAActivitySP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@Program", DbType.AnsiString, Program);
                m_DataBase.AddInParameter(selectCommand, "@Coures", DbType.AnsiString, Coures);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@ReportType", DbType.AnsiString, ReportType);
                m_DataBase.AddInParameter(selectCommand, "@DeliveryType", DbType.AnsiString, DeliveryType);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
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
