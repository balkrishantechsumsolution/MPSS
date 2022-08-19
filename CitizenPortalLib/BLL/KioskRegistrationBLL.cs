using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CitizenPortalLib.DAL;
using System.Data;
using CitizenPortalLib.DataStructs;
using System.Transactions;

namespace CitizenPortalLib.BLL
{
    public class KioskRegistrationBLL : BLLBase
    {        
        private KioskRegistrationDAL m_KioskRegistrationDAL;

        public KioskRegistrationBLL()
        {
            m_KioskRegistrationDAL = new KioskRegistrationDAL();
            m_KioskRegistrationDAL.CurrentCulture = "1";
        }

        public DataTable GetSIRBApplicantList(string BirthDate, string AppID, string Mobile, string FName)
        {
            return m_KioskRegistrationDAL.GetSIRBApplicantList(BirthDate, AppID, Mobile, FName);
        }

        public KioskRegistrationBLL(string CurrentCulture)
        {
            m_KioskRegistrationDAL = new KioskRegistrationDAL();
            m_KioskRegistrationDAL.CurrentCulture = CurrentCulture;
        }

        public DataTable GetDUList()
        {
            return m_KioskRegistrationDAL.GetDUList();
        }

        public DataTable GetDivision()
        {
            return m_KioskRegistrationDAL.GetDivision();
        }

        public DataSet GetAppStatusWithURL(string ServiceID, string AppID, string UserType)
        {
            return m_KioskRegistrationDAL.GetAppStatusWithURL(ServiceID, AppID, UserType);
        }

        public DataTable GetDistrict()
        {
            return m_KioskRegistrationDAL.GetDistrict();
        }

        public DataTable GetDistrict(string p_LangID)
        {
            return m_KioskRegistrationDAL.GetDistrict(p_LangID);
        }

        public DataTable GetDistrictFromState(string StateCode)
        {
            return m_KioskRegistrationDAL.GetDistrictFromState(StateCode);
        }

        public DataTable GetBlock(string DistrictCode)
        {
            return m_KioskRegistrationDAL.GetBlock(DistrictCode);
        }

        public DataTable GetSubDistrict(string DistrictCode)
        {
            return m_KioskRegistrationDAL.GetSubDistrict(DistrictCode);
        }

        public DataTable GetSubDivision(string DistrictCode)
        {
            return m_KioskRegistrationDAL.GetSubDivision(DistrictCode);
        }

        public DataTable GetSubDistrict(string p_LangID, string DistrictCode)
        {
            return m_KioskRegistrationDAL.GetSubDistrict(p_LangID, DistrictCode);
        }

        public DataTable GetPanchayat(string SubDistrictCode)
        {
            return m_KioskRegistrationDAL.GetPanchayat(SubDistrictCode);
        }

        public DataTable GetVillage(string PanchayatCode)
        {
            return m_KioskRegistrationDAL.GetVillage(PanchayatCode);
        }

        public DataTable GetState()
        {
            return m_KioskRegistrationDAL.GetState();
        }
        public string Insert(KioskRegistration_DT objKioskRegistration_DT, string[] AFields, List<KioskAddressDetails_DT> ListKioskAddressDetails, string[] AAddressFields)
        {
            string t_KioskID = "";
            string SCAID = "", DistrictCode = "", SubDistrictCode = "", VillageCode = "";
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                m_KioskRegistrationDAL.Insert(objKioskRegistration_DT, AFields);

                //Logic for Inserting Address Details
                foreach (KioskAddressDetails_DT AddressDetails_DT in ListKioskAddressDetails)
                {
                    if (AddressDetails_DT.ChildKey.ToUpper() == "KIOSK")
                    {
                        SCAID = objKioskRegistration_DT.KioskType;
                        DistrictCode = AddressDetails_DT.District_Code.ToString();
                        SubDistrictCode = AddressDetails_DT.Taluka_Code.ToString();
                        VillageCode = AddressDetails_DT.Village_Code.ToString();
                    }

                    AddAddress(AddressDetails_DT, AAddressFields);
                }

                t_KioskID = m_KioskRegistrationDAL.GenerateID(objKioskRegistration_DT, SCAID, DistrictCode, SubDistrictCode, VillageCode);

                scope.Complete();

            }

            return t_KioskID;
        }

        public DataTable GetServiceName(string SvcName)
        {
            return m_KioskRegistrationDAL.GetServiceName(SvcName);
        }

        public DataTable GetServiceTitle(int SvcID)
        {
            return m_KioskRegistrationDAL.GetServiceTitle(SvcID);
        }

        public DataTable InsertV2(KioskRegistrationV2_DT objKioskRegistration_DT, string[] AFields)
        {
            DataTable t_KioskID = null;            
            //using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                t_KioskID = m_KioskRegistrationDAL.InsertV2(objKioskRegistration_DT, AFields);

                //scope.Complete();

            }

            return t_KioskID;
        }

        public DataTable GetKioskDashboardGrid(string KioskUser)
        {
            DataTable t_KioskID = null;

            t_KioskID = m_KioskRegistrationDAL.GetKioskDashboardGrid(KioskUser);

            return t_KioskID;
        }

        private void AddAddress(KioskAddressDetails_DT KioskAddressDetails, string[] AFields)
        {
            m_KioskRegistrationDAL.InsertAddress(KioskAddressDetails, AFields);
        }

        public DataTable GetSCA()
        {
            return m_KioskRegistrationDAL.GetSCA();
        }

        public DataTable GetAllSCA()
        {
            return m_KioskRegistrationDAL.GetAllSCA();
        }

        public DataTable LoggedSCA(string SCAID)
        {
            return m_KioskRegistrationDAL.LoggedSCA(SCAID);
        }

        public DataTable GetResidenceProof()
        {
            return m_KioskRegistrationDAL.GetResidenceProof();
        }

        public DataTable GetPanchayatFromSubDistrict(string SubDistrict)
        {
            return m_KioskRegistrationDAL.GetPanchayatFromSubDistrict(SubDistrict);
        }

        public DataTable GetVillageFromSubDistrict(string SubDistrict)
        {
            return m_KioskRegistrationDAL.GetVillageFromSubDistrict(SubDistrict);
        }

        public DataTable GetVillageFromSubDistrict(string p_LangID, string SubDistrict)
        {
            return m_KioskRegistrationDAL.GetVillageFromSubDistrict(p_LangID, SubDistrict);
        }

        public string GetPinNoForVillage(string Village)
        {
            return m_KioskRegistrationDAL.GetPinNoForVillage(Village);
        }

        public KioskRegistration_DT GetKioskDetails(string KioskID)
        {
            DataTable t_DT = m_KioskRegistrationDAL.GetKioskDetailsFromKioskID(KioskID);

            DataRow dr = t_DT.Rows[0];

            KioskRegistration_DT objKioskRegistration_DT = new DataStructs.KioskRegistration_DT();            

            objKioskRegistration_DT.KioskID = dr["KioskID"].ToString();
            objKioskRegistration_DT.kiosk_name = dr["kiosk_name"].ToString();
            objKioskRegistration_DT.owner_first_name = dr["owner_first_name"].ToString();
            objKioskRegistration_DT.owner_middle_name = dr["owner_middle_name"].ToString();
            objKioskRegistration_DT.owner_last_name = dr["owner_last_name"].ToString();
            objKioskRegistration_DT.owner_father_name = dr["owner_father_name"].ToString();

            objKioskRegistration_DT.KioskType = dr["KioskType"].ToString();
            objKioskRegistration_DT.kiosk_email_id = dr["kiosk_email_id"].ToString();
            objKioskRegistration_DT.kiosk_phone_no = dr["kiosk_phone_no"].ToString();
            objKioskRegistration_DT.kiosk_mobile_no = dr["kiosk_mobile_no"].ToString();
            objKioskRegistration_DT.kiosk_fax_no = dr["kiosk_fax_no"].ToString();
            objKioskRegistration_DT.kiosk_tin_no = dr["kiosk_tin_no"].ToString();

            objKioskRegistration_DT.owner_phone_no = dr["owner_phone_no"].ToString();
            objKioskRegistration_DT.owner_Pan_no = dr["owner_Pan_no"].ToString();
            objKioskRegistration_DT.owner_resi_proof = dr["owner_resi_proof"].ToString();
            objKioskRegistration_DT.owner_resi_proof_no = dr["owner_resi_proof_no"].ToString();

            objKioskRegistration_DT.police_reg_no = dr["police_reg_no"].ToString();
            objKioskRegistration_DT.tin_sh_reg_no = dr["tin_sh_reg_no"].ToString();
            objKioskRegistration_DT.comps_desc = dr["comps_desc"].ToString();
            objKioskRegistration_DT.scanner_desc = dr["scanner_desc"].ToString();
            objKioskRegistration_DT.printer_desc = dr["printer_desc"].ToString();
            objKioskRegistration_DT.camera_desc = dr["camera_desc"].ToString();
            objKioskRegistration_DT.any_othr_business = dr["any_othr_business"].ToString();
            objKioskRegistration_DT.comfort_level = dr["comfort_level"].ToString();
            objKioskRegistration_DT.internet_conn_type = dr["internet_conn_type"].ToString();
            objKioskRegistration_DT.loc_colleges = dr["loc_colleges"].ToString();
            objKioskRegistration_DT.loc_hostels = dr["loc_hostels"].ToString();
            objKioskRegistration_DT.loc_schools = dr["loc_schools"].ToString();

            objKioskRegistration_DT.loc_govt_offices = dr["loc_govt_offices"].ToString();
            objKioskRegistration_DT.loc_others = dr["loc_others"].ToString();
            //objKioskRegistration_DT.kiosk_status = dr["kiosk_status"].ToString();
            objKioskRegistration_DT.ApprovalStatus = dr["ApprovalStatus"].ToString();
            objKioskRegistration_DT.FinancialStatus = dr["FinancialStatus"].ToString();
            objKioskRegistration_DT.KeyField = dr["KeyField"].ToString();
            objKioskRegistration_DT.ImageName = dr["ImageName"].ToString();

            return objKioskRegistration_DT;
        }

        public void GetKioskDetails(string RowID, out KioskRegistration_DT KioskRegistration_DT, out KioskRegistrationStepII_DT KioskRegistrationStepII_DT)
        {
            DataTable t_DT = m_KioskRegistrationDAL.GetKioskDetails(RowID);

            DataRow dr = t_DT.Rows[0];

            KioskRegistration_DT objKioskRegistration_DT = new DataStructs.KioskRegistration_DT();
            KioskRegistrationStepII_DT objKioskRegistrationStepII_DT = new DataStructs.KioskRegistrationStepII_DT();

            objKioskRegistration_DT.KioskID = dr["KioskID"].ToString();
            objKioskRegistration_DT.kiosk_name = dr["kiosk_name"].ToString();
            objKioskRegistration_DT.owner_first_name = dr["owner_first_name"].ToString();
            objKioskRegistration_DT.owner_middle_name = dr["owner_middle_name"].ToString();
            objKioskRegistration_DT.owner_last_name = dr["owner_last_name"].ToString();
            objKioskRegistration_DT.owner_father_name = dr["owner_father_name"].ToString();

            objKioskRegistration_DT.KioskType = dr["KioskType"].ToString();
            objKioskRegistration_DT.kiosk_email_id = dr["kiosk_email_id"].ToString();
            objKioskRegistration_DT.kiosk_phone_no = dr["kiosk_phone_no"].ToString();
            objKioskRegistration_DT.kiosk_mobile_no = dr["kiosk_mobile_no"].ToString();
            objKioskRegistration_DT.kiosk_fax_no = dr["kiosk_fax_no"].ToString();
            objKioskRegistration_DT.kiosk_tin_no = dr["kiosk_tin_no"].ToString();

            objKioskRegistration_DT.owner_phone_no = dr["owner_phone_no"].ToString();
            objKioskRegistration_DT.owner_Pan_no = dr["owner_Pan_no"].ToString();
            objKioskRegistration_DT.owner_resi_proof = dr["owner_resi_proof"].ToString();
            objKioskRegistration_DT.owner_resi_proof_no = dr["owner_resi_proof_no"].ToString();

            objKioskRegistration_DT.police_reg_no = dr["police_reg_no"].ToString();
            objKioskRegistration_DT.tin_sh_reg_no = dr["tin_sh_reg_no"].ToString();
            objKioskRegistration_DT.comps_desc = dr["comps_desc"].ToString();
            objKioskRegistration_DT.scanner_desc = dr["scanner_desc"].ToString();
            objKioskRegistration_DT.printer_desc = dr["printer_desc"].ToString();
            objKioskRegistration_DT.camera_desc = dr["camera_desc"].ToString();
            objKioskRegistration_DT.any_othr_business = dr["any_othr_business"].ToString();
            objKioskRegistration_DT.comfort_level = dr["comfort_level"].ToString();
            objKioskRegistration_DT.internet_conn_type = dr["internet_conn_type"].ToString();
            objKioskRegistration_DT.loc_colleges = dr["loc_colleges"].ToString();
            objKioskRegistration_DT.loc_hostels = dr["loc_hostels"].ToString();
            objKioskRegistration_DT.loc_schools = dr["loc_schools"].ToString();

            objKioskRegistration_DT.loc_govt_offices = dr["loc_govt_offices"].ToString();
            objKioskRegistration_DT.loc_others = dr["loc_others"].ToString();
            //objKioskRegistration_DT.kiosk_status = dr["kiosk_status"].ToString();
            objKioskRegistration_DT.OMTID = dr["OMTID"].ToString();
            

            KioskRegistration_DT = objKioskRegistration_DT;


            objKioskRegistrationStepII_DT.any_othr_business = dr["any_othr_business"].ToString();
            objKioskRegistrationStepII_DT.internet_conn_type = dr["internet_conn_type"].ToString();
            objKioskRegistrationStepII_DT.back_up_power = CheckNullOrEmpty(dr["back_up_power"]) ? (int?)null : Convert.ToInt32(dr["back_up_power"].ToString());
            objKioskRegistrationStepII_DT.power_cut = CheckNullOrEmpty(dr["back_up_power"]) ? (int?)null : Convert.ToInt32(dr["power_cut"].ToString());

            objKioskRegistrationStepII_DT.no_of_comps = CheckNullOrEmpty(dr["back_up_power"]) ? (int?)null : Convert.ToInt32(dr["no_of_comps"].ToString());
            objKioskRegistrationStepII_DT.comps_desc = dr["comps_desc"].ToString();
            objKioskRegistrationStepII_DT.no_of_scanner = CheckNullOrEmpty(dr["no_of_scanner"]) ? (int?)null : Convert.ToInt32(dr["no_of_scanner"].ToString());
            objKioskRegistrationStepII_DT.scanner_desc = dr["scanner_desc"].ToString();
            objKioskRegistrationStepII_DT.no_of_printer = CheckNullOrEmpty(dr["no_of_scanner"]) ? (int?)null : Convert.ToInt32(dr["no_of_scanner"].ToString());
            objKioskRegistrationStepII_DT.printer_desc = dr["printer_desc"].ToString();
            objKioskRegistrationStepII_DT.no_of_camera = CheckNullOrEmpty(dr["no_of_camera"]) ? (int?)null : Convert.ToInt32(dr["no_of_camera"].ToString());
            objKioskRegistrationStepII_DT.camera_desc = dr["camera_desc"].ToString();

            objKioskRegistrationStepII_DT.avg_students = CheckNullOrEmpty(dr["avg_students"]) ? (int?)null : Convert.ToInt32(dr["avg_students"].ToString());
            objKioskRegistrationStepII_DT.avg_general = CheckNullOrEmpty(dr["avg_general"]) ? (int?)null : Convert.ToInt32(dr["avg_general"].ToString());
            objKioskRegistrationStepII_DT.loc_colleges = CheckNullOrEmpty(dr["loc_colleges"]) ? (int?)null : Convert.ToInt32(dr["loc_colleges"].ToString());
            objKioskRegistrationStepII_DT.loc_hostels = CheckNullOrEmpty(dr["loc_hostels"]) ? (int?)null : Convert.ToInt32(dr["loc_hostels"].ToString());
            objKioskRegistrationStepII_DT.loc_schools = CheckNullOrEmpty(dr["loc_schools"]) ? (int?)null : Convert.ToInt32(dr["loc_schools"].ToString());
            objKioskRegistrationStepII_DT.loc_pvt_offices = CheckNullOrEmpty(dr["loc_pvt_offices"]) ? (int?)null : Convert.ToInt32(dr["loc_pvt_offices"].ToString());
            objKioskRegistrationStepII_DT.loc_govt_offices = CheckNullOrEmpty(dr["loc_govt_offices"]) ? (int?)null : Convert.ToInt32(dr["loc_govt_offices"].ToString());
            objKioskRegistrationStepII_DT.loc_others = CheckNullOrEmpty(dr["loc_others"]) ? (int?)null : Convert.ToInt32(dr["loc_others"].ToString());
            objKioskRegistrationStepII_DT.ImageName = dr["ImageName"].ToString();
            objKioskRegistrationStepII_DT.KIOSKImage = CheckNullOrEmpty(dr["KIOSKImage"]) ? null : (byte[])dr["KIOSKImage"];

            KioskRegistrationStepII_DT = objKioskRegistrationStepII_DT;
        }

        bool CheckNullOrEmpty(object value)
        {
            return value == DBNull.Value || string.IsNullOrEmpty(value.ToString());
        }

        public List<KioskAddressDetails_DT> GetKioskAddressDetails(string RowID)
        {
            List<KioskAddressDetails_DT> objKioskAddressDetailsArr = new List<KioskAddressDetails_DT>();

            KioskAddressDetails_DT objKioskAddressDetails_DT = new KioskAddressDetails_DT();

            DataTable t_DT = m_KioskRegistrationDAL.GetKioskAddressDetails(RowID);


            foreach (DataRow dr in t_DT.Rows)
            {
                objKioskAddressDetails_DT = new KioskAddressDetails_DT();

                objKioskAddressDetails_DT.ChildKey = dr["ChildKey"].ToString();
                objKioskAddressDetails_DT.AddrCareOf = dr["AddrCareOf"].ToString();
                objKioskAddressDetails_DT.AddrBuilding = dr["AddrBuilding"].ToString();
                objKioskAddressDetails_DT.AddrStreet = dr["AddrStreet"].ToString();
                objKioskAddressDetails_DT.AddrLandmark = dr["AddrLandmark"].ToString();
                objKioskAddressDetails_DT.AddrLocality = dr["AddrLocality"].ToString();

                objKioskAddressDetails_DT.District = dr["District"].ToString();
                objKioskAddressDetails_DT.Taluka = dr["Taluka"].ToString();
                objKioskAddressDetails_DT.Panchayat = dr["Panchayat"].ToString();
                objKioskAddressDetails_DT.Village = dr["Village"].ToString();

                objKioskAddressDetails_DT.PinCode = Convert.ToInt32(dr["PinCode"].ToString());

                objKioskAddressDetailsArr.Add(objKioskAddressDetails_DT);

            }

            return objKioskAddressDetailsArr;
        }

        public List<KioskAddressDetails_DT> GetQuickKioskAddress(string KIOSKID)
        {
            List<KioskAddressDetails_DT> objKioskAddressDetailsArr = new List<KioskAddressDetails_DT>();

            KioskAddressDetails_DT objKioskAddressDetails_DT = new KioskAddressDetails_DT();

            DataTable t_DT = m_KioskRegistrationDAL.GetQuickKioskAddress(KIOSKID);


            foreach (DataRow dr in t_DT.Rows)
            {
                objKioskAddressDetails_DT = new KioskAddressDetails_DT();

                objKioskAddressDetails_DT.ChildKey = dr["ChildKey"].ToString();
                objKioskAddressDetails_DT.AddrCareOf = dr["AddrCareOf"].ToString();
                objKioskAddressDetails_DT.AddrBuilding = dr["AddrBuilding"].ToString();
                objKioskAddressDetails_DT.AddrStreet = dr["AddrStreet"].ToString();
                objKioskAddressDetails_DT.AddrLandmark = dr["AddrLandmark"].ToString();
                objKioskAddressDetails_DT.AddrLocality = dr["AddrLocality"].ToString();

                objKioskAddressDetails_DT.District_Code = dr["District_Code"].ToString();
                objKioskAddressDetails_DT.Taluka_Code = dr["Taluka_Code"].ToString();
                objKioskAddressDetails_DT.Panchayat_Code = dr["Panchayat_Code"].ToString();
                objKioskAddressDetails_DT.Village_Code = dr["Village_Code"].ToString();

                objKioskAddressDetails_DT.PinCode = Convert.ToInt32(dr["PinCode"].ToString());

                objKioskAddressDetailsArr.Add(objKioskAddressDetails_DT);

            }

            return objKioskAddressDetailsArr;
        }

        public int ValidateEmail(string EmailID)
        {
            return m_KioskRegistrationDAL.ValidateEmail(EmailID);
        }

        public string GetPaymentFlag(string KioskID, string OperatorID)
        {
            return m_KioskRegistrationDAL.GetPaymentFlag(KioskID, OperatorID);
        }

        public string GetVillageCode(string KioskID)
        {
            return m_KioskRegistrationDAL.GetVillageCode(KioskID);
        }

        public DataTable GetKIOSKDistrict()
        {
            return m_KioskRegistrationDAL.GetKIOSKDistrict();
        }

        public DataTable GetKIOSKDistrict(string p_LangID)
        {
            return m_KioskRegistrationDAL.GetKIOSKDistrict(p_LangID);
        }

        public string GetKioskName(string KioskID)
        {
            return m_KioskRegistrationDAL.GetKioskName(KioskID);
        }

        public DataTable GetPanchayat(string p_LangID, string SubDistrictCode)
        {
            return m_KioskRegistrationDAL.GetPanchayat(p_LangID, SubDistrictCode);
        }

        public DataTable GetVillage(string p_LangID, string PanchayatCode)
        {
            return m_KioskRegistrationDAL.GetVillage(p_LangID, PanchayatCode);
        }

        public DataTable GetCSCCenterList()
        {
            return m_KioskRegistrationDAL.GetCSCCenterList();
        }
        public DataTable GetCSCCenterList(string DistrictCode)
        {
            return m_KioskRegistrationDAL.GetCSCCenterList(DistrictCode);
        }

        public DataTable GetReportSpName(string ReportId)
        {
            return m_KioskRegistrationDAL.GetReportSpName(ReportId);
        }
        public DataTable GetReportList(string ReportId,string ReportSpName)
        {
            return m_KioskRegistrationDAL.GetReportList(ReportId, ReportSpName);
        }

        public DataTable GetState_OUAT()
        {
            return m_KioskRegistrationDAL.GetState_OUAT();
        }

        public DataTable GetBankName()
        {
            return m_KioskRegistrationDAL.GetBankName();
        }

        public DataTable GetDistrict_OUAT(string stateCode)
        {
            return m_KioskRegistrationDAL.GetDistrict_OUAT(stateCode);
        }
        public DataTable GetSeniorCitizenOdishaDist(string stateCode)
        {
            return m_KioskRegistrationDAL.GetSeniorCitizenOdishaDist(stateCode);
        }
        public DataTable GetBlock_OUAT(string districtCode)
        {
            return m_KioskRegistrationDAL.GetBlock_OUAT(districtCode);
        }

        public DataTable GetPanchayat_OUAT(string subDistrictCode)
        {
            return m_KioskRegistrationDAL.GetPanchayat_OUAT(subDistrictCode);
        }

    }
}