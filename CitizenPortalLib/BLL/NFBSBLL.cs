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
    public class NFBSBLL: BLLBase
    {
        private NFBSDAL m_NFBSDAL;
        public NFBSBLL()
        {
            m_NFBSDAL = new NFBSDAL();
        }

        public DataTable InsertNFBS(NFBS_DT objNFBS_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_NFBSDAL.Insert(objNFBS_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_NFBSDAL.GetAppDetails(ServiceID, AppID);
            return t_AppDS;
        }
  

    }
}
