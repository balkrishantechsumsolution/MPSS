using CitizenPortalLib.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitizenPortalLib.BLL
{
    public class ServiceDetailBLL : BLLBase
    {
        private ServiceDetailDAL m_ServiceDetailDAL;

        public ServiceDetailBLL()
        {
            m_ServiceDetailDAL = new ServiceDetailDAL();
        }

        public DataSet GetServiceDetail(string ServiceID, string FromDate, string ToDate)
        {
            return m_ServiceDetailDAL.GetServiceDetail(ServiceID, FromDate, ToDate);
        }

        public DataTable GetServices()
        {
            return m_ServiceDetailDAL.GetServices();
        }

        public DataTable GetActiveServices()
        {
            return m_ServiceDetailDAL.GetActiveServices();
        }
    }
}
