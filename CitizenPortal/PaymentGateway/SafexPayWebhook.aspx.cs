using CitizenPortalLib.BLL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.PaymentGateway
{
    public partial class SafexPayWebhook : System.Web.UI.Page
    {
        ConfirmPaymentBLL m_ConfirmPaymentBLL = new ConfirmPaymentBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            //var JsonString = @"[{'publishId':'BK9 - 112121121001 - 291','meId':'202110140017','Data':{'AuthRR':[],'AuthVRR':[],'CaptureRR':[],'SaleRR':[],'RefundRI':[],'RequestSTPGoB':[],'ResponseRFPGoB':[],'VerificationRSTPGoB':[],'VerificationRRFPGoB':[],'NoRRFPGoB':[],'AuthRP':[],'AuthRF':[],'AuthVRP':[],'AuthVRF':[],'CaptureRP':[],'CaptureRF':[],'SaleRP':[{'agRef':'1062308649082552553','pgRef':'202132561663678','orderNo':'523054479AJ - 48','amount':'101.00','status':'16','txnDate':'2021 - 11 - 21'}],'SaleRF':[],'RefundRP':[],'RefundRF':[],'ReconciledWRGoB':[],'SettlementD':[],'ReconciledM':[],'MerchantPD':[],'CancelledBC':[],'Aborted':[],'HostTO':[],'AmountM':[]}}]";

            //    var Response = JsonConvert.DeserializeObject<List<Root>>(JsonString);

            if (Request.Params.Count > 0)
            {

                string m_LogFilePath = "";
                Log m_Log = new Log();

                string t_LogFileName = "Status_" + DateTime.Now.ToString("yyyy-MM-dd") + ".txt";
                string t_LogFilePath = "";

                t_LogFilePath = Path.Combine(Path.GetDirectoryName(System.Web.Hosting.HostingEnvironment.ApplicationPhysicalPath), "Logs", t_LogFileName);
                m_LogFilePath = t_LogFilePath;

                m_Log.FileName = m_LogFilePath;

                m_Log.WriteToLog(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));

                //m_Log.WriteToLog(Request.ContentType);
                //m_Log.WriteToLog(Request.ContentLength.ToString());
                //m_Log.WriteToLog(Request.Form.Count.ToString());
                //m_Log.WriteToLog(Request.Params.Count.ToString());
                //m_Log.WriteToLog(Request.Headers.Count.ToString());

                var jsonSerializer = new JavaScriptSerializer();

                var jsonString = string.Empty;

                Request.InputStream.Position = 0;
                using (var inputStream = new StreamReader(Request.InputStream))
                {
                    jsonString = inputStream.ReadToEnd();
                }

                m_Log.WriteToLog(jsonString);

                var data = new List<Root>();
                data = jsonSerializer.Deserialize<List<Root>>(jsonString);


                try
                {
                    if (data[0].Data.SaleRP.Count > 0)
                    {
                        m_Log.WriteToLog(data[0].Data.SaleRP[0].amount.ToString());
                        m_Log.WriteToLog(data[0].Data.SaleRP[0].orderNo.ToString());
                        string Amount = data[0].Data.SaleRP[0].amount.ToString();
                        string OrderNo = data[0].Data.SaleRP[0].orderNo.ToString();
                        string agRef = data[0].Data.SaleRP[0].agRef.ToString();

                        string pgRef = data[0].Data.SaleRP[0].pgRef.ToString();
                        string txnDate = data[0].Data.SaleRP[0].txnDate.ToString();
                        string AppID = "";
                        string reqStatus = data[0].Data.SaleRP[0].status.ToString();
                        string status = "";
                        m_Log.WriteToLog(data[0].Data.SaleRP[0].status.ToString());

                        if (reqStatus == "16")
                        {
                            //m_Log.WriteToLog(data[0].Data.SaleRP[0].status.ToString());
                            DataSet result = m_ConfirmPaymentBLL.InsertSafeXWebhookResponse(AppID, OrderNo, agRef, pgRef, txnDate, Amount);

                            if (result.Tables[2].Rows[0][0].ToString() == "Success")
                            {
                                status = "Success";
                            }
                            else { status = "Fail"; }

                            m_Log.WriteToLog(status);
                        }


                        m_Log.WriteToLog(data[0].Data.SaleRP[0].status.ToString());
                        m_Log.WriteToLog(data[0].Data.ResponseRFPGoB.ToString());
                    }
                }
                catch (Exception ex)
                {
                    m_Log.WriteToLog(ex.Message);
                }

            }
        }

        // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse); 
        public class SaleRP
        {
            public string agRef { get; set; }
            public string pgRef { get; set; }
            public string orderNo { get; set; }
            public string amount { get; set; }
            public string status { get; set; }
            public string txnDate { get; set; }
        }

        public class Data
        {
            public List<object> AuthRR { get; set; }
            public List<object> AuthVRR { get; set; }
            public List<object> CaptureRR { get; set; }
            public List<object> SaleRR { get; set; }
            public List<object> RefundRI { get; set; }
            public List<object> RequestSTPGoB { get; set; }
            public List<object> ResponseRFPGoB { get; set; }
            public List<object> VerificationRSTPGoB { get; set; }
            public List<object> VerificationRRFPGoB { get; set; }
            public List<object> NoRRFPGoB { get; set; }
            public List<object> AuthRP { get; set; }
            public List<object> AuthRF { get; set; }
            public List<object> AuthVRP { get; set; }
            public List<object> AuthVRF { get; set; }
            public List<object> CaptureRP { get; set; }
            public List<object> CaptureRF { get; set; }
            public List<SaleRP> SaleRP { get; set; }
            public List<object> SaleRF { get; set; }
            public List<object> RefundRP { get; set; }
            public List<object> RefundRF { get; set; }
            public List<object> ReconciledWRGoB { get; set; }
            public List<object> SettlementD { get; set; }
            public List<object> ReconciledM { get; set; }
            public List<object> MerchantPD { get; set; }
            public List<object> CancelledBC { get; set; }
            public List<object> Aborted { get; set; }
            public List<object> HostTO { get; set; }
            public List<object> AmountM { get; set; }
        }

        public class Root
        {
            public string publishId { get; set; }
            public string meId { get; set; }
            public Data Data { get; set; }
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

    }
}