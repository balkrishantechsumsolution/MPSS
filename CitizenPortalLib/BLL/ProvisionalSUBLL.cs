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
    public class ProvisionalSUBLL : BLLBase
    {
        private ProvisionalSUDAL m_ProvisionalSUDAL;
        public ProvisionalSUBLL()
        {
            m_ProvisionalSUDAL = new ProvisionalSUDAL();
        }

        public DataTable InsertProvisionalSU(ProvisionalCertificate_DT objProvisionalSU_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_ProvisionalSUDAL.InsertProvisionalSU(objProvisionalSU_DT, AFields);

            return t_AppDT;
        }        

        public DataSet GetProvisionalSU(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_ProvisionalSUDAL.GetProvisionalSU(ServiceID, AppID);
            return t_AppDS;
        }        

        public DataSet GetProvisionalCertificateSU(string ServiceID, string AppID, string RegNo)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_ProvisionalSUDAL.GetProvisionalCertificateSU(ServiceID, AppID, RegNo);
            return t_AppDS;
        }

        public DataTable GetDTEAppDetails(string m_AppID, string m_ServiceID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_ProvisionalSUDAL.GetDTEAppDetails(m_AppID, m_ServiceID);
            return t_AppDS;
        }
        
    }
}
