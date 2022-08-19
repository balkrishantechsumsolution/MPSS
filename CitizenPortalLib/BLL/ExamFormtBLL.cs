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
    public class ExamFormBLL : BLLBase
    {
        private ExamFormDAL m_ExamFormDAL;
        public ExamFormBLL()
        {
            m_ExamFormDAL = new ExamFormDAL();
        }

        
        public DataTable InsertExamFormFormData(ExamFormData_DT objExamFormForm_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_ExamFormDAL.InsertExamFormFormData(objExamFormForm_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetStudentExamFormData(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_ExamFormDAL.GetStudentExamFormData(ServiceID, AppID);

            return t_AppDS;
        }

        public DataSet ValidateExamFormAge(string CourseCode, string ProgramCode, string Category, string Gender, string Age, string Domicile)
        {
            DataSet t_Age = null;

            t_Age = m_ExamFormDAL.ValidateExamFormAge(CourseCode, ProgramCode, Category, Gender, Age, Domicile);

            return t_Age;
        }

        public DataSet GetStudentSemesterExamDetail(string RollNo, string ExamYear, string KeyField, string Semester)
        {
            DataSet t_DS = null;

            t_DS = m_ExamFormDAL.GetStudentSemesterExamDetail(RollNo, ExamYear, KeyField, Semester);

            return t_DS;
        }

        public DataTable GenerateBatchSemesterPay(string Data, string ServiceID, string CreatedBy, string RollNo, string ExamType, string Semester, string ExamYear, string PayableAmount, string Mobile, string EmailID, string DOB)
        {
            return m_ExamFormDAL.GenerateBatchSemesterPay(Data, ServiceID, CreatedBy, RollNo, ExamType, Semester, ExamYear, PayableAmount, Mobile, EmailID, DOB);
        }

        public DataSet GetStudentRTRRVDetail(string RollNo, string ProfileID, string v)
        {
            DataSet t_DS = null;
            t_DS = m_ExamFormDAL.GetStudentRTRRVDetail(RollNo, ProfileID, "");
            return t_DS;
        }

        public DataSet CalculateExamFees(string RollNo, string ExamType, string SubjectCount)
        {
            DataSet t_Fees = null;

            t_Fees = m_ExamFormDAL.CalculateExamFees(RollNo, ExamType, SubjectCount);

            return t_Fees;
        }

        public DataSet GetStudentExamDetail(string ServiceID, string AppID)
        {
            DataSet t_DS = null;

            t_DS = m_ExamFormDAL.GetStudentExamDetail(ServiceID, AppID);

            return t_DS;
        }

        public DataSet GetStudentAdmitCard(string ServiceID, string AppID, string Semester)
        {
            DataSet t_DS = null;

            t_DS = m_ExamFormDAL.GetStudentAdmitCard(ServiceID, AppID, Semester);

            return t_DS;
        }

        public DataTable GetRTRRVSemester(string RollNo, string RegdNo)
        {
            DataTable t_DT = null;
            t_DT = m_ExamFormDAL.GetRTRRVSemester(RollNo, RegdNo);
            return t_DT;
        }

        public DataSet GetRTRRVSubject(string RollNo, string Semester, string ExamYear, string AppType)
        {
            DataSet t_DS = null;
            t_DS = m_ExamFormDAL.GetRTRRVSubject(RollNo, Semester, ExamYear, AppType);
            return t_DS;
        }

        public DataTable GenerateRTRVBatchSemesterPay(string Data, string ServiceID, string CreatedBy, string RollNo, string ExamType, string Semester, string ExamYear, string PayableAmount, string Mobile, string EmailID, string DOB, string AppType)
        {
            return m_ExamFormDAL.GenerateRTRVBatchSemesterPay(Data, ServiceID, CreatedBy, RollNo, ExamType, Semester, ExamYear, PayableAmount, Mobile, EmailID, DOB,AppType);
        }

        public DataSet GetRTRVStudentDetail(string ServiceID, string AppID)
        {
            DataSet t_DS = null;

            t_DS = m_ExamFormDAL.GetRTRVStudentDetail(ServiceID, AppID);

            return t_DS;
        }

        public DataSet GetStudentExamData(string Semester, string Session, string ExamType, string RollNo, string Enrollment, string Schema, string LoginID)
        {
            DataSet t_DS = null;
            t_DS = m_ExamFormDAL.GetStudentExamData(Semester, Session, ExamType, RollNo, Enrollment, Schema, LoginID);
            return t_DS;
        }

        public DataTable GenerateStudentExamData(string Data, string ServiceID, string CreatedBy, string RollNo, string ExamType, string Semester, string ExamYear, string PayableAmount, string Mobile, string EmailID, string DOB, string AppType)
        {
            return m_ExamFormDAL.GenerateStudentExamData(Data, ServiceID, CreatedBy, RollNo, ExamType, Semester, ExamYear, PayableAmount, Mobile, EmailID, DOB, AppType);
        }
    }
}
