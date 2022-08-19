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
    public class IGNWPBLL: BLLBase
    {
        private IGNWPDAL m_IGNWPDAL;
        public IGNWPBLL()
        {
            m_IGNWPDAL = new IGNWPDAL();
        }

        public DataTable InsertIGNWP(IGNWP_DT objIGNWP_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_IGNWPDAL.Insert(objIGNWP_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetIGNWP(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_IGNWPDAL.GetIGNWP(ServiceID, AppID);

            return t_AppDS;
        }

    }
}
