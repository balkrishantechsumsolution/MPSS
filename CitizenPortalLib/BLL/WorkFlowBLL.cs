using CitizenPortalLib.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CitizenPortalLib.DataStructs;

namespace CitizenPortalLib.BLL
{
    public class WorkFlowBLL: BLLBase
    {
        private WorkFlowDAL m_WorkFlowDAL;

        public WorkFlowBLL()
        {
            m_WorkFlowDAL = new WorkFlowDAL();
        }

        public DataTable GetActions(string ServiceID, string AppID)
        {
            return m_WorkFlowDAL.GetActions(ServiceID, AppID);
        }

        public DataTable SendAppInWorkFlow(string ServiceID, string AppID, string StageID, string ActionID, string Remarks, string CreatedBy, string ClientIP)
        {

            return m_WorkFlowDAL.SendAppInWorkFlow(ServiceID, AppID, StageID, ActionID, Remarks, CreatedBy, ClientIP);            

        }

        public DataTable GetAppRemarks(string ServiceID, string AppID)
        {
            return m_WorkFlowDAL.GetAppRemarks(ServiceID, AppID);
        }

        public DataTable GetAppDetail(string ServiceID, string AppID)
        {
            return m_WorkFlowDAL.GetAppDetail(ServiceID, AppID);
        }

        public DataTable GetAcceptanceActions(string ServiceID, string AppID)
        {
            return m_WorkFlowDAL.GetAcceptanceActions(ServiceID, AppID);
        }

        public DataTable GetProfileID(string ServiceID, string AppID)
        {
            return m_WorkFlowDAL.GetProfileID(ServiceID, AppID);
        }

        public DataTable AcceptAppInWorkFlow(string ServiceID, string AppID, string StageID, string ActionID, string Remarks, string CreatedBy, string ClientIP)
        {
            return m_WorkFlowDAL.AcceptAppInWorkFlow(ServiceID, AppID, StageID, ActionID, Remarks, CreatedBy, ClientIP);
        }

        public int CheckFileUpload(string ServiceID, string AppID)
        {
            return m_WorkFlowDAL.CheckFileUpload(ServiceID, AppID);
        }

        public DataTable GetSeniorCitizenSMS(string ServiceID, string AppID)
        {
            return m_WorkFlowDAL.GetSeniorCitizenSMS(ServiceID, AppID);
        }
        public DataTable GenerateSeniorCitizenIDCardNo(string AppID,string Flag)
        {
            return m_WorkFlowDAL.GenerateSeniorCitizenIDCardNo(AppID,Flag);
        }

        public DataTable InsertDeptProfile(DeptProfile_DT Data, string[] AFields)
        {
            return m_WorkFlowDAL.InsertDeptProfile(Data, AFields);
        }

        public DataTable CheckProfile(string LoginID,int Department)
        {
            return m_WorkFlowDAL.CheckProfile(LoginID, Department);
        }

        public DataTable EditProfile(string LoginID, int Department)
        {
            return m_WorkFlowDAL.EditProfile(LoginID, Department);
        }

        public DataTable PhDAdminAction(string ServiceID, string AppID, string ActionID, string Remarks, string CreatedBy, string ClientIP)
        {
            return m_WorkFlowDAL.PhDAdminAction(ServiceID, AppID, ActionID, Remarks, CreatedBy, ClientIP);
        }

        public DataTable AdminAction(string ServiceID, string AppID, string ActionID, string Remarks, string CreatedBy, string ClientIP)
        {
            return m_WorkFlowDAL.AdminAction(ServiceID, AppID, ActionID, Remarks, CreatedBy, ClientIP);

        }

        public DataTable CBAAdminAction(string ServiceID, string AppID, string ActionID, string Remarks, string CreatedBy, string ClientIP)
        {
            return m_WorkFlowDAL.CBAAdminAction(ServiceID, AppID, ActionID, Remarks, CreatedBy, ClientIP);

        }

    }
}
