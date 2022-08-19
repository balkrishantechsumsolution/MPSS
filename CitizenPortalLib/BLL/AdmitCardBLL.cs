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
    public class AdmitCardBLL: BLLBase
    {
        private AdmitCardDAL m_AdmitCardDAL;
        public AdmitCardBLL()
        {
            m_AdmitCardDAL = new AdmitCardDAL();
        }
        
        public DataSet GetAdmitCard(string m_ServiceID, string m_AppID, string m_Semester)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_AdmitCardDAL.GetAdmitCard(m_ServiceID, m_AppID, m_Semester);
            return t_AppDS;
        }
        
        public DataTable InsertAdmitCardLog(string rollNo, string appId)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_AdmitCardDAL.AdmitCardLog(rollNo, appId);
            return t_AppDS;
        }

        public DataTable GetStudentSubjectList(string RollNo, string AppID, string SubType)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_AdmitCardDAL.GetStudentSubjectList(RollNo, AppID, SubType);
            return t_AppDS;
        }

        public DataTable InsertStudentSubject(int RowID, string RollNo, string AppID,string SubCode, string SubValue)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_AdmitCardDAL.InsertStudentSubject(RowID,RollNo, AppID,SubCode,SubValue);
            return t_AppDS;
        }

        public DataTable InsertStudentSubject(string RollNo, string AppID, string SubCode, string SubValue)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_AdmitCardDAL.InsertStudentSubject(RollNo, AppID, SubCode, SubValue);
            return t_AppDS;
        }

        public DataSet EditSubjectDetail(string m_ServiceID, string m_AppID, string m_Semester)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_AdmitCardDAL.EditSubjectDetail(m_ServiceID, m_AppID, m_Semester);
            return t_AppDS;
        }

        public DataTable GetStudentPaperDetails(string RollNo, string Semester)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_AdmitCardDAL.GetStudentPaperDetails(RollNo, Semester);
            return t_AppDS;
        }

        public DataTable InsertEditStudentList(int RowID, string RollNo, string AppID,string OldSubjectCode, string SubCode, string SubValue, string Remark, string CreatedBy, string SubjectType, string Semester, string Session, string ExamType)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_AdmitCardDAL.InsertEditStudentList(RowID, RollNo, AppID, OldSubjectCode, SubCode, SubValue, Remark, CreatedBy, SubjectType, Semester, Session, ExamType);
            return t_AppDS;
        }

        public DataTable InsertEditStudentListV2(int RowID, string RollNo, string AppID, string OldSubjectCode, string SubCode, string SubValue, string Remark, string CreatedBy, string Semester, string ExamYear, string ExamType, string Session, string Branch, string College, string SubjectType)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_AdmitCardDAL.InsertEditStudentListV2(RowID, RollNo, AppID, OldSubjectCode, SubCode, SubValue, Remark, CreatedBy, Semester, ExamYear, ExamType, Session, Branch,College, SubjectType);
            return t_AppDS;
        }

        public DataSet GetExaminationCard(string m_AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_AdmitCardDAL.GetExaminationCard(m_AppID);
            return t_AppDS;
        }
        public DataSet GetQRStudentDetail(string RollNo)
        {
            return m_AdmitCardDAL.GetQRStudentDetail(RollNo);
        }
    }
}
