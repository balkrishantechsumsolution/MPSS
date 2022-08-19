using CitizenPortalLib;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.ServiceModel;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;

namespace CitizenPortal.WebApp.Kiosk.Transport
{
    public partial class RoadTax : BasePage
    {
        private static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();

        public interface IService1Channel : IAddressService, IClientChannel{}

        public class LatestTaxDtls
        {
            public int amount { get; set; }
            public int fine { get; set; }
            public string receipt_date { get; set; }
            public string tax_upto { get; set; }
        }

        public class OwnerDetails
        {
            public string ac_fitted { get; set; }
            public int annual_income { get; set; }
            public string audio_fitted { get; set; }
            public string body_type { get; set; }
            public string c_add1 { get; set; }
            public string c_add2 { get; set; }
            public string c_add3 { get; set; }
            public int c_district { get; set; }
            public string c_district_name { get; set; }
            public int c_pincode { get; set; }
            public string c_state { get; set; }
            public string c_state_name { get; set; }
            public string chasi_no { get; set; }
            public string chasi_no_original { get; set; }
            public string color { get; set; }
            public double cubic_cap { get; set; }
            public string dealer_cd { get; set; }
            public string dlr_add1 { get; set; }
            public string dlr_add2 { get; set; }
            public string dlr_add3 { get; set; }
            public string dlr_city { get; set; }
            public string dlr_district { get; set; }
            public string dlr_name { get; set; }
            public string dlr_pincode { get; set; }
            public string eng_no { get; set; }
            public string f_name { get; set; }
            public string fit_upto { get; set; }
            public string fit_upto_desc { get; set; }
            public double floor_area { get; set; }
            public int fuel { get; set; }
            public string fuel_descr { get; set; }
            public string garage_add { get; set; }
            public int gcw { get; set; }
            public int height { get; set; }
            public double hp { get; set; }
            public string imported_vch { get; set; }
            public string laser_code { get; set; }
            public int ld_wt { get; set; }
            public int length { get; set; }
            public int maker { get; set; }
            public string maker_name { get; set; }
            public int manu_mon { get; set; }
            public int manu_yr { get; set; }
            public string model_cd { get; set; }
            public string model_name { get; set; }
            public int no_cyl { get; set; }
            public int norms { get; set; }
            public string norms_descr { get; set; }
            public int off_cd { get; set; }
            public string off_name { get; set; }
            public string op_dt { get; set; }
            public int other_criteria { get; set; }
            public int owner_cd { get; set; }
            public string owner_cd_descr { get; set; }
            public string owner_name { get; set; }
            public int owner_sr { get; set; }
            public string p_add1 { get; set; }
            public string p_add2 { get; set; }
            public string p_add3 { get; set; }
            public int p_district { get; set; }
            public string p_district_name { get; set; }
            public int p_pincode { get; set; }
            public string p_state { get; set; }
            public string p_state_name { get; set; }
            public int permit_rto_cd { get; set; }
            public string purchase_dt { get; set; }
            public string regn_dt { get; set; }
            public string regn_dtAsDate { get; set; }
            public string regn_no { get; set; }
            public string regn_type { get; set; }
            public string regn_type_descr { get; set; }
            public string regn_upto { get; set; }
            public string regn_uptoAsDate { get; set; }
            public int sale_amt { get; set; }
            public int seat_cap { get; set; }
            public int sleeper_cap { get; set; }
            public int stand_cap { get; set; }
            public string state_cd { get; set; }
            public string state_name { get; set; }
            public string status { get; set; }
            public object tax_mode { get; set; }
            public string transport_catg { get; set; }
            public int unld_wt { get; set; }
            public string vch_catg { get; set; }
            public string vch_catg_desc { get; set; }
            public string vch_purchase_as { get; set; }
            public string vch_purchase_asCode { get; set; }
            public string vehType { get; set; }
            public int vehTypeAsInt { get; set; }
            public int vh_class { get; set; }
            public string vh_class_desc { get; set; }
            public string video_fitted { get; set; }
            public int wheelbase { get; set; }
            public int width { get; set; }
        }

        public class RoadTaxObject
        {
            public LatestTaxDtls latestTaxDtls { get; set; }
            public string message { get; set; }
            public OwnerDetails ownerDetails { get; set; }
            public string reason { get; set; }
            public int status { get; set; }
            public string RoadTaxJsonData { set; get; }
        }

        public class TaxCalculation
        {
            public string regnNo { get; set; }
            public double totalAmount { get; set; }
            public string finalTaxFrom { get; set; }
            public string finalTaxUpto { get; set; }
            public double totalPaybaleTax1 { get; set; }
            public double totalPaybaleTax2 { get; set; }
            public string vehType { get; set; }
            public double vtTaxFinalTax { get; set; }
            public double vtTaxFinalFine { get; set; }
            public string doLatestTax { get; set; }
            public double finalTaxAmount { get; set; }
            public double totalPaybaleInterest { get; set; }
            public double totalPaybalePenalty { get; set; }
            public double totalPaybaleRebate { get; set; }
            public double totalPaybaleSurcharge { get; set; }
            public double totalPaybaleTax { get; set; }
            public string transId { get; set; }
            public string dtoName { get; set; }
            public string chassisNumber { get; set; }
            public string unique_request { get; set; }
            public string message { get; set; }
            public string owner { get; set; }
            public string reason { get; set; }
            public double status { get; set; }
            public string TaxCalculationJsonData { get; set; }
            public List<TaxDetails> listTaxDetails { get; set; }
            public List<TaxDetails> additionalTaxDetails { get; set; }
        }

        public class TaxDetails
        {
            public string tax_FROM { get; set; }
            public string tax_UPTO { get; set; }
            public string tax_HEAD { get; set; }
            public double amount { get; set; }
            public double amount1 { get; set; }
            public double amount2 { get; set; }
            public double surcharge { get; set; }
            public double interest { get; set; }
            public double rebate { get; set; }
            public double penalty { get; set; }
            public double fine { get; set; }
            public double pur_CD { get; set; }
            public string tax_upto_date { get; set; }
            public string tax_from_date { get; set; }
            public string tax_EXAM_UPTO { get; set; }
            public string tax_clear_upto { get; set; }
            public string tax_MODE { get; set; }
            public string receipt_no { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //string culture = "en-GB";

            //if (HFCurrentLang.Value == "")
            //{
            //    HFCurrentLang.Value = "1";
            //    btnLang.Value = "ଓଡ଼ିଆ";
            //}

            //if (HFCurrentLang.Value != "")
            //{
            //    if (HFCurrentLang.Value == "1")
            //    {
            //        culture = "en-GB";
            //        HFCurrentLang.Value = "1";
            //        btnLang.Value = "Odia";
            //    }
            //    else if (HFCurrentLang.Value == "2")
            //    {
            //        culture = "or-IN";
            //        HFCurrentLang.Value = "2";
            //        btnLang.Value = "English";
            //    }
            //}

            //Session["CurrentCultureLabels"] = culture;

            //var requestObject = new { regn_no = "DL1CCT0114" };
            //var result = CallRestJsonService<RoadTaxObject>("http://164.100.78.110/mobileservices/api/mParivahan/get-vehicle-details", requestObject, "POST", "myusername", "mypassword");
        }

        /// <summary>
        /// Call JSON/REST web service with basic authentication
        /// </summary>
        /// <typeparam name="T">The type to seserialize response to and return</typeparam>
        /// <param name="uri">Uri of the web service method</param>
        /// <param name="requestBodyObject">Object to serialize and pass to web service method</param>
        /// <param name="method">HTTP method/verb, "POST" or "GET"</param>
        /// <param name="username">Optional username if basic authentication is to be used</param>
        /// <param name="password">Optional password if basic authentication password is used</param>
        /// <returns></returns>
        /// 

        private static T CallRestJsonService<T>(string uri, object requestBodyObject, string method = "POST", string username = "", string password = "")
        {
            var javaScriptSerializer = new JavaScriptSerializer();
            javaScriptSerializer.MaxJsonLength = 104857600; //200 MB unicode
            var request = (HttpWebRequest)WebRequest.Create(uri);
            request.Method = method;
            request.Accept = "application/json";
            request.ContentType = "application/json; charset=utf-8";

            ////Add basic authentication header if username is supplied
            //if (!string.IsNullOrEmpty(username))
            //{
            //    request.Headers["Authorization"] = "Basic " + Convert.ToBase64String(Encoding.Default.GetBytes(username + ":" + password)); ;
            //}

            //Serialize request object as JSON and write to request body
            if (requestBodyObject != null)
            {
                var stringBuilder = new StringBuilder();
                javaScriptSerializer.Serialize(requestBodyObject, stringBuilder);
                var requestBody = stringBuilder.ToString();
                request.ContentLength = requestBody.Length;
                var streamWriter = new StreamWriter(request.GetRequestStream(), System.Text.Encoding.ASCII);
                streamWriter.Write(requestBody);
                streamWriter.Close();
            }

            var response = request.GetResponse();

            if (response == null)
            {
                return default(T);
            }

            //Read JSON response stream and deserialize
            var streamReader = new System.IO.StreamReader(response.GetResponseStream());
            var responseContent = streamReader.ReadToEnd().Trim();
            var jsonObject = javaScriptSerializer.Deserialize<T>(responseContent);
            return jsonObject;
        }

        private static List<Tuple<string, string>> GetSessionValues()
        {
            List<Tuple<string, string>> nvc = new List<Tuple<string, string>>();
            string culture = HttpContext.Current.Session["CurrentCulture"].ToString();
            string userType = HttpContext.Current.Session["UserType"].ToString();
            string ID = "";

            if (HttpContext.Current.Session["G2GID"] != null)
            {
                ID = HttpContext.Current.Session["G2GID"].ToString();
            }
            else if (HttpContext.Current.Session["KioskID"] != null)
            {
                ID = HttpContext.Current.Session["KioskID"].ToString();
            }
            else if (HttpContext.Current.Session["CitizenID"] != null)
            {
                ID = HttpContext.Current.Session["CitizenID"].ToString();
            }

            nvc.Add(new Tuple<string, string>("ID", ID));
            nvc.Add(new Tuple<string, string>("UserType", userType));
            nvc.Add(new Tuple<string, string>("CurrentCulture", culture));

            return nvc;
        }


        public static T ToObjectFromJSON<T>(string jsonString)
        {
            var serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(typeof(T));
            var memoryStream = new System.IO.MemoryStream(System.Text.Encoding.Unicode.GetBytes(jsonString));
            var newObject = (T)serializer.ReadObject(memoryStream);
            memoryStream.Close();
            return newObject;
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string InsertRoadTaxFormData(string prefix, string Data)
        {
            string noNewLines = Data.Replace("\n", "");
            RoadTaxForm_DT viewModel = ToObjectFromJSON<RoadTaxForm_DT>(noNewLines);

            string URL = "";
            URL = m_ServiceURL;

            string text;

            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.InsertRoadTaxFormData(viewModel);
                }
            }
            return text;
        }


        [WebMethod]
        public static List<RoadTaxObject> GetDLDetailAPI(string RegNo)
        {
            var requestObject = new { regn_no = RegNo };
            var result = CallRestJsonService<RoadTaxObject>("http://164.100.78.110/mobileservices/api/mParivahan/get-vehicle-details", requestObject, "POST", "myusername", "mypassword");
            List<RoadTaxObject> objRoadTaxObject = new List<RoadTaxObject>();
            var RoadTaxJson = ReturnRoadTaxJson(result);
            result.RoadTaxJsonData = RoadTaxJson;
            objRoadTaxObject.Add(result);
            return objRoadTaxObject;
        }


        [WebMethod]
        public static List<TaxCalculation> GetTaxCalcAPI(string RegNo, string TaxMode, string TaxPeriod)
        {
            var requestObject = new { regn_no = RegNo, tax_mode = TaxMode, period = TaxPeriod };
            var result = CallRestJsonService<TaxCalculation>("http://164.100.78.110/mobileservices/api/mParivahan/calculate-tax", requestObject, "POST", "myusername", "mypassword");
            List<TaxCalculation> objTaxCalculationObject = new List<TaxCalculation>();
            var TaxCalcJson = ReturnTaxCalculation(result);
            result.TaxCalculationJsonData = TaxCalcJson;
            objTaxCalculationObject.Add(result);
            return objTaxCalculationObject;
        }
        protected static string ReturnRoadTaxJson(RoadTaxObject result)
        {
            JavaScriptSerializer jsSerializer = new JavaScriptSerializer();

            return jsSerializer.Serialize(result);
        }

        protected static string ReturnTaxCalculation(TaxCalculation result)
        {
            JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
            return jsSerializer.Serialize(result);
        }
    }
}