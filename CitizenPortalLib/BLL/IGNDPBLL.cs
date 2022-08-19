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
    public class IGNDPBLL: BLLBase
    {
        private IGNDPDAL m_IGNDPDAL;
        public IGNDPBLL()
        {
            m_IGNDPDAL = new IGNDPDAL();
        }

        public DataTable InsertIGNDP(IGNDP_DT objIGNDP_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_IGNDPDAL.Insert(objIGNDP_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetIGNDP(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_IGNDPDAL.GetIGNDP(ServiceID, AppID);

            return t_AppDS;
        }

    }
}
