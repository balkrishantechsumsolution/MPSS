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
    public class FIRRegistrationBLL: BLLBase
    {
        private FIRRegistrationDAL m_FIRRegistrationDAL;
        public FIRRegistrationBLL()
        {
            m_FIRRegistrationDAL = new FIRRegistrationDAL();
        }

        public DataTable InsertFIRRegistration(FIRRegistration_DT objFIRRegistration_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_FIRRegistrationDAL.InsertFIRRegistration(objFIRRegistration_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetFIRRegistration(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_FIRRegistrationDAL.GetFIRRegistration(ServiceID, AppID);

            return t_AppDS;
        }

        //public DataTable SearchFIRData(SearchBirthData_DT objSearchFIRData_DT, string[] AFields)
        //{
        //    DataTable t_AppDS = null;

        //    t_AppDS = m_FIRRegistrationDAL.SearchFIRData(objSearchFIRData_DT, AFields);

        //    return t_AppDS;
        //}
    }
}
