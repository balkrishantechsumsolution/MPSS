using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.DAL;

namespace CitizenPortalLib.BLL
{
    public class FacultyModuleBLL : BLLBase
    {
        private FacultyModuleDAL m_FacultyModuleDAL;
        public FacultyModuleBLL()
        {
            m_FacultyModuleDAL = new FacultyModuleDAL();
        }

        public DataTable GetCourseCSVTU(string CollegeCode)
        {
            DataTable t_DT = null;
            t_DT = m_FacultyModuleDAL.GetCourseCSVTU(CollegeCode);
            return t_DT;
        }

        public DataTable GetProgramCSVTU(string CourseCode)
        {
            DataTable t_DT = null;
            t_DT = m_FacultyModuleDAL.GetProgramCSVTU(CourseCode);
            return t_DT;
        }
        public DataTable GetDepartment()
        {
            DataTable t_DT = null;
            t_DT = m_FacultyModuleDAL.GetDepartment();
            return t_DT;
        }

        public DataTable GetCollegeCSVTU()
        {
            DataTable t_CollegeDT = null;

            t_CollegeDT = m_FacultyModuleDAL.GetCollegeCSVTU();

            return t_CollegeDT;
        }

        public DataTable GetReportType()
        {
            DataTable t_CollegeDT = null;

            t_CollegeDT = m_FacultyModuleDAL.GetReportType();

            return t_CollegeDT;
        }

        public DataTable GetSemesterCSVTU(string CourseCode, string ProgramCode)
        {
            DataTable t_DT = null;

            t_DT = m_FacultyModuleDAL.GetSemesterCSVTU(CourseCode, ProgramCode);

            return t_DT;
        }
        public DataTable GetFacultySubjectCSVTU(string CourseCode, string ProgramCode, string Semester, string ExamSession, string SubjectType)
        {
            DataTable t_DT = null;

            t_DT = m_FacultyModuleDAL.GetFacultySubjectCSVTU(CourseCode, ProgramCode, Semester, ExamSession, SubjectType);

            return t_DT;
        }
        public DataTable GetNominateFacultyData(string LoginID, string CollegeCode, string Department, string Coures, string Program, string ExamSession
            , string Semester, string SubjectCode, string Status, string FacultyID)
        {
            DataTable t_DT = null;

            t_DT = m_FacultyModuleDAL.GetNominateFacultyData(LoginID, CollegeCode, Department, Coures,Program, ExamSession
            , Semester, SubjectCode, Status, FacultyID);

            return t_DT;
        }

        public DataTable InsertNominatedFaculty(NominateFaculty_TB obj_DT, string[] AFields)
        {
            return m_FacultyModuleDAL.InsertNominatedFaculty(obj_DT, AFields);
        }
        //LoginID, ddlCourse.SelectedValue, ddlProgram.SelectedValue, ddlSubject.SelectedValue, ddlSession.SelectedValue,ddlSemester.SelectedValue, FromDate, ToDate, Status, ""
        public DataTable GetNominatedFaculty(string LoginID,string DepartmentCode, string CourseCode, string ProgramCode, string SubjectCode, string ExamSession, string Semester, string Status, string AppID)
        {
            DataTable t_DT = null;

            t_DT = m_FacultyModuleDAL.GetNominatedFaculty(LoginID, DepartmentCode, CourseCode, ProgramCode, SubjectCode, ExamSession, Semester, Status, AppID);

            return t_DT;
        }

        public DataTable InsertRecommendedFaculty(NominateFaculty_TB obj_DT, string[] AFields)
        {
            return m_FacultyModuleDAL.InsertRecommendedFaculty(obj_DT, AFields);
        }

        public DataTable GetCollegeReport(string LoginID, string CollegeCode, string Department, string Coures, string Program, string ExamSession
            , string Semester, string SubjectCode, string Status, string RollNo, string ReportType, string ExamType)
        {
            DataTable t_DT = null;

            t_DT = m_FacultyModuleDAL.GetCollegeReport(LoginID, CollegeCode, Department, Coures, Program, ExamSession
            , Semester, SubjectCode, Status, RollNo, ReportType, ExamType);

            return t_DT;
        }

        public DataTable GetUniversityReport(string LoginID, string CollegeCode, string Department, string Coures, string Program, string ExamSession
            , string Semester, string SubjectCode, string Status, string RollNo, string ReportType,string AdmissionYear)
        {
            DataTable t_DT = null;

            t_DT = m_FacultyModuleDAL.GetUniversityReport(LoginID, CollegeCode, Department, Coures, Program, ExamSession
            , Semester, SubjectCode, Status, RollNo, ReportType, AdmissionYear);

            return t_DT;
        }

        public DataTable GetElectiveData(string LoginID, string CollegeCode, string Coures, string Program, string ExamSession
            , string Semester, string SubjectCode, string Status, string RollNo)
        {
            DataTable t_DT = null;

            t_DT = m_FacultyModuleDAL.GetElectiveData(LoginID, CollegeCode, Coures, Program, ExamSession
            , Semester, SubjectCode, Status, RollNo);

            return t_DT;
        }

        public DataTable GetSubjectType(string CourseCode, string ProgramCode, string Semester, string SubjectType)
        {
            DataTable t_DT = null;

            t_DT = m_FacultyModuleDAL.GetSubjectType(CourseCode, ProgramCode, Semester, SubjectType);

            return t_DT;
        }

       

        public DataTable InsertElectiveSubject(string loginID, string CollegeCode, string Coures, string Program, string ExamSession, string Semester, string SubjectCode, string SubjectCode2)
        {
            DataTable t_DT = null;

            t_DT = m_FacultyModuleDAL.InsertElectiveSubject(loginID, CollegeCode, Coures, Program, ExamSession, Semester, SubjectCode, SubjectCode2);

            return t_DT;
        }


        public DataTable GetAcceptance(string LoginID, string DepartmentCode, string CourseCode, string ProgramCode, string SubjectCode, string ExamSession, string Semester, string Status, string AppID)
        {
            DataTable t_DT = null;

            t_DT = m_FacultyModuleDAL.GetAcceptance(LoginID, DepartmentCode, CourseCode, ProgramCode, SubjectCode, ExamSession, Semester, Status, AppID);

            return t_DT;
        }

        public DataSet InsertApprovedFaculty(NominateFaculty_TB obj_DT, string[] AFields)
        {
            return m_FacultyModuleDAL.InsertApprovedFaculty(obj_DT, AFields);
        }

        public DataTable GetEnrollmentData(string LoginID, string CollegeCode, string Department, string Coures, string Program, string ExamSession
            , string Semester, string SubjectCode, string Status, string RollNo, string ReportType, string Category)
        {
            DataTable t_DT = null;

            t_DT = m_FacultyModuleDAL.GetEnrollmentData(LoginID, CollegeCode, Department, Coures, Program, ExamSession
            , Semester, SubjectCode, Status, RollNo, ReportType, Category);

            return t_DT;
        }

        public DataSet GetAppointmentLetter(string LoginID, string RowId)
        {
            return m_FacultyModuleDAL.GetAppointmentLetter(LoginID, RowId);
        }

        public DataTable ApprovalSyetem(string LoginID, string CollegeCode, string Department, string Coures, string Program, string ExamSession
            , string Semester, string SubjectCode, string Status, string RollNo, string ReportType, string ExaamType)
        {
            DataTable t_DT = null;

            t_DT = m_FacultyModuleDAL.ApprovalSyetem(LoginID, CollegeCode, Department, Coures, Program, ExamSession
            , Semester, SubjectCode, Status, RollNo, ReportType,ExaamType);

            return t_DT;
        }

        public DataTable CSVTUMarkEntryData(CSVTUMarkEntry_DT t_CSVTUMarkEntry_DT, string[] aFields)
        {
            return m_FacultyModuleDAL.CSVTUMarkEntryData(t_CSVTUMarkEntry_DT, aFields);
        }

        public DataSet MarkEntrySummaryPrint(string mCollege, string mCours, string mProgram, string mSemester, string mSubject, string mYear, string mType)
        {
            return m_FacultyModuleDAL.MarkEntrySummaryPrint(mCollege, mCours, mProgram, mSemester, mSubject, mYear, mType);
        }

        public DataSet GetAttendanceStudentDetail(string College, string ExamType, string Course, string Program, string t_Year, string Semester, string PaperCode, string RollNo, string SubjectType)
        {
            return m_FacultyModuleDAL.GetAttendanceStudentDetail(College, ExamType, Course, Program, t_Year, Semester, PaperCode, RollNo, SubjectType);
        }

        public DataTable MarkedAttendanceData(MarkAttendance_DT t_MarkAttendance_DT, string[] aFields)
        {
            return m_FacultyModuleDAL.MarkedAttendanceData(t_MarkAttendance_DT, aFields);
        }

        public DataSet AttendanceSummaryPrint(string mCollege, string mCours, string mProgram, string mSemester, string mSubject, string mYear, string mType)
        {
            return m_FacultyModuleDAL.AttendanceSummaryPrint(mCollege, mCours, mProgram, mSemester, mSubject, mYear, mType);
        }

        public DataTable GetCSVTUStudentHistory(string G2GUser, int Department, string FromDate, string ToDate, string RollNo, string RegNo, string CollegeCode, string Course, string Program, string Session)
        {
            return m_FacultyModuleDAL.GetCSVTUStudentHistory(G2GUser, Department, FromDate, ToDate, RollNo, RegNo, CollegeCode, Course, Program, Session);
        }

        public DataTable CSVTUPracticalMarkEntryData(CSVTUMarkEntry_DT t_CSVTUMarkEntry_DT, string[] aFields)
        {
            return m_FacultyModuleDAL.CSVTUPracticalMarkEntryData(t_CSVTUMarkEntry_DT, aFields);
        }

        public DataSet PracticalSummaryPrint(string mCollege, string mCours, string mProgram, string mSemester, string mSubject, string mYear, string mType)
        {
            return m_FacultyModuleDAL.PracticalSummaryPrint(mCollege, mCours, mProgram, mSemester, mSubject, mYear, mType);
        }

        public DataTable GetCBAReport(string LoginID, string CollegeCode, string Coures, string Program, string Status, string RollNo, string ReportType, string DeliveryType, string FromDate, string ToDate)
        {
            DataTable t_DT = null;

            t_DT = m_FacultyModuleDAL.GetCBAReport(LoginID, CollegeCode, Coures, Program,Status, RollNo, ReportType, DeliveryType, FromDate, ToDate);

            return t_DT;
        }

        public DataTable GetCBAActivity(string LoginID, string CollegeCode, string Coures, string Program, string Status, string RollNo, string ReportType, string DeliveryType, string FromDate, string ToDate)
        {
            DataTable t_DT = null;

            t_DT = m_FacultyModuleDAL.GetCBAActivity(LoginID, CollegeCode, Coures, Program, Status, RollNo, ReportType, DeliveryType, FromDate, ToDate);

            return t_DT;
        }

        public DataTable GetElectiveDataSelect(string LoginID, string CollegeCode, string Coures, string Program, string ExamSession
            , string Semester, string SubjectCode, string Status, string RollNo, string ExamType)
        {
            DataTable t_DT = null;

            t_DT = m_FacultyModuleDAL.GetElectiveDataSelect(LoginID, CollegeCode, Coures, Program, ExamSession
            , Semester, SubjectCode, Status, RollNo, ExamType);

            return t_DT;
        }

        public DataTable InsertElectiveSubjectSelect(ElectiveSubject_TB obj_DT, string[] AFields)
        {
            DataTable t_DT = null;

            t_DT = m_FacultyModuleDAL.InsertElectiveSubjectSelect(obj_DT, AFields);

            return t_DT;
        }

        public DataTable GetOfflineExamData(string LoginID, string College, string ExamType, string ExamSession, string Course, string Program, string paymentStatus, string RollNo, string Semester)
        {
            return m_FacultyModuleDAL.GetOfflineExamData(LoginID, College, ExamType, ExamSession, Course,Program, paymentStatus, RollNo, Semester);
        }

        public DataTable GenerateBatch_BulkPay(string Data, string Remarks, string SvcID, string CreatedBy, string BranchName, string ExamType, string Semester, string ExamYear)
        {
            return m_FacultyModuleDAL.GenerateBatch_BulkPay(Data, Remarks, SvcID, CreatedBy, BranchName, ExamType, Semester, ExamYear);
        }

        public DataTable GetNominatedFacultyNew(string LoginID, string DepartmentCode, string CourseCode, string ProgramCode, string SubjectCode, string ExamSession, string Semester, string Status, string FacultyProg, string FacultySubject)
        {
            DataTable t_DT = null;

            t_DT = m_FacultyModuleDAL.GetNominatedFacultyNew(LoginID, DepartmentCode, CourseCode, ProgramCode, SubjectCode, ExamSession, Semester, Status, FacultyProg, FacultySubject);

            return t_DT;
        }
    }
}

