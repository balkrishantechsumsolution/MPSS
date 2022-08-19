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
    public class OISFBLL: BLLBase
    {
        private OISFDAL m_OISFDAL;
        public OISFBLL()
        {
            m_OISFDAL = new OISFDAL();
        }

        public DataTable InsertConstableData(OISFProfile_DT objOISF_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OISFDAL.InsertConstableData(objOISF_DT, AFields);
            return t_AppDT;
        }

        public DataTable GetOISFWrittenResult()
        {
            DataTable t_AppDt = null;
            t_AppDt = m_OISFDAL.GetOISFWrittenResult();
            return t_AppDt;
        }

        public DataSet OSIFGetScoreSheet(string m_AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OISFDAL.OSIFGetScoreSheet(m_AppID);
            return t_AppDS;
        }

        public DataSet OSIF_GetAdmitCard(string m_ServiceID, string m_AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OISFDAL.OSIF_GetAdmitCard(m_ServiceID, m_AppID);
            return t_AppDS;
        }

        public DataSet OSIFScrutinyData(string m_ServiceID, string LoginID, string DistrictCode, string Category, string FromDate, string ToDate)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OISFDAL.OSIFScrutinyData(m_ServiceID, LoginID, DistrictCode, Category, FromDate, ToDate);
            return t_AppDS;
        }

        public DataTable VerifyPayment(string ServiceID, string AppID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OISFDAL.VerifyPayment(ServiceID, AppID);
            return t_AppDS;
        }

        public DataSet GetOISFAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OISFDAL.GetOISFAppDetails(ServiceID, AppID);
            return t_AppDS;
        }
        //
        public DataSet GetOISFAppDetailsBattalion(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OISFDAL.GetOISFAppDetailsBattalionOffLine(ServiceID, AppID);
            return t_AppDS;
        }

        public DataTable GetOISFAppID(string LoginID, string DOB, string AppID, string Mobile, string RollNo)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OISFDAL.GetOISFAppID(LoginID, DOB, AppID, Mobile, RollNo);
            return t_AppDS;
        }

        public DataSet OSIF_GetEPassData(string m_ServiceID, string m_AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OISFDAL.OSIF_GetEPassData(m_ServiceID, m_AppID);
            return t_AppDS;
        }

        public DataSet SubmitPayment(string m_ServiceID, string m_AppID, string CreatedBy, string UserType, string SBIRefNo)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OISFDAL.SubmitPayment(m_ServiceID, m_AppID, CreatedBy, UserType, SBIRefNo);
            return t_AppDS;
        }

        public DataTable GetEducationBoard(string stateCode)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OISFDAL.GetEducationBoard(stateCode);
            return t_AppDS;
        }

        public DataTable GetEmploymentExchange(string districtCode)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OISFDAL.GetEmploymentExchange(districtCode);
            return t_AppDS;
        }

        public DataTable GetOISFGradeSheet(string LoginID, string DOB, string AppID, string Mobile, string RollNo)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OISFDAL.GetOISFGradeSheet(LoginID, DOB, AppID, Mobile, RollNo);
            return t_AppDS;
        }

        public DataTable GetRTOList(string districtCode)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OISFDAL.GetRTOList(districtCode);
            return t_AppDS;
        }

        public DataTable GetPoliceStation(string stateCode, string districtCode)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OISFDAL.GetPoliceStation(stateCode, districtCode);
            return t_AppDS;
        }

        public DataTable InsertManualDetail(string battalionID, string draftNo, string formNo, string CreatedBy)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OISFDAL.InsertManualDetail(battalionID, draftNo, formNo, CreatedBy);
            return t_AppDS;
        }

        public DataSet ScrutinyApplication(string ServiceID, string RowID, string Action, string Reason, string Remarks, string LoginID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OISFDAL.ScrutinyApplication(ServiceID, RowID, Action, Reason, Remarks, LoginID);
            return t_AppDS;
        }

        public DataTable InsertEPassLog(string rollNo, string appId)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OISFDAL.InsertEPassLog(rollNo, appId);
            return t_AppDS;
        }

        public DataTable GetOISFGrievance(string LoginID, string DOB, string AppID, string Mobile, string RollNo)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OISFDAL.GetOISFGrievance(LoginID, DOB, AppID, Mobile, RollNo);
            return t_AppDS;
        }

        public DataSet OSIFGetGrievanceForm(string m_AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OISFDAL.OSIFGetGrievanceForm(m_AppID);
            return t_AppDS;
        }
        
        public DataTable GetOISFFailedSMSReport()
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OISFDAL.GetOISFFailedSMSReport();
            return t_AppDS;
        }

        public DataTable InsertGrievance(string AppID, string RollNo, string Mobile, string Subject, string Greivance)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OISFDAL.InsertGrievance(AppID, RollNo, Mobile, Subject, Greivance);
            return t_AppDS;
        }

        public DataTable GetOISFGrievanceReport(string DateFrom, string DateTo)
        {
            DataTable t_AppDt = null;
            t_AppDt = m_OISFDAL.GetOISFGrievanceReport(DateFrom, DateTo);
            return t_AppDt;
        }

        public DataTable GetQualifiedPETData(string AppID, string RollNo, string Mobile)
        {
            DataTable t_AppDt = null;
            t_AppDt = m_OISFDAL.GetQualifiedPETData(AppID, RollNo, Mobile);
            return t_AppDt;
        }

        public DataTable EAdmitCardLog(string rollNo, string appId)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OISFDAL.EAdmitCardLog(rollNo, appId);
            return t_AppDS;
        }

        public DataTable UploadCasteCertificate(string ServiceID, string AppID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OISFDAL.UploadCasteCertificate(ServiceID, AppID);
            return t_AppDS;
        }

    }
}
