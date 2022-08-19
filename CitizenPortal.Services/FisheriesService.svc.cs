using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.Web.Script.Serialization;
using static CitizenPortal.Services.AddressService;

namespace CitizenPortal.Services
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "FisheriesService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select FisheriesService.svc or FisheriesService.svc.cs at the Solution Explorer and start debugging.
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Required)]
    [ServiceBehavior(
         InstanceContextMode = InstanceContextMode.PerSession,
         ConcurrencyMode = ConcurrencyMode.Multiple)]
    [GlobalErrorBehaviorAttribute(typeof(GlobalErrorHandler))]
    public class FisheriesService : IFisheriesService
    {
        public void DoWork()
        {
        }

        private string GetCulture(List<Tuple<string, string>> SessionTuple)
        {
            string culture = GetTupleValue(SessionTuple, "CurrentCulture");

            string intCulture = "1";

            if (culture == "hi-IN") intCulture = "2";

            return intCulture;
        }

        private string GetTupleValue(List<Tuple<string, string>> SessionTuple, string Key)
        {
            string result = "";
            for (int i = 0; i < SessionTuple.Count; i++)
            {
                if (SessionTuple[i].Item1.ToUpper() == Key.ToUpper())
                {
                    result = SessionTuple[i].Item2;
                    break;
                }
            }
            return result;
        }

        private string GetKioskID(List<Tuple<string, string>> SessionTuple)
        {
            string UserType = GetTupleValue(SessionTuple, "UserType");

            string ID = "";

            //if(UserType.ToUpper() == "KIOSK")
            //    ID = GetTupleValue(SessionTuple, "KioskID");
            //else if (UserType.ToUpper() == "CITIZEN")
            //    ID = GetTupleValue(SessionTuple, "CitizenID");
            //else
            //    ID = GetTupleValue(SessionTuple, "G2GID");

            ID = GetTupleValue(SessionTuple, "ID");

            return ID;
        }

        public string InsertCRAFT(CRAFT_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
        "aadhaarNumber",
        "Boat_Condition",
        "BPL_APL_Category",
        "BPLNo",
        "BPLYear",
        "BoatRegistrationNo",
        "BoatRegistrationDate",
        "BoatOal",
        "BoatDepth",
        "BoatWidth",
        "PoliceStation",
        "BankFinance",
        "BankName1",
        "BankAddress1",
        "BankName2",
        "BankAddress2",
        "Category",
        "EngineType1",
        "EngineType2",
        "Other_Engine_Name",
        "EngineHP",
        "Other_Engine_HP",
        "Annual_Income",
        "Date_Of_Manufacture",
        "Engine_Purchase",
        "Purchase_Type",
        "Purchase_Type_Other",
        "EngineNumber",
        "EngineMake",
        "EngineCapacity",
        "FinanceYear",
        "FinanceBank",
        "CreatedOn",
        "CreatedBy",
        "IsActive",
        "ClientIP",
        "department",
        "district",
        "block",
        "panchayat",
        "office",
        "officer"
    };

            string AppID = "";
            System.Data.DataTable result = null;
            CRAFTBLL t_CRAFTBLL = new CRAFTBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_CRAFTBLL.InsertCRAFT(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your NFBS Application is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertFisheriesRegistration(FisheriesRegistration_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
        "aadhaarNumber",
        "VesselName",
        "VesselRegNo",
        "VesselWhere",
        "VesselWhen",
        "VesselBoatType",
        "VesselMaterials",
        "VesselSheathing",
        "BoatLength",
        "BoatBreadth",
        "EngineVHP",
        "EngineNo",
        "TradeMark",
        "VesselType",
        "VesselGearType",
        "VesselBoatPlace",
        "VesselBoatName",
        "VesselBaseYear",
        "VesselConsYear",
        "NofCrews",
        "CrewsDesignation",

        "CreatedOn",
        "CreatedBy",
        "IsActive",
        "ClientIP",
        "department",
        "district",
        "block",
        "panchayat",
        "office",
        "officer"
    };

            string AppID = "";
            System.Data.DataTable result = null;
            FisheriesRegistrationBLL t_FisheriesRegistrationBLL = new FisheriesRegistrationBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_FisheriesRegistrationBLL.InsertFisheriesRegistration(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your NFBS Application is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertFisheries(Fisheries_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");
            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
         "aadhaarNumber"
        , "ServiceID"
        ,"ReqdService"
        ,"TankDetal"
        , "TankDetail"
        , "TankLength"
        , "TankBreadth"
        , "TankArea"
        , "LeaseCategory"
        , "LeasePeriod"
        , "LeaseValue"
        , "LessorDetail"
        , "Category"
        , "AnnualIncome"
        , "DistrictName"
        , "BlockName"
        , "GramPanchayatName"
        , "Village"
        , "KhataNo"
        , "PlotNo"
        , "PresentTankStatus"
        , "IsCultureTank"
        , "PresentfishQuantal"
        , "PresentfishValue"
        , "BankName"
        , "BranchName"
        , "EducationalQualification"
        , "DateOfBirth"
        , "Days"
        , "Month"
        , "Year"
        , "SpeciesCultured"
        , "Statecode"
        , "NameOfBoard"
        , "NameOfHigherSecondary"
        , "NameOfUniversity"
        , "PassingYear"
        , "Grade"
        , "TotalMarks"
        , "MarkSecured"
        , "Percentage"
        , "Section1_AvailedAnytraining"
        , "Section1A_NoOfTraining"
        , "Section1B_Week"
        , "Section1B_Month"
        , "Section1B_Year"
        , "Section1C_training_Name"
        , "Section1C_Other_training"
        , "Section2_PFCSMember"
        , "Section2A_PFCSName"
        , "Section2B_PFCSAddress"
        , "Section2C_PFCSMemberNo"
        , "Section3_InfrastructureatFarmSide"
        , "Section3A_Road"
        , "Section3B_Electricity"
        , "Section3C_Canal"
        , "Section4_PreviouslLoan"
        , "Section4A_BankName"
        , "Section4B_PurposeOfLoan"
        , "Section4C_AmountOfLoan"
        , "Section4D_OutstandingLoan"
        , "FinanceMode"
        , "WitnessName1"
        , "WitnessAddressLine1"
        , "WitnessName2"
        , "WitnessAddressLine2"
        ,"CreatedBy"
        ,"CreatedOn"
        ,"ClientIP"
        ,"IsActive"
        ,"department"
        ,"district"
        ,"block"
        ,"panchayat"
        ,"office"
        ,"officer"
    };

            System.Data.DataTable result = null;
            string AppID = "";
            FisheriesBLL t_FisheriesBLL = new FisheriesBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_FisheriesBLL.InsertFisheries(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your NFBS Application is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertCharaterCertificate(CTTNSCharacter Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");
            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                 "DistrictName"
                ,"TalukaName"

                ,"ApplicantType"
                ,"ApplicantName"
                ,"RelationWithBeneficiary"
                ,"IdentificationType"
                ,"IdentificationNumber"
                ,"FirstName"
                ,"MotherName"
                ,"FatherName"
                ,"DOB"
                ,"Age"
                ,"Gender"
                ,"nationality"
                ,"MobileNo"
                ,"phoneno"
                ,"EmailID"
                ,"AddressLine1"
                ,"AddressLine2"
                ,"RoadStreetName"
                ,"LandMark"
                ,"Locality"
                ,"State"
                ,"District"
                ,"BlockTaluka"
                ,"PanchayatVillageCity"
                ,"Pincode"
                ,"StayYear"
                ,"StayMonth"
                ,"PAddressLine1"
                ,"PAddressLine2"
                ,"PRoadStreetName"
                ,"PLandMark"
                ,"PLocality"
                ,"PState"
                ,"PDistrict"
                ,"PBlockTaluka"
                ,"PPanchayatVillageCity"
                ,"PPincode"
                ,"PStayYear"
                ,"PStayMonth"
                ,"Qualification"
                ,"Occupation"
                ,"IdentificationMark"
                ,"Heigt"
                ,"Weight"
                ,"ActiveInPolitics"
                ,"LocalPoliceStationDisct"
                ,"LocalPoliceStation"
                ,"IsCorrectInfo"
                ,"Place"
                ,"Date"

                , "IsCriminalRecord"
                , "CriminalRecordDetail"
                , "PerposeOfApply"
                , "ModeOfReceiving"
                , "ServiceID"
                , "ApplicantUID"

                , "DesignatedOfficer"
                , "AppellateAuthority"
                , "RevisionalAuthority"
                , "TimeLimit"

                ,"CreatedBy"
                ,"Createdon"
                ,"IsActive"
                ,"AppID"
                ,"IsVarified"

                , "CompanyName"
                , "CompanyAddrs"
                , "CompanyPhone"
                , "Desig"
                , "JoingDate"
                    };

            System.Data.DataTable result = null;
            string AppID = "";
            CharacterCertificateBAL _CharacterCertificateBAL = new CharacterCertificateBAL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.Createdon = "";

            result = _CharacterCertificateBAL.InsertData(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }
    }
}