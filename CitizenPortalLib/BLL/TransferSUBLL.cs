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
    public class TransferSUBLL: BLLBase
    {
        private TransferSUDAL m_TransferSUDAL;
        public TransferSUBLL()
        {
            m_TransferSUDAL = new TransferSUDAL();
        }

        public DataTable InsertTransferSU(CollegeTransfer_DT objTransferSU_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_TransferSUDAL.InsertTransferSU(objTransferSU_DT, AFields);

            return t_AppDT;
        }        

        public DataSet GetCollegeTransferSU(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_TransferSUDAL.GetCollegeTransferSU(ServiceID, AppID);
            return t_AppDS;
        }        

        public DataSet GetTransferCertificateSU(string ServiceID, string AppID, string RegNo)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_TransferSUDAL.GetTransferCertificateSU(ServiceID, AppID, RegNo);
            return t_AppDS;
        }

        public DataTable GetDTEAppDetails(string m_AppID, string m_ServiceID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_TransferSUDAL.GetDTEAppDetails(m_AppID, m_ServiceID);
            return t_AppDS;
        }

        public DataTable GetReasonMaster(string SvcID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_TransferSUDAL.GetReasonMaster(SvcID);
            return t_AppDS;
        }
    }
}
