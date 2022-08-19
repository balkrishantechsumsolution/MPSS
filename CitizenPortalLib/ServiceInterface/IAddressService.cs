using CitizenPortalLib.DataStructs;
using System.Collections.Generic;
using System.ServiceModel;
using System.ServiceModel.Web;

namespace CitizenPortalLib.ServiceInterface
{
    [ServiceContract]
    public interface IAddressService
    {
        [OperationContract]
        void DoWork();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetDistrict(string prefix, string StateCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetSubDistrict(string prefix, string DistrictCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetBlock(string prefix, string DistrictCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetPanchayat(string prefix, string SubDistrictCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetVillage(string prefix, string SubDistrictCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetState(string prefix);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertData(KioskRegistrationV2_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertSeniorCitizen(SeniorCitizen_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertNFBSForm(NFBS_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertBirthCertificate(BirthCertificate_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertFIRRegistration(FIRRegistration_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertComplaintRegistration(ComplaintRegistration_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertRatingFeedBack(RatingFeedBack_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertServiceFeedBack(ServiceFeedBack_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SearchBirthData(SearchBirthData_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertBanishree(Banishree_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertBasicDetails(BasicDetails_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertCitizenBasicDetails(CitizenBasicDetails_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertCitizenProfile(CitizenProfile_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertCreateProfile(CreateProfile_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertDeathCertificate(DeathCertificate_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertNFBS(NFBS_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertMigration(Migration_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertMigrationITI(MigrationITI_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertDuplicateDiploma(DuplicateDiploma_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertMBPY(MBPY_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertHSBT(HSBT_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertIGNWP(IGNWP_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertIGNDP(IGNDP_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertFarmerRegistration(FarmerRegistration_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertIGNOAP(IGNOAP_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertWaterConnection(WaterConnection_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        List<string> GetServiceName(string prefix, string SvcName);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetDeclaration(string prefix, string UID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string CheckLocalAadhaar(string prefix, string UID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetUIDKeyField(string prefix, string UID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetServices(string prefix);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetDeptServices(string prefix, string DepartmentCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetDepartmentCode(string prefix, string DepartmentCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetDepartment(string prefix);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetOffice(string prefix, string DistrictCode, string TalukaCode, string VillageCode, string ServiceCode, string DepartmentCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetOfficer(string prefix, string OfficeCode, string ServiceCode, string DistrictCode, string BlockCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string BindAppleteAuthority(string prefix, string ServiceCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertCMRF(CMRF_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertConversion(Conversion_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertBirthRegistration(BirthRegistration_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertTranscript(Transcript_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertDivisionalCertificate(DivisionalCertificate_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GenerateOTP(string Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetUIDJSon(string Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ValidateOTP(string Data, string EnteredOTP);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ValidateCitizenOTP(string Data, string EnteredOTP);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetCitizenProfile(string MobileNo);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetCitizenProfileData(string prefix, string Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GenerateCitizenOTP(string prefix, string MobileNo);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ValidateMobile(string prefix, string Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string BindBPLYear(int ServiceId, string State, string District, string Taluka, string Village);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertLoginDetail(LoginDetail_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string CheckAvability(string UserId);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string binddetails(string uid);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetUserDetails(string prefix, string UID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetSVIDdetail(string UID, string langID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string BindCategory();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string BindReligion();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string BindMaritalstatus();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertOISFProfile(OISFProfile_DT Data);

        //Test Changes

        //for battalion
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertOISFProfileDataOffLine(OISFProfile_DT Data);

        //for battalion

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertConstableData(OISFProfile_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetEducationBoard(string prefix, string StateCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetEmploymentExchange(string prefix, string DistrictCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetRTOList(string prefix, string DistrictCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetPoliceStation(string prefix, string StateCode, string DistrictCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string CheckMobileNo(string MobileNo);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertMenialData(MenialStaffProfile_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetBatallionList(string CategoryCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetInstituteMaster();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetInstituteMasterlegacy();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetInstituteMasterITI();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetBranchMaster();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetBranchMasterlegacy();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetSemester(string SvcID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetITICourseMaster();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetSubject(string SemesterCode, string BranchCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertManualDetail(string BattalionID, string DraftNo, string FormNo);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertEPassLog(string RollNo, string AppID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetEAppealServices(string prefix);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetEAppealDeptServices(string prefix, string DepartmentCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetEAppealDepartment(string prefix);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetEAppealDepartmentCode(string prefix, string DepartmentCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetOfficeName(string prefix, string ServiceCode, string DepartmentCode, string DistrictCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertEAppeal(EAppeal_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GenerateMobileOTP(string prefix, string MobileNo, string email);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SendSMSOnMobile(string UID, string EnteredOTP, string profileId);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string BindEAppealAppleteAuthority(string prefix, string ServiceCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertMutation(Mutation_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertFinancialAssistance(FinancialAssistance_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertFinancialAssistance2(FinancialAssistance2_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertFinancialAssistance3(FinancialAssistance3_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertFinancialAssistance4(FinancialAssistance4_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetExamCenter(string prefix);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertOUATApp(OUATProfile_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertOUATFormA(OUATFormA_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetOUATFormADataForEdit(string prefix, string UID, string AppID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertOUATFormB(OUATFormA_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetOUATFormAData(string prefix, string UID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertOUATAgroFormA(OUATAgroFormA_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetOUATAgroFormAData(string prefix, string UID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertMigrationNew(MigrationNew_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertNewMigration(NewMigration_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string EAdmitCardLog(string RollNo, string AppID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ValidateOUATOTP(string Data, string EnteredOTP);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertNewMigrationVerify(NewMigrationVerify_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetAgroCentre(string prefix);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetAgroCourse(string prefix);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ValidateOUATOTPAgro(string Data, string EnteredOTP);

        //code for username otp
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SendOtpForUsername(string prefix, string MobileNo, string email);

        //
        //code for send username
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SendUsername(string UID, string EnteredOTP, string profileId);

        //

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetDistrict_OUAT(string prefix, string StateCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetSeniorCitizenOdishaDist(string prefix, string StateCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetState_OUAT();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetBankName();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetBlock_OUAT(string prefix, string DistrictCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetPanchayat_OUAT(string prefix, string SubDistrictCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertComplaint(OUATComplaint_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertRefund(OUATRefund_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PrintAdmitLog(string RollNo, string AppID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PrintDiplomaAdmitLog(string RollNo, string AppID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PrintAgroAdmitLog(string RollNo, string AppID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PrintPGAdmitLog(string RollNo, string AppID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetOUATDegree(string SelPrograme);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetOUATCollege(string SelCollege);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetOUATSubject(string SubjectId);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ValidateOUATPhdOTP(string Data, string EnteredOTP);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ValidateOUATDiplomaOTP(string Data, string EnteredOTP);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertOUATPHDFormData(OUATPHDForm_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertOUATDiplomaFormData(OUATDiplomaForm_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertTranscriptITI(TranscriptITI_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertRoadTaxFormData(RoadTaxForm_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertSeniorCitizenIDCardData(SeniorCitizenIDCard_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ValidateAadhaarNo(string AadhaarNumber);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetDistrictPoliceStations(string prefix, string DistrictCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertPNTCData(DivisionalCertificate_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertOUATAgroFormB(OUATAgroFormB_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertSeniorCitizenCheckList(SeniorCitizenCheckList_DT Data);

        //[OperationContract]
        //[WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        //string GetSeniorCitizenOdishaDist(string prefix, string StateCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertUGMarksEntry(UGMarksEntry_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertCBCSAdmissionFormData(CBCSAdmissionForm_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertEnrolementFormData(EnrolementAdmissionForm_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertCBCSAdmissionFormDataByStudent(CBCSAdmissionForm_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertAdmissionFormDataByDEO(CBCSAdmissionForm_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertBackExamFormDataByDEO(BackExamForm_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetCBCSCourseLists();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetCBCSSubjectLists(string coursename, string SubjectType);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetApplicationDetails(string AppID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetStudentDetails(string EnrolementNo, string Branch);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetRelationList();

        #region CharaterCertificate

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertCharaterCertificate(CTTNSCharacter Data);

        #endregion CharaterCertificate

        #region Residence

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetCCTNSDistrict();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetCCTNSSubDiv(int DistCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetCCTNSTahsil(int DistCode, int SubDiv);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetCCTNSBlock(int DistCode, int SubDiv);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetCCTNSRI(int DistCode, int SubDiv, int Tahsil);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertResidence(CCTNSResidence Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertOUATUGEducation(OUATUGEducation_DT Data);

        #endregion Residence

        #region ComplaintRegistration

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsComplaintReg(ComplaintReg ObjComplaintReg);

        #endregion ComplaintRegistration

        #region CCTNS Master Data

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetCCTNSMRelation();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetCCTNSMIdentity();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetCCTNSMNationality();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetCCTNSMState();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetCCTNSMDistrict(int STATEID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetCCTNSMPoliceStation(int STATEID, int DISTRICTID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetCCTNSMOffice(int STATEID, int DISTRICTID);

        #endregion CCTNS Master Data

        /******* Sumbalpur University ********/

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetCollegeMaster();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetSUBranchMaster();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertMigrationSU(MigrationSU_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertTransferSU(CollegeTransfer_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertDuplicateDegree(DuplicateDegree_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertProvisionalCertificate(ProvisionalCertificate_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertRegistrationReceipt(RegistrationReceipt_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertDocumnetVerification(DocumentVerification_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetReasonMaster(string SvcID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertDeptProfile(DeptProfile_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SendForgetPassword(string UID, string EnteredOTP, string ProfileID, string UType);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetEditApplicationDetails(string AppID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string EditStudentData(CBCSAdmissionForm_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetSUCollegeList();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetSUDepartmentList(string CollegeCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetSUSubjectList(string DepartmentCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ValidateRegisteredMobile(string Mobile, string Type);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertPGAdmissionFormData(SUPGAdmission_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetProgramList(string DepartmentCode, string CourseType);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetEligibilityCriterea(string ProgramId);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetData(string AppID,string ServiceId);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string EditStudentData1617(CBCSAdmissionForm_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetEditApplicationDetails1617(string AppID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetEditStudentInfo(string RollNo);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string UpdateStudentData(CBCSAdmissionForm_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertNoticeDetail(NoticeData_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetNoticeDetail(string SearchText, string FromDate, string ToDate, string NoticeType);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetStudentCount(string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, string HonsCode, int ReportType);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetDrillSemFee(string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, int ReportType);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetSemFeeCount(string LoginID, int ExamYear, string CollegeCode, string Semester, string BranchCode, string ExamType, int ReportType);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetStudentChart(string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, string HonsCode, int ReportType);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetStudentInternal(string LoginID);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetEditStudentPics(string RollNo);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string UpdateStudentPics(EditStudentPics_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetPhDResearchCenter();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetPhDDiscipline(string RCCode, string IsMPhil, string IsExemption);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetPhDSpecialization(string DisciplineCode);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ValidateRegisteredMobileCSVTU(string Mobile, string Type);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GenerateOTPCSVTU(string prefix, string Data, string AppType);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ValidateOTPCSVTU(string Data, string EnteredOTP);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertPHDFormData(CSVTUPhDForm_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertEnrollmentData(EnrollmentData_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertPasswordDetail(UpdateStudentPassword_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertEnrollmentPartTime(EnrollmentData_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string UpdateEnrollmentData(EnrollmentData_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertCBSAData(CBACSVTU_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertTranscriptCBSAData(CBACSVTU_DT Data);

    }
}