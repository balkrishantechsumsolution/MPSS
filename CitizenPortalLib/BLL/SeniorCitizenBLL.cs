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
    public class SeniorCitizenBLL: BLLBase
    {
        private SeniorCitizenDAL m_SeniorCitizenDAL;
        public SeniorCitizenBLL()
        {
            m_SeniorCitizenDAL = new SeniorCitizenDAL();
        }

        public DataTable Insert(SeniorCitizen_DT objSeniorCitizen_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_SeniorCitizenDAL.Insert(objSeniorCitizen_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_SeniorCitizenDAL.GetAppDetails(ServiceID, AppID);

            return t_AppDS;
        }

        public DataSet GetAppDetailsNFBS(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_SeniorCitizenDAL.GetAppDetailsNFBS(ServiceID, AppID);

            return t_AppDS;
        }

        public DataTable InsertNFBS(NFBS_DT objNFBS_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_SeniorCitizenDAL.InsertNFBS(objNFBS_DT, AFields);

            return t_AppDT;
        }

        public DataTable InsertSeniorCitizenIDCardData(SeniorCitizenIDCard_DT objSeniorCitizenIDCard_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_SeniorCitizenDAL.InsertSeniorCitizenIDCardData(objSeniorCitizenIDCard_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetSeniorCitizenIDCardData(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_SeniorCitizenDAL.GetSeniorCitizenIDCardData(ServiceID, AppID);

            return t_AppDS;
        }
        public DataTable GetDistrictPoliceStations(string DistrictCode)
        {
            return m_SeniorCitizenDAL.GetDistrictPoliceStations(DistrictCode);
        }
        public DataSet GetSCIDCardData(string ServiceID, string AppID)
        {
            DataSet ds_Data = null;
            ds_Data = m_SeniorCitizenDAL.GetSCIDCardData(ServiceID, AppID);
            return ds_Data;
        }
        public DataTable InsertSeniorCitizenCheckList(SeniorCitizenCheckList_DT objSeniorCitizenCheckList_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_SeniorCitizenDAL.InsertSeniorCitizenCheckList(objSeniorCitizenCheckList_DT, AFields);

            return t_AppDT;
        }
        public DataTable InsertSeniorCitizenDispatchData(string DispatchData,string LoginID)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_SeniorCitizenDAL.InsertSeniorCitizenDispatchData(DispatchData,LoginID);

            return t_AppDT;
        }
        public DataSet GetSeniorCitizenDeliverHistory(string AppID)
        {
            DataSet t_AppDT = null;

            t_AppDT = m_SeniorCitizenDAL.GetSeniorCitizenDeliverHistory(AppID);

            return t_AppDT;
        }
        public DataTable GetDistrictAndPS(string LoginID)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_SeniorCitizenDAL.GetDistrictAndPs(LoginID);

            return t_AppDT;
        }
        public DataTable ValidateAadhaarNo(string AadhaarNo)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_SeniorCitizenDAL.ValidateAadhaarNo(AadhaarNo);

            return t_AppDT;
        }
    }
}
