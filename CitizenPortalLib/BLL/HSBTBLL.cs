using System;
using CitizenPortalLib.DAL;
using CitizenPortalLib.DataStructs;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Threading.Tasks;

namespace CitizenPortalLib.BLL
{
  public  class HSBTBLL : BLLBase
    {
        private HSBTDAL m_HabishaDAL;
        public HSBTBLL()
        {
            m_HabishaDAL = new HSBTDAL();
        }

        public DataTable InsertHSBT(HSBT_DT objHSBT_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_HabishaDAL.InsertHSBT(objHSBT_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetHabishaData(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_HabishaDAL.GetHabishaData(ServiceID, AppID);

            return t_AppDS;
        }
        
    }
}

