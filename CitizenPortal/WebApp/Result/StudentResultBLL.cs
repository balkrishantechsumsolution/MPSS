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
    public class StudentResultBLL : BLLBase
    {
        private StudentResultDAL m_StudentResultDAL;
        public StudentResultBLL()
        {
            m_StudentResultDAL = new StudentResultDAL();
        }

        

        public DataTable GetStudentResultData(string Rollno, string Semester, string ExamYear, string ExamType, string Result)
        {
            DataTable t_DT = null;

            t_DT = m_StudentResultDAL.GetStudentResultData(Rollno, Semester, ExamYear, ExamType, Result);

            return t_DT;
        }

        public DataTable GetStudentBasicInfo(string Rollno)
        {
            DataTable t_DT = null;

            t_DT = m_StudentResultDAL.GetStudentBasicInfo(Rollno);

            return t_DT;
        }

        public DataSet GetStudentResultDetail(string RollNo, string ExamYear, string ExamType, string Semester)
        {
            DataSet t_DS = null;

            t_DS = m_StudentResultDAL.GetStudentSemesterResultData(RollNo, ExamYear, ExamType, Semester);

            return t_DS;
        }

        public DataTable GetStudentCalCPi(string RollNo, string Semester, string ExamSession)
        {
            DataTable t_DT = null;

            t_DT = m_StudentResultDAL.GetStudentCalCPi(RollNo, Semester, ExamSession);

            return t_DT;
        }

        public DataSet Resultdetails(string RollNo, string Semester, string ExamType, string ExamYear)
        {
            DataSet t_DS = null;

            t_DS = m_StudentResultDAL.Resultdetails(RollNo, Semester, ExamType, ExamYear);

            return t_DS;
        }

        public DataSet BacklogResultdetails(string RollNo, string Semester, string ExamType, string ExamYear)
        {
            DataSet t_DS = null;

            t_DS = m_StudentResultDAL.BacklogResultdetails(RollNo, Semester, ExamType, ExamYear);

            return t_DS;
        }

        public DataSet ResultBacklogStudent(string RollNo, string Semester, string ExamType, string ExamYear)
        {
            DataSet t_DS = null;

            t_DS = m_StudentResultDAL.ResultBacklogStudent(RollNo, Semester, ExamType, ExamYear);

            return t_DS;
        }

        public DataSet ResultPassFail(string RollNo, string Semester, string ExamType, string ExamYear)
        {
            DataSet t_DS = null;

            t_DS = m_StudentResultDAL.ResultPassFailStudent(RollNo, Semester, ExamType, ExamYear);

            return t_DS;
        }

        public DataSet CheckCGPAValue(string RollNo, string Semester, string ExamType, string ExamYear,string Enrollmentno, string cgpa)
        {
            DataSet t_DS = null;

            t_DS = m_StudentResultDAL.CgpaValuecheck(RollNo, Semester, ExamType, ExamYear,Enrollmentno,cgpa);

            return t_DS;
        }

        public DataSet SaveCgpaDetails(string Rollno, string Semester, string Enrollmentno, string ExamYear, string ExamType, string Cgpa,string Createdon)
        {
            DataSet t_DS = null;

            t_DS = m_StudentResultDAL.CgpaValueInsert( Rollno,Semester, Enrollmentno, ExamYear, ExamType,Cgpa, Createdon);

            return t_DS;
          
        }

        public DataSet ResultStudent(string RollNo, string Semester, string ExamType, string ExamYear)
        {
            DataSet t_DS = null;

            t_DS = m_StudentResultDAL.ResultStudent(RollNo, Semester, ExamType, ExamYear);

            return t_DS;
        }

        public DataTable StudentResultData(string College, string CourseCode, string ProgramCode, string RollNo, string t_Year, string ExamType, string Semester)
        {
            DataTable t_DT = null;

            t_DT = m_StudentResultDAL.StudentResultData(College, CourseCode, ProgramCode, RollNo, t_Year, ExamType, Semester);

            return t_DT;
        }


         public DataTable GetCollegeCSVTU()
        {
            DataTable t_CollegeDT = null;

            t_CollegeDT = m_StudentResultDAL.GetCollegeCSVTU();

            return t_CollegeDT;
        }

        public DataTable GetCourseCSVTU()
        {
            DataTable t_DT = null;
            t_DT = m_StudentResultDAL.GetCourseCSVTU();
            return t_DT;
        }

        public DataSet GetAttendentSheetDetails(string m_coursecode, string m_CollegeCode, string m_Semester, string m_ExamType, string m_ExamYear,  string Range, string m_RollNo, string nextset, string m_program)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_StudentResultDAL.GetAttendentSheetDetails(m_coursecode,m_CollegeCode, m_Semester, m_ExamYear, m_ExamType, Range, m_RollNo, nextset, m_program);
            return t_AppDS;
        }

        public DataSet GetResultData(string m_Rollno, string m_Semester, string m_ExamType, string m_ExamYear)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_StudentResultDAL.GetResultData(m_Rollno, m_Semester, m_ExamYear, m_ExamType);
            return t_AppDS;
        }

        public DataSet GetAggregareDetetails(string m_Rollno, string m_Semester, string m_ExamYear,string m_Examtype)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_StudentResultDAL.GetAggregareDetetails(m_Rollno, m_Semester, m_ExamYear, m_Examtype);
            return t_AppDS;
        }

        public DataSet GetTotalBox(string m_Rollno)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_StudentResultDAL.GetTotalBox(m_Rollno);
            return t_AppDS;
        }

        public DataSet GetTotalSemestersObtSP_Transcript(string m_Rollno,string m_semester)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_StudentResultDAL.GetTotalSemestersObtSP_Transcript(m_Rollno, m_semester);
            return t_AppDS;
        }

        public DataSet GetStudentDetailsBulk(string m_coursecode, string m_CollegeCode, string m_Semester, string m_ExamType, string m_ExamYear, string Range, string m_RollNo, string nextset)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_StudentResultDAL.GetStudentDetailsBulk(m_coursecode, m_CollegeCode, m_Semester, m_ExamYear, m_ExamType, Range, m_RollNo, nextset);
            return t_AppDS;
        }

        public DataSet GetQRCode(string m_Rollno, string m_Semester,string Examtype, string m_ExamYear)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_StudentResultDAL.GetQRCode(m_Rollno, m_Semester, Examtype, m_ExamYear);
            return t_AppDS;
        }

        public DataSet GetTrAggData(string m_Rollno, string m_Semester, string m_ExamType,string m_ExamYear)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_StudentResultDAL.GetTrAggData(m_Rollno, m_Semester, m_ExamType, m_ExamYear);
            return t_AppDS;
        }

        public DataSet GetTranscriptData(string m_Rollno, string m_Semester, string m_ExamType, string m_ExamYear)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_StudentResultDAL.GetTranscriptData(m_Rollno, m_Semester, m_ExamType, m_ExamYear);
            return t_AppDS;
        }

        public DataSet GetResultDataTranscript(string m_Rollno, string m_Semester, string m_ExamType, string m_ExamYear)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_StudentResultDAL.GetResultDataTranscript(m_Rollno, m_Semester, m_ExamYear, m_ExamType);
            return t_AppDS;
        }
    }
}
