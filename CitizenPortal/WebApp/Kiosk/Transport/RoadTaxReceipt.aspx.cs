using CitizenPortalLib;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Net;
using System.Text;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;

namespace CitizenPortal.WebApp.Kiosk.Transport
{
    public partial class RoadTaxReceipt : BasePage
    {
        private RoadTaxBLL m_RoadTaxBLL = new RoadTaxBLL();
        private string m_AppID, m_ServiceID;

        public class OwnerDetails
        {
            public string regn_no { get; set; }
            public string off_cd { get; set; }
            public string state_cd { get; set; }
            public string off_name { get; set; }
            public string state_name { get; set; }
            public string op_dt { get; set; }
            public string ac_fitted { get; set; }
            public string annual_income { get; set; }
            public string audio_fitted { get; set; }
            public string body_type { get; set; }
            public string c_add1 { get; set; }
            public string c_add2 { get; set; }
            public string c_add3 { get; set; }
            public string c_district { get; set; }
            public string c_pincode { get; set; }
            public string c_state { get; set; }
            public string chasi_no { get; set; }
            public string color { get; set; }
            public string cubic_cap { get; set; }
            public string dealer_cd { get; set; }
            public string eng_no { get; set; }
            public string f_name { get; set; }
            public string fit_upto { get; set; }
            public string floor_area { get; set; }
            public string fuel { get; set; }
            public string garage_add { get; set; }
            public string gcw { get; set; }
            public string height { get; set; }
            public string imported_vch { get; set; }
            public string laser_code { get; set; }
            public string ld_wt { get; set; }
            public string maker { get; set; }
            public string manu_mon { get; set; }
            public string manu_yr { get; set; }
            public string no_cyl { get; set; }
            public string norms { get; set; }
            public string other_criteria { get; set; }
            public string owner_cd { get; set; }
            public string owner_name { get; set; }
            public string owner_sr { get; set; }
            public string p_add1 { get; set; }
            public string p_add2 { get; set; }
            public string p_add3 { get; set; }
            public string p_district { get; set; }
            public string p_pincode { get; set; }
            public string p_state { get; set; }
            public string purchase_dt { get; set; }
            public string regn_dt { get; set; }
            public string regn_type { get; set; }
            public string regn_upto { get; set; }
            public string seat_cap { get; set; }
            public string sleeper_cap { get; set; }
            public string stand_cap { get; set; }
            public string tax_mode { get; set; }
            public string unld_wt { get; set; }
            public string vch_catg { get; set; }
            public string vch_purchase_as { get; set; }
            public string vh_class { get; set; }
            public string video_fitted { get; set; }
            public string wheelbase { get; set; }
            public string width { get; set; }
            public string sale_amt { get; set; }
            public string hp { get; set; }
            public string fit_upto_desc { get; set; }
            public string vch_catg_desc { get; set; }
            public string c_district_name { get; set; }
            public string c_state_name { get; set; }
            public string p_district_name { get; set; }
            public string p_state_name { get; set; }
            public string vh_class_desc { get; set; }
            public string maker_name { get; set; }
            public string model_cd { get; set; }
            public string model_name { get; set; }
            public string fuel_descr { get; set; }
            public string norms_descr { get; set; }
            public string dlr_name { get; set; }
            public string dlr_add1 { get; set; }
            public string dlr_add2 { get; set; }
            public string dlr_add3 { get; set; }
            public string dlr_city { get; set; }
            public string dlr_district { get; set; }
            public string dlr_pincode { get; set; }
            public string vehType { get; set; }
            public string regn_type_descr { get; set; }
            public string owner_cd_descr { get; set; }
            public string vch_purchase_asCode { get; set; }
            public string permit_rto_cd { get; set; }
            public string chasi_no_original { get; set; }
            public string transport_catg { get; set; }
            public string regn_dtAsDate { get; set; }
            public string regn_uptoAsDate { get; set; }
            public string vehTypeAsInt { get; set; }
            public string length { get; set; }
            public string status { get; set; }
        }

        public class PrntRecieptSubList
        {
            public object empName { get; set; }
            public string amount { get; set; }
            public string purpose { get; set; }
            public string penalty { get; set; }
            public string dateFrom { get; set; }
            public string dateUpto { get; set; }
            public object surcharge { get; set; }
            public int purCD { get; set; }
            public int total { get; set; }
        }

        public class CashDobj
        {
            public string applNo { get; set; }
            public string regnNo { get; set; }
            public string ownerName { get; set; }
            public string empName { get; set; }
            public string chasino { get; set; }
            public object rcptNo { get; set; }
            public object dOCartRecieptsList { get; set; }
            public string offname { get; set; }
            public int grandTotal { get; set; }
            public string grandTotalInWords { get; set; }
            public List<PrntRecieptSubList> prntRecieptSubList { get; set; }
            public string receiptNo { get; set; }
            public object dealerName { get; set; }
            public string vhClass { get; set; }
            public object srNo { get; set; }
            public object permitFrom { get; set; }
            public object permitUpto { get; set; }
            public int saleAmt { get; set; }
            public string bankRefNo { get; set; }
            public object vhCatg { get; set; }
            public string transactionId { get; set; }
            public string financerName { get; set; }
            public string receiptDate { get; set; }
            public object bankCode { get; set; }
            public object email { get; set; }
            public object cart_name { get; set; }
            public string stateName { get; set; }
            public string header { get; set; }
            public object userName { get; set; }
        }

        public class RoadTaxFinalResponse
        {
            public string regn_no { get; set; }
            public object tax_mode { get; set; }
            public OwnerDetails ownerDetails { get; set; }
            public int total_amount { get; set; }
            public object bank_ref_no { get; set; }
            public string trans_id { get; set; }
            public string permanent_recp_no { get; set; }
            public object iSure_Id { get; set; }
            public object unqiue_request_no { get; set; }
            public CashDobj cashDobj { get; set; }
            public string rcpt_date { get; set; }
            public object logo_url { get; set; }
            public string message { get; set; }
            public string reason { get; set; }
            public int status { get; set; }
        }

        public class ListTaxDobj
        {
            public int pur_cd { get; set; }
            public string taxhead { get; set; }
            public string taxMode { get; set; }
            public string finalTaxFrom { get; set; }
            public string finalTaxUpto { get; set; }
            public double vtTaxFinalTax { get; set; }
            public double vtTaxFinalFine { get; set; }
            public double totalPaybaleTax { get; set; }
            public double totalPaybalePenalty { get; set; }
            public double totalPaybaleSurcharge { get; set; }
            public double totalPaybaleRebate { get; set; }
            public double totalPaybaleInterest { get; set; }
            public double totalPaybaleTax1 { get; set; }
            public double totalPaybaleTax2 { get; set; }
            public double totalAmount { get; set; }
        }

        public class TaxResponseObject
        {
            public string regn_no { get; set; }
            public string tax_mode { get; set; }
            public int period { get; set; }
            public int amount { get; set; }
            public string trans_id { get; set; }
            public string rcpt_dt { get; set; }
            public string pay_mode { get; set; }
            public List<ListTaxDobj> listTaxDobj { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet ds = m_RoadTaxBLL.GetRoadTaxFormData(m_ServiceID, m_AppID);
            DataTable dtTaxApp = ds.Tables[0];
            DataTable dtTaxCalc = ds.Tables[1];
            DataTable dtTransDetail = ds.Tables[2];
            DataTable dtTrackStatusDetail = ds.Tables[3];
            DataTable dtPaymentDetails = ds.Tables[4];
            DataTable dtRoadTaxFinalDetail = ds.Tables[5];


            if (ds.Tables.Count > 0)
            {
                if (dtTaxApp.Rows[0]["PaymentStatus"].ToString() == "Paid")
                {
                    if (ds.Tables[3].Rows[0]["PayFlag"].ToString() == "Y")
                    {
                        if(ds.Tables[5].Rows.Count <= 0)
                        {
                            SubmitRoadTaxData(ds);
                        }
                    }
                }
            }
            else
            {
                string m_Message = "Sorry! Payment for Reference No. " + m_AppID + " not initiated. Please make the payment against the Reference ID.";
                //lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);
            }

            if (dtTaxApp.Rows.Count != 0)
            {
                lblVehicleClass.Text = dtTaxApp.Rows[0]["VehicleClass"].ToString();
                lblOwnerName.Text = dtTaxApp.Rows[0]["OwnerName"].ToString();
                lblVehicleNo.Text = dtTaxApp.Rows[0]["VehicleNo"].ToString();
                lblChasisNo.Text = dtTaxApp.Rows[0]["ChassisNumber"].ToString();

                if (dtTransDetail.Rows.Count != 0)
                {
                    lblAppID.Text = dtTransDetail.Rows[0]["AppID"].ToString();
                    lblPayDate.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["Trans_Date"].ToString()).ToString("dd/MM/yyyy");
                }

                if (dtTaxCalc.Rows.Count != 0)
                {
                    lblAppID.Text = dtTaxCalc.Rows[0]["TransactionReceipt"].ToString();
                    lblTaxType.Text = dtTaxCalc.Rows[0]["TaxHead"].ToString();
                    lblDuration.Text = dtTaxCalc.Rows[0]["Duration"].ToString();
                    lblParkingFrom.Text = Convert.ToDateTime(dtTaxCalc.Rows[0]["CurTaxFrom"].ToString()).ToString("dd-MMM-yyyy") + " To " + Convert.ToDateTime(dtTaxCalc.Rows[0]["CurTaxUpTo"].ToString()).ToString("dd-MMM-yyyy");
                    lblamount1.Text = dtTaxCalc.Rows[0]["CurTotalTaxAmount"].ToString();
                    lblPenality1.Text = dtTaxCalc.Rows[0]["CurTaxPenalty"].ToString();
                    lblTotal1.Text = dtTaxCalc.Rows[0]["CurTotalTaxAmount"].ToString();

                    if (dtTaxCalc.Rows[0]["AddCurTaxHead"].ToString() == "Additional MV Tax")
                    {
                        TrAddMvTax.Visible = true;
                        lblAddTaxType.Text = dtTaxCalc.Rows[0]["AddCurTaxHead"].ToString();
                        lblAddDuration.Text = dtTaxCalc.Rows[0]["Duration"].ToString();
                        lblAddParkingFrom.Text= Convert.ToDateTime(dtTaxCalc.Rows[0]["CurTaxFrom"].ToString()).ToString("dd-MMM-yyyy") + " To " + Convert.ToDateTime(dtTaxCalc.Rows[0]["CurTaxUpTo"].ToString()).ToString("dd-MMM-yyyy");
                        lblAddAmount1.Text = dtTaxCalc.Rows[0]["AddCurTaxAmount"].ToString();
                        lblAddPenality1.Text = dtTaxCalc.Rows[0]["AddCurTaxPenalty"].ToString();
                        lblAddTotal1.Text = dtTaxCalc.Rows[0]["AddCurTotalTaxAmount"].ToString();
                    }
                    else
                    {
                        TrAddMvTax.Visible = false;
                    }

                    lblGrandTotal.Text = dtTaxCalc.Rows[0]["FinalTaxPaymentAmount"].ToString();
                    NumberToEnglish num = new NumberToEnglish();
                    AmtWords.Text = num.changeNumericToWords(lblGrandTotal.Text) + "Only";

                    //lblAddTaxType.Text = dtTaxCalc.Rows[0]["AddCurTaxHead"].ToString();
                    //lblDurationfrom.Text= dtTaxCalc.Rows[0]["Duration"].ToString();
                    //lblParkingTo.Text = Convert.ToDateTime(dtTaxCalc.Rows[0]["CurTaxFrom"].ToString()).ToString("dd-MMM-yyyy") + " To " + Convert.ToDateTime(dtTaxCalc.Rows[0]["CurTaxUpTo"].ToString()).ToString("dd-MMM-yyyy");
                    //lblamount2.Text = dtTaxCalc.Rows[0]["CurTaxAmount"].ToString();
                    //lblPenality2.Text = dtTaxCalc.Rows[0]["CurTaxPenalty"].ToString();
                    //lblTotal2.Text = dtTaxCalc.Rows[0]["CurTaxAmount"].ToString();
                }

                try
                {
                    QRCode.GenerateQRCodeApplication(m_ServiceID, m_AppID);
                }
                catch { }
            }
        }

        public static T ToObjectFromJSON<T>(string jsonString)
        {
            var serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(typeof(T));
            var memoryStream = new System.IO.MemoryStream(System.Text.Encoding.Unicode.GetBytes(jsonString));
            var newObject = (T)serializer.ReadObject(memoryStream);
            memoryStream.Close();
            return newObject;
        }

        private static T CallRestJsonService<T>(string uri, object requestBodyObject, string method = "POST", string username = "", string password = "")
        {
            var javaScriptSerializer = new JavaScriptSerializer();
            javaScriptSerializer.MaxJsonLength = 104857600; //200 MB unicode
            var request = (HttpWebRequest)WebRequest.Create(uri);
            request.Method = method;
            request.Accept = "application/json";
            request.ContentType = "application/json; charset=utf-8";

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

            var streamReader = new System.IO.StreamReader(response.GetResponseStream());
            var responseContent = streamReader.ReadToEnd().Trim();
            var jsonObject = javaScriptSerializer.Deserialize<T>(responseContent);
            return jsonObject;
        }

        [WebMethod]
        public static string SubmitRoadTaxData(DataSet ds)
        {
            Random RNG = new Random();
            var builder = new StringBuilder();
            while (builder.Length < 16)
            {
                builder.Append(RNG.Next(10).ToString());
            }
            var rndnumber = builder.ToString();

            TaxResponseObject objTaxResponseObject = new TaxResponseObject();

            objTaxResponseObject.regn_no = ds.Tables[0].Rows[0]["VehicleNo"].ToString();
            objTaxResponseObject.pay_mode = ds.Tables[1].Rows[0]["TaxMode"].ToString();
            objTaxResponseObject.period = Convert.ToInt32(ds.Tables[1].Rows[0]["TaxValue"].ToString());
            objTaxResponseObject.amount = Convert.ToInt32(ds.Tables[0].Rows[0]["PrevTaxAmount"].ToString());
            objTaxResponseObject.trans_id = rndnumber;
            objTaxResponseObject.rcpt_dt = Convert.ToDateTime(ds.Tables[1].Rows[0]["CreatedOn"]).ToString("dd-MM-yyyy");
            objTaxResponseObject.tax_mode = ds.Tables[1].Rows[0]["TaxMode"].ToString();

            ListTaxDobj objRequestApiParam = new ListTaxDobj();

            objRequestApiParam.pur_cd = 58;
            objRequestApiParam.taxhead = ds.Tables[1].Rows[0]["TaxHead"].ToString();
            objRequestApiParam.taxMode = ds.Tables[1].Rows[0]["TaxMode"].ToString();
            objRequestApiParam.finalTaxFrom = ds.Tables[1].Rows[0]["CurTaxFrom"].ToString();
            objRequestApiParam.finalTaxUpto = ds.Tables[1].Rows[0]["CurTaxUpTo"].ToString();
            objRequestApiParam.vtTaxFinalTax = Convert.ToDouble(ds.Tables[1].Rows[0]["CurTotalTaxAmount"].ToString());
            objRequestApiParam.vtTaxFinalFine = Convert.ToDouble(ds.Tables[1].Rows[0]["CurTaxPenalty"].ToString());
            objRequestApiParam.totalPaybaleTax = Convert.ToDouble(ds.Tables[1].Rows[0]["CurTaxAmount"].ToString());
            objRequestApiParam.totalPaybalePenalty = Convert.ToDouble(ds.Tables[1].Rows[0]["CurTaxPenalty"].ToString());
            objRequestApiParam.totalPaybaleSurcharge = Convert.ToDouble(ds.Tables[1].Rows[0]["CurTaxSurcharge"].ToString());
            objRequestApiParam.totalPaybaleRebate = Convert.ToDouble(ds.Tables[1].Rows[0]["CurTaxSurcharge"].ToString());
            objRequestApiParam.totalPaybaleInterest = Convert.ToDouble(ds.Tables[1].Rows[0]["CurTaxInterest"].ToString());
            objRequestApiParam.totalPaybaleTax1 = Convert.ToDouble(ds.Tables[1].Rows[0]["CurTaxAmount1"].ToString());
            objRequestApiParam.totalPaybaleTax2 = Convert.ToDouble(ds.Tables[1].Rows[0]["CurTaxAmount2"].ToString());
            objRequestApiParam.totalAmount = Convert.ToDouble(ds.Tables[1].Rows[0]["CurTotalTaxAmount"].ToString());

            ListTaxDobj objRequestApiParam1 = new ListTaxDobj();

            if (ds.Tables[1].Rows[0]["AddCurTaxHead"].ToString() == "Additional MV Tax")
            {
                objRequestApiParam1.pur_cd = 59;
                objRequestApiParam1.taxhead = ds.Tables[1].Rows[0]["AddCurTaxHead"].ToString();
                objRequestApiParam1.taxMode = ds.Tables[1].Rows[0]["AddCurTaxMode"].ToString();
                objRequestApiParam1.finalTaxFrom = ds.Tables[1].Rows[0]["AddCurTaxFrom"].ToString();
                objRequestApiParam1.finalTaxUpto = ds.Tables[1].Rows[0]["AddCurTaxUpTo"].ToString();
                objRequestApiParam1.vtTaxFinalTax = Convert.ToDouble(ds.Tables[1].Rows[0]["AddCurTotalTaxAmount"].ToString());
                objRequestApiParam1.vtTaxFinalFine = Convert.ToDouble(ds.Tables[1].Rows[0]["AddCurTaxPenalty"].ToString());
                objRequestApiParam1.totalPaybaleTax = Convert.ToDouble(ds.Tables[1].Rows[0]["AddCurTaxAmount"].ToString());
                objRequestApiParam1.totalPaybalePenalty = Convert.ToDouble(ds.Tables[1].Rows[0]["AddCurTaxPenalty"].ToString());
                objRequestApiParam1.totalPaybaleSurcharge = Convert.ToDouble(ds.Tables[1].Rows[0]["AddCurTaxSurcharge"].ToString());
                objRequestApiParam1.totalPaybaleRebate = Convert.ToDouble(ds.Tables[1].Rows[0]["AddCurTaxSurcharge"].ToString());
                objRequestApiParam1.totalPaybaleInterest = Convert.ToDouble(ds.Tables[1].Rows[0]["AddCurTaxInterest"].ToString());
                objRequestApiParam1.totalPaybaleTax1 = Convert.ToDouble(ds.Tables[1].Rows[0]["AddCurTaxAmount1"].ToString());
                objRequestApiParam1.totalPaybaleTax2 = Convert.ToDouble(ds.Tables[1].Rows[0]["AddCurTaxAmount2"].ToString());
                objRequestApiParam1.totalAmount = Convert.ToDouble(ds.Tables[1].Rows[0]["AddCurTotalTaxAmount"].ToString());
            }

            objTaxResponseObject.listTaxDobj = new List<ListTaxDobj>();
            objTaxResponseObject.listTaxDobj.Add(objRequestApiParam);

            if (ds.Tables[1].Rows[0]["AddCurTaxHead"].ToString() == "Additional MV Tax")
            {
                objTaxResponseObject.listTaxDobj.Add(objRequestApiParam1);
            }

            var result = CallRestJsonService<RoadTaxFinalResponse>("http://164.100.78.110/mobileservices/api/lokseba/submit-tax", objTaxResponseObject, "POST", "myusername", "mypassword");

            List<RoadTaxFinalResponse> objRoadTaxFinalResponse = new List<RoadTaxFinalResponse>();
            objRoadTaxFinalResponse.Add(result);
            JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
            var RoadTaxFinalResponseJsonData =  jsSerializer.Serialize(objRoadTaxFinalResponse);

            RoadTaxFinal_DT objmodel = new RoadTaxFinal_DT();

            objmodel.ServiceID = ds.Tables[0].Rows[0]["ServiceID"].ToString();
            objmodel.ProfileID = ds.Tables[3].Rows[0]["ProfileID"].ToString();
            objmodel.AppID = ds.Tables[0].Rows[0]["AppID"].ToString();
            objmodel.VehicleNo = ds.Tables[0].Rows[0]["VehicleNo"].ToString();
            objmodel.MobileNo = ds.Tables[0].Rows[0]["MobileNo"].ToString();
            objmodel.OwnerName = ds.Tables[0].Rows[0]["OwnerName"].ToString();
            objmodel.FinalTotalAmount = ds.Tables[1].Rows[0]["FinalTaxPaymentAmount"].ToString();
            objmodel.FinalRecptDate = Convert.ToDateTime(ds.Tables[1].Rows[0]["CreatedOn"]).ToString("dd-MM-yyyy");
            objmodel.FinalMessage = result.message;
            objmodel.FinalReason = result.reason;
            objmodel.FinalStatus = Convert.ToInt32(result.status).ToString();
            objmodel.PermanentRecpNo = result.permanent_recp_no;
            objmodel.RoadTaxFinalResponse = RoadTaxFinalResponseJsonData;
            objmodel.CreatedBy = ds.Tables[0].Rows[0]["CreatedBy"].ToString();
            objmodel.CreatedOn = ds.Tables[1].Rows[0]["CreatedOn"].ToString();
            objmodel.IsActive = "1";

            RoadTaxReceipt obj = new RoadTaxReceipt();
            obj.InsertRoadTaxFinalData(objmodel);

            return RoadTaxFinalResponseJsonData;
        }

        public void InsertRoadTaxFinalData(RoadTaxFinal_DT objmodel)
        {
            string[] AFields = {
            "ServiceID"
            ,"ProfileID"
            ,"AppID"
            ,"VehicleNo"
            ,"MobileNo"
            ,"OwnerName"
            ,"FinalTotalAmount"
            ,"FinalRecptDate"
            ,"FinalMessage"
            ,"FinalReason"
            ,"FinalStatus"
            ,"PermanentRecpNo"
            ,"RoadTaxFinalResponse"
            ,"CreatedBy"
            ,"CreatedOn"
            ,"IsActive"
        };
           
            m_RoadTaxBLL.InsertRoadTaxFinalData(objmodel, AFields);
        }

        public static string NumberToWords(int number)
        {
            if (number == 0)
                return "zero";

            if (number < 0)
                return "minus " + NumberToWords(Math.Abs(number));

            string words = "";

            if ((number / 1000000) > 0)
            {
                words += NumberToWords(number / 1000000) + " million ";
                number %= 1000000;
            }

            if ((number / 1000) > 0)
            {
                words += NumberToWords(number / 1000) + " thousand ";
                number %= 1000;
            }

            if ((number / 100) > 0)
            {
                words += NumberToWords(number / 100) + " hundred ";
                number %= 100;
            }

            if (number > 0)
            {
                if (words != "")
                    words += "and ";

                var unitsMap = new[] { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen" };
                var tensMap = new[] { "zero", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety" };

                if (number < 20)
                    words += unitsMap[number];
                else
                {
                    words += tensMap[number / 10];
                    if ((number % 10) > 0)
                        words += "-" + unitsMap[number % 10];
                }
            }

            return words;
        }
        
    }
}