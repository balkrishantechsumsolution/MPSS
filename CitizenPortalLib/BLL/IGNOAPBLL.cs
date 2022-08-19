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
    public class IGNOAPBLL: BLLBase
    {
        private IGNOAPDAL m_IGNOAPDAL;
        public IGNOAPBLL()
        {
            m_IGNOAPDAL = new IGNOAPDAL();
        }

        public DataTable InsertIGNOAP(IGNOAP_DT objIGNOAP_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_IGNOAPDAL.Insert(objIGNOAP_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetIGNOAP(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_IGNOAPDAL.GetIGNOAP(ServiceID, AppID);

            return t_AppDS;
        }

    }
}
