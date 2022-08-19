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
    public class RegistrationReceiptSUBLL : BLLBase
    {
        private RegistrationReceiptSUDAL m_RegistrationReceiptSUDAL;
        public RegistrationReceiptSUBLL()
        {
            m_RegistrationReceiptSUDAL = new RegistrationReceiptSUDAL();
        }

        public DataTable InsertRegistrationReceiptSU(RegistrationReceipt_DT objRegistrationReceiptSU_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_RegistrationReceiptSUDAL.InsertRegistrationReceiptSU(objRegistrationReceiptSU_DT, AFields);

            return t_AppDT;
        }        

        public DataSet GetRegistrationReceiptSU(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_RegistrationReceiptSUDAL.GetRegistrationReceiptSU(ServiceID, AppID);
            return t_AppDS;
        }        

        public DataSet GetRegistrationReceiptCertificateSU(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_RegistrationReceiptSUDAL.GetRegistrationReceiptCertificateSU(ServiceID, AppID);
            return t_AppDS;
        }

        public DataTable GetDTEAppDetails(string m_AppID, string m_ServiceID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_RegistrationReceiptSUDAL.GetDTEAppDetails(m_AppID, m_ServiceID);
            return t_AppDS;
        }
        
    }
}
