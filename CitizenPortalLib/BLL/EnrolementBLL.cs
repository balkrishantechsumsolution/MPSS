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
    public class EnrolementBLL : BLLBase
    {
        private EnrolementDAL m_EnrolementDAL;
        public EnrolementBLL()
        {
            m_EnrolementDAL = new EnrolementDAL();
        }

        public DataTable GetBranchList()
        {
            DataTable dtBranch = null;

            dtBranch = m_EnrolementDAL.GetBranchList();

            return dtBranch;
        }
        public DataTable SearchStudentEnrolementSP(string EnrolementNo, string Name, string MobileNo, DateTime DOB, string Branch)
        {
            DataTable dtSearch = null;

            dtSearch = m_EnrolementDAL.SearchStudentEnrolementSP(EnrolementNo, Name, MobileNo, DOB, Branch);

            return dtSearch;
        }
        public DataTable GetStudentData(string EnrolementNo, string Branch)
        {
            DataTable dtBranch = null;

            dtBranch = m_EnrolementDAL.GetStudentData(EnrolementNo, Branch);

            return dtBranch;
        }

        public DataSet GetStudentDetails(string EnrolementNo, string Branch)
        {
            DataSet t_SubjectDS = null;

            t_SubjectDS = m_EnrolementDAL.GetStudentDetails(EnrolementNo, Branch);

            return t_SubjectDS;
        }

        public DataTable InsertEnrolementFormData(EnrolementAdmissionForm_DT objEnrolementForm_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_EnrolementDAL.InsertEnrolementFormData(objEnrolementForm_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetStudentEnrolementData(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_EnrolementDAL.GetStudentEnrolementData(ServiceID, AppID);

            return t_AppDS;
        }
    }
}
