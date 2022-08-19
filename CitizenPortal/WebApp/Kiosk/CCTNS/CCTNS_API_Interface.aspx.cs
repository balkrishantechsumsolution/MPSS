using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Web.Script.Serialization;

namespace CitizenPortal.WebApp.Kiosk.CCTNS
{
    public partial class CCTNS_API_Interface : System.Web.UI.Page
    {
        string m_AppID = "", m_ServiceID = "";
        TestCitizenResult oRootObject = null;
        ResidenceBAL residenceBAL = null;
        ResidenceCertificate_DT objRC = null;
        string QuickLinksDirectory = System.Configuration.ConfigurationManager.AppSettings["QuickLinksDirectory"];
        string EdistrictAPI = System.Configuration.ConfigurationManager.AppSettings["EdistrictAPI"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            if (!IsPostBack)
            {
                if (m_ServiceID == "431")
                {
                    residenceBAL = new ResidenceBAL();
                    try
                    {
                        DataTable ResEnrRes = residenceBAL.ResidenceEnrollResponceGet(m_AppID, m_ServiceID, false);
                        DataTable resiAPIRes = residenceBAL.ResidenceAPIResponceGet(m_AppID, m_ServiceID, false);
                        // CASE 2 - BOTH FAILED
                        //          when enrollment and certificate both has not applyyied.
                        //         *** Call API for Enrollment and Cerificate  ***                       
                        if (!(ResEnrRes != null && ResEnrRes.Rows.Count > 0))
                        {
                            DataSet ds = residenceBAL.GettResidenceDtl(m_ServiceID, m_AppID);
                            if (ds.Tables.Count > 0 && ds.Tables["CertDtl"].Rows.Count > 0)
                            {
                                DataTable dtl = ds.Tables["CertDtl"];
                                CitizenEnrollment_DT CE = new CitizenEnrollment_DT(dtl);
                                // Call API to Register Citizen
                                CitizenResult citizenResult = RegisterCitizenAPI(CE);
                                // If Responce get successed.
                                // Call API to Residence Certificate
                                if (citizenResult.Status.ToUpper() == "SUCCESS")
                                {
                                    CitizenResult residenceResponce = ResidenceAPI(citizenResult.EID, ds);
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
                        Response.Redirect("/WebApp/Kiosk/CCTNS/ResidncCertificateAck.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID, false);
                    }
                }
            }
        }

        private CitizenResult RegisterCitizenAPI(CitizenEnrollment_DT ce)
        {
            CitizenResult cr = new CitizenResult();
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

                if (oRootObject != null)
                {
                    foreach (CitizenResult fcr in oRootObject.Result)
                    {
                        cr.Status = fcr.Status;
                        cr.Msg = fcr.Msg;
                        cr.UAI = fcr.UAI;
                        cr.UAN = fcr.UAN;
                        cr.EID = fcr.EID;
                        cr.ApplicationId = fcr.ApplicationId;
                        cr.ApplicationStatus = fcr.ApplicationStatus;
                        cr.DocumentURL = fcr.DocumentURL;
                        cr.CreatedBy = m_AppID;

                        // Log Residence Enrollment Responce
                        string respncJsonString = JsonConvert.SerializeObject(oRootObject);
                        bool respocnc = residenceBAL.LogResidenceEnrollResponse(cr, m_AppID, m_ServiceID, respncJsonString);
                        if (!respocnc) throw new Exception("Error in Inserting LogCitigenEnroll Responce for AppID - " + m_AppID + " and ServiceID - " + m_ServiceID);
                    }
                }
                else
                {
                    throw new Exception("Getting null result from Citizen Registration API for AppID - " + m_AppID + " and ServiceID - " + m_ServiceID);
                }
            }
            return cr;
        }

        private CitizenResult ResidenceAPI(string eid, DataSet ds)
        {
            #region Residence Cerificate Service API call section

            CitizenResult cr = new CitizenResult();

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

                if (oRootObject != null)
                {
                    foreach (CitizenResult fcr in oRootObject.Result)
                    {
                        cr.Status = fcr.Status;
                        cr.Msg = fcr.Msg;
                        cr.UAI = fcr.UAI;
                        cr.UAN = fcr.UAN;
                        cr.EID = fcr.EID;
                        cr.ApplicationId = fcr.ApplicationId;
                        cr.ApplicationStatus = fcr.ApplicationStatus;

                        // Log Residence Enrollment Responce
                        string respncJsonString = JsonConvert.SerializeObject(oRootObject);
                        bool respocnc = residenceBAL.LogResidenceAPIResponse(cr, m_AppID, m_ServiceID, respncJsonString);
                        if (!respocnc) throw new Exception("Error in Inserting Log Citigen API Responce for AppID - " + m_AppID + " and ServiceID - " + m_ServiceID);
                    }
                }
                else
                {
                    throw new Exception("Getting null result from Residence Service API for AppID - " + m_AppID + " and ServiceID - " + m_ServiceID);
                }
            }
            return cr;
            #endregion
        }

    }
}