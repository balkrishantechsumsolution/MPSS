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
    public class ComplaintRegistrationBLL: BLLBase
    {
        private ComplaintRegistrationDAL m_ComplaintRegistrationDAL;
        public ComplaintRegistrationBLL()
        {
            m_ComplaintRegistrationDAL = new ComplaintRegistrationDAL();
        }

        public DataTable InsertComplaintRegistration(ComplaintRegistration_DT objComplaintRegistration_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_ComplaintRegistrationDAL.InsertComplaintRegistration(objComplaintRegistration_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetComplaintRegistration(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_ComplaintRegistrationDAL.GetComplaintRegistration(ServiceID, AppID);

            return t_AppDS;
        }

        public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_ComplaintRegistrationDAL.GetAppDetails(ServiceID, AppID);
            return t_AppDS;
        }

        //public DataTable SearchFIRData(SearchBirthData_DT objSearchFIRData_DT, string[] AFields)
        //{
        //    DataTable t_AppDS = null;

        //    t_AppDS = m_ComplaintRegistrationDAL.SearchFIRData(objSearchFIRData_DT, AFields);

        //    return t_AppDS;
        //}

        public DataTable InsertEAppeal(EAppeal_DT objEAppeal_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_ComplaintRegistrationDAL.InsertEAppeal(objEAppeal_DT, AFields);
            return t_AppDT;
        }
    }
}
