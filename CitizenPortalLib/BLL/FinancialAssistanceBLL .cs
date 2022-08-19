using CitizenPortalLib.DAL;
using CitizenPortalLib.DataStructs;
using System.Data;

namespace CitizenPortalLib.BLL
{
    public class FinancialAssistanceBLL: BLLBase
    {
        private FinancialAssistanceDAL m_FinancialAssistanceDAL;
        public FinancialAssistanceBLL()
        {
            m_FinancialAssistanceDAL = new FinancialAssistanceDAL();
        }

        public DataTable InsertFinancialAssistance(FinancialAssistance_DT objFinancialAssistance_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_FinancialAssistanceDAL.Insert(objFinancialAssistance_DT, AFields);
            return t_AppDT;
        }

        public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_FinancialAssistanceDAL.GetAppDetails(ServiceID, AppID);
            return t_AppDS;
        }

        public DataTable InsertFinancialAssistance2(FinancialAssistance2_DT objFinancialAssistance2_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_FinancialAssistanceDAL.InsertFinancialAssistance2(objFinancialAssistance2_DT, AFields);
            return t_AppDT;
        }

        public DataTable InsertFinancialAssistance3(FinancialAssistance3_DT objFinancialAssistance3_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_FinancialAssistanceDAL.InsertFinancialAssistance3(objFinancialAssistance3_DT, AFields);
            return t_AppDT;
        }

        public DataTable InsertFinancialAssistance4(FinancialAssistance4_DT objFinancialAssistance4_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_FinancialAssistanceDAL.InsertFinancialAssistance4(objFinancialAssistance4_DT, AFields);
            return t_AppDT;
        }

        public DataSet GetAppDetails2(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_FinancialAssistanceDAL.GetAppDetails2(ServiceID, AppID);
            return t_AppDS;
        }

        public DataSet GetAppDetails3(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_FinancialAssistanceDAL.GetAppDetails3(ServiceID, AppID);
            return t_AppDS;
        }

        public DataSet GetAppDetails4(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_FinancialAssistanceDAL.GetAppDetails4(ServiceID, AppID);
            return t_AppDS;
        }
    }
}