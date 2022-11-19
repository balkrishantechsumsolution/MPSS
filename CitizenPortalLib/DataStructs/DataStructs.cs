using CitizenPortal.WebApp;
using System;
using System.Collections.Generic;
using System.Data;

namespace CitizenPortalLib.DataStructs
{
    public class KioskRegistration_DT
    {
        public string KeyField;
        public string KioskID;

        public string channel_id, channel_usr_id, kiosk_name, owner_first_name, owner_middle_name, owner_last_name, owner_father_name,
            //kiosk_address1, kiosk_address2, kiosk_address3, kiosk_division, kiosk_district, kiosk_tehsil, kiosk_block, kiosk_city_code,
            is_done,
            kiosk_state, kiosk_pin_code, kiosk_phone_no, kiosk_mobile_no, kiosk_email_id, kiosk_fax_no,
            //owner_address1, owner_address2, owner_address3, owner_district, owner_city_code, owner_state, owner_pin_code, owner_phone_no,
            //owner_Pan_no, owner_resi_proof, owner_resi_proof_no,
            police_reg_no, tin_sh_reg_no, comps_desc, scanner_desc, printer_desc, camera_desc,
            any_othr_business, comfort_level, internet_conn_type, loc_colleges, loc_hostels, loc_schools, loc_pvt_offices,
            loc_govt_offices, loc_others, kiosk_status, inserted_by, updated_by, agencyId, ApprovalStatus, FinancialStatus;

        private int? no_of_comps, no_of_scanner, no_of_printer, no_of_camera, back_up_power, power_cut, avg_students, avg_general;

        public string KioskType, kiosk_tin_no, owner_phone_no, owner_Pan_no, owner_resi_proof, owner_resi_proof_no;

        public DateTime? inserted_dt, updated_dt;
        public string OMTID;
        public string ImageName;
    }

    public class KioskAddressDetails_DT
    {
        public string ParentKey;

        //public string kiosk_address, kiosk_division, kiosk_district, kiosk_tehsil, kiosk_block, kiosk_city_code;
        //owner_address1, owner_address2, owner_address3, owner_district, owner_city_code, owner_state, owner_pin_code, owner_phone_no,
        //owner_Pan_no, owner_resi_proof, owner_resi_proof_no;

        //public string DC_Address, DC_District, DC_City, Kiosk_Address, Kiosk_Division, Kiosk_District, Kiosk_Taluka, Kiosk_GramPanchayat,
        //    Kiosk_Village, inserted_by, updated_by;

        public string CreatedBy, ModifiedBy;

        public string ChildKey, FullName, FullName_LL;
        public string AddrCareOf, AddrBuilding, AddrStreet, AddrLandmark, AddrLocality, District, Taluka, Panchayat, Village;
        public string District_Code, Taluka_Code;
        public string Village_Code, Panchayat_Code;
        public int PinCode;
        public DateTime? CreatedOn, ModifiedOn;
    }

    public class KioskRegistrationStepII_DT
    {
        public string KeyField;

        public string comps_desc, scanner_desc, printer_desc, camera_desc, any_othr_business, kiosk_status, agencyId, MailSent, MailSentDate, internet_conn_type, VerificationText;

        public int? no_of_comps, no_of_scanner, no_of_printer, no_of_camera, back_up_power, power_cut, loc_colleges, loc_hostels, loc_schools, loc_pvt_offices, loc_govt_offices, loc_others, avg_students, avg_general;

        public string ImageName;

        public int MaxOperator;
        public byte[] KIOSKImage;
    }

    public class SCARegistration_DT
    {
        public string KeyField;
        public string SCAID;

        public string inserted_by, updated_by, PaymentFlag;
        public DateTime? inserted_dt, updated_dt;

        public string CompanyName, MobileNo, EmailID, PhoneNo, FaxNo, PANNo, TinNo;
    }

    public class SCAContactPerson_DT
    {
        public string ParentKey;

        public string CreatedBy, ModifiedBy;
        public DateTime? CreatedOn, ModifiedOn;

        public string ChildKey;

        public string FullName, AddrCareOf, Village, PinCode;
        public string Mobile, Email;
    }

    public class SCAUsers_DT
    {
        public string PaymentFlag, CreatedBy, ModifiedBy;
        public DateTime? CreatedOn, ModifiedOn;

        public string KioskID, FullName, FullName_LL, UserType, LoginID, Password, Role, Active, Remarks, UNQ, TempPassword, Dsgn, DsgnLL;
        public bool ShowVillage, ShowBal, IsPasswordChanged;
    }

    public class OperatorRegistration_DT
    {
        public string UNQ, KioskID, FullName, UserType, LoginID, Active, Password, Role, CreatedBy, Remarks, PaymentFlag, VillageCode, Dist;
        public DateTime? CreatedOn, ModifiedOn;
        public string FullName_LL, Dsgn, DsgnLL, ImageName, Mobile;
        public bool ShowVillage, ShowBal;
    }

    public class KIOSKUsers_DT
    {
        public string PaymentFlag, CreatedBy, ModifiedBy;
        public DateTime? CreatedOn, ModifiedOn;

        public string KioskID, FullName, UserType, LoginID, Password, Role, Active, Remarks, UNQ, VillageCode, Dist, TempPassword;

        public string FullName_LL, Dsgn, DsgnLL;
        public bool ShowVillage, ShowBal;
        public string VLEID, PasswordHashed, Password1, IsPasswordChanged;
        //public byte[] PasswordHashed;
        //public string HomeUrl, Clnt, Locn, Dept, Code, FullName_LL, Naam, Dsgn, DsgnLL, Jaab, Level;
        //public int ProfileFlag;
    }

    public class KIOSKFinance_DT
    {
        public string CreatedBy;
        public DateTime CreatedOn;

        public string channel_id;
        public int? year, dc_op_bal, yrly_crtot, yrly_dbtot, dc_clo_bal;
    }

    public class Transaction_DT
    {
        public string CreatedBy, ModifiedBy;
        public DateTime? CreatedOn, ModifiedOn;
        public string paid_status;
        public string Channel_ID, Trans_Type;
        public DateTime Trans_Date;
        public string Service_ID, AppID, TrnID, SequenceNo, misc_desc_01, misc_desc_02, misc_desc_03;

        public double ClosingBalance, Trans_Amt, Base_Amt, Govt, SCA, VLE, MOL, Total, SetuDist, SetuState, Dept, Other, online_serv_fee, portal_serv_fee, govt_charges, misc_charges_01,
            misc_charges_02, misc_charges_03, lot_base_amt_no, lot_online_amt_no, lot_portal_amt_no, lot_govt_amt_no, lot_misc01_amt_no, lot_misc02_amt_no, lot_misc03_amt_no;

        public string PayBreakUpID;
        public string VLEID;

        public double SCAAmount;

        public string IsInWorkFlow, OfficeID;
        public string eDistrictCreatedBy;
        public string CSCTransactionNo;
        public string IsRefunded;
        public DateTime RefundedOn;
        public string IPAddress;
        public string SPVReferenceNo;

        public string UserType;
    }

    public class LedgerTable_DT
    {
        public string Channel_ID;
        public int Year;
        public double DC_OP_BAL, DC_CLO_BAL;
        public double YRLY_CRTOT, YRLY_DBTOT;

        public double apr_crtot, apr_dbtot, may_crtot, may_dbtot, jun_crtot, jun_dbtot, jul_crtot, jul_dbtot, aug_crtot, aug_dbtot, sep_crtot, sep_dbtot,
            oct_crtot, oct_dbtot, nov_crtot, nov_dbtot, dec_crtot, dec_dbtot, jan_crtot, jan_dbtot, feb_crtot, feb_dbtot, mar_crtot, mar_dbtot;

        public DateTime DC_LST_TXN_DT;

        public string CreatedBy, ModifiedBy;
        public DateTime? CreatedOn, ModifiedOn;
    }

    public class CitizenAddress_DT
    {
        public string CreatedBy, FullName;

        public string ParentKey, ChildKey, Email, Mobile;
        public string AddrCareOf, AddrBuilding, AddrStreet, AddrLandmark, AddrLocality, District, Taluka, Panchayat, Village;
        public string District_Code, Taluka_Code;
        public string Village_Code, Panchayat_Code;
        public int PinCode;
        public DateTime? CreatedOn;
        public string FullName_LL, AddrCareOf_LL, AddrBuilding_LL, AddrStreet_LL, AddrLandmark_LL, AddrLocality_LL;
    }

    public class CitizenRegistration_DT
    {
        public string KeyField, RowID;
        public string CitizenID;

        public string Created_by, Modified_by, DateOfBirth;
        public DateTime? Created_On, Modified_On;

        public string FirstName, MiddleName, LastName, UserID, MobileNo, EmailID, AadharNo, Password, SecretQuestion, SecretAnswer, VerificationCode;
        public string FirstNameLL, MiddleNameLL, LastNameLL, SecretQuestionLL, SecretAnswerLL;
    }

    public class Banishree_DT : CommonDataStructure
    {
        public string aadhaarNumber;
        public string ScolarshipType;
        public string Name;
        public string DOB;
        public string Gender;
        public string DisabilityCategory;
        public string FHusbandName;
        public string Religion;
        public string RelationWithGadian;
        public string PGadianIncome;
        public string Category;
        public string AreYouCitizenOfIndia;
        public string MobileNumber;
        public string EmailId;
        public string PerAddressLine1;
        public string PerAddressLine2;
        public string PreRoadStreetName;
        public string PreLandMark;
        public string PreGP;
        public string PoliceStation;
        public string PreLocality;
        public string PreState;
        public string PreDistrict;
        public string PreTaluka;
        public string PreVillage;
        public string PrePinCode;
        public string ClassOfScholaship;
        public string YearOfClass;
        public string DateOfAdmission;
        public string RecieveScholarship;
        public string InWhichClassRecieve;
        public string YearOfscholarship;
        public string MonthOfscholarship;
        public string DayOfscholarship;
        public string IsVisibilityChallanged;
        public string IngagedAReader;
        public string OrthopedicallyHandicaped;
        public DateTime CreatedOn;
        public string CreatedBy;
        public string ClientIP;
        public string IsActive;

    }

    public class CitizenUsers_DT
    {
        public string CreatedBy;
        public DateTime? CreatedOn;

        public string CitizenID, FullName, UserType, LoginID, Password, Role, Active, UNQ, RegistrationType;
        public string FullName_LL, Dsgn, DsgnLL;
    }

    public class WalletBal_DT
    {
        public string ServiceID, AppID, TrnID, ChannelID, PGTrnID, SequenceNo, BankID, BankRefNo, TranRefNo;
        public double CurrentBal, TopupAmt;
        public string CreatedBy, ModifiedBy, PayStatus;
        public DateTime? CreatedOn, ModifiedOn;
    }

    public class RecordTopUp_DT
    {
        public string CreatedBy, UpdatedBy, Status, AccountNo, Transaction_No, ReferenceNo, Mode_Payment, Branch, BankName, DepositedINBank, KioskID, IFSCode, BankAddress, Centre, Comment, ApplicationId;
        public int RowID;
        public DateTime? trans_date, CreatedDate, Updatedate;
        public double Amount_Deposited;
        public byte[] FileSize, FileContent;
        public string OriginalFileName, CurrentFileName, FilePath;
    }

    public class DC_PaymentConfirmationDetails
    {
        public string KioskID, TrnID, ConfirmURL, PaymentStatus, ErrorMessage, CreatedBy;
        public DateTime CreatedOn;
        public string VLEID, IsAmountDeductedAtMOL;
        public string CSCTransactionNo;
        public string TransactionID;
    }

    public class SigningAuthority_DT
    {
        public string KeyField, DistrictCode, SubDistrictCode, ServiceCode, DocumentType, SigningAuthority, Place, PlaceLL, KIOSKID, CreatedBy, SubDivisionCode;
        public DateTime CreatedOn;
        public string CertificateCode, CertificateType, CertificateTypeLL, AuthorityName, AuthorityNameLL, ShowSubDivision, HeaderTextEng, HeaderTextMar, IsHeaderText;
    }

    public class SuggestionDetail_DT
    {
        public string KeyField, KioskId, OperatorsId, MailersId, AlsoMailedTo, Subject, SuggestionDetail, Attachment, Status, RepliedDetail, CreatedBy, ModifiedBy;

        public DateTime CreatedOn, ModifiedOn;
    }

    public class TrackStatus_DT
    {
        public string Appid, ServiceName, DistrictCode, VillageCode, TehsilCode, LangId, CertStatus, AppName, ApplicantId, ServiceID, CreatedBy, PayFlag, ModifiedBy, Note, BarCode, RandomNo, AffidavitServiceID, VLEID, BusinessUnit, BatchNo, Active, Amount, TransactionID;

        public DateTime CreatedOn, ModifiedOn;
    }

    public class SaatBara_DT
    {
        public string ApplicantID, ApplicantName, ApplicantNameLL, SubSurveyNo, CreatedBy;
        public string SurveyNo;

        public DateTime CreatedOn;
        public int Year;
    }

    //Park_Amt_Details,  TicketDetails,     TrackStatus,     mstTimeSlot,     ParkResource

    public class Park_Amt_Details_DT
    {
        public string RowID, KeyField, ParkService_ID, ParkService_Name, Particulars, Period, CreatedBy, ModifiedBy;
        public int Year;
        public double Amount;
        public DateTime CreatedOn, ModifiedOn;
    }

    public class TicketDetails_DT
    {
        public string Mobile, ApplicantID, VehicleType, VehicleNo, Applicant_FullName, Gender, ID_Proof, ID_No, EmailId, CreatedBy, ModifiedBy, TicketNo, Vehicle4Type, Vehicle4No, Vehicle2Type, Vehicle2No;
        public string Safari_TimeSlot, Boating_FourSeaterTimeSlot, Boating_TwoSeaterTimeSlot, MiniTrain_TimeSlot, PaymentType, PayFlag;
        public int Age, Safari_NoOfAdult, Safari_NoOfChild, MainEntrance_NoOfAdult, MainEntrance_NoOfChild, MiniTrain_NoOfAdult, MiniTrain_NoOfChild, Boating_NoOf_TwoSeater, Boating_NoOf_FourSeater, VehicleNoOf, Vehicle2NoOf, Vehicle4NoOf, StillCameraNo, VedioCameraNo;
        public double Grand_Tot, Boating_TwoSeater_Amt, Boating_FourSeater_Amt, Boating_TotAmt, MiniTrain_AdultAmt, MiniTrain_ChildAmt, MiniTrain_TotAmt, MainEntrance_AdultAmt, MainEntrance_ChildAmt, MainEntrance_TotAmt, Safari_AdultAmt, Safari_ChildAmt, Safari_TotAmt, Vahicle_Amt, PortalFee, Total, Vahicle4Amt, Vahicle2Amt, StillCameraAmt, VedioCameraAmt, PhotoAmt;
        public DateTime ExcursionDate, CreatedOn, ModifiedOn;
    }

    public class SequenceNo_DT
    {
        public string RowId, SequenceNo, ApplicationName, ModifiedBy;
        public DateTime ModifiedOn;
    }

    public class PGTransaction_DT
    {
        public string CreatedBy, ModifiedBy;
        public DateTime? CreatedOn, ModifiedOn;
        public string paid_status;
        public string Channel_ID, Trans_Type;
        public DateTime Trans_Date, instrument_dt;
        public string Service_ID, AppID, TrnID, SequenceNo;

        public double Trans_Amt, Total, instrument_amt;
        public string user_type, instrument_type, bank_id, branch_name, instrument_no, instrument_status, remarks, PG_App_ID, Bank_Trans_No, Bank_Trans_Ref_No, Bank_COde, Reg_type, Active;
    }

    public class CommissionCredited_DT
    {
        public string SeqNo, KeyField, KioskId, CreatedBy, Remarks;
        public DateTime? CreatedOn, LastTransactionDate;
        public DateTime Trans_Date, instrument_dt;
        public double AmountCredited;
        public int CreditedYear, CreditedMonth;
    }

    public class PoliceRecruitment_DT
    {
        public string KeyField, KIOSKId, Name, NameLL, OMTID, EmailId, Mobile, DistrictCode, SubdistrictCode, VillageCode, PinCode, CreatedBy, ModifiedBy;
        public DateTime? CreatedOn, ModifiedOn;
    }

    public class AutoDrCrLog_DT
    {
        public string KeyField, TransactionID, KIOSKId, UserType, CompanyName, TransactionType, Remark, CreatedBy, ApplicationID, Status;
        public DateTime? CreatedOn, TranDate;
        public double ExistingBalance, TransactionAmount;
    }

    public class SPVReverseTransaction_DT
    {
        public string CreatedBy;
        public string Channel_ID, ApplicationID, TransactionID;
    }

    public class DC_PaymentReversalDetails
    {
        public string KioskID, AppID, TrnID, ReversalStatus, ErrorMessage, CreatedBy;
        public DateTime CreatedOn;
        public string VLEID;
    }

    public class VLEDetails_DT
    {
        public string KeyField, SCAID, KioskID, Unq, UID, EID, OMTID, VLECode, DistrictCode, SubDistrictCode, PanchayatCode, VillageCode, Name, NameLL, CareOf, Building, Street, Landmark, Locality, PinCode, Mobile, EmailId, PanCard;
        public DateTime CreatedOn, ModifiedOn, DOB;
        public string CreatedBy, ModifiedBy, Gender;
        public byte[] VLEImage, CenterImage;
        public int Age;
    }

    public class ReverseTransaction_DT
    {
        public string KioskID, AppID, TrnID, ReversalStatus, ErrorMessage, CreatedBy;
        public DateTime CreatedOn;
        public string VLEID;
    }

    public class HSBT_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID, AppName;
        public string bpl_card_no, bpl_year, date_jouney, date_return, disease_detail, atende_detail, atende_phone, disease_history;
        public string AddressLine1, AddressLine2, StreetName, Landmark, Locality, State_Code, District_Code, SubDistrict_Code, Village_Code, PinCode;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
    }

    public class VLEInformationLog_DT
    {
        public string UNQ, VLEID, OMTID, Mobile, MobileOTP, IsOTPVerified, EmailId, VerifyCode, IsCodeVerified, Gender;
        public string SCAID, KioskID, Name, NameLL, CareOf, Building, Street, Landmark, Locality, PanCard;
        public DateTime CreatedOn, ModifyOn, DOB, OTPGenOn, OTPVerifiedOn, CodeGenOn, CodeVerifiedOn;
        public string CreatedBy, ModifyBy;
        public byte[] VLEImage, CenterImage;
        public int DistrictCode, SubDistrictCode, PanchayatCode, VillageCode, PinCode, Age;
    }

    public class PGAppRequest_DT
    {
        public string ServiceID, AppID, ReturnURL, CreatedBy, PGName;
        public decimal Amount, ServiceTax, PortalFee;
    }

    public class PGAppResponse_DT
    {
        public string ServiceID, AppID, ReferenceNo, Bank_TransDate, CreatedBy, BankResponseCode, PGName, PGStatus;
        public decimal Amount, ServiceTax, PortalFee;
    }

    public class CTTNSCharacter
    {
        public string DistrictName, TalukaName,
            ApplicantType, ApplicantName, RelationWithBeneficiary, IdentificationType, IdentificationNumber, FirstName, MotherName, FatherName, DOB, Age,
            Gender, nationality, MobileNo, phoneno, EmailID, AddressLine1, AddressLine2, RoadStreetName, LandMark, Locality, State, District, BlockTaluka,
            PanchayatVillageCity, Pincode, StayYear, StayMonth, PAddressLine1, PAddressLine2, PRoadStreetName, PLandMark, PLocality, PState, PDistrict,
            PBlockTaluka, PPanchayatVillageCity, PPincode, PStayYear, PStayMonth, Qualification, Occupation, IdentificationMark, Heigt, Weight,
            ActiveInPolitics, LocalPoliceStationDisct, LocalPoliceStation, IsCorrectInfo, Place, Date, IsCriminalRecord, CriminalRecordDetail, PerposeOfApply,
            ModeOfReceiving, ServiceID, ApplicantUID, DesignatedOfficer, AppellateAuthority, RevisionalAuthority, TimeLimit,
            CreatedBy, Createdon, AppID, IsActive, IsVarified, CompanyName, CompanyAddrs, CompanyPhone, Desig, JoingDate;
    }

    public class CCTNSResidence
    {
        public string vDistrictName, vTalukaName,
             ApplicantType, ApplicantName, RelationType, IdentificationType, IdentificationNumber, FirstName, MiddleName,
             LastName, FatherFName, FatherMName, FatherLName, MotherFName, MotherMName, MotherLName, DOB, Age, Gender,
             MaritalStatus, EmailID, SpouseFName, SpouseMName, SpouseLName, SpouseRelation, MobileNo, StdCode, Phone,
             ApplyPurpose, Area, AddressLine1, AddressLine2, RoadStreetName, State, StateName, District, DistrictName,
             Subdivision, SubdivisionName, Tehsil, Tehsilname, RI, RIName, Taluka, TalukaName, Village, PGPULB, PoliceStation,
             PostOffice, PinCode, Address, CArea, CAddressLine1, CAddressLine2, CRoadStreetName, CState, CStateName,
             CDistrict, CDistrictName, CSubdivision, CSubdivisionName, CTehsil, CTehsilName, CRI, CRIName, CTaluka,
             CTalukaName, CVillage, CPGPULB, CPPoliceStation, CPPostOffice, CPPinCode, Read, Write, Speak, PassOriyaY,
             PassOriyaN, RORY, RORN, rorDistr, rorSubDiv, rorTahsil, rorRI, rorPoliceStn, rorVilg, KhataNo, RecordedTenant,
             RecodTenantReltion, SaleDeedNo, SaleDeedDte, ResidingDtlYear, PlotDetail, SubmitterType, CreatedBy, Createdon,
             IsActive, AppID, IsVarified;
    }

    public class CitizenEnrollment_DT
    {
        public CitizenEnrollment_DT()
        { }

        public CitizenEnrollment_DT(DataTable dtl)
        {
            ApplicantFirstName = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["FirstName"].ToString());
            ApplicantMiddleName = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["MiddleName"].ToString());
            ApplicantLastName = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["LastName"].ToString());
            Gender = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Gender"].ToString());
            Age = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Age"].ToString());
            MaritalStatus = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["MaritalStatus"].ToString());
            DOB = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["DOB"].ToString());
            FatherFirstName = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["FatherFName"].ToString());
            FatherMiddleName = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["FatherMName"].ToString());
            FatherLastName = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["FatherLName"].ToString());
            MotherFirstName = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["MotherFName"].ToString());
            MotherMiddleName = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["MotherMName"].ToString());
            MotherLastName = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["MotherLName"].ToString());
            SpouseFirstName = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["SpouseFName"].ToString());
            SpouseMiddleName = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["SpouseMName"].ToString());
            SpouseLastName = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["SpouseLName"].ToString());
            SpouseRelation = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["SpouseRelation"].ToString());
            AadhaarID = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["IdentificationNumber"].ToString());
            PhoneNo = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Phone"].ToString());
            MobileNo = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["MobileNo"].ToString());
            eMail = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["EmailID"].ToString());
            UrbanRural = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Area"].ToString());
            FK_DistrictId = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["District"].ToString());
            FK_SubDivisionId = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Subdivision"].ToString());
            FK_TahsilId = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Tehsil"].ToString());
            FK_RIId = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["RI"].ToString());
            FK_BlockId = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Taluka"].ToString());
            Village = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Village"].ToString());
            GP_ULB = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["PGPULB"].ToString());
            HouseNo = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["AddressLine2"].ToString());
            PoliceStation = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["PoliceStation"].ToString());
            PostOffice = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["PostOffice"].ToString());
            PinNO = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["PinCode"].ToString());
            IDCMGI = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["AppID"].ToString());
            APIKEY = APICommon.ComputeHash(APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["AppID"].ToString()));
        }

        public string ApplicantFirstName { get; set; }
        public string ApplicantMiddleName { get; set; }
        public string ApplicantLastName { get; set; }
        public string Gender { get; set; }
        public string Age { get; set; }
        public string MaritalStatus { get; set; }
        public string DOB { get; set; }
        public string FatherFirstName { get; set; }
        public string FatherMiddleName { get; set; }
        public string FatherLastName { get; set; }
        public string MotherFirstName { get; set; }
        public string MotherMiddleName { get; set; }
        public string MotherLastName { get; set; }
        public string SpouseFirstName { get; set; }
        public string SpouseMiddleName { get; set; }
        public string SpouseLastName { get; set; }
        public string SpouseRelation { get; set; }
        public string AadhaarID { get; set; }
        public string PhoneNo { get; set; }
        public string MobileNo { get; set; }
        public string eMail { get; set; }
        public string UrbanRural { get; set; }
        public string FK_DistrictId { get; set; }
        public string FK_SubDivisionId { get; set; }
        public string FK_TahsilId { get; set; }
        public string FK_RIId { get; set; }
        public string FK_BlockId { get; set; }
        public string Village { get; set; }
        public string GP_ULB { get; set; }
        public string HouseNo { get; set; }
        public string PoliceStation { get; set; }
        public string PostOffice { get; set; }
        public string PinNO { get; set; }
        public string IDCMGI { get; set; }
        public string APIKEY { get; set; }
    }

    public class ResidenceCertificate_DT
    {
        public ResidenceCertificate_DT()
        { }

        public ResidenceCertificate_DT(DataTable dtl)
        {
            serId = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["serId"].ToString());
            SubmitterType = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["SubmitterType"].ToString());
            Urban_Present = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Urban_Present"].ToString());
            SubmitterFirstName = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["SubmitterFirstName"].ToString());
            SubmitterMiddleName = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["SubmitterMiddleName"].ToString());
            SubmitterLastName = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["SubmitterLastName"].ToString());
            SubmitterRelation = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["SubmitterRelation"].ToString());
            IsPermanentSameAsPresent = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["IsPermanentSameAsPresent"].ToString());
            GP_ULB_Present = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["GP_ULB_Present"].ToString());
            HouseNo_Present = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["HouseNo_Present"].ToString());
            Village_Present = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Village_Present"].ToString());
            PostOffice_Present = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["PostOffice_Present"].ToString());
            PoliceStation_Present = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["PoliceStation_Present"].ToString());
            FK_DistrictId_Present = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["FK_DistrictId_Present"].ToString());
            FK_SubDivisionId_Present = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["FK_SubDivisionId_Present"].ToString());
            FK_TahsilId_Present = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["FK_TahsilId_Present"].ToString());
            FK_BlockId_Present = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["FK_BlockId_Present"].ToString());
            FK_RIId_Present = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["FK_RIId_Present"].ToString());
            PinNo = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["PinNo"].ToString());
            IsRORproduced = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["IsRORproduced"].ToString());
            FK_LRDDistrictId = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["FK_LRDDistrictId"].ToString());
            FK_LRDSubDivisionId = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["FK_LRDSubDivisionId"].ToString());
            FK_LRDTahsilId = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["FK_LRDTahsilId"].ToString());
            FK_LRDRIId = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["FK_LRDRIId"].ToString());
            LRDPoliceStation = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["LRDPoliceStation"].ToString());
            LRDMouza_RevenueVillage = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["LRDMouza_RevenueVillage"].ToString());
            LRDKhataNo = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["LRDKhataNo"].ToString());
            TenantRecorded = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["TenantRecorded"].ToString());
            ApplicantAndTenantRelation = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["ApplicantAndTenantRelation"].ToString());

            SaleDeedDate = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["SaleDeedDate"].ToString());
            SalesDeedNo = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["SalesDeedNo"].ToString());
            OriyaSkills1 = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["OriyaSkills1"].ToString());
            OriyaSkills2 = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["OriyaSkills2"].ToString());
            OriyaSkills3 = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["OriyaSkills3"].ToString());
            IsMEPassed = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["IsMEPassed"].ToString());
            Purpose = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Purpose"].ToString());
            ResidingYears = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["ResidingYears"].ToString());

            Land_PlotNo = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Land_PlotNo"].ToString());
            Land_Area = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Land_Area"].ToString());
            Land_Kisam = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Land_Kisam"].ToString());
            docvalue = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["docvalue"].ToString());
        }

        public string serId { get; set; }
        public string EID { get; set; }
        public string APIKEY { get; set; }
        public string SubmitterType { get; set; }
        public string Urban_Present { get; set; }
        public string SubmitterFirstName { get; set; }
        public string SubmitterMiddleName { get; set; }
        public string SubmitterLastName { get; set; }
        public string SubmitterRelation { get; set; }
        public string IsPermanentSameAsPresent { get; set; }
        public string GP_ULB_Present { get; set; }
        public string HouseNo_Present { get; set; }
        public string Village_Present { get; set; }
        public string PostOffice_Present { get; set; }
        public string PoliceStation_Present { get; set; }
        public string FK_DistrictId_Present { get; set; }
        public string FK_SubDivisionId_Present { get; set; }
        public string FK_TahsilId_Present { get; set; }
        public string FK_BlockId_Present { get; set; }
        public string FK_RIId_Present { get; set; }
        public string PinNo { get; set; }
        public string IsRORproduced { get; set; }
        public string FK_LRDDistrictId { get; set; }
        public string FK_LRDSubDivisionId { get; set; }
        public string FK_LRDTahsilId { get; set; }
        public string FK_LRDRIId { get; set; }
        public string LRDPoliceStation { get; set; }
        public string LRDMouza_RevenueVillage { get; set; }
        public string LRDKhataNo { get; set; }
        public string TenantRecorded { get; set; }
        public string ApplicantAndTenantRelation { get; set; }

        //public System.IO.Stream applPhoto_f { get; set; }
        //public System.IO.Stream applsign_f { get; set; }
        //public HttpPostedFile applPhoto_f { get; set; }
        //public HttpPostedFile applsign_f { get; set; }

        //public HttpPostedFile applPhoto_f { get; set; }
        //public HttpPostedFile applsign_f { get; set; }

        //public HttpFileCollection Files { get; set; }

        //public string[] docId_f { get; set; }
        public string docvalue { get; set; }

        public string SaleDeedDate { get; set; }
        public string SalesDeedNo { get; set; }
        public string OriyaSkills1 { get; set; }
        public string OriyaSkills2 { get; set; }
        public string OriyaSkills3 { get; set; }
        public string IsMEPassed { get; set; }
        public string Purpose { get; set; }
        public string ResidingYears { get; set; }
        public string Land_PlotNo { get; set; }
        public string Land_Area { get; set; }
        public string Land_Kisam { get; set; }
    }

    public class uploadedDoc
    {
        public string ID { get; set; }
        public string DocName { get; set; }
        public string DocDesc { get; set; }
        public string Path { get; set; }
        public byte[] image { get; set; }
        public string IsUploaded { get; set; }
    }

    public class CitizenResult
    {
        public string Status { get; set; }
        public string Msg { get; set; }
        public string UAI { get; set; }
        public string EID { get; set; }
        public string UAN { get; set; }
        public string ApplicationId { get; set; }
        public string ApplicationStatus { get; set; }
        public string DocumentURL { get; set; }
        public string CreatedBy { get; set; }
    }

    public class TestCitizenResult
    {
        public List<CitizenResult> Result { get; set; }
    }

    public class LogError
    {
        public string Msg { get; set; }
        public string HelpLink { get; set; }
        public string InnerExp { get; set; }
        public string Data { get; set; }
        public string Source { get; set; }
        public string StackTrace { get; set; }
        public string TargetSite { get; set; }
        public string ServiceID { get; set; }
        public string AppID { get; set; }
    }

    #region CompalaintRegistration

    public class ComplaintReg
    {
        public string vDistrictName, vTalukaName, ApplicantType, ApplicantName, ApplicantCountry, IdentificationType,
             IdentificationNumber, PassPortDate, PassPortPlace, UID, FirstName, MiddleName, LastName, Gender, DOB, DOBY,
             Age, AgeRFrom, AgeRTo, EmailID, MobileNo, StdCode, PhoneNo, RelativeType, RelativeName, ComplaintNature,
             isSameAddr, PCareOf, PHouseNo, Pstreet, Parea, Pcountry, Pstate, Pdist, PPoliceS, Pblock, Ppanchayat, Ppincode,
             CCareOf, CHouseNo, Cstreet, Carea, Ccountry, Cstate, Cdist, CPoliceS, Cblock, Cpanchayat, Cpincode, AUID, AFName,
             AMName, ALName, AMobileNo, AStdCcode, APhoneNo, APHouseNo, APstreet, AParea, APcountry, APstate, APdist,
             APPoliceS, APblock, APpanchayat, APpincode, APIsSameAddr, ACHouseNo, ACstreet, ACarea, ACcountry, ACstate,
             ACdist, ACPoliceS, ACblock, ACpanchayat, ACpincode, IncdPlace, IsIncdDateKnow, IncdDateFrom, IncdDateTo,
             IncdType, IsPSKow, IsDisKNow, CompDis, CompPS, CompOffice, CompDdate, CompDesc, Remark, CreatedBy, Createdon,
             IsActive, AppID, IsVarified;
    }

    #endregion CompalaintRegistration



    #region eDistrictBirthCertificate

    public class BirthCertificateReq
    {
        public string ulb { get; set; }
        public string regNo { get; set; }
        public string reqNo { get; set; }
        public string childName { get; set; }
        public string father { get; set; }
        public string mother { get; set; }
        public string gender { get; set; }
        public string DOB { get; set; }
        public string POB { get; set; }

    }

    public class BirthResponce
    {
        public Message Message { get; set; }
        public List<BirthRegistrationDetailsVO> BirthRegistrationDetailsVO { get; set; }
    }

    public class Message
    {
        public string StatusCode { get; set; }
        public string ResponseMsg { get; set; }
    }

    public class BirthRegistrationDetailsVO
    {
        public string applicationStatus { get; set; }
        public string applicationType { get; set; }
        public string approvalAuthorityId { get; set; }
        public double? babyWeight { get; set; }
        public List<BirthPaymentDetailsVO> BirthPaymentDetailsVO { get; set; }
        public string birthType { get; set; }
        public string birthTypeCode { get; set; }
        public string causeOfDeath { get; set; }
        public long? certificateIssueCount { get; set; }
        public string childFirstName { get; set; }
        public string childLastName { get; set; }
        public string childMiddleName { get; set; }
        public long? childNum { get; set; }
        public string createdBy { get; set; }
        public DateTime? createdOn { get; set; }
        public string createdRole { get; set; }
        public DateTime? dateOfBirth { get; set; }
        public DateTime? dateOfBirthFrom { get; set; }
        public DateTime? dateOfBirthTo { get; set; }
        public DateTime? dateOfReg { get; set; }
        public DateTime? dateOfRegFrom { get; set; }
        public DateTime? dateOfRegTo { get; set; }
        public string deliveryAttention { get; set; }
        public string deliveryAttentionCode { get; set; }
        public string deliveryMethod { get; set; }
        public string deliveryMethodCode { get; set; }
        public string emailId { get; set; }
        public DateTime? endDate { get; set; }
        public string[] errors { get; set; }
        public string fatherEdu { get; set; }
        public string fatherEduCode { get; set; }
        public string fatherFirstName { get; set; }
        public string fatherLastName { get; set; }
        public string fatherMiddleName { get; set; }
        public string fatherOccupation { get; set; }
        public string fatherOccupationCode { get; set; }
        public string hospInstNameCode { get; set; }
        public string houseAddr1 { get; set; }
        public string houseAddr2 { get; set; }
        public string houseAddr3 { get; set; }
        public string houseCountryCode { get; set; }
        public string houseDistrict { get; set; }
        public string housePin { get; set; }
        public string houseStateCode { get; set; }
        public long? id { get; set; }
        public string informantAddr1 { get; set; }
        public string informantAddr2 { get; set; }
        public string informantAddr3 { get; set; }
        public string informantAddress { get; set; }
        public string informantCountryCode { get; set; }
        public string informantDistrict { get; set; }
        public string informantName { get; set; }
        public string informantPin { get; set; }
        public string informantStateCode { get; set; }
        public string legacyRegdNo { get; set; }
        public string memoNumber { get; set; }
        public string missCase { get; set; }
        public string mobileNo { get; set; }
        public string motherCountryCode { get; set; }
        public long? motherDeliveryAge { get; set; }
        public string motherDistrictCode { get; set; }
        public string motherEdu { get; set; }
        public string motherEduCode { get; set; }
        public string motherFirstName { get; set; }
        public string motherLastName { get; set; }
        public long? motherMarriageAge { get; set; }
        public string motherMiddleName { get; set; }
        public string motherOccupation { get; set; }
        public string motherOccupationCode { get; set; }
        public string motherPlace { get; set; }
        public string motherPlaceCode { get; set; }
        public string motherPlaceName { get; set; }
        public string motherStateCode { get; set; }
        public long? nac { get; set; }
        public string nACApplicationNo { get; set; }
        public int? noOfApplications { get; set; }
        public string orderNumber { get; set; }
        public long? orderOfBirth { get; set; }
        public string organization { get; set; }
        public string ownClient { get; set; }
        public long? pageNumber { get; set; }
        public string paymentRequired { get; set; }
        public string paymentRequiredCode { get; set; }
        public string permAddr1 { get; set; }
        public string permAddr2 { get; set; }
        public string permAddr3 { get; set; }
        public string permCountryCode { get; set; }
        public string permDistrict { get; set; }
        public string permPin { get; set; }
        public string permStateCode { get; set; }
        public string placeOfBirth { get; set; }
        public long? pregnancyDuration { get; set; }
        public string proofOfEvent { get; set; }
        public string registrationNo { get; set; }
        public long? regSeq { get; set; }
        public string regYear { get; set; }
        public string religion { get; set; }
        public string religionCode { get; set; }
        public string remark { get; set; }
        public string remarkReturn { get; set; }
        public string requestNo { get; set; }
        public string sex { get; set; }
        public string sexCode { get; set; }
        public DateTime? startDate { get; set; }
        public string status { get; set; }
        public string statusCode { get; set; }
        public DateTime? submissionDate { get; set; }
        public DateTime? submissionDateAsDate { get; set; }
        public string tahasilName { get; set; }
        public string ulbCode { get; set; }
        public long? ulbId { get; set; }
        public string updatedBy { get; set; }
        public DateTime? updatedOn { get; set; }
        public long? versionNo { get; set; }
    }

    public class BirthPaymentDetailsVO
    {
        public double? challanAmt { get; set; }
        public DateTime? challanDate { get; set; }
        public DateTime? challanEntryDate { get; set; }
        public string challanNo { get; set; }
        public string challanTrackingNo { get; set; }
        public string challanType { get; set; }
        public string challanTypeCode { get; set; }
        public string createdBy { get; set; }
        public DateTime? createdOn { get; set; }
        public long? id { get; set; }
        public string item { get; set; }
        public double? receiptAmt { get; set; }
        public string receiptNo { get; set; }
        public string rule { get; set; }
        public string section { get; set; }
        public string status { get; set; }
        public string statusCode { get; set; }
        public string ulbCode { get; set; }
        public string updatedBy { get; set; }
        public DateTime? updatedOn { get; set; }
    }

    #endregion


    #region New Data Sturctures

    /* Start: New Data Structures */

    [Serializable]
    public class SaltKeyEntry
    {
        public string UserHostAddress, SaltKeyValue, SucessfulLogin, CaptchaValue;
        public DateTime ExpireTime;
    }

    public class KioskRegistrationV2_DT
    {
        public string UIDNo, PANNo, VoterID, MobileNo, EmailID, Title, FirstName, LastName, Guardian,
        FatherName, MotherName, IsDivine, DivinePart, Gender, AddressLine1, AddressLine2,
        RoadStreetName, LandMark, Locality, LoginID, Password, ImagePath;
        public string DOB;
        public int FamilyIncome, State, District, Taluka, Village, PinCode;
        public DateTime CreatedOn;
        public string CreatedBy, ClientIP;
    }

    public class SeniorCitizen_DT
    {
        public string MobileNo, EmailID, FirstName, LastName, Gender, AddressLine1, AddressLine2,
        RoadStreetName, LandMark, Locality, ImagePath;
        public string DOB;
        public int State, District, Taluka, Village, PinCode, Age;
        public DateTime CreatedOn;
        public string CreatedBy, ClientIP;
    }

    public class BirthCertificate_DT
    {
        public string aadhaarNumber, txtregNo, txtChildName, ddlGender, ddlGenderName, DOB, lblPOB, FatherName, MotherName,
             hospname, txtAddressLine1, txtAddressLine2, txtRoadStreet, txtlandMark, txtLocality, ddlState,
             ddlStateName, ddlDistrict, ddlDistrictName, ddlSubDistrict, ddlSubDistrictName, ddlVillage,
             ddlVillageName, txtPincode, ddlIdentificationType, ddlIdentificationTypeName, txtIdentificationNumber,
             drpAppRel, txtReltionWC, drpAppTitle, txtApplicantName, txtAppTelNo, txtAppMobNo, txtAppEmailID,
             drpAppReligion, txtReligion, txtAppAddressLine1, txtAppAddressLine2, txtAppRoadStreet, txtApplandMark,
             txtAppLocality, ddlNationality, ddlNationalityName, ddlPState, ddlPStateName, ddlPDistrict,
             ddlPDistrictName, ddlPSubDistrict, ddlPSubDistrictName, ddlPVillage, ddlPVillageName, txtAppPincode,
             CreatedBy, Createdon, IsActive, AppID, SvcID, IsVarified, vDistrictName, vTalukaName;
    }

    public class SearchBirthData_DT
    {
        public string regNo;
        public string reqNo;
        public string childName;
        public string father;
        public string mother;
        public string gender;
        public string DOB;
        public string POB;
    }

    public class BirthRegistration_DT
    {
        public string RegistrationNo, DateOfBirth, TimeOfBirth, BirthPlace, Weight, Gender, PanchayatVillageCode;
        public string ChildName, FatherName, MotherName, InstitutionNo, InstitutionName, AddressLine1, AddressLine2, StreetRoadName, LandMark, Locality;
        public int StateCode, DistrictCode, BlockTalukaCode, PinCode;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP, MobileNo, EmailID;
    }

    public class MBPY_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID;
        public string PensionID, PensionType, DisabilityID, DisabilityType, MonthlyIncome;
        public string AccountHolder; public string AccountNumber; public string IFSCCode;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string disabilitypercentage, BPLMPBYear, bplMBPYcardno, ddlwidow;

    }

    public class Conversion_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID;
        public string PDistrict, PBlock, PMouza, DrawingNo, PlotNo, AllottedArea, AreaUnit, KhataNo, RevenuePlotNo, PossessionDate;
        public string LandUsed, LandUsedType, IsRegistered, RegistrationNo, DeedBookNo, DeedVolumeNo, FromPageDeedNo, ToPageDeedNo, IsConstruted, IsHoldingTaxAccessed, ConstrutedDetail, IsNonResidential, ResidentialDetail,
            IsMortgaged, MortgagedDetail, IsNOCEnclosed, NOCDetail, IsDisputed, DisputeDetail, RentAmount, WeatherUpdated;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
    }

    public class FarmerRegistration_DT : CommonDataStructure
    {
        public int PDistrictCode;
        public int PBlockCode;
        public int PGramPanchayat;
        public string PVillageCode;
        public string NameofHOF;
        public string FatherName;
        public string DOB;
        public string Age;
        public string Gender;
        public string RelationwithHOF;
        public string VoterIDCardNo;
        public string Category;
        public string DAddressLine1;
        public string DAddressLine2;
        public string DRoadStreetName;
        public string DLandMark;
        public string DLocality;
        public string DState;
        public string DDistrict;
        public string DTaluka;
        public string DVillage;
        public string PinCode;

        //public string NameofTheMember;
        //public string RelationwithMember;
        //public string AgeofMember;
        //public string Nominated;
        public string HeirsDXML;

        public string AccountHolder;
        public string AccountNumber;
        public string IFSCCode;
        public DateTime CreatedOn;
        public string CreatedBy, ClientIP;
        public string aadhaarNumber;
        public string IsActive;
        public string FarmerMemberDetails;
    }

    public class WaterConnection_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID;
        public string CustomerID, CategoryID, CategoryType, FacilityID, FacilityType, PurposeID, PurposeType;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
    }

    public class IGNWP_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID, DeceasedName;
        public string AccountHolder; public string AccountNumber; public string IFSCCode;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string BPLCardNo, BPLCardYear, ddlwidow;
    }

    public class IGNDP_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID;
        public string DisabilityID, DisabilityType, DisabilityPercentage, Income;
        public string AccountHolder; public string AccountNumber; public string IFSCCode;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string BPLCardNo, BPLCardYear;
    }

    public class IGNOAP_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID;
        public string Occupation, Income;
        public string AccountHolder; public string AccountNumber; public string IFSCCode;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string BPLCardNo, BPLCardYear;
    }

    public class SPVRequest_DT
    {
        public string Trans_No, Reg_No, mrtxid, amount, mid, mitem, othervals, smer, oxitrxid, trxmsg, trxstatus, doublverstatus, pay_status, ServiceStatus, vleid;
        public string AppID, ServiceID;
        public DateTime Cr_date, Trans_date, CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
    }

    public class CSCBridgeRequest_DT
    {
        public string CSCID,
            CSC_Email,
            SvcID,
            AppID,
            Merchant_ID,
            Merchant_Receipt_No,
            ProductID,
            ProductName,
            Txn_Amount,
            DepartmentFee,
            CSC_Share_Amount,
            PortalFee,
            SvcTax,
            Param1,
            Param2,
            Param3,
            Param4,
            RequestMessage,
            CreatedBy,
            CreatedOn,
            ClientIPAddress;
    }

    public class CSCBridgeResponseMessage_DT
    {
        public string SvcID, AppID, CSCID, bridgeResponseMessage, decryptedResponseMessage, CreatedBy;
    }

    public class CSCBridgeResponse_DT
    {
        public string SvcID,
            AppID,
            CSCID,
            csc_txn,
            merchant_id,
            csc_id,
            merchant_txn,
            txn_status,
            merchant_txn_date_time,
            product_id,
            txn_amount,
            amount_parameter,
            txn_mode,
            txn_type,
            merchant_receipt_no,
            csc_share_amount,
            pay_to_email,
            currency,
            discount,
            param_1,
            param_2,
            param_3,
            param_4,
            txn_status_message,
            status_message,
            CreatedBy,
            CreatedOn,
            IsActive,
            ClientIPAddress,
            ResponseMessage;
    }

    public class CSCBridgeReconLog_DT
    {
        public string SvcID,
            AppID,
            CSCID,
            merchant_id,
            merchant_txn,
            merchant_txn_status,
            csc_txn,
            recon_reference,
            recon_log_status,
            CreatedBy,
            CreatedOn,
            ReconMessage;
    }

    public class CMRF_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID;

        public string ApplicationTypeID, ApplicationType, ApplicationCategory, ApplicationCategoryID, FundAmount, FundPurpose, FundReceivedEarlier, FundReceivedPurpose, FundReceivedAmount,
                IsHandDiseased, HandDiseasedDetail, RecommendedBy, Occupation, AnnualIncome;

        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string Image;

        public string AgricultureIncome, SalaryIncome, OtherIncome, DiseaseName, TreatmentRequired, MedicineCost, Appratus, OtherExpenditure, TreatmentPlace, TreatmentReason,
            TreatmentAvailableOrissa, AgriIncomeRecom, SalaryIncomeRecom, OtherIncomeRecom, AnnualIncomeRecom, FinancialCondition, Acceptable, RemarkRecom;
    }

    public class Migration_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID, AppName;
        public string InstituteName, RegistrationNo, LeavingDate, ExaminationDetails, Reason, AdmissionYear, BranchCode;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string Image;
    }

    public class MigrationITI_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID, AppName;
        public string InstituteName, RegistrationNo, LeavingDate, ExaminationDetails, Reason, AdmissionYear, BranchCode;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string Image;
    }

    public class DuplicateDiploma_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID, AppName;
        public string InstituteName, RegistrationNo, Session, LeavingYear, JoiningYear, BranchCode, Reason;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
    }

    public class Transcript_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID, AppName, ServiceID, ApplicantType;
        public string InstituteName, RegistrationNo, StudentName, Session, LeavingYear, JoiningYear, Reason, CompanyApplicantName;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string AppAddressLine1, AppAddressLine2, AppStreetName, AppLandmark, AppLocality, AppStateCode, AppDistrictCode, AppSubDistrictCode, AppVillageCode, AppPinCode;
    }

    public class TranscriptITI_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID, AppName, ServiceID, ApplicantType;
        public string InstituteName, RegistrationNo, StudentName, Session, LeavingYear, JoiningYear, Reason, CompanyApplicantName, TradeName;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string AppAddressLine1, AppAddressLine2, AppStreetName, AppLandmark, AppLocality, AppStateCode, AppDistrictCode, AppSubDistrictCode, AppVillageCode, AppPinCode;
    }

    public class DivisionalCertificate_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID, AppName, ServiceID;
        public string InstituteName, RegistrationNo, Session, LeavingYear, JoiningYear, ApplicantType, Semester, BranchCode, SubjectCode;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
    }

    public class DivisionalMarksheet_DT : CommonDataStructure
    {
        public string aadhaarNumber, ProfileID, AppName;
        public string InstituteName, RegistrationNo, ExamYMCode, StudentName, SINO, Year, MonthCode, ExamYMName, BranchName;
        public string GrandTotalFullMark, GrandTotalMarkSecured, GrandTotalDivisionMark, GrandTotalDivision, ResponseString, Status;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
    }

    public class DivisionalMarksheetTable2_DT : CommonDataStructure
    {
        public string aadhaarNumber, ProfileID, AppName;
        public string SINO, PCode, SubjectName;
        public string TotalFullMark, TotalMarkSecured;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
    }

    public class NewMigrationCertificate_DT : CommonDataStructure
    {
        public string aadhaarNumber, ProfileID, AppName;
        public string InstituteName, RegistrationNo, ExamYMCode, StudentName, SINO, Year, MonthCode, ExamYMName, BranchName;
        public string GrandTotalFullMark, GrandTotalMarkSecured, GrandTotalDivisionMark, GrandTotalDivision, ResponseString, Status;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
    }

    public class NewMigrationCertificateTable2_DT : CommonDataStructure
    {
        public string aadhaarNumber, ProfileID, AppName;
        public string SINO, PCode, SubjectName, TotalFullMark, TotalMarkSecured;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
    }

    public class FIRRegistration_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID, AppName;
        public string CategoryId, Category, IncidentDate, IncidentPlace, Description, Particulars;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string SuspectDXML;
    }

    public class NFBS_DT : CommonDataStructure
    {
        //public string MobileNo, EmailID, FirstName, LastName, Gender, AddressLine1, AddressLine2,
        //RoadStreetName, LandMark, Locality, ImagePath;
        //public string DOB;
        //public int State, District, Taluka, Village, PinCode, Age;
        public string FirstName;

        public string LastName;
        public string MobileNo; public string EmailID; public string DOB; public string Age; public string Gender; public string FatherName;
        public string MotherName; public string Occupation; public string appAddressLine1; public string appAddressLine2; public string appRoadStreetName;
        public string appLandMark; public string appLocality; public string appddlState; public string appddlDistrict; public string appddlTaluka;
        public string appddlVillage; public string appPinCode; public string DeceasedName; public string DeceasedFName;
        public string ddlDeceasedGender; public string chkHeadFamily; public string deceasedAddressLine1; public string deceasedAddressLine2;
        public string deceasedRoadStreetName; public string deceasedLandMark; public string deceasedLocality; public string deceasedddlState;
        public string deceasedddlDistrict; public string deceasedddlTaluka; public string deceasedddlVillage; public string deceasedPinCode;
        public string AccountHolder; public string AccountNumber; public string IFSCCode;
        public DateTime CreatedOn;
        public string CreatedBy, ClientIP;
        public string DeceasedDOB, DeceasedGender, BPLCardNo, BPLCardYear, aadhaarNumber, ProfileID;
        public string deceasedState, deceasedDistrict, deceasedTaluka, deceasedVillage;
        public string DeceasedDOD, DeceasedAge;
    }

    public class FinancialAssistance_DT : CommonDataStructure
    {
        public string aadhaarNumber;
        public string Category;
        public string RegistrationNumber;
        public string TypeOfInstitute;
        public string InstituteName;
        public string Branch;
        public string AdmissionYear;
        public string CurrentSemester, DODSemester, DateOfDeath;
        public string AnnualIncome;
        public string StudentType;
        public string LodgingBoard, Conveyance;
        public string TuitionFee;
        public string StudyBooks;
        public string StudyMaterial;
        public string DevelopmentFee;
        public string ExaminationFee;
        public string TuitionFeeWaiver;
        public string TotalFeeAmt;
        public string ScholarshipScheme, SchemeName, SchemeAmount;
        public string BankName;
        public string AccountHolderName;
        public string BankAccountNo;
        public string BankIFSCcode;
        public string IssuingAuthorityName;
        public string IssuingAddress;
        public string IssuingContactNo;
        public string IssuingEmailId;
        public DateTime CreatedOn;
        public string CreatedBy;
        public string IsActive;
        public string ClientIP;
    }

    public class FinancialAssistance2_DT : CommonDataStructure
    {
        public string aadhaarNumber;
        public string RegistrationNumber;
        public string AdmissionYear;
        public string Semester;
        public string Branch;
        public string TypeOfInstitute;
        public string InstituteName;
        public string Category;
        public string AnnualIncome;
        public string FinancingGuardianName;
        public string FinancingGuardianRelation;
        public string BankName;
        public string AccountHolderName;
        public string BankAccountNo;
        public string BankIFSCcode;
        public string IssuingAuthorityName;
        public string IssuingAddress;
        public string IssuingContactNo;
        public string IssuingEmailId;
        public DateTime CreatedOn;
        public string CreatedBy;
        public string IsActive;
        public string ClientIP;
    }

    public class FinancialAssistance3_DT : CommonDataStructure
    {
        public string aadhaarNumber;
        public string RegistrationNumber;
        public string AdmissionYear;
        public string Semester;
        public string Branch;
        public string TypeOfInstitute;
        public string InstituteName;
        public string Category;
        public string AnnualIncome;
        public string FinancingGuardianName;
        public string FinancingGuardianRelation;
        public string BankName;
        public string AccountHolderName;
        public string BankAccountNo;
        public string BankIFSCcode;
        public string IssuingAuthorityName;
        public string IssuingAddress;
        public string IssuingContactNo;
        public string IssuingEmailId;
        public DateTime CreatedOn;
        public string CreatedBy;
        public string IsActive;
        public string ClientIP;
    }

    public class FinancialAssistance4_DT : CommonDataStructure
    {
        public string aadhaarNumber;
        public string RegistrationNumber;
        public string AdmissionYear;
        public string Semester;
        public string Branch;
        public string TypeOfInstitute;
        public string InstituteName;
        public string Category;
        public string AnnualIncome;
        public string FinancingGuardianName;
        public string FinancingGuardianRelation;
        public string BankName;
        public string AccountHolderName;
        public string BankAccountNo;
        public string BankIFSCcode;
        public string IssuingAuthorityName;
        public string IssuingAddress;
        public string IssuingContactNo;
        public string IssuingEmailId;
        public DateTime CreatedOn;
        public string CreatedBy;
        public string IsActive;
        public string ClientIP;
    }

    public class Fisheries_DT : CommonDataStructure
    {
        public string aadhaarNumber, ServiceID;
        public string ReqdService;
        public string TankDetal;
        public string TankDetail;   //--ddl own/lease take
        public string TankLength;   // txtbox area of tank
        public string TankBreadth;  // txtbox of tank
        public string TankArea;     // txtbox  of tank
        public string Village; // txtbox of village
        public string KhataNo;
        public string PlotNo;
        public string LeaseCategory; //ddl lease tnk
        public string LeasePeriod;  //txtbox leasepriod
        public string LeaseValue;   //txtbox lease value
        public string LessorDetail;
        public string Category;
        public string AnnualIncome;
        public string DistrictName;
        public string BlockName;
        public string GramPanchayatName;
        public string PresentTankStatus;  // ddl presenttankstatus
        public string IsCultureTank;    //IsCultureTankSelect depandon culture select
        public string PresentfishQuantal, PresentfishValue;
        public string BankName, BranchName, SpeciesCultured;
        public string EducationalQualification, DateOfBirth, Days, Month, Year;

        //-----Avail training
        public string Section1_AvailedAnytraining; //rdobtn for avail training

        public string Section1A_NoOfTraining; //txtbox for no oftraining
        public string Section1B_Week;
        public string Section1B_Month;
        public string Section1B_Year;
        public string Section1C_training_Name; //ddl training name
        public string Section1C_Other_training; //txtbox training

        //--------PFCS
        public string Section2_PFCSMember; //rdobtn for PFCS

        public string Section2A_PFCSName;  //txtbox
        public string Section2B_PFCSAddress;
        public string Section2C_PFCSMemberNo;

        //--------- Infrastructure at Farm Side
        public string Section3_InfrastructureatFarmSide; //rdbtn for  Infrastructure at Farm Side?

        public string Section3A_Road;  //chckbtn
        public string Section3B_Electricity; //chckbtn
        public string Section3C_Canal; //chckbtn

        //----------------loan previously
        public string Section4_PreviouslLoan; //rdbtn for loan previously

        public string Section4A_BankName; //txtbox
        public string Section4B_PurposeOfLoan; //txtbox
        public string Section4C_AmountOfLoan; //txtbox
        public string Section4D_OutstandingLoan; //txtbox

        //----------Section5_Finance
        public string FinanceMode; //ddl for _Finance

        //--------Witnes details
        public string WitnessName1;

        public string WitnessAddressLine1;
        public string WitnessName2;
        public string WitnessAddressLine2;

        //--EducationBoard
        public string Statecode;

        public string NameOfBoard;
        public string NameOfHigherSecondary;
        public string NameOfUniversity;
        public string PassingYear;
        public string Grade;
        public string TotalMarks;
        public string MarkSecured;
        public string Percentage;
        public DateTime CreatedOn;
        public string CreatedBy;
        public string ClientIP;
        public string IsActive;
    }

    public class CRAFT_DT : CommonDataStructure
    {
        public string aadhaarNumber;
        public string Boat_Condition;
        public string BPL_APL_Category;
        public string BPLNo;
        public string BPLYear;
        public string BoatRegistrationNo;
        public string BoatRegistrationDate;
        public string BoatOal;
        public string BoatDepth;
        public string BoatWidth;
        public string PoliceStation;
        public string BankFinance;
        public string BankName1;
        public string BankAddress1;
        public string BankName2;
        public string BankAddress2;
        public string Category;
        public string EngineType1;
        public string EngineType2;
        public string Other_Engine_Name;
        public string EngineHP;
        public string Other_Engine_HP;
        public string Annual_Income;
        public string Date_Of_Manufacture;
        public string Engine_Purchase;
        public string Purchase_Type;
        public string Purchase_Type_Other;
        public string EngineNumber, EngineMake, EngineCapacity, FinanceYear, FinanceBank;
        public DateTime CreatedOn;
        public string CreatedBy;
        public string IsActive;
        public string ClientIP;
    }

    public class FisheriesRegistration_DT : CommonDataStructure
    {
        public string aadhaarNumber;
        public string VesselName;
        public string VesselRegNo;
        public string VesselWhere;
        public string VesselWhen;
        public string VesselBoatType;
        public string VesselMaterials;
        public string VesselSheathing;
        public string BoatLength;
        public string BoatBreadth;
        public string EngineVHP;
        public string EngineNo;
        public string TradeMark;
        public string VesselType;
        public string VesselGearType;
        public string VesselBoatPlace;
        public string VesselBoatName;
        public string VesselBaseYear;
        public string VesselConsYear;
        public string NofCrews;
        public string CrewsDesignation;
        public DateTime CreatedOn;
        public string CreatedBy;
        public string IsActive;
        public string ClientIP;
    }

    public class CommonDataStructure
    {
        public string serviceid, department, district, block, panchayat, office, officer;
    }

    public class BasicDetails_DT
    {
        public string dateOfBirth, photo, ImagePath, language;
        public string aadhaarNumber, action;
        public string residentName, residentNameLocal, responseCode, gender, phone, emailId, Mobile;
        public string houseNumber, houseNumberLocal, careOf, careOfLocal, locality, localityLocal, landmark, landmarkLocal, street, streetLocal;
        public string subDistrict, subDistrictLocal, district, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal;
        public string IsActive, timestamp, ttl, vtc, vtcLocal, JSONData;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string Image;

        //public string ParentKey, ChildKey, pAddrCareOf, pAddrCareOf_LL, pAddrBuilding, pAddrBuilding_LL, pAddrStreet, pAddrStreet_LL, pAddrLandmark,
        //pAddrLandmark_LL, pAddrLocality, pAddrLocality_LL, pState_Code, pState, pDistrict_Code, pDistrict, pTaluka_Code, pTaluka, pPanchayat_Code, pPanchayat, pVillage_Code, pVillage,
        //pPinCode;

        public string ParentKey, ChildKey, phouseNumber, pcareOf, plocality, plandmark, pstreet;
        public string pvillage, psubDistrict, pdistrict, pstate, ppostOffice, ppincode;
        public string CurrentAddressXML;
    }

    public class CitizenProfile_DT
    {
        public string dateOfBirth, photo, ImagePath, language, ProfileID;
        public string aadhaarNumber, action;
        public string residentName, residentNameLocal, responseCode, gender, phone, emailId, Mobile, Password;
        public string houseNumber, houseNumberLocal, careOf, careOfLocal, locality, localityLocal, landmark, landmarkLocal, street, streetLocal;
        public string subDistrict, subDistrictLocal, district, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal, Village;
        public string IsActive, timestamp, ttl, vtc, vtcLocal, JSONData;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string Image;

        //public string ParentKey, ChildKey, pAddrCareOf, pAddrCareOf_LL, pAddrBuilding, pAddrBuilding_LL, pAddrStreet, pAddrStreet_LL, pAddrLandmark,
        //pAddrLandmark_LL, pAddrLocality, pAddrLocality_LL, pState_Code, pState, pDistrict_Code, pDistrict, pTaluka_Code, pTaluka, pPanchayat_Code, pPanchayat, pVillage_Code, pVillage,
        //pPinCode;
        public string MotherName, MotherTongue, Nationality, Category, Religion, AppID, TrnID, TransDate;

        public string ParentKey, ChildKey, phouseNumber, pcareOf, plocality, plandmark, pstreet;
        public string pvillage, psubDistrict, pdistrict, pstate, ppostOffice, ppincode;
        public string CurrentAddressXML;
        public string statecode, districtcode, subDistrictcode, Villagecode;
        public string CitizenProfileID;
        public string SkipValidation, ResponseType;

        public string ImageSign;
        public string OriginalDateOfBirth;

        public string RollNo, ExamCenter, Discipline;
    }

    public class OISFProfile_DT
    {
        public string dateOfBirth, photo, ImagePath, language, ProfileID;
        public string aadhaarNumber, action;
        public string residentName, residentNameLocal, responseCode, gender, phone, emailId, Mobile, Password;
        public string houseNumber, houseNumberLocal, careOf, careOfLocal, locality, localityLocal, landmark, landmarkLocal, street, streetLocal;
        public string subDistrict, subDistrictLocal, district, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal, Village;
        public string IsActive, timestamp, ttl, vtc, vtcLocal, JSONData;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string Image;
        public string AgeYear, AgeMonth, AgeDay, Religion, Category, Nationality, stdcode;

        public string department

                , block
                , panchayat
                , office
                , officer;

        //public string ParentKey, ChildKey, pAddrCareOf, pAddrCareOf_LL, pAddrBuilding, pAddrBuilding_LL, pAddrStreet, pAddrStreet_LL, pAddrLandmark,
        //pAddrLandmark_LL, pAddrLocality, pAddrLocality_LL, pState_Code, pState, pDistrict_Code, pDistrict, pTaluka_Code, pTaluka, pPanchayat_Code, pPanchayat, pVillage_Code, pVillage,
        //pPinCode;

        public string ParentKey, ChildKey, phouseNumber, pcareOf, plocality, plandmark, pstreet;
        public string pvillage, psubDistrict, pdistrict, pstate, ppostOffice, ppincode;
        public string CurrentAddressXML;
        public string statecode, districtcode, subDistrictcode, Villagecode;
        public string CitizenProfileID;

        public string Section1_PassOdia, Section1_AbililtyRead, Section1_AbilityWrite, Section1_AbilitySpeak, Section2_Married, Section2A_MoreThanOneSpouse
        , Section3_ExServiceMan, Section3A_ServiceRendered
        , Section3B_ServiceDurationFrom, Section3B_ServiceDurationTo, Section3C_ServiceYear, Section3C_ServiceMonth, Section3C_ServiceDay
            , Section4_IsSportsPerson, Section4A_SportsParticipated, Section4C_SportsFedAssName, ChoiceofPreference, SecondPreference
        , Section4B_SportsOthers, Section4B_WantsRelaxation, Section4B_RelaxationHeight, Section4B_RelaxationChest, Section4B_RelaxationWeight
            , Section5A_ParticipateEvent
        , Section5B_SportsCategory, Section5C_SportsMedal, Section6_NCCCertificate, Section6A_NCCCertificateCategory
        , Section7A_RegNo, Section7A_RegDate, Section7B_NameEmpExchg
            , Section8_HasDL, Section8A_LicenseVehicle, Section8B_LicenseNo, Section8B_LicenseDate, Section8C_NameRTOOffice
            , Section9_InvolvedCriminal, Section9A_ArrestDetail, Section9B_CaseRefNo, Section9C_District, Section9D_PoliceStationNo, Section9E_IPCSection;

        public string ImageSign;

        public string EduState, EduNameOfBoard, EduNameOfExamination, EduPassingYear, EduGrade, EduExamCleared, EduTotalMarks, EduMarkSecured, EduPercentage;

        public string Section5, Section7B_District, Section8C_District, Section9C_State;
        public string ResponseType;
        public string BattalionName, Issuedate, FormNumber, DDNumber, IssueBankName, IssueDDNumber, IssueDateOd200Rs, Amount;
    }

    public class CitizenBasicDetails_DT
    {
        public string dateOfBirth, photo, ImagePath, language;
        public string aadhaarNumber, action, LoginId;
        public string residentName, residentNameLocal, responseCode, gender, phone, emailId, Mobile;
        public string houseNumber, houseNumberLocal, careOf, careOfLocal, locality, localityLocal, landmark, landmarkLocal, street, streetLocal;
        public string subDistrict, subDistrictLocal, district, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal;
        public string IsActive, timestamp, ttl, vtc, vtcLocal, JSONData;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string Image;

        //public string ParentKey, ChildKey, pAddrCareOf, pAddrCareOf_LL, pAddrBuilding, pAddrBuilding_LL, pAddrStreet, pAddrStreet_LL, pAddrLandmark,
        //pAddrLandmark_LL, pAddrLocality, pAddrLocality_LL, pState_Code, pState, pDistrict_Code, pDistrict, pTaluka_Code, pTaluka, pPanchayat_Code, pPanchayat, pVillage_Code, pVillage,
        //pPinCode;

        public string ParentKey, ChildKey, phouseNumber, pcareOf, plocality, plandmark, pstreet;
        public string pvillage, psubDistrict, pdistrict, pstate, ppostOffice, ppincode;
        public string CurrentAddressXML;
    }

    public class CreateProfile_DT
    {
        public string dateOfBirth, photo, ImagePath, language, ProfileID;
        public string aadhaarNumber, action, LoginId;
        public string residentName, residentNameLocal, responseCode, gender, phone, emailId, Mobile, Password;
        public string houseNumber, houseNumberLocal, careOf, careOfLocal, locality, localityLocal, landmark, landmarkLocal, street, streetLocal;
        public string subDistrict, subDistrictLocal, district, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal, Village;
        public string IsActive, timestamp, ttl, vtc, vtcLocal, JSONData;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string Image;

        //public string ParentKey, ChildKey, pAddrCareOf, pAddrCareOf_LL, pAddrBuilding, pAddrBuilding_LL, pAddrStreet, pAddrStreet_LL, pAddrLandmark,
        //pAddrLandmark_LL, pAddrLocality, pAddrLocality_LL, pState_Code, pState, pDistrict_Code, pDistrict, pTaluka_Code, pTaluka, pPanchayat_Code, pPanchayat, pVillage_Code, pVillage,
        //pPinCode;

        public string ParentKey, ChildKey, phouseNumber, pcareOf, plocality, plandmark, pstreet;
        public string pvillage, psubDistrict, pdistrict, pstate, ppostOffice, ppincode;
        public string CurrentAddressXML;
        public string statecode, districtcode, subDistrictcode, Villagecode;
        public string CitizenProfileID;
        public string Religion, Category, MaterialStatus;
    }

    public class LoginDetail_DT
    {
        public string FullName, LoginID, Mobile, emailId, Password, IsActive;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
    }

    public class SeedLiBO
    {
        private string _App_no = string.Empty;
        private string _App_For = string.Empty;
        private string _Notified_Authority = string.Empty;
        private string _AthorityPlace = string.Empty;
        private string _AthorityDistrict = string.Empty;
        private string _AthorityState = string.Empty;
        private string _DAO_Office = string.Empty;
        private string _Bussiness_Type = string.Empty;
        private DateTime _Application_Date;
        private string _Name_of_Firm = string.Empty;
        private string _Applicant_Type = string.Empty;
        private string _Applicant_Name = string.Empty;
        private string _Postal_Address = string.Empty;
        private string _State = string.Empty;
        private string _District = string.Empty;
        private string _Block = string.Empty;
        private string _Email = string.Empty;
        private string _Pin_Code = string.Empty;
        private string _MobileNo = string.Empty;
        private string _Telephone = string.Empty;
        private string _Photo_ID_Type = string.Empty;
        private string _Photo_ID_Number = string.Empty;
        private string _Applicant_Photo_Path = string.Empty;
        private string _BAddress = string.Empty;
        private string _BState = string.Empty;
        private string _BDistrict = string.Empty;
        private string _BPin_Code = string.Empty;
        private string _BBlock = string.Empty;
        private string _BGP = string.Empty;
        private string _Company_Type = string.Empty;
        private string _Company_Name = string.Empty;
        private string _SOSAddress = string.Empty;
        private string _Principal_Certificate_Path = string.Empty;
        private string _Doc_dtls_chk = string.Empty;
        private string _Treasury_Name = string.Empty;
        private string _Challan_Number = string.Empty;
        private DateTime _Challan_Date;
        private string _Amount = string.Empty;
        private DateTime _insert_dt;
        private DateTime _update_dt;
        private string _paidstatus = string.Empty;
        private string _Processing_Reg_No = string.Empty;
        private DateTime _Issue_Date;
        private DateTime _Valid_Upto;

        public string App_no { get { return this._App_no; } set { this._App_no = value; } }
        public string App_For { get { return this._App_For; } set { this._App_For = value; } }
        public string Notified_Authority { get { return this._Notified_Authority; } set { this._Notified_Authority = value; } }
        public string AthorityPlace { get { return this._AthorityPlace; } set { this._AthorityPlace = value; } }
        public string AthorityDistrict { get { return this._AthorityDistrict; } set { this._AthorityDistrict = value; } }
        public string AthorityState { get { return this._AthorityState; } set { this._AthorityState = value; } }
        public string DAO_Office { get { return this._DAO_Office; } set { this._DAO_Office = value; } }
        public string Bussiness_Type { get { return this._Bussiness_Type; } set { this._Bussiness_Type = value; } }
        public DateTime Application_Date { get { return this._Application_Date; } set { this._Application_Date = value; } }
        public string Name_of_Firm { get { return this._Name_of_Firm; } set { this._Name_of_Firm = value; } }
        public string Applicant_Type { get { return this._Applicant_Type; } set { this._Applicant_Type = value; } }
        public string Applicant_Name { get { return this._Applicant_Name; } set { this._Applicant_Name = value; } }
        public string Postal_Address { get { return this._Postal_Address; } set { this._Postal_Address = value; } }
        public string State { get { return this._State; } set { this._State = value; } }
        public string District { get { return this._District; } set { this._District = value; } }
        public string Block { get { return this._Block; } set { this._Block = value; } }
        public string Email { get { return this._Email; } set { this._Email = value; } }
        public string Pin_Code { get { return this._Pin_Code; } set { this._Pin_Code = value; } }
        public string MobileNo { get { return this._MobileNo; } set { this._MobileNo = value; } }
        public string Telephone { get { return this._Telephone; } set { this._Telephone = value; } }
        public string Photo_ID_Type { get { return this._Photo_ID_Type; } set { this._Photo_ID_Type = value; } }
        public string Photo_ID_Number { get { return this._Photo_ID_Number; } set { this._Photo_ID_Number = value; } }
        public string Applicant_Photo_Path { get { return this._Applicant_Photo_Path; } set { this._Applicant_Photo_Path = value; } }
        public string BAddress { get { return this._BAddress; } set { this._BAddress = value; } }
        public string BState { get { return this._BState; } set { this._BState = value; } }
        public string BDistrict { get { return this._BDistrict; } set { this._BDistrict = value; } }
        public string BPin_Code { get { return this._BPin_Code; } set { this._BPin_Code = value; } }
        public string BBlock { get { return this._BBlock; } set { this._BBlock = value; } }
        public string BGP { get { return this._BGP; } set { this._BGP = value; } }
        public string Company_Type { get { return this._Company_Type; } set { this._Company_Type = value; } }
        public string Company_Name { get { return this._Company_Name; } set { this._Company_Name = value; } }
        public string SOSAddress { get { return this._SOSAddress; } set { this._SOSAddress = value; } }
        public string Principal_Certificate_Path { get { return this._Principal_Certificate_Path; } set { this._Principal_Certificate_Path = value; } }
        public string Doc_dtls_chk { get { return this._Doc_dtls_chk; } set { this._Doc_dtls_chk = value; } }
        public string Treasury_Name { get { return this._Treasury_Name; } set { this._Treasury_Name = value; } }
        public string Challan_Number { get { return this._Challan_Number; } set { this._Challan_Number = value; } }
        public DateTime Challan_Date { get { return this._Challan_Date; } set { this._Challan_Date = value; } }
        public string Amount { get { return this._Amount; } set { this._Amount = value; } }
        public DateTime insert_dt { get { return this._insert_dt; } set { this._insert_dt = value; } }
        public DateTime update_dt { get { return this._update_dt; } set { this._update_dt = value; } }
        public string paidstatus { get { return this._paidstatus; } set { this._paidstatus = value; } }
        public string Processing_Reg_No { get { return this._Processing_Reg_No; } set { this._Processing_Reg_No = value; } }
        public DateTime Issue_Date { get { return this._Issue_Date; } set { this._Issue_Date = value; } }
        public DateTime Valid_Upto { get { return this._Valid_Upto; } set { this._Valid_Upto = value; } }
    }

    public class SMS_DT
    {
        public string MobileNo, SMSText, SMSRequestXML, SMSResponseXML;
        public DateTime CreatedOn;
        public string CreatedBy, ClientIP;
        public string SMSPostData;
    }

    public class DeathCertificate_DT
    {
        public string aadhaarNumber, ProfileID, DeceasedName, FatherHusbandName, Gender;
        public string DateofDeath, TimeofDeath, DateofBirth;
        public string ApplicantName, DeceasedRelation, HospitalName, DeceAddressLine1, DeceAddressLine2, DeceRoadStreetName, DeceLandMark, DeceLocality;
        public int DeceAge, DeceState, DeceDistrict, DeceTaluka, DeceVillage, DecePinCode;
        public string HospAddressLine1, HospAddressLine2, HospRoadStreetName, HospLandMark, HospLocality;
        public int HospAge, HospState, HospDistrict, HospTaluka, HospVillage, HospPinCode;
        public DateTime CreatedOn;
        public string CreatedBy, ClientIP;
    }

    public class OTP_DT
    {
        public string aadhaarNumber, SMSID, OTPCode, AppName, MobileNo, OTPEntered, email, AppType;
        public DateTime CreatedOn, ModifiedOn, validTill;
        public string CreatedBy, ModifiedBy, ClientIP;
    }

    public class ComplaintRegistration_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID, AppName;

        public string ServicesID, Services, DepartmentID, ComplaintDept, ReferenceID, ApplicationDate,
            ComplaintID, ComplaintType, OfficerName, ComplaintDescription, ConcernedOfficer, ConcernedOffice;

        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
    }

    public class ServiceFeedBack_DT : CommonDataStructure
    {
        public string aadhaarNumber;

        public string AppName;
        public string AppID;
        public string FullName;
        public string MobileNo;
        public string verifyOTP;
        public string EmailID;
        public string FServices;
        public string Fdepartment;
        public string ApplicationID;
        public string TypeOfIssue;
        public string OtherIssue;
        public string FeedBackDetail;
        public string CreatedBy;
        public DateTime CreatedOn;
    }

    public class RatingFeedBack_DT : CommonDataStructure
    {
        public string aadhaarNumber;

        public string AppName;
        public string AppID;
        public string Rating;
        public string MobileNo;
        public string EmailID;
        public string FeedBackDetail;
        public string CreatedBy;
        public DateTime CreatedOn;
    }

    public class MenialStaffProfile_DT
    {
        public string dateOfBirth, photo, ImagePath, language, ProfileID;
        public string aadhaarNumber, action;
        public string residentName, residentNameLocal, responseCode, gender, phone, emailId, Mobile, Password;
        public string houseNumber, houseNumberLocal, careOf, careOfLocal, locality, localityLocal, landmark, landmarkLocal, street, streetLocal;
        public string subDistrict, subDistrictLocal, district, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal, Village;
        public string IsActive, timestamp, ttl, vtc, vtcLocal, JSONData;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string Image;
        public string AgeYear, AgeMonth, AgeDay, Religion, Category, Nationality, stdcode;

        public string department

                , block
                , panchayat
                , office
                , officer;

        public string ParentKey, ChildKey, phouseNumber, pcareOf, plocality, plandmark, pstreet;
        public string pvillage, psubDistrict, pdistrict, pstate, ppostOffice, ppincode;
        public string CurrentAddressXML;
        public string statecode, districtcode, subDistrictcode, Villagecode;
        public string CitizenProfileID;

        public string Section1_PassOdia, Section1_AbililtyRead, Section1_AbilityWrite, Section1_AbilitySpeak, Section2_Married, Section2A_MoreThanOneSpouse
        , Section3_ExServiceMan, Section3A_ServiceRendered
        , Section3B_ServiceDurationFrom, Section3B_ServiceDurationTo, Section3C_ServiceYear, Section3C_ServiceMonth, Section3C_ServiceDay
            , Section4_IsSportsPerson, Section4A_SportsParticipated
        , Section4B_SportsOthers, Section4B_WantsRelaxation, Section4B_RelaxationHeight, Section4B_RelaxationChest, Section4B_RelaxationWeight
            , Section5A_ParticipateEvent
        , Section5B_SportsCategory, Section5C_SportsMedal, Section6_NCCCertificate, Section6A_NCCCertificateCategory
        , Section7A_RegNo, Section7A_RegDate, Section7B_NameEmpExchg
            , Section8_HasDL, Section8A_LicenseVehicle, Section8B_LicenseNo, Section8B_LicenseDate, Section8C_NameRTOOffice
            , Section9_InvolvedCriminal, Section9A_ArrestDetail, Section9B_CaseRefNo, Section9C_District, Section9D_PoliceStationNo, Section9E_IPCSection;

        public string ImageSign;

        public string InstituteName, InstituteAddress, PassingYear;
    }

    public class CSCConnect_DT
    {
        public string KeyField, CAID, SCAName, SCALoginID, LoginID, FullName, KioskID, OMTID, Role, CookieValue;

        public string CreatedBy, ModifiedBy;
    }

    public class CSCConnectV2_DT
    {
        public string CSCID, UserName, Email, State_Code, Active_Status, User_Type, Last_Active, RAP, CreatedBy;
    }

    public class GeCountNumber_DT
    {
        public int Department;
        public int Services;
        public int ApplicationReceived;
        public int HabishaBratra;
    }

    public class EAppeal_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID, AppName;

        public string ServicesID, Services, DepartmentID, DepartmentName, ComplaintDept, ReferenceID, ApplicationDate, OfficeName, DistrictID, DistrictName,
            ComplaintID, ComplaintType, OfficerName, ComplaintDescription, ConcernedOfficer, ConcernedOffice;

        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
    }

    public class NewDuplicateSemesterMarksheetTb2_DT : CommonDataStructure
    {
        public string aadhaarNumber, ProfileID;
        public string AppName, PCode, SubjectName, SemFullMark, InternalFullMark, TotalPassMark, SecuredMark, InternalSecured, Total, Result;
        public string CreatedBy, ModifiedBy, ClientIP;
        public DateTime CreatedOn, ModifiedOn;
    }

    public class NewDuplicateSemesterMarksheet_DT : CommonDataStructure
    {
        public string aadhaarNumber, ProfileID;
        public string AppName, RegistrationNo, StudentName, Semester, Branch, InstituteName, ExamCenterName, Result, ResponseString, Status;
        public string CreatedBy, ModifiedBy, ClientIP;
        public DateTime CreatedOn, ModifiedOn;
    }

    public class Mutation_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID, HeirsDXML;
        public string OriginalAllotee, FatherName, DeathIssuingAuthority, DeathLetterNo, DCIssueDate, HeirshipIssuingAuthority, MiscCaseNo, HeirshipIssueDate;

        public string AddressLine1, AddressLine2, RoadName, LandMark, Locality, AStateCode, ADistrictCode, ASubDistrictCode, AVillageCode, PinCode;

        public string PDistrict, PBlock, PMouza, DrawingNo, PlotNo, AllottedArea, AreaUnit, RevenuePlotNo, PossessionDate;

        public string RentAmount, LandUsed, LandUsedType, RegistrationNo, RYear, DeedBookNo, DeedVolumeNo, FromPageDeedNo, ToPageDeedNo, IsRegistered, DeedNo, DeedDate,
        IsConstruted, IsHoldingTaxAccessed, IsNonResidential, IsMortgaged, MortgagedNo, MortgagedBank, MortgagedBranch, IsNOCEnclosed, NOCDetail,
            IsDisputed, IsMutation, IsUnauthorisedConstruction, GroundRentPaid;

        public string LegalHeirName, LegalHeirFather, LesseeRelation, Remark, KhataNo;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
    }

    public class OUATProfile_DT
    {
        public string dateOfBirth, photo, ImagePath, language, ProfileID;
        public string aadhaarNumber, action;
        public string residentName, residentNameLocal, responseCode, gender, phone, emailId, Mobile, Password;
        public string houseNumber, houseNumberLocal, careOf, careOfLocal, locality, localityLocal, landmark, landmarkLocal, street, streetLocal;
        public string subDistrict, subDistrictLocal, district, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal, Village;
        public string IsActive, timestamp, ttl, vtc, vtcLocal, JSONData;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string Image;
        public string AgeYear, AgeMonth, AgeDay, Religion, Category, Nationality, stdcode;

        public string department

                , block
                , panchayat
                , office
                , officer;

        //public string ParentKey, ChildKey, pAddrCareOf, pAddrCareOf_LL, pAddrBuilding, pAddrBuilding_LL, pAddrStreet, pAddrStreet_LL, pAddrLandmark,
        //pAddrLandmark_LL, pAddrLocality, pAddrLocality_LL, pState_Code, pState, pDistrict_Code, pDistrict, pTaluka_Code, pTaluka, pPanchayat_Code, pPanchayat, pVillage_Code, pVillage,
        //pPinCode;

        public string ParentKey, ChildKey, phouseNumber, pcareOf, plocality, plandmark, pstreet;
        public string pvillage, psubDistrict, pdistrict, pstate, ppostOffice, ppincode;
        public string CurrentAddressXML;
        public string statecode, districtcode, subDistrictcode, Villagecode;
        public string CitizenProfileID;

        public string Section1_PassOdia, Section1_AbililtyRead, Section1_AbilityWrite, Section1_AbilitySpeak, Section2_Married, Section2A_MoreThanOneSpouse
        , Section3_ExServiceMan, Section3A_ServiceRendered
        , Section3B_ServiceDurationFrom, Section3B_ServiceDurationTo, Section3C_ServiceYear, Section3C_ServiceMonth, Section3C_ServiceDay
            , Section4_IsSportsPerson, Section4A_SportsParticipated, Section4C_SportsFedAssName, ChoiceofPreference, SecondPreference
        , Section4B_SportsOthers, Section4B_WantsRelaxation, Section4B_RelaxationHeight, Section4B_RelaxationChest, Section4B_RelaxationWeight
            , Section5A_ParticipateEvent
        , Section5B_SportsCategory, Section5C_SportsMedal, Section6_NCCCertificate, Section6A_NCCCertificateCategory
        , Section7A_RegNo, Section7A_RegDate, Section7B_NameEmpExchg
            , Section8_HasDL, Section8A_LicenseVehicle, Section8B_LicenseNo, Section8B_LicenseDate, Section8C_NameRTOOffice
            , Section9_InvolvedCriminal, Section9A_ArrestDetail, Section9B_CaseRefNo, Section9C_District, Section9D_PoliceStationNo, Section9E_IPCSection;

        public string ImageSign;

        public string EduRollNo, EduState, EduNameOfBoard, EduNameOfExamination, EduPassingYear, EduGrade, EduExamCleared, EduTotalMarks, EduMarkSecured, EduPercentage;
        public string Edu2RollNo, Edu2State, Edu2NameOfBoard, Edu2NameOfExamination, Edu2PassingYear, Edu2Grade, Edu2ExamCleared, Edu2TotalMarks, Edu2MarkSecured, Edu2Percentage;
        public string EduRollNoAgro, EduStateAgro, EduNameOfBoardAgro, EduNameOfExaminationAgro, EduPassingYearAgro, EduGradeAgro, EduExamClearedAgro, EduTotalMarksAgro, EduMarkSecuredAgro, EduPercentageAgro;

        public string Section5, Section7B_District, Section8C_District, Section9C_State;
        public string ResponseType;
        public string BattalionName, Issuedate, FormNumber, DDNumber, IssueBankName, IssueDDNumber, IssueDateOd200Rs, Amount;

        public string Section1_ReservedSeat, Section1A_SeatCategory;
        public string Section2_PassOdia, Section2_AbililtyRead, Section2_AbilityWrite, Section2_AbilitySpeak, MILSubject;

        public string Section6_1_IsOUATEmployee,
            Section6_1_OUATEmployeeName,
            Section6_1_OUATEmployeeCode,
            Section6_1_OUATEmployeeDesignation,
            Section6_1_OUATEmployeeStatus,
            Section6_1_OUATEmployeeOffice,
            Section6_1_OUATEmployeeRelation;
    }

    public class OUATFormA_DT
    {
        public string dateOfBirth, photo, ImagePath, language, ProfileID;
        public string aadhaarNumber, action;
        public string residentName, residentNameLocal, responseCode, gender, phone, emailId, Mobile, Password;
        public string houseNumber, houseNumberLocal, careOf, careOfLocal, locality, localityLocal, landmark, landmarkLocal, street, streetLocal;
        public string subDistrict, subDistrictLocal, district, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal, Village;
        public string IsActive, timestamp, ttl, vtc, vtcLocal, JSONData;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string Image;
        public string AgeYear, AgeMonth, AgeDay, Religion, Category, Nationality, stdcode;

        public string department

                , block
                , panchayat
                , office
                , officer;

        //public string ParentKey, ChildKey, pAddrCareOf, pAddrCareOf_LL, pAddrBuilding, pAddrBuilding_LL, pAddrStreet, pAddrStreet_LL, pAddrLandmark,
        //pAddrLandmark_LL, pAddrLocality, pAddrLocality_LL, pState_Code, pState, pDistrict_Code, pDistrict, pTaluka_Code, pTaluka, pPanchayat_Code, pPanchayat, pVillage_Code, pVillage,
        //pPinCode;

        public string ParentKey, ChildKey, phouseNumber, pcareOf, plocality, plandmark, pstreet;
        public string pvillage, psubDistrict, pdistrict, pstate, ppostOffice, ppincode;
        public string CurrentAddressXML;
        public string statecode, districtcode, subDistrictcode, Villagecode;
        public string CitizenProfileID;

        public string Section1_PassOdia, Section1_AbililtyRead, Section1_AbilityWrite, Section1_AbilitySpeak, Section2_Married, Section2A_MoreThanOneSpouse
        , Section3_ExServiceMan, Section3A_ServiceRendered
        , Section3B_ServiceDurationFrom, Section3B_ServiceDurationTo, Section3C_ServiceYear, Section3C_ServiceMonth, Section3C_ServiceDay
            , Section4_IsSportsPerson, Section4A_SportsParticipated, Section4C_SportsFedAssName, ChoiceofPreference, SecondPreference
        , Section4B_SportsOthers, Section4B_WantsRelaxation, Section4B_RelaxationHeight, Section4B_RelaxationChest, Section4B_RelaxationWeight
            , Section5A_ParticipateEvent
        , Section5B_SportsCategory, Section5C_SportsMedal, Section6_NCCCertificate, Section6A_NCCCertificateCategory
        , Section7A_RegNo, Section7A_RegDate, Section7B_NameEmpExchg
            , Section8_HasDL, Section8A_LicenseVehicle, Section8B_LicenseNo, Section8B_LicenseDate, Section8C_NameRTOOffice
            , Section9_InvolvedCriminal, Section9A_ArrestDetail, Section9B_CaseRefNo, Section9C_District, Section9D_PoliceStationNo, Section9E_IPCSection;

        public string ImageSign;

        public string EduRollNo, EduState, EduNameOfBoard, EduNameOfExamination, EduPassingYear, EduGrade, EduExamCleared, EduTotalMarks, EduMarkSecured, EduPercentage;
        public string Edu2RollNo, Edu2State, Edu2NameOfBoard, Edu2NameOfExamination, Edu2PassingYear, Edu2Grade, Edu2ExamCleared, Edu2TotalMarks, Edu2MarkSecured, Edu2Percentage;
        public string EduRollNoAgro, EduStateAgro, EduNameOfBoardAgro, EduNameOfExaminationAgro, EduPassingYearAgro, EduGradeAgro, EduExamClearedAgro, EduTotalMarksAgro, EduMarkSecuredAgro, EduPercentageAgro;

        public string Section5, Section7B_District, Section8C_District, Section9C_State;
        public string ResponseType;
        public string BattalionName, Issuedate, FormNumber, DDNumber, IssueBankName, IssueDDNumber, IssueDateOd200Rs, Amount;

        public string Section1_ReservedSeat, Section1A_SeatCategory;
        public string Section2_PassOdia, Section2_AbililtyRead, Section2_AbilityWrite, Section2_AbilitySpeak, MILSubject;

        public string Section6_1_IsOUATEmployee,
            Section6_1_OUATEmployeeName,
            Section6_1_OUATEmployeeCode,
            Section6_1_OUATEmployeeDesignation,
            Section6_1_OUATEmployeeStatus,
            Section6_1_OUATEmployeeOffice,
            Section6_1_OUATEmployeeRelation;

        public string FirstChoiceOfExaminationCenter,
            SecondChoiceOfExaminationCenter,
            ThirdChoiceOfExaminationCenter;

        public string MotherName, MotherTongue, ResidentType;
        public string AgroStream, AgroCourse;
        public string AppID, TrnID, OriginalDateOfBirth;
        public string EditAppID;

        public string GreenCardHolder, Physicallyhandicapped, NRISponsership, WesternOdisha
                , OUATEmployee, Kashmirmigrant, HandicappedPart, HandicappedPercent, WesternDistrict, KMFrom, KMTo;

        public string
            TMT_Physics,
            MOT_Physics,
            TMP_Physics,
            MOP_Physics,
            TMTP_Physics
            ,
            TMOTP_Physics,
            TMT_Chemistry,
            MOT_Chemistry,
            TMP_Chemistry,
            MOP_Chemistry,
            TMTP_Chemistry,
            TMOTP_Chemistry
            ,
            TMT_Math,
            MOT_Math,
            TMP_Math,
            MOP_Math,
            TMTP_Math,
            TMOTP_Math,
            TMT_Botany,
            MOT_Botany,
            TMP_Botany,
            MOP_Botany
            ,
            TMTP_Botany,
            TMOTP_Botany,
            TMT_Zoology,
            MOT_Zoology,
            TMP_Zoology,
            MOP_Zoology,
            TMTP_Zoology,
            TMOTP_Zoology,
            PCMPercentage,
            TMT_PCM,
            MOT_PCM
            ,
            TMP_PCM,
            MOP_PCM,
            TMTP_PCM,
            MOTP_PCM,
            TMT_PCB,
            MOT_PCB,
            TMP_PCB,
            MOP_PCB,
            TMTP_PCB,
            MOTP_PCB,
            PCBPercentage;

        public string ExamType;
        public string HandicapType;
    }

    public class OUATAgroFormA_DT
    {
        public string dateOfBirth, photo, ImagePath, language, ProfileID;
        public string aadhaarNumber, action;
        public string residentName, residentNameLocal, responseCode, gender, phone, emailId, Mobile, Password;
        public string houseNumber, houseNumberLocal, careOf, careOfLocal, locality, localityLocal, landmark, landmarkLocal, street, streetLocal;
        public string subDistrict, subDistrictLocal, district, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal, Village;
        public string IsActive, timestamp, ttl, vtc, vtcLocal, JSONData;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string Image;
        public string Religion, Category, Nationality;

        public string department

                , block
                , panchayat
                , office
                , officer;

        public string ParentKey, ChildKey, phouseNumber, pcareOf, plocality, plandmark, pstreet;
        public string pvillage, psubDistrict, pdistrict, pstate, ppostOffice, ppincode;
        public string CurrentAddressXML;
        public string statecode, districtcode, subDistrictcode, Villagecode;
        public string CitizenProfileID;

        public string Section1_PassOdia, Section1_AbililtyRead, Section1_AbilityWrite, Section1_AbilitySpeak, Section2_Married, Section2A_MoreThanOneSpouse
        , Section3_ExServiceMan, Section3A_ServiceRendered
        , Section3B_ServiceDurationFrom, Section3B_ServiceDurationTo, Section3C_ServiceYear, Section3C_ServiceMonth, Section3C_ServiceDay
            , Section4_IsSportsPerson, Section4A_SportsParticipated, Section4C_SportsFedAssName, ChoiceofPreference, SecondPreference
        , Section4B_SportsOthers, Section4B_WantsRelaxation, Section4B_RelaxationHeight, Section4B_RelaxationChest, Section4B_RelaxationWeight
            , Section5A_ParticipateEvent
        , Section5B_SportsCategory, Section5C_SportsMedal, Section6_NCCCertificate, Section6A_NCCCertificateCategory
        , Section7A_RegNo, Section7A_RegDate, Section7B_NameEmpExchg
            , Section8_HasDL, Section8A_LicenseVehicle, Section8B_LicenseNo, Section8B_LicenseDate, Section8C_NameRTOOffice
            , Section9_InvolvedCriminal, Section9A_ArrestDetail, Section9B_CaseRefNo, Section9C_District, Section9D_PoliceStationNo, Section9E_IPCSection;

        public string ImageSign;

        public string EduRollNo, EduState, EduNameOfBoard, EduNameOfExamination, EduPassingYear, EduGrade, EduExamCleared, EduTotalMarks, EduMarkSecured, EduPercentage;
        public string Edu2RollNo, Edu2State, Edu2NameOfBoard, Edu2NameOfExamination, Edu2PassingYear, Edu2Grade, Edu2ExamCleared, Edu2TotalMarks, Edu2MarkSecured, Edu2Percentage;
        public string EduRollNoAgro, EduStateAgro, EduNameOfBoardAgro, EduNameOfExaminationAgro, EduPassingYearAgro, EduGradeAgro, EduExamClearedAgro, EduTotalMarksAgro, EduMarkSecuredAgro, EduPercentageAgro;

        public string Section5, Section7B_District, Section8C_District, Section9C_State;
        public string ResponseType;
        public string BattalionName, Issuedate, FormNumber, DDNumber, IssueBankName, IssueDDNumber, IssueDateOd200Rs, Amount;

        public string Section1_ReservedSeat, Section1A_SeatCategory;
        public string Section2_PassOdia, Section2_AbililtyRead, Section2_AbilityWrite, Section2_AbilitySpeak, MILSubject;

        public string Section6_1_IsOUATEmployee,
            Section6_1_OUATEmployeeName,
            Section6_1_OUATEmployeeCode,
            Section6_1_OUATEmployeeDesignation,
            Section6_1_OUATEmployeeStatus,
            Section6_1_OUATEmployeeOffice,
            Section6_1_OUATEmployeeRelation;

        public string MotherName, MotherTongue, ResidentType;
        public string AgroAdmisionNumber, AgroPolytechnicCenter, AgroPolytechnicStream;
    }

    public class MigrationNew_DT : CommonDataStructure
    {
        public string AppID, AppName, aadhaarNumber, ProfileID;
        public string BasicDetailType;
        public string BasicDetailNumber;
        public string RegistrationNo;
        public string BranchName;
        public string AdmissionYear;
        public string InstituteLeavingDate;
        public string InstituteName;
        public string ExaminationDetails;
        public string CertificateReason;
        public string Title;
        public string FullName;
        public string Gender;
        public string FatherHusbandName;
        public string DOB;
        public string Age;
        public string EmailId;
        public string MobileNo;
        public string AltMobileNo;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string Image;
    }

    public class NewMigration_DT : CommonDataStructure
    {
        public string AppID, AppName, aadhaarNumber, ProfileID;
        public string BasicDetailType;
        public string BasicDetailNumber;
        public string RegistrationNo;
        public string BranchName;
        public string AdmissionYear;
        public string InstituteLeavingDate;
        public string InstituteName;
        public string ExaminationDetails;
        public string CertificateReason;
        public string Title;
        public string FullName;
        public string Gender;
        public string FatherHusbandName;
        public string DOB;
        public string Age;
        public string EmailId;
        public string MobileNo;
        public string AltMobileNo;

        public string RollNo;
        public string StudentName;
        public string StudentFatherName;
        public string StudentDOB;
        public string StudentDOBYear;
        public string StudentDOBMonth;
        public string StudentDOBDay;
        public string StudentGender;
        public string StudentMobile;
        public string StudentCategory;
        public string StudentEmailId;
        public string StudentAdmisionYear;
        public string StudentInstituteName;
        public string StudentBranchName;
        public string StudentSemester;

        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string Image;
        public string RollNoValue;
    }

    public class NewMigrationVerify_DT : CommonDataStructure
    {
        public string AppID, AppName, aadhaarNumber, ProfileID;
        public string BasicDetailType;
        public string BasicDetailNumber;
        public string RegistrationNo;
        public string BranchName;
        public string AdmissionYear;
        public string InstituteLeavingDate;
        public string InstituteName;
        public string ExaminationDetails;
        public string CertificateReason;
        public string Title;
        public string FullName;
        public string Gender;
        public string FatherHusbandName;
        public string DOB;
        public string Age;
        public string EmailId;
        public string MobileNo;
        public string AltMobileNo;

        public string RollNo;
        public string StudentName;
        public string StudentFatherName;
        public string StudentDOB;
        public string StudentDOBYear;
        public string StudentDOBMonth;
        public string StudentDOBDay;
        public string StudentGender;
        public string StudentMobile;
        public string StudentCategory;
        public string StudentEmailId;
        public string StudentAdmisionYear;
        public string StudentInstituteName;
        public string StudentBranchName;
        public string StudentSemester;

        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string Image;
        public string RollNoValue;
        public string Attendance;
    }

    public class OUATComplaint_DT
    {
        public string aadhaarNumber;
        public string AppName;
        public string AppID;
        public string FullName;
        public string DOB;
        public string EmailId;
        public string MobileNo;
        public string PaymentStatus;
        public string ComplaintType;
        public string ComplaintDetail;
        public string BankRefNo;
        public string SmsNo;
        public string OtherType;
        public string CreatedBy;
        public DateTime CreatedOn;
        public string department, district, block, panchayat, office, officer;
    }

    public class OUATRefund_DT
    {
        public string aadhaarNumber;
        public string AppName;
        public string AppID;
        public string FullName;
        public string DOB;
        public string EmailId;
        public string MobileNo;
        public string PaymentStatus;
        public string ReFundDetail;
        public string SmsNo;
        public string NameOfAccountHolder;
        public string AccountNumber;
        public string IFSCCode;
        public string BackName;
        public string BankBranch;
        public string CreatedBy;
        public DateTime CreatedOn;
        public string department, district, block, panchayat, office, officer;
    }

    public class Birth_DT
    {
        public string AadhaarNumber, SvcID, ChildName, DOB, Gender, FatherName, MotherName, PlaceOfBirth, NoOfDaysTillBirth, Religion;
        public string HospitalName, Address1, Address2, Street, Landmark, Locality, State, District, BlockTaluka, PanchayatVillageCity, PinCode;
        public string BName, BMobile, BRelationWithChild, BLocationType, BAddressOfCareOf, BAddressBuilding, BDistrict, BlockTalukaSubDistrict, BGramPanchayat, BMunicipality, BNationality;
        public string CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy;
    }

    public class DomicileForm_DT : CommonDataStructure
    {
        public string AadhaarNumber;

        public string ApplicantName;
        public string FatherHusbandName;
        public string MotherName;
        public string Gender;
        public string DOB;
        public string BirthPlace;
        public string FatherBirthPlace;
        public string MobileNo;
        public string EmailID;
        public string ReasonForDomicile;
        public string AddressLine1;
        public string AddressLine2;
        public string StateName;
        public string DistrictName;
        public string SubDistrictName;
        public string GramPanchayatName;
        public string MunsiPatwariChowkiName;
        public string Pincode;
        public string IsResidentofUK;
        public string YearsInUK;
        public string HasMomDadProperty;
        public string DescribeProperty;
        public string isParentEarningUK;
        public string IfNoDescribe;
        public string FromWhen;
        public string TypeOfBussiness;
        public string isParentWorkingGovt;
        public string IfYesDistrict;
        public string GovtDepartment;
        public string GovtPost;

        public DateTime CreatedOn;
        public string CreatedBy;
        public string IsActive;
    }

    public class UKIncomeCertificate_DT
    {
        public string AadhaarNumber;
        public string FullName;
        public string FHName;
        public string MotherName;
        public string Gender;
        public string MobileNo;
        public string EmailId;
        public string MonthlyIncome;
        public string IncomeInWords;
        public string LocationType;
        public string Address1;
        public string Address2;
        public string IState;
        public string IDistrict;
        public string IBlock;
        public string IPanchayat;
        public string Muncipality;
        public string Pincode;
        public string ProfileID;
        public string CreatedBy;
    }

    public class OUATPHDForm_DT : CommonDataStructure
    {
        public string AadhaarDetail;
        public string aadhaarNumber;
        public string ProfileID;
        public string AppMobileNo;
        public string OUATCourse;
        public string CollegeName;
        public string DegreeName;
        public string SubjectName;
        public string CandidateName;
        public string ICARYesNo, ICARCollegeName;
        public string FatherName;
        public string MotherName;
        public string DOB, Year, Month, Day;
        public string Gender;
        public string Religion;
        public string Category;
        public string MaritalStatus;
        public string MotherTongue;
        public string Nationality;
        public string MobileNo;
        public string EmailId;
        public string ParmanentAddressline1;
        public string ParmanentAddressline2;
        public string ParRoadstreet;
        public string ParLandmark;
        public string ParLocality;
        public string ParState;
        public string ParDistrict;
        public string ParBlock;
        public string ParVillage;
        public string ParPincode;
        public string PresentAddressline1;
        public string PresentAddressline2;
        public string PreRoadstreet;
        public string PreLandmark;
        public string PreLocality;
        public string PreState;
        public string PreDistrict;
        public string PreBlock;
        public string PreVillage;
        public string PrePincode;
        public string Section1_RecievedAnyGoldmadel;
        public string Section1_DocumentDescribe;
        public string Section2_SpecialClaim;
        public string Section2_DescribeSpecialClaim;
        public string Section2_Sports, Section2_Nss;
        public string Section3_AreYouEmployed;
        public string Section3_Dsignation;
        public string Section3_EmployerName;
        public string Section3_EmployerAddress;
        public string Section3_CerifiedFurnished;
        public string BankName;
        public string ChalanNumber;
        public string IssuedDate;
        public string Branch;

        public string OdiaLang;
        public string ReadOdia;
        public string WriteOdia;
        public string SpeakOdia;
        public string ResidenceType;

        public string ResponseType, Image, ImageSign, Password, JSONData;
        public string ParentKey, ChildKey, phouseNumber, pcareOf, plocality, plandmark, pstreet;
        public string pvillage, psubDistrict, pdistrict, pstate, ppostOffice, ppincode;
        public string CurrentAddressXML, statecode, districtcode, subDistrictcode, Villagecode, CitizenProfileID;

        public string HscName, HscTotalMarks, HscMarksGot, HscPercentage, HscDivision, HscPassingYear;
        public string SscName, SscTotalMarks, SscMarksGot, SscPercentage, SscDivision, SscPassingYear;
        public string BscName, BscTotalMarks, BscMarksGot, BscPercentage, BscDivision, BscPassingYear;
        public string MscName, MscTotalMarks, MscMarksGot, MscPercentage, MscDivision, MscPassingYear;

        public string ReservationQuota, PhysicallyChallenged, HandicapType, HandicappedPart, HandicappedPercent, NRISponsership, OtherState, OtherStateName, Horticulture;

        public DateTime CreatedOn;
        public string CreatedBy;
        public string IsActive;
        public string HscBoardName, HscNameExamPass, HscBoardRollNo, HscYearPassing, HscExamCleard, HscGradeSystem, HscTotalMark, HscMarkSecured, SscBoardName,
                         SscNameExamPass, SscBoardRollNo, SscYearPassing, SscExamCleard, SscGradeSystem, SscTotalMark, SscMarkSecured, BscDegreeDimploma, BscBoardUniversity, BscMaxMarks,
                         BscMarksSecured, BscGrade, BscPassYear, BscMainOptionalSubject;
        public string FatherOccupation, MotherOccupation, GuardianName, GuardianOccupation, UniversityRegNo;
        public string Section1_IsHandicap, Section1_HandicapType, Section1_DisabilityPercent, Section2_IsExDefence, Section2_DeptName, Section2_PostName
            , Section3_IsPlyedInInterUniv, Section3_TournamentName, Section3_TournamentYear, Section4_IsPossessNcc, Section4_PassYear, Section4_NameOfAuthority
            , Section5_IsKashmiri, Section5_MigrationYear, Section5_Address, Section6_IsMLib, Section6_OrganisationDetail, Section6_TotalExp, Section6A_IsMba
            , Section6A_ExaminationName, Section6A_ExaminationYear, Section6_Place, Section6_Designation, Section6A_MarkSecured;
    }

    public class OUATDiplomaForm_DT : CommonDataStructure
    {
        public string AadhaarDetail;
        public string aadhaarNumber;
        public string ProfileID;
        public string AppMobileNo;

        public string CandidateName;

        public string FatherName;
        public string MotherName;
        public string DOB, Year, Month, Day;
        public string Gender;
        public string Religion;
        public string Category;
        public string MaritalStatus;
        public string MotherTongue;
        public string Nationality;
        public string MobileNo;
        public string EmailId;
        public string ParmanentAddressline1;
        public string ParmanentAddressline2;
        public string ParRoadstreet;
        public string ParLandmark;
        public string ParLocality;
        public string ParState;
        public string ParDistrict;
        public string ParBlock;
        public string ParVillage;
        public string ParPincode;
        public string PresentAddressline1;
        public string PresentAddressline2;
        public string PreRoadstreet;
        public string PreLandmark;
        public string PreLocality;
        public string PreState;
        public string PreDistrict;
        public string PreBlock;
        public string PreVillage;
        public string PrePincode;

        public string OdiaLang;
        public string ReadOdia;
        public string WriteOdia;
        public string SpeakOdia;
        public string ResidenceType;

        public string ResponseType, Image, ImageSign, Password, JSONData;
        public string ParentKey, ChildKey, phouseNumber, pcareOf, plocality, plandmark, pstreet;
        public string pvillage, psubDistrict, pdistrict, pstate, ppostOffice, ppincode;
        public string CurrentAddressXML, statecode, districtcode, subDistrictcode, Villagecode, CitizenProfileID;

        public string HscName, HscTotalMarks, HscMarksGot, HscPercentage, HscDivision, HscPassingYear;
        public string SscName, SscTotalMarks, SscMarksGot, SscPercentage, SscDivision, SscPassingYear;

        public string ReservationQuota, PhysicallyChallenged, HandicapType, HandicappedPart, HandicappedPercent, GreenCardHolder;

        public DateTime CreatedOn;
        public string CreatedBy;
        public string IsActive;
    }

    public class RoadTaxForm_DT : CommonDataStructure
    {
        public string ProfileID;
        public string VehicleNo;
        public string MobileNo;
        public string OwnerName;
        public string CareOf;
        public string EngineNo;
        public string PurchaseDeliveryDate;
        public string VehicleClass;
        public string BodyType;
        public string MakersModel;
        public string VehicleMakers;
        public string UnloadedWeight;
        public string LadenWeight;
        public string SeatingCapacity;
        public string ManufactureYear;
        public string SleeperCapacity;
        public string StandingCapacity;
        public string RegistrationDate;
        public string ChassisNumber;
        public string VehicleType;
        public string VehicleCategory;
        public string VehicleValidity;
        public string PrevReceiptDate;
        public string PrevTaxAmount;
        public string PrevTaxUpTo;
        public string PrevTaxFine;
        public string RoadTaxNicJsonData;
        public string TaxValue;
        public string TaxMode;
        public string TaxHead;
        public string CurTaxFrom;
        public string CurTaxUpTo;
        public string CurTaxAmount;
        public string CurTaxPenalty;
        public string CurTaxSurcharge;
        public string CurTaxRebate;
        public string CurTaxInterest;
        public string CurTaxAmount1;
        public string CurTaxAmount2;
        public string CurTotalTaxAmount;
        public string AddCurTaxValue;
        public string AddCurTaxMode;
        public string AddCurTaxHead;
        public string AddCurTaxFrom;
        public string AddCurTaxUpTo;
        public string AddCurTaxAmount;
        public string AddCurTaxPenalty;
        public string AddCurTaxSurcharge;
        public string AddCurTaxRebate;
        public string AddCurTaxInterest;
        public string AddCurTaxAmount1;
        public string AddCurTaxAmount2;
        public string AddCurTotalTaxAmount;
        public string UserServiceTax;
        public string FinalTaxPaymentAmount;
        public string TaxCalNicJsonData;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string SeqNo;
        public string IsActive;
        public DateTime CreatedOn, ModifiedOn;
    }

    public class RoadTaxFinal_DT
    {
        public string ServiceID;
        public string ProfileID;
        public string AppID;
        public string VehicleNo;
        public string MobileNo;
        public string OwnerName;
        public string FinalTotalAmount;
        public string FinalRecptDate;
        public string FinalMessage;
        public string FinalReason;
        public string FinalStatus;
        public string PermanentRecpNo;
        public string RoadTaxFinalResponse;
        public string CreatedBy;
        public string CreatedOn;
        public string IsActive;
    }

    public class SeniorCitizenIDCard_DT
    {
        public string ProfileID;
        public string AadhaarNumber;
        public string AadhaarDetail;
        public string AppMobileNo;
        public string PSDistrict, DPoliceStation;
        public string PoliceStation;
        public string AppName;
        public string DOB;
        public string Year;
        public string Month;
        public string Day;
        public string Gender;
        public string MobileNo;
        public string EmailId;
        public string SpouseName;
        public string Category;
        public string Nationality;
        public string RelativeSameCity;
        public string MedicalHistory;
        public string BloodGroup;
        public string Arthritis;
        public string HeartDisease;
        public string Cancer;
        public string RespiratoryDiseases;
        public string AlzheimerDiseases;
        public string Osteoporosis;
        public string Diabetes;
        public string InfluenzaPheumonia;
        public string Others;
        public string DescribeOther;
        public string DoctorName;
        public string DoctorMobileNo;
        public string DoctorAddress;
        public string DoctorPinCode;

        public string RelativeDetailsXML, HeirsDXML;
        public string ServantDetailsXML, HeirsDXMLS;

        //public string SPersonType, SNameOfPerson, SAddress, SMobile;
        public string dateOfBirth, photo, ImagePath, language, action;

        public string residentName, residentNameLocal, responseCode, phone, Mobile;
        public string houseNumber, houseNumberLocal, careOf, careOfLocal, locality, localityLocal, landmark, landmarkLocal, street, streetLocal;
        public string subDistrict, subDistrictLocal, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal, Village;
        public string timestamp, ttl, vtc, vtcLocal;
        public string MotherName, FatherName, Religion, LandLineNo;

        // public string PRMS,PRMD,PRMT,
        public string serviceid, department, district, block, panchayat, office, officer;

        public string ResponseType, Image, ImageSign, Password, JSONData;
        public string ParentKey, ChildKey, phouseNumber, pcareOf, plocality, plandmark, pstreet;
        public string pvillage, psubDistrict, pdistrict, pstate, ppostOffice, ppincode;
        public string CurrentAddressXML, statecode, districtcode, subDistrictcode, Villagecode, CitizenProfileID;

        public DateTime CreatedOn;
        public string CreatedBy;
        public string IsActive;
    }

    public class DTEManualData_DT
    {
        public string ServiceID,
            AppID,
            RegistrationNo,
            Session,
            AdmissionYear,
            PassingYear,
            BranchName,
            InstituteName,
            StudentName,
            FatherName,
            Division,
            CreatedBy;
    }

    public class ITIManualData_DT
    {
        public string ServiceID,
            AppID,
            RegistrationNo,
            Session,
            AdmissionYear,
            PassingYear,
            BranchName,
            InstituteName,
            StudentName,
            FatherName,
            Division,
            CreatedBy;
    }

    public class OUATAdmissionData_DT
    {
        public string
            RollNo
            , FormBAppID
            , FormAAppID
            , AadhaarNumber
            , AdmissionNo
            , CollegeName
            , CourseName
            , CreatedBy
            , CreatedOn
            , IsActive
            , CollegeLeavingCertificate
            , ConductCertificate
            , MigrationCertificate
            , MedicalFitnessCertificate
            ;
    }

    public class OUATPGAdmissionData_DT
    {
        public string
              RollNo
            , AppID
            , AadhaarNumber
            , AdmissionNo
            , CollegeName
            , CourseName
            , CreatedBy
            , CreatedOn
            , IsActive
            , CollegeLeavingCertificate
            , ConductCertificate
            , MigrationCertificate
            , MedicalFitnessCertificate
            , Subject
            , Programme
            ;
    }

    public class OUATAgroAdmissionData_DT
    {
        public string
              RollNo
            , AppID
            , AadhaarNumber
            , AdmissionNo
            , CollegeName
            , CourseName
            , CreatedBy
            , CreatedOn
            , IsActive
            , CollegeLeavingCertificate
            , ConductCertificate
            , MigrationCertificate
            , MedicalFitnessCertificate
            ;
    }
    public class OUATUGSpotAdmissionData_DT
    {
        public string
            RollNo
            , AppID
            , FormAAppID
            , FormBAppID
            , AadhaarNumber
            , AdmissionNo
            , CourseFirstPreferance
            , CourseSecondPreferance
            , CourseThirdPreferance
            , CollegeFirstPreferance
            , CollegeSecondPreferance
            , CollegeThirdPreferance
            , CreatedBy
            , CreatedOn
            , IsActive


            ;
    }
    public class OUATAgroFormB_DT
    {
        public string dateOfBirth, photo, ImagePath, language, ProfileID;
        public string aadhaarNumber, action;
        public string residentName, residentNameLocal, responseCode, gender, phone, emailId, Mobile, Password, ResponseType;
        public string houseNumber, houseNumberLocal, careOf, careOfLocal, locality, localityLocal, landmark, landmarkLocal, street, streetLocal;
        public string subDistrict, subDistrictLocal, district, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal, Village;
        public string IsActive, timestamp, ttl, vtc, vtcLocal, JSONData;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string DOB, Year, Month, Day, Religion, Category, Nationality, stdcode, MotherName, MotherTongue, Email;
        public string AgroFormA_AppID, EntranceRollNo, TransactionNo, Transactiondate, Discipline, CandidateName, FatherName;

        public string department, block, panchayat, office, officer;

        public string ParentKey, ChildKey, phouseNumber, pcareOf, plocality, plandmark, pstreet;
        public string pvillage, psubDistrict, pdistrict, pstate, ppostOffice, ppincode;
        public string CurrentAddressXML, CitizenProfileID;
        public string statecode, districtcode, subDistrictcode, Villagecode;

        public string Image, ImageSign;

        public string EduRollNo, EduState, EduNameOfBoard, EduNameOfExamination, EduPassingYear, EduGrade, EduExamCleared, EduTotalMarks, EduMarkSecured, EduPercentage;
        public string Edu2RollNo, Edu2State, Edu2NameOfBoard, Edu2NameOfExamination, Edu2PassingYear, Edu2Grade, Edu2ExamCleared, Edu2TotalMarks, Edu2MarkSecured, Edu2Percentage;
        public string Edu3RollNo, Edu3NameOfBoard, Edu3NameOfExamination, Edu3PassingYear, Edu3Grade, Edu3TotalMarks, Edu3MarkSecured, Edu3Percentage;

        public string AppID, TrnID, OriginalDateOfBirth;
        public string EditAppID;
    }

    /* End: New Data Structures */

    public class SeniorCitizenCheckList_DT
    {
        public string ServiceID, AppID, CreatedBy;
        public int Photograph, PresentAddress, OriginalAadhar, Mobile, AnyCriminalCase;
    }

    public class UGMarksEntry_DT : CommonDataStructure
    {
        public string AppID, EditAppID, ProfileID, KeyField, CreatedBy;

        public string
           TMT_Physics,
           MOT_Physics,
           TMP_Physics,
           MOP_Physics,
           TMTP_Physics,
           TMOTP_Physics,

           TMT_Chemistry,
           MOT_Chemistry,
           TMP_Chemistry,
           MOP_Chemistry,
           TMTP_Chemistry,
           TMOTP_Chemistry
           ,
           TMT_Math,
           MOT_Math,
           TMP_Math,
           MOP_Math,
           TMTP_Math,
           TMOTP_Math,

           TMT_Botany,
           MOT_Botany,
           TMP_Botany,
           MOP_Botany,
           TMTP_Botany,
           TMOTP_Botany,

           TMT_Zoology,
           MOT_Zoology,
           TMP_Zoology,
           MOP_Zoology,
           TMTP_Zoology,
           TMOTP_Zoology,

           PCMPercentage,
           TMT_PCM,
           MOT_PCM,
           TMP_PCM,
           MOP_PCM,
           TMTP_PCM,
           MOTP_PCM,
           TMT_PCB,
           MOT_PCB,
           TMP_PCB,
           MOP_PCB,
           TMTP_PCB,
           MOTP_PCB,
           PCBPercentage;

        public string ExamType;
    }

    public class OUATUGEducation_DT
    {
        public string ProfileID, FormBAppID, CertificateName, EduRollNo, EduNameOfBoard
             , EduNameOfExamination, EduPassingYear, EduGrade, EduTotalMarks, EduMarkSecured, EduPercentage, CreatedBy;
    }

    public class CBCSAdmissionForm_DT
    {

        //student details
        public string RollNo;
        public string ProfileID;
        public string AadhaarNumber;
        public string AadhaarDetail;
        public string AppName;
        public string FatherName, MotherName, GuardianName;
        public string Relation;
        public string DOB;
        public string Gender;
        public string MotherTongue;
        public string Category;
        public string MobileNo;
        public string EmailId;
        public string AppID;

        public string LastCourseXML, HeirsDXML, CurrentAddressXML;
        public string language;

        public string residentName, residentNameLocal, responseCode, phone;
        public string houseNumber, houseNumberLocal, careOf, careOfLocal, locality, localityLocal, landmark, landmarkLocal, street, streetLocal;
        public string district, subDistrict, subDistrictLocal, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal, Village;

        public string ResponseType, Image, ImageSign, Password, JSONData;
        public string phouseNumber, pcareOf, plocality, plandmark, pstreet;
        public string pvillage, psubDistrict, pdistrict, pstate, ppostOffice, ppincode;
        public string statecode, districtcode, subDistrictcode, Villagecode;
        // public string CollegeCode, CollegeName;

        public DateTime CreatedOn;
        public string CreatedBy, IsActive;
        //Admission Details
        public string AdmissionDate, AdmissionNo, CollegeCode;
        public string Branch, Subject1, Subject2, Subject3, Subject4, Subject5, Subject6, Subject7, Subject8;
        public string RollNoSSC, BoardNameSSC, ExamPassSSC, PassingYearSSC, GradeTypeSSC, TotalMarkSSC, MarkObtainedSSC, PercentageSSC;
        public string BoardType, RollNoHSC, BoardNameHSC, ExamPassHSC, PassingYearHSC, GradeTypeHSC, TotalMarkHSC, MarkObtainedHSC, PercentageHSC;
        public string Sublbl1, Sublbl2, Sublbl3, Sublbl4, Sublbl5, Sublbl6, Sublbl7, Sublbl8;
        public string Remarks;
    }

    public class EnrolementAdmissionForm_DT
    {

        //student details
        public string ProfileID;
        public string AadhaarNumber;
        public string AadhaarDetail;
        public string AppName;
        public string FatherName, MotherName, GuardianName;
        public string Relation;
        public string DOB;
        public string Gender;
        public string MotherTongue;
        public string Category;
        public string MobileNo;
        public string EmailId;
        public string AppID;

        public string LastCourseXML, HeirsDXML, CurrentAddressXML;
        public string language;

        public string residentName, residentNameLocal, responseCode, phone;
        public string houseNumber, houseNumberLocal, careOf, careOfLocal, locality, localityLocal, landmark, landmarkLocal, street, streetLocal;
        public string district, subDistrict, subDistrictLocal, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal, Village;

        public string ResponseType, Image, ImageSign, Password, JSONData;
        public string phouseNumber, pcareOf, plocality, plandmark, pstreet;
        public string pvillage, psubDistrict, pdistrict, pstate, ppostOffice, ppincode;
        public string statecode, districtcode, subDistrictcode, Villagecode;
        // public string CollegeCode, CollegeName;

        public DateTime CreatedOn;
        public string CreatedBy, IsActive;
        public string RollNo;
        public string RegistrationNo;
        //Admission Details
        public string AdmissionDate, AdmissionNo, CollegeCode;
        public string Branch, Subject1, Subject2, Subject3, Subject4, Subject5, Subject6, Subject7;
        public string RollNoSSC, BoardNameSSC, ExamPassSSC, PassingYearSSC, GradeTypeSSC, TotalMarkSSC, MarkObtainedSSC, PercentageSSC;
        public string BoardType, RollNoHSC, BoardNameHSC, ExamPassHSC, PassingYearHSC, GradeTypeHSC, TotalMarkHSC, MarkObtainedHSC, PercentageHSC;
        public string Sublbl1, Sublbl2, Sublbl3, Sublbl4, Sublbl5, Sublbl6, Sublbl7;
    }

    #endregion New Data Sturctures

    #region backexam
    public class BackExamForm_DT
    {

        //Back student details
        //student details
        public string ProfileID;
        public string AadhaarNumber;
        public string AadhaarDetail;
        public string RollNo, AppName, RedgNo;
        public string FatherName, MotherName, TotalAmount, CollegeCode;
        public string DOB;
        public string Gender;
        public string Tongue, religion, nationality;
        public string Category;
        public string MobileNo;
        public string EmailId;
        public string AppID, Branch, Exam_Freq, Exam_Type;

        public string Image, ImageSign, userType;

        // public string PaperDetails;
        public string Paper1, Paper2, Paper3, Paper4, Paper5, Paper6, Paper7, Paper8, Paper9;
        public string UPaper1, UPaper2, UPaper3, UPaper4, UPaper5, UPaper6, UPaper7, UPaper8, UPaper9;
        public string SubCode1, SubCode2, SubCode3, SubCode4, SubCode5, SubCode6, SubCode7, SubCode8, SubCode9;


        public DateTime CreatedOn;
        public string CreatedBy, IsActive, ServiceID;
        //Admission Details

    }

    #endregion


    /******* Sumbalpur University ********/

    public class MigrationSU_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID, AppName;
        public string StudentType, CollegeCode, CollegeName, RegistrationNo, RollNo, ExaminationDetails, LastExamDate, AdmissionYear, Program, Class, JoiningCollege, Joininguniversity, Reason;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string Image, ImageSign, DOB;
        public string RegCardStatus, Gender, Mobile, EmailID, FatherName, Candidate;
    }

    public class CollegeTransfer_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID, AppName;
        public string StudentType, RegistrationNo, RollNo, AdmissionYear, CollegeCode, CollegeName, Program, Class, Subject1, Subject2, Subject3, Subject4, Subject5, Subject6, Subject7, JoiningCollegeCode, JoiningCollegeName, JoiningProgram
, JoiningClass, Reason;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string Image;
    }


    public class DuplicateDegree_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID, AppName;
        public string StudentType, RegistrationNo, RollNo, AdmissionYear, PassingYear, LastExamDate, ExaminationDetails, CollegeCode, CollegeName, Program,
Subject1, Subject2, Subject3, Subject4, Reason;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
    }

    public class ProvisionalCertificate_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID, AppName;
        public string StudentType, RegistrationNo, RollNo, AdmissionYear, PassingYear, LastExamDate, Result, ExamAppeared, CollegeCode, CollegeName, Program, Reason, ExamName;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
    }

    public class RegistrationReceipt_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID, AppName;
        public string StudentType, RegistrationNo, RollNo, AdmissionYear, CollegeCode, CollegeName, Program, Reason, DOB;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
    }

    public class DocumentVerification_DT : CommonDataStructure
    {
        public string AppID, aadhaarNumber, ProfileID, AppName, ServiceID, ApplicantType;
        public string CollegeCode, CollegeName, RegistrationNo, RollNo, StudentType, StudentName, Result, PassingYear, Branch, Reason, CompanyApplicantName;
        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP;
        public string AppAddressLine1, AppAddressLine2, AppStreetName, AppLandmark, AppLocality, AppStateCode, AppDistrictCode, AppSubDistrictCode, AppVillageCode, AppPinCode;
    }

    public class SUManualData_DT
    {
        public string ServiceID,
                     AppID
                    , StudentType
                    , RegistrationNo
                    , RollNo
                    , AdmissionYear
                    , PassingYear
                    , BranchName
                    , Class
                    , CollegeName
                    , StudentName
                    , FatherName
                    , Division
                    , CreatedBy
                    , CreatedOn
                    , ModifiedBy
                    , ModifiedOn
                    , IsActive;
    }

    public class DeptProfile_DT
    {
        public string LoginID
            , Name
            , Designation
            , Gender
            , Mobile
            , PhoneNo
            , MailID
            , JoiningDate
            , EmpCode
            , AadhaarNo
            , Photo
            , Sign
            , CreatedBy;

        public DateTime CreatedOn;
    }

    public class Admission_DT
    {
        public string CreatedBy, ModifiedBy;
        public DateTime? CreatedOn, ModifiedOn;

        public string ServiceID,
            AppID,
            KeyField, Action, RowID, Remarks;

        public string RollNo, Branch, CollegeCode, StudentType;


    }
    public class SUPGAdmission_DT
    {
        public string AadhaarDetail, UniversityRegNo, aadhaarNumber, AppMobileNo, ProfileID, OUATCourse, CollegeName, DegreeName, SubjectName, CandidateName, FatherName,
                    MotherName, DOB, Year, Month, Day, Gender, Religion, Category, MaritalStatus, MotherTongue, Nationality, MobileNo, EmailId, FatherOccupation,
                    MotherOccupation, GuardianName, GuardianOccupation, ParmanentAddressline1, ParmanentAddressline2, ParRoadstreet, ParLandmark, ParLocality, ParState,
                    ParDistrict, ParBlock, ParVillage, ParPincode, PresentAddressline1, PresentAddressline2, PreRoadstreet, PreLandmark, PreLocality, PreState, PreDistrict,
                    PreBlock, PreVillage, PrePincode, Image, ImageSign;
        public string HscBoardName, HscNameExamPass, HscBoardRollNo, HscYearPassing, HscExamCleard, HscGradeSystem, HscTotalMark, HscMarkSecured, HscPercentage, SscBoardName,
            SscNameExamPass, SscBoardRollNo, SscYearPassing, SscExamCleard, SscGradeSystem, SscTotalMark, SscMarkSecured, SscPercentage, BscDegreeDimploma,
            BscBoardUniversity, BscMaxMarks, BscMarksSecured, BscGrade, BscDivision, BscPassYear, BscMainOptionalSubject;
        public string Section1_IsHandicap, Section1_HandicapType, Section1_DisabilityPercent, Section2_IsExDefence, Section2_DeptName, Section2_PostName,
            Section3_IsPlyedInInterUniv, Section3_TournamentName, Section3_TournamentYear, Section4_IsPossessNcc, Section4_PassYear, Section4_NameOfAuthority,
            Section5_IsKashmiri, Section5_MigrationYear, Section5_Address, Section6_IsMLib, Section6_OrganisationDetail, Section6_TotalExp, Section6A_IsMba,
            Section6A_ExaminationName, Section6A_ExaminationYear, Section6_Place, Section6_Designation, Section6A_MarkSecured, JSONData,
            CurrentAddressXML, Password, IsActive, CreatedBy, CitizenProfileID;
        public DateTime? CreatedOn;
        public string Section7, Section8, Section9;
        public string DepartmentId, CourseType, ProgrammId, ApplyingFor, TotalMark_Hon,
                      TotalMarkSecure_Hon, TotalMark_Pass, TotalMarkSecure_Pass, LLM_TotalMark5Yrs, LLM_TotalMarkSecure5Yrs, LLM_3Yrs_Type,
                      LLM_3Yrs_LLBHonDiv, LLM_3Yrs_LLBHonTotalMark, LLM_3Yrs_LLBHonMarkSecure, LLM_3Yrs_LLBPassTotalMark, LLM_3Yrs_LLBPassMarkSecure,
                      MBA_MatScore, MBA_TotalMarks, MBA_TotalMarkSecured, ProgramName, @IsPassGraduate;
        public string WorkExp_MBA, MTech_GraduateDiv, MTech_MscDiv, MTech_ProDegreeDiv, BE_BTech_Bsc_TotalMark,
            BE_BTech_Bsc_MarkSecure, Hons_Div, Pass_Div, MTech_Hons_PG_RSAndGIS;
    }


    public class InternalMark_DT
    {
        public string RowID, RollNo, PaperCode, ExamType, Session, Semester, CreatedBy, MarksObtained, PracticalMark, InternalMark, TheoryMark;
        public string IsAbsent, IsSubmitted;
        public DateTime? CreatedOn;

    }

    public class TheoryMark_DT
    {
        public string RowID, RollNo, PaperCode, ExamType, Session, Semester, CreatedBy, TheoryMark, ExaminerID;
        public string IsAbsent, IsSubmitted;
        public DateTime? CreatedOn;
        public string SetID, RollNoRange;
        public string TotalMark, SubjectType;

    }

    public class IntimationData_DT
    {
        public string
            AppID
            , RollNo
            , DocPath
            , MobileNo
            , EmailID
            , CreatedBy
            , CreatedOn
            , IsActive;
    }

    public class SUCollege_DT
    {
        public string CollegeCode,
                        CollegeName,
                        MobileNo,
                        PhoneNo,
                        EmailID,
                        District,
                        DistrictCode,
                        CollegeType,
                        Address,
                        CreatedBy;
        public string Remarks, KeyField, FileName, FilePath;
    }

    public class UnivRegistration_DT
    {
        public string RowID, RollNo, Session, CreatedBy, RegNo;
        public string IsSubmitted;
        public DateTime? CreatedOn;

    }

    public class SemesterFee_DT
    {
        public string RowID, ExamSemester, Exam_Type, BranchStream, ExamYear, Examination_fees, Centre_Charges, Supervision_Charges, Subsequent_Appearance, PortalFee
        , Paper1_FeesAmount, Paper2_FeesAmount
        , Paper3_FeesAmount, PaperAll_FeesAmount, LateFeesAmount, LateFeesAmount2, LateFeesAmount3
        , FeesDate, FeesDate2, FeesDate3, StartDate, EndDate
        , PCM_PCG_Fee, Diploma_Fee, CreatedBy, CreatedOn, ActionType;

    }

    public class ExcelUpload_DT
    {
        public string TransactionDate, service_id, Semester, AppID, PG_App_ID, RollNo, Countif, Total, Dept, PortalFee, LateFeesAmount, OtherCharges
        , ExamType, ExamYear, Remarks, TransferDate;

        public string CreatedBy, KeyField, FileName, FilePath;
        public DateTime CreatedOn;

        public string FUNAME, HONS, GE, P1, P2, P3, P4, P5, G1, G2, G3, G4, G5, SGPA, RESULT, A1, A2, A3, A4, A5, A1I, A2I, A3I, A4I, A5I,
            Branch, PaperCount, AdmissionYear, IsEligible, IsActive;

        public string SubjectCode, SubjectName, Code, SubjectType, Program, Course, CourseType, SelectionType, BranchCode, for1SEM, for2SEM, for3SEM, for4SEM, for5SEM, for6SEM;
    }

    public class NoticeData_DT
    {
        public string NoticeNumber, NoticeType, NoticeHeading, NoticeDetail, NoticeDate, SearchText, FromDate, ToDate;
        public string CreatedBy, JSONData;
        public DateTime? CreatedOn;
    }
    public class Activity_DT
    {
        public string RowID, Semester, Activity, ExamYear, StartDate, EndDate
        , CreatedBy, CreatedOn, ActionType;
    }

    public class Zone_DT
    {
        public string RowID, Semester, ZoneID, ExamYear, MappedCollege, SubjectType, StartDate, EndDate
        , CreatedBy, CreatedOn, ActionType, BranchCode;
    }

    public class Examiner_DT
    {
        public string RowID, Semester, ZoneID, ExamYear, BranchCode, SubjectType, SubjectCode, PaperCode,
            ExaminerID, ExaminerName, ExaminerCode, CreatedBy, CreatedOn, ActionType;
    }

    public class CollegeTeachers_DT
    {
        public string TeacherID, ProfileID, CollegeCode, SubjectCode, SubjectName, TeacherName, DesignationID, Specialization, UnivRegNo, DateOfJoining, Experience
            , MobileNo, PhoneNo, EmailID, Address, District, Block, Village, PinCode, Remark, IsActive, Createdon, CreatedBy, Flag;
    }

    public class BankDetail_DT
    {
        public string RowID, CollegeCode, BankCode, BankName, BankHolderName, AccountNo, DistrictCode, TalukaCode, VillageCode, BankAddress, PinCode, CreatedBy, IFISCCode;
    }

    public class EditStudentPics_DT
    {

        //student details
        public string RollNo;
        public string ProfileID;
        public string AadhaarNumber;
        public string AadhaarDetail;
        public string FatherName, MotherName;
        public string DOB;
        public string MobileNo;

        public string AppID, CreatedBy;
        public string ResponseType, Image, ImageSign, Password, JSONData;
        public string Remarks;
    }


    public class CollegeAffiiation_DT
    {
        public string CollegeCode,
                        AffiliationNo,
                        AffiliationYear,
                        AffiliationFile,
                        Remark,
                        CreatedBy;

    }


    public class CSVTUPhDForm_DT
    {
        public string ServiceID, AppID, MobileNo, EmailId, IsEntranceExempted, CategoryofExemption, CourseType, ResearchCenter, Discipline, Specialization
        , ApplicantName, DateofBirth, FatherName, MotherName, Gender, Category, Nationality, PhysicallyChallenged, IsOrtho, IsVisual, IsHearing
        , ParmanentAddressline1, ParmanentAddressline2, ParRoadstreet, ParLandmark, ParLocality, ParState, ParDistrict, ParBlock, ParVillage, ParPincode
        , PresentAddressline1, PresentAddressline2, PreRoadstreet, PreLandmark, PreLocality, PreState, PreDistrict, PreBlock, PreVillage, PrePincode
        , NRIAddressline1, NRIAddressline2, NRICountry, NRICityTown, NRIPincode, AnyOtherCourse, CourseDetail, DisciplinaryAction, DisciplinaryDetail
        , ResearchPublished, PublishedDetail, ResearchPresented, PresentedDetail
        , ProfileID, CreatedOn, CreatedBy, IndExp;

        public string Photograph, Signature;

        public string RollNo, EducationName, InstituteName, BoardName, EduDiscipline, EduSpecialization, TotalMark, MarkObtain, Percentage
        , Division, EduFromYear, EduToYear, PassingYear;

        public string FSlNo, ExaminationName, ExaminationDiscipline, FYears, Detail;

        public string WSlNo, WFromYear, WToYear, EmployerDetail, Post, AppointmentNature, WYears;

        public string EducationDetailXML, WorkExperianceXML, EntranceFellowshipXML, JSONData, Password;

        public string Entrance, CETYear, CETPercentage, CETValid, CETDetail, MPhilFrom, MPhilTo, Mode, MPhilCourse, MPhilUniv, MPhilDetail
        , FellowFrom, FellowTo, FellowCollege, FellowUniv, SeniorityNo, FellowPost
        , ResearchFrom, ResearchTo, Laboratry, ResearchOrg, ResearchPost, ResearchNature
        , CourseFrom, CourseTo, CourseMode, CourseName, CourseCollege, CourseUniversity, CourseRollNo;

    }

    public class SafeXPayRequest_DT
    {

        public string ag_id, me_id, order_no, Amount, Country, Currency, txn_type, success_url, failure_url, Channel, pg_id, Paymode;
        public string Scheme, emi_months, card_no, exp_month, exp_year, cvv, card_name, cust_name;
        public string email_id, mobile_no, unique_id, is_logged_in;
        public string bill_address, bill_city, bill_state, bill_country, bill_zip;
        public string ship_address, ship_city, ship_state, ship_country, ship_zip, ship_days, address_count;
        public string item_count, item_value, item_category;
        public string udf_1, udf_2, udf_3, udf_4, udf_5, Vpa_address;

        public string txn_details, pg_details, card_details, cust_details, Bill_details, Item_details, Other_details, UPI_details;

        public string enc_txn_details, enc_pg_details, enc_card_details, enc_cust_details, enc_bill_details, enc_ship_details, enc_item_details, enc_other_details;

        public string appid, pgappid, serviceid, profileid, creadtedon, createdby, modifiedon, modifiedby, isactive, remarks, data;

    }

    public class SafeXPayResponse_DT
    {
        public string enc_txn_response, enc_pg_details, enc_fraud_details, enc_other_details, txn_response, txn_response_arr, ag_id, me_id, order_no;
        public string amount, country, currency, txn_date, txn_time, ag_ref, pg_ref, status, txn_type, res_code, res_message;

        public string pg_details, pg_details_arr, pg_id, pg_name, paymode, emi_months;

        public string fraud_details, fraud_details_arr, fraud_action, fraud_message, score;

        public string other_details, other_details_arr, udf_1, udf_2, udf_3, udf_4, udf_5;

        public string appid, pgappid, serviceid, profileid, creadtedon, createdby, modifiedon, modifiedby, isactive, remarks, data;

    }

    public class FacultyDetail_DT
    {
        public string FacultyID, ProfileID, CollegeCode, DepartmentCode, DepartmentName, CourseCode, BranchCode, ProgramCode, SubjectCode, SubjectName, ExamSession, Semester
                        , DesignationID, FacultyName, Gender, DateOfBirth, EvaluatorID, Statue19No, DateofJoining, Specialization
                        , AadharNo, PANNo, MobileNo, PhoneNo, WhatsAppNo, EmailID, FacultyStatus
                        , GraduationQualificationin, PostGraduationQualification, DoctorateQualification, PostDoctorateQualification
                        , ExperianceTotal, ExperianceUG, ExperiancePG, IndustrialExperiance
                        , Address, DistrictCode, BlockCode, VillageCode, PinCode
                        , BankCode, BankName, BankHolderName, AccountNo, BankDistrictCode, BankTalukaCode, BankVillageCode, BankAddress, BankPinCode, IFISCCode
                        , Remark, IsActive, Createdon, CreatedBy, ModifiedOn, ModifiedBy, Flag, Status;
    }

    public class NominateFaculty_TB
    {
        public string ProfileID, FacultyID, Semester, Session, DepartmentCode, BranchCode, CourseCode, ProgramCode, SubjectCode
    , Remark, CreatedOn, CreatedBy, IsActive, KeyField, Status, RowID;
    }

    public class EnrollmentData_DT
    {

        //student details
        public string ProfileID;

        public string DTERegistrationNo, DTERollNo, CourseName, CollegeCode, CourseCode, ProgramCode, CourseType, EntryType, AdmittedQuota, AdmissionYear, AdmissionDate;
        public string ExamType, CSVTURedgNo;

        public string StudentName, FatherName, MotherName;
        public string DOB;
        public string Gender;
        public string MobileNo;
        public string EmailId;
        public string PhysicallyChallanged, Nationality, BloodGroup, Category;
        public string EducationGap, GapFromYear, GapToYear;
        public string HasMigration, MigrationNo, MigrationDate;
        public string HasScoreCard, ScoreCardDetail, EntranceRollNo, EntranceMarks;

        public string CasteCertificate, CasteCertificateNo, CasteCertificateDate, CasteIssuingAuthority;

        public string CourseDetailXML;

        public string ParmanentAddressline1, ParmanentAddressline2, ParRoadstreet, ParLandmark, ParLocality, ParState, ParDistrict, ParBlock, ParVillage, ParPincode;
        public string PresentAddressline1, PresentAddressline2, PreRoadstreet, PreLandmark, PreLocality, PreState, PreDistrict, PreBlock, PreVillage, PrePincode;

        public string Photograph, PathPhotograph, Signature, PathSignature, LoginID, Password, JSONData;

        public string DomicileState, DomicileDistrict, DomicileTehsil, DomicileNo, DomicileDate, DomicleAuthority;
        public string MarkSheetXDoc, MarkSheetXIIDoc, DiplomaCerificateDoc, UGMarkSheetDoc, PGMarkSheetDoc, CasteCertificateDoc, DomicileCertificateDoc, MigrationCertificateDoc, GapCertificateDoc
            , ScoreCardDoc, OtherDoc;

        public string CreatedBy, ClientIP;
        public DateTime CreatedOn;

        public string AdmittedCategory, PhysicsTM, PhysicsMO, PhysicsPR, ChemistryTM, ChemistryMO, ChemistryPR, MathematicsTM, MathematicsMO, MathematicsPR;
        public string PhysicsSubject, ChemistrySubject, MathematicsSubject;
        public string AppID, Lateral;
    }

    public class ExamFormData_DT
    {
        public string EnrollmentNo, RollNo, ProfileID, KeyField, Semester, ExamSession, SubjectCode, SubjectName;
        public string CreatedBy, ClientIP;
        public DateTime CreatedOn;
    }

    public class UpdateStudentPassword_DT
    {
        public string EnrollmentNo, RollNo, LoginID, Password, MobileNo, EmailID;
        public string CreatedBy, ClientIP, JSONData;
        public string Photograph, Signature;
        public DateTime CreatedOn;
    }

    public class ElectiveSubject_TB
    {
        public string RowID, EnrollmentNo, RollNo, Semester, ExamYear, ExamType, SubjectCode, SubjectCode2, SubjectCode3, SubjectCode4, LastExamType, CreatedBy, Remarks, SubjectType, CourseCode, ProgramCode, CollegeCode, ElectiveType;
    }

    public class CSVTUMarkEntry_DT
    {
        public string RowID, RollNo, SubjectCode, ExamType, ExamSession, Semester, CreatedBy, TheoryMO_CT, SessionalMO_TA, PracticalMarkObtain, TheoryMarkObtain;
        public string IsAbsent, IsSubmitted;
        public DateTime? CreatedOn;

    }

    public class MarkAttendance_DT
    {
        public string RowID, RollNo, SubjectCode, ExamType, ExamSession, Semester, CreatedBy, AttendanceRemark, AttendaceMark;
        public string IsAbsent, IsSubmitted;
        public DateTime? CreatedOn;

    }

    public class CBACSVTU_DT
    {
        public string AppID, ProfileId, ServiceId, FatherName, StudentNameEnglish, StudentNameHindi, EmailID, MobileNo, DeliverMode, DeliverType;
        public string EnrollmentNo, RollNo, AdmissionYear, PassingYear, CollegeCode, CourseCode, ProgramCode, Remark;
        public string AddressLine1, AddressLine2, StateCode, DistrictCode, SubDistrictCode, VillageCode, PinCode;

        public DateTime CreatedOn, ModifiedOn;
        public string CreatedBy, ModifiedBy, ClientIP, JSONData, TransferCertificateNo, TCIssueDate, ApplyingFor, Semester, SemesterCount, DOB, Coppies;
        public string SemesterInfo;
    }

    public class ActivityCSVTU_DT
    {
        public string RowID, Activity, ActionType
, CourseCode, Semester
, ExamType
, ExamSession
, StartDate
, EndDate
, IsActive
, ResultDate
, MarkEntryEndDate
, AttendanceEndDate
, OfflineEndDate
, ElectiveSubjectEndDate
, CreatedOn
, CreatedBy
, ModifiedOn
, ModifiedBy
, Remarks
, RTRVStartDate
, RTRVEndDate;
    }


    /**MPSS DataStructure***/

    public class SchoolDetail_DT
    {
        public string SchoolCode,
                        SchoolEnglish,
                        SchoolHindi,
                        MobileNo,
                        PhoneNo,
                        EmailID,
                        District,
                        DistrictCode,
                        CollegeType,
                        Address,
                        CreatedBy;
        public string Remarks, KeyField, FileName, FilePath;
    }
    public class Studentdata_DT
    {
        public long StudentID, MobieNo, SamagraNo;

        public bool IsPassOtherBoard, IsMPNative, IsDeclare;

        public DateTime TBirthdate;

        public string StudentName;
        public string Birthdate;
        public string Gender;
        public string Class;
        public string Section;
        public string Subject;
        public string School;
        public string FatherName;
        public string MotherName;
        public string Category;
        public string SubCaste;
        public string Regilion;
      
        public string Block;
        public string District, City;
        public string Colony;
        public string HouseNo;
        public string pincode;
        public string Img;
        public string ImgTC;
      



    }
    public class Scholardata_DT
    {
        public int NoOfSibling, PreAttDays;
        public long StudentID, MobieNoParent;
        public decimal FamilyIncome, MonthlyFee, JobSalary;

        public string StudentName

     , Gender
     , Class
     , Section
     , Birthdate
     , Subject
     , School
     , BankAccountNo
     , BankAccountIFSCCode
     , FatherName
     , FatherOcc
     , MotherName
     , MotherOcc

     , Caste
     , SubCaste
     , CasteCertNo
     , Regilion
     , ExamBoardName

     , DateAdmisCurrSch
     , DateAdmisCurrClass

     , AdmissionNo
     , CurrentCls
     , LastCls
     , Mediums
     , Disability

     , EquipDisability
     , FreeUniform

     , YrLastExam
     , LastAnnualResult
     , PassPercentage
     , LastClsInt
     , StudentStatus
     , CodeFacultySt
     , CodeTradeVocationalPrg
     , TypeJobRoleVocationalPrg
     , LvlNSFQ
     , ObjVocationalPrg
     , JobStaus

     , LadliLaxmiNo;

        public bool IsFatherDead, IsMPOrigin, IsParentIcomeTaxPayer, IsHosteller, IsDGSCaste, IsFamilyBPL
     , IsDisadvantagedgroup, IsClsFirstEnrollStatus, IsFreeTextbooks, IsResidingHostel
     , IsRecSpecialTraining, IsRegVocationalPrg, Ishomeless, IsFreeTransport, IsFreeEscortDis
     , IsRTE, IsAnyHaveScholarShip, FreeBicycle;

        public DateTime TBirthdate, TDateAdmisCurrSch, TDateAdmisCurrClass;


    }

}