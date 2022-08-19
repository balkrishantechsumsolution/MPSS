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
    public class SPVRequestBLL : BLLBase
    {
        private SPVRequestDAL m_SPVRequestDAL;
        public SPVRequestBLL()
        {
            m_SPVRequestDAL = new SPVRequestDAL();
        }

        public string InsertV3(SPVRequest_DT objSPVRequest_DT, string[] AFields)
        {
            string t_SPVRequest = "";
            //int t_Year = CommonUtility.GetFinancialYear();

            t_SPVRequest = m_SPVRequestDAL.InsertV3(objSPVRequest_DT, AFields);

            return t_SPVRequest;
        }

        public DataTable GetAppDetails(string AppID)
        {
            DataTable dt = null;

            dt = m_SPVRequestDAL.GetAppDetails(AppID);

            return dt;
        }

        public string InsertCSCBridgeRequest(CSCBridgeRequest_DT objCSCBridgeRequest_DT, string[] aFields)
        {
            string t_SPVRequest = "";            

            t_SPVRequest = m_SPVRequestDAL.InsertCSCBridgeRequest(objCSCBridgeRequest_DT, aFields);

            return t_SPVRequest;
        }

        public string InsertCSCBridgeRecon(CSCBridgeReconLog_DT objCSCBridgeRecon_DT, string[] aReconFields)
        {
            string t_SPVRequest = "";

            t_SPVRequest = m_SPVRequestDAL.InsertCSCBridgeRecon(objCSCBridgeRecon_DT, aReconFields);

            return t_SPVRequest;
        }

        public string InsertCSCBridgeResponseMessage(CSCBridgeResponseMessage_DT objCSCBridgeResponseMessage_DT, string[] aFields)
        {
            string t_SPVRequest = "";

            t_SPVRequest = m_SPVRequestDAL.InsertCSCBridgeResponseMessage(objCSCBridgeResponseMessage_DT, aFields);

            return t_SPVRequest;
        }

        public DataSet InsertCSCBridgeResponse(CSCBridgeResponse_DT objCSCBridgeResponse_DT, string[] aResponseFields)
        {
            return m_SPVRequestDAL.InsertCSCBridgeResponse(objCSCBridgeResponse_DT, aResponseFields);
        }

        public DataTable GetCSCBridgeRecon(string ServiceID, string AppID)
        {
            DataTable dt = null;

            dt = m_SPVRequestDAL.GetCSCBridgeRecon(ServiceID, AppID);

            return dt;
        }
    }
}
