using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using Newtonsoft.Json;
using Quartz;
using Quartz.Impl;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Web.Script.Serialization;

namespace CitizenPortal.WebApp.Kiosk.CCTNS
{
    public class CCTNS_JOB : IJob
    {
        string m_AppID = "", m_ServiceID = "";
        TestCitizenResult oRootObject = null;
        ResidenceBAL residenceBAL = null;
        ResidenceCertificate_DT objRC = null;
        string QuickLinksDirectory = System.Configuration.ConfigurationManager.AppSettings["QuickLinksDirectory"];
        string EdistrictAPI = System.Configuration.ConfigurationManager.AppSettings["EdistrictAPI"];

        public void Execute(IJobExecutionContext context)
        {
            //CASE 1 - REGISTRATION PASS - CERTIFICATE PASS
            //CASE 2 - REGISTRATION FAILED - CERTIFICATE FAILED OR REGISTRATION FAILED
            //CASE 3 - ERTIFICATE FAILED

            residenceBAL = new ResidenceBAL();
            try
            {
                DataTable ResEnrRes = residenceBAL.ResidenceEnrollResponceGet(null, null, false);
                DataTable resiAPIRes = residenceBAL.ResidenceAPIResponceGet(null, null, false);

                // CASE 1 - BOTH PASSED
                //          when regidence has enrolled and apllyied resikdence certificate successfully.
                //         *** Redirect to Acknolegement ***
                //if ((ResEnrRes != null && ResEnrRes.Rows.Count > 0)
                //    && (resiAPIRes != null && resiAPIRes.Rows.Count > 0))
                //{
                //}

                // CASE 2 - BOTH FAILED
                //          when enrollment and certificate both has not applyyied.
                //         *** Call API for Enrollment and Cerificate  ***
                if ((ResEnrRes != null && ResEnrRes.Rows.Count > 0) ||
                     ((ResEnrRes != null && ResEnrRes.Rows.Count > 0) &&
                      (resiAPIRes != null && resiAPIRes.Rows.Count > 0))
                        )
                {

                    for (int i = 0; i < ResEnrRes.Rows.Count; i++)
                    {
                        m_AppID = ""; m_ServiceID = "";
                        m_AppID = APICommon.CheckStrIsNullorEmpty(ResEnrRes.Rows[i]["APPID"].ToString());
                        m_ServiceID = APICommon.CheckStrIsNullorEmpty(ResEnrRes.Rows[i]["ServiceID"].ToString());

                        DataSet ds = residenceBAL.GettResidenceDtl(m_ServiceID, m_AppID);
                        if (ds.Tables.Count > 0 && ds.Tables["CertDtl"].Rows.Count > 0)
                        {
                            DataTable dtl = ds.Tables["CertDtl"];
                            CitizenEnrollment_DT CE = new CitizenEnrollment_DT(dtl);
                            // Call API to Register Citizen
                            CitizenResult citizenResult = RegisterCitizenAPI(CE, m_AppID, m_ServiceID);
                            // If Responce get successed.
                            // Call API to Residence Certificate
                            if (APICommon.CheckStrIsNullorEmpty(citizenResult.Status).ToUpper() == "SUCCESS")
                            {
                                CitizenResult residenceResponce = ResidenceAPI(citizenResult.EID, ds, m_AppID, m_ServiceID);
                            }
                        }
                    }
                }
                //CASE 3 - when enrollment Passed
                //          Certificate Failed
                //          *** Call only Certificate ***
                if (!(ResEnrRes != null && ResEnrRes.Rows.Count > 0) &&
                     (resiAPIRes != null && resiAPIRes.Rows.Count > 0))
                {

                    for (int i = 0; i < resiAPIRes.Rows.Count; i++)
                    {
                        m_AppID = ""; m_ServiceID = "";
                        m_AppID = APICommon.CheckStrIsNullorEmpty(resiAPIRes.Rows[i]["APPID"].ToString());
                        m_ServiceID = APICommon.CheckStrIsNullorEmpty(resiAPIRes.Rows[i]["ServiceID"].ToString());

                        //DataSet ds = residenceBAL.GettResidenceDtl(m_ServiceID, m_AppID);
                        //if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                        //{
                        //    DataTable dtl = ds.Tables[0];
                        DataSet ds = residenceBAL.GettResidenceDtl(m_ServiceID, m_AppID);
                        if (ds.Tables.Count > 0 && ds.Tables["CertDtl"].Rows.Count > 0)
                        {
                            DataTable dtl = ds.Tables["CertDtl"];
                            CitizenEnrollment_DT CE = new CitizenEnrollment_DT(dtl);

                            // If Responce get successed.
                            if (APICommon.CheckStrIsNullorEmpty(resiAPIRes.Rows[0]["Status"].ToString()).ToUpper() == "SUCCESS")
                            {
                                string EID = APICommon.CheckStrIsNullorEmpty(resiAPIRes.Rows[0]["EID"].ToString());
                                CitizenResult residenceResponce = ResidenceAPI(EID, ds, m_AppID, m_ServiceID);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                LogError error = new LogError();
                error.AppID = APICommon.CheckStrIsNullorEmpty(m_AppID);
                error.ServiceID = APICommon.CheckStrIsNullorEmpty(m_ServiceID);
                error.HelpLink = APICommon.CheckStrIsNullorEmpty(ex.HelpLink);

                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                if (string.IsNullOrEmpty(innerMessage))
                {
                    //use either
                    innerMessage = ex.Message;
                    //Or
                    //innerMessage = ex.StackTrace;
                }
                error.InnerExp = APICommon.CheckStrIsNullorEmpty(innerMessage);

                error.TargetSite = APICommon.CheckStrIsNullorEmpty(ex.TargetSite.ToString());
                error.StackTrace = APICommon.CheckStrIsNullorEmpty(ex.StackTrace);
                error.Source = APICommon.CheckStrIsNullorEmpty(ex.Source);
                error.Data = APICommon.CheckStrIsNullorEmpty(ex.Data.ToString());
                residenceBAL.ErrorLog(error);
            }
            finally
            {
            }
        }

        private CitizenResult RegisterCitizenAPI(CitizenEnrollment_DT ce, string m_AppID, string m_ServiceID)
        {
            CitizenResult citizenResult = new CitizenResult();
            //Convert Request Parameters in Json
            string requestJsonString = JsonConvert.SerializeObject(ce);

            NameValueCollection nvc = APICommon.ConvertObjectToNameValueCollection(ce);
            List<FileColectionToUpload> fomrCollection = new List<FileColectionToUpload>();

            //Convert Request form Parameters in Json
            string requestFormString = JsonConvert.SerializeObject(fomrCollection);

            // Log Residence Enrollment Request
            bool res = residenceBAL.LogResidenceEnrollRequest(m_AppID, m_ServiceID, requestJsonString, requestFormString, m_AppID);
            if (!res) throw new Exception("Error in Inserting LogCitigenEnroll Request for AppID - " + m_AppID + " and ServiceID - " + m_ServiceID);
            if (res)
            {
                // Call API to Register Citizen wit EDistrict
                string result = APICommon.HttpUploadFile(EdistrictAPI + "CAP_CitizenEnrollment.php", fomrCollection.ToArray<FileColectionToUpload>(), nvc);
                JavaScriptSerializer oJS = new JavaScriptSerializer();
                oRootObject = new TestCitizenResult();
                oRootObject = oJS.Deserialize<TestCitizenResult>(result);
                //string resiRes = JsonConvert.SerializeObject(oRootObject);
                if (oRootObject != null)
                {
                    foreach (CitizenResult CR in oRootObject.Result)
                    {
                        citizenResult.Status = CR.Status;
                        citizenResult.Msg = CR.Msg;
                        citizenResult.UAI = CR.UAI;
                        citizenResult.UAN = CR.UAN;
                        citizenResult.EID = CR.EID;
                        citizenResult.ApplicationId = CR.ApplicationId;
                        citizenResult.ApplicationStatus = CR.ApplicationStatus;
                        citizenResult.DocumentURL = CR.DocumentURL;
                        citizenResult.CreatedBy = m_AppID;

                        // Log Residence Enrollment Responce
                        string respncJsonString = JsonConvert.SerializeObject(oRootObject);
                        bool respocnc = residenceBAL.LogResidenceEnrollResponse(citizenResult, m_AppID, m_ServiceID, respncJsonString);
                        if (!respocnc) throw new Exception("Error in Inserting LogCitigenEnroll Responce for AppID - " + m_AppID + " and ServiceID - " + m_ServiceID);
                    }
                }
                else
                {
                    throw new Exception("Getting null result from Citizen Registration API for AppID - " + m_AppID + " and ServiceID - " + m_ServiceID);
                }
            }
            return citizenResult;
        }

        private CitizenResult ResidenceAPI(string eid, DataSet ds, string m_AppID, string m_ServiceID)
        {
            #region Residence Cerificate Service API call section

            CitizenResult citizenResult = new CitizenResult();

            DataTable dtl = ds.Tables["CertDtl"];
            objRC = new ResidenceCertificate_DT(dtl);
            objRC.EID = APICommon.DecodeBase64Str(eid);
            objRC.APIKEY = APICommon.ComputeHash(objRC.EID);

            //Covert Request object into json
            string reqJsonString = JsonConvert.SerializeObject(objRC);

            #region File Upload

            NameValueCollection nvc = APICommon.ConvertObjectToNameValueCollection(objRC);
            List<FileColectionToUpload> fomrCollection = new List<FileColectionToUpload>();

            string applPhoto_f = APICommon.CheckStrIsNullorEmpty(ds.Tables["AtthmtDtl"].Rows[0]["Path"].ToString());
            applPhoto_f = APICommon.ReadImagePath(applPhoto_f);
            fomrCollection.Add(new FileColectionToUpload { FileName = "applPhoto_f", FilePath = applPhoto_f, ContentType = @"image/jpeg" });

            string applsign_f = APICommon.CheckStrIsNullorEmpty(ds.Tables["AtthmtDtl"].Rows[1]["Path"].ToString());
            applsign_f = APICommon.ReadImagePath(applsign_f);
            fomrCollection.Add(new FileColectionToUpload { FileName = "applsign_f", FilePath = applsign_f, ContentType = @"image/jpeg" });

            string docId_f1 = APICommon.CheckStrIsNullorEmpty(ds.Tables["AtthmtDtl"].Rows[2]["Path"].ToString());
            docId_f1 = APICommon.ReadImagePath(docId_f1);
            if (docId_f1 != "") fomrCollection.Add(new FileColectionToUpload { FileName = "docId_f[]", FilePath = docId_f1, ContentType = @"image/jpeg" });

            string docId_f2 = APICommon.CheckStrIsNullorEmpty(ds.Tables["AtthmtDtl"].Rows[3]["Path"].ToString());
            docId_f2 = APICommon.ReadImagePath(docId_f2);
            if (docId_f2 != "") fomrCollection.Add(new FileColectionToUpload { FileName = "docId_f[]", FilePath = docId_f2, ContentType = @"image/jpeg" });

            string docId_f3 = APICommon.CheckStrIsNullorEmpty(ds.Tables["AtthmtDtl"].Rows[4]["Path"].ToString());
            docId_f3 = APICommon.ReadImagePath(docId_f3);
            if (docId_f3 != "") fomrCollection.Add(new FileColectionToUpload { FileName = "docId_f[]", FilePath = docId_f3, ContentType = @"image/jpeg" });

            string docId_f4 = APICommon.CheckStrIsNullorEmpty(ds.Tables["AtthmtDtl"].Rows[5]["Path"].ToString());
            docId_f4 = APICommon.ReadImagePath(docId_f4);
            if (docId_f4 != "") fomrCollection.Add(new FileColectionToUpload { FileName = "docId_f[]", FilePath = docId_f4, ContentType = @"image/jpeg" });


            //NameValueCollection nvc = APICommon.ConvertObjectToNameValueCollection(objRC);
            //List<FileColectionToUpload> fomrCollection = new List<FileColectionToUpload>();
            //fomrCollection.Add(new FileColectionToUpload { FileName = "applPhoto_f", FilePath = @"E:\Project\Code\CitizenPortal\citizenportal\CitizenPortal\QuickLinks\ravimaurya\DocUploads\ProfilePic.jpg", ContentType = @"image/jpeg" });
            //fomrCollection.Add(new FileColectionToUpload { FileName = "applsign_f", FilePath = @"E:\Project\Code\CitizenPortal\citizenportal\CitizenPortal\QuickLinks\ravimaurya\DocUploads\Signature.jpg", ContentType = @"image/jpeg" });
            //fomrCollection.Add(new FileColectionToUpload { FileName = "docId_f[]", FilePath = @"E:\Project\Code\CitizenPortal\citizenportal\CitizenPortal\QuickLinks\ravimaurya\DocUploads\Affidevit.jpg", ContentType = @"image/jpeg" });
            //fomrCollection.Add(new FileColectionToUpload { FileName = "docId_f[]", FilePath = @"E:\Project\Code\CitizenPortal\citizenportal\CitizenPortal\QuickLinks\ravimaurya\DocUploads\ResidenceProof.jpg", ContentType = @"image/jpeg" });
            //fomrCollection.Add(new FileColectionToUpload { FileName = "docId_f[]", FilePath = @"E:\Project\Code\CitizenPortal\citizenportal\CitizenPortal\QuickLinks\ravimaurya\DocUploads\test.jpg", ContentType = @"image/jpeg" });
            //fomrCollection.Add(new FileColectionToUpload { FileName = "docId_f[]", FilePath = @"E:\Project\Code\CitizenPortal\citizenportal\CitizenPortal\QuickLinks\ravimaurya\DocUploads\copy.jpg", ContentType = @"image/jpeg" });


            #endregion

            // Convert Form Collection into Json
            string reqFormCollection = JsonConvert.SerializeObject(fomrCollection);

            // Log Residence Enrollment Request
            bool res = residenceBAL.LogResidenceAPIRequest(m_AppID, m_ServiceID, reqJsonString, reqFormCollection, m_AppID);
            if (!res) throw new Exception("Error in Log Citigen API for AppID - " + m_AppID + " and ServiceID - " + m_ServiceID);
            if (res)
            {
                //Call API
                string result = APICommon.HttpUploadFile(EdistrictAPI + "CAP_ServicesAPI.php", fomrCollection.ToArray<FileColectionToUpload>(), nvc);
                JavaScriptSerializer oJS = new JavaScriptSerializer();
                oRootObject = new TestCitizenResult();
                oRootObject = oJS.Deserialize<TestCitizenResult>(result);
                //string resiRes = JsonConvert.SerializeObject(oRootObject);

                if (oRootObject != null)
                {
                    foreach (CitizenResult CR in oRootObject.Result)
                    {
                        citizenResult.Status = CR.Status;
                        citizenResult.Msg = CR.Msg;
                        citizenResult.UAI = CR.UAI;
                        citizenResult.UAN = CR.UAN;
                        citizenResult.EID = CR.EID;
                        citizenResult.ApplicationId = CR.ApplicationId;
                        citizenResult.ApplicationStatus = CR.ApplicationStatus;

                        // Log Residence Enrollment Responce
                        string respncJsonString = JsonConvert.SerializeObject(oRootObject);
                        bool respocnc = residenceBAL.LogResidenceAPIResponse(citizenResult, m_AppID, m_ServiceID, respncJsonString);
                        if (!respocnc) throw new Exception("Error in Inserting Log Citigen API Responce for AppID - " + m_AppID + " and ServiceID - " + m_ServiceID);
                    }
                }
                else
                {
                    throw new Exception("Getting null result from Residence Service API for AppID - " + m_AppID + " and ServiceID - " + m_ServiceID);
                }
            }
            return citizenResult;
            #endregion
        }
    }


    public class CCTNS_APIScheduler
    {
        public static void Start()
        {
            IScheduler scheduler = StdSchedulerFactory.GetDefaultScheduler();
            scheduler.Start();

            IJobDetail job = JobBuilder.Create<CCTNS_JOB>().Build();

            ITrigger trigger = TriggerBuilder.Create()
                .WithDailyTimeIntervalSchedule
                  (s =>
                    //s.WithIntervalInHours(1)
                    s.WithIntervalInSeconds(600)
                    .OnEveryDay()
                    .StartingDailyAt(TimeOfDay.HourAndMinuteOfDay(23, 0))
                    .EndingDailyAt(TimeOfDay.HourAndMinuteOfDay(23, 59))
                  )
                .Build();

            scheduler.ScheduleJob(job, trigger);
        }
    }




}