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
    public class DuplicateDegreeSUBLL: BLLBase
    {
        private DuplicateDegreeSUDAL m_DuplicateDegreeSUDAL;
        public DuplicateDegreeSUBLL()
        {
            m_DuplicateDegreeSUDAL = new DuplicateDegreeSUDAL();
        }

        public DataTable InsertDuplicateDegreeSU(DuplicateDegree_DT objDuplicateDegreeSU_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_DuplicateDegreeSUDAL.InsertDuplicateDegreeSU(objDuplicateDegreeSU_DT, AFields);

            return t_AppDT;
        }        

        public DataSet GetDuplicateDegreeSU(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_DuplicateDegreeSUDAL.GetDuplicateDegreeSU(ServiceID, AppID);
            return t_AppDS;
        }        

        public DataSet GetDuplicateDegreeCertificateSU(string ServiceID, string AppID, string RegNo)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_DuplicateDegreeSUDAL.GetDuplicateDegreeCertificateSU(ServiceID, AppID, RegNo);
            return t_AppDS;
        }

        public DataTable GetDTEAppDetails(string m_AppID, string m_ServiceID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_DuplicateDegreeSUDAL.GetDTEAppDetails(m_AppID, m_ServiceID);
            return t_AppDS;
        }
        
    }
}
