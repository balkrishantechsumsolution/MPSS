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
    public class BirthRegistrationBLL: BLLBase
    {
        private BirthRegistrationDAL m_BirthRegistrationDAL;
        public BirthRegistrationBLL()
        {
            m_BirthRegistrationDAL = new BirthRegistrationDAL();
        }

        public DataTable InsertBirthRegistration(BirthRegistration_DT objBirthRegistration_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_BirthRegistrationDAL.InsertBirthRegistration(objBirthRegistration_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetBirthRegistration(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_BirthRegistrationDAL.GetBirthRegistration(ServiceID, AppID);

            return t_AppDS;
        }

        public DataTable SearchBirthData(SearchBirthData_DT objSearchBirthData_DT, string[] AFields)
        {
            DataTable t_AppDS = null;

            t_AppDS = m_BirthRegistrationDAL.SearchBirthData(objSearchBirthData_DT, AFields);

            return t_AppDS;
        }
    }
}
