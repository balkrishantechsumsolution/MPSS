using CitizenPortalLib;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using CitizenPortalLib.SMSServiceReference;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.Text;
using System.Web.Script.Serialization;
using System.Xml;

namespace CitizenPortal.Services
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "AddressService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select AddressService.svc or AddressService.svc.cs at the Solution Explorer and start debugging.
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Required)]
    [ServiceBehavior(
    InstanceContextMode = InstanceContextMode.PerSession,
    ConcurrencyMode = ConcurrencyMode.Multiple)]
    [GlobalErrorBehaviorAttribute(typeof(GlobalErrorHandler))]
    public class AddressService : IAddressService
    {

        public void DoWork()
        {
        }

        //public string GetDistrict(string prefix, string StateCode)
        //{
        //    string text = await GetDistrict2(prefix, StateCode);
        //}

        public List<string> GetServiceName(string prefix, string SvcName)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL(culture);
            DataTable dt = t_KioskRegistrationBLL.GetServiceName(SvcName);
            List<string> serviceList = new List<string>();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                serviceList.Add(string.Format("{0}", dt.Rows[i]["SvcName"].ToString()));

            }

            return serviceList;
        }

        public string GetDistrict(string prefix, string StateCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL(culture);
            System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetDistrictFromState(StateCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["DistrictCode"],
                        Name = sdr["DistrictName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));

        }

        public string GetBlock(string prefix, string DistrictCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL(culture);
            System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetBlock(DistrictCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["BlockCode"],
                        Name = sdr["BlockName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetSubDistrict(string prefix, string DistrictCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL(culture);
            System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetSubDistrict(DistrictCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["SubDistrictCode"],
                        Name = sdr["SubDistrictName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetPanchayat(string prefix, string SubDistrictCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL(culture);
            System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetPanchayatFromSubDistrict(SubDistrictCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["PanchayatCode"],
                        Name = sdr["PanchayatName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetVillage(string prefix, string SubDistrictCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL(culture);
            System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetVillageFromSubDistrict(SubDistrictCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["VillageCode"],
                        Name = sdr["VillageName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        string GetCulture(List<Tuple<string, string>> SessionTuple)
        {
            string culture = GetTupleValue(SessionTuple, "CurrentCulture");

            string intCulture = "1";

            if (culture == "hi-IN") intCulture = "2";

            return intCulture;
        }

        string GetTupleValue(List<Tuple<string, string>> SessionTuple, string Key)
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

        string GetKioskID(List<Tuple<string, string>> SessionTuple)
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

        public string GetState(string prefix)
        {
            //string dbName = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("SQLServer", "DB");
            //List<string> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<string>>("SQLServer", "DB");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL(culture);
            System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetState();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["StateCode"],
                        Name = sdr["StateName"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }


        public string InsertBanishree(Banishree_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");
            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                         "aadhaarNumber"
                        ,"serviceid"
                        ,"ScolarshipType"
                        ,"Name"
                        ,"DOB"
                        ,"Gender"
                        ,"DisabilityCategory"
                        ,"FHusbandName"
                        ,"Religion"
                        ,"RelationWithGadian"
                        ,"PGadianIncome"
                        ,"Category"
                        ,"AreYouCitizenOfIndia"
                        ,"MobileNumber"
                        ,"EmailId"
                        ,"PerAddressLine1"
                        ,"PerAddressLine2"
                        ,"PreRoadStreetName"
                        ,"PreLandMark"
                        ,"PreGP"
                        ,"PoliceStation"
                        ,"PreLocality"
                        ,"PreState"
                        ,"PreDistrict"
                        ,"PreTaluka"
                        ,"PreVillage"
                        ,"PrePinCode"
                        ,"ClassOfScholaship"
                        ,"YearOfClass"
                        ,"DateOfAdmission"
                        ,"RecieveScholarship"
                        ,"InWhichClassRecieve"
                        ,"YearOfscholarship"
                        ,"MonthOfscholarship"
                        ,"DayOfscholarship"
                        ,"IsVisibilityChallanged"
                        ,"IngagedAReader"
                        ,"OrthopedicallyHandicaped"
                        ,"CreatedBy"
                        ,"CreatedOn"
                        //,"ClientIP"
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
            BanishreeBLL t_BanishreeBLL = new BanishreeBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_BanishreeBLL.InsertBanishree(Data, AFields);

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


        public string InsertData(KioskRegistrationV2_DT Data)
        {
            string[] AFields = {
                "FirstName"
                , "LastName"
                , "UIDNo"
                , "PANNo"
                , "VoterID"
                , "MobileNo"
                , "EmailID"
                , "Title"
                , "Guardian"
                , "FatherName"
                , "MotherName"
                , "IsDivine"
                , "DivinePart"
                , "Gender"
                , "AddressLine1"
                , "AddressLine2"
                , "RoadStreetName"
                , "LandMark"
                , "Locality"
                , "LoginID"
                , "Password"
                , "ImagePath"
                , "DOB"
                , "FamilyIncome"
                , "State"
                , "District"
                , "Taluka"
                , "Village"
                , "PinCode"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
            };

            System.Data.DataTable result = null;
            string KioskID = "";
            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL();

            Data.CreatedBy = "System";
            Data.CreatedOn = DateTime.Now;

            result = t_KioskRegistrationBLL.InsertV2(Data, AFields);

            if (result.Rows.Count > 0)
            {
                KioskID = result.Rows[0]["KioskID"].ToString();
            }

            return KioskID;
        }

        public string InsertSeniorCitizen(SeniorCitizen_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "FirstName"
                , "LastName"
                , "MobileNo"
                , "EmailID"
                , "Gender"
                , "AddressLine1"
                , "AddressLine2"
                , "RoadStreetName"
                , "LandMark"
                , "Locality"
                , "ImagePath"
                , "DOB"
                , "Age"
                , "State"
                , "District"
                , "Taluka"
                , "Village"
                , "PinCode"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            SeniorCitizenBLL t_SeniorCitizenBLL = new SeniorCitizenBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_SeniorCitizenBLL.Insert(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        //public string InsertBirthCertificate(BirthCertificate_DT Data)
        //{
        //    //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
        //    List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

        //    string culture = GetCulture(objSessionTuple);
        //    string KioskID = GetKioskID(objSessionTuple);

        //    string[] AFields = {

        //         "aadhaarNumber"
        //        , "ProfileID"
        //        , "ChildName"
        //        , "DOB"
        //        , "Gender"
        //        , "FatherName"
        //        , "MotherName"
        //        , "ApplicantName"
        //        , "ApplicantRelation"
        //        , "HospitalName"
        //        , "BirthPlace"
        //        , "AddrCareOf"
        //        , "AddrCareOf_LL"
        //        , "AddrBuilding"
        //        , "AddrBuilding_LL"
        //        , "AddrStreet"
        //        , "AddrStreet_LL"
        //        , "AddrLandmark"
        //        , "AddrLandmark_LL"
        //        , "AddrLocality"
        //        , "AddrLocality_LL"
        //        , "VillageCode"
        //        , "PanchayatCode"
        //        , "TalukaCode"
        //        , "DistrictCode"
        //        , "District"
        //        , "StateCode"
        //        , "PinCode"
        //        , "CreatedBy"
        //        , "CreatedOn"
        //        , "ClientIP"

        //    };

        //    System.Data.DataTable result = null;
        //    string AppID = "";
        //    BirthCertificateBLL t_BirthCertificateBLL = new BirthCertificateBLL();
        //    ServiceResult t_ServiceResult = new ServiceResult();

        //    t_ServiceResult.AppID = "";
        //    t_ServiceResult.Status = "Error";
        //    t_ServiceResult.intStatus = 0;

        //    Data.CreatedBy = KioskID;
        //    //Data.CreatedOn = DateTime.Now;

        //    result = t_BirthCertificateBLL.Insert(Data, AFields);

        //    if (result.Rows.Count > 0)
        //    {
        //        AppID = result.Rows[0]["AppID"].ToString();
        //        t_ServiceResult.AppID = AppID;
        //        t_ServiceResult.Status = "Success";
        //        t_ServiceResult.intStatus = 1;

        //        //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Birth Certificate Application is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");

        //    }

        //    return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        //}

        public string InsertFIRRegistration(FIRRegistration_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "aadhaarNumber"
                , "ProfileID"
                , "CategoryId"
                , "Category"
                , "IncidentDate"
                , "IncidentPlace"
                , "Description"
                , "Particulars"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
                , "department"
                , "district"
                , "block"
                , "panchayat"
                , "office"
                , "officer"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            FIRRegistrationBLL t_FIRRegistrationBLL = new FIRRegistrationBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_FIRRegistrationBLL.InsertFIRRegistration(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your FIR has been registered successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertComplaintRegistration(ComplaintRegistration_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "aadhaarNumber"
                , "ProfileID"
                , "ServicesID"
                , "Services"
                , "DepartmentID"
                , "ComplaintDept"
                , "ReferenceID"
                , "ApplicationDate"
                , "ComplaintID"
                , "ComplaintType"
                , "OfficerName"
                , "ComplaintDescription"
                , "ConcernedOfficer"
                , "ConcernedOffice"
                , "department"
                , "district"
                , "block"
                , "panchayat"
                , "office"
                , "officer"

            };

            System.Data.DataTable result = null;
            string AppID = "";
            ComplaintRegistrationBLL t_ComplaintRegistrationBLL = new ComplaintRegistrationBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_ComplaintRegistrationBLL.InsertComplaintRegistration(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Complaint has been registered successfully. Your Reference ID is " + AppID + ". Thank You, From Odisha Lokaseba Adhikara -CAP, Odisha Govt.");

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertServiceFeedBack(ServiceFeedBack_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            //ist<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            //string culture = GetCulture(objSessionTuple);
            //string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                  "aadhaarNumber"
                 ,"AppName"
                 ,"AppID"
                 , "FullName"
                 , "MobileNo"
                 ,"verifyOTP"
                 , "EmailID"
                 , "FServices"
                 , "Fdepartment"
                 ,"ApplicationID"
                 ,"TypeOfIssue"
                  ,"OtherIssue"
                 , "FeedBackDetail"
                 , "CreatedBy"
                 , "CreatedOn"
                 , "department"
                 , "district"
                 , "block"
                 , "panchayat"
                 , "office"
                 , "officer"




        };

            System.Data.DataTable result = null;
            string AppID = "";
            ServiceFeedBackBLL t_ServiceFeedBackBLL = new ServiceFeedBackBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            //ata.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_ServiceFeedBackBLL.InsertServiceFeedBack(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Complaint has been registered successfully. Your Reference ID is " + AppID + ". Thank You, From Odisha Lokaseba Adhikara -CAP, Odisha Govt.");

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }
        public string InsertRatingFeedBack(RatingFeedBack_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            //ist<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            //string culture = GetCulture(objSessionTuple);
            //string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                  "aadhaarNumber"
                 ,"AppName"
                 ,"AppID"
                 , "Rating"
                 , "MobileNo"
                 , "EmailID"
                 , "FeedBackDetail"
                 , "CreatedBy"
                 , "CreatedOn"
                 , "department"
                 , "district"
                 , "block"
                 , "panchayat"
                 , "office"
                 , "officer"




        };

            System.Data.DataTable result = null;
            string AppID = "";
            RatingFeedBackBLL t_RatingFeedBackBLL = new RatingFeedBackBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            //ata.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_RatingFeedBackBLL.InsertRatingFeedBack(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Complaint has been registered successfully. Your Reference ID is " + AppID + ". Thank You, From Odisha Lokaseba Adhikara -CAP, Odisha Govt.");

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }



        public string InsertDeathCertificate(DeathCertificate_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "aadhaarNumber"
                , "ProfileID"
                , "DeceasedName"
                , "FatherHusbandName"
                , "Gender"
                , "DateofDeath"
                , "TimeofDeath"
                , "DateofBirth"
                , "ApplicantName"
                , "DeceasedRelation"
                , "HospitalName"
                , "DeceAddressLine1"
                , "DeceAddressLine2"
                , "DeceRoadStreetName"
                , "DeceLandMark"
                , "DeceLocality"
                , "DeceState"
                , "DeceDistrict"
                , "DeceTaluka"
                , "DeceVillage"
                , "DecePinCode"
                , "HospAddressLine1"
                , "HospAddressLine2"
                , "HospRoadStreetName"
                , "HospLandMark"
                , "HospLocality"
                , "HospState"
                , "HospDistrict"
                , "HospTaluka"
                , "HospVillage"
                , "HospPinCode"
                , "CreatedOn"
                , "CreatedBy"
                , "ClientIP"

            };

            System.Data.DataTable result = null;
            string AppID = "";
            DeathCertificateBLL t_DeathCertificateBLL = new DeathCertificateBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_DeathCertificateBLL.Insert(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Death Certificate Application is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        /*
         * This Logic is rectified properly w.r.t Current Address Issue
         */
        private string GetCurrentAddressXML(BasicDetails_DT Data)
        {

            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "CurrentAddress";

            //, , , , , , , , ;
            //public string subDistrict, subDistrictLocal, district, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal

            dtCurrentTable.Columns.Add(new DataColumn("phouseNumber", typeof(string)));
            //dtCurrentTable.Columns.Add(new DataColumn("pcareOf", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ppostOffice", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plocality", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plandmark", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstreet", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pvillage", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("psubDistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pdistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstate", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pincode", typeof(string)));

            drCurrentRow = dtCurrentTable.NewRow();

            drCurrentRow["phouseNumber"] = Data.phouseNumber == null ? "" : Data.phouseNumber.Trim();
            //drCurrentRow["pcareOf"] = Data.pcareOf == null ? "" : Data.pcareOf.Trim();
            drCurrentRow["ppostOffice"] = Data.ppostOffice == null ? "" : Data.ppostOffice.Trim();//OK
            drCurrentRow["plocality"] = Data.plocality == null ? "" : Data.plocality.Trim();
            drCurrentRow["plandmark"] = Data.plandmark == null ? "" : Data.plandmark.Trim();
            drCurrentRow["pstreet"] = Data.pstreet == null ? "" : Data.pstreet.Trim();
            drCurrentRow["pvillage"] = Data.pvillage == null ? "" : Data.pvillage.Trim();
            drCurrentRow["psubDistrict"] = Data.psubDistrict == null ? "" : Data.psubDistrict.Trim();
            drCurrentRow["pdistrict"] = Data.pdistrict == null ? "" : Data.pdistrict.Trim();
            drCurrentRow["pstate"] = Data.pstate == null ? "" : Data.pstate.Trim();
            drCurrentRow["pincode"] = Data.ppincode == null ? "" : Data.ppincode.Trim();

            dtCurrentTable.Rows.Add(drCurrentRow);

            System.Data.DataTable dtprogXML = dtCurrentTable;

            string CurrentAddressXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "CurrentAddressXML";
            dtprogXML.WriteXml(swriter);
            CurrentAddressXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return CurrentAddressXML;
        }

        /*
         * This Logic is rectified properly w.r.t Current Address Issue
         */
        private string GetCurrentAddressXML(CitizenBasicDetails_DT Data)
        {

            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "CurrentAddress";

            //, , , , , , , , ;
            //public string subDistrict, subDistrictLocal, district, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal

            dtCurrentTable.Columns.Add(new DataColumn("phouseNumber", typeof(string)));
            //dtCurrentTable.Columns.Add(new DataColumn("pcareOf", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ppostOffice", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plocality", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plandmark", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstreet", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pvillage", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("psubDistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pdistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstate", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pincode", typeof(string)));

            drCurrentRow = dtCurrentTable.NewRow();

            drCurrentRow["phouseNumber"] = Data.phouseNumber == null ? "" : Data.phouseNumber.Trim();
            //drCurrentRow["pcareOf"] = Data.pcareOf == null ? "" : Data.pcareOf.Trim();
            drCurrentRow["ppostOffice"] = Data.ppostOffice == null ? "" : Data.ppostOffice.Trim();//OK
            drCurrentRow["plocality"] = Data.plocality == null ? "" : Data.plocality.Trim();
            drCurrentRow["plandmark"] = Data.plandmark == null ? "" : Data.plandmark.Trim();
            drCurrentRow["pstreet"] = Data.pstreet == null ? "" : Data.pstreet.Trim();
            drCurrentRow["pvillage"] = Data.pvillage == null ? "" : Data.pvillage.Trim();
            drCurrentRow["psubDistrict"] = Data.psubDistrict == null ? "" : Data.psubDistrict.Trim();
            drCurrentRow["pdistrict"] = Data.pdistrict == null ? "" : Data.pdistrict.Trim();
            drCurrentRow["pstate"] = Data.pstate == null ? "" : Data.pstate.Trim();
            drCurrentRow["pincode"] = Data.ppincode == null ? "" : Data.ppincode.Trim();

            dtCurrentTable.Rows.Add(drCurrentRow);

            System.Data.DataTable dtprogXML = dtCurrentTable;

            string CurrentAddressXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "CurrentAddressXML";
            dtprogXML.WriteXml(swriter);
            CurrentAddressXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return CurrentAddressXML;
        }

        /*
         private string getinclusionSubchild_xml()
    {
        DataTable dtCurrentTable = new DataTable();
        DataRow drCurrentRow = null;
        dtCurrentTable.TableName = "AddSubInclusion";
        dtCurrentTable.Columns.Add(new DataColumn("Ingredient", typeof(string)));
        dtCurrentTable.Columns.Add(new DataColumn("Pharmacopoeial", typeof(string)));
        dtCurrentTable.Columns.Add(new DataColumn("otherPharmacopoeial", typeof(string)));
        dtCurrentTable.Columns.Add(new DataColumn("Strength", typeof(string)));
        dtCurrentTable.Columns.Add(new DataColumn("StrengthUnit", typeof(string)));

        #region Code by Niraj

        Int32 intCount = default(Int32);
        Int32 StartIndex = default(Int32);
        Int32 EndIndex = default(Int32);
        Int32 Remstrlen = default(Int32);
        string strSave = null;
        string strTempString = null;
        string SrNo = null;
        string RemStr = null;
        string strIngredient = "", strMonograph = "", strMonographID = "", strOtherMono = "", strStrength = "", strUnit = "";

        if (hdfProduct.Value.Length > 0)
        {
            strSave = hdfProduct.Value;
            strTempString = hdfProduct.Value;

            while (strTempString.Length > 0)
            {
                drCurrentRow = dtCurrentTable.NewRow();

                intCount = intCount + 1;
                StartIndex = strTempString.IndexOf("#");

                strTempString = strTempString.Substring(StartIndex + 1, strTempString.Length - 1);
                EndIndex = strTempString.IndexOf("#");
                RemStr = strTempString.Substring(0, EndIndex);

                StartIndex = RemStr.IndexOf(",");
                SrNo = RemStr.Substring(0, StartIndex);
                Remstrlen = RemStr.Length - StartIndex;
                RemStr = RemStr.Substring(StartIndex + 1, Remstrlen - 1);
                SrNo = intCount.ToString();

                StartIndex = RemStr.IndexOf(",");
                strIngredient = RemStr.Substring(0, StartIndex);
                drCurrentRow["Ingredient"] = SQLInjection(strIngredient.Trim());
                Remstrlen = RemStr.Length - StartIndex;
                RemStr = RemStr.Substring(StartIndex + 1, Remstrlen - 1);

                StartIndex = RemStr.IndexOf(",");
                strMonograph = RemStr.Substring(0, StartIndex);
                drCurrentRow["Pharmacopoeial"] = strMonograph.Trim();
                Remstrlen = RemStr.Length - StartIndex;
                RemStr = RemStr.Substring(StartIndex + 1, Remstrlen - 1);

                StartIndex = RemStr.IndexOf(",");
                strMonographID = RemStr.Substring(0, StartIndex);

                Remstrlen = RemStr.Length - StartIndex;
                RemStr = RemStr.Substring(StartIndex + 1, Remstrlen - 1);

                StartIndex = RemStr.IndexOf(",");
                strOtherMono = RemStr.Substring(0, StartIndex);
                drCurrentRow["otherPharmacopoeial"] = strOtherMono.Trim();
                Remstrlen = RemStr.Length - StartIndex;
                RemStr = RemStr.Substring(StartIndex + 1, Remstrlen - 1);

                StartIndex = RemStr.IndexOf(",");
                strStrength = RemStr.Substring(0, StartIndex);
                drCurrentRow["Strength"] = strStrength.Trim();
                Remstrlen = RemStr.Length - StartIndex;
                RemStr = RemStr.Substring(StartIndex + 1, Remstrlen - 1);

                strUnit = RemStr;
                drCurrentRow["StrengthUnit"] = strUnit.Trim();

                dtCurrentTable.Rows.Add(drCurrentRow);

                strTempString = strTempString.Substring(EndIndex + 1, strTempString.Length - (EndIndex + 1));

            }
        }

        #endregion Code by Niraj

        System.Data.DataTable dtprogXML = dtCurrentTable;

        string GETINCLUSIONSUBCHILDXML = null;
        StringWriter swriter = new StringWriter();
        dtprogXML.TableName = "GETINCLUSIONSUBCHILDXML";
        dtprogXML.WriteXml(swriter);
        GETINCLUSIONSUBCHILDXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

        return GETINCLUSIONSUBCHILDXML;

    }
    */

        public string InsertBasicDetails(BasicDetails_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "aadhaarNumber"
                , "action"
                , "careOf"
                , "careOfLocal"
                , "dateOfBirth"
                , "district"
                , "districtLocal"
                , "emailId"
                , "gender"
                , "houseNumber"
                , "houseNumberLocal"
                , "landmark"
                , "landmarkLocal"
                , "language"
                , "locality"
                , "localityLocal"
                , "phone"
                , "pincode"
                , "pincodeLocal"
                , "postOffice"
                , "postOfficeLocal"
                , "residentName"
                , "residentNameLocal"
                , "responseCode"
                , "state"
                , "stateLocal"
                , "street"
                , "streetLocal"
                , "subDistrict"
                , "subDistrictLocal"
                , "timestamp"
                , "ttl"
                , "vtc"
                , "vtcLocal"
                , "JSONData"
                , "IsActive"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
                , "Image"
                , "Mobile"
                , "CurrentAddressXML"
            };

            System.Data.DataTable result = null;
            string UID = "";
            BasicDetailsBLL t_BasicDetailsBLL = new BasicDetailsBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            string CurrentAddressXML = GetCurrentAddressXML(Data);

            Data.CurrentAddressXML = CurrentAddressXML;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);

            result = t_BasicDetailsBLL.Insert(Data, AFields);
            if (result.Rows.Count > 0)
            {
                UID = result.Rows[0]["aadhaarNumber"].ToString();
                t_ServiceResult.AppID = UID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(Data.Mobile, "Your eKYC through Aadhaar is done successfully. From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertCitizenBasicDetails(CitizenBasicDetails_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "aadhaarNumber"
                , "action"
                , "careOf"
                , "careOfLocal"
                , "dateOfBirth"
                , "district"
                , "districtLocal"
                , "emailId"
                , "gender"
                , "houseNumber"
                , "houseNumberLocal"
                , "landmark"
                , "landmarkLocal"
                , "language"
                , "locality"
                , "localityLocal"
                , "phone"
                , "pincode"
                , "pincodeLocal"
                , "postOffice"
                , "postOfficeLocal"
                , "residentName"
                , "residentNameLocal"
                , "responseCode"
                , "state"
                , "stateLocal"
                , "street"
                , "streetLocal"
                , "subDistrict"
                , "subDistrictLocal"
                , "timestamp"
                , "ttl"
                , "vtc"
                , "vtcLocal"
                , "JSONData"
                , "IsActive"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
                , "Image"
                , "Mobile"
                , "CurrentAddressXML"
                , "LoginId"
            };

            System.Data.DataTable result = null;
            string UID = "";
            CitizenBasicDetailsBLL t_CitizenBasicDetailsBLL = new CitizenBasicDetailsBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;


            string CurrentAddressXML = GetCurrentAddressXML(Data);

            Data.CurrentAddressXML = CurrentAddressXML;

            result = t_CitizenBasicDetailsBLL.InsertCitizenBasicDetails(Data, AFields);
            string Password = "";
            if (result.Rows.Count > 0)
            {
                UID = result.Rows[0]["LoginId"].ToString();
                Password = result.Rows[0]["Password"].ToString();

                t_ServiceResult.AppID = UID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                SendSMS(Data.Mobile, "You've sucessfully register to Odisha Lokaseba Adhikara portal, The login detail is LOGIN ID : " +
                    UID + "   PASSWORD : " + Password + " -- From Odisha Lokaseba Adhikara, CAP, Odisha Govt.");

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertCitizenProfile(CitizenProfile_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "aadhaarNumber"
                , "action"
                , "careOf"
                , "careOfLocal"
                , "dateOfBirth"
                , "district"
                , "districtLocal"
                , "emailId"
                , "gender"
                , "houseNumber"
                , "houseNumberLocal"
                , "landmark"
                , "landmarkLocal"
                , "language"
                , "locality"
                , "localityLocal"
                , "phone"
                , "pincode"
                , "pincodeLocal"
                , "postOffice"
                , "postOfficeLocal"
                , "residentName"
                , "residentNameLocal"
                , "responseCode"
                , "state"
                , "stateLocal"
                , "street"
                , "streetLocal"
                , "subDistrict"
                , "subDistrictLocal"
                , "timestamp"
                , "ttl"
                , "vtc"
                , "vtcLocal"
                , "JSONData"
                , "IsActive"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
                , "Image"
                , "Mobile"
                , "CurrentAddressXML"
                , "CitizenProfileID"
                , "Village"
                , "Password"
                , "statecode"
                , "districtcode"
                , "subDistrictcode"
                , "Villagecode"
                , "SkipValidation"
            };
            string[] replaceThese = { "data:image/png;base64,", "data:image/jpeg;base64,", "data:image/jpg;base64," };
            string data = Data.Image;

            foreach (string curr in replaceThese)
            {
                data = data.Replace(curr, string.Empty);
            }

            byte[] toBytes = System.Convert.FromBase64String(data);
            System.Drawing.Image newImage = ByteArrayToImage(toBytes);

            System.Data.DataTable result = null;
            string UID = "";
            CitizenProfileBLL t_CitizenProfileBLL = new CitizenProfileBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            if (newImage != null)
            {
                t_ServiceResult.AppID = "";
                t_ServiceResult.Status = "Error";
                t_ServiceResult.intStatus = 0;

                Data.CreatedBy = KioskID;
                Data.CreatedOn = DateTime.Now;

                string CurrentAddressXML = GetCitizenAddressXML(Data);
                string t_Password = GenPassword();
                Data.Password = t_Password;
                Data.CurrentAddressXML = CurrentAddressXML;

                Data.JSONData = "";
                Data.JSONData = new JavaScriptSerializer().Serialize(Data);

                result = t_CitizenProfileBLL.InsertCitizenProfile(Data, AFields);
                string t_LoginID = "";
                if (result.Rows.Count > 0)
                {
                    t_LoginID = result.Rows[0]["Mobile"].ToString();
                    t_Password = result.Rows[0]["Password"].ToString();
                    UID = result.Rows[0]["aadhaarNumber"].ToString();
                    t_ServiceResult.AppID = UID;
                    t_ServiceResult.Status = result.Rows[0]["StatusMessage"].ToString();
                    t_ServiceResult.intStatus = Convert.ToInt32(result.Rows[0]["Status"].ToString());

                    //SendSMS(Data.Mobile, "Your profile created sucessfully, The login detail is LOGIN ID : "+ UID + " PASSWORD : "+t_Password+ " -- From Lokaseba Adhikara, CAP, Odisha Govt.");
                }
            }
            else
            {
                t_ServiceResult.AppID = "";
                t_ServiceResult.Status = "Invaild Image!";
                t_ServiceResult.intStatus = 4;
            }
            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }
        public static System.Drawing.Image ByteArrayToImage(byte[] bArray)
        {
            if (bArray == null)
                return null;

            System.Drawing.Image newImage;

            try
            {
                using (MemoryStream ms = new MemoryStream(bArray, 0, bArray.Length))
                {
                    ms.Write(bArray, 0, bArray.Length);
                    newImage = System.Drawing.Image.FromStream(ms, true);
                }
            }
            catch (Exception ex)
            {
                newImage = null;

                //Log an error here
            }

            return newImage;
        }
        public string InsertCreateProfile(CreateProfile_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "aadhaarNumber"
                , "action"
                , "careOf"
                , "careOfLocal"
                , "dateOfBirth"
                , "district"
                , "districtLocal"
                , "emailId"
                , "gender"
                , "houseNumber"
                , "houseNumberLocal"
                , "landmark"
                , "landmarkLocal"
                , "language"
                , "locality"
                , "localityLocal"
                , "phone"
                , "pincode"
                , "pincodeLocal"
                , "postOffice"
                , "postOfficeLocal"
                , "residentName"
                , "residentNameLocal"
                , "responseCode"
                , "state"
                , "stateLocal"
                , "street"
                , "streetLocal"
                , "subDistrict"
                , "subDistrictLocal"
                , "timestamp"
                , "ttl"
                , "vtc"
                , "vtcLocal"
                , "JSONData"
                , "IsActive"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
                , "Image"
                , "Mobile"
                , "CurrentAddressXML"
                , "CitizenProfileID"
                , "Village"
                , "Password"
                , "statecode"
                , "districtcode"
                , "subDistrictcode"
                , "Villagecode"
                , "LoginId"
                , "Religion"
                , "Category"
                , "MaterialStatus"

            };

            System.Data.DataTable result = null;
            string UID = "";
            CreateProfileBLL t_CreateProfileBLL = new CreateProfileBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            string CurrentAddressXML = GetProfileAddressXML(Data);
            string t_Password = GenPassword();
            Data.Password = t_Password;
            Data.CurrentAddressXML = CurrentAddressXML;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);

            result = t_CreateProfileBLL.InsertCreateProfile(Data, AFields);
            string t_LoginID = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["Mobile"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                UID = result.Rows[0]["ProfileId"].ToString();
                t_ServiceResult.AppID = UID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                SendSMS(Data.Mobile, "Your profile created sucessfully, The login detail is LOGIN ID : " + t_LoginID + " PASSWORD : " + t_Password + " -- From Odisha Lokaseba Adhikara, CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        private string GenPassword()
        {
            Random random = new Random();
            string t_Password = "";
            int i;
            for (i = 1; i < 9; i++)
            {
                t_Password += random.Next(0, 9).ToString();
            }

            return t_Password;
        }

        public string GetCitizenProfileData(string prefix, string Data)
        {
            System.Data.DataSet result = null;
            string UID = "";
            CitizenProfileBLL t_CitizenProfileBLL = new CitizenProfileBLL();
            ServiceResult t_ServiceResult = new ServiceResult();
            CitizenProfile_DT ProfileData = new CitizenProfile_DT();
            string text = "";

            result = t_CitizenProfileBLL.GetCitizenProfileData(Data);

            if (result != null)
            {
                DataTable dt = result.Tables[0];

                if (dt != null && dt.Rows.Count > 0)
                {
                    ProfileData.aadhaarNumber = "";
                    ProfileData.action = "";
                    ProfileData.residentName = dt.Rows[0]["residentName"].ToString(); //': $('#FirstName').val(),
                    ProfileData.residentNameLocal = dt.Rows[0]["residentNameLocal"].ToString(); //': $('#FirstName').val(),
                    ProfileData.careOf = dt.Rows[0]["careOf"].ToString(); //': $('#FatherName').val(),
                    ProfileData.careOfLocal = dt.Rows[0]["careOfLocal"].ToString(); //': $('#FatherName').val(),
                    ProfileData.dateOfBirth = dt.Rows[0]["dateOfBirth"].ToString(); //': DOBConverted,
                    ProfileData.gender = dt.Rows[0]["gender"].ToString(); //': $('#ddlGender').val(),
                    ProfileData.phone = dt.Rows[0]["phone"].ToString(); //': $('#phoneno').val(),
                    ProfileData.Mobile = dt.Rows[0]["Mobile"].ToString(); //': $('#MobileNo').val(),
                    ProfileData.emailId = dt.Rows[0]["emailId"].ToString(); //': $('#EmailID').val(),

                    ProfileData.houseNumber = dt.Rows[0]["houseNumber"].ToString(); //': $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").val(),
                    ProfileData.houseNumberLocal = dt.Rows[0]["houseNumberLocal"].ToString(); //': $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").val(),

                    ProfileData.landmark = dt.Rows[0]["landmark"].ToString(); //': $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").val(),
                    ProfileData.landmarkLocal = dt.Rows[0]["landmarkLocal"].ToString(); //': $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").val(),

                    ProfileData.locality = dt.Rows[0]["locality"].ToString(); //': $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").val(),
                    ProfileData.localityLocal = dt.Rows[0]["localityLocal"].ToString(); //': $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").val(),

                    ProfileData.street = dt.Rows[0]["street"].ToString(); //': $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val(),
                    ProfileData.streetLocal = dt.Rows[0]["streetLocal"].ToString(); //': $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val(),

                    ProfileData.postOffice = dt.Rows[0]["postOffice"].ToString(); //': $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").val(),
                    ProfileData.postOfficeLocal = dt.Rows[0]["postOfficeLocal"].ToString(); //': $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").val(),

                    ProfileData.responseCode = dt.Rows[0]["responseCode"].ToString(); //': '',
                    ProfileData.language = "1"; //': '1',

                    ProfileData.state = dt.Rows[0]["state"].ToString(); //': $('#ContentPlaceHolder1_Address1_ddlState').val(),
                    ProfileData.stateLocal = dt.Rows[0]["stateLocal"].ToString(); //': $('#ContentPlaceHolder1_Address1_ddlState').val(),
                    ProfileData.district = dt.Rows[0]["district"].ToString(); //': $('#ContentPlaceHolder1_Address1_ddlDistrict').val(),
                    ProfileData.districtLocal = dt.Rows[0]["districtLocal"].ToString(); //': $('#ContentPlaceHolder1_Address1_ddlDistrict').val(),
                    ProfileData.subDistrict = dt.Rows[0]["subDistrict"].ToString(); //': $('#ContentPlaceHolder1_Address1_ddlBlock').val(),
                    ProfileData.subDistrictLocal = dt.Rows[0]["subDistrictLocal"].ToString(); //': $('#ContentPlaceHolder1_Address1_ddlBlock').val(),
                    //ProfileData.Village = ""; //': $('#ContentPlaceHolder1_Address1_ddlPanchayat').val(),
                    ProfileData.pincode = dt.Rows[0]["pincode"].ToString(); //': $('#ContentPlaceHolder1_Address1_PinCode').val(),
                    ProfileData.pincodeLocal = dt.Rows[0]["pincodeLocal"].ToString(); //': $('#ContentPlaceHolder1_Address1_PinCode').val(),


                    text = dt.Rows[0]["JSONData"].ToString();
                }


                DataTable dt1 = result.Tables[1];

                {
                    //ProfileData./'Image': obj["photo"],
                    //ProfileData.Image': $('#ContentPlaceHolder1_HFb64').val(),
                    ProfileData.phouseNumber = dt1.Rows[0]["phouseNumber"].ToString(); //': $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val(),
                    ProfileData.plandmark = dt1.Rows[0]["plandmark"].ToString(); //': $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val(),
                    ProfileData.plocality = dt1.Rows[0]["plocality"].ToString(); //': $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val(),
                    ////ProfileData.pstreet = dt1.Rows[0]["pstreet"].ToString(); //': $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val(),
                    ProfileData.ppincode = dt1.Rows[0]["ppincode"].ToString(); //': $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val(),
                    ////ProfileData.ppostOffice = dt1.Rows[0]["ppostOffice"].ToString(); //': $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val(),

                    ProfileData.pstate = dt1.Rows[0]["pstate"].ToString(); //': $('#ContentPlaceHolder1_Address2_ddlState').val(),
                    ProfileData.pdistrict = dt1.Rows[0]["pdistrict"].ToString(); //': $('#ContentPlaceHolder1_Address2_ddlDistrict').val(),
                    ProfileData.psubDistrict = dt1.Rows[0]["psubDistrict"].ToString(); //': $('#ContentPlaceHolder1_Address2_ddlTaluka').val(),
                    ProfileData.pvillage = dt1.Rows[0]["pvillage"].ToString(); //': $('#ContentPlaceHolder1_Address2_ddlVillage').val(),

                    //ProfileData.JSONData':'',

                }
            }

            //return (new JavaScriptSerializer().Serialize(ProfileData));
            return text;
        }


        /*
         * This Logic is rectified properly w.r.t Current Address Issue         
         */
        private string GetCitizenAddressXML(CitizenProfile_DT Data)
        {

            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "CurrentAddress";

            //, , , , , , , , ;
            //public string subDistrict, subDistrictLocal, district, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal

            dtCurrentTable.Columns.Add(new DataColumn("phouseNumber", typeof(string)));
            //dtCurrentTable.Columns.Add(new DataColumn("pcareOf", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ppostOffice", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plocality", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plandmark", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstreet", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pvillage", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("psubDistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pdistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstate", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pincode", typeof(string)));

            drCurrentRow = dtCurrentTable.NewRow();

            drCurrentRow["phouseNumber"] = Data.phouseNumber == null ? "" : Data.phouseNumber.Trim();
            //drCurrentRow["pcareOf"] = Data.pcareOf == null ? "" : Data.pcareOf.Trim();
            drCurrentRow["ppostOffice"] = Data.ppostOffice == null ? "" : Data.ppostOffice.Trim();//OK
            drCurrentRow["plocality"] = Data.plocality == null ? "" : Data.plocality.Trim();
            drCurrentRow["plandmark"] = Data.plandmark == null ? "" : Data.plandmark.Trim();
            drCurrentRow["pstreet"] = Data.pstreet == null ? "" : Data.pstreet.Trim();
            drCurrentRow["pvillage"] = Data.pvillage == null ? "" : Data.pvillage.Trim();
            drCurrentRow["psubDistrict"] = Data.psubDistrict == null ? "" : Data.psubDistrict.Trim();
            drCurrentRow["pdistrict"] = Data.pdistrict == null ? "" : Data.pdistrict.Trim();
            drCurrentRow["pstate"] = Data.pstate == null ? "" : Data.pstate.Trim();
            drCurrentRow["pincode"] = Data.ppincode == null ? "" : Data.ppincode.Trim();

            dtCurrentTable.Rows.Add(drCurrentRow);

            System.Data.DataTable dtprogXML = dtCurrentTable;

            string CurrentAddressXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "CurrentAddressXML";
            dtprogXML.WriteXml(swriter);
            CurrentAddressXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return CurrentAddressXML;
        }

        /*
         * This Logic is rectified properly w.r.t Current Address Issue
         */
        private string GetProfileAddressXML(CreateProfile_DT Data)
        {

            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "CurrentAddress";

            //, , , , , , , , ;
            //public string subDistrict, subDistrictLocal, district, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal

            dtCurrentTable.Columns.Add(new DataColumn("phouseNumber", typeof(string)));
            //dtCurrentTable.Columns.Add(new DataColumn("pcareOf", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ppostOffice", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plocality", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plandmark", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstreet", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pvillage", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("psubDistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pdistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstate", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pincode", typeof(string)));

            drCurrentRow = dtCurrentTable.NewRow();

            drCurrentRow["phouseNumber"] = Data.phouseNumber == null ? "" : Data.phouseNumber.Trim();
            //drCurrentRow["pcareOf"] = Data.pcareOf == null ? "" : Data.pcareOf.Trim();
            drCurrentRow["ppostOffice"] = Data.ppostOffice == null ? "" : Data.ppostOffice.Trim();//OK
            drCurrentRow["plocality"] = Data.plocality == null ? "" : Data.plocality.Trim();
            drCurrentRow["plandmark"] = Data.plandmark == null ? "" : Data.plandmark.Trim();
            drCurrentRow["pstreet"] = Data.pstreet == null ? "" : Data.pstreet.Trim();
            drCurrentRow["pvillage"] = Data.pvillage == null ? "" : Data.pvillage.Trim();
            drCurrentRow["psubDistrict"] = Data.psubDistrict == null ? "" : Data.psubDistrict.Trim();
            drCurrentRow["pdistrict"] = Data.pdistrict == null ? "" : Data.pdistrict.Trim();
            drCurrentRow["pstate"] = Data.pstate == null ? "" : Data.pstate.Trim();
            drCurrentRow["pincode"] = Data.ppincode == null ? "" : Data.ppincode.Trim();

            dtCurrentTable.Rows.Add(drCurrentRow);

            System.Data.DataTable dtprogXML = dtCurrentTable;

            string CurrentAddressXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "CurrentAddressXML";
            dtprogXML.WriteXml(swriter);
            CurrentAddressXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return CurrentAddressXML;
        }
        /*
         * This Logic is rectified properly w.r.t Current Address Issue
         */
        private string GetOISFProfileAddressXML(OISFProfile_DT Data)
        {

            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "CurrentAddress";

            //, , , , , , , , ;
            //public string subDistrict, subDistrictLocal, district, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal

            dtCurrentTable.Columns.Add(new DataColumn("phouseNumber", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ppostOffice", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plocality", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plandmark", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstreet", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pvillage", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("psubDistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pdistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstate", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pincode", typeof(string)));

            drCurrentRow = dtCurrentTable.NewRow();

            drCurrentRow["phouseNumber"] = Data.phouseNumber == null ? "" : Data.phouseNumber.Trim();//OK
            //drCurrentRow["pcareOf"] = Data.pcareOf == null ? "" : Data.pcareOf.Trim();
            drCurrentRow["ppostOffice"] = Data.ppostOffice == null ? "" : Data.ppostOffice.Trim();//OK
            drCurrentRow["plocality"] = Data.plocality == null ? "" : Data.plocality.Trim();//OK
            drCurrentRow["plandmark"] = Data.plandmark == null ? "" : Data.plandmark.Trim();//OK
            drCurrentRow["pstreet"] = Data.pstreet == null ? "" : Data.pstreet.Trim();//OK
            drCurrentRow["pvillage"] = Data.pvillage == null ? "" : Data.pvillage.Trim();//OK
            drCurrentRow["psubDistrict"] = Data.psubDistrict == null ? "" : Data.psubDistrict.Trim();//OK
            drCurrentRow["pdistrict"] = Data.pdistrict == null ? "" : Data.pdistrict.Trim();//OK
            drCurrentRow["pstate"] = Data.pstate == null ? "" : Data.pstate.Trim();//OK
            drCurrentRow["pincode"] = Data.ppincode == null ? "" : Data.ppincode.Trim();//OK

            dtCurrentTable.Rows.Add(drCurrentRow);

            System.Data.DataTable dtprogXML = dtCurrentTable;

            string CurrentAddressXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "CurrentAddressXML";
            dtprogXML.WriteXml(swriter);
            CurrentAddressXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return CurrentAddressXML;
        }


        /*
         * This Logic is rectified properly w.r.t Current Address Issue
         */
        private string GetOUATCurrentAddressXML(OUATProfile_DT Data)
        {

            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "CurrentAddress";

            //, , , , , , , , ;
            //public string subDistrict, subDistrictLocal, district, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal

            dtCurrentTable.Columns.Add(new DataColumn("phouseNumber", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ppostOffice", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plocality", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plandmark", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstreet", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pvillage", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("psubDistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pdistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstate", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pincode", typeof(string)));

            drCurrentRow = dtCurrentTable.NewRow();

            drCurrentRow["phouseNumber"] = Data.phouseNumber == null ? "" : Data.phouseNumber.Trim();//OK
            //drCurrentRow["pcareOf"] = Data.pcareOf == null ? "" : Data.pcareOf.Trim();
            drCurrentRow["ppostOffice"] = Data.ppostOffice == null ? "" : Data.ppostOffice.Trim();//OK
            drCurrentRow["plocality"] = Data.plocality == null ? "" : Data.plocality.Trim();//OK
            drCurrentRow["plandmark"] = Data.plandmark == null ? "" : Data.plandmark.Trim();//OK
            drCurrentRow["pstreet"] = Data.pstreet == null ? "" : Data.pstreet.Trim();//OK
            drCurrentRow["pvillage"] = Data.pvillage == null ? "" : Data.pvillage.Trim();//OK
            drCurrentRow["psubDistrict"] = Data.psubDistrict == null ? "" : Data.psubDistrict.Trim();//OK
            drCurrentRow["pdistrict"] = Data.pdistrict == null ? "" : Data.pdistrict.Trim();//OK
            drCurrentRow["pstate"] = Data.pstate == null ? "" : Data.pstate.Trim();//OK
            drCurrentRow["pincode"] = Data.ppincode == null ? "" : Data.ppincode.Trim();//OK

            dtCurrentTable.Rows.Add(drCurrentRow);

            System.Data.DataTable dtprogXML = dtCurrentTable;

            string CurrentAddressXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "CurrentAddressXML";
            dtprogXML.WriteXml(swriter);
            CurrentAddressXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return CurrentAddressXML;
        }

        /*
          * This Logic is rectified properly w.r.t Current Address Issue
         */
        private string GetOUATFormACurrentAddressXML(OUATFormA_DT Data)
        {

            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "CurrentAddress";

            //, , , , , , , , ;
            //public string subDistrict, subDistrictLocal, district, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal

            dtCurrentTable.Columns.Add(new DataColumn("phouseNumber", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ppostOffice", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plocality", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plandmark", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstreet", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pvillage", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("psubDistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pdistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstate", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pincode", typeof(string)));

            drCurrentRow = dtCurrentTable.NewRow();

            drCurrentRow["phouseNumber"] = Data.phouseNumber == null ? "" : Data.phouseNumber.Trim();//OK
            //drCurrentRow["pcareOf"] = Data.pcareOf == null ? "" : Data.pcareOf.Trim();
            drCurrentRow["ppostOffice"] = Data.ppostOffice == null ? "" : Data.ppostOffice.Trim();//OK
            drCurrentRow["plocality"] = Data.plocality == null ? "" : Data.plocality.Trim();//OK
            drCurrentRow["plandmark"] = Data.plandmark == null ? "" : Data.plandmark.Trim();//OK
            drCurrentRow["pstreet"] = Data.pstreet == null ? "" : Data.pstreet.Trim();//OK
            drCurrentRow["pvillage"] = Data.pvillage == null ? "" : Data.pvillage.Trim();//OK
            drCurrentRow["psubDistrict"] = Data.psubDistrict == null ? "" : Data.psubDistrict.Trim();//OK
            drCurrentRow["pdistrict"] = Data.pdistrict == null ? "" : Data.pdistrict.Trim();//OK
            drCurrentRow["pstate"] = Data.pstate == null ? "" : Data.pstate.Trim();//OK
            drCurrentRow["pincode"] = Data.ppincode == null ? "" : Data.ppincode.Trim();//OK

            dtCurrentTable.Rows.Add(drCurrentRow);

            System.Data.DataTable dtprogXML = dtCurrentTable;

            string CurrentAddressXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "CurrentAddressXML";
            dtprogXML.WriteXml(swriter);
            CurrentAddressXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return CurrentAddressXML;
        }


        private string GetOUATAgroFormACurrentAddressXML(OUATAgroFormA_DT Data)
        {

            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "CurrentAddress";

            dtCurrentTable.Columns.Add(new DataColumn("phouseNumber", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ppostOffice", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plocality", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plandmark", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstreet", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pvillage", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("psubDistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pdistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstate", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pincode", typeof(string)));

            drCurrentRow = dtCurrentTable.NewRow();

            drCurrentRow["phouseNumber"] = Data.phouseNumber == null ? "" : Data.phouseNumber.Trim();//OK
            //drCurrentRow["pcareOf"] = Data.pcareOf == null ? "" : Data.pcareOf.Trim();
            drCurrentRow["ppostOffice"] = Data.ppostOffice == null ? "" : Data.ppostOffice.Trim();//OK
            drCurrentRow["plocality"] = Data.plocality == null ? "" : Data.plocality.Trim();//OK
            drCurrentRow["plandmark"] = Data.plandmark == null ? "" : Data.plandmark.Trim();//OK
            drCurrentRow["pstreet"] = Data.pstreet == null ? "" : Data.pstreet.Trim();//OK
            drCurrentRow["pvillage"] = Data.pvillage == null ? "" : Data.pvillage.Trim();//OK
            drCurrentRow["psubDistrict"] = Data.psubDistrict == null ? "" : Data.psubDistrict.Trim();//OK
            drCurrentRow["pdistrict"] = Data.pdistrict == null ? "" : Data.pdistrict.Trim();//OK
            drCurrentRow["pstate"] = Data.pstate == null ? "" : Data.pstate.Trim();//OK
            drCurrentRow["pincode"] = Data.ppincode == null ? "" : Data.ppincode.Trim();//OK

            dtCurrentTable.Rows.Add(drCurrentRow);

            System.Data.DataTable dtprogXML = dtCurrentTable;

            string CurrentAddressXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "CurrentAddressXML";
            dtprogXML.WriteXml(swriter);
            CurrentAddressXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return CurrentAddressXML;
        }

        void SendSMS_old(string MobileNo, string Message)
        {
            CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();
            test.sendsms(MobileNo, Message);//TODO: SMS Logic to be improved, wherein, the ServiceID, ProfileID, Application ID is to be saved in the SMS Table, for storing details for each SMS.
        }


        void SendSMS_old(string MobileNo, string Message, string ServiceID, string ApplicationID, string ProfileID)
        {
            CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();
            test.sendsms(MobileNo, Message, ServiceID, ApplicationID, ProfileID);//TODO: SMS Logic to be improved, wherein, the ServiceID, ProfileID, Application ID is to be saved in the SMS Table, for storing details for each SMS.
        }

        void SendMail(string MailID, string CCMailID, string BCCMailID, string Subject, string MailText, string ServiceID, string ApplicationID, string ProfileID)
        {

            try
            {
                if (MailID != "" && Subject != "" && MailText != "")
                {
                    CitizenPortalLib.CommonUtility.SendEmailWithAttachment(ServiceID, ApplicationID, ProfileID, MailID, CCMailID, BCCMailID,
                        Subject, MailText, true, null);
                }
            }
            catch (Exception ex)
            {

            }
        }


        public string InsertNFBSForm(NFBS_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "FirstName"
                ,"LastName"
                ,"MobileNo"
                ,"EmailID"
                ,"DOB"
                ,"Age"
                ,"Gender"
                ,"FatherName"
                ,"MotherName"
                ,"Occupation"
                ,"appAddressLine1"
                ,"appAddressLine2"
                ,"appRoadStreetName"
                ,"appLandMark"
                ,"appLocality"
                ,"appddlState"
                ,"appddlDistrict"
                ,"appddlTaluka"
                ,"appddlVillage"
                ,"appPinCode"
                ,"DeceasedName"
                ,"DeceasedFName"
                ,"DeceasedDOB"
                ,"ddlDeceasedGender"
                ,"chkHeadFamily"
                ,"deceasedAddressLine1"
                ,"deceasedAddressLine2"
                ,"deceasedRoadStreetName"
                ,"deceasedLandMark"
                ,"deceasedLocality"
                ,"deceasedddlState"
                ,"deceasedddlDistrict"
                ,"deceasedddlTaluka"
                ,"deceasedddlVillage"
                ,"deceasedPinCode"
                ,"AccountHolder"
                ,"AccountNumber"
                ,"IFSCCode"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            SeniorCitizenBLL t_SeniorCitizenBLL = new SeniorCitizenBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_SeniorCitizenBLL.InsertNFBS(Data, AFields);

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

        public string InsertNFBS(NFBS_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "aadhaarNumber"
                , "DeceasedDOB"
                ,"DeceasedAge"
              , "DeceasedDOD"
                ,"DeceasedGender"
                ,"DeceasedName"
                ,"DeceasedFName"
                ,"chkHeadFamily"
                ,"deceasedAddressLine1"
                ,"deceasedAddressLine2"
                ,"deceasedRoadStreetName"
                ,"deceasedLandMark"
                ,"deceasedLocality"
                ,"deceasedState"
                ,"deceasedDistrict"
                ,"deceasedTaluka"
                ,"deceasedVillage"
                ,"deceasedPinCode"
                ,"AccountHolder"
                ,"AccountNumber"
                ,"IFSCCode"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
                , "BPLCardNo"
                , "BPLCardYear"
                , "department"
                , "district"
                , "block"
                , "panchayat"
                , "office"
                , "officer"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            NFBSBLL t_NFBSBLL = new NFBSBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_NFBSBLL.InsertNFBS(Data, AFields);

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

        public string InsertCMRF(CMRF_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "aadhaarNumber"
                , "ProfileID"
                , "ApplicationTypeID"
                , "ApplicationType"
                , "ApplicationCategoryID"
                , "ApplicationCategory"
                , "FundAmount"
                , "FundPurpose"
                , "FundReceivedEarlier"
                , "FundReceivedPurpose"
                , "FundReceivedAmount"
                , "IsHandDiseased"
                , "HandDiseasedDetail"
                , "RecommendedBy"
                , "Occupation"
                , "AnnualIncome"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
                , "department"
                , "district"
                , "block"
                , "panchayat"
                , "office"
                , "officer"
                , "AgricultureIncome"
                , "SalaryIncome"
                , "OtherIncome"
                , "DiseaseName"
                , "TreatmentRequired"
                , "MedicineCost"
                , "Appratus"
                , "OtherExpenditure"
                , "TreatmentPlace"
                , "TreatmentReason"
                , "TreatmentAvailableOrissa"
                , "AgriIncomeRecom"
                , "SalaryIncomeRecom"
                , "OtherIncomeRecom"
                , "AnnualIncomeRecom"
                , "FinancialCondition"
                , "Acceptable"
                , "RemarkRecom"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            CMRFBLL t_CMRFBLL = new CMRFBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_CMRFBLL.InsertCMRF(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your CMRF Application is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertMBPY(MBPY_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "aadhaarNumber"
                ,"ProfileID"
                ,"PensionID"
                ,"PensionType"
                ,"DisabilityID"
                ,"DisabilityType"
                , "BPLMPBYear"
                ,"bplMBPYcardno"
                ,"ddlwidow"
                ,"disabilitypercentage"
                ,"MonthlyIncome"
                ,"AccountHolder"
                ,"AccountNumber"
                ,"IFSCCode"
                ,"CreatedBy"
                ,"CreatedOn"
                ,"ClientIP"
                ,"department"
                ,"district"
                ,"block"
                ,"panchayat"
                ,"office"
                ,"officer"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            MBPYBLL t_MBPYBLL = new MBPYBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_MBPYBLL.InsertMBPY(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your MBPY Application is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertIGNWP(IGNWP_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                "aadhaarNumber"
                ,"ProfileID"
                ,"DeceasedName"
               ,"ddlwidow"
                 , "BPLCardNo"
                , "BPLCardYear"
                ,"AccountHolder"
                ,"AccountNumber"
                ,"IFSCCode"
                ,"CreatedBy"
                ,"CreatedOn"
                ,"ClientIP"
                , "department"
                , "district"
                , "block"
                , "panchayat"
                , "office"
                , "officer"

            };

            System.Data.DataTable result = null;
            string AppID = "";
            IGNWPBLL t_IGNWPBLL = new IGNWPBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_IGNWPBLL.InsertIGNWP(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your IGNWP Application is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertIGNDP(IGNDP_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                "aadhaarNumber"
                ,"ProfileID"
                ,"DisabilityID"
                ,"DisabilityType"
                ,"DisabilityPercentage"
                ,"Income"
                 , "BPLCardNo"
                , "BPLCardYear"
                ,"AccountHolder"
                ,"AccountNumber"
                ,"IFSCCode"
                ,"CreatedBy"
                ,"CreatedOn"
                ,"ClientIP"
                ,"department"
                ,"district"
                ,"block"
                ,"panchayat"
                ,"office"
                ,"officer"

            };

            System.Data.DataTable result = null;
            string AppID = "";
            IGNDPBLL t_IGNDPBLL = new IGNDPBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_IGNDPBLL.InsertIGNDP(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your IGNDP Application is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertIGNOAP(IGNOAP_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                "aadhaarNumber"
                ,"ProfileID"
                ,"Occupation"
                ,"Income"
                 , "BPLCardNo"
                , "BPLCardYear"
                ,"AccountHolder"
                ,"AccountNumber"
                ,"IFSCCode"
                ,"CreatedBy"
                ,"CreatedOn"
                ,"ClientIP"
                ,"department"
                ,"district"
                ,"block"
                ,"panchayat"
                ,"office"
                ,"officer"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            IGNOAPBLL t_IGNOAPBLL = new IGNOAPBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_IGNOAPBLL.InsertIGNOAP(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your IGNOAP Application is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertFarmerRegistration(FarmerRegistration_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "aadhaarNumber"
                ,"PDistrictCode"
                ,"PBlockCode"
                ,"PGramPanchayat"
                ,"PVillageCode"
                ,"NameofHOF"
                ,"FatherName"
                ,"DOB"
                ,"Age"
                ,"Gender"
                ,"RelationwithHOF"
                ,"VoterIDCardNo"
                ,"Category"
                //,"aadhaarCardNo"
                ,"DAddressLine1"
                ,"DAddressLine2"
                ,"DRoadStreetName"
                ,"DLandMark"
                ,"DLocality"
                ,"DState"
                ,"DDistrict"
                ,"DTaluka"
                ,"DVillage"
                ,"PinCode"
                ,"AccountHolder"
                ,"AccountNumber"
                ,"IFSCCode"
                ,"CreatedBy"
                ,"CreatedOn"
                ,"ClientIP"
                ,"office"
                ,"officer"
                ,"FarmerMemberDetails"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            FarmerRegistrationBLL t_FarmerRegistrationBLL = new FarmerRegistrationBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;
            //Data.FarmerMemberDetails = GetFarmerMemberDetails_xml(Data.HeirsDXML);


            result = t_FarmerRegistrationBLL.InsertFarmerRegistration(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your IGNOAP Application is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }



        private string GetFarmerMemberDetails_xml(string Data)
        {
            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "FarmerMemberDetails";
            dtCurrentTable.Columns.Add(new DataColumn("SNO", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("MemberName", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("RelationWithHOF", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("Age", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("Nominated", typeof(string)));

            //add each row into data table  
            //drCurrentRow = dtCurrentTable.NewRow();

            //drCurrentRow["MemberName"] = SQLInjection(txtNameofProduct.Text.Trim());
            //drCurrentRow["RelationWithHOF"] = "";
            //drCurrentRow["Age"] = "";
            //drCurrentRow["Nominated"] = "";


            #region Code by Niraj

            Int32 intCount = default(Int32);
            Int32 StartIndex = default(Int32);
            Int32 EndIndex = default(Int32);
            Int32 Remstrlen = default(Int32);
            string strSave = null;
            string strTempString = null;
            string SrNo = null;
            string RemStr = null;
            //string strIngredient = "", strMonograph = "", strMonographID = "", strOtherMono = "", strStrength = "", strUnit = "";
            //string strMemberName = "", strRelationWithHOF = "", strAge = "", strNominated = "";

            if (Data.Length > 0)
            {
                strSave = Data;
                strTempString = Data;

                string[] arrRows = strTempString.Split(new char[] { '#' }, StringSplitOptions.RemoveEmptyEntries);
                string[] arrCols = null;

                for (int i = 0; i < arrRows.Length; i++)
                {
                    drCurrentRow = dtCurrentTable.NewRow();

                    arrCols = arrRows[i].Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                    //if (arrCols.Length == 5)
                    {
                        drCurrentRow["SNO"] = arrCols[0] == null || arrCols[0] == "" ? "" : arrCols[0];
                        drCurrentRow["MemberName"] = arrCols[1] == null || arrCols[1] == "" ? "" : arrCols[1];
                        drCurrentRow["RelationWithHOF"] = arrCols[2] == null || arrCols[2] == "" ? "" : arrCols[2];
                        drCurrentRow["Age"] = arrCols[3] == null || arrCols[3] == "" ? "" : arrCols[3];
                        drCurrentRow["Nominated"] = arrCols[4] == null || arrCols[4] == "" ? "" : arrCols[4];

                        dtCurrentTable.Rows.Add(drCurrentRow);
                    }

                }

                //while (strTempString.Length > 0 && false)
                //{
                //    drCurrentRow = dtCurrentTable.NewRow();

                //    intCount = intCount + 1;
                //    StartIndex = strTempString.IndexOf("#");

                //    strTempString = strTempString.Substring(StartIndex + 1, strTempString.Length - 1);
                //    EndIndex = strTempString.IndexOf("#");
                //    RemStr = strTempString.Substring(0, EndIndex);

                //    StartIndex = RemStr.IndexOf(",");
                //    SrNo = RemStr.Substring(0, StartIndex);
                //    Remstrlen = RemStr.Length - StartIndex;
                //    RemStr = RemStr.Substring(StartIndex + 1, Remstrlen - 1);
                //    SrNo = intCount.ToString();

                //    StartIndex = RemStr.IndexOf(",");
                //    strIngredient = RemStr.Substring(0, StartIndex);
                //    drCurrentRow["MemberName"] = strIngredient.Trim();
                //    Remstrlen = RemStr.Length - StartIndex;
                //    RemStr = RemStr.Substring(StartIndex + 1, Remstrlen - 1);

                //    StartIndex = RemStr.IndexOf(",");
                //    strMonograph = RemStr.Substring(0, StartIndex);
                //    drCurrentRow["RelationWithHOF"] = strMonograph.Trim();
                //    Remstrlen = RemStr.Length - StartIndex;
                //    RemStr = RemStr.Substring(StartIndex + 1, Remstrlen - 1);

                //    StartIndex = RemStr.IndexOf(",");
                //    strMonographID = RemStr.Substring(0, StartIndex);

                //    Remstrlen = RemStr.Length - StartIndex;
                //    RemStr = RemStr.Substring(StartIndex + 1, Remstrlen - 1);

                //    StartIndex = RemStr.IndexOf(",");
                //    strOtherMono = RemStr.Substring(0, StartIndex);
                //    drCurrentRow["Age"] = strOtherMono.Trim();
                //    Remstrlen = RemStr.Length - StartIndex;
                //    RemStr = RemStr.Substring(StartIndex + 1, Remstrlen - 1);

                //    StartIndex = RemStr.IndexOf(",");
                //    strStrength = RemStr.Substring(0, StartIndex);
                //    drCurrentRow["Nominated"] = strStrength.Trim();
                //    Remstrlen = RemStr.Length - StartIndex;
                //    RemStr = RemStr.Substring(StartIndex + 1, Remstrlen - 1);

                //    dtCurrentTable.Rows.Add(drCurrentRow);

                //    strTempString = strTempString.Substring(EndIndex + 1, strTempString.Length - (EndIndex + 1));

                //}


            }

            #endregion Code by Niraj

            System.Data.DataTable dtprogXML = dtCurrentTable;

            string FarmerMemberDetails = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "FARMERMEMBERDETAILS";
            dtprogXML.WriteXml(swriter);
            FarmerMemberDetails = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return FarmerMemberDetails;


        }



        public string InsertWaterConnection(WaterConnection_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "aadhaarNumber"
                ,"ProfileID"
                ,"CustomerID"
                ,"CategoryID"
                ,"CategoryType"
                ,"FacilityID"
                ,"FacilityType"
                ,"PurposeID"
                ,"PurposeType"
                ,"CreatedBy"
                ,"CreatedOn"
                ,"ClientIP"
                ,"department"
                ,"district"
                ,"block"
                ,"panchayat"
                ,"office"
                ,"officer"

            };

            System.Data.DataTable result = null;
            string AppID = "";
            WaterConnectionBLL t_WaterConnectionBLL = new WaterConnectionBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_WaterConnectionBLL.InsertWaterConnection(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;


                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Water Connection Application is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string SearchBirthData(SearchBirthData_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "regNo"
                ,"reqNo"
                ,"childName"
                ,"father"
                ,"mother"
                ,"gender"
                ,"DOB"
                ,"POB"

            };

            System.Data.DataTable result = null;
            string AppID = "";
            BirthRegistrationBLL t_BirthRegistrationBLL = new BirthRegistrationBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;


            result = t_BirthRegistrationBLL.SearchBirthData(Data, AFields);

            List<BirthRegistration_DT> Category = new List<BirthRegistration_DT>();
            using (System.Data.DataTableReader sdr = result.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new BirthRegistration_DT
                    {
                        RegistrationNo = result.Rows[0]["RegistrationNo"].ToString(),
                        DateOfBirth = result.Rows[0]["DateOfBirth"].ToString(),
                        BirthPlace = result.Rows[0]["BirthPlace"].ToString(),
                        Gender = result.Rows[0]["Gender"].ToString(),
                        ChildName = result.Rows[0]["ChildName"].ToString(),
                        FatherName = result.Rows[0]["FatherName"].ToString(),
                        MotherName = result.Rows[0]["MotherName"].ToString(),
                        MobileNo = result.Rows[0]["MobileNo"].ToString(),
                        EmailID = result.Rows[0]["EmailID"].ToString(),
                        InstitutionName = result.Rows[0]["InstitutionName"].ToString(),
                        AddressLine1 = result.Rows[0]["AddressLine1"].ToString(),
                        AddressLine2 = result.Rows[0]["AddressLine2"].ToString(),
                        StreetRoadName = result.Rows[0]["StreetRoadName"].ToString(),
                        LandMark = result.Rows[0]["LandMark"].ToString(),
                        Locality = result.Rows[0]["Locality"].ToString(),
                        StateCode = Convert.ToInt32(result.Rows[0]["StateCode"].ToString()),
                        DistrictCode = Convert.ToInt32(result.Rows[0]["DistrictCode"].ToString()),
                        BlockTalukaCode = Convert.ToInt32(result.Rows[0]["BlockTalukaCode"].ToString()),
                        PanchayatVillageCode = result.Rows[0]["PanchayatVillageCode"].ToString(),
                        PinCode = Convert.ToInt32(result.Rows[0]["PinCode"].ToString())

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));

        }

        public string GetDeclaration(string prefix, string UID)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            BasicDetailsBLL t_BasicDetailsBLL = new BasicDetailsBLL();
            System.Data.DataSet dtDistrict = t_BasicDetailsBLL.GetDeclaration(UID);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Name = sdr["FullName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetUIDKeyField(string prefix, string UID)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            BasicDetailsBLL t_BasicDetailsBLL = new BasicDetailsBLL();
            System.Data.DataSet dtUID = t_BasicDetailsBLL.GetUIDKeyField(UID);
            List<object> Category = new List<object>();
            //using (System.Data.DataTableReader sdr = dtUID.CreateDataReader())
            //{
            //    while (sdr.Read())
            //    {
            //        Category.Add(new
            //        {
            //            Name = sdr["JSIONData"]

            //        });
            //    }
            //}


            DataTable t_AadhaarData = null;
            DataTable t_AadhaarAddress = null;
            DataTable t_AadhaarImg = null;

            CitizenProfile_DT t_BasicDetails_DT = new CitizenProfile_DT();


            t_AadhaarData = dtUID.Tables[1];
            t_AadhaarAddress = dtUID.Tables[2];
            t_AadhaarImg = dtUID.Tables[3];

            t_BasicDetails_DT.aadhaarNumber = t_AadhaarData.Rows[0]["aadhaarNumber"].ToString();
            //t_BasicDetails_DT.action = t_AadhaarData.Rows[0][""].ToString();
            t_BasicDetails_DT.residentName = t_AadhaarData.Rows[0]["residentName"].ToString();
            t_BasicDetails_DT.residentNameLocal = t_AadhaarData.Rows[0]["residentNameLocal"].ToString();
            t_BasicDetails_DT.careOf = t_AadhaarData.Rows[0]["careOf"].ToString();
            t_BasicDetails_DT.careOfLocal = t_AadhaarData.Rows[0]["careOfLocal"].ToString();
            //t_BasicDetails_DT.dateOfBirth = t_AadhaarData.Rows[0]["dateOfBirth"].ToString();
            //t_BasicDetails_DT.dateOfBirth = (t_AadhaarData.Rows[0]["dateOfBirth"] != null && t_AadhaarData.Rows[0]["dateOfBirth"].ToString() != "" ? Convert.ToDateTime(t_AadhaarData.Rows[0]["dateOfBirth"].ToString()).ToString("yyyy-MM-dd") : "");


            string DOB = t_AadhaarData.Rows[0]["dateOfBirth"].ToString();
            string[] arrDOB = DOB.Split('-');

            t_BasicDetails_DT.dateOfBirth = arrDOB[2] + "-" + arrDOB[1] + "-" + arrDOB[0];
            t_BasicDetails_DT.gender = t_AadhaarData.Rows[0]["gender"].ToString();
            t_BasicDetails_DT.phone = t_AadhaarData.Rows[0]["phone"].ToString();
            t_BasicDetails_DT.Mobile = t_AadhaarData.Rows[0]["Mobile"].ToString();
            t_BasicDetails_DT.emailId = t_AadhaarData.Rows[0]["emailId"].ToString();
            t_BasicDetails_DT.ResponseType = t_AadhaarData.Rows[0]["ResponseType"].ToString();

            t_BasicDetails_DT.houseNumber = t_AadhaarData.Rows[0]["houseNumber"].ToString();
            t_BasicDetails_DT.houseNumberLocal = t_AadhaarData.Rows[0]["houseNumberLocal"].ToString();

            t_BasicDetails_DT.landmark = t_AadhaarData.Rows[0]["landmark"].ToString();
            t_BasicDetails_DT.landmarkLocal = t_AadhaarData.Rows[0]["landmarkLocal"].ToString();

            t_BasicDetails_DT.locality = t_AadhaarData.Rows[0]["locality"].ToString();
            t_BasicDetails_DT.localityLocal = t_AadhaarData.Rows[0]["localityLocal"].ToString();

            t_BasicDetails_DT.street = t_AadhaarData.Rows[0]["street"].ToString();
            t_BasicDetails_DT.streetLocal = t_AadhaarData.Rows[0]["streetLocal"].ToString();

            t_BasicDetails_DT.postOffice = t_AadhaarData.Rows[0]["postOffice"].ToString();
            t_BasicDetails_DT.postOfficeLocal = t_AadhaarData.Rows[0]["postOfficeLocal"].ToString();

            t_BasicDetails_DT.state = t_AadhaarData.Rows[0]["state"].ToString();
            t_BasicDetails_DT.stateLocal = t_AadhaarData.Rows[0]["stateLocal"].ToString();
            t_BasicDetails_DT.district = t_AadhaarData.Rows[0]["district"].ToString();
            t_BasicDetails_DT.districtLocal = t_AadhaarData.Rows[0]["districtLocal"].ToString();
            t_BasicDetails_DT.subDistrict = t_AadhaarData.Rows[0]["subDistrict"].ToString();
            t_BasicDetails_DT.subDistrictLocal = t_AadhaarData.Rows[0]["subDistrictLocal"].ToString();
            t_BasicDetails_DT.Village = t_AadhaarData.Rows[0]["Village"].ToString();
            t_BasicDetails_DT.pincode = t_AadhaarData.Rows[0]["pincode"].ToString();
            t_BasicDetails_DT.pincodeLocal = t_AadhaarData.Rows[0]["pincodeLocal"].ToString();
            t_BasicDetails_DT.statecode = t_AadhaarData.Rows[0]["StateCode"].ToString();
            t_BasicDetails_DT.districtcode = t_AadhaarData.Rows[0]["DistrictCode"].ToString();
            t_BasicDetails_DT.subDistrictcode = t_AadhaarData.Rows[0]["BlockCode"].ToString();
            t_BasicDetails_DT.Villagecode = t_AadhaarData.Rows[0]["PanchayatCode"].ToString();

            t_BasicDetails_DT.Image = t_AadhaarImg.Rows[0]["ApplicantImageStr"].ToString();
            t_BasicDetails_DT.photo = t_AadhaarImg.Rows[0]["ApplicantImageStr"].ToString();

            t_BasicDetails_DT.phouseNumber = t_AadhaarAddress.Rows[0]["phouseNumber"].ToString();
            t_BasicDetails_DT.plandmark = t_AadhaarAddress.Rows[0]["plandmark"].ToString();
            t_BasicDetails_DT.plocality = t_AadhaarAddress.Rows[0]["plocality"].ToString();
            t_BasicDetails_DT.pstreet = t_AadhaarAddress.Rows[0]["pstreet"].ToString();
            t_BasicDetails_DT.ppincode = t_AadhaarAddress.Rows[0]["ppincode"].ToString();
            t_BasicDetails_DT.ppostOffice = t_AadhaarAddress.Rows[0]["ppostOffice"].ToString();

            t_BasicDetails_DT.pstate = t_AadhaarAddress.Rows[0]["pstate"].ToString();
            t_BasicDetails_DT.pdistrict = t_AadhaarAddress.Rows[0]["pdistrict"].ToString();
            t_BasicDetails_DT.psubDistrict = t_AadhaarAddress.Rows[0]["psubDistrict"].ToString();
            t_BasicDetails_DT.pvillage = t_AadhaarAddress.Rows[0]["pvillage"].ToString();

            //return (new JavaScriptSerializer().Serialize(Category));
            return (new JavaScriptSerializer().Serialize(t_BasicDetails_DT));
        }

        public string InsertHSBT(HSBT_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "aadhaarNumber"
                , "ProfileID"
                , "bpl_card_no"
                , "bpl_year"
                , "date_jouney"
                , "date_return"
                , "disease_detail"
                , "atende_detail"
                , "atende_phone"
                , "disease_history"
                , "AddressLine1"
                , "AddressLine2"
                , "StreetName"
                , "Landmark"
                , "Locality"
                , "State_Code"
                , "District_Code"
                , "SubDistrict_Code"
                , "Village_Code"
                , "PinCode"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
                , "department"
                , "district"
                , "block"
                , "panchayat"
                , "office"
                , "officer"

            };

            System.Data.DataTable result = null;
            string AppID = "";
            HSBTBLL t_FIRRegistrationBLL = new HSBTBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_FIRRegistrationBLL.InsertHSBT(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Habisha Brata Application submitted successfully. The Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string CheckLocalAadhaar(string prefix, string UID)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            BasicDetailsBLL t_BasicDetailsBLL = new BasicDetailsBLL();
            System.Data.DataSet dtDistrict = t_BasicDetailsBLL.CheckLocalAadhaar(UID);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Aadhaar = sdr["AadhaarNumber"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetServices(string prefix)
        {
            //string dbName = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("SQLServer", "DB");
            //List<string> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<string>>("SQLServer", "DB");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ServicesBLL t_ServicesBLL = new ServicesBLL();
            System.Data.DataTable DTServices = t_ServicesBLL.GetServices();
            //List<ServiceDepartment> Category = new List<ServiceDepartment>();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = DTServices.CreateDataReader())
            {
                while (sdr.Read())
                {
                    //Category.Add(new ServiceDepartment
                    //{
                    //    ServiceID = sdr["ServiceCode"].ToString(),
                    //    DepartmentID = sdr["DeptID"].ToString(),
                    //    DepartmentName = sdr["DepartmentName"].ToString(),
                    //    URL = sdr["URL"].ToString()
                    //});
                    Category.Add(new
                    {
                        Id = sdr["ServiceCode"],
                        Name = sdr["ServiceName"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetDeptServices(string prefix, string DepartmentCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ServicesBLL t_ServicesBLL = new ServicesBLL();
            System.Data.DataTable DTServices = t_ServicesBLL.GetDeptServices(DepartmentCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = DTServices.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["ServiceCode"],
                        Name = sdr["ServiceName"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string InsertMigration(Migration_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                      "aadhaarNumber"
                    ,  "ProfileID"
                    , "InstituteName"
                    , "RegistrationNo"
                    , "ExaminationDetails"
                    , "LeavingDate"
                    , "AdmissionYear"
                    , "BranchCode"
                    , "Reason"
                    , "CreatedBy"
                    , "CreatedOn"
                    , "ClientIP"
                    , "department"
                    , "district"
                    , "block"
                    , "panchayat"
                    , "office"
                    , "officer"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            MigrationBLL t_MigrationBLL = new MigrationBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_MigrationBLL.InsertMigration(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Request for Migration is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertMigrationITI(MigrationITI_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                      "aadhaarNumber"
                    ,  "ProfileID"
                    , "InstituteName"
                    , "RegistrationNo"
                    , "ExaminationDetails"
                    , "LeavingDate"
                    , "AdmissionYear"
                    , "BranchCode"
                    , "Reason"
                    , "CreatedBy"
                    , "CreatedOn"
                    , "ClientIP"
                    , "department"
                    , "district"
                    , "block"
                    , "panchayat"
                    , "office"
                    , "officer"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            MigrationBLL t_MigrationBLL = new MigrationBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_MigrationBLL.InsertMigrationITI(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Request for Migration is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertDuplicateDiploma(DuplicateDiploma_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                      "aadhaarNumber"
                    ,  "ProfileID"
                    , "InstituteName"
                    , "RegistrationNo"
                    , "Session"
                    , "JoiningYear"
                    , "LeavingYear"
                    , "BranchCode"
                    , "Reason"
                    , "CreatedBy"
                    , "CreatedOn"
                    , "ClientIP"
                    , "department"
                    , "district"
                    , "block"
                    , "panchayat"
                    , "office"
                    , "officer"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            DuplicateDiplomaBLL t_DuplicateDiplomaBLL = new DuplicateDiplomaBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_DuplicateDiplomaBLL.InsertDuplicateDiploma(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Request for Migration is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertTranscript(Transcript_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                      "aadhaarNumber"
                    ,  "ProfileID"
                    , "InstituteName"
                    , "RegistrationNo"
                    , "StudentName"
                    , "Session"
                    , "JoiningYear"
                    , "LeavingYear"
                    , "Reason"
                    , "CompanyApplicantName"
                    , "AppAddressLine1"
                    , "AppAddressLine2"
                    , "AppStreetName"
                    , "AppLandmark"
                    , "AppLocality"
                    , "AppStateCode"
                    , "AppDistrictCode"
                    , "AppSubDistrictCode"
                    , "AppVillageCode"
                    , "AppPinCode"
                    , "CreatedBy"
                    , "CreatedOn"
                    , "ClientIP"
                    , "department"
                    , "district"
                    , "block"
                    , "panchayat"
                    , "office"
                    , "officer"
                    , "ServiceID"
                    , "ApplicantType"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            TranscriptBLL t_TranscriptBLL = new TranscriptBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_TranscriptBLL.InsertTranscript(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Request for Transcription Verification has been Submitted successfully. Your Reference ID is " + AppID + ". From Odisha Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertDivisionalCertificate(DivisionalCertificate_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                      "aadhaarNumber"
                    ,  "ProfileID"
                    , "InstituteName"
                    , "RegistrationNo"
                    , "Session"
                    , "JoiningYear"
                    , "LeavingYear"
                    , "ApplicantType"
                    , "Semester"
                    , "BranchCode"
                    , "SubjectCode"
                    , "CreatedBy"
                    , "CreatedOn"
                    , "ClientIP"
                    , "department"
                    , "district"
                    , "block"
                    , "panchayat"
                    , "office"
                    , "officer"
                    , "ServiceID"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            DivisionalCertificateBLL t_DivisionalCertificateBLL = new DivisionalCertificateBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_DivisionalCertificateBLL.InsertDivisionalCertificate(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Request for Transcription Verification has been Submitted successfully. Your Reference ID is " + AppID + ". From Odisha Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }
        class ServiceDepartment
        {
            public string ServiceID;
            public string DepartmentID;
            public string DepartmentName;
            public string URL;

        }

        public string GetDepartmentCode(string prefix, string DepartmentCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ServicesBLL t_ServicesBLL = new ServicesBLL();
            System.Data.DataTable dtDistrict = t_ServicesBLL.GetDepartment(DepartmentCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["DepartmentID"],
                        Name = sdr["DepartmentName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetDepartment(string prefix)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ServicesBLL t_ServicesBLL = new ServicesBLL();
            System.Data.DataTable dtDistrict = t_ServicesBLL.GetDepartment();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["DepartmentID"],
                        Name = sdr["DepartmentName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetOffice(string prefix, string DistrictCode, string TalukaCode, string VillageCode, string ServiceCode, string DepartmentCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ServicesBLL t_ServicesBLL = new ServicesBLL();
            System.Data.DataTable dtDistrict = t_ServicesBLL.GetOffice(DistrictCode, TalukaCode, VillageCode, ServiceCode, DepartmentCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["OfficeCode"],
                        Name = sdr["OfficeName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetOfficer(string prefix, string OfficeCode, string ServiceCode, string DistrictCode, string BlockCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ServicesBLL t_ServicesBLL = new ServicesBLL();
            System.Data.DataTable dtDistrict = t_ServicesBLL.GetOfficer(OfficeCode, ServiceCode, DistrictCode, BlockCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["OfficerCode"],
                        Name = sdr["OfficerName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string BindAppleteAuthority(string prefix, string ServiceCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");
            List<object> AppleteAuthority = new List<object>();
            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ServicesBLL t_ServicesBLL = new ServicesBLL();
            System.Data.DataTable dtAuthority = t_ServicesBLL.AppleteAuthority(ServiceCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtAuthority.CreateDataReader())
            {
                //while (sdr.Read())
                //{
                //    Category.Add(new
                //    {
                //        Id = sdr["OfficerCode"],
                //        Name = sdr["OfficerName"]

                //    });
                //}

                foreach (DataRow dtrow in dtAuthority.Rows)
                {
                    Authority authority = new Authority();
                    authority.ServiceName = dtrow["ServiceName"].ToString();
                    authority.TimeLimit = dtrow["TimeLimit"].ToString();
                    authority.DesignatedOfficer = dtrow["DesignatedOfficer"].ToString();
                    authority.AppellateAuthority = dtrow["AppellateAuthority"].ToString();
                    authority.RevisionalAuthority = dtrow["RevisionalAuthority"].ToString();
                    authority.FAQURL = dtrow["FAQURL"].ToString();
                    authority.HideOfficerPanel = dtrow["HideOfficerPanel"].ToString();
                    AppleteAuthority.Add(authority);
                }
            }
            return (new JavaScriptSerializer().Serialize(AppleteAuthority));
        }

        public string InsertConversion(Conversion_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "aadhaarNumber"
                ,"ProfileID"
                ,"PDistrict"
                ,"PBlock"
                ,"PMouza"
                ,"DrawingNo"
                ,"PlotNo"
                ,"AllottedArea"
                ,"AreaUnit"
                ,"KhataNo"
                ,"RevenuePlotNo"
                ,"PossessionDate"
                ,"LandUsed"
                ,"LandUsedType"
                ,"IsRegistered"
                ,"RegistrationNo"
                ,"DeedBookNo"
                ,"DeedVolumeNo"
                ,"FromPageDeedNo"
                ,"ToPageDeedNo"
                ,"IsConstruted"
                ,"IsHoldingTaxAccessed"
                ,"ConstrutedDetail"
                ,"IsNonResidential"
                ,"ResidentialDetail"
                ,"IsMortgaged"
                ,"MortgagedDetail"
                ,"IsNOCEnclosed"
                ,"NOCDetail"
                ,"IsDisputed"
                ,"DisputeDetail"
                ,"RentAmount"
                ,"WeatherUpdated"
                ,"CreatedBy"
                ,"CreatedOn"
                ,"ClientIP"
                ,"department"
                ,"district"
                ,"block"
                ,"panchayat"
                ,"office"
                ,"officer"

            };

            System.Data.DataTable result = null;
            string AppID = "";
            ConversionBLL t_ConversionBLL = new ConversionBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_ConversionBLL.InsertConversion(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your MBPY Application is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertBirthRegistration(BirthRegistration_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "DateOfBirth"
                ,"TimeOfBirth"
                ,"BirthPlace"
                ,"Weight"
                ,"Gender"
                ,"ChildName"
                ,"FatherName"
                ,"MotherName"
                ,"InstitutionNo"
                ,"InstitutionName"
                ,"AddressLine1"
                ,"AddressLine2"
                ,"StreetRoadName"
                ,"LandMark"
                ,"Locality"
                ,"StateCode"
                ,"DistrictCode"
                ,"BlockTalukaCode"
                ,"PanchayatVillageCode"
                ,"PinCode"
                ,"CreatedBy"
                ,"CreatedOn"
                ,"ClientIP"
                ,"MobileNo"
                ,"EmailID"
                };

            System.Data.DataTable result = null;
            string AppID = "";
            BirthRegistrationBLL t_BirthRegistrationBLL = new BirthRegistrationBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_BirthRegistrationBLL.InsertBirthRegistration(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your MBPY Application is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string GenerateOTP(string UID)
        {
            OTP_DT objOTP = new OTP_DT();
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "aadhaarNumber"
                ,"SMSID"
                ,"OTPCode"
                ,"CreatedOn"
                ,"CreatedBy"
                ,"ClientIP"

            };

            System.Data.DataTable result = null;

            string Mobile = "", OTP = "", VallidTill = "", SMSID = "";

            OTPBLL t_OTPBLL = new OTPBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            string SMSId = SMSUnqID();
            string OTPCode = GenOTPCode();

            objOTP.aadhaarNumber = UID;
            objOTP.SMSID = SMSId;
            objOTP.OTPCode = OTPCode;

            objOTP.CreatedBy = KioskID;
            objOTP.CreatedOn = DateTime.Now;

            result = t_OTPBLL.InsertOTP(objOTP, AFields);

            if (result.Rows.Count > 0)
            {
                Mobile = result.Rows[0]["Mobile"].ToString();
                SMSID = result.Rows[0]["SMSID"].ToString();
                OTP = result.Rows[0]["OTPCode"].ToString();
                VallidTill = result.Rows[0]["validtill"].ToString();
                t_ServiceResult.AppID = UID + "_" + OTP + "_" + VallidTill + "_" + Mobile.Remove(3, 7).PadRight(8, 'X') + Mobile.Remove(0, 8) + "_" + SMSID + "_" + Mobile;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                SendSMS(result.Rows[0]["Mobile"].ToString(), "OTP for Odisha Lokaseba Adhikara is " + OTP +
                    " and is valid for 10 minutes. Generated at " + VallidTill + " From Odisha Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }


        public string ValidateMobile(string prefix, string MobileNo)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            System.Data.DataTable result = null;

            OTPBLL t_OTPBLL = new OTPBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            result = t_OTPBLL.ValidateMobile(MobileNo);

            if (result.Rows.Count > 0)
            {
                t_ServiceResult.AppID = MobileNo;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }
        //
        public string GenerateMobileOTP(string prefix, string MobileNo, string email)
        {
            OTP_DT objOTP = new OTP_DT();
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "MobileNo"
                ,"SMSID"
                ,"OTPCode"
                ,"CreatedOn"
                ,"CreatedBy"
                ,"ClientIP"
                ,"email"
            };

            System.Data.DataTable result = null;

            string Mobile = "", EmailId = "", OTP = "", VallidTill = "", SMSID = "", UID = "";

            OTPBLL t_OTPBLL = new OTPBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            string SMSId = SMSUnqID();
            string OTPCode = GenOTPCode();

            //objOTP.aadhaarNumber = UID;
            objOTP.MobileNo = MobileNo;
            objOTP.email = email;
            objOTP.SMSID = SMSId;
            objOTP.OTPCode = OTPCode;

            objOTP.CreatedBy = KioskID;
            objOTP.CreatedOn = DateTime.Now;

            result = t_OTPBLL.InsertMobileOTP(objOTP, AFields);

            if (result.Rows.Count > 0)
            {
                if (result.Rows[0]["mobile"].ToString() != "")
                {
                    UID = result.Rows[0]["aadhaarNumber"].ToString();
                    Mobile = result.Rows[0]["Mobile"].ToString();
                    SMSID = result.Rows[0]["SMSID"].ToString();
                    OTP = result.Rows[0]["OTPCode"].ToString();
                    VallidTill = result.Rows[0]["validtill"].ToString();
                    t_ServiceResult.AppID = UID + "_" + OTP + "_" + VallidTill + "_" + MobileNo.Remove(3, 7).PadRight(8, 'X') + MobileNo.Remove(0, 8) + "_" + SMSID + "_" + MobileNo;
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;

                    SendSMS(result.Rows[0]["Mobile"].ToString(), "OTP for Forget Password of Lokaseba Adhikara Odisha is " + OTP +
                        " and is valid for 10 minutes. Generated at " + VallidTill + " From Lokaseba Adhikara Odisha -CAP, Odisha Govt.");
                }
                else
                {
                    UID = result.Rows[0]["aadhaarNumber"].ToString();
                    email = result.Rows[0]["email"].ToString();
                    SMSID = result.Rows[0]["SMSID"].ToString();
                    OTP = result.Rows[0]["OTPCode"].ToString();
                    VallidTill = result.Rows[0]["validtill"].ToString();
                    t_ServiceResult.AppID = UID + "_" + OTP + "_" + VallidTill + "_" + email.Remove(3, 7).PadRight(8, 'X') + email.Remove(0, 8) + "_" + SMSID + "_" + email;
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;

                }

            }


            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }
        public string SendSMSOnMobile(string UID, string EnteredOTP, string profileId)
        {
            OTP_DT objOTP = new OTP_DT();
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "aadhaarNumber"
                ,"SMSID"
                ,"OTPCode"
                ,"OTPEntered"
                ,"ModifiedBy"
                ,"ModifiedOn"
                ,"MobileNo"
                ,"ClientIP"


            };

            System.Data.DataTable result = null;
            string[] temp = UID.Split('_');

            string tUID = temp[0], OTPCode = temp[1], VallidTill = temp[2], Mobile = temp[5], SMSID = temp[4];

            OTPBLL t_OTPBLL = new OTPBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            objOTP.aadhaarNumber = tUID;
            objOTP.SMSID = SMSID;
            objOTP.OTPCode = OTPCode;
            objOTP.OTPEntered = EnteredOTP;
            if (OTPCode == EnteredOTP)
            {

                int NumLen = Mobile.ToString().Length;

                if (NumLen == 10)
                {
                    objOTP.validTill = Convert.ToDateTime(VallidTill);
                    objOTP.MobileNo = Mobile;
                    objOTP.ModifiedBy = KioskID;
                    objOTP.ModifiedOn = DateTime.Now;

                    result = t_OTPBLL.SendSMS(objOTP, AFields);
                    string appid = result.Rows[0]["appid"].ToString();
                    string app = appid.Substring(2, 12);
                    if (result.Rows.Count > 0)
                    {

                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "Success";
                        t_ServiceResult.intStatus = 1;
                        string randomPassword = CreateRandomPassword(8);

                        SendSMS(objOTP.MobileNo, "Your Login ID : " + profileId +
                            " and new Password : " + randomPassword + " From Lokaseba Adhikara Odisha.");
                        History(profileId, randomPassword, Mobile, OTPCode);


                    }
                }
                else
                {

                    objOTP.validTill = Convert.ToDateTime(VallidTill);
                    objOTP.MobileNo = Mobile;
                    objOTP.ModifiedBy = KioskID;
                    objOTP.ModifiedOn = DateTime.Now;

                    result = t_OTPBLL.SendSMS(objOTP, AFields);
                    string appid = result.Rows[0]["appid"].ToString();
                    string app = appid.Substring(2, 12);
                    if (result.Rows.Count > 0)
                    {

                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "Success";
                        t_ServiceResult.intStatus = 1;
                        string randomPassword = CreateRandomPassword(8);
                        History(profileId, randomPassword, Mobile, OTPCode);


                    }



                    else
                    {

                    }

                }

            }
            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string SendForgetPassword(string UID, string EnteredOTP, string ProfileID, string UType)
        {
            OTP_DT objOTP = new OTP_DT();
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                 "aadhaarNumber"
                ,"SMSID"
                ,"OTPCode"
                ,"OTPEntered"
                ,"ModifiedBy"
                ,"ModifiedOn"
                ,"MobileNo"
                ,"ClientIP"
            };

            System.Data.DataTable result = null;
            string[] temp = UID.Split('_');

            string tUID = temp[0], OTPCode = temp[1], VallidTill = temp[2], Mobile = temp[5], SMSID = temp[4];

            OTPBLL t_OTPBLL = new OTPBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            objOTP.aadhaarNumber = tUID;
            objOTP.SMSID = SMSID;
            objOTP.OTPCode = OTPCode;
            objOTP.OTPEntered = EnteredOTP;

            if (OTPCode == EnteredOTP)
            {
                int NumLen = Mobile.ToString().Length;

                if (NumLen == 10)
                {
                    objOTP.validTill = Convert.ToDateTime(VallidTill);
                    objOTP.MobileNo = Mobile;
                    objOTP.ModifiedBy = KioskID;
                    objOTP.ModifiedOn = DateTime.Now;

                    result = t_OTPBLL.SendSMS(objOTP, AFields);
                    string appid = result.Rows[0]["appid"].ToString();
                    string app = appid.Substring(2, 12);
                    if (result.Rows.Count > 0)
                    {
                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "Success";
                        t_ServiceResult.intStatus = 1;
                        string randomPassword = CreateRandomPassword(8);

                        SendSMS(objOTP.MobileNo, "Your Login ID : " + ProfileID + " and New Password : " + randomPassword + " From Chhattisgarh Swami Vivekanad Technical University.");
                        ForgetPasswordHistory(ProfileID, randomPassword, Mobile, OTPCode, UType);
                    }
                }
                else
                {
                    objOTP.validTill = Convert.ToDateTime(VallidTill);
                    objOTP.MobileNo = Mobile;
                    objOTP.ModifiedBy = KioskID;
                    objOTP.ModifiedOn = DateTime.Now;

                    result = t_OTPBLL.SendSMS(objOTP, AFields);
                    string appid = result.Rows[0]["appid"].ToString();
                    string app = appid.Substring(2, 12);
                    if (result.Rows.Count > 0)
                    {
                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "Success";
                        t_ServiceResult.intStatus = 1;
                        string randomPassword = CreateRandomPassword(8);
                        ForgetPasswordHistory(ProfileID, randomPassword, Mobile, OTPCode, UType);
                    }
                    else
                    {
                    }
                }
            }
            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public void History(string profileid, string newPassword, string mobile, string otp)
        {
            OTPBLL ob = new OTPBLL();
            ob.History(profileid, newPassword, mobile, otp);

        }

        public void ForgetPasswordHistory(string ProfileID, string newPassword, string Mobile, string Otp, string UType)
        {
            OTPBLL m_OTPBLL = new OTPBLL();
            m_OTPBLL.ForgetPasswordHistory(ProfileID, newPassword, Mobile, Otp, UType);
        }

        public string CreateRandomPassword(int PasswordLength)
        {
            string allowedChars = "";
            // allowedChars = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,";
            // allowedChars += "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,";
            allowedChars += "1,2,3,4,5,6,7,8,9,0,";
            //allowedChars += "!,@,#,$,%,&,?";
            char[] sep = { ',' };
            string[] arr = allowedChars.Split(sep);
            string passwordString = "";
            string temp = "";
            Random rand = new Random();
            for (int i = 0; i < PasswordLength; i++)
            {
                temp = arr[rand.Next(0, arr.Length)];
                passwordString += temp;
            }
            return passwordString;

        }
        //public static string CreateRandomPassword(int PasswordLength)
        //{
        //    string _allowedChars = "0123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ";
        //    Random randNum = new Random();
        //    char[] chars = new char[PasswordLength];
        //    int allowedCharCount = _allowedChars.Length;
        //    for (int i = 0; i < PasswordLength; i++)
        //    {
        //        chars[i] = _allowedChars[(int)((_allowedChars.Length) * randNum.NextDouble())];
        //    }
        //    return new string(chars);
        //}

        public string GenerateCitizenOTP(string prefix, string MobileNo)
        {
            OTP_DT objOTP = new OTP_DT();
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "MobileNo"
                ,"SMSID"
                ,"OTPCode"
                ,"CreatedOn"
                ,"CreatedBy"
                ,"ClientIP"

            };

            System.Data.DataTable result = null;

            string Mobile = "", OTP = "", VallidTill = "", SMSID = "", UID = "";

            OTPBLL t_OTPBLL = new OTPBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            string SMSId = SMSUnqID();
            string OTPCode = GenOTPCode();

            //objOTP.aadhaarNumber = UID;
            objOTP.MobileNo = MobileNo;
            objOTP.SMSID = SMSId;
            objOTP.OTPCode = OTPCode;

            objOTP.CreatedBy = KioskID;
            objOTP.CreatedOn = DateTime.Now;

            result = t_OTPBLL.InsertCitizenOTP(objOTP, AFields);

            if (result.Rows.Count > 0)
            {
                UID = result.Rows[0]["aadhaarNumber"].ToString();
                Mobile = result.Rows[0]["Mobile"].ToString();
                SMSID = result.Rows[0]["SMSID"].ToString();
                OTP = result.Rows[0]["OTPCode"].ToString();
                VallidTill = result.Rows[0]["validtill"].ToString();
                t_ServiceResult.AppID = UID + "_" + "OTP" + "_" + VallidTill + "_" + MobileNo.Remove(3, 7).PadRight(8, 'X') + MobileNo.Remove(0, 8) + "_" + SMSID + "_" + MobileNo;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                SendSMS(result.Rows[0]["Mobile"].ToString(), "OTP for Odisha Lokaseba Adhikara is " + OTP +
                    " and is valid for 10 minutes. Generated at " + VallidTill + " From Odisha Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string GetUIDJSon(string UID)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            System.Data.DataTable result = null;

            OTPBLL t_OTPBLL = new OTPBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            result = t_OTPBLL.GetUIDJSon(UID);

            if (result.Rows.Count > 0)
            {
                t_ServiceResult.AppID = result.Rows[0]["UIDJSON"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string GetCitizenUIDJSon(string UID)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            System.Data.DataTable result = null;

            OTPBLL t_OTPBLL = new OTPBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            result = t_OTPBLL.GetCitizenUIDJSon(UID);

            if (result.Rows.Count > 0)
            {
                t_ServiceResult.AppID = result.Rows[0]["UIDJSON"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        private string GenOTPCode()
        {
            Random random = new Random();
            string t_OTP = "";
            int i;
            for (i = 1; i < 7; i++)
            {
                t_OTP += random.Next(0, 9).ToString();
            }

            return t_OTP;
        }

        private string SMSUnqID()
        {
            Random random = new Random();
            string m_SMSID = "";
            int i;
            for (i = 1; i < 11; i++)
            {
                m_SMSID += random.Next(0, 9).ToString();
            }

            string t_GenOn = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");


            List<object> SMSID = new List<object>();

            SMSID.Add(new
            {
                SMSUnqID = m_SMSID,
            });

            return m_SMSID;
        }

        public string ValidateOTP(string UID, string EnteredOTP)
        {
            OTP_DT objOTP = new OTP_DT();
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "aadhaarNumber"
                ,"SMSID"
                ,"OTPCode"
                ,"OTPEntered"
                ,"ModifiedBy"
                ,"ModifiedOn"
                ,"MobileNo"
                ,"ClientIP"

            };

            System.Data.DataTable result = null;
            string[] temp = UID.Split('_');

            string tUID = temp[0], OTPCode = temp[1], VallidTill = temp[2], Mobile = temp[5], SMSID = temp[4];

            OTPBLL t_OTPBLL = new OTPBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            objOTP.aadhaarNumber = tUID;
            objOTP.SMSID = SMSID;
            objOTP.OTPCode = OTPCode;
            objOTP.OTPEntered = EnteredOTP;
            objOTP.validTill = Convert.ToDateTime(VallidTill);
            objOTP.MobileNo = Mobile;
            objOTP.ModifiedBy = KioskID;
            objOTP.ModifiedOn = DateTime.Now;

            result = t_OTPBLL.ValidateOTP(objOTP, AFields);

            if (result.Rows.Count > 0)
            {
                t_ServiceResult.AppID = UID + "_" + result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string GetCitizenProfile(string MobileNo)
        {
            System.Data.DataTable result = null;

            OTPBLL t_OTPBLL = new OTPBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            result = t_OTPBLL.GetCitizenProfile(MobileNo);

            if (result.Rows.Count > 0)
            {
                t_ServiceResult.AppID = result.Rows[0]["aadhaarNumber"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));

        }

        public string ValidateCitizenOTP(string UID, string EnteredOTP)
        {
            OTP_DT objOTP = new OTP_DT();
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "aadhaarNumber"
                ,"SMSID"
                ,"OTPCode"
                ,"OTPEntered"
                ,"ModifiedBy"
                ,"ModifiedOn"
                ,"MobileNo"
                ,"ClientIP"

            };

            System.Data.DataTable result = null;
            string[] temp = UID.Split('_');

            string tUID = temp[0], OTPCode = temp[1], VallidTill = temp[2], Mobile = temp[5], SMSID = temp[4];

            OTPBLL t_OTPBLL = new OTPBLL();
            ValidateUser validateUser = new ValidateUser();

            validateUser.AppID = "";
            validateUser.Status = "Error";
            validateUser.intStatus = 0;

            objOTP.aadhaarNumber = tUID;
            objOTP.SMSID = SMSID;
            objOTP.OTPCode = OTPCode;
            objOTP.OTPEntered = EnteredOTP;
            objOTP.validTill = Convert.ToDateTime(VallidTill);
            objOTP.MobileNo = Mobile;
            objOTP.ModifiedBy = KioskID;
            objOTP.ModifiedOn = DateTime.Now;

            result = t_OTPBLL.ValidateCitizenOTP(objOTP, AFields);

            if (result.Rows.Count > 0)
            {
                validateUser.AppID = result.Rows[0]["AppID"].ToString();
                validateUser.Status = "Success";
                validateUser.intStatus = 1;

                validateUser.ResponseType = result.Rows[0]["ResponseType"].ToString();
                validateUser.Keyfield = result.Rows[0]["KeyField"].ToString();
                validateUser.ProfileID = result.Rows[0]["ProfileID"].ToString();


            }

            return (new JavaScriptSerializer().Serialize(validateUser));
        }

        class ValidateUser : ServiceResult
        {
            public string ResponseType;
            public string Keyfield;
            public string ProfileID;
        }

        public string BindBPLYear(int ServiceId, string State, string District, string Taluka, string Village)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ServicesBLL t_ServicesBLL = new ServicesBLL();
            System.Data.DataTable dtDistrict = t_ServicesBLL.BindBPLYear(ServiceId, State, District, Taluka, Village);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["BPLYear"],
                        Name = sdr["BPLYear"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }
        public string binddetails(string uid)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ServicesBLL t_ServicesBLL = new ServicesBLL();
            System.Data.DataTable dtDistrict = t_ServicesBLL.binddetails(uid);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {


                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["dateOfBirth"],
                        Name = sdr["gender"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string InsertLoginDetail(LoginDetail_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "FullName"
                , "LoginID"
                , "Mobile"
                , "emailId"
                , "Password"
                , "IsActive"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"

            };

            System.Data.DataTable result = null;
            string UID = "";
            CitizenRegistrationBLL t_CitizenRegisterationBLL = new CitizenRegistrationBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;


            result = t_CitizenRegisterationBLL.InsertLoginDetail(Data, AFields);
            string t_LoginID = "", t_Password = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["LoginID"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                t_ServiceResult.AppID = t_LoginID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                SendSMS(Data.Mobile, "You've sucessfully register to Odisha Lokaseba Adhikara portal, the login details are  LOGIN ID : " + t_LoginID + "  -- From Odisha Lokaseba Adhikara, CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string CheckAvability(string UserId)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            System.Data.DataTable result = null;

            ServiceResult t_ServiceResult = new ServiceResult();
            CitizenRegistrationBLL t_CitizenRegistrationBLL = new CitizenRegistrationBLL();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            result = t_CitizenRegistrationBLL.CheckLoginAvability(UserId);

            if (result.Rows.Count > 0)
            {
                t_ServiceResult.AppID = result.Rows[0]["LoginId"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string GetUserDetails(string prefix, string UID)
        {

            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            CitizenBasicDetailsBLL t_CitizenBasicDetailsBLL = new CitizenBasicDetailsBLL();


            System.Data.DataTable dtUsers = t_CitizenBasicDetailsBLL.GetUserDetails(UID);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtUsers.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Name = sdr["FirstName"],
                        Mobile = sdr["Mobile"],
                        EmailID = sdr["Email"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetSVIDdetail(string svID, string langID)
        {

            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            CitizenBasicDetailsBLL t_CitizenBasicDetailsBLL = new CitizenBasicDetailsBLL();

            System.Data.DataTable dtUsers = t_CitizenBasicDetailsBLL.GetSVIDdetail(svID, langID);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtUsers.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Name = sdr["Information"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }
        public string BindCategory()
        {

            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            CitizenBasicDetailsBLL t_CitizenBasicDetailsBLL = new CitizenBasicDetailsBLL();


            System.Data.DataTable dtUsers = t_CitizenBasicDetailsBLL.BindCategory();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtUsers.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["RowID"],
                        Name = sdr["CategoryName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }
        public string BindReligion()
        {

            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            CitizenBasicDetailsBLL t_CitizenBasicDetailsBLL = new CitizenBasicDetailsBLL();


            System.Data.DataTable dtUsers = t_CitizenBasicDetailsBLL.BindReligion();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtUsers.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["ReligionId"],
                        Name = sdr["ReligionName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }
        public string BindMaritalstatus()
        {

            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            CitizenBasicDetailsBLL t_CitizenBasicDetailsBLL = new CitizenBasicDetailsBLL();


            System.Data.DataTable dtUsers = t_CitizenBasicDetailsBLL.BindMaritalstatus();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtUsers.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["MaritalId"],
                        Name = sdr["MaritalName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        //No Changes in Function
        public string InsertOISFProfile(OISFProfile_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "aadhaarNumber"
                , "action"
                , "careOf"
                , "careOfLocal"
                , "dateOfBirth"
                , "district"
                , "districtLocal"
                , "emailId"
                , "gender"
                , "houseNumber"
                , "houseNumberLocal"
                , "landmark"
                , "landmarkLocal"
                , "language"
                , "locality"
                , "localityLocal"
                , "phone"
                , "pincode"
                , "pincodeLocal"
                , "postOffice"
                , "postOfficeLocal"
                , "residentName"
                , "residentNameLocal"
                , "responseCode"
                , "state"
                , "stateLocal"
                , "street"
                , "streetLocal"
                , "subDistrict"
                , "subDistrictLocal"
                , "timestamp"
                , "ttl"
                , "vtc"
                , "vtcLocal"
                , "IsActive"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
                , "Image"
                , "Mobile"
                , "CurrentAddressXML"
                , "CitizenProfileID"
                , "Village"
                , "Password"
                , "statecode"
                , "districtcode"
                , "subDistrictcode"
                , "Villagecode"
                ,"Section1_PassOdia"
                ,"Section1_AbililtyRead"
                ,"Section1_AbilityWrite"
                ,"Section1_AbilitySpeak"
                ,"Section2_Married"
                ,"Section2A_MoreThanOneSpouse"
                ,"Section3_ExServiceMan"
                ,"Section3A_ServiceRendered"
                ,"Section3B_ServiceDurationFrom"
                ,"Section3B_ServiceDurationTo"
                ,"Section3C_ServiceYear"
                ,"Section3C_ServiceMonth"
                ,"Section3C_ServiceDay"
                ,"Section4_IsSportsPerson"
                ,"Section4A_SportsParticipated"
                ,"Section4B_SportsOthers"
                ,"Section4C_SportsFedAssName"
                ,"Section4B_WantsRelaxation"
                ,"Section4B_RelaxationHeight"
                ,"Section4B_RelaxationChest"
                ,"Section4B_RelaxationWeight"
                ,"Section5A_ParticipateEvent"
                ,"Section5B_SportsCategory"
                ,"Section5C_SportsMedal"
                ,"Section6_NCCCertificate"
                ,"Section6A_NCCCertificateCategory"
                ,"Section7A_RegNo"
                ,"Section7A_RegDate"
                ,"Section7B_NameEmpExchg"
                ,"Section8_HasDL"
                ,"Section8A_LicenseVehicle"
                ,"Section8B_LicenseNo"
                ,"Section8B_LicenseDate"
                ,"Section8C_NameRTOOffice"
                ,"Section9_InvolvedCriminal"
                ,"Section9A_ArrestDetail"
                ,"Section9B_CaseRefNo"
                ,"Section9C_District"
                ,"Section9D_PoliceStationNo"
                ,"Section9E_IPCSection"
                , "Religion"
                , "Category"
                , "Nationality"
                , "JSONData"
                , "ImageSign"
                , "EduState"
                , "EduNameOfBoard"
                , "EduNameOfExamination"
                , "EduPassingYear"
                , "EduGrade"
                , "EduExamCleared"
                , "EduTotalMarks"
                , "EduMarkSecured"
                , "EduPercentage"
                , "Section5"
                , "Section7B_District"
                , "Section8C_District"
                , "ChoiceofPreference"
                , "SecondPreference"
                , "stdcode"
                , "Section9C_State"
                , "ResponseType"
            };

            System.Data.DataTable result = null;
            string UID = "";
            CitizenProfileBLL t_CitizenProfileBLL = new CitizenProfileBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            string CurrentAddressXML = GetOISFProfileAddressXML(Data);
            string t_Password = GenPassword();
            Data.Password = t_Password;
            Data.CurrentAddressXML = CurrentAddressXML;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);

            result = t_CitizenProfileBLL.InsertOISFProfileData(Data, AFields);
            string t_LoginID = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText;
            MailID = CCMailID = BCCMailID = Subject = MailText = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["Mobile"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                UID = result.Rows[0]["aadhaarNumber"].ToString();

                MailID = result.Rows[0]["MailID"].ToString();
                CCMailID = result.Rows[0]["CCMailID"].ToString();
                BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                Subject = result.Rows[0]["Subject"].ToString();
                MailText = result.Rows[0]["MailText"].ToString();


                MailText = @"


<!doctype html>
<html>
<head>
    <title>LOKASEBA ADHIKARA - Confirmation Email</title>    
</head>
<body style=""font-family: ''Andada'' , serif; background-color: #E0E0E0;"">
    <div style=""margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff;"">
        <table style=""padding: 1% 0; width: 100%"">
            <tr>
                <td align=""left"">
                    <img src=""http://g2cservices.in/g2c/img/lokaseba_logo.png"" alt=""LOKASEBA ADHIKARA""
                        style=""margin-left: 5%; height: 60px;"" />
                </td>
                <td align=""right"">
                    <img src=""http://g2cservices.in/WebApp/Kiosk/OISF/img/odisha_policelogo.jpg"" alt=""Odisha Police""
                        style=""margin-right: 5%; height: 60px;"" />
                </td>
            </tr>
        </table>

        <div style=""position: relative; background: #10A5DF; border: 1px solid #0C7FB5;"">
            <h1 style=""color: #fff; font-size: 20px; line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); text-transform: uppercase; font-family: arial;"">Recruitment of Constables&nbsp; 2016 - 2017</h1>
        </div>
        <div style=""margin: 5% 5% 0;"">
            <p>
                Dear @Name,
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Thank you for Registrating in Recruitment of Constables in 9th SIRB<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">&nbsp;</span>
            </p>
            <p style="" font-family: Calibri, sans-serif;
            font-size: 11pt;
            color: rgb(0, 0, 0);
            letter-spacing: normal;margin: 0in 0in 0.0001pt; font-variant: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                The Login detail for LOKASEBA ADHIKAR (Common Application Portal - CAP) is</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                LOGIN ID : <b>@Login</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                PASSWORD : <b>@Password</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>The login detail to be used for</b> </div>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>
                    <li>Make Payment (no payment for SC and ST)
                    </li>
                    <li>Upload the payment detail (only if the payment is made throught SB-Collect)
                    </li>
                    <li>Download e-Pass for
                <ul>
                    <li>Physical Measurment</li>
                    <li>Physical Efficiency Test (those who have qualified in Physical Measurment)</li>
                    <li>Written Examination (those who have qualified in Physical Measurment and Physical Efficiency)</li>
                </ul>
                    </li>
                    <li>Date of events and Results
                    </li>
                </ul>

            </div>
            </div>
        <hr />
        <div style=""margin:0 5% 5%;"">
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Your Application for Recruitment of Constables in 9th SIRB is Saved successfully.<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: maroon; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                Your Reference ID is <b>@AppID</b>.</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>
                    <li>Please upload the supporting documents / certificates
                    </li>
                    <li>Make payment (no payment for SC and ST category) againt the Reference ID 
                        <ul>
                            <li>either at any CSC centre (<a href=""/g2c/forms/CenterList.aspx"" target=""_blank"">CSC centers in Odisha</a>) .
                            </li>
                            <li>or through SB-Collect (<a href=""https://www.onlinesbi.com/prelogin/icollecthome.htm?corpID=792927"" target=""_blank"">SBI link</a>)
                            </li>
                        </ul>
                    </li>
                    <li>After Payment,&nbsp; 
                uploaded the payment detail (only if payment is done through SB-Collect) to&nbsp; <a href=""https://lokaseba-odisha.in/Account/Login"" target=""_blank"">LOKASEBA ADHIKAR</a> portal after login through above login details.
            </div>
            
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>PLEASE NOTE : </b>If the payment detail is not uploaded, the Application for Recruitment of Constables in 9th SIRB shall be considered invalid. 
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">Regards</span>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13); font-weight: bold;"">LOKASEBA ADHIKARA<br />
                    Common Application Portal (CAP), Odisha</span>
            </p>
        </div>
    </div>
</body>
</html>
";
                MailText = MailText.Replace("@AppID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", UID);

                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                if (Data.CitizenProfileID != null && Data.CitizenProfileID != "")
                {

                }
                else
                {
                    SendSMS(Data.Mobile,
                        "You've registered for Constables Recruitment, The login detail is LOGIN ID : " + UID +
                        " PASSWORD : " + t_Password + ". From Lokaseba Adhikara, CAP, Odisha Govt.", "388",
                        result.Rows[0]["AppID"].ToString(), UID);
                }
                SendSMS(Data.Mobile, "Your Application for Recruitment in Constables is Saved successfully. Your Reference ID is " + result.Rows[0]["AppID"].ToString() + ". Please upload the necessay document and make payment, otherwises the form shall considered invalid. From Lokaseba Adhikara -CAP, Odisha Govt.", "388", result.Rows[0]["AppID"].ToString(), UID);
                SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "388", result.Rows[0]["AppID"].ToString(), UID);
                //USE THIS FUNTION FOR MAIL
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        //battalion implementation
        public string InsertOISFProfileDataOffLine(OISFProfile_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "aadhaarNumber"
                , "action"
                , "careOf"
                , "careOfLocal"
                , "dateOfBirth"
                , "district"
                , "districtLocal"
                , "emailId"
                , "gender"
                , "houseNumber"
                , "houseNumberLocal"
                , "landmark"
                , "landmarkLocal"
                , "language"
                , "locality"
                , "localityLocal"
                , "phone"
                , "pincode"
                , "pincodeLocal"
                , "postOffice"
                , "postOfficeLocal"
                , "residentName"
                , "residentNameLocal"
                , "responseCode"
                , "state"
                , "stateLocal"
                , "street"
                , "streetLocal"
                , "subDistrict"
                , "subDistrictLocal"
                , "timestamp"
                , "ttl"
                , "vtc"
                , "vtcLocal"
                , "IsActive"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
                , "Image"
                , "Mobile"
                , "CurrentAddressXML"
                , "CitizenProfileID"
                , "Village"
                , "Password"
                , "statecode"
                , "districtcode"
                , "subDistrictcode"
                , "Villagecode"
                ,"Section1_PassOdia"
                ,"Section1_AbililtyRead"
                ,"Section1_AbilityWrite"
                ,"Section1_AbilitySpeak"
                ,"Section2_Married"
                ,"Section2A_MoreThanOneSpouse"
                ,"Section3_ExServiceMan"
                ,"Section3A_ServiceRendered"
                ,"Section3B_ServiceDurationFrom"
                ,"Section3B_ServiceDurationTo"
                ,"Section3C_ServiceYear"
                ,"Section3C_ServiceMonth"
                ,"Section3C_ServiceDay"
                ,"Section4_IsSportsPerson"
                ,"Section4A_SportsParticipated"
                ,"Section4B_SportsOthers"
                ,"Section4C_SportsFedAssName"
                ,"Section4B_WantsRelaxation"
                ,"Section4B_RelaxationHeight"
                ,"Section4B_RelaxationChest"
                ,"Section4B_RelaxationWeight"
                ,"Section5A_ParticipateEvent"
                ,"Section5B_SportsCategory"
                ,"Section5C_SportsMedal"
                ,"Section6_NCCCertificate"
                ,"Section6A_NCCCertificateCategory"
                ,"Section7A_RegNo"
                ,"Section7A_RegDate"
                ,"Section7B_NameEmpExchg"
                ,"Section8_HasDL"
                ,"Section8A_LicenseVehicle"
                ,"Section8B_LicenseNo"
                ,"Section8B_LicenseDate"
                ,"Section8C_NameRTOOffice"
                ,"Section9_InvolvedCriminal"
                ,"Section9A_ArrestDetail"
                ,"Section9B_CaseRefNo"
                ,"Section9C_District"
                ,"Section9D_PoliceStationNo"
                ,"Section9E_IPCSection"
                , "Religion"
                , "Category"
                , "Nationality"
                , "JSONData"
                , "ImageSign"
                , "EduState"
                , "EduNameOfBoard"
                , "EduNameOfExamination"
                , "EduPassingYear"
                , "EduGrade"
                , "EduExamCleared"
                , "EduTotalMarks"
                , "EduMarkSecured"
                , "EduPercentage"
                , "Section5"
                , "Section7B_District"
                , "Section8C_District"
                , "ChoiceofPreference"
                , "SecondPreference"
                , "stdcode"
                , "Section9C_State"
                , "ResponseType"

                , "BattalionName"
                , "Issuedate"
                , "FormNumber"
                , "DDNumber"
                , "IssueBankName"
                , "IssueDDNumber"
                , "IssueDateOd200Rs"
                , "Amount"

            };

            System.Data.DataTable result = null;
            string UID = "";
            CitizenProfileBLL t_CitizenProfileBLL = new CitizenProfileBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            string CurrentAddressXML = GetOISFProfileAddressXML(Data);
            string t_Password = GenPassword();
            Data.Password = t_Password;
            Data.CurrentAddressXML = CurrentAddressXML;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);

            result = t_CitizenProfileBLL.InsertOISFProfileDataOffLine(Data, AFields);
            string t_LoginID = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText;
            MailID = CCMailID = BCCMailID = Subject = MailText = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["Mobile"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                UID = result.Rows[0]["aadhaarNumber"].ToString();

                MailID = result.Rows[0]["MailID"].ToString();
                CCMailID = result.Rows[0]["CCMailID"].ToString();
                BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                Subject = result.Rows[0]["Subject"].ToString();
                MailText = result.Rows[0]["MailText"].ToString();


                MailText = @"


<!doctype html>
<html>
<head>
    <title>LOKASEBA ADHIKARA - Confirmation Email</title>    
</head>
<body style=""font-family: ''Andada'' , serif; background-color: #E0E0E0;"">
    <div style=""margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff;"">
        <table style=""padding: 1% 0; width: 100%"">
            <tr>
                <td align=""left"">
                    <img src=""http://g2cservices.in/g2c/img/lokaseba_logo.png"" alt=""LOKASEBA ADHIKARA""
                        style=""margin-left: 5%; height: 60px;"" />
                </td>
                <td align=""right"">
                    <img src=""http://g2cservices.in/WebApp/Kiosk/OISF/img/odisha_policelogo.jpg"" alt=""Odisha Police""
                        style=""margin-right: 5%; height: 60px;"" />
                </td>
            </tr>
        </table>

        <div style=""position: relative; background: #10A5DF; border: 1px solid #0C7FB5;"">
            <h1 style=""color: #fff; font-size: 20px; line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); text-transform: uppercase; font-family: arial;"">Recruitment of Constables&nbsp; 2016 - 2017</h1>
        </div>
        <div style=""margin: 5% 5% 0;"">
            <p>
                Dear @Name,
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Thank you for Registrating in Recruitment of Constables in 9th SIRB<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">&nbsp;</span>
            </p>
            <p style="" font-family: Calibri, sans-serif;
            font-size: 11pt;
            color: rgb(0, 0, 0);
            letter-spacing: normal;margin: 0in 0in 0.0001pt; font-variant: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                The Login detail for LOKASEBA ADHIKAR (Common Application Portal - CAP) is</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                LOGIN ID : <b>@Login</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                PASSWORD : <b>@Password</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>The login detail to be used for</b> </div>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>
                    <li>Make Payment (no payment for SC and ST)
                    </li>
                    <li>Upload the payment detail (only if the payment is made throught SB-Collect)
                    </li>
                    <li>Download e-Pass for
                <ul>
                    <li>Physical Measurment</li>
                    <li>Physical Efficiency Test (those who have qualified in Physical Measurment)</li>
                    <li>Written Examination (those who have qualified in Physical Measurment and Physical Efficiency)</li>
                </ul>
                    </li>
                    <li>Date of events and Results
                    </li>
                </ul>

            </div>
            </div>
        <hr />
        <div style=""margin:0 5% 5%;"">
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Your Application for Recruitment of Constables in 9th SIRB is Saved successfully.<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: maroon; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                Your Reference ID is <b>@AppID</b>.</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>
                    <li>Please upload the supporting documents / certificates
                    </li>
                    <li>Make payment (no payment for SC and ST category) againt the Reference ID 
                        <ul>
                            <li>either at any CSC centre (<a href=""/g2c/forms/CenterList.aspx"" target=""_blank"">CSC centers in Odisha</a>) .
                            </li>
                            <li>or through SB-Collect (<a href=""https://www.onlinesbi.com/prelogin/icollecthome.htm?corpID=792927"" target=""_blank"">SBI link</a>)
                            </li>
                        </ul>
                    </li>
                    <li>After Payment,&nbsp; 
                uploaded the payment detail (only if payment is done through SB-Collect) to&nbsp; <a href=""https://lokaseba-odisha.in/Account/Login"" target=""_blank"">LOKASEBA ADHIKAR</a> portal after login through above login details.
            </div>
            
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>PLEASE NOTE : </b>If the payment detail is not uploaded, the Application for Recruitment of Constables in 9th SIRB shall be considered invalid. 
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">Regards</span>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13); font-weight: bold;"">LOKASEBA ADHIKARA<br />
                    Common Application Portal (CAP), Odisha</span>
            </p>
        </div>
    </div>
</body>
</html>
";
                MailText = MailText.Replace("@AppID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", UID);

                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                if (Data.CitizenProfileID != null && Data.CitizenProfileID != "")
                {

                }
                else
                {
                    SendSMS(Data.Mobile,
                        "You've registered for Constables Recruitment, The login detail is LOGIN ID : " + UID +
                        " PASSWORD : " + t_Password + ". From Lokaseba Adhikara, CAP, Odisha Govt.", "388",
                        result.Rows[0]["AppID"].ToString(), UID);
                }
                SendSMS(Data.Mobile, "Your Application for Recruitment in Constables is Saved successfully. Your Reference ID is " + result.Rows[0]["AppID"].ToString() + ". Please upload the necessay document and make payment, otherwises the form shall considered invalid. From Lokaseba Adhikara -CAP, Odisha Govt.", "388", result.Rows[0]["AppID"].ToString(), UID);
                SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "388", result.Rows[0]["AppID"].ToString(), UID);
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        //battalion implementation
        public string InsertConstableData(OISFProfile_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {


                 "Religion"
                ,"Category"
                ,"Nationality"

                ,"Section1_PassOdia"
                ,"Section1_AbililtyRead"
                ,"Section1_AbilityWrite"
                ,"Section1_AbilitySpeak"
                ,"Section2_Married"
                ,"Section2A_MoreThanOneSpouse"

                ,"Section3_ExServiceMan"
                ,"Section3A_ServiceRendered"
                ,"Section3B_ServiceDurationFrom"
                ,"Section3B_ServiceDurationTo"
                ,"Section3C_ServiceYear"
                ,"Section3C_ServiceMonth"
                ,"Section3C_ServiceDay"

                ,"Section4_IsSportsPerson"
                ,"Section4A_SportsParticipated"
                ,"Section4B_SportsOthers"
                ,"Section4B_WantsRelaxation"

                ,"Section4B_RelaxationHeight"
                ,"Section4B_RelaxationChest"
                ,"Section4B_RelaxationWeight"

                ,"Section5A_ParticipateEvent"
                ,"Section5B_SportsCategory"
                ,"Section5C_SportsMedal"

                ,"Section6_NCCCertificate"
                ,"Section6A_NCCCertificateCategory"

                ,"Section7A_RegNo"
                ,"Section7A_RegDate"
                ,"Section7B_NameEmpExchg"

                ,"Section8_HasDL"
                ,"Section8A_LicenseVehicle"
                ,"Section8B_LicenseNo"
                ,"Section8B_LicenseDate"
                ,"Section8C_NameRTOOffice"

                ,"Section9_InvolvedCriminal"
                ,"Section9A_ArrestDetail"
                ,"Section9B_CaseRefNo"
                ,"Section9C_District"
                ,"Section9D_PoliceStationNo"
                ,"Section9E_IPCSection"

                ,"CreatedBy"
                ,"CreatedOn"
                ,"ClientIP"

                ,"aadhaarNumber"
                ,"department"
                ,"district"
                ,"block"
                ,"panchayat"
                ,"office"
                ,"officer"
            };

            System.Data.DataTable result = null;
            string UID = "";
            OISFBLL t_OISFBLL = new OISFBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            string CurrentAddressXML = GetOISFProfileAddressXML(Data);
            string t_Password = GenPassword();
            Data.Password = t_Password;
            Data.CurrentAddressXML = CurrentAddressXML;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);

            result = t_OISFBLL.InsertConstableData(Data, AFields);
            string t_LoginID = "";
            if (result.Rows.Count > 0)
            {
                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(Data.Mobile, "Your profile created sucessfully, The login detail is LOGIN ID : " + UID + " PASSWORD : " + t_Password + " -- From Lokaseba Adhikara, CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string GetEducationBoard(string prefix, string StateCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            OISFBLL t_OISFBLL = new OISFBLL();
            System.Data.DataTable dtDistrict = t_OISFBLL.GetEducationBoard(StateCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["EducationBoardCode"],
                        Name = sdr["EducationBoardName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetEmploymentExchange(string prefix, string DistrictCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            OISFBLL t_OISFBLL = new OISFBLL();
            System.Data.DataTable dtEmploymentExchange = t_OISFBLL.GetEmploymentExchange(DistrictCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtEmploymentExchange.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["OFFCODE"],
                        Name = sdr["OFFICENAME"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetRTOList(string prefix, string DistrictCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            OISFBLL t_OISFBLL = new OISFBLL();
            System.Data.DataTable dtRTOList = t_OISFBLL.GetRTOList(DistrictCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtRTOList.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["OFFCODE"],
                        Name = sdr["OFFICE"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetPoliceStation(string prefix, string StateCode, string DistrictCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            OISFBLL t_OISFBLL = new OISFBLL();
            System.Data.DataTable dtRTOList = t_OISFBLL.GetPoliceStation(StateCode, DistrictCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtRTOList.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["PoliceStationID"],
                        Name = sdr["PoliceStationName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string CheckMobileNo(string MobileNo)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            System.Data.DataTable result = null;

            ServiceResult t_ServiceResult = new ServiceResult();
            CitizenRegistrationBLL t_CitizenRegistrationBLL = new CitizenRegistrationBLL();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            result = t_CitizenRegistrationBLL.CheckMobileNo(MobileNo);

            if (result.Rows.Count > 0)
            {
                t_ServiceResult.AppID = result.Rows[0]["MobileNo"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertMenialData(MenialStaffProfile_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "aadhaarNumber"
                , "action"
                , "careOf"
                , "careOfLocal"
                , "dateOfBirth"
                , "district"
                , "districtLocal"
                , "emailId"
                , "gender"
                , "houseNumber"
                , "houseNumberLocal"
                , "landmark"
                , "landmarkLocal"
                , "language"
                , "locality"
                , "localityLocal"
                , "phone"
                , "pincode"
                , "pincodeLocal"
                , "postOffice"
                , "postOfficeLocal"
                , "residentName"
                , "residentNameLocal"
                , "responseCode"
                , "state"
                , "stateLocal"
                , "street"
                , "streetLocal"
                , "subDistrict"
                , "subDistrictLocal"
                , "timestamp"
                , "ttl"
                , "vtc"
                , "vtcLocal"
                , "IsActive"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
                , "Image"
                , "Mobile"
                , "CurrentAddressXML"
                , "CitizenProfileID"
                , "Village"
                , "Password"
                , "statecode"
                , "districtcode"
                , "subDistrictcode"
                , "Villagecode"
                ,"Section1_PassOdia"
                ,"Section1_AbililtyRead"
                ,"Section1_AbilityWrite"
                ,"Section1_AbilitySpeak"
                ,"Section2_Married"
                ,"Section2A_MoreThanOneSpouse"
                ,"Section3_ExServiceMan"
                ,"Section3A_ServiceRendered"
                ,"Section3B_ServiceDurationFrom"
                ,"Section3B_ServiceDurationTo"
                ,"Section3C_ServiceYear"
                ,"Section3C_ServiceMonth"
                ,"Section3C_ServiceDay"
                ,"Section4_IsSportsPerson"
                ,"Section4A_SportsParticipated"
                ,"Section4B_SportsOthers"
                ,"Section4B_WantsRelaxation"
                ,"Section4B_RelaxationHeight"
                ,"Section4B_RelaxationChest"
                ,"Section4B_RelaxationWeight"
                ,"Section5A_ParticipateEvent"
                ,"Section5B_SportsCategory"
                ,"Section5C_SportsMedal"
                ,"Section6_NCCCertificate"
                ,"Section6A_NCCCertificateCategory"
                ,"Section7A_RegNo"
                ,"Section7A_RegDate"
                ,"Section7B_NameEmpExchg"
                ,"Section8_HasDL"
                ,"Section8A_LicenseVehicle"
                ,"Section8B_LicenseNo"
                ,"Section8B_LicenseDate"
                ,"Section8C_NameRTOOffice"
                ,"Section9_InvolvedCriminal"
                ,"Section9A_ArrestDetail"
                ,"Section9B_CaseRefNo"
                ,"Section9C_District"
                ,"Section9D_PoliceStationNo"
                ,"Section9E_IPCSection"
                , "Religion"
                , "Category"
                , "Nationality"
                , "JSONData"
                , "ImageSign"
                , "InstituteName"
                , "InstituteAddress"
                , "PassingYear"


            };

            System.Data.DataTable result = null;
            string UID = "";
            MenialStaffBLL t_MenialStaffBLL = new MenialStaffBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            string CurrentAddressXML = GetMenialStaffAddressXML(Data);
            string t_Password = GenPassword();
            Data.Password = t_Password;
            Data.CurrentAddressXML = CurrentAddressXML;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);

            result = t_MenialStaffBLL.InsertMenialStaffData(Data, AFields);
            string t_LoginID = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["Mobile"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                UID = result.Rows[0]["aadhaarNumber"].ToString();
                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                SendSMS(Data.Mobile, "You've registered for Constables Recruitment, The login detail is LOGIN ID : " + UID + " PASSWORD : " + t_Password + ". From Lokaseba Adhikara, CAP, Odisha Govt.");
                SendSMS(Data.Mobile, "Your Application for Recruitment in Constables is Saved successfully. Your Reference ID is " + result.Rows[0]["AppID"].ToString() + ". Please upload the necessay document and make payment, otherwises the form shall considered invalid. From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        /*
         * This Logic is rectified properly w.r.t Current Address Issue         
         */
        private string GetMenialStaffAddressXML(MenialStaffProfile_DT Data)
        {

            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "CurrentAddress";

            //, , , , , , , , ;
            //public string subDistrict, subDistrictLocal, district, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal

            dtCurrentTable.Columns.Add(new DataColumn("phouseNumber", typeof(string)));
            //dtCurrentTable.Columns.Add(new DataColumn("pcareOf", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ppostOffice", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plocality", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plandmark", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstreet", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pvillage", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("psubDistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pdistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstate", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pincode", typeof(string)));

            drCurrentRow = dtCurrentTable.NewRow();

            drCurrentRow["phouseNumber"] = Data.phouseNumber == null ? "" : Data.phouseNumber.Trim();
            //drCurrentRow["pcareOf"] = Data.pcareOf == null ? "" : Data.pcareOf.Trim();
            drCurrentRow["ppostOffice"] = Data.ppostOffice == null ? "" : Data.ppostOffice.Trim();//OK
            drCurrentRow["plocality"] = Data.plocality == null ? "" : Data.plocality.Trim();
            drCurrentRow["plandmark"] = Data.plandmark == null ? "" : Data.plandmark.Trim();
            drCurrentRow["pstreet"] = Data.pstreet == null ? "" : Data.pstreet.Trim();
            drCurrentRow["pvillage"] = Data.pvillage == null ? "" : Data.pvillage.Trim();
            drCurrentRow["psubDistrict"] = Data.psubDistrict == null ? "" : Data.psubDistrict.Trim();
            drCurrentRow["pdistrict"] = Data.pdistrict == null ? "" : Data.pdistrict.Trim();
            drCurrentRow["pstate"] = Data.pstate == null ? "" : Data.pstate.Trim();
            drCurrentRow["pincode"] = Data.ppincode == null ? "" : Data.ppincode.Trim();

            dtCurrentTable.Rows.Add(drCurrentRow);

            System.Data.DataTable dtprogXML = dtCurrentTable;

            string CurrentAddressXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "CurrentAddressXML";
            dtprogXML.WriteXml(swriter);
            CurrentAddressXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return CurrentAddressXML;
        }

        public string GetBatallionList(string CategoryCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            MenialStaffBLL t_MenialStaffBLL = new MenialStaffBLL();
            System.Data.DataTable dtRTOList = t_MenialStaffBLL.GetBatallionList(CategoryCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtRTOList.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["BattalionID"],
                        Name = sdr["NameofBattalions"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetInstituteMaster()
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            MigrationBLL t_MigrationBLL = new MigrationBLL();
            System.Data.DataTable dtInstituteMaster = t_MigrationBLL.GetInstituteMaster();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtInstituteMaster.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["InstitueCode"],
                        Name = sdr["InstituteName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }
        public string GetInstituteMasterlegacy()
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            MigrationBLL t_MigrationBLL = new MigrationBLL();
            System.Data.DataTable dtInstituteMaster = t_MigrationBLL.GetInstituteMasterlegacy();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtInstituteMaster.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["InstitueCode"],
                        Name = sdr["InstituteName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetInstituteMasterITI()
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            MigrationBLL t_MigrationBLL = new MigrationBLL();
            System.Data.DataTable dtInstituteMaster = t_MigrationBLL.GetInstituteMasterITI();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtInstituteMaster.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["InstitueCode"],
                        Name = sdr["InstituteName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetBranchMaster()
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            MigrationBLL t_MigrationBLL = new MigrationBLL();
            System.Data.DataTable dtBranchMaster = t_MigrationBLL.GetBranchMaster();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtBranchMaster.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["BranchCode"],
                        Name = sdr["BranchName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }
        public string GetBranchMasterlegacy()
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            MigrationBLL t_MigrationBLL = new MigrationBLL();
            System.Data.DataTable dtBranchMaster = t_MigrationBLL.GetBranchMasterlegacy();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtBranchMaster.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["BranchCode"],
                        Name = sdr["BranchName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetITICourseMaster()
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            MigrationBLL t_MigrationBLL = new MigrationBLL();
            System.Data.DataTable dtBranchMaster = t_MigrationBLL.GetITICourseMaster();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtBranchMaster.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["BranchCode"],
                        Name = sdr["BranchName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));

        }
        public string GetSubject(string SemesterCode, string BranchCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            MigrationBLL t_MigrationBLL = new MigrationBLL();
            System.Data.DataTable dtSubjectMaster = t_MigrationBLL.GetSubject(SemesterCode, BranchCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtSubjectMaster.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["SubjectID"],
                        Name = sdr["SubjectName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetSemester(string SvcID)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            MigrationBLL t_MigrationBLL = new MigrationBLL();
            System.Data.DataTable dtSubjectMaster = t_MigrationBLL.GetSemester(SvcID);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtSubjectMaster.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["SemesterCode"],
                        Name = sdr["SemesterName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string InsertManualDetail(string BattalionID, string DraftNo, string FormNo)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            System.Data.DataTable result = null;
            OISFBLL t_OISFBLL = new OISFBLL();

            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            result = t_OISFBLL.InsertManualDetail(BattalionID, DraftNo, FormNo, KioskID);

            if (result.Rows.Count > 0)
            {
                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertEPassLog(string RollNo, string AppId)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            //List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = "";// GetCulture(objSessionTuple);
            string KioskID = "Citizen";// GetKioskID(objSessionTuple);

            System.Data.DataTable result = null;
            OISFBLL t_OISFBLL = new OISFBLL();

            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            result = t_OISFBLL.InsertEPassLog(RollNo, AppId);

            if (result.Rows.Count > 0)
            {
                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }
        public class Authority
        {
            public string ServiceName { get; set; }
            public string TimeLimit { get; set; }
            public string DesignatedOfficer { get; set; }
            public string AppellateAuthority { get; set; }
            public string RevisionalAuthority { get; set; }
            public string FAQURL { get; set; }
            public string HideOfficerPanel { get; set; }
        }
        public class ServiceResult
        {
            public string AppID { get; set; }
            public string RefundID { get; set; }
            public string Status { get; set; }
            public int intStatus { get; set; }
            public string EditAppID { get; set; }
            public string RollNo { get; set; }
            public string UID { get; set; }

            public string message { get; set; }
        }

        public class ServiceResultForSeniorCitizen
        {
            public string AppID { get; set; }
            public string RefundID { get; set; }
            public string Status { get; set; }
            public int intStatus { get; set; }
            public string EditAppID { get; set; }
            public string CardNo { get; set; }
            public string District { get; set; }
            public string PoliceStation { get; set; }
            public string AadhaarNo { get; set; }

        }

        public class NoticeString
        {
            public string NoticeNumber { get; set; }

            public string NoticeType { get; set; }
            public string NoticeHeading { get; set; }
            public string NoticeDetail { get; set; }
            public string NoticeDate { get; set; }
            public string SearchText { get; set; }
            public string FromDate { get; set; }
            public string ToDate { get; set; }
        }

        public class DrillDownGrid
        {
            public string AdmissionYear { get; set; }
            public string CollegeCode { get; set; }
            public string BranchCode { get; set; }
            public string Honours { get; set; }
            public string StudentCount { get; set; }
            public string RollNo { get; set; }
            public string Name { get; set; }
            
        }
        public string GetEAppealServices(string prefix)
        {
            //string dbName = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("SQLServer", "DB");
            //List<string> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<string>>("SQLServer", "DB");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ServicesBLL t_ServicesBLL = new ServicesBLL();
            System.Data.DataTable DTServices = t_ServicesBLL.GetEAppealServices();
            //List<ServiceDepartment> Category = new List<ServiceDepartment>();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = DTServices.CreateDataReader())
            {
                while (sdr.Read())
                {
                    //Category.Add(new ServiceDepartment
                    //{
                    //    ServiceID = sdr["ServiceCode"].ToString(),
                    //    DepartmentID = sdr["DeptID"].ToString(),
                    //    DepartmentName = sdr["DepartmentName"].ToString(),
                    //    URL = sdr["URL"].ToString()
                    //});
                    Category.Add(new
                    {
                        Id = sdr["ServiceCode"],
                        Name = sdr["ServiceName"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetEAppealDeptServices(string prefix, string DepartmentCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ServicesBLL t_ServicesBLL = new ServicesBLL();
            System.Data.DataTable DTServices = t_ServicesBLL.GetEAppealDeptServices(DepartmentCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = DTServices.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["ServiceCode"],
                        Name = sdr["ServiceName"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetEAppealDepartment(string prefix)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ServicesBLL t_ServicesBLL = new ServicesBLL();
            System.Data.DataTable dtDistrict = t_ServicesBLL.GetEAppealDepartment();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["DepartmentID"],
                        Name = sdr["DepartmentName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetEAppealDepartmentCode(string prefix, string DepartmentCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ServicesBLL t_ServicesBLL = new ServicesBLL();
            System.Data.DataTable dtDistrict = t_ServicesBLL.GetEAppealDepartmentCode(DepartmentCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["DepartmentID"],
                        Name = sdr["DepartmentName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetOfficeName(string prefix, string ServiceCode, string DepartmentCode, string DistrictCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ServicesBLL t_ServicesBLL = new ServicesBLL();
            System.Data.DataTable dtDistrict = t_ServicesBLL.GetOfficeName(ServiceCode, DepartmentCode, DistrictCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["SlNo"],
                        Name = sdr["OfficeName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string InsertEAppeal(EAppeal_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "aadhaarNumber"
                , "ProfileID"
                , "ServicesID"
                , "Services"
                , "DepartmentID"
                , "DepartmentName"
                , "DistrictID"
                , "DistrictName"

                , "ComplaintDept"
                , "ReferenceID"
                , "ApplicationDate"
                , "ComplaintID"
                , "ComplaintType"
                , "OfficerName"
                , "OfficeName"
                , "ComplaintDescription"
                , "ConcernedOfficer"
                , "ConcernedOffice"

                , "department"
                , "district"
                , "block"
                , "panchayat"
                , "office"
                , "officer"

            };

            System.Data.DataTable result = null;
            string AppID = "";
            ComplaintRegistrationBLL t_ComplaintRegistrationBLL = new ComplaintRegistrationBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_ComplaintRegistrationBLL.InsertEAppeal(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Complaint has been registered successfully. Your Reference ID is " + AppID + ". Thank You, From Odisha Lokaseba Adhikara -CAP, Odisha Govt.");

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string BindEAppealAppleteAuthority(string prefix, string ServiceCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");
            List<object> AppleteAuthority = new List<object>();
            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ServicesBLL t_ServicesBLL = new ServicesBLL();
            System.Data.DataTable dtAuthority = t_ServicesBLL.EAppealAppleteAuthority(ServiceCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtAuthority.CreateDataReader())
            {
                //while (sdr.Read())
                //{
                //    Category.Add(new
                //    {
                //        Id = sdr["OfficerCode"],
                //        Name = sdr["OfficerName"]

                //    });
                //}

                foreach (DataRow dtrow in dtAuthority.Rows)
                {
                    Authority authority = new Authority();
                    authority.ServiceName = dtrow["ServiceName"].ToString();
                    authority.TimeLimit = dtrow["TimeLimit"].ToString();
                    authority.DesignatedOfficer = dtrow["DesignatedOfficer"].ToString();
                    authority.AppellateAuthority = dtrow["AppellateAuthority"].ToString();
                    authority.RevisionalAuthority = dtrow["RevisionalAuthority"].ToString();
                    authority.FAQURL = dtrow["FAQURL"].ToString();
                    authority.HideOfficerPanel = dtrow["HideOfficerPanel"].ToString();
                    AppleteAuthority.Add(authority);
                }
            }
            return (new JavaScriptSerializer().Serialize(AppleteAuthority));
        }

        public string InsertFinancialAssistance(FinancialAssistance_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
            "aadhaarNumber",
            "ServiceID",
            "Category",
            "RegistrationNumber",
            "TypeOfInstitute",
            "InstituteName",
            "Branch",
            "AdmissionYear",
            "CurrentSemester",
            "DODSemester",
            "DateOfDeath",
            "AnnualIncome",
            "StudentType",
            "LodgingBoard",
            "Conveyance",
            "TuitionFee",
            "StudyBooks",
            "StudyMaterial",
            "DevelopmentFee",
            "ExaminationFee",
            "TuitionFeeWaiver",
            "TotalFeeAmt",
            "ScholarshipScheme",
            "SchemeName",
            "SchemeAmount",
            "BankName",
            "AccountHolderName",
            "BankAccountNo",
            "BankIFSCcode",
            "IssuingAuthorityName",
            "IssuingAddress",
            "IssuingContactNo",
            "IssuingEmailId",
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
            FinancialAssistanceBLL t_FinancialAssistanceBLL = new FinancialAssistanceBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_FinancialAssistanceBLL.InsertFinancialAssistance(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertFinancialAssistance2(FinancialAssistance2_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

        "aadhaarNumber",
        "RegistrationNumber",
        "AdmissionYear",
        "Semester",
        "Branch",
        "TypeOfInstitute",
        "InstituteName",
        "Category",
        "AnnualIncome",
        "FinancingGuardianName",
        "FinancingGuardianRelation",
        "BankName",
        "AccountHolderName",
        "BankAccountNo",
        "BankIFSCcode",
        "IssuingAuthorityName",
        "IssuingAddress",
        "IssuingContactNo",
        "IssuingEmailId",
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
            FinancialAssistanceBLL t_FinancialAssistanceBLL = new FinancialAssistanceBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_FinancialAssistanceBLL.InsertFinancialAssistance2(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertFinancialAssistance3(FinancialAssistance3_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

        "aadhaarNumber",
        "RegistrationNumber",
        "AdmissionYear",
        "Semester",
        "Branch",
        "TypeOfInstitute",
        "InstituteName",
        "Category",
        "AnnualIncome",
        "FinancingGuardianName",
        "FinancingGuardianRelation",
        "BankName",
        "AccountHolderName",
        "BankAccountNo",
        "BankIFSCcode",
        "IssuingAuthorityName",
        "IssuingAddress",
        "IssuingContactNo",
        "IssuingEmailId",
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
            FinancialAssistanceBLL t_FinancialAssistanceBLL = new FinancialAssistanceBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_FinancialAssistanceBLL.InsertFinancialAssistance3(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertFinancialAssistance4(FinancialAssistance4_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

        "aadhaarNumber",
        "RegistrationNumber",
        "AdmissionYear",
        "Semester",
        "Branch",
        "TypeOfInstitute",
        "InstituteName",
        "Category",
        "AnnualIncome",
        "FinancingGuardianName",
        "FinancingGuardianRelation",
        "BankName",
        "AccountHolderName",
        "BankAccountNo",
        "BankIFSCcode",
        "IssuingAuthorityName",
        "IssuingAddress",
        "IssuingContactNo",
        "IssuingEmailId",
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
            FinancialAssistanceBLL t_FinancialAssistanceBLL = new FinancialAssistanceBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_FinancialAssistanceBLL.InsertFinancialAssistance4(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertMutation(Mutation_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "aadhaarNumber"
                ,"ProfileID"
                ,"OriginalAllotee"
                ,"FatherName"
                ,"DeathIssuingAuthority"
                ,"DeathLetterNo"
                ,"DCIssueDate"
                ,"HeirshipIssuingAuthority"
                ,"MiscCaseNo"
                ,"HeirshipIssueDate"
                ,"AddressLine1"
                ,"AddressLine2"
                ,"RoadName"
                ,"LandMark"
                ,"Locality"
                ,"AStateCode"
                ,"ADistrictCode"
                ,"ASubDistrictCode"
                ,"AVillageCode"
                ,"PinCode"
                ,"PDistrict"
                ,"PBlock"
                ,"PMouza"
                ,"DrawingNo"
                ,"PlotNo"
                ,"AllottedArea"
                ,"AreaUnit"
                ,"RevenuePlotNo"
                ,"PossessionDate"
                ,"RentAmount"
                ,"LandUsed"
                ,"LandUsedType"
                ,"RegistrationNo"
                ,"RYear"
                ,"DeedBookNo"
                ,"DeedVolumeNo"
                ,"FromPageDeedNo"
                ,"ToPageDeedNo"
                ,"IsRegistered"
                ,"DeedNo"
                ,"DeedDate"
                ,"IsConstruted"
                ,"IsHoldingTaxAccessed"
                ,"IsNonResidential"
                ,"IsMortgaged"
                ,"MortgagedNo"
                ,"MortgagedBank"
                ,"MortgagedBranch"
                ,"IsDisputed"
                ,"IsMutation"
                ,"IsUnauthorisedConstruction"
                ,"GroundRentPaid"
                ,"LegalHeirName"
                ,"LegalHeirFather"
                ,"LesseeRelation"
                ,"Remark"
                ,"KhataNo"
                ,"CreatedBy"
                ,"CreatedOn"
                ,"ClientIP"
                ,"department"
                ,"district"
                ,"block"
                ,"panchayat"
                ,"office"
                ,"officer"
                ,"HeirsDXML"

            };

            System.Data.DataTable result = null;
            string AppID = "";
            ConversionBLL t_ConversionBLL = new ConversionBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_ConversionBLL.InsertMutation(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your MBPY Application is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string GetExamCenter(string prefix)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            OUATBLL t_OUATBLL = new OUATBLL();
            System.Data.DataTable dtBranchMaster = t_OUATBLL.GetExamCenter();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtBranchMaster.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["ExamCenterID"],
                        Name = sdr["ExamCenterName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }


        //No Changes in Function
        public string InsertOUATApp(OUATProfile_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "aadhaarNumber"
                , "action"
                , "careOf"
                , "careOfLocal"
                , "dateOfBirth"
                , "district"
                , "districtLocal"
                , "emailId"
                , "gender"
                , "houseNumber"
                , "houseNumberLocal"
                , "landmark"
                , "landmarkLocal"
                , "language"
                , "locality"
                , "localityLocal"
                , "phone"
                , "pincode"
                , "pincodeLocal"
                , "postOffice"
                , "postOfficeLocal"
                , "residentName"
                , "residentNameLocal"
                , "responseCode"
                , "state"
                , "stateLocal"
                , "street"
                , "streetLocal"
                , "subDistrict"
                , "subDistrictLocal"
                , "timestamp"
                , "ttl"
                , "vtc"
                , "vtcLocal"
                , "IsActive"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
                , "Image"
                , "Mobile"
                , "CurrentAddressXML"
                , "CitizenProfileID"
                , "Village"
                , "Password"
                , "statecode"
                , "districtcode"
                , "subDistrictcode"
                , "Villagecode"

                , "Section1_ReservedSeat"
                , "Section1A_SeatCategory"

                ,"Section2_PassOdia"
                ,"Section2_AbililtyRead"
                ,"Section2_AbilityWrite"
                ,"Section2_AbilitySpeak"
                , "MILSubject"

                ,"Section3_ExServiceMan"
                ,"Section3A_ServiceRendered"
                ,"Section3B_ServiceDurationFrom"
                ,"Section3B_ServiceDurationTo"
                ,"Section3C_ServiceYear"
                ,"Section3C_ServiceMonth"
                ,"Section3C_ServiceDay"
                ,"Section4_IsSportsPerson"
                ,"Section4A_SportsParticipated"
                ,"Section4B_SportsOthers"
                ,"Section4C_SportsFedAssName"
                ,"Section4B_WantsRelaxation"
                ,"Section4B_RelaxationHeight"
                ,"Section4B_RelaxationChest"
                ,"Section4B_RelaxationWeight"
                ,"Section5A_ParticipateEvent"
                ,"Section5B_SportsCategory"
                ,"Section5C_SportsMedal"
                ,"Section6_NCCCertificate"
                ,"Section6A_NCCCertificateCategory"

                , "Section6_1_IsOUATEmployee"
                , "Section6_1_OUATEmployeeName"
                , "Section6_1_OUATEmployeeCode"
                , "Section6_1_OUATEmployeeDesignation"
                , "Section6_1_OUATEmployeeStatus"
                , "Section6_1_OUATEmployeeOffice"
                , "Section6_1_OUATEmployeeRelation"


                , "Religion"
                , "Category"
                , "Nationality"
                , "JSONData"
                , "ImageSign"

                , "EduRollNo"
                , "EduState"
                , "EduNameOfBoard"
                , "EduNameOfExamination"
                , "EduPassingYear"
                , "EduGrade"
                //, "EduExamCleared"
                , "EduTotalMarks"
                , "EduMarkSecured"
                , "EduPercentage"

                , "Edu2RollNo"
                , "Edu2State"
                , "Edu2NameOfBoard"
                , "Edu2NameOfExamination"
                , "Edu2PassingYear"
                , "Edu2Grade"
                //, "EduExamCleared"
                , "Edu2TotalMarks"
                , "Edu2MarkSecured"
                , "Edu2Percentage"

                , "EduRollNoAgro"
                , "EduStateAgro"
                , "EduNameOfBoardAgro"
                , "EduNameOfExaminationAgro"
                , "EduPassingYearAgro"
                , "EduGradeAgro"
                //, "EduExamCleared"
                , "EduTotalMarksAgro"
                , "EduMarkSecuredAgro"
                , "EduPercentageAgro"

                , "Section5"
                , "stdcode"
                , "ResponseType"
            };

            System.Data.DataTable result = null;
            string UID = "";
            CitizenProfileBLL t_CitizenProfileBLL = new CitizenProfileBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            string CurrentAddressXML = GetOUATCurrentAddressXML(Data);
            string t_Password = GenPassword();
            Data.Password = t_Password;
            Data.CurrentAddressXML = CurrentAddressXML;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);

            result = t_CitizenProfileBLL.InsertOUATApp(Data, AFields);
            string t_LoginID = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText;
            MailID = CCMailID = BCCMailID = Subject = MailText = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["Mobile"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                UID = result.Rows[0]["aadhaarNumber"].ToString();

                MailID = result.Rows[0]["MailID"].ToString();
                CCMailID = result.Rows[0]["CCMailID"].ToString();
                BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                Subject = result.Rows[0]["Subject"].ToString();
                MailText = result.Rows[0]["MailText"].ToString();


                MailText = @"


<!doctype html>
<html>
<head>
    <title>LOKASEBA ADHIKARA - Confirmation Email</title>    
</head>
<body style=""font-family: ''Andada'' , serif; background-color: #E0E0E0;"">
    <div style=""margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff;"">
        <table style=""padding: 1% 0; width: 100%"">
            <tr>
                <td align=""left"">
                    <img src=""http://g2cservices.in/g2c/img/lokaseba_logo.png"" alt=""LOKASEBA ADHIKARA""
                        style=""margin-left: 5%; height: 60px;"" />
                </td>
                <td align=""right"">
                    <img src=""http://g2cservices.in/WebApp/Kiosk/OISF/img/odisha_policelogo.jpg"" alt=""Odisha Police""
                        style=""margin-right: 5%; height: 60px;"" />
                </td>
            </tr>
        </table>

        <div style=""position: relative; background: #10A5DF; border: 1px solid #0C7FB5;"">
            <h1 style=""color: #fff; font-size: 20px; line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); text-transform: uppercase; font-family: arial;"">Recruitment of Constables&nbsp; 2016 - 2017</h1>
        </div>
        <div style=""margin: 5% 5% 0;"">
            <p>
                Dear @Name,
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Thank you for Registrating in Recruitment of Constables in 9th SIRB<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">&nbsp;</span>
            </p>
            <p style="" font-family: Calibri, sans-serif;
            font-size: 11pt;
            color: rgb(0, 0, 0);
            letter-spacing: normal;margin: 0in 0in 0.0001pt; font-variant: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                The Login detail for LOKASEBA ADHIKAR (Common Application Portal - CAP) is</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                LOGIN ID : <b>@Login</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                PASSWORD : <b>@Password</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>The login detail to be used for</b> </div>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>
                    <li>Make Payment (no payment for SC and ST)
                    </li>
                    <li>Upload the payment detail (only if the payment is made throught SB-Collect)
                    </li>
                    <li>Download e-Pass for
                <ul>
                    <li>Physical Measurment</li>
                    <li>Physical Efficiency Test (those who have qualified in Physical Measurment)</li>
                    <li>Written Examination (those who have qualified in Physical Measurment and Physical Efficiency)</li>
                </ul>
                    </li>
                    <li>Date of events and Results
                    </li>
                </ul>

            </div>
            </div>
        <hr />
        <div style=""margin:0 5% 5%;"">
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Your Application for Recruitment of Constables in 9th SIRB is Saved successfully.<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: maroon; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                Your Reference ID is <b>@AppID</b>.</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>
                    <li>Please upload the supporting documents / certificates
                    </li>
                    <li>Make payment (no payment for SC and ST category) againt the Reference ID 
                        <ul>
                            <li>either at any CSC centre (<a href=""/g2c/forms/CenterList.aspx"" target=""_blank"">CSC centers in Odisha</a>) .
                            </li>
                            <li>or through SB-Collect (<a href=""https://www.onlinesbi.com/prelogin/icollecthome.htm?corpID=792927"" target=""_blank"">SBI link</a>)
                            </li>
                        </ul>
                    </li>
                    <li>After Payment,&nbsp; 
                uploaded the payment detail (only if payment is done through SB-Collect) to&nbsp; <a href=""https://lokaseba-odisha.in/Account/Login"" target=""_blank"">LOKASEBA ADHIKAR</a> portal after login through above login details.
            </div>
            
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>PLEASE NOTE : </b>If the payment detail is not uploaded, the Application for Recruitment of Constables in 9th SIRB shall be considered invalid. 
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">Regards</span>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13); font-weight: bold;"">LOKASEBA ADHIKARA<br />
                    Common Application Portal (CAP), Odisha</span>
            </p>
        </div>
    </div>
</body>
</html>
";
                MailText = MailText.Replace("@AppID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", UID);

                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                if (Data.CitizenProfileID != null && Data.CitizenProfileID != "")
                {

                }
                else
                {
                    SendSMS(Data.Mobile,
                        "You've registered for Constables Recruitment, The login detail is LOGIN ID : " + UID +
                        " PASSWORD : " + t_Password + ". From Lokaseba Adhikara, CAP, Odisha Govt.", "388",
                        result.Rows[0]["AppID"].ToString(), UID);
                }
                SendSMS(Data.Mobile, "Your Application for Recruitment in Constables is Saved successfully. Your Reference ID is " + result.Rows[0]["AppID"].ToString() + ". Please upload the necessay document and make payment, otherwises the form shall considered invalid. From Lokaseba Adhikara -CAP, Odisha Govt.", "388", result.Rows[0]["AppID"].ToString(), UID);
                SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "388", result.Rows[0]["AppID"].ToString(), UID);
                //USE THIS FUNTION FOR MAIL
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }


        public string InsertOUATFormA(OUATFormA_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "aadhaarNumber"
                , "action"
                , "careOf"
                , "careOfLocal"
                , "dateOfBirth"
                , "district"
                , "districtLocal"
                , "emailId"
                , "gender"
                , "houseNumber"
                , "houseNumberLocal"
                , "landmark"
                , "landmarkLocal"
                , "language"
                , "locality"
                , "localityLocal"
                , "phone"
                , "pincode"
                , "pincodeLocal"
                , "postOffice"
                , "postOfficeLocal"
                , "residentName"
                , "residentNameLocal"
                , "responseCode"
                , "state"
                , "stateLocal"
                , "street"
                , "streetLocal"
                , "subDistrict"
                , "subDistrictLocal"
                , "timestamp"
                , "ttl"
                , "vtc"
                , "vtcLocal"
                , "IsActive"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
                , "Image"
                , "Mobile"
                , "CurrentAddressXML"
                , "CitizenProfileID"
                , "Village"
                , "Password"
                , "statecode"
                , "districtcode"
                , "subDistrictcode"
                , "Villagecode"


                ,"Section1_PassOdia"
                ,"Section1_AbililtyRead"
                ,"Section1_AbilityWrite"
                ,"Section1_AbilitySpeak"

                , "FirstChoiceOfExaminationCenter"
                , "SecondChoiceOfExaminationCenter"
                , "ThirdChoiceOfExaminationCenter"
                , "MotherName"
                , "MotherTongue"

                , "Religion"
                , "Category"
                , "Nationality"
                , "JSONData"
                , "ImageSign"

                , "stdcode"
                , "ResidentType"
                , "ResponseType"
                ,"EditAppID"
            };

            System.Data.DataTable result = null;
            string UID = "";
            CitizenProfileBLL t_CitizenProfileBLL = new CitizenProfileBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            string CurrentAddressXML = GetOUATFormACurrentAddressXML(Data);
            string t_Password = GenPassword();
            Data.Password = t_Password;
            Data.CurrentAddressXML = CurrentAddressXML;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);

            result = t_CitizenProfileBLL.InsertOUATFormA(Data, AFields);
            string t_LoginID = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText;
            MailID = CCMailID = BCCMailID = Subject = MailText = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["Mobile"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                UID = result.Rows[0]["aadhaarNumber"].ToString();

                MailID = result.Rows[0]["MailID"].ToString();
                CCMailID = result.Rows[0]["CCMailID"].ToString();
                BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                Subject = result.Rows[0]["Subject"].ToString();
                MailText = result.Rows[0]["MailText"].ToString();


                MailText = @"


<!doctype html>
<html>
<head>
    <title>LOKASEBA ADHIKARA - Confirmation Email</title>    
</head>
<body style=""font-family: ''Andada'' , serif; background-color: #E0E0E0;"">
    <div style=""margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff;"">
        <table style=""padding: 1% 0; width: 100%"">
            <tr>
                <td align=""left"">
                    <img src=""https://www.lokaseba-odisha.in/g2c/img/lokaseba_logo.png"" alt=""LOKASEBA ADHIKARA""
                        style=""margin-left: 5%; height: 60px;"" />
                </td>
                <td align=""right"">
                    <img src=""https://www.lokaseba-odisha.in/WebApp/Kiosk/Images/OUAT.png"" alt=""OUAT""
                        style=""margin-right: 5%; height: 60px;"" />
                </td>
            </tr>
        </table>

        <div style=""position: relative; background: #10A5DF; border: 1px solid #0C7FB5;"">
            <h1 style=""color: #fff; font-size: 20px; line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); text-transform: uppercase; font-family: arial;"">ADMISSION INTO Diploma COURSES OF OUAT   2017-18</h1>
        </div>
        <div style=""margin: 5% 5% 0;"">
            <p>
                Dear @Name,
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Thank you for Applying for OUAT Common Entrance Examination 2017-18<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">&nbsp;</span>
            </p>
            <p style="" font-family: Calibri, sans-serif;
            font-size: 11pt;
            color: rgb(0, 0, 0);
            letter-spacing: normal;margin: 0in 0in 0.0001pt; font-variant: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                The Login details  to access https://www.lokaseba-odisha.in (Common Application Portal - CAP) are</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                LOGIN ID : <b>@Login</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                PASSWORD : <b>@Password</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>The login detail to be used for</b> </div>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>
                    <li>Making Payment of Unpaid Application (through Online Payment Gateway OR at any CSC)
                    </li>
                    <li>Checking the Application Status
                    </li>
                    <li>Downloading the Admit Card for OUAT Common Entrance examination - 2017                
                    </li>
                    <li>Filling of FORM-B after the anouncment of +2Sc. Result
                    </li>
                </ul>

            </div>
            </div>
        <hr />
        <div style=""margin:0 5% 5%;"">
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Your Application for Common Entrance Examination in OUAT is Saved successfully.<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: maroon; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                Your Application No. is <b>@AppID</b>.</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>                    
                    <li>Make payment againt the Application No. 
                        <ul>
						<li>either through Online Payment Gateway after Login into  <a href=""https://lokaseba-odisha.in/Account/Login"" target=""_blank"">LOKASEBA ADHIKAR</a> portal through above login details.
                            </li>
                            <li>or at any CSC (<a href=""/g2c/forms/CenterList.aspx"" target=""_blank"">Janaseba Kendra in Odisha</a>) .
                            </li>
                            
                        </ul>
                    </li>
			 </div>
            
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>PLEASE NOTE : </b>If the Application fee (Rs 1050.00) against the application @AppID is not paid  then the application shall be rejected. 
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">Regards</span>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13); font-weight: bold;"">Orissa University of Agriculture & Technology<br />
                    Bhubaneswar, Odisha</span>
            </p>
        </div>
    </div>
</body>
</html>
";
                MailText = MailText.Replace("@AppID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", UID);

                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                if (Data.CitizenProfileID != null && Data.CitizenProfileID != "")
                {

                }
                else
                {
                    SendSMS(Data.Mobile,
                        "You've registered for OUATCEE - 2017, The login detail is LOGIN ID : " + UID +
                        " PASSWORD : " + t_Password + ". From OUAT, Bhubaneswar.", "388",
                        result.Rows[0]["AppID"].ToString(), UID);
                }
                SendSMS(Data.Mobile, "Your Application for OUATCEE - 2017 is Saved successfully. Your Application No. is " + result.Rows[0]["AppID"].ToString() + ". Please make payment, otherwises the Form shall considered invalid. From OUAT, Bhubaneswar.", "388", result.Rows[0]["AppID"].ToString(), UID);
                SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "388", result.Rows[0]["AppID"].ToString(), UID);
                //USE THIS FUNTION FOR MAIL
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string GetOUATFormADataForEdit(string prefix, string UID, string AppID)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            //BasicDetailsBLL t_BasicDetailsBLL = new BasicDetailsBLL();
            //System.Data.DataSet dtUID = t_BasicDetailsBLL.GetUIDKeyField(UID);

            OUATBLL t_OuatBLL = new OUATBLL();
            System.Data.DataSet dtUID = t_OuatBLL.GetOUATFormADataForEdit(UID, AppID);

            List<object> Category = new List<object>();
            //using (System.Data.DataTableReader sdr = dtUID.CreateDataReader())
            //{
            //    while (sdr.Read())
            //    {
            //        Category.Add(new
            //        {
            //            Name = sdr["JSIONData"]

            //        });
            //    }
            //}


            DataTable t_AadhaarData = null;
            DataTable t_AadhaarAddress = null;
            DataTable t_AadhaarImg = null;
            DataTable t_Sign = null;
            DataTable t_FORMA = null;
            DataTable t_Track = null;

            OUATFormA_DT t_OUATFormA_DT = new OUATFormA_DT();


            t_AadhaarData = dtUID.Tables[1];
            t_AadhaarAddress = dtUID.Tables[2];
            t_AadhaarImg = dtUID.Tables[3];
            t_Sign = dtUID.Tables[4];
            t_FORMA = dtUID.Tables[5];
            t_Track = dtUID.Tables[6];

            t_OUATFormA_DT.aadhaarNumber = t_AadhaarData.Rows[0]["aadhaarNumber"].ToString();
            //t_OUATFormA_DT.action = t_AadhaarData.Rows[0][""].ToString();
            t_OUATFormA_DT.residentName = t_AadhaarData.Rows[0]["residentName"].ToString();
            t_OUATFormA_DT.residentNameLocal = t_AadhaarData.Rows[0]["residentNameLocal"].ToString();
            t_OUATFormA_DT.careOf = t_AadhaarData.Rows[0]["careOf"].ToString();
            t_OUATFormA_DT.careOfLocal = t_AadhaarData.Rows[0]["careOfLocal"].ToString();
            t_OUATFormA_DT.dateOfBirth = t_AadhaarData.Rows[0]["dateOfBirth"].ToString();
            t_OUATFormA_DT.gender = t_AadhaarData.Rows[0]["gender"].ToString();
            t_OUATFormA_DT.phone = t_AadhaarData.Rows[0]["phone"].ToString();
            t_OUATFormA_DT.Mobile = t_AadhaarData.Rows[0]["Mobile"].ToString();
            t_OUATFormA_DT.emailId = t_AadhaarData.Rows[0]["emailId"].ToString();
            t_OUATFormA_DT.ResponseType = t_AadhaarData.Rows[0]["ResponseType"].ToString();

            t_OUATFormA_DT.houseNumber = t_AadhaarData.Rows[0]["houseNumber"].ToString();
            t_OUATFormA_DT.houseNumberLocal = t_AadhaarData.Rows[0]["houseNumberLocal"].ToString();

            t_OUATFormA_DT.landmark = t_AadhaarData.Rows[0]["landmark"].ToString();
            t_OUATFormA_DT.landmarkLocal = t_AadhaarData.Rows[0]["landmarkLocal"].ToString();

            t_OUATFormA_DT.locality = t_AadhaarData.Rows[0]["locality"].ToString();
            t_OUATFormA_DT.localityLocal = t_AadhaarData.Rows[0]["localityLocal"].ToString();

            t_OUATFormA_DT.street = t_AadhaarData.Rows[0]["street"].ToString();
            t_OUATFormA_DT.streetLocal = t_AadhaarData.Rows[0]["streetLocal"].ToString();

            t_OUATFormA_DT.postOffice = t_AadhaarData.Rows[0]["postOffice"].ToString();
            t_OUATFormA_DT.postOfficeLocal = t_AadhaarData.Rows[0]["postOfficeLocal"].ToString();

            t_OUATFormA_DT.state = t_AadhaarData.Rows[0]["state"].ToString();
            t_OUATFormA_DT.stateLocal = t_AadhaarData.Rows[0]["stateLocal"].ToString();
            t_OUATFormA_DT.district = t_AadhaarData.Rows[0]["district"].ToString();
            t_OUATFormA_DT.districtLocal = t_AadhaarData.Rows[0]["districtLocal"].ToString();
            t_OUATFormA_DT.subDistrict = t_AadhaarData.Rows[0]["subDistrict"].ToString();
            t_OUATFormA_DT.subDistrictLocal = t_AadhaarData.Rows[0]["subDistrictLocal"].ToString();
            t_OUATFormA_DT.Village = t_AadhaarData.Rows[0]["Village"].ToString();
            t_OUATFormA_DT.pincode = t_AadhaarData.Rows[0]["pincode"].ToString();
            t_OUATFormA_DT.pincodeLocal = t_AadhaarData.Rows[0]["pincodeLocal"].ToString();
            t_OUATFormA_DT.statecode = t_AadhaarData.Rows[0]["StateCode"].ToString();
            t_OUATFormA_DT.districtcode = t_AadhaarData.Rows[0]["DistrictCode"].ToString();
            t_OUATFormA_DT.subDistrictcode = t_AadhaarData.Rows[0]["BlockCode"].ToString();
            t_OUATFormA_DT.Villagecode = t_AadhaarData.Rows[0]["PanchayatCode"].ToString();

            t_OUATFormA_DT.Image = t_AadhaarImg.Rows[0]["ApplicantImageStr"].ToString();
            t_OUATFormA_DT.photo = t_AadhaarImg.Rows[0]["ApplicantImageStr"].ToString();

            t_OUATFormA_DT.phouseNumber = t_AadhaarAddress.Rows[0]["phouseNumber"].ToString();
            t_OUATFormA_DT.plandmark = t_AadhaarAddress.Rows[0]["plandmark"].ToString();
            t_OUATFormA_DT.plocality = t_AadhaarAddress.Rows[0]["plocality"].ToString();
            t_OUATFormA_DT.pstreet = t_AadhaarAddress.Rows[0]["pstreet"].ToString();
            t_OUATFormA_DT.ppincode = t_AadhaarAddress.Rows[0]["ppincode"].ToString();
            t_OUATFormA_DT.ppostOffice = t_AadhaarAddress.Rows[0]["ppostOffice"].ToString();

            t_OUATFormA_DT.pstate = t_AadhaarAddress.Rows[0]["pstate"].ToString();
            t_OUATFormA_DT.pdistrict = t_AadhaarAddress.Rows[0]["pdistrict"].ToString();
            t_OUATFormA_DT.psubDistrict = t_AadhaarAddress.Rows[0]["psubDistrict"].ToString();
            t_OUATFormA_DT.pvillage = t_AadhaarAddress.Rows[0]["pvillage"].ToString();

            t_OUATFormA_DT.ImageSign = t_Sign.Rows[0]["ImageSign"] != null &&
                                          t_Sign.Rows[0]["ImageSign"].ToString() != ""
                ? t_Sign.Rows[0]["ImageSign"].ToString()
                : "";

            t_OUATFormA_DT.MotherName = t_FORMA.Rows[0]["mothername"].ToString();
            t_OUATFormA_DT.Nationality = t_FORMA.Rows[0]["nationality"].ToString();
            t_OUATFormA_DT.MotherTongue = t_FORMA.Rows[0]["mothertongue"].ToString();
            t_OUATFormA_DT.Category = t_FORMA.Rows[0]["category"].ToString();
            t_OUATFormA_DT.Religion = t_FORMA.Rows[0]["religion"].ToString();
            t_OUATFormA_DT.AppID = t_FORMA.Rows[0]["AppID"].ToString();
            t_OUATFormA_DT.TrnID = t_Track.Rows[0]["TransactionID"].ToString();

            t_OUATFormA_DT.OriginalDateOfBirth = t_AadhaarData.Rows[0]["OriginalDateOfBirth"].ToString();

            t_OUATFormA_DT.FirstChoiceOfExaminationCenter = t_FORMA.Rows[0]["FirstChoiceOfExaminationCenter"].ToString();
            t_OUATFormA_DT.SecondChoiceOfExaminationCenter = t_FORMA.Rows[0]["SecondChoiceOfExaminationCenter"].ToString();
            t_OUATFormA_DT.ThirdChoiceOfExaminationCenter = t_FORMA.Rows[0]["ThirdChoiceOfExaminationCenter"].ToString();
            t_OUATFormA_DT.Section1_PassOdia = t_FORMA.Rows[0]["knowodia"].ToString();
            t_OUATFormA_DT.Section1_AbililtyRead = t_FORMA.Rows[0]["readodia"].ToString();
            t_OUATFormA_DT.Section1_AbilityWrite = t_FORMA.Rows[0]["writeodia"].ToString();
            t_OUATFormA_DT.Section1_AbilitySpeak = t_FORMA.Rows[0]["speakodia"].ToString();
            t_OUATFormA_DT.ResidentType = t_FORMA.Rows[0]["ResidentType"].ToString();

            //t_OUATFormA_DT.TransDate = Convert.ToDateTime(t_Track.Rows[0]["ModifiedOn"].ToString()).ToString("dd/MM/yyyy"); //getting Error --MOHAN KUMAR
            //return (new JavaScriptSerializer().Serialize(Category));
            return (new JavaScriptSerializer().Serialize(t_OUATFormA_DT));

        }

        public string InsertOUATFormB(OUATFormA_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields =
            {
                "aadhaarNumber"
                , "action"
                , "careOf"
                , "careOfLocal"
                , "dateOfBirth"
                , "district"
                , "districtLocal"
                , "emailId"
                , "gender"
                , "houseNumber"
                , "houseNumberLocal"
                , "landmark"
                , "landmarkLocal"
                , "language"
                , "locality"
                , "localityLocal"
                , "phone"
                , "pincode"
                , "pincodeLocal"
                , "postOffice"
                , "postOfficeLocal"
                , "residentName"
                , "residentNameLocal"
                , "responseCode"
                , "state"
                , "stateLocal"
                , "street"
                , "streetLocal"
                , "subDistrict"
                , "subDistrictLocal"
                , "timestamp"
                , "ttl"
                , "vtc"
                , "vtcLocal"
                , "IsActive"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
                , "Image"
                , "Mobile"
                , "CurrentAddressXML"
                , "CitizenProfileID"
                , "Village"
                , "Password"
                , "statecode"
                , "districtcode"
                , "subDistrictcode"
                , "Villagecode"

                , "Section1_ReservedSeat"
                , "Section1A_SeatCategory"

                , "Section1_PassOdia"
                , "Section1_AbililtyRead"
                , "Section1_AbilityWrite"
                , "Section1_AbilitySpeak"
                , "ResidentType"

                , "GreenCardHolder"
                , "Physicallyhandicapped"
                , "NRISponsership"
                , "WesternOdisha"
                , "OUATEmployee"
                , "Kashmirmigrant"
                , "HandicappedPart"
                , "HandicappedPercent"
                , "WesternDistrict"
                , "KMFrom"
                , "KMTo"

                //, "Section6_1_IsOUATEmployee"
                //, "Section6_1_OUATEmployeeName"
                //, "Section6_1_OUATEmployeeCode"
                //, "Section6_1_OUATEmployeeDesignation"
                //, "Section6_1_OUATEmployeeStatus"
                //, "Section6_1_OUATEmployeeOffice"
                //, "Section6_1_OUATEmployeeRelation"

                , "EduRollNo"
                //, "EduState"
                , "EduNameOfBoard"
                , "EduNameOfExamination"
                , "EduPassingYear"
                , "EduGrade"
                //, "EduExamCleared"
                , "EduTotalMarks"
                , "EduMarkSecured"
                , "EduPercentage"

                , "Edu2RollNo"
                //, "Edu2State"
                , "Edu2NameOfBoard"
                , "Edu2NameOfExamination"
                , "Edu2PassingYear"
                , "Edu2Grade"
                //, "EduExamCleared"
                , "Edu2TotalMarks"
                , "Edu2MarkSecured"
                , "Edu2Percentage"

                , "Religion"
                , "Category"
                , "Nationality"
                , "JSONData"
                , "ImageSign"

                , "stdcode"
                , "ResponseType"


                , "TMT_Physics"
                , "MOT_Physics"
                , "TMP_Physics"
                , "MOP_Physics"
                , "TMTP_Physics"
                , "TMOTP_Physics"
                , "TMT_Chemistry"
                , "MOT_Chemistry"
                , "TMP_Chemistry"
                , "MOP_Chemistry"
                , "TMTP_Chemistry"
                , "TMOTP_Chemistry"
                , "TMT_Math"
                , "MOT_Math"
                , "TMP_Math"
                , "MOP_Math"
                , "TMTP_Math"
                , "TMOTP_Math"
                , "TMT_Botany"
                , "MOT_Botany"
                , "TMP_Botany"
                , "MOP_Botany"
                , "TMTP_Botany"
                , "TMOTP_Botany"
                , "TMT_Zoology"
                , "MOT_Zoology"
                , "TMP_Zoology"
                , "MOP_Zoology"
                , "TMTP_Zoology"
                , "TMOTP_Zoology"
                , "PCMPercentage"
                , "TMT_PCM"
                , "MOT_PCM"
                , "TMP_PCM"
                , "MOP_PCM"
                , "TMTP_PCM"
                , "MOTP_PCM"
                , "TMT_PCB"
                , "MOT_PCB"
                , "TMP_PCB"
                , "MOP_PCB"
                , "TMTP_PCB"
                , "MOTP_PCB"
                , "PCBPercentage"
                , "ExamType"

                , "MotherName"
                , "MotherTongue"
                , "HandicapType"

            };

            System.Data.DataTable result = null;
            string UID = "";
            CitizenProfileBLL t_CitizenProfileBLL = new CitizenProfileBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            string CurrentAddressXML = GetOUATFormACurrentAddressXML(Data);
            string t_Password = GenPassword();
            Data.Password = t_Password;
            Data.CurrentAddressXML = CurrentAddressXML;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);

            result = t_CitizenProfileBLL.InsertOUATFormB(Data, AFields);
            string t_LoginID = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText;
            MailID = CCMailID = BCCMailID = Subject = MailText = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["Mobile"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                UID = result.Rows[0]["aadhaarNumber"].ToString();

                MailID = result.Rows[0]["MailID"].ToString();
                CCMailID = result.Rows[0]["CCMailID"].ToString();
                BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                Subject = result.Rows[0]["Subject"].ToString();
                MailText = result.Rows[0]["MailText"].ToString();


                MailText = @"


<!doctype html>
<html>
<head>
    <title>LOKASEBA ADHIKARA - Confirmation Email</title>    
</head>
<body style=""font-family: ''Andada'' , serif; background-color: #E0E0E0;"">
    <div style=""margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff;"">
        <table style=""padding: 1% 0; width: 100%"">
            <tr>
                <td align=""left"">
                    <img src=""https://www.lokaseba-odisha.in/g2c/img/lokaseba_logo.png"" alt=""LOKASEBA ADHIKARA""
                        style=""margin-left: 5%; height: 60px;"" />
                </td>
                <td align=""right"">
                    <img src=""https://www.lokaseba-odisha.in/WebApp/Kiosk/OUAT/images/OUAT.png"" alt=""Odisha Police""
                        style=""margin-right: 5%; height: 60px;"" />
                </td>
            </tr>
        </table>

        <div style=""position: relative; background: #10A5DF; border: 1px solid #0C7FB5;"">
            <h1 style=""color: #fff; font-size: 20px; line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); text-transform: uppercase; font-family: arial;"">Recruitment of Constables&nbsp; 2016 - 2017</h1>
        </div>
        <div style=""margin: 5% 5% 0;"">
            <p>
                Dear @Name,
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Thank you for Registrating in Recruitment of Constables in 9th SIRB<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">&nbsp;</span>
            </p>
            <p style="" font-family: Calibri, sans-serif;
            font-size: 11pt;
            color: rgb(0, 0, 0);
            letter-spacing: normal;margin: 0in 0in 0.0001pt; font-variant: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                The Login detail for LOKASEBA ADHIKAR (Common Application Portal - CAP) is</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                LOGIN ID : <b>@Login</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                PASSWORD : <b>@Password</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>The login detail to be used for</b> </div>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>
                    <li>Make Payment (no payment for SC and ST)
                    </li>
                    <li>Upload the payment detail (only if the payment is made throught SB-Collect)
                    </li>
                    <li>Download e-Pass for
                <ul>
                    <li>Physical Measurment</li>
                    <li>Physical Efficiency Test (those who have qualified in Physical Measurment)</li>
                    <li>Written Examination (those who have qualified in Physical Measurment and Physical Efficiency)</li>
                </ul>
                    </li>
                    <li>Date of events and Results
                    </li>
                </ul>

            </div>
            </div>
        <hr />
        <div style=""margin:0 5% 5%;"">
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Your Application for Recruitment of Constables in 9th SIRB is Saved successfully.<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: maroon; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                Your Reference ID is <b>@AppID</b>.</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>
                    <li>Please upload the supporting documents / certificates
                    </li>
                    <li>Make payment (no payment for SC and ST category) againt the Reference ID 
                        <ul>
                            <li>either at any CSC centre (<a href=""/g2c/forms/CenterList.aspx"" target=""_blank"">CSC centers in Odisha</a>) .
                            </li>
                            <li>or through SB-Collect (<a href=""https://www.onlinesbi.com/prelogin/icollecthome.htm?corpID=792927"" target=""_blank"">SBI link</a>)
                            </li>
                        </ul>
                    </li>
                    <li>After Payment,&nbsp; 
                uploaded the payment detail (only if payment is done through SB-Collect) to&nbsp; <a href=""https://lokaseba-odisha.in/Account/Login"" target=""_blank"">LOKASEBA ADHIKAR</a> portal after login through above login details.
            </div>
            
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>PLEASE NOTE : </b>If the payment detail is not uploaded, the Application for Recruitment of Constables in 9th SIRB shall be considered invalid. 
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">Regards</span>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13); font-weight: bold;"">LOKASEBA ADHIKARA<br />
                    Common Application Portal (CAP), Odisha</span>
            </p>
        </div>
    </div>
</body>
</html>
";
                MailText = MailText.Replace("@AppID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", UID);

                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                if (Data.CitizenProfileID != null && Data.CitizenProfileID != "")
                {

                }
                else
                {
                    //SendSMS(Data.Mobile,
                    //    "You've registered for Constables Recruitment, The login detail is LOGIN ID : " + UID +
                    //    " PASSWORD : " + t_Password + ". From Lokaseba Adhikara, CAP, Odisha Govt.", "388",
                    //    result.Rows[0]["AppID"].ToString(), UID);
                }
                //SendSMS(Data.Mobile, "Your Application for Recruitment in Constables is Saved successfully. Your Reference ID is " + result.Rows[0]["AppID"].ToString() + ". Please upload the necessay document and make payment, otherwises the form shall considered invalid. From Lokaseba Adhikara -CAP, Odisha Govt.", "388", result.Rows[0]["AppID"].ToString(), UID);
                SendSMS(Data.Mobile,
                    "Dear " + result.Rows[0]["Name"].ToString() +
                    ", You have successfully submitted the Application FORM - B for Admission into OUAT UG Courses 2017 with Roll no " +
                    result.Rows[0]["RollNo"].ToString() +
                    ". Please upload the relevant documents as mentioned in OUAT UG Prospectus 2017 - 18. Take print out of the submitted Application FORM - B after uploading all the documents.If selected submit the printed Application FORM - B along with photocopy(Xerox) of the documents at the time of Admission. Regards OUAT, Bhubaneswar",
                    "405", result.Rows[0]["AppID"].ToString(), UID);

                //SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "388", result.Rows[0]["AppID"].ToString(), UID);
                //USE THIS FUNTION FOR MAIL
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string GetOUATFormAData(string prefix, string UID)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            //BasicDetailsBLL t_BasicDetailsBLL = new BasicDetailsBLL();
            //System.Data.DataSet dtUID = t_BasicDetailsBLL.GetUIDKeyField(UID);

            OUATBLL t_OuatBLL = new OUATBLL();
            System.Data.DataSet dtUID = t_OuatBLL.GetOUATFormAData(UID);

            List<object> Category = new List<object>();
            //using (System.Data.DataTableReader sdr = dtUID.CreateDataReader())
            //{
            //    while (sdr.Read())
            //    {
            //        Category.Add(new
            //        {
            //            Name = sdr["JSIONData"]

            //        });
            //    }
            //}


            DataTable t_AadhaarData = null;
            DataTable t_AadhaarAddress = null;
            DataTable t_AadhaarImg = null;
            DataTable t_Sign = null;
            DataTable t_FORMA = null;
            DataTable t_Track = null;
            DataTable t_Exam = null;

            CitizenProfile_DT t_BasicDetails_DT = new CitizenProfile_DT();


            t_AadhaarData = dtUID.Tables[1];
            t_AadhaarAddress = dtUID.Tables[2];
            t_AadhaarImg = dtUID.Tables[3];
            t_Sign = dtUID.Tables[4];
            t_FORMA = dtUID.Tables[5];
            t_Track = dtUID.Tables[6];
            t_Exam = dtUID.Tables[7];

            t_BasicDetails_DT.aadhaarNumber = t_FORMA.Rows[0]["aadhaarNumber"].ToString();
            //t_BasicDetails_DT.action = t_AadhaarData.Rows[0][""].ToString();
            t_BasicDetails_DT.residentName = t_AadhaarData.Rows[0]["residentName"].ToString();
            t_BasicDetails_DT.residentNameLocal = t_AadhaarData.Rows[0]["residentNameLocal"].ToString();
            t_BasicDetails_DT.careOf = t_AadhaarData.Rows[0]["careOf"].ToString();
            t_BasicDetails_DT.careOfLocal = t_AadhaarData.Rows[0]["careOfLocal"].ToString();
            t_BasicDetails_DT.dateOfBirth = t_AadhaarData.Rows[0]["dateOfBirth"].ToString();
            t_BasicDetails_DT.gender = t_AadhaarData.Rows[0]["gender"].ToString();
            t_BasicDetails_DT.phone = t_AadhaarData.Rows[0]["phone"].ToString();
            t_BasicDetails_DT.Mobile = t_FORMA.Rows[0]["Mobile"].ToString();
            t_BasicDetails_DT.emailId = t_AadhaarData.Rows[0]["emailId"].ToString();
            t_BasicDetails_DT.ResponseType = t_AadhaarData.Rows[0]["ResponseType"].ToString();

            t_BasicDetails_DT.houseNumber = t_AadhaarData.Rows[0]["houseNumber"].ToString();
            t_BasicDetails_DT.houseNumberLocal = t_AadhaarData.Rows[0]["houseNumberLocal"].ToString();

            t_BasicDetails_DT.landmark = t_AadhaarData.Rows[0]["landmark"].ToString();
            t_BasicDetails_DT.landmarkLocal = t_AadhaarData.Rows[0]["landmarkLocal"].ToString();

            t_BasicDetails_DT.locality = t_AadhaarData.Rows[0]["locality"].ToString();
            t_BasicDetails_DT.localityLocal = t_AadhaarData.Rows[0]["localityLocal"].ToString();

            t_BasicDetails_DT.street = t_AadhaarData.Rows[0]["street"].ToString();
            t_BasicDetails_DT.streetLocal = t_AadhaarData.Rows[0]["streetLocal"].ToString();

            t_BasicDetails_DT.postOffice = t_AadhaarData.Rows[0]["postOffice"].ToString();
            t_BasicDetails_DT.postOfficeLocal = t_AadhaarData.Rows[0]["postOfficeLocal"].ToString();

            t_BasicDetails_DT.state = t_AadhaarData.Rows[0]["state"].ToString();
            t_BasicDetails_DT.stateLocal = t_AadhaarData.Rows[0]["stateLocal"].ToString();
            t_BasicDetails_DT.district = t_AadhaarData.Rows[0]["district"].ToString();
            t_BasicDetails_DT.districtLocal = t_AadhaarData.Rows[0]["districtLocal"].ToString();
            t_BasicDetails_DT.subDistrict = t_AadhaarData.Rows[0]["subDistrict"].ToString();
            t_BasicDetails_DT.subDistrictLocal = t_AadhaarData.Rows[0]["subDistrictLocal"].ToString();
            t_BasicDetails_DT.Village = t_AadhaarData.Rows[0]["Village"].ToString();
            t_BasicDetails_DT.pincode = t_AadhaarData.Rows[0]["pincode"].ToString();
            t_BasicDetails_DT.pincodeLocal = t_AadhaarData.Rows[0]["pincodeLocal"].ToString();
            t_BasicDetails_DT.statecode = t_AadhaarData.Rows[0]["StateCode"].ToString();
            t_BasicDetails_DT.districtcode = t_AadhaarData.Rows[0]["DistrictCode"].ToString();
            t_BasicDetails_DT.subDistrictcode = t_AadhaarData.Rows[0]["BlockCode"].ToString();
            t_BasicDetails_DT.Villagecode = t_AadhaarData.Rows[0]["PanchayatCode"].ToString();

            t_BasicDetails_DT.Image = t_AadhaarImg.Rows[0]["ApplicantImageStr"].ToString();
            t_BasicDetails_DT.photo = t_AadhaarImg.Rows[0]["ApplicantImageStr"].ToString();
            //t_BasicDetails_DT.aadhaarNumber = t_AadhaarImg.Rows[0]["aadhaarNumber"].ToString();

            t_BasicDetails_DT.phouseNumber = t_AadhaarAddress.Rows[0]["phouseNumber"].ToString();
            t_BasicDetails_DT.plandmark = t_AadhaarAddress.Rows[0]["plandmark"].ToString();
            t_BasicDetails_DT.plocality = t_AadhaarAddress.Rows[0]["plocality"].ToString();
            t_BasicDetails_DT.pstreet = t_AadhaarAddress.Rows[0]["pstreet"].ToString();
            t_BasicDetails_DT.ppincode = t_AadhaarAddress.Rows[0]["ppincode"].ToString();
            t_BasicDetails_DT.ppostOffice = t_AadhaarAddress.Rows[0]["ppostOffice"].ToString();

            t_BasicDetails_DT.pstate = t_AadhaarAddress.Rows[0]["pstate"].ToString();
            t_BasicDetails_DT.pdistrict = t_AadhaarAddress.Rows[0]["pdistrict"].ToString();
            t_BasicDetails_DT.psubDistrict = t_AadhaarAddress.Rows[0]["psubDistrict"].ToString();
            t_BasicDetails_DT.pvillage = t_AadhaarAddress.Rows[0]["pvillage"].ToString();

            t_BasicDetails_DT.ImageSign = t_Sign.Rows.Count > 0 && t_Sign.Rows[0]["ImageSign"] != null &&
                                          t_Sign.Rows[0]["ImageSign"].ToString() != ""
                ? t_Sign.Rows[0]["ImageSign"].ToString()
                : "";


            t_BasicDetails_DT.MotherName = t_FORMA.Rows[0]["mothername"].ToString();
            t_BasicDetails_DT.Nationality = t_FORMA.Rows[0]["nationality"].ToString();
            t_BasicDetails_DT.MotherTongue = t_FORMA.Rows[0]["mothertongue"].ToString();
            t_BasicDetails_DT.Category = t_FORMA.Rows[0]["category"].ToString();
            t_BasicDetails_DT.Religion = t_FORMA.Rows[0]["religion"].ToString();
            t_BasicDetails_DT.AppID = t_FORMA.Rows[0]["AppID"].ToString();
            t_BasicDetails_DT.TrnID = t_Track.Rows[0]["TransactionID"].ToString();
            t_BasicDetails_DT.TransDate = t_Track.Rows[0]["TransDate"].ToString();
            t_BasicDetails_DT.AppID = t_FORMA.Rows[0]["AppID"].ToString();
            t_BasicDetails_DT.RollNo = t_Exam.Rows[0]["rollnumber"].ToString();
            t_BasicDetails_DT.ExamCenter = t_Exam.Rows[0]["ExaminationCentre"].ToString();

            //t_BasicDetails_DT.TransDate = Convert.ToDateTime(t_Track.Rows[0]["ModifiedOn"].ToString()).ToString("dd/MM/yyyy"); //getting Error --MOHAN KUMAR
            //return (new JavaScriptSerializer().Serialize(Category));
            return (new JavaScriptSerializer().Serialize(t_BasicDetails_DT));
        }


        public string GetOUATAgroFormAData(string prefix, string UID)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            //BasicDetailsBLL t_BasicDetailsBLL = new BasicDetailsBLL();
            //System.Data.DataSet dtUID = t_BasicDetailsBLL.GetUIDKeyField(UID);

            OUATBLL t_OuatBLL = new OUATBLL();
            System.Data.DataSet dtUID = t_OuatBLL.GetOUATAgroFormAData(UID);

            List<object> Category = new List<object>();
            //using (System.Data.DataTableReader sdr = dtUID.CreateDataReader())
            //{
            //    while (sdr.Read())
            //    {
            //        Category.Add(new
            //        {
            //            Name = sdr["JSIONData"]

            //        });
            //    }
            //}

            DataTable t_AadhaarData = null;
            DataTable t_AadhaarAddress = null;
            DataTable t_AadhaarImg = null;
            DataTable t_Sign = null;
            DataTable t_FORMA = null;
            DataTable t_Track = null;
            DataTable t_Exam = null;

            CitizenProfile_DT t_BasicDetails_DT = new CitizenProfile_DT();

            t_AadhaarData = dtUID.Tables[1];
            t_AadhaarAddress = dtUID.Tables[2];
            t_AadhaarImg = dtUID.Tables[3];
            t_Sign = dtUID.Tables[4];
            t_FORMA = dtUID.Tables[5];
            t_Track = dtUID.Tables[6];
            t_Exam = dtUID.Tables[7];

            t_BasicDetails_DT.aadhaarNumber = t_AadhaarData.Rows[0]["aadhaarNumber"].ToString();
            //t_BasicDetails_DT.action = t_AadhaarData.Rows[0][""].ToString();
            t_BasicDetails_DT.residentName = t_AadhaarData.Rows[0]["residentName"].ToString();
            t_BasicDetails_DT.residentNameLocal = t_AadhaarData.Rows[0]["residentNameLocal"].ToString();
            t_BasicDetails_DT.careOf = t_AadhaarData.Rows[0]["careOf"].ToString();
            t_BasicDetails_DT.careOfLocal = t_AadhaarData.Rows[0]["careOfLocal"].ToString();
            t_BasicDetails_DT.dateOfBirth = t_AadhaarData.Rows[0]["dateOfBirth"].ToString();
            t_BasicDetails_DT.gender = t_AadhaarData.Rows[0]["gender"].ToString();
            t_BasicDetails_DT.phone = t_AadhaarData.Rows[0]["phone"].ToString();
            t_BasicDetails_DT.Mobile = t_AadhaarData.Rows[0]["Mobile"].ToString();
            t_BasicDetails_DT.emailId = t_AadhaarData.Rows[0]["emailId"].ToString();
            t_BasicDetails_DT.ResponseType = t_AadhaarData.Rows[0]["ResponseType"].ToString();

            t_BasicDetails_DT.houseNumber = t_AadhaarData.Rows[0]["houseNumber"].ToString();
            t_BasicDetails_DT.houseNumberLocal = t_AadhaarData.Rows[0]["houseNumberLocal"].ToString();

            t_BasicDetails_DT.landmark = t_AadhaarData.Rows[0]["landmark"].ToString();
            t_BasicDetails_DT.landmarkLocal = t_AadhaarData.Rows[0]["landmarkLocal"].ToString();

            t_BasicDetails_DT.locality = t_AadhaarData.Rows[0]["locality"].ToString();
            t_BasicDetails_DT.localityLocal = t_AadhaarData.Rows[0]["localityLocal"].ToString();

            t_BasicDetails_DT.street = t_AadhaarData.Rows[0]["street"].ToString();
            t_BasicDetails_DT.streetLocal = t_AadhaarData.Rows[0]["streetLocal"].ToString();

            t_BasicDetails_DT.postOffice = t_AadhaarData.Rows[0]["postOffice"].ToString();
            t_BasicDetails_DT.postOfficeLocal = t_AadhaarData.Rows[0]["postOfficeLocal"].ToString();

            t_BasicDetails_DT.state = t_AadhaarData.Rows[0]["state"].ToString();
            t_BasicDetails_DT.stateLocal = t_AadhaarData.Rows[0]["stateLocal"].ToString();
            t_BasicDetails_DT.district = t_AadhaarData.Rows[0]["district"].ToString();
            t_BasicDetails_DT.districtLocal = t_AadhaarData.Rows[0]["districtLocal"].ToString();
            t_BasicDetails_DT.subDistrict = t_AadhaarData.Rows[0]["subDistrict"].ToString();
            t_BasicDetails_DT.subDistrictLocal = t_AadhaarData.Rows[0]["subDistrictLocal"].ToString();
            t_BasicDetails_DT.Village = t_AadhaarData.Rows[0]["Village"].ToString();
            t_BasicDetails_DT.pincode = t_AadhaarData.Rows[0]["pincode"].ToString();
            t_BasicDetails_DT.pincodeLocal = t_AadhaarData.Rows[0]["pincodeLocal"].ToString();
            t_BasicDetails_DT.statecode = t_AadhaarData.Rows[0]["StateCode"].ToString();
            t_BasicDetails_DT.districtcode = t_AadhaarData.Rows[0]["DistrictCode"].ToString();
            t_BasicDetails_DT.subDistrictcode = t_AadhaarData.Rows[0]["BlockCode"].ToString();
            t_BasicDetails_DT.Villagecode = t_AadhaarData.Rows[0]["PanchayatCode"].ToString();

            t_BasicDetails_DT.Image = t_AadhaarImg.Rows[0]["ApplicantImageStr"].ToString();
            t_BasicDetails_DT.photo = t_AadhaarImg.Rows[0]["ApplicantImageStr"].ToString();

            t_BasicDetails_DT.phouseNumber = t_AadhaarAddress.Rows[0]["phouseNumber"].ToString();
            t_BasicDetails_DT.plandmark = t_AadhaarAddress.Rows[0]["plandmark"].ToString();
            t_BasicDetails_DT.plocality = t_AadhaarAddress.Rows[0]["plocality"].ToString();
            t_BasicDetails_DT.pstreet = t_AadhaarAddress.Rows[0]["pstreet"].ToString();
            t_BasicDetails_DT.ppincode = t_AadhaarAddress.Rows[0]["ppincode"].ToString();
            t_BasicDetails_DT.ppostOffice = t_AadhaarAddress.Rows[0]["ppostOffice"].ToString();

            t_BasicDetails_DT.pstate = t_AadhaarAddress.Rows[0]["pstate"].ToString();
            t_BasicDetails_DT.pdistrict = t_AadhaarAddress.Rows[0]["pdistrict"].ToString();
            t_BasicDetails_DT.psubDistrict = t_AadhaarAddress.Rows[0]["psubDistrict"].ToString();
            t_BasicDetails_DT.pvillage = t_AadhaarAddress.Rows[0]["pvillage"].ToString();

            t_BasicDetails_DT.ImageSign = t_Sign.Rows[0]["ImageSign"] != null &&
                                          t_Sign.Rows[0]["ImageSign"].ToString() != ""
                ? t_Sign.Rows[0]["ImageSign"].ToString()
                : "";

            t_BasicDetails_DT.MotherName = t_FORMA.Rows[0]["mothername"].ToString();
            t_BasicDetails_DT.Nationality = t_FORMA.Rows[0]["nationality"].ToString();
            t_BasicDetails_DT.MotherTongue = t_FORMA.Rows[0]["mothertongue"].ToString();
            t_BasicDetails_DT.Category = t_FORMA.Rows[0]["category"].ToString();
            t_BasicDetails_DT.Religion = t_FORMA.Rows[0]["religion"].ToString();
            t_BasicDetails_DT.AppID = t_FORMA.Rows[0]["AppID"].ToString();
            t_BasicDetails_DT.TrnID = t_Track.Rows[0]["TransactionID"].ToString();
            t_BasicDetails_DT.TransDate = t_Track.Rows[0]["TransDate"].ToString();
            t_BasicDetails_DT.AppID = t_FORMA.Rows[0]["AppID"].ToString();
            t_BasicDetails_DT.Discipline = t_FORMA.Rows[0]["AgroPolytechnicStream"].ToString();

            t_BasicDetails_DT.RollNo = t_Exam.Rows[0]["rollnumber"].ToString();
            t_BasicDetails_DT.ExamCenter = t_Exam.Rows[0]["ExaminationCentre"].ToString();
            //t_BasicDetails_DT.Discipline = t_Exam.Rows[0]["ExaminationCentre"].ToString();//TODO: Value to be fetched from DB
            //t_BasicDetails_DT.TransDate = Convert.ToDateTime(t_Track.Rows[0]["ModifiedOn"].ToString()).ToString("dd/MM/yyyy");
            //return (new JavaScriptSerializer().Serialize(Category));
            return (new JavaScriptSerializer().Serialize(t_BasicDetails_DT));
        }

        public string InsertMigrationNew(MigrationNew_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "aadhaarNumber"
                ,  "ProfileID"
                ,"BasicDetailType"
                ,"BasicDetailNumber"
                ,"RegistrationNo"
                ,"BranchName"
                ,"AdmissionYear"
                ,"InstituteLeavingDate"
                ,"InstituteName"
                ,"ExaminationDetails"
                ,"CertificateReason"
                ,"Title"
                ,"FullName"
                ,"Gender"
                ,"FatherHusbandName"
                ,"DOB"
                ,"Age"
                ,"EmailId"
                ,"MobileNo"
                ,"AltMobileNo"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
                , "department"
                , "district"
                , "block"
                , "panchayat"
                , "office"
                , "officer"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            MigrationBLL t_MigrationBLL = new MigrationBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_MigrationBLL.InsertMigrationNew(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string EAdmitCardLog(string RollNo, string AppId)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            //List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = "";// GetCulture(objSessionTuple);
            string KioskID = "Citizen";// GetKioskID(objSessionTuple);

            System.Data.DataTable result = null;
            OISFBLL t_OISFBLL = new OISFBLL();

            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            result = t_OISFBLL.EAdmitCardLog(RollNo, AppId);

            if (result.Rows.Count > 0)
            {
                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string ValidateOUATOTP(string UID, string EnteredOTP)
        {
            OTP_DT objOTP = new OTP_DT();
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "aadhaarNumber"
                ,"SMSID"
                ,"OTPCode"
                ,"OTPEntered"
                ,"ModifiedBy"
                ,"ModifiedOn"
                ,"MobileNo"
                ,"ClientIP"

            };

            System.Data.DataTable result = null;
            string[] temp = UID.Split('_');

            string tUID = temp[0], OTPCode = temp[1], VallidTill = temp[2], Mobile = temp[5], SMSID = temp[4];

            OTPBLL t_OTPBLL = new OTPBLL();
            ValidateUser validateUser = new ValidateUser();

            validateUser.AppID = "";
            validateUser.Status = "Error";
            validateUser.intStatus = 0;

            objOTP.aadhaarNumber = tUID;
            objOTP.SMSID = SMSID;
            objOTP.OTPCode = OTPCode;
            objOTP.OTPEntered = EnteredOTP;
            objOTP.validTill = Convert.ToDateTime(VallidTill);
            objOTP.MobileNo = Mobile;
            objOTP.ModifiedBy = KioskID;
            objOTP.ModifiedOn = DateTime.Now;

            result = t_OTPBLL.ValidateOUATOTP(objOTP, AFields);

            if (result.Rows.Count > 0)
            {
                validateUser.AppID = result.Rows[0]["AppID"].ToString();
                validateUser.Status = "Success";
                validateUser.intStatus = 1;

                validateUser.ResponseType = result.Rows[0]["ResponseType"].ToString();
                validateUser.Keyfield = result.Rows[0]["KeyField"].ToString();
                validateUser.ProfileID = result.Rows[0]["ProfileID"].ToString();


            }

            return (new JavaScriptSerializer().Serialize(validateUser));
        }


        public string InsertNewMigration(NewMigration_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "aadhaarNumber"
                ,  "ProfileID"
                ,"BasicDetailType"
                ,"BasicDetailNumber"
                ,"RegistrationNo"
                ,"BranchName"
                ,"AdmissionYear"
                ,"InstituteLeavingDate"
                ,"InstituteName"
                ,"ExaminationDetails"
                ,"CertificateReason"
                ,"Title"
                ,"FullName"
                ,"Gender"
                ,"FatherHusbandName"
                ,"DOB"
                ,"Age"
                ,"EmailId"
                ,"MobileNo"
                ,"AltMobileNo"
                ,"RollNo"
                ,"StudentName"
                ,"StudentFatherName"
                ,"StudentDOB"
                ,"StudentDOBYear"
                ,"StudentDOBMonth"
                ,"StudentDOBDay"
                ,"StudentGender"
                ,"StudentMobile"
                ,"StudentCategory"
                ,"StudentEmailId"
                ,"StudentAdmisionYear"
                ,"StudentInstituteName"
                ,"StudentBranchName"
                ,"StudentSemester"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
                , "department"
                , "district"
                , "block"
                , "panchayat"
                , "office"
                , "officer"
                , "RollNoValue"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            MigrationBLL t_MigrationBLL = new MigrationBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_MigrationBLL.InsertNewMigration(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertNewMigrationVerify(NewMigrationVerify_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "aadhaarNumber"
                ,  "ProfileID"
                ,"BasicDetailType"
                ,"BasicDetailNumber"
                ,"RegistrationNo"
                ,"BranchName"
                ,"AdmissionYear"
                ,"InstituteLeavingDate"
                ,"InstituteName"
                ,"ExaminationDetails"
                ,"CertificateReason"
                ,"Title"
                ,"FullName"
                ,"Gender"
                ,"FatherHusbandName"
                ,"DOB"
                ,"Age"
                ,"EmailId"
                ,"MobileNo"
                ,"AltMobileNo"
                ,"RollNo"
                ,"StudentName"
                ,"StudentFatherName"
                ,"StudentDOB"
                ,"StudentDOBYear"
                ,"StudentDOBMonth"
                ,"StudentDOBDay"
                ,"StudentGender"
                ,"StudentMobile"
                ,"StudentCategory"
                ,"StudentEmailId"
                ,"StudentAdmisionYear"
                ,"StudentInstituteName"
                ,"StudentBranchName"
                ,"StudentSemester"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
                , "department"
                , "district"
                , "block"
                , "panchayat"
                , "office"
                , "officer"
                , "RollNoValue"
                , "Attendance"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            MigrationBLL t_MigrationBLL = new MigrationBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_MigrationBLL.InsertNewMigrationVerify(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string GetAgroCentre(string prefix)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            OUATBLL t_OUATBLL = new OUATBLL();
            System.Data.DataTable dtAgroCentre = t_OUATBLL.GetAgroCentre();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtAgroCentre.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["centerid"],
                        Name = sdr["centername"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetAgroCourse(string prefix)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            OUATBLL t_OUATBLL = new OUATBLL();
            System.Data.DataTable dtAgroCourse = t_OUATBLL.GetAgroCourse();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtAgroCourse.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["courseid"],
                        Name = sdr["course"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string InsertOUATAgroFormA(OUATAgroFormA_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "aadhaarNumber"
                , "action"
                , "careOf"
                , "careOfLocal"
                , "dateOfBirth"
                , "district"
                , "districtLocal"
                , "emailId"
                , "gender"
                , "houseNumber"
                , "houseNumberLocal"
                , "landmark"
                , "landmarkLocal"
                , "language"
                , "locality"
                , "localityLocal"
                , "phone"
                , "pincode"
                , "pincodeLocal"
                , "postOffice"
                , "postOfficeLocal"
                , "residentName"
                , "residentNameLocal"
                , "responseCode"
                , "state"
                , "stateLocal"
                , "street"
                , "streetLocal"
                , "subDistrict"
                , "subDistrictLocal"
                , "timestamp"
                , "ttl"
                , "vtc"
                , "vtcLocal"
                , "IsActive"
                , "CreatedBy"
                , "CreatedOn"
                , "ClientIP"
                , "Image"
                , "Mobile"
                , "CurrentAddressXML"
                , "CitizenProfileID"
                , "Village"
                , "Password"
                , "statecode"
                , "districtcode"
                , "subDistrictcode"
                , "Villagecode"

                , "MotherName"
                , "MotherTongue"
                , "Category"
                , "Religion"
                , "Nationality"
                , "AgroAdmisionNumber"
                , "AgroPolytechnicCenter"
                , "AgroPolytechnicStream"

                , "JSONData"
                , "ImageSign"

                , "ResidentType"
                , "ResponseType"
            };

            System.Data.DataTable result = null;
            string UID = "";
            CitizenProfileBLL t_CitizenProfileBLL = new CitizenProfileBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            string CurrentAddressXML = GetOUATAgroFormACurrentAddressXML(Data);
            string t_Password = GenPassword();
            Data.Password = t_Password;
            Data.CurrentAddressXML = CurrentAddressXML;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);

            result = t_CitizenProfileBLL.InsertOUATAgroFormA(Data, AFields);
            string t_LoginID = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText;
            MailID = CCMailID = BCCMailID = Subject = MailText = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["Mobile"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                UID = result.Rows[0]["aadhaarNumber"].ToString();

                MailID = result.Rows[0]["MailID"].ToString();
                CCMailID = result.Rows[0]["CCMailID"].ToString();
                BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                Subject = result.Rows[0]["Subject"].ToString();
                MailText = result.Rows[0]["MailText"].ToString();


                MailText = @"


<html>
<head>
    <title>LOKASEBA ADHIKARA - Confirmation Email</title>    
</head>
<body style=""font-family: ''Andada'' , serif; background-color: #E0E0E0;"">
    <div style=""margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff;"">
        <table style=""padding: 1% 0; width: 100%"">
            <tr>
                <td align=""left"">
                    <img src=""https://lokaseba-odisha.in/g2c/img/lokaseba_logo.png"" alt=""LOKASEBA ADHIKARA""
                        style=""margin-left: 5%; height: 60px;"" />
                </td>
                <td align=""right"">
                    <img src=""https://lokaseba-odisha.in/WebApp/Kiosk/Images/OUAT.png"" alt=""OUAT""
                        style=""margin-right: 5%; height: 60px;"" />
                </td>
            </tr>
        </table>

        <div style=""position: relative; background: #10A5DF; border: 1px solid #0C7FB5;"">
            <h1 style=""color: #fff; font-size: 20px; line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); text-transform: uppercase; font-family: arial;"">ADMISSION INTO UG COURSES OF OUAT 2017-18</h1>
        </div>
        <div style=""margin: 5% 5% 0;"">
            <p>
                Dear @Name,
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Thank you for Applying for OUAT Common Entrance Examination 2017<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">&nbsp;</span>
            </p>
            <p style="" font-family: Calibri, sans-serif;
            font-size: 11pt;
            color: rgb(0, 0, 0);
            letter-spacing: normal;margin: 0in 0in 0.0001pt; font-variant: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                The Login details  to access https://www.lokaseba-odisha.in  (Common Application Portal - CAP) are</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                LOGIN ID : <b>@Login</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                PASSWORD : <b>@Password</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>The login detail to be used for</b> </div>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>
                    <li>Making Payment of Unpaid Application (through Online Payment Gateway OR at any CSC)
                    </li>
                    <li>Checking the Application Status
                    </li>
                    <li>Downloading the Admit Card for OUAT Common Entrance examination - 2017                
                    </li>
                    <li>Filling of FORM-B after the anouncment of +2Sc.  Result
                    </li>
                </ul>

            </div>
            </div>
        <hr />
        <div style=""margin:0 5% 5%;"">
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Your Application for Common Entrance Examination in OUAT is Saved successfully.<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: maroon; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                Your Application No. is <b>@AppID</b>.</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>                    
                    <li>Make payment againt the Application No. 
                        <ul>
						<li>either through Online Payment Gateway after Login into  <a href=""https://lokaseba-odisha.in/Account/Login"" target=""_blank"">https://lokaseba-odisha.in</a> LOKASEBA ADHIKAR portal through above login details.
                            </li>
                            <li>or at any CSC centre (<a href=""/g2c/forms/CenterList.aspx"" target=""_blank"">Janaseba Kendra in Odisha</a>) .
                            </li>
                            
                        </ul>
                    </li>
			 </div>
            
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>PLEASE NOTE : </b>If the Application fee (Rs 1050.00) against the application No. @AppID is not paid then the application shall be rejected. 
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">Regards</span>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13); font-weight: bold;"">Orissa University of Agriculture & Technology,<br />
                    Bhubaneswar, Odisha.</span>
            </p>
        </div>
    </div>
</body>
</html>
";
                MailText = MailText.Replace("@AppID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", UID);

                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                if (Data.CitizenProfileID != null && Data.CitizenProfileID != "")
                {

                }
                else
                {
                    SendSMS(Data.Mobile,
                        "You've registered for OUATCEE - 2017, The login detail is LOGIN ID : " + UID +
                        " PASSWORD : " + t_Password + ". From OUAT, Bhubaneswar.", "388",
                        result.Rows[0]["AppID"].ToString(), UID);
                }
                SendSMS(Data.Mobile, "Your Application for OUATCEE - 2017 is Saved successfully. Your Application No. is " + result.Rows[0]["AppID"].ToString() + ". Please make payment, otherwises the Form shall considered invalid. From OUAT, Bhubaneswar.", "388", result.Rows[0]["AppID"].ToString(), UID);
                SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "388", result.Rows[0]["AppID"].ToString(), UID);
                //USE THIS FUNTION FOR MAIL
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }
        //code for send otp for username
        public string SendOtpForUsername(string prefix, string MobileNo, string email)
        {
            OTP_DT objOTP = new OTP_DT();
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "MobileNo"
                ,"SMSID"
                ,"OTPCode"
                ,"CreatedOn"
                ,"CreatedBy"
                ,"ClientIP"
                ,"email"
            };

            System.Data.DataTable result = null;

            string Mobile = "", EmailId = "", OTP = "", VallidTill = "", SMSID = "", UID = "";

            OTPBLL t_OTPBLL = new OTPBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            string SMSId = SMSUnqID();
            string OTPCode = GenOTPCode();

            //objOTP.aadhaarNumber = UID;
            objOTP.MobileNo = MobileNo;
            objOTP.email = email;
            objOTP.SMSID = SMSId;
            objOTP.OTPCode = OTPCode;

            objOTP.CreatedBy = KioskID;
            objOTP.CreatedOn = DateTime.Now;

            result = t_OTPBLL.InsertMobileOTP(objOTP, AFields);

            if (result.Rows.Count > 0)
            {
                if (result.Rows[0]["mobile"].ToString() != "")
                {
                    UID = result.Rows[0]["aadhaarNumber"].ToString();
                    Mobile = result.Rows[0]["Mobile"].ToString();
                    SMSID = result.Rows[0]["SMSID"].ToString();
                    OTP = result.Rows[0]["OTPCode"].ToString();
                    VallidTill = result.Rows[0]["validtill"].ToString();
                    t_ServiceResult.AppID = UID + "_" + OTP + "_" + VallidTill + "_" + MobileNo.Remove(3, 7).PadRight(8, 'X') + MobileNo.Remove(0, 8) + "_" + SMSID + "_" + MobileNo;
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;

                    SendSMS(result.Rows[0]["Mobile"].ToString(), "OTP for Username of Lokaseba Adhikara Odisha is " + OTP +
                        " and is valid for 10 minutes. Generated at " + VallidTill + " From Lokaseba Adhikara Odisha -CAP, Odisha Govt.");
                }
                else
                {
                    UID = result.Rows[0]["aadhaarNumber"].ToString();
                    email = result.Rows[0]["email"].ToString();
                    SMSID = result.Rows[0]["SMSID"].ToString();
                    OTP = result.Rows[0]["OTPCode"].ToString();
                    VallidTill = result.Rows[0]["validtill"].ToString();
                    t_ServiceResult.AppID = UID + "_" + OTP + "_" + VallidTill + "_" + email.Remove(3, 7).PadRight(8, 'X') + email.Remove(0, 8) + "_" + SMSID + "_" + email;
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;

                }

            }


            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }
        //
        // code for send username after confirm otp
        public string SendUsername(string UID, string EnteredOTP, string profileId)
        {
            OTP_DT objOTP = new OTP_DT();
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "aadhaarNumber"
                ,"SMSID"
                ,"OTPCode"
                ,"OTPEntered"
                ,"ModifiedBy"
                ,"ModifiedOn"
                ,"MobileNo"
                ,"ClientIP"


            };

            System.Data.DataTable result = null;
            string[] temp = UID.Split('_');

            string tUID = temp[0], OTPCode = temp[1], VallidTill = temp[2], Mobile = temp[5], SMSID = temp[4];

            OTPBLL t_OTPBLL = new OTPBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            objOTP.aadhaarNumber = tUID;
            objOTP.SMSID = SMSID;
            objOTP.OTPCode = OTPCode;
            objOTP.OTPEntered = EnteredOTP;
            if (OTPCode == EnteredOTP)
            {

                int NumLen = Mobile.ToString().Length;

                if (NumLen == 10)
                {
                    objOTP.validTill = Convert.ToDateTime(VallidTill);
                    objOTP.MobileNo = Mobile;
                    objOTP.ModifiedBy = KioskID;
                    objOTP.ModifiedOn = DateTime.Now;

                    result = t_OTPBLL.SendSMS(objOTP, AFields);
                    string appid = result.Rows[0]["appid"].ToString();
                    string app = appid.Substring(2, 12);
                    if (result.Rows.Count > 0)
                    {

                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "Success";
                        t_ServiceResult.intStatus = 1;
                        string randomPassword = CreateRandomPassword(8);

                        SendSMS(objOTP.MobileNo, "Your Login ID : " + profileId +
                            " From Lokaseba Adhikara Odisha.");
                        //History(profileId, randomPassword, Mobile, OTPCode);


                    }
                }
                else
                {

                    objOTP.validTill = Convert.ToDateTime(VallidTill);
                    objOTP.MobileNo = Mobile;
                    objOTP.ModifiedBy = KioskID;
                    objOTP.ModifiedOn = DateTime.Now;

                    result = t_OTPBLL.SendSMS(objOTP, AFields);
                    string appid = result.Rows[0]["appid"].ToString();
                    string app = appid.Substring(2, 12);
                    if (result.Rows.Count > 0)
                    {

                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "Success";
                        t_ServiceResult.intStatus = 1;
                        //string randomPassword = CreateRandomPassword(8);
                        //  History(profileId, randomPassword, Mobile, OTPCode);


                    }



                    else
                    {

                    }

                }

            }
            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }


        public string ValidateOUATOTPAgro(string UID, string EnteredOTP)
        {
            OTP_DT objOTP = new OTP_DT();
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "aadhaarNumber"
                ,"SMSID"
                ,"OTPCode"
                ,"OTPEntered"
                ,"ModifiedBy"
                ,"ModifiedOn"
                ,"MobileNo"
                ,"ClientIP"

            };

            System.Data.DataTable result = null;
            string[] temp = UID.Split('_');

            string tUID = temp[0], OTPCode = temp[1], VallidTill = temp[2], Mobile = temp[5], SMSID = temp[4];

            OTPBLL t_OTPBLL = new OTPBLL();
            ValidateUser validateUser = new ValidateUser();

            validateUser.AppID = "";
            validateUser.Status = "Error";
            validateUser.intStatus = 0;

            objOTP.aadhaarNumber = tUID;
            objOTP.SMSID = SMSID;
            objOTP.OTPCode = OTPCode;
            objOTP.OTPEntered = EnteredOTP;
            objOTP.validTill = Convert.ToDateTime(VallidTill);
            objOTP.MobileNo = Mobile;
            objOTP.ModifiedBy = KioskID;
            objOTP.ModifiedOn = DateTime.Now;

            result = t_OTPBLL.ValidateAgroOUATOTP(objOTP, AFields);

            if (result.Rows.Count > 0)
            {
                validateUser.AppID = result.Rows[0]["AppID"].ToString();
                validateUser.Status = "Success";
                validateUser.intStatus = 1;

                validateUser.ResponseType = result.Rows[0]["ResponseType"].ToString();
                validateUser.Keyfield = result.Rows[0]["KeyField"].ToString();
                validateUser.ProfileID = result.Rows[0]["ProfileID"].ToString();


            }

            return (new JavaScriptSerializer().Serialize(validateUser));
        }


        public string GetState_OUAT()
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL(culture);
            System.Data.DataTable dtState = t_KioskRegistrationBLL.GetState_OUAT();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtState.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["StateCode"],
                        Name = sdr["StateName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetBankName()
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL(culture);
            System.Data.DataTable dtState = t_KioskRegistrationBLL.GetBankName();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtState.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["BankCode"],
                        Name = sdr["BankName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }


        public string GetDistrict_OUAT(string prefix, string StateCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL(culture);
            System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetDistrict_OUAT(StateCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["DistrictCode"],
                        Name = sdr["DistrictName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }
        public string GetSeniorCitizenOdishaDist(string prefix, string StateCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL(culture);
            System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetSeniorCitizenOdishaDist(StateCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["DistrictCode"],
                        Name = sdr["DistrictName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetBlock_OUAT(string prefix, string DistrictCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL(culture);
            System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetBlock_OUAT(DistrictCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["BlockCode"],
                        Name = sdr["BlockName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }


        public string GetPanchayat_OUAT(string prefix, string SubDistrictCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL(culture);
            System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetPanchayat_OUAT(SubDistrictCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["PanchayatCode"],
                        Name = sdr["PanchayatName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }


        public string InsertComplaint(OUATComplaint_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            //List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            //string culture = GetCulture(objSessionTuple);
            //string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "aadhaarNumber"
                ,"AppName"
                ,"AppID"
                ,"FullName"
                ,"DOB"
                ,"EmailId"
                ,"MobileNo"
                ,"PaymentStatus"
                ,"ComplaintType"
                ,"ComplaintDetail"
                ,"OtherType"
                ,"BankRefNo"
                ,"SmsNo"
                ,"CreatedBy"
                ,"CreatedOn"
                , "department"
                , "district"
                , "block"
                , "panchayat"
                , "office"
                , "officer"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            string MobileNo = "";
            string SmsText = "";
            OUATBLL t_OUATBLL = new OUATBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            //Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_OUATBLL.InsertComplaint(Data, AFields);

            if (result.Rows.Count > 0)
            {
                MobileNo = result.Rows[0]["MobileNo"].ToString();
                SmsText = result.Rows[0]["SmsText"].ToString();

                if (MobileNo != null || MobileNo != "")
                {
                    SendSMS(MobileNo, SmsText);
                }

                AppID = result.Rows[0]["ComplaintID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }


        public string InsertRefund(OUATRefund_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            //List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            //string culture = GetCulture(objSessionTuple);
            //string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "aadhaarNumber"
                ,"AppName"
                ,"AppID"
                ,"FullName"
                ,"DOB"
                ,"EmailId"
                ,"MobileNo"
                ,"PaymentStatus"
                ,"ReFundDetail"
                ,"SmsNo"
                ,"NameOfAccountHolder"
                ,"AccountNumber"
                ,"IFSCCode"
                ,"BackName"
                ,"BankBranch"
                ,"CreatedBy"
                ,"CreatedOn"
                , "department"
                , "district"
                , "block"
                , "panchayat"
                , "office"
                , "officer"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            string MobileNo = "";
            string RefundID = "";
            string SmsText = "";
            OUATBLL t_OUATBLL = new OUATBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            //Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_OUATBLL.InsertRefund(Data, AFields);

            if (result.Rows.Count > 0)
            {
                MobileNo = result.Rows[0]["MobileNo"].ToString();
                SmsText = result.Rows[0]["SmsText"].ToString();

                if (MobileNo != null || MobileNo != "")
                {
                    SendSMS(MobileNo, SmsText);
                }

                RefundID = result.Rows[0]["RefundID"].ToString();
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.RefundID = RefundID;
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        //PrintDiplomaAdmitLog
        public string PrintAdmitLog(string RollNo, string AppId)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            //List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = "";// GetCulture(objSessionTuple);
            string KioskID = "Citizen";// GetKioskID(objSessionTuple);

            System.Data.DataTable result = null;
            OUATBLL t_OUATBLL = new OUATBLL();

            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            result = t_OUATBLL.PrintAdmitLog(RollNo, AppId);

            if (result.Rows.Count > 0)
            {
                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string PrintDiplomaAdmitLog(string RollNo, string AppId)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            //List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = "";// GetCulture(objSessionTuple);
            string KioskID = "Citizen";// GetKioskID(objSessionTuple);

            System.Data.DataTable result = null;
            OUATBLL t_OUATBLL = new OUATBLL();

            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            result = t_OUATBLL.PrintDiplomaAdmitLog(RollNo, AppId);

            if (result.Rows.Count > 0)
            {
                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string PrintAgroAdmitLog(string RollNo, string AppId)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            //List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = "";// GetCulture(objSessionTuple);
            string KioskID = "Citizen";// GetKioskID(objSessionTuple);

            System.Data.DataTable result = null;
            OUATBLL t_OUATBLL = new OUATBLL();

            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            result = t_OUATBLL.PrintAgroAdmitLog(RollNo, AppId);

            if (result.Rows.Count > 0)
            {
                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string PrintPGAdmitLog(string RollNo, string AppId)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            //List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = "";// GetCulture(objSessionTuple);
            string KioskID = "Citizen";// GetKioskID(objSessionTuple);

            System.Data.DataTable result = null;
            OUATBLL t_OUATBLL = new OUATBLL();

            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            result = t_OUATBLL.PrintPGAdmitLog(RollNo, AppId);

            if (result.Rows.Count > 0)
            {
                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }


        public string ValidateOUATPhdOTP(string UID, string EnteredOTP)
        {
            OTP_DT objOTP = new OTP_DT();
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                 "aadhaarNumber"
                ,"SMSID"
                ,"OTPCode"
                ,"OTPEntered"
                ,"ModifiedBy"
                ,"ModifiedOn"
                ,"MobileNo"
                ,"ClientIP"
            };

            System.Data.DataTable result = null;
            string[] temp = UID.Split('_');

            string tUID = temp[0], OTPCode = temp[1], VallidTill = temp[2], Mobile = temp[5], SMSID = temp[4];

            OUATBLL t_OUATBLL = new OUATBLL();
            ValidateUser validateUser = new ValidateUser();

            validateUser.AppID = "";
            validateUser.Status = "Error";
            validateUser.intStatus = 0;

            objOTP.aadhaarNumber = tUID;
            objOTP.SMSID = SMSID;
            objOTP.OTPCode = OTPCode;
            objOTP.OTPEntered = EnteredOTP;
            objOTP.validTill = Convert.ToDateTime(VallidTill);
            objOTP.MobileNo = Mobile;
            objOTP.ModifiedBy = KioskID;
            objOTP.ModifiedOn = DateTime.Now;

            result = t_OUATBLL.ValidateOUATPhdOTP(objOTP, AFields);

            if (result.Rows.Count > 0)
            {
                validateUser.AppID = result.Rows[0]["AppID"].ToString();
                validateUser.Status = "Success";
                validateUser.intStatus = 1;

                validateUser.ResponseType = result.Rows[0]["ResponseType"].ToString();
                validateUser.Keyfield = result.Rows[0]["KeyField"].ToString();
                validateUser.ProfileID = result.Rows[0]["ProfileID"].ToString();
            }
            return (new JavaScriptSerializer().Serialize(validateUser));
        }

        public string ValidateOUATDiplomaOTP(string UID, string EnteredOTP)
        {
            OTP_DT objOTP = new OTP_DT();
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                 "aadhaarNumber"
                ,"SMSID"
                ,"OTPCode"
                ,"OTPEntered"
                ,"ModifiedBy"
                ,"ModifiedOn"
                ,"MobileNo"
                ,"ClientIP"
            };

            System.Data.DataTable result = null;
            string[] temp = UID.Split('_');

            string tUID = temp[0], OTPCode = temp[1], VallidTill = temp[2], Mobile = temp[5], SMSID = temp[4];

            OUATBLL t_OUATBLL = new OUATBLL();
            ValidateUser validateUser = new ValidateUser();

            validateUser.AppID = "";
            validateUser.Status = "Error";
            validateUser.intStatus = 0;

            objOTP.aadhaarNumber = tUID;
            objOTP.SMSID = SMSID;
            objOTP.OTPCode = OTPCode;
            objOTP.OTPEntered = EnteredOTP;
            objOTP.validTill = Convert.ToDateTime(VallidTill);
            objOTP.MobileNo = Mobile;
            objOTP.ModifiedBy = KioskID;
            objOTP.ModifiedOn = DateTime.Now;

            result = t_OUATBLL.ValidateOUATDiplomaOTP(objOTP, AFields);

            if (result.Rows.Count > 0)
            {
                validateUser.AppID = result.Rows[0]["AppID"].ToString();
                validateUser.Status = "Success";
                validateUser.intStatus = 1;

                validateUser.ResponseType = result.Rows[0]["ResponseType"].ToString();
                validateUser.Keyfield = result.Rows[0]["KeyField"].ToString();
                validateUser.ProfileID = result.Rows[0]["ProfileID"].ToString();
            }
            return (new JavaScriptSerializer().Serialize(validateUser));
        }


        public string GetOUATCollege(string SelCollege)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            OUATBLL t_OUATBLL = new OUATBLL();
            System.Data.DataTable dtOUATCollege = t_OUATBLL.GetOUATCollege(SelCollege);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtOUATCollege.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["PGCollegeID"],
                        Name = sdr["PGCollegeName"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }


        public string GetOUATDegree(string SelPrograme)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            OUATBLL t_OUATBLL = new OUATBLL();
            System.Data.DataTable dtOUATDegree = t_OUATBLL.GetOUATDegree(SelPrograme);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtOUATDegree.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["PGDegreeID"],
                        Name = sdr["PGDegreeName"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }


        public string GetOUATSubject(string SubjectId)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            OUATBLL t_OUATBLL = new OUATBLL();
            System.Data.DataTable dtOUATSubject = t_OUATBLL.GetOUATSubject(SubjectId);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtOUATSubject.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["PGDegreeID"],
                        Name = sdr["PGDegreeSubject"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }


        private string GetOUATPHDCurrentAddressXML(OUATPHDForm_DT Data)
        {

            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "CurrentAddress";

            dtCurrentTable.Columns.Add(new DataColumn("phouseNumber", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ppostOffice", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plocality", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plandmark", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstreet", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pvillage", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("psubDistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pdistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstate", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pincode", typeof(string)));

            drCurrentRow = dtCurrentTable.NewRow();

            drCurrentRow["phouseNumber"] = Data.PresentAddressline1 == null ? "" : Data.PresentAddressline1.Trim();//OK
            //drCurrentRow["pcareOf"] = Data.pcareOf == null ? "" : Data.pcareOf.Trim();
            drCurrentRow["ppostOffice"] = Data.PresentAddressline2 == null ? "" : Data.PresentAddressline2.Trim();//OK
            drCurrentRow["plocality"] = Data.PreLocality == null ? "" : Data.PreLocality.Trim();//OK
            drCurrentRow["plandmark"] = Data.PreLandmark == null ? "" : Data.PreLandmark.Trim();//OK
            drCurrentRow["pstreet"] = Data.PreRoadstreet == null ? "" : Data.PreRoadstreet.Trim();//OK
            drCurrentRow["pvillage"] = Data.PreVillage == null ? "" : Data.PreVillage.Trim();//OK
            drCurrentRow["psubDistrict"] = Data.PreBlock == null ? "" : Data.PreBlock.Trim();//OK
            drCurrentRow["pdistrict"] = Data.PreDistrict == null ? "" : Data.PreDistrict.Trim();//OK
            drCurrentRow["pstate"] = Data.PreState == null ? "" : Data.PreState.Trim();//OK
            drCurrentRow["pincode"] = Data.PrePincode == null ? "" : Data.PrePincode.Trim();//OK

            dtCurrentTable.Rows.Add(drCurrentRow);

            System.Data.DataTable dtprogXML = dtCurrentTable;

            string CurrentAddressXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "CurrentAddressXML";
            dtprogXML.WriteXml(swriter);
            CurrentAddressXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return CurrentAddressXML;
        }


        private string GetOUATDiplomaCurrentAddressXML(OUATDiplomaForm_DT Data)
        {

            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "CurrentAddress";

            dtCurrentTable.Columns.Add(new DataColumn("phouseNumber", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ppostOffice", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plocality", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plandmark", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstreet", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pvillage", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("psubDistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pdistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstate", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pincode", typeof(string)));

            drCurrentRow = dtCurrentTable.NewRow();

            drCurrentRow["phouseNumber"] = Data.PresentAddressline1 == null ? "" : Data.PresentAddressline1.Trim();//OK
            //drCurrentRow["pcareOf"] = Data.pcareOf == null ? "" : Data.pcareOf.Trim();
            drCurrentRow["ppostOffice"] = Data.PresentAddressline2 == null ? "" : Data.PresentAddressline2.Trim();//OK
            drCurrentRow["plocality"] = Data.PreLocality == null ? "" : Data.PreLocality.Trim();//OK
            drCurrentRow["plandmark"] = Data.PreLandmark == null ? "" : Data.PreLandmark.Trim();//OK
            drCurrentRow["pstreet"] = Data.PreRoadstreet == null ? "" : Data.PreRoadstreet.Trim();//OK
            drCurrentRow["pvillage"] = Data.PreVillage == null ? "" : Data.PreVillage.Trim();//OK
            drCurrentRow["psubDistrict"] = Data.PreBlock == null ? "" : Data.PreBlock.Trim();//OK
            drCurrentRow["pdistrict"] = Data.PreDistrict == null ? "" : Data.PreDistrict.Trim();//OK
            drCurrentRow["pstate"] = Data.PreState == null ? "" : Data.PreState.Trim();//OK
            drCurrentRow["pincode"] = Data.PrePincode == null ? "" : Data.PrePincode.Trim();//OK

            dtCurrentTable.Rows.Add(drCurrentRow);

            System.Data.DataTable dtprogXML = dtCurrentTable;

            string CurrentAddressXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "CurrentAddressXML";
            dtprogXML.WriteXml(swriter);
            CurrentAddressXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return CurrentAddressXML;
        }

        public string InsertOUATPHDFormData(OUATPHDForm_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                            "ProfileID"
                            ,"aadhaarNumber"
                            ,"AppMobileNo"
                            ,"AadhaarDetail"
                            ,"OUATCourse"
                            ,"CollegeName"
                            ,"DegreeName"
                            ,"SubjectName"
                            ,"ICARYesNo"
                            ,"ICARCollegeName"
                            ,"CandidateName"
                            ,"FatherName"
                            ,"MotherName"
                            ,"DOB"
                            ,"Year"
                            ,"Month"
                            ,"Day"
                            ,"Gender"
                            ,"Religion"
                            ,"Category"
                            ,"MaritalStatus"
                            ,"MotherTongue"
                            ,"Nationality"
                            ,"MobileNo"
                            ,"EmailId"
                            ,"ParmanentAddressline1"
                            ,"ParmanentAddressline2"
                            ,"ParRoadstreet"
                            ,"ParLandmark"
                            ,"ParLocality"
                            ,"ParState"
                            ,"ParDistrict"
                            ,"ParBlock"
                            ,"ParVillage"
                            ,"ParPincode"
                            ,"PresentAddressline1"
                            ,"PresentAddressline2"
                            ,"PreRoadstreet"
                            ,"PreLandmark"
                            ,"PreLocality"
                            ,"PreState"
                            ,"PreDistrict"
                            ,"PreBlock"
                            ,"PreVillage"
                            ,"PrePincode"
                            ,"Section1_RecievedAnyGoldmadel"
                            ,"Section1_DocumentDescribe"
                            ,"Section2_SpecialClaim"
                            ,"Section2_DescribeSpecialClaim"
                            ,"Section2_Sports"
                            ,"Section2_Nss"
                            ,"Section3_AreYouEmployed"
                            ,"Section3_Dsignation"
                            ,"Section3_EmployerName"
                            ,"Section3_EmployerAddress"
                            ,"Section3_CerifiedFurnished"
                            ,"BankName"
                            ,"ChalanNumber"
                            ,"IssuedDate"
                            ,"Branch"

                            ,"HscName"
                            ,"HscTotalMarks"
                            ,"HscMarksGot"
                            ,"HscPercentage"
                            ,"HscDivision"
                            ,"HscPassingYear"
                            ,"SscName"
                            ,"SscTotalMarks"
                            ,"SscMarksGot"
                            ,"SscPercentage"
                            ,"SscDivision"
                            ,"SscPassingYear"
                            ,"BscName"
                            ,"BscTotalMarks"
                            ,"BscMarksGot"
                            ,"BscPercentage"
                            ,"BscDivision"
                            ,"BscPassingYear"
                            ,"MscName"
                            ,"MscTotalMarks"
                            ,"MscMarksGot"
                            ,"MscPercentage"
                            ,"MscDivision"
                            ,"MscPassingYear"

                            ,"OdiaLang"
                            ,"ReadOdia"
                            ,"WriteOdia"
                            ,"SpeakOdia"
                            ,"ResidenceType"

                            ,"CurrentAddressXML"
                            ,"Password"
                            ,"Image"
                            ,"ImageSign"
                            ,"ResponseType"
                            , "JSONData"

                            ,"ReservationQuota"
                            ,"PhysicallyChallenged"
                            ,"HandicapType"
                            ,"HandicappedPart"
                            ,"HandicappedPercent"
                            ,"NRISponsership"
                            ,"OtherState"
                            ,"OtherStateName"
                            ,"Horticulture"

                            ,"IsActive"
                            ,"CreatedBy"
                            ,"CreatedOn"
            };

            System.Data.DataTable result = null;
            OUATBLL t_OUATBLL = new OUATBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            string CurrentAddressXML = GetOUATPHDCurrentAddressXML(Data);
            string t_Password = GenPassword();
            Data.Password = t_Password;
            Data.CurrentAddressXML = CurrentAddressXML;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);

            result = t_OUATBLL.InsertOUATPHDFormData(Data, AFields);
            string UID = "";
            string t_LoginID = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText;
            MailID = CCMailID = BCCMailID = Subject = MailText = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["Mobile"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                UID = result.Rows[0]["aadhaarNumber"].ToString();

                MailID = result.Rows[0]["MailID"].ToString();
                CCMailID = result.Rows[0]["CCMailID"].ToString();
                BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                Subject = result.Rows[0]["Subject"].ToString();
                MailText = result.Rows[0]["MailText"].ToString();
                MailText = @"


<!doctype html>
<html>
<head>
    <title>LOKASEBA ADHIKARA - Confirmation Email</title>    
</head>
<body style=""font-family: ''Andada'' , serif; background-color: #E0E0E0;"">
    <div style=""margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff;"">
        <table style=""padding: 1% 0; width: 100%"">
            <tr>
                <td align=""left"">
                    <img src=""https://www.lokaseba-odisha.in/g2c/img/lokaseba_logo.png"" alt=""LOKASEBA ADHIKARA""
                        style=""margin-left: 5%; height: 60px;"" />
                </td>
                <td align=""right"">
                    <img src=""https://www.lokaseba-odisha.in/WebApp/Kiosk/Images/OUAT.png"" alt=""OUAT""
                        style=""margin-right: 5%; height: 60px;"" />
                </td>
            </tr>
        </table>

        <div style=""position: relative; background: #10A5DF; border: 1px solid #0C7FB5;"">
            <h1 style=""color: #fff; font-size: 20px; line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); text-transform: uppercase; font-family: arial;"">ADMISSION INTO PG COURSES OF OUAT   2017-18</h1>
        </div>
        <div style=""margin: 5% 5% 0;"">
            <p>
                Dear @Name,
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Thank you for Applying for OUAT Common Entrance Examination 2017-18<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">&nbsp;</span>
            </p>
            <p style="" font-family: Calibri, sans-serif;
            font-size: 11pt;
            color: rgb(0, 0, 0);
            letter-spacing: normal;margin: 0in 0in 0.0001pt; font-variant: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                The Login details  to access https://www.lokaseba-odisha.in (Common Application Portal - CAP) are</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                LOGIN ID : <b>@Login</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                PASSWORD : <b>@Password</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>The login detail to be used for</b> </div>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>
                    <li>Making Payment of Unpaid Application (through Online Payment Gateway OR at any CSC)
                    </li>
                    <li>Checking the Application Status
                    </li>
                    <li>Downloading the Admit Card for OUAT Common Entrance examination - 2017                
                    </li>
                    <li>Filling of FORM-B after the anouncment of +2Sc. Result
                    </li>
                </ul>

            </div>
            </div>
        <hr />
        <div style=""margin:0 5% 5%;"">
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Your Application for Common Entrance Examination in OUAT is Saved successfully.<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: maroon; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                Your Application No. is <b>@AppID</b>.</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>                    
                    <li>Make payment againt the Application No. 
                        <ul>
						<li>either through Online Payment Gateway after Login into  <a href=""https://lokaseba-odisha.in/Account/Login"" target=""_blank"">LOKASEBA ADHIKAR</a> portal through above login details.
                            </li>
                            <li>or at any CSC (<a href=""/g2c/forms/CenterList.aspx"" target=""_blank"">Janaseba Kendra in Odisha</a>) .
                            </li>
                            
                        </ul>
                    </li>
			 </div>
            
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>PLEASE NOTE : </b>If the Application fee (Rs 1050.00) against the application @AppID is not paid  then the application shall be rejected. 
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">Regards</span>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13); font-weight: bold;"">Orissa University of Agriculture & Technology<br />
                    Bhubaneswar, Odisha</span>
            </p>
        </div>
    </div>
</body>
</html>
";
                MailText = MailText.Replace("@AppID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", UID);

                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                if (Data.CitizenProfileID != null && Data.CitizenProfileID != "")
                {

                }
                else
                {
                    SendSMS(Data.MobileNo,
                        "Dear " + Data.CandidateName + "You've registered for OUAT PG/Ph.D Programme – 2017 , The login detail is LOGIN ID : " + UID +
                        " PASSWORD : " + t_Password + ". From OUAT, Bhubaneswar.", "388",
                        result.Rows[0]["AppID"].ToString(), UID);
                }
                SendSMS(Data.MobileNo, "Dear " + Data.CandidateName + " Your Application has been registered successfully for " +
                    Data.OUATCourse + " of OUAT Course 2017 with Application No." +
                    result.Rows[0]["AppID"].ToString() + ". Please make payment against the application within 09-07-2017 and upload the relevant document. Application without application fees and relevant document will be rejected.From OUAT, Bhubaneswar.", "388", result.Rows[0]["AppID"].ToString(), UID);
                SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "388", result.Rows[0]["AppID"].ToString(), UID);
                //USE THIS FUNTION FOR MAIL
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }


        public string InsertOUATDiplomaFormData(OUATDiplomaForm_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                            "ProfileID"
                            ,"aadhaarNumber"
                            ,"AppMobileNo"
                            ,"AadhaarDetail"
                            ,"CandidateName"
                            ,"FatherName"
                            ,"MotherName"
                            ,"DOB"
                            ,"Year"
                            ,"Month"
                            ,"Day"
                            ,"Gender"
                            ,"Religion"
                            ,"Category"
                            ,"MaritalStatus"
                            ,"MotherTongue"
                            ,"Nationality"
                            ,"MobileNo"
                            ,"EmailId"
                            ,"ParmanentAddressline1"
                            ,"ParmanentAddressline2"
                            ,"ParRoadstreet"
                            ,"ParLandmark"
                            ,"ParLocality"
                            ,"ParState"
                            ,"ParDistrict"
                            ,"ParBlock"
                            ,"ParVillage"
                            ,"ParPincode"
                            ,"PresentAddressline1"
                            ,"PresentAddressline2"
                            ,"PreRoadstreet"
                            ,"PreLandmark"
                            ,"PreLocality"
                            ,"PreState"
                            ,"PreDistrict"
                            ,"PreBlock"
                            ,"PreVillage"
                            ,"PrePincode"
                            ,"HscName"
                            ,"HscTotalMarks"
                            ,"HscMarksGot"
                            ,"HscPercentage"
                            ,"HscDivision"
                            ,"HscPassingYear"
                            ,"SscName"
                            ,"SscTotalMarks"
                            ,"SscMarksGot"
                            ,"SscPercentage"
                            ,"SscDivision"
                            ,"SscPassingYear"
                            ,"OdiaLang"
                            ,"ReadOdia"
                            ,"WriteOdia"
                            ,"SpeakOdia"
                            ,"ResidenceType"
                            ,"CurrentAddressXML"
                            ,"Password"
                            ,"Image"
                            ,"ImageSign"
                            ,"ResponseType"
                            , "JSONData"
                            ,"ReservationQuota"
                            ,"PhysicallyChallenged"
                            ,"HandicapType"
                            ,"HandicappedPart"
                            ,"HandicappedPercent"
                            ,"GreenCardHolder"
                            ,"IsActive"
                            ,"CreatedBy"
                            ,"CreatedOn"
            };

            System.Data.DataTable result = null;
            OUATBLL t_OUATBLL = new OUATBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = System.DateTime.Now;

            string CurrentAddressXML = GetOUATDiplomaCurrentAddressXML(Data);
            string t_Password = GenPassword();
            Data.Password = t_Password;
            Data.CurrentAddressXML = CurrentAddressXML;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);

            result = t_OUATBLL.InsertOUATDiplomaFormData(Data, AFields);
            string UID = "";
            string t_LoginID = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText;
            MailID = CCMailID = BCCMailID = Subject = MailText = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["Mobile"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                UID = result.Rows[0]["aadhaarNumber"].ToString();

                MailID = result.Rows[0]["MailID"].ToString();
                CCMailID = result.Rows[0]["CCMailID"].ToString();
                BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                Subject = result.Rows[0]["Subject"].ToString();
                MailText = result.Rows[0]["MailText"].ToString();


                MailText = @"


<!doctype html>
<html>
<head>
    <title>LOKASEBA ADHIKARA - Confirmation Email</title>    
</head>
<body style=""font-family: ''Andada'' , serif; background-color: #E0E0E0;"">
    <div style=""margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff;"">
        <table style=""padding: 1% 0; width: 100%"">
            <tr>
                <td align=""left"">
                    <img src=""https://www.lokaseba-odisha.in/g2c/img/lokaseba_logo.png"" alt=""LOKASEBA ADHIKARA""
                        style=""margin-left: 5%; height: 60px;"" />
                </td>
                <td align=""right"">
                    <img src=""https://www.lokaseba-odisha.in/WebApp/Kiosk/Images/OUAT.png"" alt=""OUAT""
                        style=""margin-right: 5%; height: 60px;"" />
                </td>
            </tr>
        </table>

        <div style=""position: relative; background: #10A5DF; border: 1px solid #0C7FB5;"">
            <h1 style=""color: #fff; font-size: 20px; line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); text-transform: uppercase; font-family: arial;"">ADMISSION INTO PG COURSES OF OUAT   2017-18</h1>
        </div>
        <div style=""margin: 5% 5% 0;"">
            <p>
                Dear @Name,
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Thank you for Applying for OUAT Common Entrance Examination 2017-18<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">&nbsp;</span>
            </p>
            <p style="" font-family: Calibri, sans-serif;
            font-size: 11pt;
            color: rgb(0, 0, 0);
            letter-spacing: normal;margin: 0in 0in 0.0001pt; font-variant: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                The Login details  to access https://www.lokaseba-odisha.in (Common Application Portal - CAP) are</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                LOGIN ID : <b>@Login</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                PASSWORD : <b>@Password</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>The login detail to be used for</b> </div>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>
                    <li>Making Payment of Unpaid Application (through Online Payment Gateway OR at any CSC)
                    </li>
                    <li>Checking the Application Status
                    </li>
                    <li>Downloading the Admit Card for OUAT Common Entrance examination - 2017                
                    </li>
                    <li>Filling of FORM-B after the anouncment of +2Sc. Result
                    </li>
                </ul>

            </div>
            </div>
        <hr />
        <div style=""margin:0 5% 5%;"">
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Your Application for Common Entrance Examination in OUAT is Saved successfully.<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: maroon; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                Your Application No. is <b>@AppID</b>.</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>                    
                    <li>Make payment againt the Application No. 
                        <ul>
						<li>either through Online Payment Gateway after Login into  <a href=""https://lokaseba-odisha.in/Account/Login"" target=""_blank"">LOKASEBA ADHIKAR</a> portal through above login details.
                            </li>
                            <li>or at any CSC (<a href=""/g2c/forms/CenterList.aspx"" target=""_blank"">Janaseba Kendra in Odisha</a>) .
                            </li>
                            
                        </ul>
                    </li>
			 </div>
            
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>PLEASE NOTE : </b>If the Application fee (Rs 1050.00) against the application @AppID is not paid  then the application shall be rejected. 
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">Regards</span>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13); font-weight: bold;"">Orissa University of Agriculture & Technology<br />
                    Bhubaneswar, Odisha</span>
            </p>
        </div>
    </div>
</body>
</html>
";
                MailText = MailText.Replace("@AppID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", UID);

                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                if (Data.CitizenProfileID != null && Data.CitizenProfileID != "")
                {

                }
                else
                {
                    SendSMS(Data.MobileNo,
                        "Dear " + Data.CandidateName + "You've registered for OUAT Agro Polytechnic Diploma Programme – 2017 , The login detail is LOGIN ID : " + UID +
                        " PASSWORD : " + t_Password + ". From OUAT, Bhubaneswar.", "388",
                        result.Rows[0]["AppID"].ToString(), UID);
                }
                SendSMS(Data.MobileNo, "Dear " + Data.CandidateName + " Your Application has been Registered successfully for " + result.Rows[0]["AppID"].ToString() + ". Please Make Payment and Upload Relevent Documents against Your Application within 20-07-2017.Application without Application fees and Relevant Document will be Rejected.From OUAT, Bhubaneswar.", "388", result.Rows[0]["AppID"].ToString(), UID);
                SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "388", result.Rows[0]["AppID"].ToString(), UID);
                //USE THIS FUNTION FOR MAIL
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }


        public string InsertTranscriptITI(TranscriptITI_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                      "aadhaarNumber"
                    ,  "ProfileID"
                    , "InstituteName"
                    , "RegistrationNo"
                    , "StudentName"
                    , "Session"
                    , "JoiningYear"
                    , "LeavingYear"
                    , "Reason"
                    , "CompanyApplicantName"
                    , "AppAddressLine1"
                    , "AppAddressLine2"
                    , "AppStreetName"
                    , "AppLandmark"
                    , "AppLocality"
                    , "AppStateCode"
                    , "AppDistrictCode"
                    , "AppSubDistrictCode"
                    , "AppVillageCode"
                    , "AppPinCode"
                    , "CreatedBy"
                    , "CreatedOn"
                    , "ClientIP"
                    , "department"
                    , "district"
                    , "block"
                    , "panchayat"
                    , "office"
                    , "officer"
                    , "ServiceID"
                    , "ApplicantType"
                    , "TradeName"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            TranscriptBLL t_TranscriptBLL = new TranscriptBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_TranscriptBLL.InsertTranscriptITI(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Request for Transcription Verification has been Submitted successfully. Your Reference ID is " + AppID + ". From Odisha Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }


        public string InsertRoadTaxFormData(RoadTaxForm_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "ProfileID"
                ,"VehicleNo"
                ,"MobileNo"
                ,"OwnerName"
                ,"CareOf"
                ,"EngineNo"
                ,"PurchaseDeliveryDate"
                ,"VehicleClass"
                ,"BodyType"
                ,"MakersModel"
                ,"VehicleMakers"
                ,"UnloadedWeight"
                ,"LadenWeight"
                ,"SeatingCapacity"
                ,"ManufactureYear"
                ,"SleeperCapacity"
                ,"StandingCapacity"
                ,"RegistrationDate"
                ,"ChassisNumber"
                ,"VehicleType"
                ,"VehicleCategory"
                ,"VehicleValidity"
                ,"PrevReceiptDate"
                ,"PrevTaxAmount"
                ,"PrevTaxUpTo"
                ,"PrevTaxFine"
                ,"RoadTaxNicJsonData"
                ,"TaxValue"
                ,"TaxMode"
                ,"TaxHead"
                ,"CurTaxFrom"
                ,"CurTaxUpTo"
                ,"CurTaxAmount"
                ,"CurTaxPenalty"
                ,"CurTaxSurcharge"
                ,"CurTaxRebate"
                ,"CurTaxInterest"
                ,"CurTaxAmount1"
                ,"CurTaxAmount2"
                ,"CurTotalTaxAmount"
                ,"AddCurTaxValue"
                ,"AddCurTaxMode"
                ,"AddCurTaxHead"
                ,"AddCurTaxFrom"
                ,"AddCurTaxUpTo"
                ,"AddCurTaxAmount"
                ,"AddCurTaxPenalty"
                ,"AddCurTaxSurcharge"
                ,"AddCurTaxRebate"
                ,"AddCurTaxInterest"
                ,"AddCurTaxAmount1"
                ,"AddCurTaxAmount2"
                ,"AddCurTotalTaxAmount"
                ,"UserServiceTax"
                ,"FinalTaxPaymentAmount"
                ,"TaxCalNicJsonData"
                ,"CreatedBy"
                ,"CreatedOn"
                ,"ModifiedBy"
                ,"ClientIP"
                ,"SeqNo"
                ,"IsActive"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            RoadTaxBLL t_RoadTaxBLL = new RoadTaxBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_RoadTaxBLL.InsertRoadTaxFormData(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;
                SendSMS(result.Rows[0]["Mobile"].ToString(), "Your RoadTax Application has been registered successfully. Your Reference ID is " + AppID + ". Thank You, From Odisha Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }
        private string GetCBCSAdmissionCurrentAddressXML(CBCSAdmissionForm_DT Data)
        {

            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "CurrentAddress";

            dtCurrentTable.Columns.Add(new DataColumn("phouseNumber", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ppostOffice", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plocality", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plandmark", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstreet", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pvillage", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("psubDistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pdistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstate", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pincode", typeof(string)));

            drCurrentRow = dtCurrentTable.NewRow();

            drCurrentRow["phouseNumber"] = Data.phouseNumber == null ? "" : Data.phouseNumber.Trim();
            drCurrentRow["ppostOffice"] = Data.ppostOffice == null ? "" : Data.ppostOffice.Trim();//OK
            drCurrentRow["plocality"] = Data.plocality == null ? "" : Data.plocality.Trim();
            drCurrentRow["plandmark"] = Data.plandmark == null ? "" : Data.plandmark.Trim();
            drCurrentRow["pstreet"] = Data.pstreet == null ? "" : Data.pstreet.Trim();
            drCurrentRow["pvillage"] = Data.pvillage == null ? "" : Data.pvillage.Trim();
            drCurrentRow["psubDistrict"] = Data.psubDistrict == null ? "" : Data.psubDistrict.Trim();
            drCurrentRow["pdistrict"] = Data.pdistrict == null ? "" : Data.pdistrict.Trim();
            drCurrentRow["pstate"] = Data.pstate == null ? "" : Data.pstate.Trim();
            drCurrentRow["pincode"] = Data.ppincode == null ? "" : Data.ppincode.Trim();

            dtCurrentTable.Rows.Add(drCurrentRow);
            System.Data.DataTable dtprogXML = dtCurrentTable;
            string CurrentAddressXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "CurrentAddressXML";
            dtprogXML.WriteXml(swriter);
            CurrentAddressXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return CurrentAddressXML;
        }

        private string GetEnrolementCurrentAddressXML(EnrolementAdmissionForm_DT Data)
        {

            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "CurrentAddress";

            dtCurrentTable.Columns.Add(new DataColumn("phouseNumber", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ppostOffice", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plocality", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plandmark", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstreet", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pvillage", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("psubDistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pdistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstate", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pincode", typeof(string)));

            drCurrentRow = dtCurrentTable.NewRow();

            drCurrentRow["phouseNumber"] = Data.phouseNumber == null ? "" : Data.phouseNumber.Trim();
            drCurrentRow["ppostOffice"] = Data.ppostOffice == null ? "" : Data.ppostOffice.Trim();//OK
            drCurrentRow["plocality"] = Data.plocality == null ? "" : Data.plocality.Trim();
            drCurrentRow["plandmark"] = Data.plandmark == null ? "" : Data.plandmark.Trim();
            drCurrentRow["pstreet"] = Data.pstreet == null ? "" : Data.pstreet.Trim();
            drCurrentRow["pvillage"] = Data.pvillage == null ? "" : Data.pvillage.Trim();
            drCurrentRow["psubDistrict"] = Data.psubDistrict == null ? "" : Data.psubDistrict.Trim();
            drCurrentRow["pdistrict"] = Data.pdistrict == null ? "" : Data.pdistrict.Trim();
            drCurrentRow["pstate"] = Data.pstate == null ? "" : Data.pstate.Trim();
            drCurrentRow["pincode"] = Data.ppincode == null ? "" : Data.ppincode.Trim();

            dtCurrentTable.Rows.Add(drCurrentRow);
            System.Data.DataTable dtprogXML = dtCurrentTable;
            string CurrentAddressXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "CurrentAddressXML";
            dtprogXML.WriteXml(swriter);
            CurrentAddressXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return CurrentAddressXML;
        }
        private string GetSeniorCitizenCurrentAddressXML(SeniorCitizenIDCard_DT Data)
        {

            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "CurrentAddress";

            dtCurrentTable.Columns.Add(new DataColumn("phouseNumber", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ppostOffice", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plocality", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plandmark", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstreet", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pvillage", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("psubDistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pdistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstate", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pincode", typeof(string)));

            drCurrentRow = dtCurrentTable.NewRow();

            drCurrentRow["phouseNumber"] = Data.phouseNumber == null ? "" : Data.phouseNumber.Trim();
            drCurrentRow["ppostOffice"] = Data.ppostOffice == null ? "" : Data.ppostOffice.Trim();//OK
            drCurrentRow["plocality"] = Data.plocality == null ? "" : Data.plocality.Trim();
            drCurrentRow["plandmark"] = Data.plandmark == null ? "" : Data.plandmark.Trim();
            drCurrentRow["pstreet"] = Data.pstreet == null ? "" : Data.pstreet.Trim();
            drCurrentRow["pvillage"] = Data.pvillage == null ? "" : Data.pvillage.Trim();
            drCurrentRow["psubDistrict"] = Data.psubDistrict == null ? "" : Data.psubDistrict.Trim();
            drCurrentRow["pdistrict"] = Data.pdistrict == null ? "" : Data.pdistrict.Trim();
            drCurrentRow["pstate"] = Data.pstate == null ? "" : Data.pstate.Trim();
            drCurrentRow["pincode"] = Data.ppincode == null ? "" : Data.ppincode.Trim();

            dtCurrentTable.Rows.Add(drCurrentRow);
            System.Data.DataTable dtprogXML = dtCurrentTable;
            string CurrentAddressXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "CurrentAddressXML";
            dtprogXML.WriteXml(swriter);
            CurrentAddressXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return CurrentAddressXML;
        }

        public string InsertSeniorCitizenIDCardData(SeniorCitizenIDCard_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
            "ProfileID"
            ,"AadhaarNumber"
            ,"AadhaarDetail"
            ,"AppMobileNo"
            ,"PSDistrict"
            ,"DPoliceStation"
            ,"PoliceStation"
            ,"AppName"
            ,"DOB"
            ,"Year"
            ,"Month"
            ,"Day"
            ,"Gender"
            ,"MobileNo"
            ,"EmailId"
            ,"SpouseName"
            ,"Nationality"
            ,"RelativeSameCity"
            ,"MedicalHistory"
            ,"BloodGroup"
            ,"Arthritis"
            ,"HeartDisease"
            ,"Cancer"
            ,"RespiratoryDiseases"
            ,"AlzheimerDiseases"
            ,"Osteoporosis"
            ,"Diabetes"
            ,"InfluenzaPheumonia"
            ,"Others"
            ,"DescribeOther"
            ,"DoctorName"
            ,"DoctorMobileNo"
            ,"DoctorAddress"
            ,"DoctorPinCode"
            , "action"
            , "careOf"
            , "careOfLocal"
            , "districtLocal"
            , "houseNumber"
            , "houseNumberLocal"
            , "landmark"
            , "landmarkLocal"
            , "language"
            , "locality"
            , "localityLocal"
            , "phone"
            , "pincode"
            , "pincodeLocal"
            , "postOffice"
            , "postOfficeLocal"
            , "residentName"
            , "residentNameLocal"
            , "responseCode"
            , "state"
            , "stateLocal"
            , "district"
            , "street"
            , "streetLocal"
            , "subDistrict"
            , "subDistrictLocal"
            , "timestamp"
            , "ttl"
            , "vtc"
            , "vtcLocal"
            , "CitizenProfileID"
            , "Village"
            , "statecode"
            , "districtcode"
            , "subDistrictcode"
            , "Villagecode"
            , "CurrentAddressXML"
            , "Password"
            , "Image"
            , "ImageSign"
            , "ResponseType"
            , "JSONData"
            , "RelativeDetailsXML"
            ,"ServantDetailsXML"
            //,"SPersonType"
            //,"SNameOfPerson"
            //,"SAddress"
            //,"SMobile"
            ,"MotherName"
            ,"FatherName"
            ,"Religion"
            ,"Category"
            ,"LandLineNo"
            ,"IsActive"
            ,"CreatedBy"
            ,"CreatedOn"
            };

            System.Data.DataTable result = null;
            string UID = "";
            SeniorCitizenBLL t_SeniorCitizenBLL = new SeniorCitizenBLL();
            ServiceResultForSeniorCitizen t_ServiceResult = new ServiceResultForSeniorCitizen();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            string CurrentAddressXML = GetSeniorCitizenCurrentAddressXML(Data);
            Data.CurrentAddressXML = CurrentAddressXML;
            string t_Password = GenPassword();
            Data.Password = t_Password;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);
            //add in xml format data by vibhav 13 jun 017
            Data.RelativeDetailsXML = GetSeniorCitizenRelativeDetails_xml(Data.HeirsDXML);
            Data.ServantDetailsXML = GetSeniorCitizenRelativeDetails_xml(Data.HeirsDXMLS);
            result = t_SeniorCitizenBLL.InsertSeniorCitizenIDCardData(Data, AFields);
            string t_LoginID = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText;
            MailID = "";
            CCMailID = BCCMailID = Subject = MailText = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["Mobile"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                UID = result.Rows[0]["aadhaarNumber"].ToString();

                MailID = result.Rows[0]["MailID"].ToString();
                CCMailID = result.Rows[0]["CCMailID"].ToString();
                BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                Subject = result.Rows[0]["Subject"].ToString();
                MailText = result.Rows[0]["MailText"].ToString();
                t_ServiceResult.CardNo = result.Rows[0]["CardNo"].ToString();
                t_ServiceResult.District = result.Rows[0]["District"].ToString();
                t_ServiceResult.PoliceStation = result.Rows[0]["PoliceStation"].ToString();
                t_ServiceResult.AadhaarNo = result.Rows[0]["AadhaarNumber"].ToString();


                MailText = @"


<html>
<head>
    <title>LOKASEBA ADHIKARA - Confirmation Email</title>    
</head>
<body style=""font-family: ''Andada'' , serif; background-color: #E0E0E0;"">
    <div style=""margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff;"">
        <table style=""padding: 1% 0; width: 100%"">
            <tr>
                <td align=""left"">
                    <img src=""https://lokaseba-odisha.in/g2c/img/lokaseba_logo.png"" alt=""LOKASEBA ADHIKARA""
                        style=""margin-left: 5%; height: 60px;"" />
                </td>
                <td align=""right"">
                    <img src=""https://lokaseba-odisha.in/WebApp/Kiosk/Images/OUAT.png"" alt=""Senior Citizen""
                        style=""margin-right: 5%; height: 60px;"" />
                </td>
            </tr>
        </table>

        <div style=""position: relative; background: #10A5DF; border: 1px solid #0C7FB5;"">
            <h1 style=""color: #fff; font-size: 20px; line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); text-transform: uppercase; font-family: arial;"">Senior Citizen ID Card 2017-18</h1>
        </div>
        <div style=""margin: 5% 5% 0;"">
            <p>
                Respected @Name,
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Your application for registration with Senior
                  Citizen Security Cell of Police Commissionerate, Bhubaneswar - Cuttack vide Application No. <b>@AppID</b> has been received and under process.
                 <span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">&nbsp;</span>
            </p>
            <p style="" font-family: Calibri, sans-serif;
            font-size: 11pt;
            color: rgb(0, 0, 0);
            letter-spacing: normal;margin: 0in 0in 0.0001pt; font-variant: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                The Login details  to access https://www.lokaseba-odisha.in  (Common Application Portal - CAP) are</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                LOGIN ID : <b>@Login</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                PASSWORD : <b>@Password</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>The login detail to be used for</b> </div>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>                    
                    <li>Checking the Application Status.
                    </li>                 
                </ul>

            </div>
            </div>
        <hr />
        <div style=""margin:0 5% 5%;"">
            
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">Regards</span>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13); font-weight: bold;"">Commissioner of Police,<br />
                    Bhubaneswar-Cuttack, Odisha.</span>
            </p>
        </div>
    </div>
</body>
</html>
";
                MailText = MailText.Replace("@AppID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", UID);

                SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "424", result.Rows[0]["AppID"].ToString(), UID);
                /*condition apply for app genreated by Nodal--*/
                //Mobile/Adhar already exist in the system.
                string statusid = result.Rows[0]["Status"].ToString();

                if (KioskID.Contains("PS.NO."))
                {
                    if (statusid == "2")
                    {
                        //SMS Send To Applicant with login credentials
                        if (result.Rows[0]["Mobile"].ToString() != "" && result.Rows[0]["LoginId"].ToString() != "")
                        {
                            SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                            //faild reason aadhaar already exist
                            t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                            t_ServiceResult.Status = "AadhaarMobile";
                            t_ServiceResult.intStatus = 2;
                        }
                    }
                    else if (statusid == "3")
                    {
                        //faild reason mobile already exist
                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "Mobile";
                        t_ServiceResult.intStatus = 3;

                    }
                    else if (statusid == "4")
                    {
                        //faild reason aadhaar already exist
                        if (result.Rows[0]["Mobile"].ToString() != "" && result.Rows[0]["LoginId"].ToString() != "")
                        {
                            SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                            t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                            t_ServiceResult.Status = "Aadhaar";
                            t_ServiceResult.intStatus = 4;
                        }

                    }
                    else
                    {
                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "Success";
                        t_ServiceResult.intStatus = 1;
                        //SMS Send To Applicant
                        SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                        //SMS Send To Nodal Officer stop sending message to nodal officer as Niraj sir on 29 july.
                        // SendSMS(result.Rows[0]["DeptMobile"].ToString(), result.Rows[0]["NodalSMSText"].ToString());
                    }
                }
                else if (KioskID.Contains("PS.ANO."))
                {
                    if (statusid == "2")
                    {
                        //SMS Send To Applicant with login credentials
                        if (result.Rows[0]["Mobile"].ToString() != "" && result.Rows[0]["LoginId"].ToString() != "")
                        {
                            SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                            //faild reason aadhaar already exist
                            t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                            t_ServiceResult.Status = "AadhaarMobile";
                            t_ServiceResult.intStatus = 2;
                        }
                    }
                    else if (statusid == "3")
                    {
                        //faild reason mobile already exist
                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "Mobile";
                        t_ServiceResult.intStatus = 3;

                    }
                    else if (statusid == "4")
                    {
                        //faild reason aadhaar already exist
                        if (result.Rows[0]["Mobile"].ToString() != "" && result.Rows[0]["LoginId"].ToString() != "")
                        {
                            SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                            t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                            t_ServiceResult.Status = "Aadhaar";
                            t_ServiceResult.intStatus = 4;
                        }

                    }
                    else
                    {
                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "Success";
                        t_ServiceResult.intStatus = 1;
                        //SMS Send To Applicant
                        SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                        //SMS Send To Nodal Officer stop sending message to nodal officer as Niraj sir on 29 july.
                        // SendSMS(result.Rows[0]["DeptMobile"].ToString(), result.Rows[0]["NodalSMSText"].ToString());
                    }
                }
                else
                {
                    if (statusid == "2")
                    {
                        //SMS Send To Applicant with login credentials
                        if (result.Rows[0]["Mobile"].ToString() != "" && result.Rows[0]["LoginId"].ToString() != "")
                        {
                            SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                            //faild reason aadhaar & mobile already exist
                            t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                            t_ServiceResult.Status = "AadhaarMobile";
                            t_ServiceResult.intStatus = 2;
                        }
                    }
                    else if (statusid == "3")
                    {
                        //faild reason mobile already exist
                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "Mobile";
                        t_ServiceResult.intStatus = 3;

                    }
                    else if (statusid == "4")
                    {
                        //faild reason aadhaar already exist
                        if (result.Rows[0]["Mobile"].ToString() != "" && result.Rows[0]["LoginId"].ToString() != "")
                        {
                            //send sms to applicant
                            SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                            t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                            t_ServiceResult.Status = "Aadhaar";
                            t_ServiceResult.intStatus = 4;
                        }
                    }
                    else
                    {
                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "Success";
                        t_ServiceResult.intStatus = 1;
                        //SMS Send To Applicant
                        SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                        //SMS Send To Nodal Officer stop sending message to nodal officer as Niraj sir on 29 july.
                        // SendSMS(result.Rows[0]["DeptMobile"].ToString(), result.Rows[0]["NodalSMSText"].ToString());
                    }
                }

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }


        private string GetSeniorCitizenRelativeDetails_xml(string Data)
        {
            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "SeniorCitizenRelativeDetails";
            dtCurrentTable.Columns.Add(new DataColumn("SNO", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("NOR", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("Relation", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("Address", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("Mobile", typeof(string)));

            #region Code by Niraj

            Int32 intCount = default(Int32);
            Int32 StartIndex = default(Int32);
            Int32 EndIndex = default(Int32);
            Int32 Remstrlen = default(Int32);
            string strSave = null;
            string strTempString = null;
            string SrNo = null;
            string RemStr = null;
            //string strIngredient = "", strMonograph = "", strMonographID = "", strOtherMono = "", strStrength = "", strUnit = "";
            //string strMemberName = "", strRelationWithHOF = "", strAge = "", strNominated = "";

            if (Data.Length > 0)
            {
                strSave = Data;
                strTempString = Data;

                string[] arrRows = strTempString.Split(new char[] { '#' }, StringSplitOptions.RemoveEmptyEntries);
                string[] arrCols = null;

                for (int i = 0; i < arrRows.Length; i++)
                {
                    drCurrentRow = dtCurrentTable.NewRow();

                    arrCols = arrRows[i].Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                    //if (arrCols.Length == 5)
                    {
                        drCurrentRow["SNO"] = arrCols[0] == null || arrCols[0] == "" ? "" : arrCols[0];
                        drCurrentRow["NOR"] = arrCols[1] == null || arrCols[1] == "" ? "" : arrCols[1];
                        drCurrentRow["Relation"] = arrCols[2] == null || arrCols[2] == "" ? "" : arrCols[2];
                        drCurrentRow["Address"] = arrCols[3] == null || arrCols[3] == "" ? "" : arrCols[3];
                        drCurrentRow["Mobile"] = arrCols[4] == null || arrCols[4] == "" ? "" : arrCols[4];

                        dtCurrentTable.Rows.Add(drCurrentRow);
                    }

                }


            }

            #endregion Code by Niraj

            System.Data.DataTable dtprogXML = dtCurrentTable;

            string SeniorCitizenDetails = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "SENIORCITIZENRELATIVEDETAIL";
            dtprogXML.WriteXml(swriter);
            SeniorCitizenDetails = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return SeniorCitizenDetails;


        }
        //police station list
        public string GetDistrictPoliceStations(string prefix, string DistrictCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            SeniorCitizenBLL t_SeniorCitizenBLL = new SeniorCitizenBLL();
            System.Data.DataTable dtPoliceStation = t_SeniorCitizenBLL.GetDistrictPoliceStations(DistrictCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtPoliceStation.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["rowid"],
                        Name = sdr["Police_Station"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string InsertPNTCData(DivisionalCertificate_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                      "aadhaarNumber"
                    ,  "ProfileID"
                    , "InstituteName"
                    , "RegistrationNo"
                    , "Session"
                    , "JoiningYear"
                    , "LeavingYear"
                    , "ApplicantType"
                    , "Semester"
                    , "BranchCode"
                    , "SubjectCode"
                    , "CreatedBy"
                    , "CreatedOn"
                    , "ClientIP"
                    , "department"
                    , "district"
                    , "block"
                    , "panchayat"
                    , "office"
                    , "officer"
                    , "ServiceID"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            DivisionalCertificateBLL t_DivisionalCertificateBLL = new DivisionalCertificateBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_DivisionalCertificateBLL.InsertPNTCData(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Request for Transcription Verification has been Submitted successfully. Your Reference ID is " + AppID + ". From Odisha Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }


        private string GetOUATAgroFormBCurrentAddressXML(OUATAgroFormB_DT Data)
        {

            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "CurrentAddress";

            //, , , , , , , , ;
            //public string subDistrict, subDistrictLocal, district, districtLocal, state, stateLocal, postOffice, postOfficeLocal, pincode, pincodeLocal

            dtCurrentTable.Columns.Add(new DataColumn("phouseNumber", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ppostOffice", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plocality", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plandmark", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstreet", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pvillage", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("psubDistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pdistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstate", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pincode", typeof(string)));

            drCurrentRow = dtCurrentTable.NewRow();

            drCurrentRow["phouseNumber"] = Data.phouseNumber == null ? "" : Data.phouseNumber.Trim();//OK
            //drCurrentRow["pcareOf"] = Data.pcareOf == null ? "" : Data.pcareOf.Trim();
            drCurrentRow["ppostOffice"] = Data.ppostOffice == null ? "" : Data.ppostOffice.Trim();//OK
            drCurrentRow["plocality"] = Data.plocality == null ? "" : Data.plocality.Trim();//OK
            drCurrentRow["plandmark"] = Data.plandmark == null ? "" : Data.plandmark.Trim();//OK
            drCurrentRow["pstreet"] = Data.pstreet == null ? "" : Data.pstreet.Trim();//OK
            drCurrentRow["pvillage"] = Data.pvillage == null ? "" : Data.pvillage.Trim();//OK
            drCurrentRow["psubDistrict"] = Data.psubDistrict == null ? "" : Data.psubDistrict.Trim();//OK
            drCurrentRow["pdistrict"] = Data.pdistrict == null ? "" : Data.pdistrict.Trim();//OK
            drCurrentRow["pstate"] = Data.pstate == null ? "" : Data.pstate.Trim();//OK
            drCurrentRow["pincode"] = Data.ppincode == null ? "" : Data.ppincode.Trim();//OK

            dtCurrentTable.Rows.Add(drCurrentRow);

            System.Data.DataTable dtprogXML = dtCurrentTable;

            string CurrentAddressXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "CurrentAddressXML";
            dtprogXML.WriteXml(swriter);
            CurrentAddressXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return CurrentAddressXML;
        }


        public string InsertOUATAgroFormB(OUATAgroFormB_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields =
            {
                 "aadhaarNumber"
                ,"action"
                ,"careOf"
                ,"careOfLocal"
                ,"dateOfBirth"
                ,"district"
                ,"districtLocal"
                ,"emailId"
                ,"gender"
                ,"houseNumber"
                ,"houseNumberLocal"
                ,"landmark"
                ,"landmarkLocal"
                ,"language"
                ,"locality"
                ,"localityLocal"
                ,"phone"
                ,"pincode"
                ,"pincodeLocal"
                ,"postOffice"
                ,"postOfficeLocal"
                ,"residentName"
                ,"residentNameLocal"
                ,"responseCode"
                ,"state"
                ,"stateLocal"
                ,"street"
                ,"streetLocal"
                ,"subDistrict"
                ,"subDistrictLocal"
                ,"timestamp"
                ,"ttl"
                ,"vtc"
                ,"vtcLocal"
                ,"JSONData"
                ,"IsActive"
                ,"CreatedBy"
                ,"CreatedOn"
                ,"ClientIP"
                ,"Image"
                ,"ImageSign"
                ,"Mobile"
                ,"CurrentAddressXML"
                ,"CitizenProfileID"
                ,"Village"
                ,"Password"
                ,"statecode"
                ,"districtcode"
                ,"subDistrictcode"
                ,"Villagecode"

                , "MotherTongue"
                , "MotherName"
                , "Religion"
                , "Category"
                , "Nationality"
                , "stdcode"
                , "ResponseType"
                , "AgroFormA_AppID"
                , "EntranceRollNo"
                , "TransactionNo"
                , "Transactiondate"
                , "Discipline"
                , "CandidateName"
                , "FatherName"
                , "DOB"
                , "Year"
                , "Month"
                , "Day"
                , "Email"

                , "EduRollNo"
                , "EduNameOfBoard"
                , "EduNameOfExamination"
                , "EduPassingYear"
                , "EduGrade"
                , "EduTotalMarks"
                , "EduMarkSecured"
                , "EduPercentage"

                , "Edu2RollNo"
                , "Edu2NameOfBoard"
                , "Edu2NameOfExamination"
                , "Edu2PassingYear"
                , "Edu2Grade"
                , "Edu2TotalMarks"
                , "Edu2MarkSecured"
                , "Edu2Percentage"

                , "Edu3RollNo"
                , "Edu3NameOfBoard"
                , "Edu3NameOfExamination"
                , "Edu3PassingYear"
                , "Edu3Grade"
                , "Edu3TotalMarks"
                , "Edu3MarkSecured"
                , "Edu3Percentage"
            };

            System.Data.DataTable result = null;
            string UID = "";
            CitizenProfileBLL t_CitizenProfileBLL = new CitizenProfileBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            string CurrentAddressXML = GetOUATAgroFormBCurrentAddressXML(Data);
            string t_Password = GenPassword();
            Data.Password = t_Password;
            Data.CurrentAddressXML = CurrentAddressXML;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);

            result = t_CitizenProfileBLL.InsertOUATAgroFormB(Data, AFields);
            string t_LoginID = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText;
            MailID = CCMailID = BCCMailID = Subject = MailText = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["Mobile"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                UID = result.Rows[0]["aadhaarNumber"].ToString();

                MailID = result.Rows[0]["MailID"].ToString();
                CCMailID = result.Rows[0]["CCMailID"].ToString();
                BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                Subject = result.Rows[0]["Subject"].ToString();
                MailText = result.Rows[0]["MailText"].ToString();


                MailText = @"


<!doctype html>
<html>
<head>
    <title>LOKASEBA ADHIKARA - Confirmation Email</title>    
</head>
<body style=""font-family: ''Andada'' , serif; background-color: #E0E0E0;"">
    <div style=""margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff;"">
        <table style=""padding: 1% 0; width: 100%"">
            <tr>
                <td align=""left"">
                    <img src=""https://www.lokaseba-odisha.in/g2c/img/lokaseba_logo.png"" alt=""LOKASEBA ADHIKARA""
                        style=""margin-left: 5%; height: 60px;"" />
                </td>
                <td align=""right"">
                    <img src=""https://www.lokaseba-odisha.in/WebApp/Kiosk/OUAT/images/OUAT.png"" alt=""Odisha Police""
                        style=""margin-right: 5%; height: 60px;"" />
                </td>
            </tr>
        </table>

        <div style=""position: relative; background: #10A5DF; border: 1px solid #0C7FB5;"">
            <h1 style=""color: #fff; font-size: 20px; line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); text-transform: uppercase; font-family: arial;"">Recruitment of Constables&nbsp; 2016 - 2017</h1>
        </div>
        <div style=""margin: 5% 5% 0;"">
            <p>
                Dear @Name,
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Thank you for Registrating in Recruitment of Constables in 9th SIRB<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">&nbsp;</span>
            </p>
            <p style="" font-family: Calibri, sans-serif;
            font-size: 11pt;
            color: rgb(0, 0, 0);
            letter-spacing: normal;margin: 0in 0in 0.0001pt; font-variant: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                The Login detail for LOKASEBA ADHIKAR (Common Application Portal - CAP) is</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                LOGIN ID : <b>@Login</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                PASSWORD : <b>@Password</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>The login detail to be used for</b> </div>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>
                    <li>Make Payment (no payment for SC and ST)
                    </li>
                    <li>Upload the payment detail (only if the payment is made throught SB-Collect)
                    </li>
                    <li>Download e-Pass for
                <ul>
                    <li>Physical Measurment</li>
                    <li>Physical Efficiency Test (those who have qualified in Physical Measurment)</li>
                    <li>Written Examination (those who have qualified in Physical Measurment and Physical Efficiency)</li>
                </ul>
                    </li>
                    <li>Date of events and Results
                    </li>
                </ul>

            </div>
            </div>
        <hr />
        <div style=""margin:0 5% 5%;"">
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Your Application for Recruitment of Constables in 9th SIRB is Saved successfully.<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: maroon; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                Your Reference ID is <b>@AppID</b>.</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>
                    <li>Please upload the supporting documents / certificates
                    </li>
                    <li>Make payment (no payment for SC and ST category) againt the Reference ID 
                        <ul>
                            <li>either at any CSC centre (<a href=""/g2c/forms/CenterList.aspx"" target=""_blank"">CSC centers in Odisha</a>) .
                            </li>
                            <li>or through SB-Collect (<a href=""https://www.onlinesbi.com/prelogin/icollecthome.htm?corpID=792927"" target=""_blank"">SBI link</a>)
                            </li>
                        </ul>
                    </li>
                    <li>After Payment,&nbsp; 
                uploaded the payment detail (only if payment is done through SB-Collect) to&nbsp; <a href=""https://lokaseba-odisha.in/Account/Login"" target=""_blank"">LOKASEBA ADHIKAR</a> portal after login through above login details.
            </div>
            
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>PLEASE NOTE : </b>If the payment detail is not uploaded, the Application for Recruitment of Constables in 9th SIRB shall be considered invalid. 
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">Regards</span>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13); font-weight: bold;"">LOKASEBA ADHIKARA<br />
                    Common Application Portal (CAP), Odisha</span>
            </p>
        </div>
    </div>
</body>
</html>
";
                MailText = MailText.Replace("@AppID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", UID);

                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                if (Data.CitizenProfileID != null && Data.CitizenProfileID != "")
                {

                }
                else
                {
                    //SendSMS(Data.Mobile,
                    //    "You've registered for Constables Recruitment, The login detail is LOGIN ID : " + UID +
                    //    " PASSWORD : " + t_Password + ". From Lokaseba Adhikara, CAP, Odisha Govt.", "388",
                    //    result.Rows[0]["AppID"].ToString(), UID);
                }
                /*
                //SendSMS(Data.Mobile, "Your Application for Recruitment in Constables is Saved successfully. Your Reference ID is " + result.Rows[0]["AppID"].ToString() + ". Please upload the necessay document and make payment, otherwises the form shall considered invalid. From Lokaseba Adhikara -CAP, Odisha Govt.", "388", result.Rows[0]["AppID"].ToString(), UID);
    */
                SendSMS(Data.Mobile,
                                "Dear " + result.Rows[0]["Name"].ToString() +
                                ", You have successfully submitted the Application AGRO FORM - B for Admission into OUAT UG Courses 2017 with Roll no " +
                                result.Rows[0]["RollNo"].ToString() +
                                ". Please upload the relevant documents as mentioned in OUAT UG Prospectus 2017 - 18. Take print out of the submitted Application AGRO FORM - B after uploading all the documents.If selected submit the printed Application AGRO FORM - B along with photocopy(Xerox) of the documents at the time of Admission. Regards OUAT, Bhubaneswar",
                                "428", result.Rows[0]["AppID"].ToString(), UID);

                //SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "388", result.Rows[0]["AppID"].ToString(), UID);

                //USE THIS FUNTION FOR MAIL
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }
        public string InsertSeniorCitizenCheckList(SeniorCitizenCheckList_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
            "AppID"
            ,"ServiceID"
            ,"Photograph"
            ,"PresentAddress"
            ,"OriginalAadhar"
            ,"Mobile"
            ,"AnyCriminalCase"
            ,"CreatedBy"
            };

            System.Data.DataTable result = null;
            SeniorCitizenBLL t_SeniorCitizenBLL = new SeniorCitizenBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;

            result = t_SeniorCitizenBLL.InsertSeniorCitizenCheckList(Data, AFields);

            if (result.Rows.Count > 0)
            {

                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }
        public string InsertUGMarksEntry(UGMarksEntry_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields =
            {
                "AppID"
                , "TMT_Physics"
                , "MOT_Physics"
                , "TMP_Physics"
                , "MOP_Physics"
                , "TMTP_Physics"
                , "TMOTP_Physics"
                , "TMT_Chemistry"
                , "MOT_Chemistry"
                , "TMP_Chemistry"
                , "MOP_Chemistry"
                , "TMTP_Chemistry"
                , "TMOTP_Chemistry"
                , "TMT_Math"
                , "MOT_Math"
                , "TMP_Math"
                , "MOP_Math"
                , "TMTP_Math"
                , "TMOTP_Math"
                , "TMT_Botany"
                , "MOT_Botany"
                , "TMP_Botany"
                , "MOP_Botany"
                , "TMTP_Botany"
                , "TMOTP_Botany"
                , "TMT_Zoology"
                , "MOT_Zoology"
                , "TMP_Zoology"
                , "MOP_Zoology"
                , "TMTP_Zoology"
                , "TMOTP_Zoology"
                , "PCMPercentage"
                , "TMT_PCM"
                , "MOT_PCM"
                , "TMP_PCM"
                , "MOP_PCM"
                , "TMTP_PCM"
                , "MOTP_PCM"
                , "TMT_PCB"
                , "MOT_PCB"
                , "TMP_PCB"
                , "MOP_PCB"
                , "TMTP_PCB"
                , "MOTP_PCB"
                , "PCBPercentage"
                , "ExamType"
               ,"CreatedBy"

               , "department"
               , "district"
               , "block"
               , "panchayat"
               , "office"
               , "officer"
               , "ServiceID"
               ,"ProfileID"
                 ,"KeyField"
                 ,"EditAppID"


            };

            System.Data.DataTable result = null;
            string UID = "";
            string EditAppID = "";

            UGMarksEntryBLL t_UGMarksEntryBLL = new UGMarksEntryBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.EditAppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;

            result = t_UGMarksEntryBLL.InsertUGMarksEntry(Data, AFields);
            //string t_LoginID = "";
            //string MailID, CCMailID, BCCMailID, Subject, MailText;
            //MailID = CCMailID = BCCMailID = Subject = MailText = "";
            if (result.Rows.Count > 0)
            {
                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }
        public string InsertOUATUGEducation(OUATUGEducation_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields =
            {
              "ProfileID"
              ,"FormBAppID"
              ,"CertificateName"
                 ,"EduRollNo"
                , "EduNameOfBoard"
                , "EduNameOfExamination"
                , "EduPassingYear"
                , "EduGrade"
                , "EduTotalMarks"
                , "EduMarkSecured"
                , "EduPercentage"
                ,"CreatedBy"

            };

            System.Data.DataTable result = null;
            string UID = "";
            UGMarksEntryBLL t_UGMarksEntryBLL = new UGMarksEntryBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;

            result = t_UGMarksEntryBLL.InsertOUATUGEducation(Data, AFields);

            if (result.Rows.Count > 0)
            {

                if (result.Rows[0]["Result"].ToString() == "1")
                {
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;
                }
                else
                {
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "UnSuccessfull";
                    t_ServiceResult.intStatus = 2;
                }

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }
        /*Validate Aadhaar Number*/
        public string ValidateAadhaarNo(string AadhaarNo)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            System.Data.DataTable result = null;
            string UID = "";
            SeniorCitizenBLL t_SeniorCitizenBLL = new SeniorCitizenBLL();
            ServiceResultForSeniorCitizen t_ServiceResult = new ServiceResultForSeniorCitizen();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            result = t_SeniorCitizenBLL.ValidateAadhaarNo(AadhaarNo);

            if (result != null && result.Rows.Count > 0)
            {
                t_ServiceResult.CardNo = result.Rows[0]["CardNo"].ToString();
                t_ServiceResult.District = result.Rows[0]["District"].ToString();
                t_ServiceResult.PoliceStation = result.Rows[0]["PoliceStation"].ToString();
                t_ServiceResult.AadhaarNo = result.Rows[0]["AadhaarNumber"].ToString();

                string statusid = result.Rows[0]["Status"].ToString();

                if (statusid == "3")
                {
                    //SMS Send To Applicant with login credentials
                    if (result.Rows[0]["Mobile"].ToString() != "" && result.Rows[0]["LoginId"].ToString() != "")
                    {
                        //SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                        //faild reason aadhaar already exist

                    }
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "AadhaarExistInCard";
                    t_ServiceResult.intStatus = 3;
                }
                else if (statusid == "4")
                {
                    //faild reason aadhaar already exist
                    if (result.Rows[0]["Mobile"].ToString() != "" && result.Rows[0]["LoginId"].ToString() != "")
                    {
                        SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());

                    }
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "AadhaarExist";
                    t_ServiceResult.intStatus = 4;
                }

            }


            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertCBCSAdmissionFormData(CBCSAdmissionForm_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
             "ProfileID"
            ,"AadhaarNumber"
            ,"AadhaarDetail"
            ,"AppName"
            ,"DOB"
            ,"Gender"
            ,"MotherTongue"
             ,"FatherName"
             ,"MotherName"
             ,"GuardianName"
            ,"Relation"
            ,"Category"
            ,"MobileNo"
            ,"EmailId"
            , "careOf"
            , "careOfLocal"
            , "districtLocal"
            , "houseNumber"
            , "houseNumberLocal"
            , "landmark"
            , "landmarkLocal"
            , "language"
            , "locality"
            , "localityLocal"
            , "phone"

            , "pincode"
            , "pincodeLocal"
            , "postOffice"
            , "postOfficeLocal"
            , "residentName"
            , "residentNameLocal"
            , "responseCode"
            , "state"
            , "stateLocal"
            , "district"
            , "street"
            , "streetLocal"
            , "subDistrict"
            , "subDistrictLocal"
            , "Village"
            , "statecode"
            , "districtcode"
            , "subDistrictcode"
            , "Villagecode"
            , "Image"
            , "ImageSign"
            , "ResponseType"
            , "JSONData"
            , "CurrentAddressXML"
            , "Password"
            , "LastCourseXML"
            , "AdmissionDate"
            ,"AdmissionNo"
            , "Branch"
            ,"CollegeCode"
            , "Subject1"
            , "Subject2"
            , "Subject3"
            , "Subject4"
            , "Subject5"
            , "Subject6"
             , "Subject7"
             , "Subject8"
            , "IsActive"
            , "CreatedBy"
            , "CreatedOn"

            };

            System.Data.DataTable result = null;
            string UID = "";
            CBCSAdmissionFormBLL t_InsertCBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            string CurrentAddressXML = GetCBCSAdmissionCurrentAddressXML(Data);
            Data.CurrentAddressXML = CurrentAddressXML;
            string t_Password = GenPassword();
            Data.Password = t_Password;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);
            //add in xml format data by vibhav 13 jun 017
            Data.LastCourseXML = GetCBCSCourseDetails_xml(Data.HeirsDXML);

            result = t_InsertCBCSAdmissionFormBLL.InsertCBCSAdmissionFormData(Data, AFields);
            string t_LoginID = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText;
            MailID = "";
            CCMailID = BCCMailID = Subject = MailText = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["Mobile"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                UID = result.Rows[0]["aadhaarNumber"].ToString();

                MailID = result.Rows[0]["MailID"].ToString();
                CCMailID = result.Rows[0]["CCMailID"].ToString();
                BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                Subject = result.Rows[0]["Subject"].ToString();
                MailText = result.Rows[0]["MailText"].ToString();

                MailText = @"


<html>
<head>
    <title>LOKASEBA ADHIKARA - Confirmation Email</title>    
</head>
<body style=""font-family: ''Andada'' , serif; background-color: #E0E0E0;"">
    <div style=""margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff;"">
        <table style=""padding: 1% 0; width: 100%"">
            <tr>
                <td align=""left"">
                    <img src=""https://lokaseba-odisha.in/g2c/img/lokaseba_logo.png"" alt=""LOKASEBA ADHIKARA""
                        style=""margin-left: 5%; height: 60px;"" />
                </td>
                <td align=""right"">
                    <img src=""https://lokaseba-odisha.in/WebApp/Kiosk/Images/OUAT.png"" alt=""Senior Citizen""
                        style=""margin-right: 5%; height: 60px;"" />
                </td>
            </tr>
        </table>

        <div style=""position: relative; background: #10A5DF; border: 1px solid #0C7FB5;"">
            <h1 style=""color: #fff; font-size: 20px; line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); text-transform: uppercase; font-family: arial;"">Senior Citizen ID Card 2017-18</h1>
        </div>
        <div style=""margin: 5% 5% 0;"">
            <p>
                Respected @Name,
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Your application for registration with Senior
                  Citizen Security Cell of Police Commissionerate, Bhubaneswar - Cuttack vide Application No. <b>@AppID</b> has been received and under process.
                 <span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">&nbsp;</span>
            </p>
            <p style="" font-family: Calibri, sans-serif;
            font-size: 11pt;
            color: rgb(0, 0, 0);
            letter-spacing: normal;margin: 0in 0in 0.0001pt; font-variant: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                The Login details  to access https://www.lokaseba-odisha.in  (Common Application Portal - CAP) are</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                LOGIN ID : <b>@Login</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                PASSWORD : <b>@Password</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>The login detail to be used for</b> </div>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>                    
                    <li>Checking the Application Status.
                    </li>                 
                </ul>

            </div>
            </div>
        <hr />
        <div style=""margin:0 5% 5%;"">
            
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">Regards</span>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13); font-weight: bold;"">Commissioner of Police,<br />
                    Bhubaneswar-Cuttack, Odisha.</span>
            </p>
        </div>
    </div>
</body>
</html>
";
                MailText = MailText.Replace("@AppID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", UID);

                SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "424", result.Rows[0]["AppID"].ToString(), UID);
                /*condition apply for app genreated by Nodal--*/
                //Mobile/Adhar already exist in the system.
                string statusid = result.Rows[0]["Status"].ToString();


                if (statusid == "2")
                {
                    //SMS Send To Applicant with login credentials
                    if (result.Rows[0]["Mobile"].ToString() != "")
                    {
                        //SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                        //faild reason aadhaar & mobile already exist
                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "AadhaarMobile";
                        t_ServiceResult.intStatus = 2;
                    }
                }
                else if (statusid == "3")
                {
                    //faild reason mobile already exist
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Mobile";
                    t_ServiceResult.intStatus = 3;

                }
                else if (statusid == "4")
                {
                    //faild reason aadhaar already exist
                    if (result.Rows[0]["Mobile"].ToString() != "")
                    {
                        //send sms to applicant
                        //SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "Aadhaar";
                        t_ServiceResult.intStatus = 4;
                    }
                }
                else
                {
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;
                    //SMS Send To Applicant
                    // SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                    //SMS Send To Nodal Officer stop sending message to nodal officer as Niraj sir on 29 july.
                    // SendSMS(result.Rows[0]["DeptMobile"].ToString(), result.Rows[0]["NodalSMSText"].ToString());
                }

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        //
        public string InsertEnrolementFormData(EnrolementAdmissionForm_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
             "ProfileID"
            ,"AadhaarNumber"
            ,"AadhaarDetail"
            ,"AppName"
            ,"DOB"
            ,"Gender"
            ,"MotherTongue"
             ,"FatherName"
             ,"MotherName"
             ,"GuardianName"
            ,"Relation"
            ,"Category"
            ,"MobileNo"
            ,"EmailId"
            , "careOf"
            , "careOfLocal"
            , "districtLocal"
            , "houseNumber"
            , "houseNumberLocal"
            , "landmark"
            , "landmarkLocal"
            , "language"
            , "locality"
            , "localityLocal"
            , "phone"

            , "pincode"
            , "pincodeLocal"
            , "postOffice"
            , "postOfficeLocal"
            , "residentName"
            , "residentNameLocal"
            , "responseCode"
            , "state"
            , "stateLocal"
            , "district"
            , "street"
            , "streetLocal"
            , "subDistrict"
            , "subDistrictLocal"
            , "Village"
            , "statecode"
            , "districtcode"
            , "subDistrictcode"
            , "Villagecode"
            , "Image"
            , "ImageSign"
            , "ResponseType"
            , "JSONData"
            , "CurrentAddressXML"
            , "Password"
            , "LastCourseXML"
            , "AdmissionDate"
            ,"AdmissionNo"
            , "Branch"

            ,"CollegeCode"
            
            , "Subject1"
            , "Subject2"
            , "Subject3"
            , "Subject4"
            , "Subject5"
            , "Subject6"
             , "Subject7"
            , "IsActive"
            , "CreatedBy"
            , "CreatedOn"
            , "RollNo"
            , "RegistrationNo"
            ,"Sublbl1"
            ,"Sublbl2"
            ,"Sublbl3"
            ,"Sublbl4"
            ,"Sublbl5"
            ,"Sublbl6"
            ,"Sublbl7"
            };

            System.Data.DataTable result = null;
            string UID = "";
            EnrolementBLL t_InsertEnrolementFormBLL = new EnrolementBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            string CurrentAddressXML = GetEnrolementCurrentAddressXML(Data);
            Data.CurrentAddressXML = CurrentAddressXML;
            string t_Password = GenPassword();
            Data.Password = t_Password;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);
            //add in xml format data by vibhav 13 jun 017
            Data.LastCourseXML = GetCBCSCourseDetails_xml(Data.HeirsDXML);
            result = t_InsertEnrolementFormBLL.InsertEnrolementFormData(Data, AFields);
            string t_LoginID = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText;
            MailID = "";
            CCMailID = BCCMailID = Subject = MailText = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["Mobile"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                UID = result.Rows[0]["aadhaarNumber"].ToString();

                MailID = result.Rows[0]["MailID"].ToString();
                CCMailID = result.Rows[0]["CCMailID"].ToString();
                BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                Subject = result.Rows[0]["Subject"].ToString();
                MailText = result.Rows[0]["MailText"].ToString();

                MailText = @"


<html>
<head>
    <title>LOKASEBA ADHIKARA - Confirmation Email</title>    
</head>
<body style=""font-family: ''Andada'' , serif; background-color: #E0E0E0;"">
    <div style=""margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff;"">
        <table style=""padding: 1% 0; width: 100%"">
            <tr>
                <td align=""left"">
                    <img src=""http://lokaseba-odisha.in/g2c/img/lokaseba_logo.png"" alt=""LOKASEBA ADHIKARA""
                        style=""margin-left: 5%; height: 60px;"" />
                </td>
                <td align=""right"">
                    <img src=""http://lokaseba-odisha.in/WebApp/Kiosk/Images/OUAT.png"" alt=""Senior Citizen""
                        style=""margin-right: 5%; height: 60px;"" />
                </td>
            </tr>
        </table>

        <div style=""position: relative; background: #10A5DF; border: 1px solid #0C7FB5;"">
            <h1 style=""color: #fff; font-size: 20px; line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); text-transform: uppercase; font-family: arial;"">+3 Examination Enrollment 2016-2017</h1>
        </div>
        <div style=""margin: 5% 5% 0;"">
            <p>
                Dear @Name,
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Your application for +3 Examination Enrollment 2016-2017 is saved.
                 <span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">&nbsp;</span>
            </p>
            
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                LOGIN ID : <b>@Login</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                PASSWORD : <b>@Password</b>
            </p>

 <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                Application No : <b>@AppID</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
           <p style="" font-family: Calibri, sans-serif;
            font-size: 11pt;
            color: rgb(0, 0, 0);
            letter-spacing: normal;margin: 0in 0in 0.0001pt; font-variant: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                You are request to visit the website http://sambalpur.lokaseba-odisha.in  to complete the Enrollment process.</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
           
            </div>
        <hr />
    </div>
</body>
</html>
";
                MailText = MailText.Replace("@AppID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", UID);

                SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "1456", result.Rows[0]["AppID"].ToString(), UID);
                /*condition apply for app genreated by Nodal--*/
                //Mobile/Adhar already exist in the system.
                string statusid = result.Rows[0]["Status"].ToString();


                if (statusid == "2")
                {
                    //SMS Send To Applicant with login credentials
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "RollNoExist";
                    t_ServiceResult.intStatus = 2;
                }
                else if (statusid == "3")
                {
                    //faild reason mobile already exist
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Mobile";
                    t_ServiceResult.intStatus = 3;

                }
                else if (statusid == "4")
                {
                    //faild reason aadhaar already exist
                    if (result.Rows[0]["Mobile"].ToString() != "")
                    {
                        //send sms to applicant
                        //SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "Aadhaar";
                        t_ServiceResult.intStatus = 4;
                    }
                }
                else
                {

                    EMailSMS t_EMailSMS = new EMailSMS();

                    t_EMailSMS.sendsms(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());

                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;
                    //SMS Send To Applicant
                    //SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                    //SMS Send To Nodal Officer stop sending message to nodal officer as Niraj sir on 29 july.
                    // SendSMS(result.Rows[0]["DeptMobile"].ToString(), result.Rows[0]["NodalSMSText"].ToString());
                }

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }
        private string GetCBCSCourseDetails_xml(string Data)
        {
            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "LastCourseAttended";
            dtCurrentTable.Columns.Add(new DataColumn("SNO", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("CourseName", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("BoardName", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("LastAttend", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("PassingYear", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("RegNo", typeof(string)));

            #region Code by Niraj

            Int32 intCount = default(Int32);
            Int32 StartIndex = default(Int32);
            Int32 EndIndex = default(Int32);
            Int32 Remstrlen = default(Int32);
            string strSave = null;
            string strTempString = null;
            string SrNo = null;
            string RemStr = null;
            //string strIngredient = "", strMonograph = "", strMonographID = "", strOtherMono = "", strStrength = "", strUnit = "";
            //string strMemberName = "", strRelationWithHOF = "", strAge = "", strNominated = "";

            if (Data.Length > 0)
            {
                strSave = Data;
                strTempString = Data;

                string[] arrRows = strTempString.Split(new char[] { '#' }, StringSplitOptions.RemoveEmptyEntries);
                string[] arrCols = null;

                for (int i = 0; i < arrRows.Length; i++)
                {
                    drCurrentRow = dtCurrentTable.NewRow();

                    arrCols = arrRows[i].Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                    //if (arrCols.Length == 5)
                    {
                        drCurrentRow["SNO"] = arrCols[0] == null || arrCols[0] == "" ? "" : arrCols[0];
                        drCurrentRow["CourseName"] = arrCols[1] == null || arrCols[1] == "" ? "" : arrCols[1];
                        drCurrentRow["BoardName"] = arrCols[2] == null || arrCols[2] == "" ? "" : arrCols[2];
                        drCurrentRow["LastAttend"] = arrCols[3] == null || arrCols[3] == "" ? "" : arrCols[3];
                        drCurrentRow["PassingYear"] = arrCols[4] == null || arrCols[4] == "" ? "" : arrCols[4];
                        drCurrentRow["RegNo"] = arrCols[5] == null || arrCols[5] == "" ? "" : arrCols[5];

                        dtCurrentTable.Rows.Add(drCurrentRow);
                    }


                }


            }

            #endregion Code by Niraj

            System.Data.DataTable dtprogXML = dtCurrentTable;

            string CBCSCourseDetails = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "CourseDetails";
            dtprogXML.WriteXml(swriter);
            CBCSCourseDetails = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return CBCSCourseDetails;


        }
        public string GetCBCSCourseLists()
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            CBCSAdmissionFormBLL t_CBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
            System.Data.DataTable dtCourseList = t_CBCSAdmissionFormBLL.GetCBCSCourseLists();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtCourseList.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["Course"],
                        Name = sdr["CourseName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetCBCSSubjectLists(string CourseName, string SubjectType)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            CBCSAdmissionFormBLL t_CBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
            System.Data.DataSet dtCourseList = t_CBCSAdmissionFormBLL.GetCBCSCourseSubject(CourseName, SubjectType);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtCourseList.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["SubjectCode"],
                        Name = sdr["SubjectName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }
        public string GetRelationList()
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            CBCSAdmissionFormBLL t_CBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
            System.Data.DataSet dtCourseList = t_CBCSAdmissionFormBLL.GetRelationList();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtCourseList.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["Relation"],
                        Name = sdr["Relation"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetApplicationDetails(string AppID)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            CBCSAdmissionFormBLL t_CBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
            System.Data.DataSet dtAppList = t_CBCSAdmissionFormBLL.GetApplicationDetails(AppID);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtAppList.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        AppID = sdr["AppID"],
                        AdmissionNo = sdr["AdmissionNo"],
                        AdmissionDate = sdr["AdmissionDate"],
                        BranchCode = sdr["BranchCode"],
                        BranchName = sdr["BranchName"],
                        Name = sdr["Name"],
                        Mobile = sdr["Mobile"],
                        Email = sdr["Email"],
                        Father = sdr["Father"],
                        Mother = sdr["Mother"],
                        Gaurdian = sdr["Gaurdian"],
                        Relation = sdr["Relation"],
                        DOB = sdr["DOB"],
                        Gender = sdr["Gender"],
                        MotherTongue = sdr["MotherTongue"],
                        Category = sdr["Category"],
                        UserId = sdr["CreatedBy"],
                        Age = sdr["Age"],
                        CollegeCode = sdr["CollegeCode"],
                        CollegeName = sdr["CollegeName"],
                        SubjectList = sdr["SubjectList"],


                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetStudentDetails(string EnrolementNo, string Branch)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            //CBCSAdmissionFormBLL t_CBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
            EnrolementBLL enrolementBAL = new EnrolementBLL();
            System.Data.DataSet dtAppList = enrolementBAL.GetStudentDetails(EnrolementNo, Branch);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtAppList.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        //AppID = sdr["AppID"],
                        //AdmissionNo = sdr["AdmissionNo"],
                        //AdmissionDate = sdr["AdmissionDate"],
                        BranchCode = sdr["Branch"],
                        BranchName = sdr["BranchName"],
                        Name = sdr["FUNAME"],
                        //Mobile = sdr["Mobile"],
                        //Email = sdr["Email"],
                        //Father = sdr["Father"],
                        //Mother = sdr["Mother"],
                        //Gaurdian = sdr["Gaurdian"],
                        //Relation = sdr["Relation"],
                        //DOB = sdr["DOB"],
                        Gender = sdr["SEX"],
                        //MotherTongue = sdr["MotherTongue"],
                        Category = sdr["CAT"],
                        //UserId = sdr["CreatedBy"],
                        //Age = sdr["Age"],
                        CollegeCode = sdr["College"],
                        CollegeName = sdr["COLLEGENAME"],
                        RegdNo =sdr["REGDNO"]
                        
                        //SubjectList = sdr["SubjectList"],


                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string InsertAdmissionFormDataByDEO(CBCSAdmissionForm_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
            // "ProfileID"
            //,"AadhaarNumber"
            //,"AadhaarDetail"
            "AppName"
            ,"DOB"
            ,"Gender"
            ,"MotherTongue"
             ,"FatherName"
             ,"MotherName"
             ,"GuardianName"
            ,"Relation"
            ,"Category"
            ,"MobileNo"
            ,"EmailId"
           
            //, "LastCourseXML"
            , "AdmissionDate"
            ,"AdmissionNo"
            , "Branch"
            ,"CollegeCode"
            , "Subject1"
            , "Subject2"
            , "Subject3"
            , "Subject4"
            , "Subject5"
            , "Subject6"
            , "Subject7"
            , "Subject8"
            , "IsActive"
            , "CreatedBy"
            , "CreatedOn"
             ,"Sublbl1"
            ,"Sublbl2"
            ,"Sublbl3"
            ,"Sublbl4"
            ,"Sublbl5"
            ,"Sublbl6"
            ,"Sublbl7"
            ,"Sublbl8"
            };

            System.Data.DataTable result = null;
            string UID = "";
            CBCSAdmissionFormBLL t_InsertCBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);
            //add in xml format data by vibhav 13 jun 017
            //Data.LastCourseXML = GetCBCSCourseDetails_xml(Data.HeirsDXML);

            result = t_InsertCBCSAdmissionFormBLL.InsertAdmissionFormDataByDEO(Data, AFields);
            string t_LoginID = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText;
            MailID = "";
            CCMailID = BCCMailID = Subject = MailText = "";
            if (result.Rows.Count > 0)
            {

                MailID = result.Rows[0]["MailID"].ToString();
                CCMailID = result.Rows[0]["CCMailID"].ToString();
                BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                Subject = result.Rows[0]["Subject"].ToString();
                MailText = result.Rows[0]["MailText"].ToString();

                MailText = @"

<html>
<head>
    <title>+3 EXAMINATION ENROLLMENT - 2017</title>

</head>
<body>    
        <div>
            <div style='margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff; font-family: Arial'>
                <table style='padding: 1% 0; width: 100%'>
                    <tr>
                        <td align='left'>
                            <img src='http://sambalpur.lokaseba-odisha.in/WebApp/Kiosk/Images/sambalpur-university-logo.png' alt='Sambalpur University'
                                style='margin-left: 15%; height: 70px;' />
                        </td>
                        <td style='text-align: center;'>
                            <div style='font-family: Arial; font-size: 25px; font-weight: bolder; color: #800000'>SAMBALPUR UNIVERSITY</div>
                            <div style='font-size: 13px; font-weight: normal; padding: 3px;'>Accredited with Grade-A by NAAC (Second Cycle)</div>
                            <div style='font-size: 16px; font-weight: normal; text-transform: uppercase; font: 15px; color: #003500'>Jyoti Vihar, Burla</div>
                        </td>
                        <td align='right'>
                            <img src='https://www.lokaseba-odisha.in/g2c/img/lokaseba_logo.png' alt='LOKASEBA ADHIKARA'
                                style='margin-right: 15%; height: 70px;' />
                        </td>
                    </tr>
                </table>

                <div style='position: relative; background: #10A5DF; border: 1px solid #0C7FB5;'>
                    <h1 style='color: #fff; font-size: 20px; line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); text-transform: uppercase; font-family: arial;'>+3 Examination EnroLlment - 2017</h1>
                </div>
                <div style='margin: 5% 5% 0; font-family: Arial;'>
                    <p>
                        Dear @Name,
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    </p>
                    <b><span style='color: rgb(0, 112, 192); font-family: Arial;'>Your, +3 Examination Enrollment for 2017 process has been initiated.</span></b><p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        <span style='color: rgb(13, 13, 13);'>&nbsp;</span>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        Please find the details
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        &nbsp;
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        ADMISSION NO : <b>@AdmissionNo</b>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        APPLICATION NO. : <b>@ReferenceID</b>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        STUDENT NAME: <b>@StudentName</b>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        DATE OF BIRTH : <b>@DOB</b>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        MOBILE NO. : <b>@MobileNo</b>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        &nbsp;
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        You are requested to visit website&nbsp; <a href='@Weblink1'>@Weblink1</a>&nbsp; OR&nbsp;  <a href='@Weblink2' target='_blank'>@Weblink2</a> to complete the +3 Examination Process
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        OR else you will NOT BE ELIGIABLE to appear in SEMESTER EXAMINATION
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        &nbsp;
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        STEPS TO COMPLETE THE APPLICATION :
                    </p>
                    <ol class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        <li>Visit Website  <a href='@Weblink0' target='_blank'>@Weblink0</a>
                        </li>

                        <li class='MsoNormal'
                            style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>Search Your Application by entering
                        <ul>
                            <li>
								a. <strong>Admission No</strong>
                            </li>
                            <li>
                                b. <strong>Date of Birth</strong></li>
                            <li>
                                c. OR any one&nbsp; &quot;<strong>Mobile No</strong>&quot; OR &quot;<strong>Student Name</strong>&quot; OR &quot;<strong>Application No</strong>&quot;</li>
                            <li>
                                d. <strong>Captcha</strong></li>

                        </ul>
                        </li>
                        <li>
                            Pre-filled application open</li>
                        <li>
                            Upload the Recent <strong>Photograph</strong> and <strong>Signature</strong> (as per prescribed specification)</li>
                        <li>
                            Enter the <strong>Education Qualification</strong></li>
                        <li>
                            Fill all the fields</li>
                        <li>
                            After filling the FORM click on &quot;<strong>Register &amp; Proceed</strong>&quot; button</li>
                        <li>
                            <strong>SMS</strong> and <strong>EMAIL</strong> will be send - containg the LOGIN details for Exam related activities</li>
                        <li>
                            Upload the supporting <strong>Documents</strong></li>
                        <li>
                            <strong>Make Payment</strong></li>
                        <li>
                            Acknowledgement will be generated - <strong>PRINT</strong> the acknowledgment</li>
                        <li>
                            You need to <strong>SUMBIT</strong> the Acknowledgment to college after signing it

                        </li>
                    </ol>
                    <p style='font-family calibri, sans-serif; font-size 11pt; color rgb(0, 0, 0); letter-spacing normal; margin 0in 0in 0.0001pt; font-variant normal; line-height normal; orphans auto; text-align start; text-indent 0px; white-space normal; widows auto; word-spacing 0px; -webkit-text-stroke-width 0px; background-color rgb(253, 253, 253);'>
                        After completing the process, please Login into <a href='https://lokaseba-odisha.in' target='_blank'>LOKASEBA ADHIKARA (Common Application Portal - CAP) </a>to check the Application.
                    </p>
                    <p style='font-family calibri, sans-serif; font-size 11pt; color rgb(0, 0, 0); letter-spacing normal; margin 0in 0in 0.0001pt; font-variant normal; line-height normal; orphans auto; text-align start; text-indent 0px; white-space normal; widows auto; word-spacing 0px; -webkit-text-stroke-width 0px; background-color rgb(253, 253, 253);'>
                        Last date for submission of FORM is <strong>Monday, 16th November 2017</strong></p>
                </div>
                <div style='margin: 0 5% 5%;'>
                    <p style='font-family calibri, sans-serif; font-size: 20px; !important; color :red; letter-spacing normal; margin 0in 0in 0.0001pt; font-variant normal; line-height normal; orphans auto; text-align start; text-indent 0px; white-space normal; widows auto; word-spacing 0px; -webkit-text-stroke-width 0px; background-color rgb(253, 253, 253);'>
                        <strong>PLEASE NOTE:</strong>   Examination <strong>ROLL NO</strong> and <strong>REGISTRATION NO</strong> shall <strong>NOT be GENERATED</strong> if any of the above step is not completed and you not be allowed to apear in examination.</p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        &nbsp;</p>

                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        <span style='color: rgb(13, 13, 13);'>Regards</span>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        <span class='auto-style1'>SAMBALPUR UNIVERSITY</span><span style='color: rgb(13, 13, 13); font-weight: bold;'>, </span><span class='auto-style1'>Burla</span>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        Website : <a href='@Weblink1'>@Weblink1</a>&nbsp; OR&nbsp; <a href='https://lokaseba-odisha.in' target='_blank'>https://lokaseba-odisha.in</a>
                    </p>
                </div>
            </div>
        </div>
</body>
</html>
";

                /*condition apply for app genreated by Nodal--*/
                //Mobile/Adhar already exist in the system.
                string statusid = result.Rows[0]["Status"].ToString();


                if (statusid == "3")
                {
                    //faild reason mobile already exist
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Mobile";
                    t_ServiceResult.intStatus = 3;

                }
                else if (statusid == "4") //admission noalready exist
                {
                    //faild reason mobile already exist
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "AdmissionNo";
                    t_ServiceResult.intStatus = 4;

                }
                else
                {
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;
                    if (result.Rows[0]["Mobile"].ToString() != "")
                    {
                        //SMS Send To Applicant
                        SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["SMSText"].ToString());
                    }

                    if (result.Rows[0]["MailID"].ToString() != "")
                    {
                        MailText = MailText.Replace("@ReferenceID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@AdmissionNo", result.Rows[0]["AdmissionNo"].ToString()).Replace("@Login", UID).Replace("@StudentName", result.Rows[0]["Name"].ToString()).Replace("@DOB", result.Rows[0]["DOB"].ToString()).Replace("@MobileNo", result.Rows[0]["Mobile"].ToString()).Replace("@Weblink0", result.Rows[0]["Weblink0"].ToString()).Replace("@Weblink1", result.Rows[0]["Weblink1"].ToString()).Replace("@Weblink2", result.Rows[0]["Weblink2"].ToString());

                        SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "424", result.Rows[0]["AppID"].ToString(), UID);
                    }

                }

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }



        public string InsertBackExamFormDataByDEO(BackExamForm_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "ProfileID"
                ,"AadhaarNumber"
                ,"RollNo"
                ,"RedgNo"
                ,"CollegeCode"
                ,"AppName"
                ,"FatherName"
                ,"MotherName"
                ,"DOB"
                ,"Gender"
                ,"religion"
                ,"Tongue"
                ,"nationality"
                ,"Category"
                ,"MobileNo"
                ,"EmailId"
                , "Branch"
                ,"Exam_Type"
                ,"Exam_Freq"
                ,"TotalAmount"
                , "IsActive"
                , "CreatedBy"
                ,"CreatedOn"
                ,"paper1",
                "paper2",
                "paper3",
                "paper4",
                "paper5",
                "paper6",
                "paper7",
                "paper8",
                
                "Upaper1",
                "Upaper2",
                "Upaper3",
                "Upaper4",
                "Upaper5",
                "Upaper6",
                "Upaper7",
                "Upaper8",
             
                "SubCode1",
                "SubCode2",
                "SubCode3",
                "SubCode4",
                "SubCode5",
                "SubCode6",
                "SubCode7",
                "SubCode8",
                
                "Image",
                "ImageSign"
            };

            System.Data.DataTable result = null;
            string UID = "";
            string AppID = "";
            BackExamBLL t_InsertBackExamBLL = new BackExamBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;


            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            //add in xml format data by vibhav 13 jun 017
            //Data.LastCourseXML = GetCBCSCourseDetails_xml(Data.HeirsDXML);

            result = t_InsertBackExamBLL.InsertBackExamFormDataByDEO(Data, AFields);
         
            string t_LoginID = ""; string t_Password = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText;
            MailID = "";
            CCMailID = BCCMailID = Subject = MailText = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["Mobile"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                UID = result.Rows[0]["aadhaarNumber"].ToString();

                MailID = result.Rows[0]["MailID"].ToString();
                CCMailID = result.Rows[0]["CCMailID"].ToString();
                BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                Subject = result.Rows[0]["Subject"].ToString();
                MailText = result.Rows[0]["MailText"].ToString();

                MailText = @"


<html>
<head>
    <title>LOKASEBA ADHIKARA - Confirmation Email</title>    
</head>
<body style=""font-family: ''Andada'' , serif; background-color: #E0E0E0;"">
    <div style=""margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff;"">
        <table style=""padding: 1% 0; width: 100%"">
            <tr>
                <td align=""left"">
                    <img src=""https://lokaseba-odisha.in/g2c/img/lokaseba_logo.png"" alt=""LOKASEBA ADHIKARA""
                        style=""margin-left: 5%; height: 60px;"" />
                </td>
                <td align=""right"">
                    <img src=""https://lokaseba-odisha.in/WebApp/Kiosk/Images/sambalpur-university-logo.png"" alt=""Senior Citizen""
                        style=""margin-right: 5%; height: 60px;"" />
                </td>
            </tr>
        </table>

        <div style=""position: relative; background: #10A5DF; border: 1px solid #0C7FB5;"">
            <h1 style=""color: #fff; font-size: 20px; line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); text-transform: uppercase; font-family: arial;"">SAMBALPUR UNIVERSITY</h1>
        </div>
        <div style=""margin: 5% 5% 0;"">
            <p>
                Respected @Name,
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">You have sucessfully registered in Sambalpur University Portal with Application No. @AppID.
                 <span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">&nbsp;</span>
            </p>
            <p style="" font-family: Calibri, sans-serif;
            font-size: 11pt;
            color: rgb(0, 0, 0);
            letter-spacing: normal;margin: 0in 0in 0.0001pt; font-variant: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                The Login details to access http://sambalpur.lokaseba-odisha.in </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                LOGIN ID : <b>@Login</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                PASSWORD : <b>@Password</b>
            </p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">

            </div>
            </div>
        <hr />
        <div style=""margin:0 5% 5%;"">
            
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">Regards</span>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                Sambalpur University<br /><span style=""color: rgb(13, 13, 13); font-weight: bold;""><span color: rgb(13, 13, 13); font-weight: bold;"">Joti Vihar, Burla, Odisha, </span><br />
                    http://sambalpur.lokaseba-odisha.in</span>
            </p>
        </div>
    </div>
</body>
</html>
";
                MailText = MailText.Replace("@AppID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", UID);

                SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "1451", result.Rows[0]["AppID"].ToString(), UID);
                /*condition apply for app genreated by Nodal--*/
                //Mobile/Adhar already exist in the system.
                string statusid = result.Rows[0]["Status"].ToString();



                t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.RollNo = result.Rows[0]["RollNo"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;
                //SMS Send To Applicant
                SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["SMSText"].ToString());
                //SMS Send To Nodal Officer stop sending message to nodal officer as Niraj sir on 29 july.
                // SendSMS(result.Rows[0]["DeptMobile"].ToString(), result.Rows[0]["NodalSMSText"].ToString());

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        #region CharaterCertificate
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

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your NFBS Application is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        #endregion

        #region Residence

        public string GetCCTNSDistrict()
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ResidenceBAL residenceBAL = new ResidenceBAL();
            System.Data.DataTable dtDistrict = residenceBAL.GetResidenceDist();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["Districtcode"],
                        Name = sdr["Districtname"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }
        public string GetCCTNSSubDiv(int DistCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ResidenceBAL residenceBAL = new ResidenceBAL();
            System.Data.DataTable dtDistrict = residenceBAL.GetResidenceSubDiv(DistCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["SubDivisionCode"],
                        Name = sdr["SubDivisionName"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }
        public string GetCCTNSTahsil(int DistCode, int SubDiv)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ResidenceBAL residenceBAL = new ResidenceBAL();
            System.Data.DataTable dtDistrict = residenceBAL.GetResidenceTahsil(DistCode, SubDiv);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["TahsilCode"],
                        Name = sdr["TahsilName"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }
        public string GetCCTNSBlock(int DistCode, int SubDiv)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ResidenceBAL residenceBAL = new ResidenceBAL();
            System.Data.DataTable dtDistrict = residenceBAL.GetResidenceBlock(DistCode, SubDiv);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["BlockCode"],
                        Name = sdr["BlockName"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }
        public string GetCCTNSRI(int DistCode, int SubDiv, int Tahsil)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ResidenceBAL residenceBAL = new ResidenceBAL();
            System.Data.DataTable dtDistrict = residenceBAL.GetResidenceRI(DistCode, SubDiv, Tahsil);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["RICode"],
                        Name = sdr["RIName"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string InsertResidence(CCTNSResidence Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");
            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                 "vDistrictName"
                ,"vTalukaName"

                ,"ApplicantType"
                ,"ApplicantName"
                ,"RelationType"
                ,"IdentificationType"
                ,"IdentificationNumber"
                ,"FirstName"
                ,"MiddleName"
                ,"LastName"
                ,"FatherFName"
                ,"FatherMName"
                ,"FatherLName"
                ,"MotherFName"
                ,"MotherMName"
                ,"MotherLName"
                ,"DOB"
                ,"Age"
                ,"Gender"
                ,"MaritalStatus"
                ,"EmailID"
                ,"SpouseFName"
                ,"SpouseMName"
                ,"SpouseLName"
                ,"SpouseRelation"
                ,"MobileNo"
                ,"StdCode"
                ,"Phone"
                ,"ApplyPurpose"
                ,"Area"
                ,"AddressLine1"
                ,"AddressLine2"
                ,"RoadStreetName"
                ,"State"
                ,"StateName"
                ,"District"
                ,"DistrictName"
                ,"Subdivision"
                ,"SubdivisionName"
                ,"Tehsil"
                ,"Tehsilname"
                ,"RI"
                ,"RIName"
                ,"Taluka"
                ,"TalukaName"
                ,"Village"
                ,"PGPULB"
                ,"PoliceStation"
                ,"PostOffice"
                ,"PinCode"
                ,"Address"
                ,"CArea"
                ,"CAddressLine1"
                ,"CAddressLine2"
                ,"CRoadStreetName"
                ,"CState"
                ,"CStateName"
                ,"CDistrict"
                ,"CDistrictName"
                ,"CSubdivision"
                ,"CSubdivisionName"
                ,"CTehsil"
                ,"CTehsilName"
                ,"CRI"
                ,"CRIName"
                ,"CTaluka"
                ,"CTalukaName"
                ,"CVillage"
                ,"CPGPULB"
                ,"CPPoliceStation"
                ,"CPPostOffice"
                ,"CPPinCode"
                ,"Read"
                ,"Write"
                ,"Speak"
                ,"PassOriyaY"
                ,"PassOriyaN"
                ,"RORY"
                ,"RORN"
                ,"rorDistr"
                ,"rorSubDiv"
                ,"rorTahsil"
                ,"rorRI"
                ,"rorPoliceStn"
                ,"rorVilg"
                ,"KhataNo"
                ,"RecordedTenant"
                ,"RecodTenantReltion"
                ,"SaleDeedNo"
                ,"SaleDeedDte"
                ,"ResidingDtlYear"
                ,"PlotDetail"
                ,"SubmitterType"

                ,"CreatedBy"
                ,"Createdon"
                ,"IsActive"
                ,"AppID"
                ,"IsVarified"



                    };

            System.Data.DataTable result = null;
            string AppID = "";
            ResidenceBAL residenceBAL = new ResidenceBAL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            result = residenceBAL.InsertData(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0][0].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your NFBS Application is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        #endregion

        #region ComplaintRegistration

        public string InsComplaintReg(ComplaintReg Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");
            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                 "vDistrictName"
                ,"vTalukaName"

                ,"ApplicantType"
                ,"ApplicantName"
                ,"ApplicantCountry"
                ,"IdentificationType"
                ,"IdentificationNumber"
                ,"PassPortDate"
                ,"PassPortPlace"
                ,"UID"
                ,"FirstName"
                ,"MiddleName"
                ,"LastName"
                ,"Gender"
                ,"DOB"
                ,"DOBY"
                ,"Age"
                ,"AgeRFrom"
                ,"AgeRTo"
                ,"EmailID"
                ,"MobileNo"
                ,"StdCode"
                ,"PhoneNo"
                ,"RelativeType"
                ,"RelativeName"
                ,"ComplaintNature"

                ,"isSameAddr"

                ,"PCareOf"
                ,"PHouseNo"
                ,"Pstreet"
                ,"Parea"
                ,"Pcountry"
                ,"Pstate"
                ,"Pdist"
                ,"PPoliceS"
                ,"Pblock"
                ,"Ppanchayat"
                ,"Ppincode"
                ,"CCareOf"
                ,"CHouseNo"
                ,"Cstreet"
                ,"Carea"
                ,"Ccountry"
                ,"Cstate"
                ,"Cdist"
                ,"CPoliceS"
                ,"Cblock"
                ,"Cpanchayat"
                ,"Cpincode"

                ,"AUID"
                ,"AFName"
                ,"AMName"
                ,"ALName"
                ,"AMobileNo"
                ,"AStdCcode"
                ,"APhoneNo"

                ,"APHouseNo"
                ,"APstreet"
                ,"AParea"
                ,"APcountry"
                ,"APstate"
                ,"APdist"
                ,"APPoliceS"
                ,"APblock"
                ,"APpanchayat"
                ,"APpincode"

                ,"APIsSameAddr"

                ,"ACHouseNo"
                ,"ACstreet"
                ,"ACarea"
                ,"ACcountry"
                ,"ACstate"
                ,"ACdist"
                ,"ACPoliceS"
                ,"ACblock"
                ,"ACpanchayat"
                ,"ACpincode"

                ,"IncdPlace"
                ,"IsIncdDateKnow"
                ,"IncdDateFrom"
                ,"IncdDateTo"
                ,"IncdType"
                ,"IsPSKow"
                ,"IsDisKNow"
                ,"CompDis"
                ,"CompPS"
                ,"CompOffice"
                ,"CompDdate"
                ,"CompDesc"
                ,"Remark"

                ,"CreatedBy"
                ,"Createdon"
                ,"IsActive"
                ,"AppID"
                ,"IsVarified"

            };

            System.Data.DataTable result = null;
            string AppID = "";
            ComplaintRegBAL _ComplaintRegBAL = new ComplaintRegBAL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            result = _ComplaintRegBAL.InsertData(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                if (result.Rows[0]["Mobile"].ToString().Trim() != "" || result.Rows[0]["Mobile"].ToString() != null)
                {
                    SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Complaint is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
                }
                //SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "388", result.Rows[0]["AppID"].ToString(), UID);

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        #endregion

        #region CCTNS Master Data

        public string GetCCTNSMRelation()
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ComplaintRegBAL ComplaintRegBAL = new ComplaintRegBAL();
            System.Data.DataTable dtDistrict = ComplaintRegBAL.GetCCTNSNationality();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["ID"],
                        Name = sdr["NAME"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetCCTNSMIdentity()
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ComplaintRegBAL ComplaintRegBAL = new ComplaintRegBAL();
            System.Data.DataTable dtDistrict = ComplaintRegBAL.GetCCTNSIdentity();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["ID"],
                        Name = sdr["NAME"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetCCTNSMNationality()
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ComplaintRegBAL ComplaintRegBAL = new ComplaintRegBAL();
            System.Data.DataTable dtDistrict = ComplaintRegBAL.GetCCTNSNationality();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["ID"],
                        Name = sdr["NAME"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetCCTNSMState()
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ComplaintRegBAL ComplaintRegBAL = new ComplaintRegBAL();
            System.Data.DataTable dtDistrict = ComplaintRegBAL.GetCCTNSState();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["ID"],
                        Name = sdr["NAME"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetCCTNSMDistrict(int STATEID)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ComplaintRegBAL ComplaintRegBAL = new ComplaintRegBAL();
            System.Data.DataTable dtDistrict = ComplaintRegBAL.GetCCTNSDistrict(STATEID);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["ID"],
                        Name = sdr["NAME"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetCCTNSMPoliceStation(int STATEID, int DISTRICTID)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ComplaintRegBAL ComplaintRegBAL = new ComplaintRegBAL();
            System.Data.DataTable dtDistrict = ComplaintRegBAL.GetCCTNSPolicStation(STATEID, DISTRICTID);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["ID"],
                        Name = sdr["NAME"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetCCTNSMOffice(int STATEID, int DISTRICTID)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            ComplaintRegBAL ComplaintRegBAL = new ComplaintRegBAL();
            System.Data.DataTable dtDistrict = ComplaintRegBAL.GetCCTNSOffice(STATEID, DISTRICTID);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtDistrict.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["ID"],
                        Name = sdr["NAME"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        #endregion

        #region eMunicipality Services

        public string InsertBirthCertificate(BirthCertificate_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                 "aadhaarNumber"
                ,"txtregNo"
                ,"txtChildName"
                ,"ddlGender"
                ,"ddlGenderName"
                ,"DOB"
                ,"lblPOB"
                ,"FatherName"
                ,"MotherName"
                ,"hospname"
                ,"txtAddressLine1"
                ,"txtAddressLine2"
                ,"txtRoadStreet"
                ,"txtlandMark"
                ,"txtLocality"
                ,"ddlState"
                ,"ddlStateName"
                ,"ddlDistrict"
                ,"ddlDistrictName"
                ,"ddlSubDistrict"
                ,"ddlSubDistrictName"
                ,"ddlVillage"
                ,"ddlVillageName"
                ,"txtPincode"
                ,"ddlIdentificationType"
                ,"ddlIdentificationTypeName"
                ,"txtIdentificationNumber"
                ,"drpAppRel"
                ,"txtReltionWC"
                ,"drpAppTitle"
                ,"txtApplicantName"
                ,"txtAppTelNo"
                ,"txtAppMobNo"
                ,"txtAppEmailID"
                ,"drpAppReligion"
                ,"txtReligion"
                ,"txtAppAddressLine1"
                ,"txtAppAddressLine2"
                ,"txtAppRoadStreet"
                ,"txtApplandMark"
                ,"txtAppLocality"
                ,"ddlNationality"
                ,"ddlNationalityName"
                ,"ddlPState"
                ,"ddlPStateName"
                ,"ddlPDistrict"
                ,"ddlPDistrictName"
                ,"ddlPSubDistrict"
                ,"ddlPSubDistrictName"
                ,"ddlPVillage"
                ,"ddlPVillageName"
                ,"txtAppPincode"

                ,"CreatedBy"
                ,"Createdon"
                ,"IsActive"
                ,"AppID"
                ,"SvcID"
                ,"IsVarified"
                ,"vDistrictName"
                ,"vTalukaName"


            };

            DataTable result = null;
            string AppID = "";
            BirthCertificateBLL t_BirthCertificateBLL = new BirthCertificateBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            result = t_BirthCertificateBLL.Insert(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;
            }
            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        #endregion


        /***** Sambalpur University *****/
        public string GetCollegeMaster()
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            MigrationSUBLL t_MigrationBLL = new MigrationSUBLL();
            System.Data.DataTable dtCollege = t_MigrationBLL.GetCollegeMaster();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtCollege.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["CollegeCode"],
                        Name = sdr["CollegeName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetSUBranchMaster()
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            MigrationSUBLL t_MigrationSUBLL = new MigrationSUBLL();
            System.Data.DataTable dtBranchMaster = t_MigrationSUBLL.GetBranchMaster();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtBranchMaster.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["BranchCode"],
                        Name = sdr["CourseName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string InsertMigrationSU(MigrationSU_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                      "aadhaarNumber"
                    , "ProfileID"
                    , "StudentType"
                    , "CollegeCode"
                    , "CollegeName"
                    , "RegistrationNo"
                    , "RollNo"
                    , "ExaminationDetails"
                    , "LastExamDate"
                    , "AdmissionYear"
                    , "Program"
                    , "Class"
                    , "JoiningCollege"
                    , "Joininguniversity"
                    , "Reason"
                    , "CreatedBy"
                    , "CreatedOn"
                    , "ClientIP"
                    , "department"
                    , "district"
                    , "block"
                    , "panchayat"
                    , "office"
                    , "officer"
                    , "RegCardStatus"
                    , "Image"
                    , "ImageSign"
                    , "DOB"
                    ,"Gender"
                    ,"Mobile"
                    ,"EmailID"
                    ,"FatherName"
                    ,"Candidate"
        };

            System.Data.DataTable result = null;
            string AppID = "";
            MigrationSUBLL t_MigrationSUBLL = new MigrationSUBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_MigrationSUBLL.InsertMigrationSU(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Request for Migration is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertTransferSU(CollegeTransfer_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                      "aadhaarNumber"
                    ,  "ProfileID"
                   ,  "StudentType"
                    , "RegistrationNo"
                    , "RollNo"
                    , "AdmissionYear"

                    , "CollegeCode"
                    , "CollegeName"
                    , "Program"
                    , "Class"

                    , "Subject1"
                    , "Subject2"
                    , "Subject3"
                    , "Subject4"
                    , "Subject5"
                    , "Subject6"
                    , "Subject7"

                    , "JoiningCollegeCode"
                    , "JoiningCollegeName"
                    , "JoiningProgram"
                    , "JoiningClass"

                    , "Reason"
                    , "CreatedBy"
                    , "CreatedOn"
                    , "ClientIP"
                    , "department"
                    , "district"
                    , "block"
                    , "panchayat"
                    , "office"
                    , "officer"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            TransferSUBLL t_TransferSUBLL = new TransferSUBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_TransferSUBLL.InsertTransferSU(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Request for Migration is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertDuplicateDegree(DuplicateDegree_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                      "aadhaarNumber"
                    , "ProfileID"
                    , "StudentType"
                    , "RegistrationNo"
                    , "RollNo"
                    , "AdmissionYear"
                    , "PassingYear"
                    , "LastExamDate"
                    , "ExaminationDetails"

                    , "CollegeCode"
                    , "CollegeName"
                    , "Program"

                    , "Subject1"
                    , "Subject2"
                    , "Subject3"
                    , "Subject4"

                    , "Reason"
                    , "CreatedBy"
                    , "CreatedOn"
                    , "ClientIP"
                    , "department"
                    , "district"
                    , "block"
                    , "panchayat"
                    , "office"
                    , "officer"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            DuplicateDegreeSUBLL t_DuplicateDegreeSUBLL = new DuplicateDegreeSUBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_DuplicateDegreeSUBLL.InsertDuplicateDegreeSU(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Request for Migration is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertProvisionalCertificate(ProvisionalCertificate_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                      "aadhaarNumber"
                    , "ProfileID"
                    , "StudentType"
                    , "RegistrationNo"
                    , "RollNo"
                    , "AdmissionYear"
                    , "PassingYear"
                    , "LastExamDate"

                    , "CollegeCode"
                    , "CollegeName"
                    , "Program"
                    , "Result"
                    , "ExamName"

                    , "Reason"
                    , "CreatedBy"
                    , "CreatedOn"
                    , "ClientIP"
                    , "department"
                    , "district"
                    , "block"
                    , "panchayat"
                    , "office"
                    , "officer"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            ProvisionalSUBLL t_ProvisionalSUBLL = new ProvisionalSUBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_ProvisionalSUBLL.InsertProvisionalSU(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Request for Migration is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertCBCSAdmissionFormDataByStudent(CBCSAdmissionForm_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                "AppID"
             ,"ProfileID"
            ,"AadhaarNumber"
            ,"AadhaarDetail"
            ,"AppName"
            ,"DOB"
            ,"Gender"
            ,"MotherTongue"
             ,"FatherName"
             ,"MotherName"
             ,"GuardianName"
            ,"Relation"
            ,"Category"
            ,"MobileNo"
            ,"EmailId"
            , "careOf"
            , "careOfLocal"
            , "districtLocal"
            , "houseNumber"
            , "houseNumberLocal"
            , "landmark"
            , "landmarkLocal"
            , "language"
            , "locality"
            , "localityLocal"
            , "phone"

            , "pincode"
            , "pincodeLocal"
            , "postOffice"
            , "postOfficeLocal"
            , "residentName"
            , "residentNameLocal"
            , "responseCode"
            , "state"
            , "stateLocal"
            , "district"
            , "street"
            , "streetLocal"
            , "subDistrict"
            , "subDistrictLocal"
            , "Village"
            , "statecode"
            , "districtcode"
            , "subDistrictcode"
            , "Villagecode"
            , "Image"
            , "ImageSign"
            , "ResponseType"
            , "JSONData"
            , "CurrentAddressXML"
            , "Password"
            , "LastCourseXML"
            , "AdmissionDate"
            ,"AdmissionNo"
            , "Branch"
            ,"CollegeCode"
            , "Subject1"
            , "Subject2"
            , "Subject3"
            , "Subject4"
            , "Subject5"
            , "Subject6"
             , "Subject7"
             ,"RollNoSSC"
             ,"BoardNameSSC"
             ,"ExamPassSSC"
             ,"PassingYearSSC"
             ,"GradeTypeSSC"
             ,"TotalMarkSSC"
             ,"MarkObtainedSSC"
             ,"PercentageSSC"
             ,"BoardType"
             ,"RollNoHSC"
             ,"BoardNameHSC"
             ,"ExamPassHSC"
             ,"PassingYearHSC"
             ,"GradeTypeHSC"
             ,"TotalMarkHSC"
             ,"MarkObtainedHSC"
             ,"PercentageHSC"
            , "IsActive"
            , "CreatedBy"
            , "CreatedOn"
            };

            System.Data.DataTable result = null;
            string UID = "";
            CBCSAdmissionFormBLL t_InsertCBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            string CurrentAddressXML = GetCBCSAdmissionCurrentAddressXML(Data);
            Data.CurrentAddressXML = CurrentAddressXML;
            string t_Password = GenPassword();
            Data.Password = t_Password;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);
            //add in xml format data by vibhav 13 jun 017
            Data.LastCourseXML = GetCBCSCourseDetails_xml(Data.HeirsDXML);

            result = t_InsertCBCSAdmissionFormBLL.InsertCBCSAdmissionFormDataByStudent(Data, AFields);
            string t_LoginID = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText;
            MailID = "";
            CCMailID = BCCMailID = Subject = MailText = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["Mobile"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                UID = result.Rows[0]["aadhaarNumber"].ToString();

                MailID = result.Rows[0]["MailID"].ToString();
                CCMailID = result.Rows[0]["CCMailID"].ToString();
                BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                Subject = result.Rows[0]["Subject"].ToString();
                MailText = result.Rows[0]["MailText"].ToString();

                MailText = @"


<html>
<head>
    <title>Login Details for Registration in + 3 Examination Enrollment - 2018</title>
</head>
<body>
    <div>
        <div style='margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff; font-family: Arial'>
            <table style='padding: 1% 0; width: 100%'>
                <tr>
                    <td align='left'>
                        <img src='http://sambalpur.lokaseba-odisha.in/WebApp/Kiosk/Images/sambalpur-university-logo.png' alt='SAMBALPUR UNIVERSITY'
                            style='margin-left: 15%; height: 70px;' />
                    </td>
                    <td style='text-align: center;'>
                        <div style='font-family: Arial; font-size: 25px; font-weight: bolder; color: #800000'>SAMBALPUR UNIVERSITY</div>
                        <div style='font-size: 13px; font-weight: normal; padding: 3px;'>Accredited with Grade-A by NAAC (Second Cycle)</div>
                        <div style='font-size: 16px; font-weight: normal; text-transform: uppercase; font: 15px; color: #003500'>Jyoti Vihar, Burla</div>
                    </td>
                    <td align='right'>
                        <img src='https://www.lokaseba-odisha.in/g2c/img/lokaseba_logo.png' alt='LOKASEBA ADHIKARA'
                            style='margin-right: 15%; height: 70px;' />
                    </td>
                </tr>
            </table>

            <div style='position: relative; background: #10A5DF; border: 1px solid #0C7FB5;'>
                <h1 style='line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); font-family: arial; font-size: 20px; color: #FFFFFF; text-transform: uppercase;'>LOGIN DETAILS FOR SAMBALPUR UNIVERSITY</h1>
            </div>
            <div style='margin: 5% 5% 0; font-family: Arial;'>
                <p>
                    Dear @Name,
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                </p>
                <b><span style='color: rgb(0, 112, 192); font-family: Arial;'>Your Application for Enrollment into +3 Examination for 2017 is SAVED.</span></b><p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    <span style='color: rgb(13, 13, 13);'>&nbsp;</span>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    Please find the details
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    &nbsp;
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    ADMISSION NO : <b>@AdmissionNo</b>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    APPLICATION NO. : <b>@ReferenceID</b>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    &nbsp;
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    LOGIN ID : <b>@Login</b>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    PASSWORD : <b>@Password</b>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    &nbsp;
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    You are requested to visit website&nbsp; <a href='@Weblink1'>@Weblink1</a>&nbsp; OR&nbsp;  <a href='@Weblink2' target='_blank'>@Weblink2</a> to complete the +3 Examination Process
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    OR else you will NOT BE ELIGIABLE to appear in SEMESTER EXAMINATION
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    &nbsp;
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    STEPS TO COMPLETE THE APPLICATION :
                </p>
                <ol class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    <li>Visit Website  <a href='http://sambalpur.lokaseba-odisha.in/WebApp/KIOSK/CBCS/SearchForm.aspx' target='_blank'>https://lokaseba-odisha.in</a>
                    </li>

                    <li class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>Login into the system by using above credentials</li>
                    <li>The +3 Examination Enrollment (CBCS) Application will be visible in grid</li>
                    <li>Click on VIEW button to open the SAVED application (it will redirect to last action page)</li>
                    <li>

                        <strong>Upload Documents </strong>OR<strong> Confirm Payment </strong>Page</li>
                    <li>Acknowledgement will be visible if the strps are completed</li>
                    <li>Take PRINT of the <strong>Acknowledgment</strong> </li>
                    <li>

                        <strong>SUBMIT</strong> the Printed Acknowledgment to college after signing it</li>
                </ol>
                <p style='font-family calibri, sans-serif; font-size 11pt; color rgb(0, 0, 0); letter-spacing normal; margin 0in 0in 0.0001pt; font-variant normal; line-height normal; orphans auto; text-align start; text-indent 0px; white-space normal; widows auto; word-spacing 0px; -webkit-text-stroke-width 0px; background-color rgb(253, 253, 253);'>
                    After completing the process, please Login into <a href='http://sambalpur.lokaseba-odisha.in' target='_blank'>LOKASEBA ADHIKARA (Common Application Portal - CAP) </a>to check the Application.
                </p>
                <p style='font-family calibri, sans-serif; font-size 11pt; color rgb(0, 0, 0); letter-spacing normal; margin 0in 0in 0.0001pt; font-variant normal; line-height normal; orphans auto; text-align start; text-indent 0px; white-space normal; widows auto; word-spacing 0px; -webkit-text-stroke-width 0px; background-color rgb(253, 253, 253);'>
                    Last date for submission of FORM is <strong>@LastDate</strong>
                </p>
            </div>
            <div style='margin: 0 5% 5%;'>
                <p style='font-family calibri, sans-serif; font-size: 20px; !important; color: red; letter-spacing normal; margin 0in 0in 0.0001pt; font-variant normal; line-height normal; orphans auto; text-align start; text-indent 0px; white-space normal; widows auto; word-spacing 0px; -webkit-text-stroke-width 0px; background-color rgb(253, 253, 253);'>
                    <strong>PLEASE NOTE:</strong>   Examination <strong>ROLL NO</strong> and <strong>REGISTRATION NO</strong> shall <strong>NOT be GENERATED</strong> if any of the above step is not completed and you not be allowed to apear in examination.
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    &nbsp;
                </p>

                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    <span style='color: rgb(13, 13, 13);'>Regards</span>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    <span class=''>SAMBALPUR UNIVERSITY</span><span style='color: rgb(13, 13, 13); font-weight: bold;'>, </span><span style='color: rgb(13, 13, 13);'>Burla</span>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    Website : <a href='@Weblink1'>@Weblink1</a>&nbsp; OR&nbsp;  <a href='@Weblink2' target='_blank'>@Weblink2</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
";
                //MailText = MailText.Replace("@ReferenceID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", result.Rows[0]["LoginID"].ToString()).Replace("@Weblink1", result.Rows[0]["Weblink1"].ToString()).Replace("@Weblink2", result.Rows[0]["Weblink2"].ToString()).Replace("@LastDate", result.Rows[0]["LastDate"].ToString()).Replace("@AdmissionNo", result.Rows[0]["AdmissionNo"].ToString());

                //SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "424", result.Rows[0]["AppID"].ToString(), UID);
                /*condition apply for app genreated by Nodal--*/
                //Mobile/Adhar already exist in the system.
                string statusid = result.Rows[0]["Status"].ToString();


                if (statusid == "2")
                {
                    //SMS Send To Applicant with login credentials
                    if (result.Rows[0]["Mobile"].ToString() != "")
                    {
                        //SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                        //faild reason aadhaar & mobile already exist
                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "AadhaarMobile";
                        t_ServiceResult.intStatus = 2;
                    }
                }
                else if (statusid == "3")
                {
                    //faild reason mobile already exist
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Mobile";
                    t_ServiceResult.intStatus = 3;

                }
                else if (statusid == "4")
                {
                    //faild reason aadhaar already exist
                    if (result.Rows[0]["Mobile"].ToString() != "")
                    {
                        //send sms to applicant
                        //SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "Aadhaar";
                        t_ServiceResult.intStatus = 4;
                        t_ServiceResult.UID = result.Rows[0]["aadhaarNumber"].ToString();
                    }
                }
                else
                {
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.UID = result.Rows[0]["aadhaarNumber"].ToString();
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;

                    if (result.Rows[0]["Mobile"].ToString() != "")
                    {
                        //SMS Send To Applicant
                        SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["SMSText"].ToString());

                        if (result.Rows[0]["MailID"].ToString() != "")
                        {
                            MailText = MailText.Replace("@ReferenceID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", result.Rows[0]["LoginID"].ToString()).Replace("@Weblink1", result.Rows[0]["Weblink1"].ToString()).Replace("@Weblink2", result.Rows[0]["Weblink2"].ToString()).Replace("@LastDate", result.Rows[0]["LastDate"].ToString()).Replace("@AdmissionNo", result.Rows[0]["AdmissionNo"].ToString());

                            SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "424", result.Rows[0]["AppID"].ToString(), UID);
                        }
                    }
                }

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }


        public string InsertRegistrationReceipt(RegistrationReceipt_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                      "aadhaarNumber"
                    , "ProfileID"
                    , "StudentType"
                    , "RegistrationNo"
                    , "RollNo"
                    , "AdmissionYear"
                    , "DOB"
                    , "CollegeCode"
                    , "CollegeName"
                    , "Program"


                    , "Reason"
                    , "CreatedBy"
                    , "CreatedOn"
                    , "ClientIP"
                    , "department"
                    , "district"
                    , "block"
                    , "panchayat"
                    , "office"
                    , "officer"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            RegistrationReceiptSUBLL t_RegistrationReceiptSUBLL = new RegistrationReceiptSUBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_RegistrationReceiptSUBLL.InsertRegistrationReceiptSU(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Request for Migration is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertDocumnetVerification(DocumentVerification_DT Data)
        {
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                      "aadhaarNumber"
                    ,  "ProfileID"
                    , "StudentType"
                    , "CollegeCode"
                    , "CollegeName"
                    , "RegistrationNo"
                    , "RollNo"
                    , "StudentName"
                    , "Branch"
                    , "Result"
                    , "PassingYear"
                    , "Reason"
                    , "CompanyApplicantName"
                    , "AppAddressLine1"
                    , "AppAddressLine2"
                    , "AppStreetName"
                    , "AppLandmark"
                    , "AppLocality"
                    , "AppStateCode"
                    , "AppDistrictCode"
                    , "AppSubDistrictCode"
                    , "AppVillageCode"
                    , "AppPinCode"
                    , "CreatedBy"
                    , "CreatedOn"
                    , "ClientIP"
                    , "department"
                    , "district"
                    , "block"
                    , "panchayat"
                    , "office"
                    , "officer"
                    , "ServiceID"
                    , "ApplicantType"
            };

            System.Data.DataTable result = null;
            string AppID = "";
            DocumentVerificationBLL t_DocumentVerificationBLL = new DocumentVerificationBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            result = t_DocumentVerificationBLL.InsertDocumentVerification(Data, AFields);

            if (result.Rows.Count > 0)
            {
                AppID = result.Rows[0]["AppID"].ToString();
                t_ServiceResult.AppID = AppID;
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;

                SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Request for Transcription Verification has been Submitted successfully. Your Reference ID is " + AppID + ". From Odisha Lokaseba Adhikara -CAP, Odisha Govt.");
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }


        public string InsertDeptProfile(DeptProfile_DT Data)
        {

            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields =
            {

                "LoginID"
                , "Name"
                , "Designation"
                , "Gender"
                , "Mobile"
                , "PhoneNo"
                , "MailID"
                , "JoiningDate"
                , "EmpCode"
                , "AadhaarNo"
                , "Photo"
                , "Sign"

            };

            System.Data.DataTable result = null;
            string AppID = "";
            WorkFlowBLL t_WorkFlowBLL = new WorkFlowBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;
            try
            {
                result = t_WorkFlowBLL.InsertDeptProfile(Data, AFields);

                if (result.Rows.Count > 0)
                {
                    AppID = result.Rows[0]["Result"].ToString();
                    t_ServiceResult.AppID = AppID;
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;

                    //SendSMS(result.Rows[0]["Mobile"].ToString(), "Your Request for Transcription Verification has been Submitted successfully. Your Reference ID is " + AppID + ". From Odisha Lokaseba Adhikara -CAP, Odisha Govt.");
                }
            }
            catch (Exception ex)
            {
                t_ServiceResult.AppID = "";
                t_ServiceResult.Status = ex.Message.ToString();
                t_ServiceResult.intStatus = 2;
            }
            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string GetReasonMaster(string SvcID)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            TransferSUBLL t_TransferSUBLL = new TransferSUBLL();
            System.Data.DataTable dtCollege = t_TransferSUBLL.GetReasonMaster(SvcID);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtCollege.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["ReasonID"],
                        Name = sdr["Reason"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetEditApplicationDetails(string AppID)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            CBCSAdmissionFormBLL t_CBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
            System.Data.DataSet dtAppList = t_CBCSAdmissionFormBLL.GetEditApplicationDetails(AppID);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtAppList.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        AadhaarNo = sdr["AadhaarNo"],
                        AppID = sdr["AppID"],
                        RegNo = sdr["RegNo"],
                        RollNo = sdr["RollNo"],
                        AdmissionNo = sdr["AdmissionNo"],
                        AdmissionDate = sdr["AdmissionDate"],
                        AdmissionYear = sdr["AdmissionYear"],
                        BranchCode = sdr["BranchCode"],
                        BranchName = sdr["BranchName"],
                        Name = sdr["Name"],
                        Mobile = sdr["Mobile"],
                        Email = sdr["Email"],
                        Father = sdr["Father"],
                        Mother = sdr["Mother"],
                        Gaurdian = sdr["Gaurdian"],
                        Relation = sdr["Relation"],
                        DOB = sdr["DOB"],
                        Age = sdr["Age"],
                        Gender = sdr["Gender"],
                        MotherTongue = sdr["MotherTongue"],
                        Category = sdr["Category"],
                        CollegeCode = sdr["CollegeCode"],
                        CollegeName = sdr["CollegeName"],
                        ServiceID = sdr["ServiceID"],
                        SubjectList = sdr["SubjectList"],
                        AddrCareOf = sdr["AddrCareOf"],
                        AddrBuilding = sdr["AddrBuilding"],
                        AddrStreet = sdr["AddrStreet"],
                        AddrLandmark = sdr["AddrLandmark"],
                        AddrLocality = sdr["AddrLocality"],
                        State = sdr["State"],
                        District = sdr["District"],
                        Taluka = sdr["Taluka"],
                        Village = sdr["Village"],
                        PinCode = sdr["PinCode"],
                        CareOfP = sdr["CareOfP"],
                        CareOfLocalP = sdr["CareOfLocalP"],
                        houseNumberP = sdr["houseNumberP"],
                        LandmarkP = sdr["LandmarkP"],
                        LocalityP = sdr["LocalityP"],
                        pincodeP = sdr["pincodeP"],
                        StreetP = sdr["StreetP"],
                        StateCodeP = sdr["StateCodeP"],
                        DistrictCodeP = sdr["DistrictCodeP"],
                        BlockCodeP = sdr["BlockCodeP"],
                        PanchayatCodeP = sdr["PanchayatCodeP"],
                        BoardType = sdr["BoardType"],
                        RollNo10 = sdr["RollNo10"],
                        BoardName = sdr["BoardName"],
                        ExamPass = sdr["ExamPass"],
                        PassingYear = sdr["PassingYear"],
                        GradeType = sdr["GradeType"],
                        TotalMark = sdr["TotalMark"],
                        MarkObtained = sdr["MarkObtained"],
                        Percentage = sdr["Percentage"],
                        Type = sdr["Type"],
                        BoardType12 = sdr["BoardType12"],
                        RollNo12 = sdr["RollNo12"],
                        BoardName12 = sdr["BoardName12"],
                        ExamPass12 = sdr["ExamPass12"],
                        PassingYear12 = sdr["PassingYear12"],
                        GradeType12 = sdr["GradeType12"],
                        TotalMark12 = sdr["TotalMark12"],
                        MarkObtained12 = sdr["MarkObtained12"],
                        Percentage12 = sdr["Percentage12"],
                        Type12 = sdr["Type12"],
                        ImageSign = sdr["ImageSign"],
                        ApplicantImageStr = sdr["ApplicantImageStr"],
                        LastCourse = sdr["LastCourse"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string EditStudentData(CBCSAdmissionForm_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                "AppID"
             ,"ProfileID"
            ,"AadhaarNumber"
            ,"AadhaarDetail"
            ,"AppName"
            ,"DOB"
            ,"Gender"
            ,"MotherTongue"
             ,"FatherName"
             ,"MotherName"
             ,"GuardianName"
            ,"Relation"
            ,"Category"
            ,"MobileNo"
            ,"EmailId"
            , "careOf"
            , "careOfLocal"
            , "districtLocal"
            , "houseNumber"
            , "houseNumberLocal"
            , "landmark"
            , "landmarkLocal"
            , "language"
            , "locality"
            , "localityLocal"
            , "phone"

            , "pincode"
            , "pincodeLocal"
            , "postOffice"
            , "postOfficeLocal"
            , "residentName"
            , "residentNameLocal"
            , "responseCode"
            , "state"
            , "stateLocal"
            , "district"
            , "street"
            , "streetLocal"
            , "subDistrict"
            , "subDistrictLocal"
            , "Village"
            , "statecode"
            , "districtcode"
            , "subDistrictcode"
            , "Villagecode"
            , "Image"
            , "ImageSign"
            , "ResponseType"
            , "JSONData"
            , "CurrentAddressXML"
            , "Password"
            , "LastCourseXML"
            , "AdmissionDate"
            ,"AdmissionNo"
            , "Branch"
            ,"CollegeCode"
            , "Subject1"
            , "Subject2"
            , "Subject3"
            , "Subject4"
            , "Subject5"
            , "Subject6"
             , "Subject7"
             , "Subject8"
             ,"RollNoSSC"
             ,"BoardNameSSC"
             ,"ExamPassSSC"
             ,"PassingYearSSC"
             ,"GradeTypeSSC"
             ,"TotalMarkSSC"
             ,"MarkObtainedSSC"
             ,"PercentageSSC"
             ,"BoardType"
             ,"RollNoHSC"
             ,"BoardNameHSC"
             ,"ExamPassHSC"
             ,"PassingYearHSC"
             ,"GradeTypeHSC"
             ,"TotalMarkHSC"
             ,"MarkObtainedHSC"
             ,"PercentageHSC"
            , "IsActive"
            , "CreatedBy"
            , "CreatedOn"
            ,"Sublbl1"
            ,"Sublbl2"
            ,"Sublbl3"
            ,"Sublbl4"
            ,"Sublbl5"
            ,"Sublbl6"
            ,"Sublbl7"
            ,"Sublbl8"
            };

            System.Data.DataTable result = null;
            string UID = "";
            CBCSAdmissionFormBLL t_InsertCBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            string CurrentAddressXML = GetCBCSAdmissionCurrentAddressXML(Data);
            Data.CurrentAddressXML = CurrentAddressXML;
            string t_Password = GenPassword();
            Data.Password = t_Password;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);
            //add in xml format data by vibhav 13 jun 017
            Data.LastCourseXML = GetCBCSCourseDetails_xml(Data.HeirsDXML);

            result = t_InsertCBCSAdmissionFormBLL.EditStudentDataDT(Data, AFields);
            string t_LoginID = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText;
            MailID = "";
            CCMailID = BCCMailID = Subject = MailText = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["Mobile"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                UID = result.Rows[0]["aadhaarNumber"].ToString();

                MailID = result.Rows[0]["MailID"].ToString();
                CCMailID = result.Rows[0]["CCMailID"].ToString();
                BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                Subject = result.Rows[0]["Subject"].ToString();
                MailText = result.Rows[0]["MailText"].ToString();

                MailText = @"


<html>
<head>
    <title>Login Details for Registration in + 3 Examination Enrollment - 2017</title>
</head>
<body>
    <div>
        <div style='margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff; font-family: Arial'>
            <table style='padding: 1% 0; width: 100%'>
                <tr>
                    <td align='left'>
                        <img src='http://sambalpur.lokaseba-odisha.in/WebApp/Kiosk/Images/sambalpur-university-logo.png' alt='SAMBALPUR UNIVERSITY'
                            style='margin-left: 15%; height: 70px;' />
                    </td>
                    <td style='text-align: center;'>
                        <div style='font-family: Arial; font-size: 25px; font-weight: bolder; color: #800000'>SAMBALPUR UNIVERSITY</div>
                        <div style='font-size: 13px; font-weight: normal; padding: 3px;'>Accredited with Grade-A by NAAC (Second Cycle)</div>
                        <div style='font-size: 16px; font-weight: normal; text-transform: uppercase; font: 15px; color: #003500'>Jyoti Vihar, Burla</div>
                    </td>
                    <td align='right'>
                        <img src='https://www.lokaseba-odisha.in/g2c/img/lokaseba_logo.png' alt='LOKASEBA ADHIKARA'
                            style='margin-right: 15%; height: 70px;' />
                    </td>
                </tr>
            </table>

            <div style='position: relative; background: #10A5DF; border: 1px solid #0C7FB5;'>
                <h1 style='line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); font-family: arial; font-size: 20px; color: #FFFFFF; text-transform: uppercase;'>LOGIN DETAILS FOR SAMBALPUR UNIVERSITY</h1>
            </div>
            <div style='margin: 5% 5% 0; font-family: Arial;'>
                <p>
                    Dear @Name,
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                </p>
                <b><span style='color: rgb(0, 112, 192); font-family: Arial;'>Your Application for Enrollment into +3 Examination for 2017 is SAVED.</span></b><p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    <span style='color: rgb(13, 13, 13);'>&nbsp;</span>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    Please find the details
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    &nbsp;
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    ADMISSION NO : <b>@AdmissionNo</b>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    APPLICATION NO. : <b>@ReferenceID</b>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    &nbsp;
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    LOGIN ID : <b>@Login</b>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    PASSWORD : <b>@Password</b>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    &nbsp;
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    You are requested to visit website&nbsp; <a href='@Weblink1'>@Weblink1</a>&nbsp; OR&nbsp;  <a href='@Weblink2' target='_blank'>@Weblink2</a> to complete the +3 Examination Process
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    OR else you will NOT BE ELIGIABLE to appear in SEMESTER EXAMINATION
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    &nbsp;
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    STEPS TO COMPLETE THE APPLICATION :
                </p>
                <ol class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    <li>Visit Website  <a href='http://sambalpur.lokaseba-odisha.in/WebApp/KIOSK/CBCS/SearchForm.aspx' target='_blank'>https://lokaseba-odisha.in</a>
                    </li>

                    <li class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>Login into the system by using above credentials</li>
                    <li>The +3 Examination Enrollment (CBCS) Application will be visible in grid</li>
                    <li>Click on VIEW button to open the SAVED application (it will redirect to last action page)</li>
                    <li>

                        <strong>Upload Documents </strong>OR<strong> Confirm Payment </strong>Page</li>
                    <li>Acknowledgement will be visible if the strps are completed</li>
                    <li>Take PRINT of the <strong>Acknowledgment</strong> </li>
                    <li>

                        <strong>SUBMIT</strong> the Printed Acknowledgment to college after signing it</li>
                </ol>
                <p style='font-family calibri, sans-serif; font-size 11pt; color rgb(0, 0, 0); letter-spacing normal; margin 0in 0in 0.0001pt; font-variant normal; line-height normal; orphans auto; text-align start; text-indent 0px; white-space normal; widows auto; word-spacing 0px; -webkit-text-stroke-width 0px; background-color rgb(253, 253, 253);'>
                    After completing the process, please Login into <a href='http://sambalpur.lokaseba-odisha.in' target='_blank'>LOKASEBA ADHIKARA (Common Application Portal - CAP) </a>to check the Application.
                </p>
                <p style='font-family calibri, sans-serif; font-size 11pt; color rgb(0, 0, 0); letter-spacing normal; margin 0in 0in 0.0001pt; font-variant normal; line-height normal; orphans auto; text-align start; text-indent 0px; white-space normal; widows auto; word-spacing 0px; -webkit-text-stroke-width 0px; background-color rgb(253, 253, 253);'>
                    Last date for submission of FORM is <strong>@LastDate</strong>
                </p>
            </div>
            <div style='margin: 0 5% 5%;'>
                <p style='font-family calibri, sans-serif; font-size: 20px; !important; color: red; letter-spacing normal; margin 0in 0in 0.0001pt; font-variant normal; line-height normal; orphans auto; text-align start; text-indent 0px; white-space normal; widows auto; word-spacing 0px; -webkit-text-stroke-width 0px; background-color rgb(253, 253, 253);'>
                    <strong>PLEASE NOTE:</strong>   Examination <strong>ROLL NO</strong> and <strong>REGISTRATION NO</strong> shall <strong>NOT be GENERATED</strong> if any of the above step is not completed and you not be allowed to apear in examination.
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    &nbsp;
                </p>

                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    <span style='color: rgb(13, 13, 13);'>Regards</span>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    <span class=''>SAMBALPUR UNIVERSITY</span><span style='color: rgb(13, 13, 13); font-weight: bold;'>, </span><span style='color: rgb(13, 13, 13);'>Burla</span>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    Website : <a href='@Weblink1'>@Weblink1</a>&nbsp; OR&nbsp;  <a href='@Weblink2' target='_blank'>@Weblink2</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
";
                //MailText = MailText.Replace("@ReferenceID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", result.Rows[0]["LoginID"].ToString()).Replace("@Weblink1", result.Rows[0]["Weblink1"].ToString()).Replace("@Weblink2", result.Rows[0]["Weblink2"].ToString()).Replace("@LastDate", result.Rows[0]["LastDate"].ToString()).Replace("@AdmissionNo", result.Rows[0]["AdmissionNo"].ToString());

                //SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "424", result.Rows[0]["AppID"].ToString(), UID);
                /*condition apply for app genreated by Nodal--*/
                //Mobile/Adhar already exist in the system.
                string statusid = result.Rows[0]["Status"].ToString();


                if (statusid == "2")
                {
                    //SMS Send To Applicant with login credentials
                    if (result.Rows[0]["Mobile"].ToString() != "")
                    {
                        //SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                        //faild reason aadhaar & mobile already exist
                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "AadhaarMobile";
                        t_ServiceResult.intStatus = 2;
                    }
                }
                else if (statusid == "3")
                {
                    //faild reason mobile already exist
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Mobile";
                    t_ServiceResult.intStatus = 3;

                }
                else if (statusid == "4")
                {
                    //faild reason aadhaar already exist
                    if (result.Rows[0]["Mobile"].ToString() != "")
                    {
                        //send sms to applicant
                        //SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "Aadhaar";
                        t_ServiceResult.intStatus = 4;
                    }
                }
                else
                {
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;

                    if (result.Rows[0]["Mobile"].ToString() != "")
                    {
                        //SMS Send To Applicant
                        SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["SMSText"].ToString());

                        if (result.Rows[0]["MailID"].ToString() != "")
                        {
                            MailText = MailText.Replace("@ReferenceID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", result.Rows[0]["LoginID"].ToString()).Replace("@Weblink1", result.Rows[0]["Weblink1"].ToString()).Replace("@Weblink2", result.Rows[0]["Weblink2"].ToString()).Replace("@LastDate", result.Rows[0]["LastDate"].ToString()).Replace("@AdmissionNo", result.Rows[0]["AdmissionNo"].ToString());

                            SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "424", result.Rows[0]["AppID"].ToString(), UID);
                        }
                    }
                }

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        static string SMS_USERNAME = "g2cxml";
        static string SMS_PASSWORD = "smju1436";
        static string SMS_ADDRESS = "CSCSPV";
        //static string SMS_ADDRESS = "SSBJNK";
        static string SendSMSTo_old(SMS smsDetails)
        {

            //string SMSActivated = "N";

            //SMSActivated = ConfigurationManager.AppSettings["SMSActivated"].ToString();

            //if (SMSActivated == "N") return "";


            bool strResult = false;
            try
            {
                string retResponse = null;

                StringBuilder sbsmsreq = new StringBuilder();
                sbsmsreq.Append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
                sbsmsreq.Append("<!DOCTYPE MESSAGE SYSTEM \"http://127.0.0.1:80/psms/dtd/messagev12.dtd\">");
                sbsmsreq.Append("<MESSAGE VER=\"1.2\">");
                sbsmsreq.Append("<USER USERNAME=\"" + SMS_USERNAME + "\" PASSWORD=\"" + SMS_PASSWORD + "\"/>");
                sbsmsreq.Append("<SMS UDH=\"0\" CODING=\"1\" TEXT=\"" + smsDetails.Message + "\" PROPERTY=\"0\" ID=\"1\">");
                sbsmsreq.Append("<ADDRESS FROM=\"" + SMS_ADDRESS + "\" TO=\"" + smsDetails.MobileNos + "\" SEQ=\"1\" TAG=\"SMS from Windows Communication Foundation\"/>");
                sbsmsreq.Append("</SMS>");
                sbsmsreq.Append("</MESSAGE>");

                string requeststring = sbsmsreq.ToString();
                string url = "http://api.myvaluefirst.com/psms/servlet/psms.Eservice2?";

                string postData = "data=" + System.Web.HttpUtility.UrlEncode(requeststring) + "&action=send";


                var data = Encoding.ASCII.GetBytes(postData);
                var request = (HttpWebRequest)WebRequest.Create(url);

                request.ContentType = "application/x-www-form-urlencoded";
                request.ContentLength = data.Length;
                request.Method = WebRequestMethods.Http.Post;

                using (var stream = request.GetRequestStream())
                {
                    stream.Write(data, 0, data.Length);
                }

                var response = (HttpWebResponse)request.GetResponse();
                retResponse = new StreamReader(response.GetResponseStream()).ReadToEnd();

                XmlDocument xDoc = new XmlDocument();
                xDoc.LoadXml(retResponse);

                string error = "";
                string guid = null;
                string submitdate = null;
                string id = null;

                if (xDoc.SelectSingleNode("/MESSAGEACK/GUID/ERROR/@CODE") != null)
                {
                    error = xDoc.SelectSingleNode("/MESSAGEACK/GUID/ERROR/@CODE").InnerText.ToString();
                }

                guid = xDoc.SelectSingleNode("/MESSAGEACK/GUID/@GUID").InnerText.ToString();
                submitdate = xDoc.SelectSingleNode("/MESSAGEACK/GUID/@SUBMITDATE").InnerText.ToString();
                id = xDoc.SelectSingleNode("/MESSAGEACK/GUID/@ID").InnerText.ToString();

                xDoc = null;
                request = null;

                string ProfileID = smsDetails.ProfileID == null ? "" : smsDetails.ProfileID;
                string ServiceID = smsDetails.ServiceIDNew == null ? "" : smsDetails.ServiceIDNew;
                string ApplicationID = smsDetails.ApplicationIDNew == null ? "" : smsDetails.ApplicationIDNew;

                string t_SQLQuery = "Insert Into SMSDetailTb (MobileNo, SMSText, SMSRequestXML, SMSPostData, SMSResponseXML, CreatedBy, CreatedOn, ClientIP, ProfileID, ServiceID, AppID) Values ('" +
                    smsDetails.MobileNos + "', '" + smsDetails.Message + "', '" + requeststring + "', '" + postData + "', '" + retResponse + "', Null, GetDate(), Null, '" + ProfileID + "', '" + ServiceID + "', '" + ApplicationID + "')";

                DMLCommand(t_SQLQuery);

                return strResult.ToString();

            }

            catch (Exception ex)
            {
                return strResult.ToString();
            }
        }

        static string SendSMSTo(SMS smsDetails)
        {
            bool result = false;

            string URL;
            string MobileNo = "";
            string Message = "";
            string xml = "";

            string requeststring, postData, retResponse;

            requeststring = postData = retResponse = "";

            MobileNo = smsDetails.MobileNos;
            Message = smsDetails.Message;
            //Message = "जय श्रीराम %0Aभुगतान कर प्रक्रिया पूर्ण करें %7C%0Aआपका%0Aयूजर ID - 0000%0Aपासवर्ड -  0000%0Aआनंद के धाम";
            //var user = "Aajivika";
            //var password = "Aajivika@123";
            //var senderid= "CSVTUB";
            //var channel= "Trans";
            //var DCS = 0;
            //var flashsms = 0;
            //var route= "1"; 

            try
            {

//                URL = "http://sms.technoitsolution.co.in/api/mt/SendSMS?" +
//  "user=" + user
//+ "&password=" + password
//+ "&senderid=" + senderid
//+ "&channel=" + channel
//+ "&DCS=" + DCS
//+ "&flashsms=" + flashsms
//+ "&number=91" + MobileNo
//+ "&text=" + Message
//+ "&route=" + route;

                URL = "https://api.equence.in/pushsms?" +
                    "username=tecsm_ddrp&password=zyDT-19_" +
                    "&peId=1201162261478998529"+
                    "&tmplId=" +
                    "&to=91" + MobileNo +
                    "&from=CSVTUD" +
                    "&charset=auto" +
                    "&text=" + Message;


                requeststring = URL;

                //System.Net.ServicePointManager.SecurityProtocol |= SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;

                //ServicePointManager.ServerCertificateValidationCallback =
                //    delegate (object s, X509Certificate certificate,
                //    X509Chain chain, SslPolicyErrors sslPolicyErrors)
                //    { return true; };

                HttpWebRequest request = WebRequest.Create(URL) as HttpWebRequest;
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    if (response.StatusCode == HttpStatusCode.OK)
                    {
                        StreamReader requestStream = new StreamReader(response.GetResponseStream());
                        xml = requestStream.ReadToEnd();
                    }
                }

                retResponse = xml;

                string ProfileID = smsDetails.ProfileID == null ? "" : smsDetails.ProfileID;
                string ServiceID = smsDetails.ServiceIDNew == null ? "" : smsDetails.ServiceIDNew;
                string ApplicationID = smsDetails.ApplicationIDNew == null ? "" : smsDetails.ApplicationIDNew;

                string t_SQLQuery = "Insert Into SMSDetailTb (MobileNo, SMSText, SMSRequestXML, SMSPostData, SMSResponseXML, CreatedBy, CreatedOn, ClientIP, ProfileID, ServiceID, AppID) Values ('" +
                    smsDetails.MobileNos + "', '" + smsDetails.Message + "', '" + requeststring + "', '" + postData + "', '" + retResponse + "', Null, GetDate(), Null, '" + ProfileID + "', '" + ServiceID + "', '" + ApplicationID + "')";

                DMLCommand(t_SQLQuery);

                result = true;

            }
            catch (WebException ex)
            {
                string pageContent = new StreamReader(ex.Response.GetResponseStream()).ReadToEnd().ToString();
                result = false;
            }

            return result.ToString();
        }

        static string SendSMSTo(SMS smsDetails, string TemplateId)
        {
            bool result = false;

            string URL;
            string MobileNo = "";
            string Message = "";
            string xml = "";

            string requeststring, postData, retResponse;

            requeststring = postData = retResponse = "";

            MobileNo = smsDetails.MobileNos;
            Message = smsDetails.Message;
            
            try
            {
                URL = "https://api.equence.in/pushsms?" +
                    "username=tecsm_ddrp&password=zyDT-19_" +
                    "&peId=1201162261478998529" +
                    "&tmplId=" + TemplateId +
                    "&to=91" + MobileNo +
                    "&from=CSVTUD" +
                    "&charset=auto" +
                    "&text=" + Message;


                requeststring = URL;

                //System.Net.ServicePointManager.SecurityProtocol |= SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;

                //ServicePointManager.ServerCertificateValidationCallback =
                //    delegate (object s, X509Certificate certificate,
                //    X509Chain chain, SslPolicyErrors sslPolicyErrors)
                //    { return true; };

                HttpWebRequest request = WebRequest.Create(URL) as HttpWebRequest;
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    if (response.StatusCode == HttpStatusCode.OK)
                    {
                        StreamReader requestStream = new StreamReader(response.GetResponseStream());
                        xml = requestStream.ReadToEnd();
                    }
                }

                retResponse = xml;

                string ProfileID = smsDetails.ProfileID == null ? "" : smsDetails.ProfileID;
                string ServiceID = smsDetails.ServiceIDNew == null ? "" : smsDetails.ServiceIDNew;
                string ApplicationID = smsDetails.ApplicationIDNew == null ? "" : smsDetails.ApplicationIDNew;

                string t_SQLQuery = "Insert Into SMSDetailTb (MobileNo, SMSText, SMSRequestXML, SMSPostData, SMSResponseXML, CreatedBy, CreatedOn, ClientIP, ProfileID, ServiceID, AppID) Values ('" +
                    smsDetails.MobileNos + "', '" + smsDetails.Message.Replace("'", "") + "', '" + requeststring.Replace("'", "") + "', '" + postData + "', '" + retResponse + "', Null, GetDate(), Null, '" + ProfileID + "', '" + ServiceID + "', '" + ApplicationID + "')";

                DMLCommand(t_SQLQuery);

                result = true;

            }
            catch (WebException ex)
            {
                string pageContent = new StreamReader(ex.Response.GetResponseStream()).ReadToEnd().ToString();
                result = false;
            }

            return result.ToString();
        }
        private static void DMLCommand(string SQLStatement)
        {
            string t_ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;
            SqlCommand t_SQLCmd;
            SqlConnection t_DB = new SqlConnection(t_ConnectionString);

            //try
            {
                t_SQLCmd = new SqlCommand(SQLStatement, t_DB);
                t_DB.Open();
                t_SQLCmd.ExecuteNonQuery();
                t_DB.Close();
                t_SQLCmd.Dispose();
            }
            //catch (SqlException t_exception)
            {
                //Response.Write(t_exception.Message);
            }
        }

        void SendSMS(string MobileNo, string Message)
        {
            string text;
            CitizenPortalLib.SMSServiceReference.SMS objSMS = new CitizenPortalLib.SMSServiceReference.SMS();
            objSMS.MobileNos = MobileNo;
            objSMS.Message = Message;

            text = SendSMSTo(objSMS);
        }

        void SendSMS(string MobileNo, string Message, string TemplateId)
        {
            string text;
            CitizenPortalLib.SMSServiceReference.SMS objSMS = new CitizenPortalLib.SMSServiceReference.SMS();
            objSMS.MobileNos = MobileNo;
            objSMS.Message = Message;

            text = SendSMSTo(objSMS, TemplateId);
        }


        void SendSMS(string MobileNo, string Message, string ServiceID, string ApplicationID, string ProfileID)
        {
            string text;
            CitizenPortalLib.SMSServiceReference.SMS objSMS = new CitizenPortalLib.SMSServiceReference.SMS();
            objSMS.MobileNos = MobileNo;
            objSMS.Message = Message;
            objSMS.ServiceIDNew = ServiceID;
            objSMS.ApplicationIDNew = ApplicationID;
            objSMS.ProfileID = ProfileID;

            text = SendSMSTo(objSMS);
        }
        public string GetSUCollegeList()
        {
            CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
            System.Data.DataTable DTCollegeList = m_AdmissionFormBLL.Get_CollegeList();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = DTCollegeList.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["CollegeCode"],
                        Name = sdr["CollegeName"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetSUDepartmentList(string CollegeCode)
        {
            CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
            System.Data.DataTable DTCollegeList = m_AdmissionFormBLL.Get_SUDepartmentList(CollegeCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = DTCollegeList.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["DeptCode"],
                        Name = sdr["DeptName"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetSUSubjectList(string DepartmentCode)
        {
            CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
            System.Data.DataTable DTSubjectList = m_AdmissionFormBLL.Get_SUSubjectList(DepartmentCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = DTSubjectList.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["SubjectCode"],
                        Name = sdr["SubjectName"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string ValidateRegisteredMobile(string Mobile, string Type)
        {
            CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
            DataSet ds = new DataSet();
            ds = m_AdmissionFormBLL.ValidateRegisteredMobile(Mobile, Type);

            System.Data.DataTable DT = ds.Tables[0];
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = DT.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        UserName = sdr["UserName"],
                        Mobile = sdr["Mobile"],
                        Email = sdr["Email"],
                        Result = sdr["Result"],
                        Msg = sdr["Msg"],
                        MsgHeader = sdr["MsgHeader"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string InsertPGAdmissionFormData(SUPGAdmission_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);
            ServiceResult t_ServiceResult = new ServiceResult();
            try
            {
                string[] AFields = {
                                  "CitizenProfileID",
                                  "AadhaarDetail",
                                  "UniversityRegNo",
                                  "aadhaarNumber",
                                  "AppMobileNo",
                                  "ProfileID",
                                  "OUATCourse",
                                  "CollegeName",
                                  "DegreeName",
                                  "SubjectName",
                                  "CandidateName",
                                  "FatherName",
                                  "MotherName",
                                  "DOB",
                                  "Year",
                                  "Month",
                                  "Day",
                                  "Gender",
                                  "Religion",
                                  "Category",
                                  "MaritalStatus",
                                  "MotherTongue",
                                  "Nationality",
                                  "MobileNo",
                                  "EmailId",
                                  "FatherOccupation",
                                  "MotherOccupation",
                                  "GuardianName",
                                  "GuardianOccupation",

                                  "ParmanentAddressline1",
                                  "ParmanentAddressline2",
                                  "ParRoadstreet",
                                  "ParLandmark",
                                  "ParLocality",
                                  "ParState",
                                  "ParDistrict",
                                  "ParBlock",
                                  "ParVillage",
                                  "ParPincode",
                                  "PresentAddressline1",
                                  "PresentAddressline2",
                                  "PreRoadstreet",
                                  "PreLandmark",
                                  "PreLocality",
                                  "PreState",
                                  "PreDistrict",
                                  "PreBlock",
                                  "PreVillage",
                                  "PrePincode",
                                  "Image",
                                  "ImageSign",

                                  "HscBoardName",
                                  "HscNameExamPass",
                                  "HscBoardRollNo",
                                  "HscYearPassing",
                                  "HscExamCleard",
                                  "HscGradeSystem",
                                  "HscTotalMark",
                                  "HscMarkSecured",
                                  "HscPercentage",
                                  "SscBoardName",
                                  "SscNameExamPass",
                                  "SscBoardRollNo",
                                  "SscYearPassing",
                                  "SscExamCleard",
                                  "SscGradeSystem",
                                  "SscTotalMark",
                                  "SscMarkSecured",
                                  "SscPercentage",
                                  "BscDegreeDimploma",
                                  "BscBoardUniversity",
                                  "BscMaxMarks",
                                  "BscMarksSecured",
                                  "BscGrade",
                                  "BscDivision",
                                  "BscPassYear",
                                  "BscMainOptionalSubject",

                                  "Section1_IsHandicap",
                                  "Section1_HandicapType",
                                  "Section1_DisabilityPercent",
                                  "Section2_IsExDefence",
                                  "Section2_DeptName",
                                  "Section2_PostName",
                                  "Section3_IsPlyedInInterUniv",
                                  "Section3_TournamentName",
                                  "Section3_TournamentYear",
                                  "Section4_IsPossessNcc",
                                  "Section4_PassYear",
                                  "Section4_NameOfAuthority",
                                  "Section5_IsKashmiri",
                                  "Section5_MigrationYear",
                                  "Section5_Address",
                                  "Section6_IsMLib",
                                  "Section6_OrganisationDetail",
                                  "Section6_TotalExp",
                                  "Section6A_IsMba",
                                  "Section6A_ExaminationName",
                                  "Section6A_ExaminationYear",
                                  "Section6_Place",
                                  "Section6_Designation",
                                  "Section6A_MarkSecured",
                                  "Section7",
                                  "Section8",
                                  "Section9",

                                  "ApplyingFor",
                                  "TotalMark_Hon",
                                  "TotalMarkSecure_Hon",
                                  "TotalMark_Pass",
                                  "TotalMarkSecure_Pass",
                                  "LLM_TotalMark5Yrs",
                                  "LLM_TotalMarkSecure5Yrs",
                                  "LLM_3Yrs_Type",
                                  "LLM_3Yrs_LLBHonDiv",
                                  "LLM_3Yrs_LLBHonTotalMark",
                                  "LLM_3Yrs_LLBHonMarkSecure",
                                  "LLM_3Yrs_LLBPassTotalMark",
                                  "LLM_3Yrs_LLBPassMarkSecure",
                                  "MBA_MatScore",
                                  "MBA_TotalMarks",
                                  "MBA_TotalMarkSecured",
                                  "IsPassGraduate",

                                  "WorkExp_MBA",
                                  "MTech_GraduateDiv",
                                  "MTech_MscDiv",
                                  "MTech_ProDegreeDiv",
                                  "BE_BTech_Bsc_TotalMark",
                                  "BE_BTech_Bsc_MarkSecure",
                                  "Hons_Div",
                                  "Pass_Div",
                                  "MTech_Hons_PG_RSAndGIS",

                                  "JSONData",
                                  "CurrentAddressXML",
                                  "Password",
                                  "IsActive",
                                  "CreatedBy",
                                  "CreatedOn"
            };

                System.Data.DataTable result = null;
                CBCSAdmissionFormBLL t_CBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();

                t_ServiceResult.AppID = "";
                t_ServiceResult.Status = "Error";
                t_ServiceResult.intStatus = 0;

                Data.CreatedBy = KioskID;
                Data.CreatedOn = DateTime.Now;

                string CurrentAddressXML = GetSUPGCurrentAddressXML(Data);
                string t_Password = GenPassword();
                Data.Password = t_Password;
                Data.CurrentAddressXML = CurrentAddressXML;

                Data.JSONData = "";
                Data.JSONData = new JavaScriptSerializer().Serialize(Data);

                result = t_CBCSAdmissionFormBLL.InsertPGAdmissionFormData(Data, AFields);
                string UID = "";
                string t_LoginID = "";
                string LoginId = "";
                string MailID, CCMailID, BCCMailID, Subject, MailText;
                MailID = CCMailID = BCCMailID = Subject = MailText = "";
                if (result.Rows.Count > 0)
                {
                    if (result.Rows[0]["Result"].ToString() == "1")
                    {
                        t_LoginID = result.Rows[0]["Mobile"].ToString();
                        t_Password = result.Rows[0]["Password"].ToString();
                        UID = result.Rows[0]["aadhaarNumber"].ToString();
                        LoginId= result.Rows[0]["LoginID"].ToString();

                        MailID = result.Rows[0]["MailID"].ToString();
                        CCMailID = result.Rows[0]["CCMailID"].ToString();
                        BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                        Subject = result.Rows[0]["Subject"].ToString();
                        MailText = result.Rows[0]["MailText"].ToString();
                        MailText = @"


<!doctype html>
<html>
<head>
    <title>LOKASEBA ADHIKARA - Confirmation Email</title>    
</head>
<body style=""font-family: ''Andada'' , serif; background-color: #E0E0E0;"">
    <div style=""margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff;"">
        <table style=""padding: 1% 0; width: 100%"">
            <tr>
                <td align=""left"">
                    <img src=""data:image/png;base64,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"" alt=""LOKASEBA ADHIKARA""
                        style=""margin-left: 5%; height: 60px;"" />
                </td>
                <td align=""right"">
                    <img src=""data:image/png;base64,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"" alt=""PG""
                        style=""margin-right: 5%; height: 60px;"" />
                </td>
            </tr>
        </table>

        <div style=""position: relative; background: #10A5DF; border: 1px solid #0C7FB5;"">
            <h1 style=""color: #fff; font-size: 20px; line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); text-transform: uppercase; font-family: arial;"">ADMISSION IN TO SAMBALPUR UNIVERSITY PG COURSE 2018-19</h1>
        </div>
        <div style=""margin: 5% 5% 0;"">
            <p>
                Dear @Name,
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Thank you for Applying for PG Admission Course 2018-19<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">&nbsp;</span>
            </p>
            <p style="" font-family: Calibri, sans-serif;
            font-size: 11pt;
            color: rgb(0, 0, 0);
            letter-spacing: normal;margin: 0in 0in 0.0001pt; font-variant: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                The Login details  to access  http://sambalpur.lokaseba-odisha.in (Common Application Portal - CAP) are</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                LOGIN ID : <b>@Login</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                PASSWORD : <b>@Password</b>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>The login detail to be used for</b> </div>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>
                    <li>Making Payment of Unpaid Application (through Online Payment Gateway OR at any CSC)
                    </li>
                    <li>Checking the Application Status
                    </li>
                    <li>Downloading the Admit Card for PG Admission Course - 2018              
                    </li>                  
                </ul>
            </div>
            </div>
        <hr />
        <div style=""margin:0 5% 5%;"">
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b><span style=""color: rgb(0, 112, 192);"">Your Application for PG Admission Course is Saved successfully.<span class=""Apple-converted-space"">&nbsp;</span></span></b>
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: maroon; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                Your Application No. is <b>@AppID</b>.</p>
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <ul>                    
                    <li>Make payment againt the Application No. 
                        <ul>
						<li>either through Online Payment Gateway after Login into  <a href=""https://lokaseba-odisha.in/Account/Login"" target=""_blank"">LOKASEBA ADHIKAR</a> portal through above login details.
                            </li>
                            <li>or at any CSC (<a href=""/g2c/forms/CenterList.aspx"" target=""_blank"">Janaseba Kendra in Odisha</a>) .
                            </li>
                            
                        </ul>
                    </li>
			 </div>
            
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <b>PLEASE NOTE : </b>If the Application fee (Rs 600.00) against the application @AppID is not paid  then the application shall be rejected. 
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">Regards</span>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13); font-weight: bold;"">PG Council, Sambalpur University<br />
                    Jyoti Vihar Sambalpur, Odisha</span>
            </p>
        </div>
    </div>
</body>
</html>
";
                        MailText = MailText.Replace("@AppID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", LoginId);

                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "Success";
                        t_ServiceResult.intStatus = 1;

                        /*---------Send Login Credentials to the user/candidate---------*/
                        SendSMS(Data.MobileNo,
                            "Dear " + Data.CandidateName + "You've registered for PG Admission Course 2018-19 , The login detail is LOGIN ID : " + LoginId +
                            " PASSWORD : " + t_Password + ". From PG Council  Sambalpur University, Jyoti Vihar Sambalpur.", "1452",
                            result.Rows[0]["AppID"].ToString(), UID);
                        /*-------------------Successful Registartion Message to the User/Candidate--------------------------*/
                        SendSMS(Data.MobileNo, "Dear " + Data.CandidateName + " Your Application has been registered successfully for " +
                            Data.ProgramName + " of PG Admission Course 2018-19 with Application No." +
                            result.Rows[0]["AppID"].ToString() + ". Please make payment against the application and upload the relevant document. Application without application fees and relevant document will be rejected.PG Council, Sambalpur University, Jyoti Vihar Sambalpur.", "1452", result.Rows[0]["AppID"].ToString(), UID);

                        SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "1452", result.Rows[0]["AppID"].ToString(), UID);
                        //USE THIS FUNTION FOR MAIL
                    }
                    else
                    {
                        t_ServiceResult.AppID = "";
                        t_ServiceResult.Status = "AlreadyExist";
                        t_ServiceResult.intStatus = 0;
                    }
                }
            }
            catch (Exception ex)
            {
                t_ServiceResult.AppID = "";
                t_ServiceResult.Status = "Unable to save Applicatin, Please refresh the browser and try again \n.error log--" + ex.Message + "----";
                t_ServiceResult.intStatus = 2;
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));

        }

        private string GetSUPGCurrentAddressXML(SUPGAdmission_DT Data)
        {

            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "CurrentAddress";

            dtCurrentTable.Columns.Add(new DataColumn("phouseNumber", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ppostOffice", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plocality", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("plandmark", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstreet", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pvillage", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("psubDistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pdistrict", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pstate", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("pincode", typeof(string)));

            drCurrentRow = dtCurrentTable.NewRow();

            drCurrentRow["phouseNumber"] = Data.PresentAddressline1 == null ? "" : Data.PresentAddressline1.Trim();//OK
            //drCurrentRow["pcareOf"] = Data.pcareOf == null ? "" : Data.pcareOf.Trim();
            drCurrentRow["ppostOffice"] = Data.PresentAddressline2 == null ? "" : Data.PresentAddressline2.Trim();//OK
            drCurrentRow["plocality"] = Data.PreLocality == null ? "" : Data.PreLocality.Trim();//OK
            drCurrentRow["plandmark"] = Data.PreLandmark == null ? "" : Data.PreLandmark.Trim();//OK
            drCurrentRow["pstreet"] = Data.PreRoadstreet == null ? "" : Data.PreRoadstreet.Trim();//OK
            drCurrentRow["pvillage"] = Data.PreVillage == null ? "" : Data.PreVillage.Trim();//OK
            drCurrentRow["psubDistrict"] = Data.PreBlock == null ? "" : Data.PreBlock.Trim();//OK
            drCurrentRow["pdistrict"] = Data.PreDistrict == null ? "" : Data.PreDistrict.Trim();//OK
            drCurrentRow["pstate"] = Data.PreState == null ? "" : Data.PreState.Trim();//OK
            drCurrentRow["pincode"] = Data.PrePincode == null ? "" : Data.PrePincode.Trim();//OK

            dtCurrentTable.Rows.Add(drCurrentRow);

            System.Data.DataTable dtprogXML = dtCurrentTable;

            string CurrentAddressXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "CurrentAddressXML";
            dtprogXML.WriteXml(swriter);
            CurrentAddressXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return CurrentAddressXML;
        }

        public string GetProgramList(string DepartmentCode, string CourseType)
        {
            CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
            System.Data.DataTable DTSubjectList = m_AdmissionFormBLL.Get_SUProgramList(DepartmentCode, CourseType);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = DTSubjectList.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["ProgramId"],
                        Name = sdr["Program"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }
        public string GetEligibilityCriterea(string ProgramId)
        {
            CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
            System.Data.DataTable DTSubjectList = m_AdmissionFormBLL.Get_SUEligibilityCriteria(ProgramId);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = DTSubjectList.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        EligibilityCriteria = sdr["EligibilityCriteria"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }
        public string GetData(string AppID,string ServiceId)
        {
            OUATBLL m_OUATBLL = new OUATBLL();
            System.Data.DataSet DSProgramDetails = m_OUATBLL.GetPGAdmissionAppDetails(ServiceId, AppID);
            System.Data.DataTable DT = DSProgramDetails.Tables[0];

            List<object> Dlist = new List<object>();
            using (System.Data.DataTableReader sdr = DT.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Dlist.Add(new
                    {
                        Department = sdr["Department"],
                        Programme = sdr["Programme"],
                        CourseType = sdr["CourseType"],
                        IsPassGraduate = sdr["IsPassGraduate"],
                        ApplyingFor = sdr["ApplyingFor"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Dlist));
        }

        public string EditStudentData1617(CBCSAdmissionForm_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {

                "AppID"
             ,"ProfileID"
            ,"AadhaarNumber"
            ,"AadhaarDetail"
            ,"AppName"
            ,"DOB"
            ,"Gender"
            ,"MotherTongue"
             ,"FatherName"
             ,"MotherName"
             ,"GuardianName"
            ,"Relation"
            ,"Category"
            ,"MobileNo"
            ,"EmailId"
            , "careOf"
            , "careOfLocal"
            , "districtLocal"
            , "houseNumber"
            , "houseNumberLocal"
            , "landmark"
            , "landmarkLocal"
            , "language"
            , "locality"
            , "localityLocal"
            , "phone"

            , "pincode"
            , "pincodeLocal"
            , "postOffice"
            , "postOfficeLocal"
            , "residentName"
            , "residentNameLocal"
            , "responseCode"
            , "state"
            , "stateLocal"
            , "district"
            , "street"
            , "streetLocal"
            , "subDistrict"
            , "subDistrictLocal"
            , "Village"
            , "statecode"
            , "districtcode"
            , "subDistrictcode"
            , "Villagecode"
            , "Image"
            , "ImageSign"
            , "ResponseType"
            , "JSONData"
            , "CurrentAddressXML"
            , "Password"
            , "LastCourseXML"
            , "AdmissionDate"
            ,"AdmissionNo"
            , "Branch"
            ,"CollegeCode"
            , "Subject1"
            , "Subject2"
            , "Subject3"
            , "Subject4"
            , "Subject5"
            , "Subject6"
             , "Subject7"
             ,"RollNoSSC"
             ,"BoardNameSSC"
             ,"ExamPassSSC"
             ,"PassingYearSSC"
             ,"GradeTypeSSC"
             ,"TotalMarkSSC"
             ,"MarkObtainedSSC"
             ,"PercentageSSC"
             ,"BoardType"
             ,"RollNoHSC"
             ,"BoardNameHSC"
             ,"ExamPassHSC"
             ,"PassingYearHSC"
             ,"GradeTypeHSC"
             ,"TotalMarkHSC"
             ,"MarkObtainedHSC"
             ,"PercentageHSC"
            , "IsActive"
            , "CreatedBy"
            , "CreatedOn"
            ,"Sublbl1"
            ,"Sublbl2"
            ,"Sublbl3"
            ,"Sublbl4"
            ,"Sublbl5"
            ,"Sublbl6"
            ,"Sublbl7"
            };

            System.Data.DataTable result = null;
            string UID = "";
            CBCSAdmissionFormBLL t_InsertCBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            string CurrentAddressXML = GetCBCSAdmissionCurrentAddressXML(Data);
            Data.CurrentAddressXML = CurrentAddressXML;
            string t_Password = GenPassword();
            Data.Password = t_Password;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);
            //add in xml format data by vibhav 13 jun 017
            Data.LastCourseXML = GetCBCSCourseDetails_xml(Data.HeirsDXML);

            result = t_InsertCBCSAdmissionFormBLL.EditStudentData1617DT(Data, AFields);
            string t_LoginID = "", PayStatus = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText;
            MailID = "";
            CCMailID = BCCMailID = Subject = MailText = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["Mobile"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                UID = result.Rows[0]["aadhaarNumber"].ToString();

                MailID = result.Rows[0]["MailID"].ToString();
                CCMailID = result.Rows[0]["CCMailID"].ToString();
                BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                Subject = result.Rows[0]["Subject"].ToString();
                MailText = result.Rows[0]["MailText"].ToString();
                PayStatus = result.Rows[0]["PayStatus"].ToString();

                string statusid = result.Rows[0]["Status"].ToString();


                if (statusid == "2")
                {
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "InvalidAppID";
                    t_ServiceResult.intStatus = 2;

                }
                else if (statusid == "3")
                {
                    //faild reason rollno already exist with other user/application......
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "RollNoAlreadyUsed";
                    t_ServiceResult.intStatus = 3;

                }
                else if (statusid == "4")
                {
                    //faild reason regno already exist with other user/application......
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "RegNoAlreadyUsed";
                    t_ServiceResult.intStatus = 4;

                }
                else
                {
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;

                    if (result.Rows[0]["Mobile"].ToString() != "")
                    {
                        //SMS Send To Applicant
                        //EMailSMS t_EMailSMS = new EMailSMS();

                        //t_EMailSMS.sendsms(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["SMSText"].ToString());

                        if (result.Rows[0]["MailID"].ToString() != "")
                        {
                           // MailText = MailText.Replace("@ReferenceID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", result.Rows[0]["LoginID"].ToString()).Replace("@Weblink1", result.Rows[0]["Weblink1"].ToString()).Replace("@Weblink2", result.Rows[0]["Weblink2"].ToString()).Replace("@LastDate", result.Rows[0]["LastDate"].ToString()).Replace("@AdmissionNo", result.Rows[0]["AdmissionNo"].ToString());

                            //SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "424", result.Rows[0]["AppID"].ToString(), UID);
                        }
                    }
                }

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string GetEditApplicationDetails1617(string AppID)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            CBCSAdmissionFormBLL t_CBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
            System.Data.DataSet dtAppList = t_CBCSAdmissionFormBLL.GetEditApplicationDetails1617(AppID);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtAppList.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        AadhaarNo = sdr["AadhaarNo"],
                        AppID = sdr["AppID"],
                        RegNo = sdr["RegNo"],
                        RollNo = sdr["RollNo"],
                        AdmissionNo = sdr["AdmissionNo"],
                        AdmissionDate = sdr["AdmissionDate"],
                        AdmissionYear = sdr["AdmissionYear"],
                        BranchCode = sdr["BranchCode"],
                        BranchName = sdr["BranchName"],
                        Name = sdr["Name"],
                        Mobile = sdr["Mobile"],
                        Email = sdr["Email"],
                        Father = sdr["Father"],
                        Mother = sdr["Mother"],
                        Gaurdian = sdr["Gaurdian"],
                        Relation = sdr["Relation"],
                        DOB = sdr["DOB"],
                        Age = sdr["Age"],
                        Gender = sdr["Gender"],
                        MotherTongue = sdr["MotherTongue"],
                        Category = sdr["Category"],
                        CollegeCode = sdr["CollegeCode"],
                        CollegeName = sdr["CollegeName"],
                        ServiceID = sdr["ServiceID"],
                        SubjectList = sdr["SubjectList"],
                        AddrCareOf = sdr["AddrCareOf"],
                        AddrBuilding = sdr["AddrBuilding"],
                        AddrStreet = sdr["AddrStreet"],
                        AddrLandmark = sdr["AddrLandmark"],
                        AddrLocality = sdr["AddrLocality"],
                        State = sdr["State"],
                        District = sdr["District"],
                        Taluka = sdr["Taluka"],
                        Village = sdr["Village"],
                        PinCode = sdr["PinCode"],
                        CareOfP = sdr["CareOfP"],
                        CareOfLocalP = sdr["CareOfLocalP"],
                        houseNumberP = sdr["houseNumberP"],
                        LandmarkP = sdr["LandmarkP"],
                        LocalityP = sdr["LocalityP"],
                        pincodeP = sdr["pincodeP"],
                        StreetP = sdr["StreetP"],
                        StateCodeP = sdr["StateCodeP"],
                        DistrictCodeP = sdr["DistrictCodeP"],
                        BlockCodeP = sdr["BlockCodeP"],
                        PanchayatCodeP = sdr["PanchayatCodeP"],
                        BoardType = sdr["BoardType"],
                        RollNo10 = sdr["RollNo10"],
                        BoardName = sdr["BoardName"],
                        ExamPass = sdr["ExamPass"],
                        PassingYear = sdr["PassingYear"],
                        GradeType = sdr["GradeType"],
                        TotalMark = sdr["TotalMark"],
                        MarkObtained = sdr["MarkObtained"],
                        Percentage = sdr["Percentage"],
                        Type = sdr["Type"],
                        BoardType12 = sdr["BoardType12"],
                        RollNo12 = sdr["RollNo12"],
                        BoardName12 = sdr["BoardName12"],
                        ExamPass12 = sdr["ExamPass12"],
                        PassingYear12 = sdr["PassingYear12"],
                        GradeType12 = sdr["GradeType12"],
                        TotalMark12 = sdr["TotalMark12"],
                        MarkObtained12 = sdr["MarkObtained12"],
                        Percentage12 = sdr["Percentage12"],
                        Type12 = sdr["Type12"],
                        ImageSign = sdr["ImageSign"],
                        ApplicantImageStr = sdr["ApplicantImageStr"],
                        LastCourse = sdr["LastCourse"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetEditStudentInfo(string RollNo)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            CBCSAdmissionFormBLL t_CBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
            System.Data.DataSet dtAppList = t_CBCSAdmissionFormBLL.GetEditStudentInfo(RollNo);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtAppList.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        AadhaarNo = sdr["AadhaarNo"],
                        AppID = sdr["AppID"],
                        RegNo = sdr["RegNo"],
                        RollNo = sdr["RollNo"],
                        AdmissionNo = sdr["AdmissionNo"],
                        AdmissionDate = sdr["AdmissionDate"],
                        AdmissionYear = sdr["AdmissionYear"],
                        BranchCode = sdr["BranchCode"],
                        BranchName = sdr["BranchName"],
                        Name = sdr["Name"],
                        Mobile = sdr["Mobile"],
                        Email = sdr["Email"],
                        Father = sdr["Father"],
                        Mother = sdr["Mother"],
                        Gaurdian = sdr["Gaurdian"],
                        Relation = sdr["Relation"],
                        DOB = sdr["DOB"],
                        Age = sdr["Age"],
                        Gender = sdr["Gender"],
                        MotherTongue = sdr["MotherTongue"],
                        Category = sdr["Category"],
                        CollegeCode = sdr["CollegeCode"],
                        CollegeName = sdr["CollegeName"],
                        ServiceID = sdr["ServiceID"],
                        SubjectList = sdr["SubjectList"],
                        AddrCareOf = sdr["AddrCareOf"],
                        AddrBuilding = sdr["AddrBuilding"],
                        AddrStreet = sdr["AddrStreet"],
                        AddrLandmark = sdr["AddrLandmark"],
                        AddrLocality = sdr["AddrLocality"],
                        State = sdr["State"],
                        District = sdr["District"],
                        Taluka = sdr["Taluka"],
                        Village = sdr["Village"],
                        PinCode = sdr["PinCode"],
                        CareOfP = sdr["CareOfP"],
                        CareOfLocalP = sdr["CareOfLocalP"],
                        houseNumberP = sdr["houseNumberP"],
                        LandmarkP = sdr["LandmarkP"],
                        LocalityP = sdr["LocalityP"],
                        pincodeP = sdr["pincodeP"],
                        StreetP = sdr["StreetP"],
                        StateCodeP = sdr["StateCodeP"],
                        DistrictCodeP = sdr["DistrictCodeP"],
                        BlockCodeP = sdr["BlockCodeP"],
                        PanchayatCodeP = sdr["PanchayatCodeP"],
                        BoardType = sdr["BoardType"],
                        RollNo10 = sdr["RollNo10"],
                        BoardName = sdr["BoardName"],
                        ExamPass = sdr["ExamPass"],
                        PassingYear = sdr["PassingYear"],
                        GradeType = sdr["GradeType"],
                        TotalMark = sdr["TotalMark"],
                        MarkObtained = sdr["MarkObtained"],
                        Percentage = sdr["Percentage"],
                        Type = sdr["Type"],
                        BoardType12 = sdr["BoardType12"],
                        RollNo12 = sdr["RollNo12"],
                        BoardName12 = sdr["BoardName12"],
                        ExamPass12 = sdr["ExamPass12"],
                        PassingYear12 = sdr["PassingYear12"],
                        GradeType12 = sdr["GradeType12"],
                        TotalMark12 = sdr["TotalMark12"],
                        MarkObtained12 = sdr["MarkObtained12"],
                        Percentage12 = sdr["Percentage12"],
                        Type12 = sdr["Type12"],
                        ImageSign = sdr["ImageSign"],
                        ApplicantImageStr = sdr["ApplicantImageStr"],
                        LastCourse = sdr["LastCourse"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }


        public string UpdateStudentData(CBCSAdmissionForm_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
             "RollNo"
            ,"AppID"
            ,"ProfileID"
            ,"AadhaarNumber"
            ,"AadhaarDetail"
            ,"AppName"
            ,"DOB"
            ,"Gender"
            ,"MotherTongue"
             ,"FatherName"
             ,"MotherName"
             ,"GuardianName"
            ,"Relation"
            ,"Category"
            ,"MobileNo"
            ,"EmailId"
            , "careOf"
            , "careOfLocal"
            , "districtLocal"
            , "houseNumber"
            , "houseNumberLocal"
            , "landmark"
            , "landmarkLocal"
            , "language"
            , "locality"
            , "localityLocal"
            , "phone"

            , "pincode"
            , "pincodeLocal"
            , "postOffice"
            , "postOfficeLocal"
            , "residentName"
            , "residentNameLocal"
            , "responseCode"
            , "state"
            , "stateLocal"
            , "district"
            , "street"
            , "streetLocal"
            , "subDistrict"
            , "subDistrictLocal"
            , "Village"
            , "statecode"
            , "districtcode"
            , "subDistrictcode"
            , "Villagecode"
            , "Image"
            , "ImageSign"
            , "ResponseType"
            , "JSONData"
            , "CurrentAddressXML"
            , "Password"
            , "LastCourseXML"
            , "AdmissionDate"
            ,"AdmissionNo"
            , "Branch"
            ,"CollegeCode"
            , "Subject1"
            , "Subject2"
            , "Subject3"
            , "Subject4"
            , "Subject5"
            , "Subject6"
             , "Subject7"
             ,"Subject8"
             ,"RollNoSSC"
             ,"BoardNameSSC"
             ,"ExamPassSSC"
             ,"PassingYearSSC"
             ,"GradeTypeSSC"
             ,"TotalMarkSSC"
             ,"MarkObtainedSSC"
             ,"PercentageSSC"
             ,"BoardType"
             ,"RollNoHSC"
             ,"BoardNameHSC"
             ,"ExamPassHSC"
             ,"PassingYearHSC"
             ,"GradeTypeHSC"
             ,"TotalMarkHSC"
             ,"MarkObtainedHSC"
             ,"PercentageHSC"
            , "IsActive"
            , "CreatedBy"
            , "CreatedOn"
            ,"Sublbl1"
            ,"Sublbl2"
            ,"Sublbl3"
            ,"Sublbl4"
            ,"Sublbl5"
            ,"Sublbl6"
            ,"Sublbl7"
            ,"Sublbl8"
            ,"Remarks"
            };

            System.Data.DataTable result = null;
            string UID = "";
            CBCSAdmissionFormBLL t_InsertCBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            string CurrentAddressXML = GetCBCSAdmissionCurrentAddressXML(Data);
            Data.CurrentAddressXML = CurrentAddressXML;
            string t_Password = GenPassword();
            Data.Password = t_Password;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);
            //add in xml format data by vibhav 13 jun 017
            Data.LastCourseXML = GetCBCSCourseDetails_xml(Data.HeirsDXML);

            result = t_InsertCBCSAdmissionFormBLL.UpdateStudentData(Data, AFields);
            string t_LoginID = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText;
            MailID = "";
            CCMailID = BCCMailID = Subject = MailText = "";
            if (result.Rows.Count > 0)
            {
                t_LoginID = result.Rows[0]["Mobile"].ToString();
                t_Password = result.Rows[0]["Password"].ToString();
                UID = result.Rows[0]["aadhaarNumber"].ToString();

                MailID = result.Rows[0]["MailID"].ToString();
                CCMailID = result.Rows[0]["CCMailID"].ToString();
                BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                Subject = result.Rows[0]["Subject"].ToString();
                MailText = result.Rows[0]["MailText"].ToString();

                MailText = "";
                string statusid = result.Rows[0]["Status"].ToString();

                if (statusid == "2")
                {
                    //SMS Send To Applicant with login credentials
                    if (result.Rows[0]["Mobile"].ToString() != "")
                    {
                        //SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                        //faild reason aadhaar & mobile already exist
                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "AadhaarMobile";
                        t_ServiceResult.intStatus = 2;
                    }
                }
                else if (statusid == "3")
                {
                    //faild reason mobile already exist
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Mobile";
                    t_ServiceResult.intStatus = 3;

                }
                else if (statusid == "4")
                {
                    //faild reason aadhaar already exist
                    if (result.Rows[0]["Mobile"].ToString() != "")
                    {
                        //send sms to applicant
                        //SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["ApplicantSMSText"].ToString());
                        t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                        t_ServiceResult.Status = "Aadhaar";
                        t_ServiceResult.intStatus = 4;
                    }
                }
                else
                {
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;

                    if (result.Rows[0]["Mobile"].ToString() != "")
                    {
                        //SMS Send To Applicant
                        SendSMS(result.Rows[0]["Mobile"].ToString(), result.Rows[0]["SMSText"].ToString());

                        if (result.Rows[0]["MailID"].ToString() != "")
                        {
                            //MailText = MailText.Replace("@ReferenceID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", result.Rows[0]["LoginID"].ToString()).Replace("@Weblink1", result.Rows[0]["Weblink1"].ToString()).Replace("@Weblink2", result.Rows[0]["Weblink2"].ToString()).Replace("@LastDate", result.Rows[0]["LastDate"].ToString()).Replace("@AdmissionNo", result.Rows[0]["AdmissionNo"].ToString());

                            //SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "424", result.Rows[0]["AppID"].ToString(), UID);
                        }
                    }
                }

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string InsertNoticeDetail(NoticeData_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                "NoticeDate","NoticeNumber","NoticeType","NoticeHeading","NoticeDetail","CreatedBy"
            };

            System.Data.DataTable result = null;
            string UID = "";
            CBCSAdmissionFormBLL t_InsertCBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;
            
            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);
           
            result = t_InsertCBCSAdmissionFormBLL.InsertNoticeDetail(Data, AFields);
            string t_LoginID = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText;
            MailID = "";
            CCMailID = BCCMailID = Subject = MailText = "";

            if (result.Rows.Count > 0)
            {
                MailID = result.Rows[0]["MailID"].ToString();
                CCMailID = result.Rows[0]["CCMailID"].ToString();
                BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                Subject = result.Rows[0]["Subject"].ToString();
                MailText = result.Rows[0]["MailText"].ToString();

                if (result.Rows[0]["MailID"].ToString() != "")
                    //SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "424", result.Rows[0]["NoticeNo"].ToString(), UID);
                    CommonUtility.SendEmailWithAttachment("", "", "", MailID, CCMailID, BCCMailID, Subject, MailText, true, null);


                if (result.Rows[0]["MobileNo"].ToString() != "")
                    SendSMS(result.Rows[0]["MobileNo"].ToString(), result.Rows[0]["SMSText"].ToString());
                
                t_ServiceResult.AppID = result.Rows[0]["NoticeNo"].ToString();
                t_ServiceResult.Status = "Success";
                t_ServiceResult.intStatus = 1;
                
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string GetNoticeDetail(string SearchText, string FromDate, string ToDate, string NoticeType)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");
            //NoticeData_DT Data = new NoticeData_DT();

            System.Data.DataTable result = null;
            string UID = "";
            CBCSAdmissionFormBLL t_InsertCBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
            NoticeString t_NoticeString = new NoticeString();

            result = t_InsertCBCSAdmissionFormBLL.GetNoticeDetail(SearchText, FromDate, ToDate, NoticeType);

            return JsonConvert.SerializeObject(result, Newtonsoft.Json.Formatting.Indented);



            //for (int i = 0; i < result.Rows.Count; i++)
            //{
            //    t_NoticeString.NoticeNumber = result.Rows[i]["NoticeNumber"].ToString();
            //    t_NoticeString.NoticeDate = result.Rows[i]["NoticeDate"].ToString();
            //    t_NoticeString.NoticeHeading = result.Rows[i]["NoticeHeading"].ToString();
            //    t_NoticeString.NoticeDetail = result.Rows[i]["NoticeDetail"].ToString();

            //}

            ////Data.JSONData = new JavaScriptSerializer().Serialize(Data);
            //return (new JavaScriptSerializer().Serialize(t_NoticeString));
        }

        public string GetStudentCount(string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, string HonsCode, int ReportType)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");
            NoticeData_DT Data = new NoticeData_DT();

            System.Data.DataTable result = null;
            string UID = "";
            G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
            DrillDownGrid t_DrillDownGrid = new DrillDownGrid();
            LoginID = GetKioskID(objSessionTuple);
            //string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, int ReportType
            result = m_G2GDashboardBLL.GetChartData(LoginID, AdmissionYear, CollegeCode, BranchCode, HonsCode, ReportType);

            return JsonConvert.SerializeObject(result, Newtonsoft.Json.Formatting.Indented);
            
        }

        public string GetDrillSemFee(string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, int ReportType)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");
            NoticeData_DT Data = new NoticeData_DT();

            System.Data.DataTable result = null;
            string UID = "";
            G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
            DrillDownGrid t_DrillDownGrid = new DrillDownGrid();
            LoginID = GetKioskID(objSessionTuple);
            //string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, int ReportType
            result = m_G2GDashboardBLL.GetDrillSemFee(LoginID, AdmissionYear, CollegeCode, BranchCode, ReportType);

            return JsonConvert.SerializeObject(result, Newtonsoft.Json.Formatting.Indented);

        }

        public string GetSemFeeCount(string LoginID, int ExamYear, string CollegeCode, string Semester, string BranchCode, string ExamType, int ReportType)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");
            NoticeData_DT Data = new NoticeData_DT();

            System.Data.DataTable result = null;
            string UID = "";
            G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
            DrillDownGrid t_DrillDownGrid = new DrillDownGrid();
            LoginID = GetKioskID(objSessionTuple);
            //string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, int ReportType
            result = m_G2GDashboardBLL.GetSemFeeCount(LoginID, ExamYear, CollegeCode, Semester, BranchCode, ExamType, ReportType);

            return JsonConvert.SerializeObject(result, Newtonsoft.Json.Formatting.Indented);

        }

        public string GetStudentChart(string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, string HonsCode, int ReportType)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");
            NoticeData_DT Data = new NoticeData_DT();
            LoginID = objSessionTuple[0].ToString();
            System.Data.DataTable result = null;
            string UID = "";
            G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
            DrillDownGrid t_DrillDownGrid = new DrillDownGrid();
            LoginID = GetKioskID(objSessionTuple);
            //string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, int ReportType
            result = m_G2GDashboardBLL.GetStudentChart(LoginID, AdmissionYear, CollegeCode, BranchCode, HonsCode, ReportType);

            return JsonConvert.SerializeObject(result, Newtonsoft.Json.Formatting.Indented);

        }
        public string GetStudentInternal(string LoginID)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");
            NoticeData_DT Data = new NoticeData_DT();
            LoginID = objSessionTuple[0].ToString();
            System.Data.DataTable result = null;
            
            G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
            LoginID = GetKioskID(objSessionTuple);
            result = m_G2GDashboardBLL.GetStudentInternal(LoginID);

            return JsonConvert.SerializeObject(result, Newtonsoft.Json.Formatting.Indented);

        }

        public string GetEditStudentPics(string RollNo)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            CBCSAdmissionFormBLL t_CBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
            System.Data.DataSet dtAppList = t_CBCSAdmissionFormBLL.GetEditStudentPics(RollNo);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtAppList.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        AadhaarNo = sdr["AadhaarNo"],
                        AppID = sdr["AppID"],
                        RollNo = sdr["RollNo"],
                        Name = sdr["Name"],
                        Mobile = sdr["Mobile"],
                        Father = sdr["Father"],
                        Mother = sdr["Mother"],
                        DOB = sdr["DOB"],                        
                        ImageSign = sdr["ImageSign"],
                        ApplicantImageStr = sdr["ApplicantImageStr"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string UpdateStudentPics(EditStudentPics_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
             "RollNo"
            ,"AppID"
            ,"ProfileID"
            ,"AadhaarNumber"
            ,"Image"
            ,"ImageSign"
            , "CreatedBy"            
            ,"Remarks"
            };

            System.Data.DataTable result = null;
            string UID = "";
            CBCSAdmissionFormBLL t_InsertCBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            
            result = t_InsertCBCSAdmissionFormBLL.UpdateStudentPics(Data, AFields);

            if (result.Rows.Count > 0)
            {
                string statusid = result.Rows[0]["Status"].ToString();

                if (statusid == "1")
                {
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;

                }
                else {
                    t_ServiceResult.AppID = "";
                    t_ServiceResult.Status = "Error";
                    t_ServiceResult.intStatus = 0;
                }

            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        #region CSVTUPHDApplication
        public string GetPhDResearchCenter()
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            OUATBLL t_OUATBLL = new OUATBLL();
            System.Data.DataTable dtOUATCollege = t_OUATBLL.GetPhDResearchCenter();
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtOUATCollege.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["RCCode"],
                        Name = sdr["ResearchCenters"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetPhDDiscipline(string RCCode, string IsMPhil, string IsExemption)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            OUATBLL t_OUATBLL = new OUATBLL();
            System.Data.DataTable dtOUATCollege = t_OUATBLL.GetPhDDiscipline(RCCode, IsMPhil, IsExemption);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtOUATCollege.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["DisciplineCode"],
                        Name = sdr["DisciplineName"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GetPhDSpecialization(string DisciplineCode)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            OUATBLL t_OUATBLL = new OUATBLL();
            System.Data.DataTable dtOUATCollege = t_OUATBLL.GetPhDSpecialization(DisciplineCode);
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtOUATCollege.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["SpecializationCode"],
                        Name = sdr["SpecializationName"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }
        #endregion

        #region CSVTUPhDApplication
        public string ValidateRegisteredMobileCSVTU(string Mobile, string Type)
        {
            OUATBLL t_OUATBLL = new OUATBLL();
            DataSet ds = new DataSet();
            ds = t_OUATBLL.ValidateRegisteredMobileCSVTU(Mobile, Type);

            System.Data.DataTable DT = ds.Tables[0];
            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = DT.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        UserName = sdr["UserName"],
                        Mobile = sdr["Mobile"],
                        Email = sdr["Email"],
                        Result = sdr["Result"],
                        Msg = sdr["Msg"],
                        MsgHeader = sdr["MsgHeader"]
                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
        }

        public string GenerateOTPCSVTU(string prefix, string MobileNo, string AppType)
        {
            OTP_DT objOTP = new OTP_DT();
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                 "MobileNo"
                ,"SMSID"
                ,"OTPCode"
                ,"CreatedOn"
                ,"CreatedBy"
                ,"ClientIP"
                ,"AppType"
            };

            System.Data.DataTable result = null;

            string Mobile = "", OTP = "", VallidTill = "", SMSID = "", UID = "", SMSText = "", TemplateID="";

            OUATBLL t_OTPBLL = new OUATBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            string SMSId = SMSUnqID();
            string OTPCode = GenOTPCode();

            //objOTP.aadhaarNumber = UID;
            objOTP.MobileNo = MobileNo;
            objOTP.SMSID = SMSId;
            objOTP.OTPCode = OTPCode;

            objOTP.CreatedBy = KioskID;
            objOTP.CreatedOn = DateTime.Now;
            objOTP.AppType = AppType;

            result = t_OTPBLL.InsertOTPCSVTU(objOTP, AFields);

            if (result.Rows.Count > 0)
            {
                if (result.Rows[0]["FormFlag"].ToString() == "0")
                {
                    UID = result.Rows[0]["aadhaarNumber"].ToString();
                    Mobile = result.Rows[0]["Mobile"].ToString();
                    SMSID = result.Rows[0]["SMSID"].ToString();
                    OTP = result.Rows[0]["OTPCode"].ToString();
                    VallidTill = result.Rows[0]["validtill"].ToString();
                    SMSText = result.Rows[0]["SMSText"].ToString();
                    TemplateID = result.Rows[0]["TemplateID"].ToString();
                    t_ServiceResult.AppID = UID + "_" + "OTP" + "_" + VallidTill + "_" + MobileNo.Remove(3, 7).PadRight(8, 'X') + MobileNo.Remove(0, 8) + "_" + SMSID + "_" + MobileNo;
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;

                    SendSMS(result.Rows[0]["Mobile"].ToString(), SMSText, TemplateID);

                }
                else
                {
                    //already exist in ouat form a
                    t_ServiceResult.AppID = "";
                    t_ServiceResult.Status = "AlreadyExist";
                    t_ServiceResult.intStatus = 1;
                }
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        public string ValidateOTPCSVTU(string UID, string EnteredOTP)
        {
            OTP_DT objOTP = new OTP_DT();
            //string KioskID = OperationContext.Current.IncomingMessageHeaders.GetHeader<string>("Session", "KioskID");
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                 "aadhaarNumber"
                ,"SMSID"
                ,"OTPCode"
                ,"OTPEntered"
                ,"ModifiedBy"
                ,"ModifiedOn"
                ,"MobileNo"
                ,"ClientIP"
            };

            System.Data.DataTable result = null;
            string[] temp = UID.Split('_');

            string tUID = temp[0], OTPCode = temp[1], VallidTill = temp[2], Mobile = temp[5], SMSID = temp[4];

            OUATBLL t_OTPBLL = new OUATBLL();
            ValidateUser validateUser = new ValidateUser();

            validateUser.AppID = "";
            validateUser.Status = "Error";
            validateUser.intStatus = 0;

            objOTP.aadhaarNumber = tUID;
            objOTP.SMSID = SMSID;
            objOTP.OTPCode = OTPCode;
            objOTP.OTPEntered = EnteredOTP;
            objOTP.validTill = Convert.ToDateTime(VallidTill);
            objOTP.MobileNo = Mobile;
            objOTP.ModifiedBy = KioskID;
            objOTP.ModifiedOn = DateTime.Now;

            result = t_OTPBLL.ValidateOTPCSVTU(objOTP, AFields);

            if (result.Rows.Count > 0)
            {
                if (result.Rows[0]["Result"].ToString() == "1")
                {
                    validateUser.AppID = result.Rows[0]["AppID"].ToString();
                    validateUser.Status = "Success";
                    validateUser.intStatus = 1;

                    validateUser.ResponseType = result.Rows[0]["ResponseType"].ToString();
                    validateUser.Keyfield = result.Rows[0]["KeyField"].ToString();
                    validateUser.ProfileID = result.Rows[0]["ProfileID"].ToString();
                }
                else
                {
                    validateUser.AppID = result.Rows[0]["AppID"].ToString();
                    validateUser.Status = "InvalidOTP";
                    validateUser.intStatus = 0;

                    validateUser.ResponseType = result.Rows[0]["ResponseType"].ToString();
                    validateUser.Keyfield = result.Rows[0]["KeyField"].ToString();
                    validateUser.ProfileID = result.Rows[0]["ProfileID"].ToString();
                }
            }

            return (new JavaScriptSerializer().Serialize(validateUser));
        }

        public string InsertPHDFormData(CSVTUPhDForm_DT Data)
        {            
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                  "ServiceID"
                 ,"MobileNo"
                 ,"EmailId"
                 ,"IsEntranceExempted"
                 ,"CategoryofExemption"
                 ,"CourseType"
                 ,"ResearchCenter"
                 ,"Discipline"
                 ,"Specialization"
                 ,"ApplicantName"
                 ,"DateofBirth"
                 ,"FatherName"
                 ,"MotherName"
                 ,"Gender"
                 ,"Category"
                 ,"Nationality"
                 ,"PhysicallyChallenged"
                 ,"IsOrtho"
                 ,"IsVisual"
                 ,"IsHearing"
                 ,"ParmanentAddressline1"
                 ,"ParmanentAddressline2"
                 ,"ParRoadstreet"
                 ,"ParLandmark"
                 ,"ParLocality"
                 ,"ParState"
                 ,"ParDistrict"
                 ,"ParBlock"
                 ,"ParVillage"
                 ,"ParPincode"
                 ,"PresentAddressline1"
                 ,"PresentAddressline2"
                 ,"PreRoadstreet"
                 ,"PreLandmark"
                 ,"PreLocality"
                 ,"PreState"
                 ,"PreDistrict"
                 ,"PreBlock"
                 ,"PreVillage"
                 ,"PrePincode"
                 ,"NRIAddressline1"
                 ,"NRIAddressline2"
                 ,"NRICountry"
                 ,"NRICityTown"
                 ,"NRIPincode"
                 ,"AnyOtherCourse"
                 ,"CourseDetail"
                 ,"DisciplinaryAction"
                 ,"DisciplinaryDetail"
                 ,"ResearchPublished"
                 ,"PublishedDetail"
                 ,"ResearchPresented"
                 ,"PresentedDetail"                 
                 
                 ,"CreatedBy"

                 ,"Photograph"
                 ,"Signature"
                 
                ,"EducationDetailXML"
                ,"WorkExperianceXML"
                ,"EntranceFellowshipXML"
                ,"Password"

                ,"Entrance"
                ,"CETYear"
                ,"CETPercentage"
                ,"CETValid"
                ,"CETDetail"

                ,"MPhilFrom"
                ,"MPhilTo"
                ,"Mode"
                ,"MPhilCourse"
                ,"MPhilUniv"
                ,"MPhilDetail"
                
                ,"FellowFrom"
                ,"FellowTo"
                ,"FellowCollege"
                ,"FellowUniv"
                ,"SeniorityNo"
                ,"FellowPost"
                
                ,"ResearchFrom"
                ,"ResearchTo"
                ,"Laboratry"
                ,"ResearchOrg"
                ,"ResearchPost"
                ,"ResearchNature"

                ,"CourseFrom"
                ,"CourseTo"
                ,"CourseMode"
                ,"CourseName"
                ,"CourseCollege"
                ,"CourseUniversity"
                ,"CourseRollNo"
            };

            System.Data.DataTable result = null;
            string UID = "";

            OUATBLL t_OUATBLL = new OUATBLL(); 
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;

            Data.EducationDetailXML = GetEducationDetailXML(Data.EducationDetailXML);
            Data.WorkExperianceXML = GetWorkExperianceXML(Data.WorkExperianceXML);
            Data.EntranceFellowshipXML = GetEntranceFellowshipXML(Data.EntranceFellowshipXML);            

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);

            result = t_OUATBLL.InsertCSVTUPGPhDData(Data, AFields);
            string t_LoginID = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText, SMSText, TemplateId;
            MailID = CCMailID = BCCMailID = Subject = MailText = SMSText = TemplateId = "";
            if (result.Rows.Count > 0)
            {
                if (result.Rows[0]["Status"].ToString() == "1")//data save
                {
                    t_LoginID = result.Rows[0]["Mobile"].ToString();
                    //t_Password = result.Rows[0]["Password"].ToString();
                    UID = result.Rows[0]["aadhaarNumber"].ToString();

                    MailID = result.Rows[0]["MailID"].ToString();
                    CCMailID = result.Rows[0]["CCMailID"].ToString();
                    BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                    Subject = result.Rows[0]["Subject"].ToString();
                    MailText = result.Rows[0]["MailText"].ToString();
                    SMSText = result.Rows[0]["SMSText"].ToString();
                    TemplateId = result.Rows[0]["TemplateId"].ToString();
                    //MailText = @"";
                    //MailText = MailText.Replace("@AppID", result.Rows[0]["AppID"].ToString()).Replace("@Name", result.Rows[0]["Name"].ToString()).Replace("@Password", result.Rows[0]["Password"].ToString()).Replace("@Login", UID);

                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;
                    
                    SendSMS(Data.MobileNo, SMSText, TemplateId);
                    
                    SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "1466", result.Rows[0]["AppID"].ToString(), UID);
                    //USE THIS FUNTION FOR MAIL
                }
                else // data not save bcoz mobile already reg.
                {
                    t_ServiceResult.AppID = "";
                    t_ServiceResult.Status = "AlreadyExist";
                    t_ServiceResult.intStatus = 0;
                }
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        private string GetEducationDetailXML_old(CSVTUPhDForm_DT Data)
        {

            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "EducationDetail";

            dtCurrentTable.Columns.Add(new DataColumn("RollNo", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("EducationName", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("InstituteName", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("BoardName", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("EduDiscipline", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("EduSpecialization", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("TotalMark", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("MarkObtain", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("Percentage", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("Division", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("EduFromYear", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("EduToYear", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("PassingYear", typeof(string)));

            drCurrentRow = dtCurrentTable.NewRow();

            drCurrentRow["RollNo"] = Data.RollNo== null ? "" : Data.RollNo.Trim();
            drCurrentRow["EducationName"] = Data.EducationName == null ? "" : Data.EducationName.Trim();
            drCurrentRow["InstituteName"] = Data.InstituteName == null ? "" : Data.InstituteName.Trim();
            drCurrentRow["BoardName"] = Data.BoardName == null ? "" : Data.BoardName.Trim();
            drCurrentRow["EduDiscipline"] = Data.EduDiscipline == null ? "" : Data.EduDiscipline.Trim();
            drCurrentRow["EduSpecialization"] = Data.EduSpecialization == null ? "" : Data.EduSpecialization.Trim();
            drCurrentRow["TotalMark"] = Data.TotalMark == null ? "" : Data.TotalMark.Trim();
            drCurrentRow["MarkObtain"] = Data.MarkObtain == null ? "" : Data.MarkObtain.Trim();
            drCurrentRow["Percentage"] = Data.Percentage == null ? "" : Data.Percentage.Trim();
            drCurrentRow["Division"] = Data.Division == null ? "" : Data.Division.Trim();
            drCurrentRow["EduFromYear"] = Data.EduFromYear == null ? "" : Data.EduFromYear.Trim();
            drCurrentRow["EduToYear"] = Data.EduToYear == null ? "" : Data.EduToYear.Trim();
            drCurrentRow["PassingYear"] = Data.PassingYear == null ? "" : Data.PassingYear.Trim();

            dtCurrentTable.Rows.Add(drCurrentRow);

            System.Data.DataTable dtprogXML = dtCurrentTable;

            string EducationDetailXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "EducationDetailXML";
            dtprogXML.WriteXml(swriter);
            EducationDetailXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return EducationDetailXML;
        }
        
        private string GetEducationDetailXML(string Data)
        {
            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "EducationDetail";
           
            dtCurrentTable.Columns.Add(new DataColumn("EducationName", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("InstituteName", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("BoardName", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("EduDiscipline", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("EduSpecialization", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("PassingYear", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("Percentage", typeof(string)));
            
            #region Code by Niraj
            
            string strSave = null;
            string strTempString = null;

            if (Data.Length > 0)
            {
                strSave = Data;
                strTempString = Data;

                string[] arrRows = strTempString.Split(new char[] { '#' });
                string[] arrCols = null;

                for (int i = 0; i < arrRows.Length; i++)
                {
                    drCurrentRow = dtCurrentTable.NewRow();

                    arrCols = arrRows[i].Split(new char[] { '^' });

                    //if (arrCols.Length == 5)
                    {

                        drCurrentRow["EducationName"] = arrCols[0] == null && arrCols[0] == "" ? "" : arrCols[0];
                        drCurrentRow["InstituteName"] = arrCols[1] == null && arrCols[1] == "" ? "" : arrCols[1];
                        drCurrentRow["BoardName"] = arrCols[2] == null && arrCols[2] == "" ? "" : arrCols[2];
                        drCurrentRow["EduDiscipline"] = arrCols[3] == null && arrCols[3] == "" ? "" : arrCols[3];
                        drCurrentRow["EduSpecialization"] = arrCols[4] == null && arrCols[4] == "" ? "" : arrCols[4];
                        drCurrentRow["PassingYear"] = arrCols[5] == null && arrCols[5] == "" ? "" : arrCols[5];
                        drCurrentRow["Percentage"] = arrCols[6] == null && arrCols[6] == "" ? "" : arrCols[6];


                        dtCurrentTable.Rows.Add(drCurrentRow);
                    }
                }
            }

            #endregion Code by Niraj

            System.Data.DataTable dtprogXML = dtCurrentTable;

            string EducationDetailXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "EducationDetailXML";
            dtprogXML.WriteXml(swriter);
            EducationDetailXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return EducationDetailXML;
        }

        private string GetWorkExperianceXML(string Data)
        {

            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "WorkExperiance";

            dtCurrentTable.Columns.Add(new DataColumn("WSlNo", typeof(string))); 
            dtCurrentTable.Columns.Add(new DataColumn("WFromYear", typeof(string))); 
            dtCurrentTable.Columns.Add(new DataColumn("WToYear", typeof(string))); 
            dtCurrentTable.Columns.Add(new DataColumn("EmployerDetail", typeof(string))); 
            dtCurrentTable.Columns.Add(new DataColumn("Post", typeof(string))); 
            dtCurrentTable.Columns.Add(new DataColumn("AppointmentNature", typeof(string))); 
            dtCurrentTable.Columns.Add(new DataColumn("WYears", typeof(string)));

            string strSave = null;
            string strTempString = null;

            if (Data.Length > 0)
            {
                strSave = Data;
                strTempString = Data;

                string[] arrRows = strTempString.Split(new char[] { '#' }, StringSplitOptions.RemoveEmptyEntries);
                string[] arrCols = null;

                for (int i = 0; i < arrRows.Length; i++)
                {
                    drCurrentRow = dtCurrentTable.NewRow();

                    arrCols = arrRows[i].Split(new char[] { '^' });

                    if (arrCols.Length > 0)
                    {

                        //drCurrentRow["WSlNo"] = arrCols[0] == null || arrCols[0] == "" ? "" : arrCols[0];

                        drCurrentRow["WSlNo"] = arrCols[0] == null || arrCols[0] == "" ? "" : arrCols[0];
                        drCurrentRow["WFromYear"] = arrCols[1] == null || arrCols[1] == "" ? "" : arrCols[1];
                        drCurrentRow["WToYear"] = arrCols[2] == null || arrCols[2] == "" ? "" : arrCols[2];
                        drCurrentRow["EmployerDetail"] = arrCols[3] == null || arrCols[3] == "" ? "" : arrCols[3];
                        drCurrentRow["Post"] = arrCols[4] == null || arrCols[4] == "" ? "" : arrCols[4];
                        drCurrentRow["AppointmentNature"] = arrCols[5] == null || arrCols[5] == "" ? "" : arrCols[5];
                        drCurrentRow["WYears"] = arrCols[6] == null || arrCols[6] == "" ? "" : arrCols[6];



                        //if (arrCols.Length > 0 && arrCols[0] != null)
                        //    drCurrentRow["WSlNo"] = arrCols[0] != null && arrCols[0] != "" ? arrCols[0] : "";
                        //if (arrCols.Length > 1 && arrCols[1] != null)
                        //    drCurrentRow["WFromYear"] = arrCols[1] != null && arrCols[1] != "" ? arrCols[1] : "";
                        //if (arrCols.Length > 2 && arrCols[2] != null)
                        //    drCurrentRow["WToYear"] = arrCols[2] != null && arrCols[2] == "" ? arrCols[2] : "";
                        //if (arrCols.Length > 3 && arrCols[3] != null)
                        //    drCurrentRow["EmployerDetail"] = arrCols[3] != null && arrCols[3] == "" ? arrCols[3] : "";
                        //if (arrCols.Length > 4 && arrCols[4] != null)
                        //    drCurrentRow["Post"] = arrCols[4] != null && arrCols[4] == "" ? arrCols[4] : "";
                        //if (arrCols.Length > 5 && arrCols[5] != null)
                        //    drCurrentRow["AppointmentNature"] = arrCols[5] == null && arrCols[5] == "" ? arrCols[5] : "";
                        //if (arrCols.Length > 6 && arrCols[6] != null)
                        //    drCurrentRow["WYears"] = arrCols[6] != null && arrCols[6] == "" ? arrCols[6] : "";

                        dtCurrentTable.Rows.Add(drCurrentRow);
                    }
                }
            }
             
            System.Data.DataTable dtprogXML = dtCurrentTable;

            string WorkExperianceXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "WorkExperianceXML";
            dtprogXML.WriteXml(swriter);
            WorkExperianceXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return WorkExperianceXML;
        }

        private string GetEntranceFellowshipXML(string Data)
        {

            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "EntranceFellowship";

            dtCurrentTable.Columns.Add(new DataColumn("FSlNo", typeof(string))); 
            dtCurrentTable.Columns.Add(new DataColumn("ExaminationName", typeof(string))); 
            dtCurrentTable.Columns.Add(new DataColumn("ExaminationDiscipline", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("FYears", typeof(string))); 
            dtCurrentTable.Columns.Add(new DataColumn("Detail", typeof(string)));

            string strSave = null;
            string strTempString = null;

            if (Data.Length > 0)
            {
                strSave = Data;
                strTempString = Data;

                string[] arrRows = strTempString.Split(new char[] { '#' }, StringSplitOptions.RemoveEmptyEntries);
                string[] arrCols = null;

                for (int i = 0; i < arrRows.Length; i++)
                {
                    drCurrentRow = dtCurrentTable.NewRow();

                    arrCols = arrRows[i].Split(new char[] { '^' }, StringSplitOptions.RemoveEmptyEntries);

                    if (arrCols.Length > 0)
                    {

                        drCurrentRow["FSlNo"] = arrCols[0] == null || arrCols[0] == "" ? "" : arrCols[0];
                        drCurrentRow["ExaminationName"] = arrCols[1] == null || arrCols[1] == "" ? "" : arrCols[1];
                        drCurrentRow["ExaminationDiscipline"] = arrCols[2] == null || arrCols[2] == "" ? "" : arrCols[2];
                        drCurrentRow["FYears"] = arrCols[3] == null || arrCols[3] == "" ? "" : arrCols[3];
                        drCurrentRow["Detail"] = arrCols[4] == null || arrCols[4] == "" ? "" : arrCols[4];
                        

                        dtCurrentTable.Rows.Add(drCurrentRow);
                    }
                }
            }
                       
            System.Data.DataTable dtprogXML = dtCurrentTable;

            string EntranceFellowshipXML = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "EntranceFellowshipXML";
            dtprogXML.WriteXml(swriter);
            EntranceFellowshipXML = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return EntranceFellowshipXML;
        }
        #endregion


        string m_LogFilePath = "";
        Log m_Log = new Log();

        #region Enrollmnet-2021
        public string InsertEnrollmentData(EnrollmentData_DT Data)
        {

            string t_LogFileName = "Status_" + DateTime.Now.ToString("yyyy-MM-dd") + ".txt";
            string t_LogFilePath = "";

            t_LogFilePath = Path.Combine(Path.GetDirectoryName(System.Web.Hosting.HostingEnvironment.ApplicationPhysicalPath), "Logs", t_LogFileName);
            m_LogFilePath = t_LogFilePath;

            m_Log.FileName = m_LogFilePath;

            m_Log.WriteToLog(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));

            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");
            m_Log.WriteToLog("After Reading Session values");

            string culture = GetCulture(objSessionTuple);
            m_Log.WriteToLog("After reasing culture");

            string KioskID = GetKioskID(objSessionTuple);
            m_Log.WriteToLog("Aftre rasing KioskID");

            string[] AFields = {
                
            "ProfileID",
            "DTERegistrationNo",
            "DTERollNo",
            "CourseName",
            "CollegeCode",
            "CourseType",
            "EntryType",
            "AdmittedQuota",
            "AdmissionYear",
            "AdmissionDate",
            "ExamType",
            "CSVTURedgNo",
            "StudentName",
            "FatherName",
            "MotherName",
            "DOB",
            "Gender",
            "MobileNo",
            "EmailId",
            "PhysicallyChallanged",
            "Nationality",
            "BloodGroup",
            "Category",
            "EducationGap",
            "GapFromYear",
            "GapToYear",
            "HasMigration",
            "MigrationNo",
            "MigrationDate",
            "HasScoreCard",
            "ScoreCardDetail",

            "CourseDetailXML",

            "ParmanentAddressline1",
            "ParmanentAddressline2",
            "ParRoadstreet",
            "ParLandmark",
            "ParLocality",
            "ParState",
            "ParDistrict",
            "ParBlock",
            "ParVillage",
            "ParPincode",
            "PresentAddressline1",
            "PresentAddressline2",
            "PreRoadstreet",
            "PreLandmark",
            "PreLocality",
            "PreState",
            "PreDistrict",
            "PreBlock",
            "PreVillage",
            "PrePincode",

            "Photograph",
            "Signature",
            "PathPhotograph",
            "PathSignature",

            "LoginID",
            "Password",
            "JSONData",

            "CreatedBy",
            "ClientIP",
            "CasteCertificate",
            "CasteCertificateNo",
            "CasteCertificateDate",
            "CasteIssuingAuthority",
            "EntranceRollNo",
            "EntranceMarks",

            "DomicileState",
            "DomicileDistrict",
            "DomicileTehsil",
            "DomicileNo",
            "DomicileDate",
            "DomicleAuthority",

            "MarkSheetXDoc",
            "MarkSheetXIIDoc",
            "DiplomaCerificateDoc",
            "UGMarkSheetDoc",
            "PGMarkSheetDoc",
            "CasteCertificateDoc",
            "DomicileCertificateDoc",
            "MigrationCertificateDoc",
            "GapCertificateDoc",
            "ScoreCardDoc",
            "OtherDoc",

            "AdmittedCategory",
            "PhysicsTM",
            "PhysicsMO",
            "PhysicsPR",
            "ChemistryTM",
            "ChemistryMO",
            "ChemistryPR",
            "MathematicsTM",
            "MathematicsMO",
            "MathematicsPR",
            "PhysicsSubject",
            "ChemistrySubject",
            "MathematicsSubject"
            };

            System.Data.DataTable result = null;
            string UID = "";
            EnrollmentBLL t_EnrollmentBLL = new EnrollmentBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;
            
            m_Log.WriteToLog("Before Genpassword");
            string t_Password = GenPassword();
            Data.Password = t_Password;

            m_Log.WriteToLog("Before Seriliaze");
            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);
            
            m_Log.WriteToLog("Before CourseDetailXML");
            m_Log.WriteToLog(Data.CourseDetailXML);
            Data.CourseDetailXML = GetEnrollmentCourseDetailsXML(Data.CourseDetailXML);

            m_Log.WriteToLog("After CourseDetailXML");

            string m_Path_Sign = ConfigurationManager.AppSettings["EnrollmentImage"].ToString() + "\\" + Data.AdmissionYear + "\\Signature\\";
            string m_Path_Photo = ConfigurationManager.AppSettings["EnrollmentImage"].ToString() + "\\" + Data.AdmissionYear + "\\Photograph\\";
            m_Log.WriteToLog("Aftre Path Set");

            Data.PathSignature = m_Path_Sign;
            Data.PathPhotograph = m_Path_Photo;

            m_Log.WriteToLog("Before Insert Statement");

            try
            {
                result = t_EnrollmentBLL.InsertEnrollmentFormData(Data, AFields);
            }
            catch(Exception ex)
            {
                t_ServiceResult.AppID = "";
                t_ServiceResult.Status = "Error";
                t_ServiceResult.intStatus = 0;
                t_ServiceResult.message = ex.Message;

                return (new JavaScriptSerializer().Serialize(t_ServiceResult));

                m_Log.WriteToLog(ex.Message);
                m_Log.WriteToLog(ex.StackTrace);
                m_Log.WriteToLog(ex.InnerException.Message);
                m_Log.WriteToLog(ex.InnerException.StackTrace);


            }

            m_Log.WriteToLog("After Insert Statement");


            string LoginID = "", Password="";
            string MailID, CCMailID, BCCMailID, Subject, MailText, SMSText;
            MailID = CCMailID = BCCMailID = Subject = MailText = SMSText = "";
            if (result.Rows.Count > 0)
            {
                if (result.Rows[0]["Status"].ToString() == "1")//data save
                {
                    //Check if directory exist
                    if (!System.IO.Directory.Exists(m_Path_Sign))
                    {
                        System.IO.Directory.CreateDirectory(m_Path_Sign); //Create directory if it doesn't exist
                    }

                    if (!System.IO.Directory.Exists(m_Path_Photo))
                    {
                        System.IO.Directory.CreateDirectory(m_Path_Photo); //Create directory if it doesn't exist
                    }

                    bool t_Result_Photo = false;
                    bool t_Result_Sign = false;

                    string ProfileID = result.Rows[0]["ProfileID"].ToString();

                    if (Data.Photograph != "")
                    {
                        t_Result_Photo = SaveImage(Data.Photograph.Replace("data:image/png;base64,",""), ProfileID, m_Path_Photo);
                    }

                    if (Data.Signature != "")
                    {
                        t_Result_Sign = SaveImage(Data.Signature.Replace("data:image/png;base64,", ""), ProfileID, m_Path_Sign);
                    }
                    

                    LoginID = result.Rows[0]["Mobile"].ToString();
                    Password = result.Rows[0]["Password"].ToString();
                    
                    MailID = result.Rows[0]["MailID"].ToString();
                    CCMailID = result.Rows[0]["CCMailID"].ToString();
                    BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                    Subject = result.Rows[0]["Subject"].ToString();
                    MailText = result.Rows[0]["MailText"].ToString();
                    SMSText = result.Rows[0]["SMSText"].ToString();
                    
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;

                    SendSMS(Data.MobileNo, SMSText);

                    SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "1466", result.Rows[0]["AppID"].ToString(), UID);
                   
                }
                else 
                {
                    t_ServiceResult.AppID = "";
                    t_ServiceResult.Status = "AlreadyExist";
                    t_ServiceResult.intStatus = 0;
                }
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }
        
        private bool SaveImage(string ImgStr, string ImgName, string path)
        {
            string m_Log = "";
            try
            {
                string imageName = ImgName + ".jpg";

                //set the image path
                string imgPath = Path.Combine(path, imageName);

                byte[] imageBytes = Convert.FromBase64String(ImgStr);

                File.WriteAllBytes(imgPath, imageBytes);

                return true;
            }
            catch (Exception e)
            {
                //m_Log.WriteToLog(string.Format("{0} {1}", e.Message, e.StackTrace));
                Console.WriteLine("Error: " + e.Message);
                return false;
            }
        }
        private string GetEnrollmentCourseDetailsXML(string Data)
        {
            DataTable dtCurrentTable = new DataTable();
            DataRow drCurrentRow = null;
            dtCurrentTable.TableName = "EducationDetail";
            dtCurrentTable.Columns.Add(new DataColumn("SNO", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ExamType", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ExamRollNo", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ExamName", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("ExamBoard", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("InstituteName", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("PassingYear", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("TotalMarks", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("MarksObtained", typeof(string)));
            dtCurrentTable.Columns.Add(new DataColumn("Percentage", typeof(string)));

            #region Code by Niraj
            
            string strSave = null;
            string strTempString = null;
            
            if (Data.Length > 0)
            {
                strSave = Data;
                strTempString = Data;

                string[] arrRows = strTempString.Split(new char[] { '#' }, StringSplitOptions.RemoveEmptyEntries);
                string[] arrCols = null;

                for (int i = 0; i < arrRows.Length; i++)
                {
                    drCurrentRow = dtCurrentTable.NewRow();

                    arrCols = arrRows[i].Split(new char[] { '|' }, StringSplitOptions.RemoveEmptyEntries);

                    //if (arrCols.Length == 5)
                    {
                        drCurrentRow["SNO"] = arrCols[0] == null || arrCols[0] == "" ? "" : arrCols[0];
                        drCurrentRow["ExamType"] = arrCols[1] == null || arrCols[1] == "" ? "" : arrCols[1];
                        drCurrentRow["ExamRollNo"] = arrCols[2] == null || arrCols[2] == "" ? "" : arrCols[2];
                        drCurrentRow["ExamName"] = arrCols[3] == null || arrCols[3] == "" ? "" : arrCols[3];
                        drCurrentRow["ExamBoard"] = arrCols[4] == null || arrCols[4] == "" ? "" : arrCols[4];
                        drCurrentRow["InstituteName"] = arrCols[5] == null || arrCols[5] == "" ? "" : arrCols[5];
                        drCurrentRow["PassingYear"] = arrCols[6] == null || arrCols[6] == "" ? "" : arrCols[6];
                        drCurrentRow["TotalMarks"] = arrCols[7] == null || arrCols[7] == "" ? "" : arrCols[7];
                        drCurrentRow["MarksObtained"] = arrCols[8] == null || arrCols[8] == "" ? "" : arrCols[8];
                        drCurrentRow["Percentage"] = arrCols[9] == null || arrCols[9] == "" ? "" : arrCols[9];

                        dtCurrentTable.Rows.Add(drCurrentRow);
                    }


                }


            }

            #endregion Code by Niraj

            System.Data.DataTable dtprogXML = dtCurrentTable;

            string CourseDetails = null;
            StringWriter swriter = new StringWriter();
            dtprogXML.TableName = "CourseDetails";
            dtprogXML.WriteXml(swriter);
            CourseDetails = swriter.ToString().Replace("\r", "").Replace("\n", "");

            return CourseDetails;


        }

        #endregion

        #region EnrollmnetPartTime-2021
        public string InsertEnrollmentPartTime(EnrollmentData_DT Data)
        {

            string t_LogFileName = "Status_" + DateTime.Now.ToString("yyyy-MM-dd") + ".txt";
            string t_LogFilePath = "";

            t_LogFilePath = Path.Combine(Path.GetDirectoryName(System.Web.Hosting.HostingEnvironment.ApplicationPhysicalPath), "Logs", t_LogFileName);
            m_LogFilePath = t_LogFilePath;

            m_Log.FileName = m_LogFilePath;

            m_Log.WriteToLog(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));

            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");
            m_Log.WriteToLog("After Reading Session values");

            string culture = GetCulture(objSessionTuple);
            m_Log.WriteToLog("After reasing culture");

            string KioskID = GetKioskID(objSessionTuple);
            m_Log.WriteToLog("Aftre rasing KioskID");

            string[] AFields = {

            "ProfileID",
            "DTERegistrationNo",
            "DTERollNo",
            "CourseName",
            "CollegeCode",
            "CourseCode",
            "ProgramCode",
            "CourseType",
            "EntryType",
            "AdmittedQuota",
            "AdmissionYear",
            "AdmissionDate",
            "ExamType",
            "CSVTURedgNo",
            "StudentName",
            "FatherName",
            "MotherName",
            "DOB",
            "Gender",
            "MobileNo",
            "EmailId",
            "PhysicallyChallanged",
            "Nationality",
            "BloodGroup",
            "Category",
            "EducationGap",
            "GapFromYear",
            "GapToYear",
            "HasMigration",
            "MigrationNo",
            "MigrationDate",
            "HasScoreCard",
            "ScoreCardDetail",

            "CourseDetailXML",

            "ParmanentAddressline1",
            "ParmanentAddressline2",
            "ParRoadstreet",
            "ParLandmark",
            "ParLocality",
            "ParState",
            "ParDistrict",
            "ParBlock",
            "ParVillage",
            "ParPincode",
            "PresentAddressline1",
            "PresentAddressline2",
            "PreRoadstreet",
            "PreLandmark",
            "PreLocality",
            "PreState",
            "PreDistrict",
            "PreBlock",
            "PreVillage",
            "PrePincode",

            "Photograph",
            "Signature",
            "PathPhotograph",
            "PathSignature",

            "LoginID",
            "Password",
            "JSONData",

            "CreatedBy",
            "ClientIP",
            "CasteCertificate",
            "CasteCertificateNo",
            "CasteCertificateDate",
            "CasteIssuingAuthority",
            "EntranceRollNo",
            "EntranceMarks",

            "DomicileState",
            "DomicileDistrict",
            "DomicileTehsil",
            "DomicileNo",
            "DomicileDate",
            "DomicleAuthority",

            "MarkSheetXDoc",
            "MarkSheetXIIDoc",
            "DiplomaCerificateDoc",
            "UGMarkSheetDoc",
            "PGMarkSheetDoc",
            "CasteCertificateDoc",
            "DomicileCertificateDoc",
            "MigrationCertificateDoc",
            "GapCertificateDoc",
            "ScoreCardDoc",
            "OtherDoc",

            "AdmittedCategory",
            "PhysicsTM",
            "PhysicsMO",
            "PhysicsPR",
            "ChemistryTM",
            "ChemistryMO",
            "ChemistryPR",
            "MathematicsTM",
            "MathematicsMO",
            "MathematicsPR",
            "PhysicsSubject",
            "ChemistrySubject",
            "MathematicsSubject"
            };

            System.Data.DataTable result = null;
            string UID = "";
            EnrollmentBLL t_EnrollmentBLL = new EnrollmentBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            m_Log.WriteToLog("Before Genpassword");
            string t_Password = GenPassword();
            Data.Password = t_Password;

            m_Log.WriteToLog("Before Seriliaze");
            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);

            m_Log.WriteToLog("Before CourseDetailXML");
            m_Log.WriteToLog(Data.CourseDetailXML);
            Data.CourseDetailXML = GetEnrollmentCourseDetailsXML(Data.CourseDetailXML);

            m_Log.WriteToLog("After CourseDetailXML");

            string m_Path_Sign = ConfigurationManager.AppSettings["EnrollmentImage"].ToString() + "\\" + Data.AdmissionYear + "\\Signature\\";
            string m_Path_Photo = ConfigurationManager.AppSettings["EnrollmentImage"].ToString() + "\\" + Data.AdmissionYear + "\\Photograph\\";
            m_Log.WriteToLog("Aftre Path Set");

            Data.PathSignature = m_Path_Sign;
            Data.PathPhotograph = m_Path_Photo;

            m_Log.WriteToLog("Before Insert Statement");

            try
            {
                result = t_EnrollmentBLL.InsertEnrollmentPartTime(Data, AFields);
            }
            catch (Exception ex)
            {
                t_ServiceResult.AppID = "";
                t_ServiceResult.Status = "Error";
                t_ServiceResult.intStatus = 0;
                t_ServiceResult.message = ex.Message;

                return (new JavaScriptSerializer().Serialize(t_ServiceResult));

                m_Log.WriteToLog(ex.Message);
                m_Log.WriteToLog(ex.StackTrace);
                m_Log.WriteToLog(ex.InnerException.Message);
                m_Log.WriteToLog(ex.InnerException.StackTrace);


            }

            m_Log.WriteToLog("After Insert Statement");


            string LoginID = "", Password = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText, SMSText;
            MailID = CCMailID = BCCMailID = Subject = MailText = SMSText = "";
            if (result.Rows.Count > 0)
            {
                if (result.Rows[0]["Status"].ToString() == "1")//data save
                {
                    //Check if directory exist
                    if (!System.IO.Directory.Exists(m_Path_Sign))
                    {
                        System.IO.Directory.CreateDirectory(m_Path_Sign); //Create directory if it doesn't exist
                    }

                    if (!System.IO.Directory.Exists(m_Path_Photo))
                    {
                        System.IO.Directory.CreateDirectory(m_Path_Photo); //Create directory if it doesn't exist
                    }

                    bool t_Result_Photo = false;
                    bool t_Result_Sign = false;

                    string ProfileID = result.Rows[0]["ProfileID"].ToString();

                    if (Data.Photograph != "")
                    {
                        t_Result_Photo = SaveImage(Data.Photograph.Replace("data:image/png;base64,", ""), ProfileID, m_Path_Photo);
                    }

                    if (Data.Signature != "")
                    {
                        t_Result_Sign = SaveImage(Data.Signature.Replace("data:image/png;base64,", ""), ProfileID, m_Path_Sign);
                    }


                    LoginID = result.Rows[0]["Mobile"].ToString();
                    Password = result.Rows[0]["Password"].ToString();

                    MailID = result.Rows[0]["MailID"].ToString();
                    CCMailID = result.Rows[0]["CCMailID"].ToString();
                    BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                    Subject = result.Rows[0]["Subject"].ToString();
                    MailText = result.Rows[0]["MailText"].ToString();
                    SMSText = result.Rows[0]["SMSText"].ToString();

                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;

                    SendSMS(Data.MobileNo, SMSText);

                    SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "1466", result.Rows[0]["AppID"].ToString(), UID);

                }
                else
                {
                    t_ServiceResult.AppID = "";
                    t_ServiceResult.Status = "AlreadyExist";
                    t_ServiceResult.intStatus = 0;
                }
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }
        
        #endregion

        #region UpdateStudentPassword
        public string InsertPasswordDetail(UpdateStudentPassword_DT Data)
        {
            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");

            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);

            string[] AFields = {
                   "EnrollmentNo"
                 , "RollNo"
                 , "LoginID"
                 , "Password"
                 , "MobileNo"
                 , "EmailID"
                 , "Photograph"
                 , "Signature"
            };

            System.Data.DataTable result = null;
            string UID = "";

            ChangePasswordBLL t_ChangePasswordBLL = new ChangePasswordBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;

            string m_Path_Sign = ConfigurationManager.AppSettings["EnrollmentImage"].ToString() + "\\StudentPhoto\\ResetPassword\\";
            string m_Path_Photo = ConfigurationManager.AppSettings["EnrollmentImage"].ToString() + "\\StudentSignature\\ResetPassword\\";

            //Data.Signature = m_Path_Sign;
            //Data.Photograph = m_Path_Photo;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);

            result = t_ChangePasswordBLL.InsertPasswordDetail(Data, AFields);
            string t_LoginID = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText, SMSText;
            MailID = CCMailID = BCCMailID = Subject = MailText = SMSText = "";
            if (result.Rows.Count > 0)
            {
                if (result.Rows[0]["Status"].ToString() == "1")//data save
                {
                    //Check if directory exist
                    if (!System.IO.Directory.Exists(m_Path_Sign))
                    {
                        System.IO.Directory.CreateDirectory(m_Path_Sign); //Create directory if it doesn't exist
                    }

                    if (!System.IO.Directory.Exists(m_Path_Photo))
                    {
                        System.IO.Directory.CreateDirectory(m_Path_Photo); //Create directory if it doesn't exist
                    }

                    bool t_Result_Photo = false;
                    bool t_Result_Sign = false;

                    string ProfileID = result.Rows[0]["ProfileID"].ToString();

                    if (Data.Photograph != "")
                    {
                        //
                        t_Result_Photo = SaveImage(Data.Photograph.Replace("data:image/png;base64,", "").Replace("data:image/jpeg;base64,", ""), ProfileID, m_Path_Photo);
                    }

                    if (Data.Signature != "")
                    {
                        t_Result_Sign = SaveImage(Data.Signature.Replace("data:image/png;base64,", "").Replace("data:image/jpeg;base64,", ""), ProfileID, m_Path_Sign);
                    }

                    t_LoginID = result.Rows[0]["Mobile"].ToString();
                    //t_Password = result.Rows[0]["Password"].ToString();
                    UID = result.Rows[0]["EnrollmentNo"].ToString();

                    MailID = result.Rows[0]["MailID"].ToString();
                    CCMailID = result.Rows[0]["CCMailID"].ToString();
                    BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                    Subject = result.Rows[0]["Subject"].ToString();
                    MailText = result.Rows[0]["MailText"].ToString();
                    SMSText = result.Rows[0]["SMSText"].ToString();
                    
                    t_ServiceResult.AppID = result.Rows[0]["EnrollmentNo"].ToString();
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;

                    SendSMS(Data.MobileNo, SMSText);

                    SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "1468", result.Rows[0]["AppID"].ToString(), UID);
                    //USE THIS FUNTION FOR MAIL
                }
                else // data not save bcoz mobile already reg.
                {
                    t_ServiceResult.AppID = "";
                    t_ServiceResult.Status = "AlreadyExist";
                    t_ServiceResult.intStatus = 0;
                }
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        #endregion

        #region EnrollmnetPartTime-2021
        public string UpdateEnrollmentData(EnrollmentData_DT Data)
        {

            string t_LogFileName = "Status_" + DateTime.Now.ToString("yyyy-MM-dd") + ".txt";
            string t_LogFilePath = "";

            //t_LogFilePath = Path.Combine(Path.GetDirectoryName(System.Web.Hosting.HostingEnvironment.ApplicationPhysicalPath), "Logs", t_LogFileName);
            //m_LogFilePath = t_LogFilePath;

            //m_Log.FileName = m_LogFilePath;

            //m_Log.WriteToLog(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));

            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");
            //m_Log.WriteToLog("After Reading Session values");

            string culture = GetCulture(objSessionTuple);
            //m_Log.WriteToLog("After reasing culture");

            string KioskID = GetKioskID(objSessionTuple);
            //m_Log.WriteToLog("Aftre rasing KioskID");

            string[] AFields = {

            "ProfileID",
            "DTERegistrationNo",
            "DTERollNo",
            "CourseName",
            "CollegeCode",
            "CourseCode",
            "ProgramCode",
            "CourseType",
            "EntryType",
            "AdmittedQuota",
            "AdmissionYear",
            "AdmissionDate",
            "ExamType",
            "CSVTURedgNo",
            "StudentName",
            "FatherName",
            "MotherName",
            "DOB",
            "Gender",
            "MobileNo",
            "EmailId",
            "PhysicallyChallanged",
            "Nationality",
            "BloodGroup",
            "Category",
            "EducationGap",
            "GapFromYear",
            "GapToYear",
            "HasMigration",
            "MigrationNo",
            "MigrationDate",
            "HasScoreCard",
            "ScoreCardDetail",

            //"CourseDetailXML",

            //"ParmanentAddressline1",
            //"ParmanentAddressline2",
            //"ParRoadstreet",
            //"ParLandmark",
            //"ParLocality",
            //"ParState",
            //"ParDistrict",
            //"ParBlock",
            //"ParVillage",
            //"ParPincode",
            //"PresentAddressline1",
            //"PresentAddressline2",
            //"PreRoadstreet",
            //"PreLandmark",
            //"PreLocality",
            //"PreState",
            //"PreDistrict",
            //"PreBlock",
            //"PreVillage",
            //"PrePincode",

            //"Photograph",
            //"Signature",
            //"PathPhotograph",
            //"PathSignature",

            //"LoginID",
            //"Password",
            "JSONData",

            "CreatedBy",
            "ClientIP",
            "CasteCertificate",
            "CasteCertificateNo",
            "CasteCertificateDate",
            "CasteIssuingAuthority",
            "EntranceRollNo",
            "EntranceMarks",

            "DomicileState",
            "DomicileDistrict",
            "DomicileTehsil",
            "DomicileNo",
            "DomicileDate",
            "DomicleAuthority",

            "MarkSheetXDoc",
            "MarkSheetXIIDoc",
            "DiplomaCerificateDoc",
            "UGMarkSheetDoc",
            "PGMarkSheetDoc",
            "CasteCertificateDoc",
            "DomicileCertificateDoc",
            "MigrationCertificateDoc",
            "GapCertificateDoc",
            "ScoreCardDoc",
            "OtherDoc",

            "AdmittedCategory",
            /**/
            "PhysicsTM",
            "PhysicsMO",
            "PhysicsPR",
            "ChemistryTM",
            "ChemistryMO",
            "ChemistryPR",
            "MathematicsTM",
            "MathematicsMO",
            "MathematicsPR",
            "PhysicsSubject",
            "ChemistrySubject",
            "MathematicsSubject",
            "AppID",
            "Lateral"
            };

            System.Data.DataTable result = null;
            string UID = "";
            EnrollmentBLL t_EnrollmentBLL = new EnrollmentBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            //m_Log.WriteToLog("Before Genpassword");
            string t_Password = GenPassword();
            Data.Password = t_Password;

            //m_Log.WriteToLog("Before Seriliaze");
            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);

            //m_Log.WriteToLog("Before CourseDetailXML");
            //m_Log.WriteToLog(Data.CourseDetailXML);
            //Data.CourseDetailXML = GetEnrollmentCourseDetailsXML(Data.CourseDetailXML);

            //m_Log.WriteToLog("After CourseDetailXML");

            //string m_Path_Sign = ConfigurationManager.AppSettings["EnrollmentImage"].ToString() + "\\" + Data.AdmissionYear + "\\Signature\\";
            //string m_Path_Photo = ConfigurationManager.AppSettings["EnrollmentImage"].ToString() + "\\" + Data.AdmissionYear + "\\Photograph\\";
            //m_Log.WriteToLog("Aftre Path Set");

            //Data.PathSignature = m_Path_Sign;
            //Data.PathPhotograph = m_Path_Photo;

            //m_Log.WriteToLog("Before Insert Statement");

            try
            {
                result = t_EnrollmentBLL.UpdateEnrollmentData(Data, AFields);
            }
            catch (Exception ex)
            {
                t_ServiceResult.AppID = "";
                t_ServiceResult.Status = "Error";
                t_ServiceResult.intStatus = 0;
                t_ServiceResult.message = ex.Message;

                return (new JavaScriptSerializer().Serialize(t_ServiceResult));

                m_Log.WriteToLog(ex.Message);
                //m_Log.WriteToLog(ex.StackTrace);
                //m_Log.WriteToLog(ex.InnerException.Message);
                //m_Log.WriteToLog(ex.InnerException.StackTrace);


            }

            //m_Log.WriteToLog("After Insert Statement");


            string LoginID = "", Password = "";
            string MailID, CCMailID, BCCMailID, Subject, MailText, SMSText;
            MailID = CCMailID = BCCMailID = Subject = MailText = SMSText = "";
            if (result.Rows.Count > 0)
            {
                if (result.Rows[0]["Status"].ToString() == "1")//data save
                {
                    //Check if directory exist
                    //if (!System.IO.Directory.Exists(m_Path_Sign))
                    //{
                    //    System.IO.Directory.CreateDirectory(m_Path_Sign); //Create directory if it doesn't exist
                    //}

                    //if (!System.IO.Directory.Exists(m_Path_Photo))
                    //{
                    //    System.IO.Directory.CreateDirectory(m_Path_Photo); //Create directory if it doesn't exist
                    //}

                    bool t_Result_Photo = false;
                    bool t_Result_Sign = false;

                    string ProfileID = result.Rows[0]["ProfileID"].ToString();

                    //if (Data.Photograph != "")
                    //{
                    //    t_Result_Photo = SaveImage(Data.Photograph.Replace("data:image/png;base64,", ""), ProfileID, m_Path_Photo);
                    //}

                    //if (Data.Signature != "")
                    //{
                    //    t_Result_Sign = SaveImage(Data.Signature.Replace("data:image/png;base64,", ""), ProfileID, m_Path_Sign);
                    //}


                    //LoginID = result.Rows[0]["Mobile"].ToString();
                    //Password = result.Rows[0]["Password"].ToString();

                    //MailID = result.Rows[0]["MailID"].ToString();
                    //CCMailID = result.Rows[0]["CCMailID"].ToString();
                    //BCCMailID = result.Rows[0]["BCCMailID"].ToString();
                    //Subject = result.Rows[0]["Subject"].ToString();
                    //MailText = result.Rows[0]["MailText"].ToString();
                    //SMSText = result.Rows[0]["SMSText"].ToString();

                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;
                    t_ServiceResult.message = result.Rows[0]["StatusMessage"].ToString();
                    //SendSMS(Data.MobileNo, SMSText);

                    //SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "1466", result.Rows[0]["AppID"].ToString(), UID);

                }
                else
                {
                    t_ServiceResult.AppID = "";
                    t_ServiceResult.Status = "AlreadyExist";
                    t_ServiceResult.intStatus = 0;
                }
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }

        #endregion

        #region CSVTUProvisional

        public string InsertCBSAData(CBACSVTU_DT Data)
        {

            string t_LogFileName = "Status_" + DateTime.Now.ToString("yyyy-MM-dd") + ".txt";
            string t_LogFilePath = "";

            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");
            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);
            string[] AFields = {

            "ProfileId"
            ,"ServiceId"
            ,"EnrollmentNo"
            ,"RollNo"
            ,"CourseCode"
            ,"ProgramCode"
            ,"AdmissionYear"
            ,"PassingYear"
            ,"StudentNameEnglish"
            ,"StudentNameHindi"
            ,"FatherName"
            ,"EmailID"
            ,"MobileNo"
            ,"DeliverMode"
            ,"DeliverType"
            ,"AddressLine1"
            ,"AddressLine2"
            ,"StateCode"
            ,"DistrictCode"
            ,"SubDistrictCode"
            ,"VillageCode"
            ,"PinCode"
            ,"Remark"
            ,"CreatedBy"
            ,"TCIssueDate"
            ,"TransferCertificateNo"
            ,"ApplyingFor"
            ,"DOB"
            };

            System.Data.DataTable result = null;
            string UID = "";
            MigrationBLL t_MigrationBLL = new MigrationBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;
            
            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);
            
            try
            {
                result = t_MigrationBLL.InsertCBAData(Data, AFields);
            }
            catch (Exception ex)
            {
                t_ServiceResult.AppID = "";
                t_ServiceResult.Status = "Error";
                t_ServiceResult.intStatus = 0;
                t_ServiceResult.message = ex.Message;

                return (new JavaScriptSerializer().Serialize(t_ServiceResult));
              

            }            
           
            string MailID, CCMailID, BCCMailID, Subject, MailText, SMSText;
            MailID = CCMailID = BCCMailID = Subject = MailText = SMSText = "";
            if (result.Rows.Count > 0)
            {
                if (result.Rows[0]["Status"].ToString() == "1")//data save
                {                    
                    string ProfileID = result.Rows[0]["ProfileID"].ToString();
                    
                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;
                    t_ServiceResult.message = result.Rows[0]["StatusMessage"].ToString();
                    //SendSMS(Data.MobileNo, SMSText);

                    //SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "1466", result.Rows[0]["AppID"].ToString(), UID);

                }
                else
                {
                    t_ServiceResult.AppID = "";
                    t_ServiceResult.Status = "AlreadyExist";
                    t_ServiceResult.intStatus = 0;
                }
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }
        #endregion

        #region CSVTUProvisional

        public string InsertTranscriptCBSAData(CBACSVTU_DT Data)
        {

            string t_LogFileName = "Status_" + DateTime.Now.ToString("yyyy-MM-dd") + ".txt";
            string t_LogFilePath = "";

            List<Tuple<string, string>> objSessionTuple = OperationContext.Current.IncomingMessageHeaders.GetHeader<List<Tuple<string, string>>>("Session", "SessionTuple");
            string culture = GetCulture(objSessionTuple);
            string KioskID = GetKioskID(objSessionTuple);
            string[] AFields = {

            "ProfileId"
            ,"ServiceId"
            ,"EnrollmentNo"
            ,"RollNo"
            ,"CourseCode"
            ,"ProgramCode"
            ,"AdmissionYear"
            ,"PassingYear"
            ,"StudentNameEnglish"
            ,"StudentNameHindi"
            ,"FatherName"
            ,"EmailID"
            ,"MobileNo"
            ,"DeliverMode"
            ,"DeliverType"
            ,"AddressLine1"
            ,"AddressLine2"
            ,"StateCode"
            ,"DistrictCode"
            ,"SubDistrictCode"
            ,"VillageCode"
            ,"PinCode"
            ,"Remark"
            ,"CreatedBy"
            ,"TCIssueDate"
            ,"TransferCertificateNo"
            ,"ApplyingFor"
            ,"Semester"
            ,"SemesterCount"
            ,"DOB"
            ,"Coppies"
            ,"SemesterInfo"
            };

            System.Data.DataTable result = null;
            string UID = "";
            MigrationBLL t_MigrationBLL = new MigrationBLL();
            ServiceResult t_ServiceResult = new ServiceResult();

            t_ServiceResult.AppID = "";
            t_ServiceResult.Status = "Error";
            t_ServiceResult.intStatus = 0;

            Data.CreatedBy = KioskID;
            Data.CreatedOn = DateTime.Now;

            Data.JSONData = "";
            Data.JSONData = new JavaScriptSerializer().Serialize(Data);

            try
            {
                result = t_MigrationBLL.InsertCBAData(Data, AFields);
            }
            catch (Exception ex)
            {
                t_ServiceResult.AppID = "";
                t_ServiceResult.Status = "Error";
                t_ServiceResult.intStatus = 0;
                t_ServiceResult.message = ex.Message;

                return (new JavaScriptSerializer().Serialize(t_ServiceResult));


            }

            string MailID, CCMailID, BCCMailID, Subject, MailText, SMSText;
            MailID = CCMailID = BCCMailID = Subject = MailText = SMSText = "";
            if (result.Rows.Count > 0)
            {
                if (result.Rows[0]["Status"].ToString() == "1")//data save
                {
                    string ProfileID = result.Rows[0]["ProfileID"].ToString();

                    t_ServiceResult.AppID = result.Rows[0]["AppID"].ToString();
                    t_ServiceResult.Status = "Success";
                    t_ServiceResult.intStatus = 1;
                    t_ServiceResult.message = result.Rows[0]["StatusMessage"].ToString();
                    //SendSMS(Data.MobileNo, SMSText);

                    //SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "1466", result.Rows[0]["AppID"].ToString(), UID);

                }
                else
                {
                    t_ServiceResult.AppID = "";
                    t_ServiceResult.Status = "AlreadyExist";
                    t_ServiceResult.intStatus = 0;
                }
            }

            return (new JavaScriptSerializer().Serialize(t_ServiceResult));
        }
        #endregion
    }

}


public class Log
{
    public string FileName { get; set; }
    public void WriteToLog(string p_Text)
    {
        string fileName = FileName;
        if (fileName != "")
        {
            if (!Directory.Exists(Path.GetDirectoryName(fileName)))
            {
                Directory.CreateDirectory(Path.GetDirectoryName(fileName));
            }

            if (!File.Exists(fileName))
            {
                File.Create(fileName).Dispose();
            }
            StreamWriter writer = new StreamWriter(fileName, true);
            writer.WriteLine(p_Text);
            writer.Close();
            writer.Dispose();
        }
    }
}


//updated by niraj

