using BridgePG;
using CitizenPortal.Common;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.CSCV2
{
    public partial class SuccessPayment : System.Web.UI.Page
    {
        public string bridgeResponseMessage = "Error ",
            drcResponse = "Error",
            walletResponseMessage = "",
            merchant_txn = "",
            merchant_txn_date_time = "",
            csc_txn = "",
            product_id = "",
            product_name = "",
            merchant_id = "",
            csc_id = "",
            txn_amount = "",
            pay_to_email = "",
            amount_parameter = "",
            txn_mode = "",
            txn_type = "",
            merchant_receipt_no = "",
            csc_share_amount = "",
            Currency = "",
            Discount = "",
            param_1 = "",
            param_2 = "",
            param_3 = "",
            param_4 = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["Connectdata"])))
            {
                NameValueCollection nvc = Request.Form;
                if (!string.IsNullOrEmpty(nvc["bridgeResponseMessage"]))
                {

                    bridgeResponseMessage = nvc["bridgeResponseMessage"];
                    string strPrivateKey = ConfigurationManager.AppSettings["PRIVATE_KEY"];
                    string strPublicKey = ConfigurationManager.AppSettings["PUBLIC_KEY"];
                    strPrivateKey = Base64Decode(strPrivateKey);
                    strPublicKey = Base64Decode(strPublicKey);
                    Crypto.privateKey = strPrivateKey;
                    drcResponse = Crypto.decrypt(bridgeResponseMessage, strPrivateKey, strPublicKey, true);
                    Label1.Text = drcResponse;

                    string input = drcResponse;

                    Dictionary<string, string> names = new Dictionary<string, string>();
                    string[] arr = input.Split('|');
                    foreach (var ar1 in arr)
                    {
                        string[] itemArr = ar1.Split('=');
                        if (itemArr.Length > 1)
                        {
                            names.Add(itemArr[0], itemArr[1]);
                        }
                    }

                    string t_csc_txn = names["csc_txn"];
                    string t_merchant_id = names["merchant_id"];
                    string t_csc_id = names["csc_id"];
                    string t_merchant_txn = names["merchant_txn"];
                    string t_txn_status = names["txn_status"];
                    string t_merchant_txn_date_time = names["merchant_txn_date_time"];
                    string t_product_id = names["product_id"];
                    string t_txn_amount = names["txn_amount"];
                    string t_amount_parameter = names["amount_parameter"];
                    string t_txn_mode = names["txn_mode"];
                    string t_txn_type = names["txn_type"];
                    string t_merchant_receipt_no = names["merchant_receipt_no"];
                    string t_csc_share_amount = names["csc_share_amount"];
                    string t_pay_to_email = names["pay_to_email"];
                    string t_currency = names["currency"];
                    string t_discount = names["discount"];
                    string t_param_1 = names["param_1"];
                    string t_param_2 = names["param_2"];
                    string t_param_3 = names["param_3"];
                    string t_param_4 = names["param_4"];
                    string t_txn_status_message = names["txn_status_message"];
                    string t_status_message = names["status_message"];

                    string t_ServiceID = t_param_1;
                    string t_AppID = t_param_2;

                    SPVRequestBLL m_SPVRequestBLL = new SPVRequestBLL();

                    string[] aFields =
                    {
                        "SvcID"
                        , "AppID"
                        , "CSCID"
                        , "bridgeResponseMessage"
                        , "decryptedResponseMessage"
                        , "CreatedBy"
                    };

                    string t_SPVRequest = "";
                    CSCBridgeResponseMessage_DT objCSCBridgeResponseMessage_DT = new CSCBridgeResponseMessage_DT();
                    objCSCBridgeResponseMessage_DT.SvcID = t_param_1;
                    objCSCBridgeResponseMessage_DT.AppID = t_param_2;
                    objCSCBridgeResponseMessage_DT.CSCID = t_csc_id;
                    objCSCBridgeResponseMessage_DT.bridgeResponseMessage = bridgeResponseMessage;
                    objCSCBridgeResponseMessage_DT.decryptedResponseMessage = drcResponse;
                    objCSCBridgeResponseMessage_DT.CreatedBy = t_csc_id;

                    t_SPVRequest = m_SPVRequestBLL.InsertCSCBridgeResponseMessage(objCSCBridgeResponseMessage_DT, aFields);

                    CSCBridgeResponse_DT objCSCBridgeResponse_DT = new CSCBridgeResponse_DT();
                    string[] aResponseFields =
                    {
                        "SvcID"
                        , "AppID"
                        , "CSCID"
                        , "csc_txn"
                        , "merchant_id"
                        , "csc_id"
                        , "merchant_txn"
                        , "txn_status"
                        , "merchant_txn_date_time"
                        , "product_id"
                        , "txn_amount"
                        , "amount_parameter"
                        , "txn_mode"
                        , "txn_type"
                        , "merchant_receipt_no"
                        , "csc_share_amount"
                        , "pay_to_email"
                        , "currency"
                        , "discount"
                        , "param_1"
                        , "param_2"
                        , "param_3"
                        , "param_4"
                        , "txn_status_message"
                        , "status_message"
                        , "CreatedBy"
                        , "ClientIPAddress"
                        , "ResponseMessage"
                    };


                    objCSCBridgeResponse_DT.SvcID = t_param_1;
                    objCSCBridgeResponse_DT.AppID = t_param_2;
                    objCSCBridgeResponse_DT.CSCID = t_csc_id;
                    objCSCBridgeResponse_DT.csc_txn = t_csc_txn;
                    objCSCBridgeResponse_DT.merchant_id = t_merchant_id;
                    objCSCBridgeResponse_DT.csc_id = t_csc_id;
                    objCSCBridgeResponse_DT.merchant_txn = t_merchant_txn;
                    objCSCBridgeResponse_DT.txn_status = t_txn_status;
                    objCSCBridgeResponse_DT.merchant_txn_date_time = t_merchant_txn_date_time;
                    objCSCBridgeResponse_DT.product_id = t_product_id;
                    objCSCBridgeResponse_DT.txn_amount = t_txn_amount;
                    objCSCBridgeResponse_DT.amount_parameter = t_amount_parameter;
                    objCSCBridgeResponse_DT.txn_mode = t_txn_mode;
                    objCSCBridgeResponse_DT.txn_type = t_txn_type;
                    objCSCBridgeResponse_DT.merchant_receipt_no = t_merchant_receipt_no;
                    objCSCBridgeResponse_DT.csc_share_amount = t_csc_share_amount;
                    objCSCBridgeResponse_DT.pay_to_email = t_pay_to_email;
                    objCSCBridgeResponse_DT.currency = t_currency;
                    objCSCBridgeResponse_DT.discount = t_discount;
                    objCSCBridgeResponse_DT.param_1 = t_param_1;
                    objCSCBridgeResponse_DT.param_2 = t_param_2;
                    objCSCBridgeResponse_DT.param_3 = t_param_3;
                    objCSCBridgeResponse_DT.param_4 = t_param_4;
                    objCSCBridgeResponse_DT.txn_status_message = t_txn_status_message;
                    objCSCBridgeResponse_DT.status_message = t_status_message;
                    objCSCBridgeResponse_DT.CreatedBy = t_csc_id;
                    objCSCBridgeResponse_DT.ClientIPAddress = "";
                    objCSCBridgeResponse_DT.ResponseMessage = drcResponse;

                    DataSet t_dsResult = m_SPVRequestBLL.InsertCSCBridgeResponse(objCSCBridgeResponse_DT, aResponseFields);
                    string t_TransactionID = "";
                    string t_Result = "";

                    if (t_dsResult.Tables.Count > 0)
                    {
                        if (t_dsResult != null)
                        {
                            if (t_dsResult.Tables[0].Rows.Count > 0)
                            {
                                if (t_dsResult.Tables[0].Columns.Contains("TransactionID"))
                                {
                                    t_TransactionID = t_dsResult.Tables[0].Rows[0]["TransactionID"].ToString();
                                }
                            }
                            if (t_dsResult.Tables[1].Rows.Count > 0)
                            {
                                if (t_dsResult.Tables[1].Columns.Contains("Result"))
                                {
                                    t_Result = t_dsResult.Tables[1].Rows[0]["Result"].ToString();
                                }
                            }
                        }
                    }

                    if (t_Result == "1" && t_txn_status_message == "Success")
                    {
                        Response.Redirect("/WebApp/Kiosk/Forms/PaymentReceipt.aspx?SvcID=" + t_ServiceID + "&AppID=" + t_AppID);

                    }
                    else if (t_SPVRequest == "0" && t_txn_status_message == "Success")
                    {
                        //Case when the Insert Statement is Failed and CSC returned Success.
                    }
                    else
                    {
                        //TODO: Display Error Message
                    }



                   
                }
            }
            else
            {

                Response.Write("Null Session  Go fro Home Page");
            }
        }

        string Base64Decode(string base64EncodedData)
        {
            var base64EncodedBytes = System.Convert.FromBase64String(base64EncodedData);
            return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
        }
    }
}