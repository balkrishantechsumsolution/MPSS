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
    public class CSCConnectBLL: BLLBase
    {
        private CSCConnectDAL m_CSCConnectDAL;
        public CSCConnectBLL()
        {
            m_CSCConnectDAL = new CSCConnectDAL();
        }

        public DataTable InsertCSCLoginDetails(CSCConnect_DT objCSCConnect_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_CSCConnectDAL.InsertCSCLoginDetails(objCSCConnect_DT, AFields);

            return t_AppDT;
        }

        public DataTable InsertCSCLoginDetailsV2(CSCConnectV2_DT objCSCConnect, string[] aFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_CSCConnectDAL.InsertCSCLoginDetailsV2(objCSCConnect, aFields);

            return t_AppDT;
        }
    }
}
