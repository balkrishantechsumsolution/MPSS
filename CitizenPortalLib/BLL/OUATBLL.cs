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
    public class OUATBLL: BLLBase
    {
        private OUATDAL m_OUATDAL;
        public OUATBLL()
        {
            m_OUATDAL = new OUATDAL();
        }

        public DataTable InsertConstableData(OUATProfile_DT objOUAT_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OUATDAL.InsertConstableData(objOUAT_DT, AFields);
            return t_AppDT;
        }
 
        public DataTable VerifyPayment(string ServiceID, string AppID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.VerifyPayment(ServiceID, AppID);
            return t_AppDS;
        }

        public DataSet OUATUGRankCard(string m_ServiceID, string m_AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.OUATUGRankCard(m_ServiceID, m_AppID);
            return t_AppDS;
        }
        
        public DataSet OUATDiplomaRankCard(string m_ServiceID, string m_AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.OUATDiplomaRankCard(m_ServiceID, m_AppID);
            return t_AppDS;
        }

        public DataSet OUATUGSpotRank(string m_ServiceID, string m_AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.OUATUGSpotRank(m_ServiceID, m_AppID);
            return t_AppDS;
        }

        public DataSet OUATGetPGRankCard(string m_ServiceID, string m_AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.OUATGetPGRankCard(m_ServiceID, m_AppID);
            return t_AppDS;
        }

        public DataSet OUATUGAgroRankCard(string m_ServiceID, string m_AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.OUATUGAgroRankCard(m_ServiceID, m_AppID);
            return t_AppDS;
        }

        public DataSet OUATUGAgroDiplomaRankCard(string m_ServiceID, string m_AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.OUATUGAgroDiplomaRankCard(m_ServiceID, m_AppID);
            return t_AppDS;
        }
        public DataTable VerifyOUATDiplomaPayment(string ServiceID, string AppID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.VerifyOUATDiplomaPayment(ServiceID, AppID);
            return t_AppDS;
        }
        public DataSet OUATGetProvisionalMarks(string m_ServiceID, string m_AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.OUATGetProvisionalMarks(m_ServiceID, m_AppID);
            return t_AppDS;
        }

        public DataTable GetOUATPGAppDetails(string ServiceID, string AppID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATPGAppDetails(ServiceID, AppID);
            return t_AppDS;
        }

        public DataTable GetOUATUGCounselData(string RollNo)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATUGCounselData(RollNo);
            return t_AppDS;
        }

        public DataTable GetOUATPGCounselData(string RollNo)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATPGCounselData(RollNo);
            return t_AppDS;
        }

        public DataTable GetOUATPGPHDStudentDetails(string RollNo)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATPGPHDStudentDetails(RollNo);
            return t_AppDS;
        }

        public DataSet GetOUATAgroStudentDetails(string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATAgroStudentDetails(AppID);
            return t_AppDS;
        }

        public DataTable GetOUATAgroDiplomaAppDetails(string ServiceID, string AppID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATAgroDiplomaAppDetails(ServiceID, AppID);
            return t_AppDS;
        }

        public DataTable VerifyOUATPGPayment(string ServiceID, string AppID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.VerifyOUATPGPayment(ServiceID, AppID);
            return t_AppDS;
        }

        public DataSet GetOUATFormBAppDetails(string m_ServiceID, string m_AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATFormBAppDetails(m_ServiceID, m_AppID);
            return t_AppDS;
        }
        
        public DataSet OUATAgroProvisional(string m_ServiceID, string m_AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.OUATAgroProvisional(m_ServiceID, m_AppID);
            return t_AppDS;
        }
        public DataSet OUATGetAgroAdmit(string m_ServiceID, string m_AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.OUATGetAgroAdmit(m_ServiceID, m_AppID);
            return t_AppDS;
        }
        public DataSet OUATGetPGAdmitCard(string m_ServiceID, string m_AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.OUATGetPGAdmitCard(m_ServiceID, m_AppID);
            return t_AppDS;
        }

        public DataSet GetOUATAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATAppDetails(ServiceID, AppID);
            return t_AppDS;
        }
        public DataSet GetOUATRefundPaymentReciept(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATRefundPaymentReciept(ServiceID, AppID);
            return t_AppDS;
        }

        public DataSet OUATGetEAdmit(string m_ServiceID, string m_AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.OUATGetEAdmit(m_ServiceID, m_AppID);
            return t_AppDS;
        }

        public DataTable UploadCertificate(string ServiceID, string AppID)
        {
            return m_OUATDAL.UploadCertificate(ServiceID, AppID);
        }

        public DataSet SubmitPayment(string m_ServiceID, string m_AppID, string CreatedBy, string UserType, string SBIRefNo)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.SubmitPayment(m_ServiceID, m_AppID, CreatedBy, UserType, SBIRefNo);
            return t_AppDS;
        }

        public DataTable GetEducationBoard(string stateCode)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetEducationBoard(stateCode);
            return t_AppDS;
        }
        
        public DataTable InsertEPassLog(string rollNo, string appId)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.InsertEPassLog(rollNo, appId);
            return t_AppDS;
        }

        public DataTable GetExamCenter()
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetExamCenter();
            return t_AppDS;
        }

        public DataSet GetOUATFormAData(string UID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATFormAData(UID);
            return t_AppDS;
        }

        public DataSet GetOUATAgroFormAData(string UID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATAgroFormAData(UID);
            return t_AppDS;
        }

        public DataTable GetAgroCentre()
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetAgroCentre();
            return t_AppDS;
        }

        public DataTable GetOUATAppID(string LoginID, string DOB, string AppID, string Mobile, string RollNo, string ExamType)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATAppID(LoginID, DOB, AppID, Mobile, RollNo, ExamType);
            return t_AppDS;
        }

        public DataTable GetOUATAccesFormB(string LoginID, string DOB, string AppID, string Mobile, string RollNo, string ExamType)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATAccesFormB(LoginID, DOB, AppID, Mobile, RollNo, ExamType);
            return t_AppDS;
        }

        public DataTable InsertOUATAdmissionData(OUATAdmissionData_DT t_OUATAdmissionData_DT, string[] aFields)
        {
            return m_OUATDAL.InsertOUATAdmissionData(t_OUATAdmissionData_DT, aFields);
        }

        public DataTable InsertOUATAgroAdmissionData(OUATAgroAdmissionData_DT t_OUATAgroAdmissionData_DT, string[] aFields)
        {
            return m_OUATDAL.InsertOUATAgroAdmissionData(t_OUATAgroAdmissionData_DT, aFields);
        }

        public DataTable InsertOUATPGAdmissionData(OUATPGAdmissionData_DT t_OUATPGAdmissionData_DT, string[] aFields)
        {
            return m_OUATDAL.InsertOUATPGAdmissionData(t_OUATPGAdmissionData_DT, aFields);
        }


        public DataTable InsertOUATUGSpotAdmissionData(OUATUGSpotAdmissionData_DT t_OUATUGSpotAdmissionData_DT, string[] aFields)
        {
            return m_OUATDAL.InsertOUATUGSpotAdmissionData(t_OUATUGSpotAdmissionData_DT, aFields);
        }

        public DataTable GetOUATUGAdmissionData(string RollNo)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATUGAdmissionData(RollNo);
            return t_AppDS;
        }

        public DataTable GetOUATPGAdmissionData(string RollNo)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATPGAdmissionData(RollNo);
            return t_AppDS;
        }

        public DataTable GetOUATAgroAdmissionData(string RollNo)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATAgroAdmissionData(RollNo);
            return t_AppDS;
        }
        public DataSet GetOUATUGSpotAdmissionData(string RollNo, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATUGSpotAdmissionData(RollNo, AppID);
            return t_AppDS;
        }

        public DataTable GetAgroCourse()
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetAgroCourse();
            return t_AppDS;
        }

        public DataSet GetOUATAgroAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATAgroAppDetails(ServiceID, AppID);
            return t_AppDS;
        }

        public DataSet OUATScrutinyData(string m_ServiceID, string LoginID, string DistrictCode, string Category, string FromDate, string ToDate)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.OUATScrutinyData(m_ServiceID, LoginID, DistrictCode, Category, FromDate, ToDate);
            return t_AppDS;
        }

        public DataSet GetOUATFormADataForEdit(string UID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATFormADataForEdit(UID, AppID);
            return t_AppDS;

        }

        public DataSet ScrutinyApplication(string ServiceID, string RowID, string Action, string Reason, string Remarks, string LoginID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.ScrutinyApplication(ServiceID, RowID, Action, Reason, Remarks, LoginID);
            return t_AppDS;
        }

        public DataTable InsertComplaint(OUATComplaint_DT objOUATComp_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OUATDAL.InsertComplaint(objOUATComp_DT, AFields);
            return t_AppDT;
        }

        public DataTable InsertRefund(OUATRefund_DT objOUATRefund_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OUATDAL.InsertRefund(objOUATRefund_DT, AFields);
            return t_AppDT;
        }
        
        public DataTable PrintAdmitLog(string rollNo, string appId)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.PrintAdmitLog(rollNo, appId);
            return t_AppDS;
        }

        public DataTable PrintDiplomaAdmitLog(string rollNo, string appId)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.PrintDiplomaAdmitLog(rollNo, appId);
            return t_AppDS;
        }

        public DataTable PrintAgroAdmitLog(string rollNo, string appId)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.PrintAgroAdmitLog(rollNo, appId);
            return t_AppDS;
        }

        public DataTable PrintPGAdmitLog(string rollNo, string appId)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.PrintPGAdmitLog(rollNo, appId);
            return t_AppDS;
        }

        public DataTable GetOUATDegree(string SelPrograme)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATDegree(SelPrograme);
            return t_AppDS;
        }

        public DataTable GetOUATCollege(string SelCollege)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATCollege(SelCollege);
            return t_AppDS;
        }

        public DataTable GetOUATAgroCollege(string SelCollege)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATAgroCollege(SelCollege);
            return t_AppDS;
        }

        public DataTable GetOUATSubject(string SubjectId)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATSubject(SubjectId);
            return t_AppDS;
        }

        public DataTable ValidateOUATPhdOTP(OTP_DT objOTP_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OUATDAL.ValidateOUATPhdOTP(objOTP_DT, AFields);
            return t_AppDT;
        }
        public DataTable ValidateOUATDiplomaOTP(OTP_DT objOTP_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OUATDAL.ValidateOUATDiplomaOTP(objOTP_DT, AFields);
            return t_AppDT;
        }


        public DataTable GetOUATAadhaarCount(string MobileNo, string AadhaarNo)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OUATDAL.GetOUATAadhaarCount(MobileNo, AadhaarNo);
            return t_AppDT;
        }

        public DataTable InsertOUATPHDFormData(OUATPHDForm_DT data, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OUATDAL.InsertOUATPHDFormData(data, AFields);
            return t_AppDT;
        }

        public DataTable InsertOUATDiplomaFormData(OUATDiplomaForm_DT data, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OUATDAL.InsertOUATDiplomaFormData(data, AFields);
            return t_AppDT;
        }

        public DataSet GetOUATPHDAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATPHDAppDetails(ServiceID, AppID);
            return t_AppDS;
        }

        public DataSet GetOUATDiplomaAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATDiplomaAppDetails(ServiceID, AppID);
            return t_AppDS;
        }

        public DataSet GetOUATAgroFormBAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATAgroFormBAppDetails(ServiceID, AppID);
            return t_AppDS;
        }


        public DataSet GetOUATPGAttendanceSheet(string Option, string CenterID, string AppIDRollNo, string Range, string Print)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.GetOUATPGAttendanceSheet(Option, CenterID, AppIDRollNo, Range,Print);
            return t_AppDS;
        }

        public DataSet GetPGAdmissionAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.GetPGAdmissionAppDetails(ServiceID, AppID);
            return t_AppDS;
        }
        public DataTable VerifySUPGPayment(string ServiceID, string AppID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.VerifySUPGPayment(ServiceID, AppID);
            return t_AppDS;
        }

        /*Sart of PG PhD Intimation Logic*/
        #region Intimation
        public DataSet GetSUPGPhDIntimation(string m_ServiceID, string m_RollNo, string LoginID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.GetSUPGPhDIntimation(m_ServiceID, m_RollNo, LoginID);
            return t_AppDS;
        }

        public DataTable InsertPGPhDIntimationData(IntimationData_DT t_IntimationData_DT, string[] aFields)
        {
            return m_OUATDAL.InsertPGPhDIntimationData(t_IntimationData_DT, aFields);
        }
        #endregion
        /*End of PGPhd Intimation Logic*/

        #region CSVTUPhDApplication

        public DataTable GetPhDResearchCenter()
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetPhDResearchCenter();
            return t_AppDS;
        }

        public DataTable GetPhDDiscipline(string RCCode, string IsMPhil, string IsExemption)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetPhDDiscipline(RCCode, IsMPhil, IsExemption);
            return t_AppDS;
        }

        public DataTable GetPhDSpecialization(string DisciplineCode)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_OUATDAL.GetPhDSpecialization(DisciplineCode);
            return t_AppDS;
        }
        #endregion

        #region CSVTUPhDApplication
        public DataSet ValidateRegisteredMobileCSVTU(string Mobile, string Type)
        {
            DataSet dt = null;
            dt = m_OUATDAL.ValidateRegisteredMobileCSVTU(Mobile, Type);
            return dt;
        }

        public DataTable InsertOTPCSVTU(OTP_DT objOTP_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OUATDAL.InsertOTPCSVTU(objOTP_DT, AFields);
            return t_AppDT;
        }

        public DataTable ValidateOTPCSVTU(OTP_DT objOTP_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OUATDAL.ValidateOTPCSVTU(objOTP_DT, AFields);
            return t_AppDT;
        }

        public DataSet GetCSVTUPGPhDAppDetail(string AppID, string ServiceID)
        {
            DataSet dt = null;
            dt = m_OUATDAL.GetCSVTUPGPhDAppDetail(AppID, ServiceID);
            return dt;
        }

        public DataTable InsertCSVTUPGPhDData(CSVTUPhDForm_DT data, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OUATDAL.InsertCSVTUPGPhDData(data, AFields);
            return t_AppDT;
        }

        public DataTable GetCitizenDashboardCSVTU(string CItiZenUser, string ProfileID, string KeyField)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OUATDAL.GetCitizenDashboardCSVTU(CItiZenUser, ProfileID, KeyField);
            return t_AppDT;
        }

        public DataSet CSVTUPhDAdmitCard(string m_ServiceID, string m_AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OUATDAL.CSVTUPhDAdmitCard(m_ServiceID, m_AppID);
            return t_AppDS;
        }
        #endregion
    }
}
