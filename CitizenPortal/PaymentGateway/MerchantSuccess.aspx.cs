using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using Encryption.AES;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.PaymentGateway
{
    public partial class MerchantSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params.Count > 0)
            {
                string enc_txn_response = (!String.IsNullOrEmpty(Request.Params["txn_response"])) ? Request.Params["txn_response"] : string.Empty;
                string enc_pg_details = (!String.IsNullOrEmpty(Request.Params["pg_details"])) ? Request.Params["pg_details"] : string.Empty;
                string enc_fraud_details = (!String.IsNullOrEmpty(Request.Params["fraud_details"])) ? Request.Params["fraud_details"] : string.Empty;
                string enc_other_details = (!String.IsNullOrEmpty(Request.Params["other_details"])) ? Request.Params["other_details"] : string.Empty;

                MyCryptoClass aes = new MyCryptoClass();
                string txn_response = aes.decrypt(enc_txn_response);
                string[] txn_response_arr = txn_response.Split('|');

                string ag_id = (!String.IsNullOrEmpty(txn_response_arr[0])) ? txn_response_arr[0] : string.Empty;
                string me_id = (!String.IsNullOrEmpty(txn_response_arr[1])) ? txn_response_arr[1] : string.Empty;
                string order_no = (!String.IsNullOrEmpty(txn_response_arr[2])) ? txn_response_arr[2] : string.Empty;
                string amount = (!String.IsNullOrEmpty(txn_response_arr[3])) ? txn_response_arr[3] : string.Empty;
                string country = (!String.IsNullOrEmpty(txn_response_arr[4])) ? txn_response_arr[4] : string.Empty;
                string currency = (!String.IsNullOrEmpty(txn_response_arr[5])) ? txn_response_arr[5] : string.Empty;
                string txn_date = (!String.IsNullOrEmpty(txn_response_arr[6])) ? txn_response_arr[6] : string.Empty;
                string txn_time = (!String.IsNullOrEmpty(txn_response_arr[7])) ? txn_response_arr[7] : string.Empty;
                string ag_ref = (!String.IsNullOrEmpty(txn_response_arr[8])) ? txn_response_arr[8] : string.Empty;
                string pg_ref = (!String.IsNullOrEmpty(txn_response_arr[9])) ? txn_response_arr[9] : string.Empty;
                string status = (!String.IsNullOrEmpty(txn_response_arr[10])) ? txn_response_arr[10] : string.Empty;
                // string txn_type = (!String.IsNullOrEmpty(txn_response_arr[11])) ? txn_response_arr[11] : string.Empty;
                string res_code = (!String.IsNullOrEmpty(txn_response_arr[11])) ? txn_response_arr[11] : string.Empty;
                string res_message = (!String.IsNullOrEmpty(txn_response_arr[12])) ? txn_response_arr[12] : string.Empty;



                string pg_details = aes.decrypt(enc_pg_details);
                string[] pg_details_arr = pg_details.Split('|');
                string pg_id = (!String.IsNullOrEmpty(pg_details_arr[0])) ? pg_details_arr[0] : string.Empty;
                string pg_name = (!String.IsNullOrEmpty(pg_details_arr[1])) ? pg_details_arr[1] : string.Empty;
                string paymode = (!String.IsNullOrEmpty(pg_details_arr[2])) ? pg_details_arr[2] : string.Empty;
                string emi_months = (!String.IsNullOrEmpty(pg_details_arr[3])) ? pg_details_arr[3] : string.Empty;



                string fraud_details = aes.decrypt(enc_fraud_details);
                string[] fraud_details_arr = fraud_details.Split('|');
                string fraud_action = (!String.IsNullOrEmpty(fraud_details_arr[0])) ? fraud_details_arr[0] : string.Empty;
                string fraud_message = (!String.IsNullOrEmpty(fraud_details_arr[1])) ? fraud_details_arr[1] : string.Empty;
                string score = (!String.IsNullOrEmpty(fraud_details_arr[2])) ? fraud_details_arr[2] : string.Empty;



                string other_details = aes.decrypt(enc_other_details);
                string[] other_details_arr = other_details.Split('|');
                string udf_1 = (!String.IsNullOrEmpty(other_details_arr[0])) ? other_details_arr[0] : string.Empty;
                string udf_2 = (!String.IsNullOrEmpty(other_details_arr[1])) ? other_details_arr[1] : string.Empty;
                string udf_3 = (!String.IsNullOrEmpty(other_details_arr[2])) ? other_details_arr[2] : string.Empty;
                string udf_4 = (!String.IsNullOrEmpty(other_details_arr[3])) ? other_details_arr[3] : string.Empty;
                string udf_5 = (!String.IsNullOrEmpty(other_details_arr[4])) ? other_details_arr[4] : string.Empty;

                string[] AFields = {
                        "enc_txn_response", "enc_pg_details", "enc_fraud_details", "enc_other_details", "txn_response", "txn_response_arr", "ag_id", "me_id", "order_no"
                        ,"amount", "country", "currency", "txn_date", "txn_time", "ag_ref", "pg_ref", "status", "txn_type", "res_code", "res_message"
                        ,"pg_details", "pg_details_arr", "pg_id", "pg_name", "paymode", "emi_months"
                        ,"fraud_details", "fraud_details_arr", "fraud_action", "fraud_message", "score"
                        ,"other_details", "other_details_arr", "udf_1", "udf_2", "udf_3", "udf_4", "udf_5"
                        ,"appid", "pgappid", "serviceid", "profileid", "createdby", "data"
                    };

                SafeXPayResponse_DT ObjResponse_DT = new SafeXPayResponse_DT();
                ConfirmPaymentBLL m_ConfirmPaymentBLL = new ConfirmPaymentBLL();

                ObjResponse_DT.enc_txn_response = enc_txn_response;
                ObjResponse_DT.enc_pg_details = enc_pg_details;
                ObjResponse_DT.enc_fraud_details = enc_fraud_details;
                ObjResponse_DT.enc_other_details = enc_other_details;
                ObjResponse_DT.txn_response = txn_response;
                ObjResponse_DT.txn_response_arr = txn_response_arr.ToString();
                ObjResponse_DT.ag_id = ag_id;
                ObjResponse_DT.me_id = me_id;
                ObjResponse_DT.order_no = order_no;
                ObjResponse_DT.amount = amount;
                ObjResponse_DT.country = country;
                ObjResponse_DT.currency = currency;
                ObjResponse_DT.txn_date = txn_date;
                ObjResponse_DT.txn_time = txn_time;
                ObjResponse_DT.ag_ref = ag_ref;
                ObjResponse_DT.pg_ref = pg_ref;
                ObjResponse_DT.status = status;
                ObjResponse_DT.txn_type = "";
                ObjResponse_DT.res_code = res_code;
                ObjResponse_DT.res_message = res_message;
                ObjResponse_DT.pg_details = pg_details;
                ObjResponse_DT.pg_details_arr = pg_details_arr.ToString();
                ObjResponse_DT.pg_id = pg_id;
                ObjResponse_DT.pg_name = pg_name;
                ObjResponse_DT.paymode = paymode;
                ObjResponse_DT.emi_months = emi_months;
                ObjResponse_DT.fraud_details = fraud_details;
                ObjResponse_DT.fraud_details_arr = fraud_details_arr.ToString();
                ObjResponse_DT.fraud_action = fraud_action;
                ObjResponse_DT.fraud_message = fraud_message;
                ObjResponse_DT.score = score;
                ObjResponse_DT.other_details = other_details;
                ObjResponse_DT.other_details_arr = other_details_arr.ToString();
                ObjResponse_DT.udf_1 = udf_1; //AppID
                ObjResponse_DT.udf_2 = udf_2; //ServiceID 
                ObjResponse_DT.udf_3 = udf_3; //ReturnURL
                ObjResponse_DT.udf_4 = udf_4; //ProfileID
                ObjResponse_DT.udf_5 = udf_5; //PGAPPID
                ObjResponse_DT.appid = udf_1;
                ObjResponse_DT.pgappid = udf_5;
                ObjResponse_DT.serviceid = udf_2;
                ObjResponse_DT.profileid = udf_4;
                ObjResponse_DT.createdby = udf_4;
                ObjResponse_DT.data = "";

                string result = m_ConfirmPaymentBLL.InsertSafeXResponse(ObjResponse_DT, AFields);

                lblAgRef.Text = ag_ref;
                lblAmount.Text = amount;
                lblOrderNumber.Text = order_no;
                lblPgRef.Text = pg_ref;
                lblResponseMessage.Text = res_message;
                lblTransactionDate.Text = txn_date + " " + txn_time;
                lblTransactionStatus.Text = status;

                string AppID = udf_1, ServiceID = udf_2, ProfileID = udf_4, PGAppID = udf_5;
                
                try
                {
                    if (status == "Successful")
                    {
                        DataTable dt_SMS = new DataTable();
                        dt_SMS = m_ConfirmPaymentBLL.GetPaymentSMSData(AppID, ServiceID);

                        if (dt_SMS.Rows.Count > 0)
                        {
                            string t_Mobile = "", t_SMSText = "", MailID = "", CCMailID = "", BCCMailID = "", Subject = "", MailText = "";

                            for (int i = 0; i < dt_SMS.Rows.Count; i++)
                            {
                                t_Mobile = dt_SMS.Rows[i]["Mobile"].ToString();
                                t_SMSText = dt_SMS.Rows[i]["SMSText"].ToString();

                                MailID = dt_SMS.Rows[i]["MailID"].ToString();
                                CCMailID = dt_SMS.Rows[i]["CCMailID"].ToString();

                                BCCMailID = dt_SMS.Rows[i]["BCCMailID"].ToString();
                                Subject = dt_SMS.Rows[i]["Subject"].ToString();
                                MailText = dt_SMS.Rows[i]["MailText"].ToString();

                                if (t_Mobile != "" && t_SMSText != "")
                                {
                                    CitizenPortalLib.CommonUtility.SendSMSTo(t_Mobile, t_SMSText, AppID, ServiceID, ProfileID);
                                }

                                if (MailID != "" && Subject != "" && MailText != "")
                                {
                                    CitizenPortalLib.CommonUtility.SendEmailWithAttachment(ServiceID, AppID, ProfileID, MailID, CCMailID, BCCMailID,
                                        Subject, MailText, true, null);
                                }

                            }
                        }
                    }
                }
                catch (Exception)
                {
                }

                string t_URL = "";
                string URl = udf_3;
                t_URL += URl + "?" + Request.QueryString.ToString();

                //Response.Redirect(t_URL);

                Response.Redirect(udf_3 + "?SvcID=" + udf_2 + "&AppID=" + udf_1, false);
            }
        }
    }
}