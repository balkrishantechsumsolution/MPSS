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
    public class CMRFBLL: BLLBase
    {
        private CMRFDAL m_CMRFDAL;
        public CMRFBLL()
        {
            m_CMRFDAL = new CMRFDAL();
        }

        public DataTable InsertCMRF(CMRF_DT objCMRF_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_CMRFDAL.Insert(objCMRF_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_CMRFDAL.GetAppDetails(ServiceID, AppID);

            return t_AppDS;
        }

    }
}
