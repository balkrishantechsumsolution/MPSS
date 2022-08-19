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
   public  class BanishreeBLL:BLLBase
    {
        private BanishreeDAL m_BanishreeDAL;
        public BanishreeBLL()
        {
            m_BanishreeDAL = new BanishreeDAL();
        }

        public DataTable InsertBanishree(Banishree_DT objBanishree_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_BanishreeDAL.Insert(objBanishree_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_BanishreeDAL.GetAppDetails(ServiceID, AppID);
            return t_AppDS;
        }


    }
}
