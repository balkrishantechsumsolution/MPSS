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
    public class MBPYBLL: BLLBase
    {
        private MBPYDAL m_MBPYDAL;
        public MBPYBLL()
        {
            m_MBPYDAL = new MBPYDAL();
        }

        public DataTable InsertMBPY(MBPY_DT objMBPY_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_MBPYDAL.Insert(objMBPY_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_MBPYDAL.GetAppDetails(ServiceID, AppID);

            return t_AppDS;
        }

    }
}
