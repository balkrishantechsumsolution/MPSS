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
    public class FisheriesRegistrationBLL: BLLBase
    {
        private FisheriesRegistrationDAL m_FisheriesRegistrationDAL;
        public FisheriesRegistrationBLL()
        {
            m_FisheriesRegistrationDAL = new FisheriesRegistrationDAL();
        }

        //Insert Fisheries Registration Data In Table
        public DataTable InsertFisheriesRegistration(FisheriesRegistration_DT objFisheriesRegistration_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_FisheriesRegistrationDAL.Insert(objFisheriesRegistration_DT, AFields);

            return t_AppDT;
        }

        //Getting Fisheries Registration Data
        public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_FisheriesRegistrationDAL.GetAppDetails(ServiceID, AppID);
            return t_AppDS;
        }
    }
}