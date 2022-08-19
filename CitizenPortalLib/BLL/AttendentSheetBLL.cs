using CitizenPortalLib.DAL;
using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitizenPortalLib.BLL
{
    public class AttendentSheetBLL : BLLBase
    {
        private AttendentSheetDAL m_AttendentSheetDAL;
        public AttendentSheetBLL()
        {
            m_AttendentSheetDAL = new AttendentSheetDAL();
        }

        public DataSet GetAttendentSheetDetails(string m_BranchCode, string m_CollegeCode,string m_ExamType, string m_ExamYear, string m_Semester,string Range, string m_RollNo, string m_ServiceID, string m_Registration, string m_PrintFlag)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_AttendentSheetDAL.GetAttendentSheetDetails(m_BranchCode, m_CollegeCode, m_ExamType, m_ExamYear, m_Semester,Range, m_RollNo, m_ServiceID, m_Registration, m_PrintFlag);
            return t_AppDS;
        }

        public DataSet GetAttendentPaperDetails(string RollNo, string Semester, string PrintFlag)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_AttendentSheetDAL.GetAttendentPaperDetails(RollNo, Semester, PrintFlag);
            return t_AppDS;
        }

        public DataSet GetExamCardDetail(string m_BranchCode, string m_CollegeCode, string m_ExamType, string m_ExamYear, string Range, string m_RollNo, string m_ServiceID, string m_Registration, string m_PrintFlag)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_AttendentSheetDAL.GetExamCardDetail(m_BranchCode, m_CollegeCode, m_ExamType, m_ExamYear, Range, m_RollNo, m_ServiceID, m_Registration, m_PrintFlag);
            return t_AppDS;
        }

        public DataSet GetBulkExamPaperDetail(string RollNo, string AdmissionYear, string PrintFlag)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_AttendentSheetDAL.GetBulkExamPaperDetail(RollNo, AdmissionYear, PrintFlag);
            return t_AppDS;
        }
    }
}