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
  public  class FarmerRegistrationBLL:BLLBase
    {

        private FarmerRegistrationDAL m_FarmerRegistrationDAL;
        public FarmerRegistrationBLL()
        {
            m_FarmerRegistrationDAL = new FarmerRegistrationDAL();
        }

        public DataTable InsertFarmerRegistration(FarmerRegistration_DT objIFarmerRegistration_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_FarmerRegistrationDAL.Insert(objIFarmerRegistration_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetFarmerRegistration(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_FarmerRegistrationDAL.GetFarmerRegistration(ServiceID, AppID);

            return t_AppDS;
        }
    }
}
