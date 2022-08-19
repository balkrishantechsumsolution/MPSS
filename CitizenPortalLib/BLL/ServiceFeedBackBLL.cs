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
   public  class ServiceFeedBackBLL:BLLBase
    {
        private ServiceFeedBackDAL m_ServiceFeedBackDAL;
        public ServiceFeedBackBLL()
        {
            m_ServiceFeedBackDAL = new ServiceFeedBackDAL();
        }
        public DataTable InsertServiceFeedBack(ServiceFeedBack_DT objServiceFeedBack_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_ServiceFeedBackDAL.InsertServiceFeedBack(objServiceFeedBack_DT, AFields);

            return t_AppDT;
           
        }
    }
}
