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
    public class EnrollmentBLL : BLLBase
    {
        private EnrollmentDAL m_EnrollmentDAL;
        public EnrollmentBLL()
        {
            m_EnrollmentDAL = new EnrollmentDAL();
        }

        
        public DataTable InsertEnrollmentFormData(EnrollmentData_DT objEnrollmentForm_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_EnrollmentDAL.InsertEnrollmentFormData(objEnrollmentForm_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetStudentEnrollmentData(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_EnrollmentDAL.GetStudentEnrollmentData(ServiceID, AppID);

            return t_AppDS;
        }

        public DataSet ValidateEnrollmentAge(string CourseCode, string ProgramCode, string Category, string Gender, string Age, string Domicile)
        {
            DataSet t_Age = null;

            t_Age = m_EnrollmentDAL.ValidateEnrollmentAge(CourseCode, ProgramCode, Category, Gender, Age, Domicile);

            return t_Age;
        }

        public DataTable InsertEnrollmentPartTime(EnrollmentData_DT objEnrollmentForm_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_EnrollmentDAL.InsertEnrollmentPartTime(objEnrollmentForm_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetStudentEnrollmentPartTime(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_EnrollmentDAL.GetStudentEnrollmentPartTime(ServiceID, AppID);

            return t_AppDS;
        }

        public DataSet GetEnrollmentDetails(string AppID)
        {
            DataSet t_SubjectDS = null;

            t_SubjectDS = m_EnrollmentDAL.GetEnrollmentDetails(AppID);

            return t_SubjectDS;
        }

        public DataTable UpdateEnrollmentData(EnrollmentData_DT objEnrollmentForm_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_EnrollmentDAL.UpdateEnrollmentData(objEnrollmentForm_DT, AFields);

            return t_AppDT;
        }
    }
}
