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
    public class WaterConnectionBLL: BLLBase
    {
        private WaterConnectionDAL m_WaterConnectionDAL;
        public WaterConnectionBLL()
        {
            m_WaterConnectionDAL = new WaterConnectionDAL();
        }

        public DataTable InsertWaterConnection(WaterConnection_DT objWaterConnection_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_WaterConnectionDAL.Insert(objWaterConnection_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_WaterConnectionDAL.GetAppDetails(ServiceID, AppID);

            return t_AppDS;
        }

    }
}
