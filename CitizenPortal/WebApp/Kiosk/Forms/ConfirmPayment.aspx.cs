using CitizenPortalLib;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
//using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortal.Models;
using Encryption.AES;
using System.Collections.Specialized;


namespace CitizenPortal.WebApp.Kiosk.Forms
{
    public partial class ConfirmPayment : CommonBasePage
    {
        ConfirmPaymentBLL m_ConfirmPaymentBLL = new ConfirmPaymentBLL();
        string m_AppID, m_ServiceID;
        string m_UserType;
        bool m_SkipPayment = false;

        string m_PayeeName = "";
        string m_PayeeMobile = "";
        string m_PayeeEmailID = "";

        string m_PgAppID = "", m_ProfileId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;
            btnHome.PostBackUrl = Session["HomePage"].ToString();
            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();
            HFServiceID.Value = "999";
            if (!IsPostBack)
            {
                divErr.Style.Add("display", "none");
            }

            if (m_ServiceID == "424")
            {
                lblPG.Visible = false;
                divPaymentOption.Attributes.Add("style", "display:none");
                m_SkipPayment = true;
            }
            else if (Session["UserType"].ToString().ToUpper() == "CITIZEN")
            {
                lblPG.Visible = true;
                lblSbi.Visible = false;
                lblSPV.Visible = false;
                lblSelf.Visible = false;
                m_UserType = "CITIZEN";
                rbtPG.Checked = true;
                divMsg.Attributes.Add("style", "display:none");
                
                // divPaymentOption.Attributes.Add("style", "display:none");
                btnSubmit.Text = "Submit Application";
                HFServiceID.Value = "801";
            }
            else if (Session["UserType"].ToString().ToUpper() == "G2G")
            {
                lblPG.Visible = true;
                lblSbi.Visible = false;
                lblSPV.Visible = false;
                m_UserType = "KIOSK";
                rbtPG.Checked = true;
                divMsg.Attributes.Add("style", "display:none");
            }
            else if (Session["UserType"].ToString().ToUpper() != "CITIZEN" || Session["UserType"].ToString().ToUpper() != "KIOSK")
            {
                if (m_ServiceID == "424")
                {
                    lblPG.Visible = false;
                    divPaymentOption.Attributes.Add("style", "display:none");
                    m_SkipPayment = true;
                }
                else if(m_ServiceID == "1451" || m_ServiceID == "1453" || m_ServiceID=="1456" || m_ServiceID == "1457" || m_ServiceID == "1460" || m_ServiceID == "1449")
                {
                    lblPG.Visible = true;
                    lblSbi.Visible = false;
                    lblSPV.Visible = false;
                    lblSelf.Visible = false;
                    m_UserType = "CITIZEN";
                    rbtPG.Checked = true;
                    divMsg.Attributes.Add("style", "display:none");

                    // divPaymentOption.Attributes.Add("style", "display:none");
                    btnSubmit.Text = "Submit Application";
                    HFServiceID.Value = "801";
                }
                else
                {
                    btnSubmit.Visible = false;
                    divErr.InnerHtml = "Error in Page, Code 000. Please contact Administrator";
                    divErr.Style.Add("display", "");
                    divErr.Attributes.Add("class", "error");
                    return;
                }
            }



            HFUserType.Value = m_UserType;


            string AppID = m_AppID;

            DocumentBriefcaseBLL t_DocumentBriefcaseBLL = new DocumentBriefcaseBLL();
            DataTable dtDoc = null;

            try
            {
                dtDoc = t_DocumentBriefcaseBLL.VerifyDocumentDetails(m_ServiceID, m_AppID);

            }
            catch (Exception ex)
            {
                btnSubmit.Visible = false;
                divErr.InnerHtml = ex.Message;
                divErr.Style.Add("display", "");
                divErr.Attributes.Add("class", "error");
                return;
            }



            try
            {
                DataSet dt = m_ConfirmPaymentBLL.GetPaymentDetails(m_ServiceID, m_AppID, m_UserType);

                if (dt != null && dt.Tables[0].Rows.Count > 0)
                {
                    DataTable AppDetails = dt.Tables[0];

                    lblAppDate.InnerText = Convert.ToDateTime(AppDetails.Rows[0]["AppDate"]).ToString("dd/MM/yyyy");
                    lblAppID.InnerText = AppDetails.Rows[0]["AppID"].ToString();
                    lblAppName.InnerText = AppDetails.Rows[0]["AppName"].ToString();
                    //lblServiceID.InnerText = AppDetails.Rows[0]["ServiceID"].ToString();
                    lblServiceName.InnerText = AppDetails.Rows[0]["ServiceName"].ToString();
                    lblCreatedBy.InnerText = AppDetails.Rows[0]["CreatedBy"].ToString();

                    m_PayeeName = AppDetails.Rows[0]["PayeeName"].ToString();
                    m_PayeeMobile = AppDetails.Rows[0]["PayeeMobile"].ToString();
                    m_PayeeEmailID = AppDetails.Rows[0]["PayeeEmailID"].ToString();

                }

                if (dt != null && dt.Tables[1].Rows.Count > 0)
                {
                    DataTable FeeDetails = dt.Tables[1];

                    lblDeptFee.InnerText = FeeDetails.Rows[0]["Dept"].ToString();
                    lblGovtFee.InnerText = FeeDetails.Rows[0]["Govt"].ToString();
                    lblPortalFee.InnerText = FeeDetails.Rows[0]["PortalFee"].ToString();
                    lblOtherCharges.InnerText = FeeDetails.Rows[0]["Other"].ToString();
                    lblSvcTax.InnerText = FeeDetails.Rows[0]["SvcTax"].ToString();
                    lblTotal.InnerText = FeeDetails.Rows[0]["Total"].ToString();
                    lblTotal.InnerText = FeeDetails.Rows[0]["txn_amount"].ToString();                    


                    if (FeeDetails.Rows[0]["ZeroPayment"].ToString() == "1" && FeeDetails.Rows[0]["SkipPayment"].ToString() == "1")
                    {
                        //if (false)
                        {
                            //SkipPayment();
                            m_SkipPayment = true;
                        }
                    }
                }

                if (m_SkipPayment)
                {
                    SkipPayment();
                }
            }
            catch (Exception ex)
            {
                btnSubmit.Visible = false;
                divErr.InnerHtml = ex.Message;
                divErr.Style.Add("display", "");
                divErr.Attributes.Add("class", "error");
            }



        }

        void SkipPayment()
        {

            string t_TransactionID = "";
            string[] AFields = {
                "Service_ID"
                , "AppID"
                , "CreatedBy"
                , "UserType"
                //, "CreatedOn"
                //, "Trans_Type"
                //, "Trans_Date"
                //, "Paid_Status"
                };

            Transaction_DT objTransaction_DT = new Transaction_DT();
            objTransaction_DT.CreatedBy = GetKioskID();// HttpContext.Current.Session["KioskID"].ToString();
                                                       //objTransaction_DT.CreatedOn = DateTime.Now;

            objTransaction_DT.Channel_ID = "";
            //objTransaction_DT.Trans_Type = "DR";
            //objTransaction_DT.Trans_Date = DateTime.Now;
            objTransaction_DT.Service_ID = m_ServiceID;
            objTransaction_DT.AppID = m_AppID;
            //objTransaction_DT.paid_status = "Y"
            objTransaction_DT.UserType = m_UserType;

            t_TransactionID = m_ConfirmPaymentBLL.InsertV3(objTransaction_DT, AFields);

            string t_URL = "~/WebApp/Kiosk/Forms/PaymentReceipt.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID + "&Status=Y";

            if (Request.QueryString["CustomPayFlag"] != null && Request.QueryString["CustomPayFlag"].ToString().ToUpper() == "Y")
            {
                t_URL = t_URL + "&CustomPayFlag=Y";
            }

            Response.Redirect(t_URL);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AutoLogin();
        }

        protected void AutoLogin()
        {
            String key = "eDHr@cSc";
            //  String str =  Request.Params["ApnaCSC"];
            String str = "bAuthAHaUyfvYIlyCzuNLn91TETSx26HvCLyknlyG1H4JegKfeh%2B4oZ%2Bmx2BxAUbY4PF7f4nil2fLYhk3zcsrwSXotHGhvWT0MfGvkR%2BYPgEfqAIMmbaIjYT2WmKprk4KAejzCYXrLdN5VsyZMRy7KEq6oBDYhrNmVNWo3pXJ4DJGnsJNV4Gv2OFK6t76qERO%2FRFWpXuFvXb4yk1%2FzDgf6frSXza3tPNtH4OBWIqHb48Hvc5aWRQrQ%3D%3D";

            if (str == null)
            {
                Response.Redirect("http://apna.csc.gov.in/index.php/my-account.html", false);
            }
            else
            {
                String str1 = "";//Decrypt3DES(str, key);

                string[] words;
                if (str1.Contains("&"))
                {
                    words = str1.Split(new[] { "&" }, StringSplitOptions.RemoveEmptyEntries);
                    string CSCCode = words[0].Substring(11);
                    if (Regex.IsMatch(CSCCode, "^[a-zA-Z]{2}[0-9]{9}"))
                    {
                        DateTime tn = DateTime.Now;
                        string RegNo = tn.ToFileTime().ToString();

                        Session["Id"] = words[0].Substring(11);
                        string user = Session["Id"].ToString();
                        Session["REGNO"] = RegNo;
                        Session["Id"] = " HR010100203";
                        string pass = "PaymentRequest.aspx";
                        Response.Redirect(pass, false);
                        //Response.Redirect("Demopage.aspx", false);

                    }

                    else
                    {
                        //Response.Redirect("http://apna.csc.gov.in/index.php/my-account.html", false);
                        string url = "http://apna.csc.gov.in/index.php/my-account.html";
                        RedirectPageWithMsg(this.Page, url, "InValid User...");

                    }

                }



                else
                {
                    words = null;
                    RedirectPageWithMsg(this.Page, "http://apna.csc.gov.in/index.php/my-account.html", "Please Clear The Browser Cookies and  Login Again .....");
                }


            }

        }

        public static void RedirectPageWithMsg(System.Web.UI.Page page, string url, string Msg)
        {
            String strScript = String.Empty;
            strScript += "alert('" + Msg + "');\n";
            strScript += "function redirectMyPage()\n{\n";
            strScript += "window.location='" + url + "';\n}\n";
            strScript += "setTimeout('redirectMyPage()',1);\n";

            ScriptManager.RegisterStartupScript(page, typeof(Page), "myKey", strScript, true);
        }

        //public string Decrypt3DES(string strString, string Key)
        //{
        //    DESCryptoServiceProvider DES = new DESCryptoServiceProvider();

        //    DES.Key = Encoding.UTF8.GetBytes(Key);
        //    DES.Mode = CipherMode.ECB;
        //    DES.Padding = PaddingMode.Zeros;
        //    ICryptoTransform DESDecrypt = DES.CreateDecryptor();

        //    byte[] Buffer = Convert.FromBase64String(strString);
        //    return UTF8Encoding.UTF8.GetString(DESDecrypt.TransformFinalBlock(Buffer, 0, Buffer.Length));
        //}

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SafeXPaymentGateway();
        }
        protected void btnSubmit_Click_old(object sender, EventArgs e)
        {
            //string temp_URL = "~/WebApp/Entrance/PhD/Acknowledgement.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID + "&Status=Y";
            
            //Response.Redirect(temp_URL);


            try
            {
                //if (rbtPG.Checked == true)
                //{
                //    string pgresquesturl = ConfigurationManager.AppSettings["PGRequestURL"].ToString();
                //    // string PG_Request_url = "http://5.79.69.86:9090/PG/PGReceipt.aspx";
                //    string PG_Request_url = "http://5.79.69.86:9090/PG/Payment_Receipt.aspx"; 
                //    Response.Redirect(pgresquesturl+"?SvcID=" + m_ServiceID + "&AppID=" + m_AppID + "&Amt=" + 1 + "&URL="+ PG_Request_url  , false);
                //    // Response.Redirect(pgresquesturl + "?Url=" + Before_Request_url + "&Amt=" + 1, false);
                //    //  "&Url=" + Before_Request_url,



                //}
                //else 
                if (m_UserType.ToUpper() == "CITIZEN")
                {

                    if (m_ServiceID == "388" && rbtSBI.Checked == true)
                    {
                        //lblSbi.Visible = true;
                        //if (rbtSBI.Checked == true)
                        {
                            string SBIPGURL = ConfigurationManager.AppSettings["SBIPGURL"].ToString();

                            Response.Redirect(SBIPGURL);
                        }

                    }

                    else if (rbtPG.Checked == true && !m_SkipPayment)
                    {
                        string result = "";
                        string[] AFields = {
                "ServiceID"
                , "AppID"
                , "ReturnURL"
                , "PGName"
                 , "Amount"
                , "PortalFee"
                , "ServiceTax"
                , "CreatedBy"
                };
                        m_AppID = Request.QueryString["AppID"].ToString();
                        m_ServiceID = Request.QueryString["SvcID"].ToString();
                        decimal Amount = decimal.Parse(lblTotal.InnerText);
                        decimal Portal = 0.00M;
                        decimal STax = 0.00M;
                        PGAppRequest_DT ObjPGAppRequest_DT = new PGAppRequest_DT();
                        ObjPGAppRequest_DT.ServiceID = m_ServiceID;
                        ObjPGAppRequest_DT.AppID = m_AppID;
                        ObjPGAppRequest_DT.ReturnURL = HttpContext.Current.Request.Url.AbsoluteUri;
                        ObjPGAppRequest_DT.PGName = "ICICI";
                        ObjPGAppRequest_DT.Amount = Amount;
                        ObjPGAppRequest_DT.PortalFee = Portal;
                        ObjPGAppRequest_DT.ServiceTax = STax;
                        ObjPGAppRequest_DT.CreatedBy = m_AppID;

                        result = m_ConfirmPaymentBLL.PGAppInsert(ObjPGAppRequest_DT, AFields);

                        string pgresquesturl = ConfigurationManager.AppSettings["PGRequestPayURL"].ToString();
                        // string PG_Request_url = "http://5.79.69.86:9090/PG/PGReceipt.aspx";
                        string PG_Request_url = ConfigurationManager.AppSettings["PGReturnURL"].ToString();

                        string SVCD = HttpUtility.UrlEncode(KeyClass.Encrypt(m_ServiceID));
                        string AppID = HttpUtility.UrlEncode(KeyClass.Encrypt(m_AppID));
                        string amt = HttpUtility.UrlEncode(KeyClass.Encrypt(Amount.ToString()));
                        string pg_Reuest = HttpUtility.UrlEncode(KeyClass.Encrypt(PG_Request_url));
                        string PF = HttpUtility.UrlEncode(KeyClass.Encrypt(Portal.ToString()));
                        string ST = HttpUtility.UrlEncode(KeyClass.Encrypt(STax.ToString()));
                        string name = HttpUtility.UrlEncode(KeyClass.Encrypt(m_PayeeName));
                        string phone = HttpUtility.UrlEncode(KeyClass.Encrypt(m_PayeeMobile));
                        string email = HttpUtility.UrlEncode(KeyClass.Encrypt(m_PayeeEmailID));

                        //2020-03-14 Old Logic for EBS PG
                        pgresquesturl = pgresquesturl + "?SvcID=" + SVCD + "&AppID=" + AppID + "&Amt=" + amt + "&ServiceTax=" + ST
                            + "&PortalFee=" + PF + "&URL=" + pg_Reuest + "&name=" + name + "&phone=" + phone + "&email=" + email;

                        //2020-03-14 New Logic for CCAvenue PG
                        //string t_DoubleEncrypt = HttpUtility.UrlEncode(KeyClass.Encrypt("SvcID=" + SVCD + "&AppID=" + AppID + "&Amt=" + amt + "&ServiceTax=" + ST
                        //    + "&PortalFee=" + PF + "&URL=" + pg_Reuest + "&name=" + name + "&phone=" + phone + "&email=" + email));

                        //pgresquesturl = pgresquesturl + "?data=" + t_DoubleEncrypt;

                        Response.Redirect(pgresquesturl, false);
                        // Response.Redirect(pgresquesturl + "?SvcID=" + SVCD + "&AppID=" + AppID + "&Amt=" + amt + "&URL=" + pg_Reuest, false);
                        // Response.Redirect(pgresquesturl + "?Url=" + Before_Request_url + "&Amt=" + 1, false);
                        //  "&Url=" + Before_Request_url,

                    }
                    else if (m_ServiceID != "388")
                    {

                        string t_TransactionID = "";
                        string[] AFields = {
                "Service_ID"
                , "AppID"
                , "CreatedBy"
                , "UserType"
                //, "CreatedOn"
                //, "Trans_Type"
                //, "Trans_Date"
                //, "Paid_Status"
                };

                        Transaction_DT objTransaction_DT = new Transaction_DT();
                        objTransaction_DT.CreatedBy = GetKioskID();// HttpContext.Current.Session["KioskID"].ToString();
                                                                   //objTransaction_DT.CreatedOn = DateTime.Now;

                        objTransaction_DT.Channel_ID = "";
                        //objTransaction_DT.Trans_Type = "DR";
                        //objTransaction_DT.Trans_Date = DateTime.Now;
                        objTransaction_DT.Service_ID = m_ServiceID;
                        objTransaction_DT.AppID = m_AppID;
                        //objTransaction_DT.paid_status = "Y"
                        objTransaction_DT.UserType = m_UserType;

                        t_TransactionID = m_ConfirmPaymentBLL.InsertV3(objTransaction_DT, AFields);

                        string t_URL = "~/WebApp/Kiosk/Forms/PaymentReceipt.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID + "&Status=Y";

                        if (Request.QueryString["CustomPayFlag"] != null && Request.QueryString["CustomPayFlag"].ToString().ToUpper() == "Y")
                        {
                            t_URL = t_URL + "&CustomPayFlag=Y";
                        }

                        Response.Redirect(t_URL);
                    }
                    else
                    {
                        string m_Message = "Please select Payment Option ";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                    }
                }
                else if (rbtSPV.Checked)
                {
                    //DateTime tn = DateTime.Now;
                    //string RegNo = tn.ToFileTime().ToString();
                    //Session["REGNO"] = RegNo;
                    //Session["Id"] = "HR010100203";
                    string pass = "/WebApp/CSCSPV/SPVPaymentRequest.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID;
                    Response.Redirect(pass, true);
                }
                else if (rbtWallet.Checked)
                {
                    string t_TransactionID = "";
                    string[] AFields = {
                "Service_ID"
                , "AppID"
                , "CreatedBy"
                , "UserType"
                //, "CreatedOn"
                //, "Trans_Type"
                //, "Trans_Date"
                //, "Paid_Status"
                };

                    Transaction_DT objTransaction_DT = new Transaction_DT();
                    objTransaction_DT.CreatedBy = GetKioskID();// HttpContext.Current.Session["KioskID"].ToString();
                                                               //objTransaction_DT.CreatedOn = DateTime.Now;

                    objTransaction_DT.Channel_ID = "";
                    //objTransaction_DT.Trans_Type = "DR";
                    //objTransaction_DT.Trans_Date = DateTime.Now;
                    objTransaction_DT.Service_ID = m_ServiceID;
                    objTransaction_DT.AppID = m_AppID;
                    //objTransaction_DT.paid_status = "Y";            
                    objTransaction_DT.UserType = m_UserType;

                    t_TransactionID = m_ConfirmPaymentBLL.InsertV3(objTransaction_DT, AFields);

                    string t_URL = "~/WebApp/Kiosk/Forms/PaymentReceipt.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID + "&Status=Y";

                    if (Request.QueryString["CustomPayFlag"] != null && Request.QueryString["CustomPayFlag"].ToString().ToUpper() == "Y")
                    {
                        t_URL = t_URL + "&CustomPayFlag=Y";
                    }

                    Response.Redirect(t_URL);
                }
                else
                {
                    string m_Message = "Please select Payment Option ";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                }
            }
            catch (Exception ex)
            {
                divErr.InnerHtml = ex.Message;
                divErr.Style.Add("display", "");
                divErr.Attributes.Add("class", "error");
            }
        }

        private void SafeXPaymentGateway()
        {
            string amount = "";
            string cust_name = "";
            string email_id = "";
            string mobile_no = "";
            string unique_id = "";// Guid.NewGuid().ToString();
            string is_logged_in = "Y";
            string m_ProfileID = "";// Session["ProfileID"].ToString();
            string t_AppID = "";

            if (Session["UserType"].ToString().ToUpper() == "CITIZEN") {
                m_ProfileID = Session["ProfileID"].ToString();
            }
            else { m_ProfileID= Session["LoginID"].ToString(); }

            DataSet dt = m_ConfirmPaymentBLL.GetPaymentDetails(m_ServiceID, m_AppID, m_UserType);

            if (dt != null && dt.Tables[0].Rows.Count > 0)
            {
                DataTable AppDetails = dt.Tables[0];
               
                lblAppDate.InnerText = Convert.ToDateTime(AppDetails.Rows[0]["AppDate"]).ToString("dd/MM/yyyy HH:mm:ss");
                lblAppID.InnerText = AppDetails.Rows[0]["AppID"].ToString();
                lblAppName.InnerText = AppDetails.Rows[0]["AppName"].ToString();
                //lblServiceID.InnerText = AppDetails.Rows[0]["ServiceID"].ToString();
                lblServiceName.InnerText = AppDetails.Rows[0]["ServiceName"].ToString();
                lblCreatedBy.InnerText = AppDetails.Rows[0]["CreatedBy"].ToString();

                m_PayeeName = AppDetails.Rows[0]["PayeeName"].ToString();
                m_PayeeMobile = AppDetails.Rows[0]["PayeeMobile"].ToString();
                m_PayeeEmailID = AppDetails.Rows[0]["PayeeEmailID"].ToString();

                cust_name = m_PayeeName;
                email_id = m_PayeeEmailID;
                mobile_no = m_PayeeMobile;
                unique_id = AppDetails.Rows[0]["AppID"].ToString();
                is_logged_in = "Y";

            }

            if (dt != null && dt.Tables[1].Rows.Count > 0)
            {
                DataTable FeeDetails = dt.Tables[1];
                amount = FeeDetails.Rows[0]["txn_amount"].ToString();    
            }

            string ag_id = "Paygate";
            string me_id = ConfigurationManager.AppSettings["MEID"].ToString();  //"202104210302";
            string me_key = ConfigurationManager.AppSettings["MEKey"].ToString();  //"n2B808GWxEls3oFzOz6wfxgEpSfPaQunLCU54vDJty4=";
            string order_no = Guid.NewGuid().ToString();// HFOrderNo.Value;
            
            string country = "IND";
            string currency = "INR";
            string txn_type = "SALE";
            string success_url = ConfigurationManager.AppSettings["PGSuccessURL"].ToString(); //"http://localhost:53056/PaymentGateway/MerchantSuccess.aspx";
            string failure_url = ConfigurationManager.AppSettings["PGFailurePayURL"].ToString(); //"http://localhost:53056/PaymentGateway/MerchantFailure.aspx";
            string channel = "WEB";
            string pg_id = "";
            
            string txnagId = (!String.IsNullOrEmpty(ag_id)) ? ag_id : string.Empty;
            string txnmerchantId = (!String.IsNullOrEmpty(me_id)) ? me_id : string.Empty;
            string txnmerchantKey = (!String.IsNullOrEmpty(me_key)) ? me_key : string.Empty;

            string txnorderNumber = (!String.IsNullOrEmpty(order_no)) ? order_no : string.Empty;
            string txnAmount = (!String.IsNullOrEmpty(amount)) ? amount : string.Empty;
            string txnCountry = (!String.IsNullOrEmpty(country)) ? country : string.Empty;
            string txnCountryCurrency = (!String.IsNullOrEmpty(currency)) ? currency : string.Empty;
            string txnType = (!String.IsNullOrEmpty(txn_type)) ? txn_type : string.Empty;
            string txnsuccessUrl = (!String.IsNullOrEmpty(success_url)) ? success_url : string.Empty;
            string txnfailureUrl = (!String.IsNullOrEmpty(failure_url)) ? failure_url : string.Empty;
            string txnChannel = (!String.IsNullOrEmpty(channel)) ? channel : string.Empty;
            
            string pgId = (!String.IsNullOrEmpty(pg_id)) ? pg_id : string.Empty;
            string pgPayMode = "";// (!String.IsNullOrEmpty(paymode.Items[paymode.SelectedIndex].Value)) ? paymode.Items[paymode.SelectedIndex].Value : string.Empty;
            string pgscheme = string.Empty;// "";// (!String.IsNullOrEmpty(scheme.Value)) ? scheme.Value : string.Empty;
            string pgEmiMonths = "";// (!String.IsNullOrEmpty(emi_months.Value)) ? emi_months.Value : string.Empty;

            string ccCardNo = "";// (!String.IsNullOrEmpty(card_no.Value)) ? card_no.Value : string.Empty;
            string ccExpMonth = "";// (!String.IsNullOrEmpty(exp_month.Items[exp_month.SelectedIndex].Value)) ? exp_month.Items[exp_month.SelectedIndex].Value : string.Empty;
            string ccexpYear = "";// (!String.IsNullOrEmpty(exp_year.Items[exp_year.SelectedIndex].Value)) ? exp_year.Items[exp_year.SelectedIndex].Value : string.Empty;
            string ccCardName = "";// (!String.IsNullOrEmpty(card_name.Value)) ? card_name.Value : string.Empty;
            string ccCvv2 = "";// (!String.IsNullOrEmpty(cvv2.Value)) ? cvv2.Value : string.Empty;

            string custName = "";// (!String.IsNullOrEmpty(cust_name)) ? cust_name : string.Empty;
            string custEmailId = "";// (!String.IsNullOrEmpty(email_id)) ? email_id : string.Empty;
            string custMobileNo = "";// (!String.IsNullOrEmpty(mobile_no)) ? mobile_no : string.Empty;
            string custUniqueId = "";// (!String.IsNullOrEmpty(unique_id)) ? unique_id : string.Empty;
            string custisLoggedIn = "";// (!String.IsNullOrEmpty(is_logged_in)) ? is_logged_in : string.Empty;
            
            string billAddress = "";// (!String.IsNullOrEmpty(bill_address.Value)) ? bill_address.Value : string.Empty;
            string billCity = "";// (!String.IsNullOrEmpty(bill_city.Value)) ? bill_city.Value : string.Empty;
            string billState = "";// (!String.IsNullOrEmpty(bill_state.Value)) ? bill_state.Value : string.Empty;
            string billCountry = "";//  (!String.IsNullOrEmpty(bill_country.Value)) ? bill_country.Value : string.Empty;
            string billZip = "";// (!String.IsNullOrEmpty(bill_zip.Value)) ? bill_zip.Value : string.Empty;
            
            string shipAddress = "";//  (!String.IsNullOrEmpty(ship_address.Value)) ? ship_address.Value : string.Empty;
            string shipCity = "";//  (!String.IsNullOrEmpty(ship_city.Value)) ? ship_city.Value : string.Empty;
            string shipState = "";// (!String.IsNullOrEmpty(ship_state.Value)) ? ship_state.Value : string.Empty;
            string shipCountry = "";//  (!String.IsNullOrEmpty(ship_country.Value)) ? ship_country.Value : string.Empty;
            string shipZip = "";// (!String.IsNullOrEmpty(ship_zip.Value)) ? ship_zip.Value : string.Empty;
            string shipDays = "";// (!String.IsNullOrEmpty(ship_days.Value)) ? ship_days.Value : string.Empty;
            string shipAddressCount = "";// (!String.IsNullOrEmpty(address_count.Value)) ? address_count.Value : string.Empty;
            
            string itemCount = "";// (!String.IsNullOrEmpty(item_count.Value)) ? item_count.Value : string.Empty;
            string itemValue = "";// (!String.IsNullOrEmpty(item_value.Value)) ? item_value.Value : string.Empty;
            string itemCategory = "";// (!String.IsNullOrEmpty(item_category.Value)) ? item_category.Value : string.Empty;


            string udf_1 = m_AppID;
            string udf_2 = m_ServiceID;
            string udf_3 = "/WebApp/Kiosk/Forms/Acknowledgement.aspx"; 
            string udf_4 = m_ProfileID;
            string udf_5 = m_PgAppID;
            
            string udf1 = (!String.IsNullOrEmpty(udf_1)) ? udf_1 : string.Empty;
            string udf2 = (!String.IsNullOrEmpty(udf_2)) ? udf_2 : string.Empty;
            string udf3 = (!String.IsNullOrEmpty(udf_3)) ? udf_3 : string.Empty;
            string udf4 = (!String.IsNullOrEmpty(udf_4)) ? udf_4 : string.Empty;
            string udf5 = (!String.IsNullOrEmpty(udf_5)) ? udf_5 : string.Empty;


            string txn_details = txnagId + "|" + txnmerchantId + "|" + txnorderNumber + "|" + txnAmount + "|" + txnCountry + "|" + txnCountryCurrency + "|" + txnType + "|" + txnsuccessUrl + "|" + txnfailureUrl + "|" + txnChannel;
            string pg_details = pgId + "|" + pgPayMode + "|" + pgscheme + "|" + pgEmiMonths;
            string card_details = ccCardNo + "|" + ccExpMonth + "|" + ccexpYear + "|" + ccCvv2 + "|" + ccCardName;
            string cust_details = custName + "|" + custEmailId + "|" + custMobileNo + "|" + custUniqueId + "|" + custisLoggedIn;
            string bill_details = billAddress + "|" + billCity + "|" + billState + "|" + billCountry + "|" + billZip;
            string ship_details = shipAddress + "|" + shipCity + "|" + shipState + "|" + shipCountry + "|" + shipZip + "|" + shipDays + "|" + shipAddressCount;
            string item_details = itemCount + "|" + itemValue + "|" + itemCategory;
            string other_details = udf1 + "|" + udf2 + "|" + udf3 + "|" + udf4 + "|" + udf5;

            MyCryptoClass aes = new MyCryptoClass();
            string enc_txn_details = aes.encrypt(txn_details);
            string enc_pg_details = aes.encrypt(pg_details);
            string enc_card_details = aes.encrypt(card_details);
            string enc_cust_details = aes.encrypt(cust_details);
            string enc_bill_details = aes.encrypt(bill_details);
            string enc_ship_details = aes.encrypt(ship_details);
            string enc_item_details = aes.encrypt(item_details);
            string enc_other_details = aes.encrypt(other_details);


            NameValueCollection data = new NameValueCollection();
            data.Add("me_id", txnmerchantId);
            data.Add("txn_details", enc_txn_details);
            data.Add("pg_details", enc_pg_details);
            data.Add("card_details", enc_card_details);
            data.Add("cust_details", enc_cust_details);
            data.Add("bill_details", enc_bill_details);
            data.Add("ship_details", enc_ship_details);
            data.Add("item_details", enc_item_details);
            data.Add("other_details", enc_other_details);
            //--=======================

            string result = "";
            string[] AFields = {
                    "ag_id", "me_id", "order_no", "Amount", "Country", "Currency", "txn_type", "success_url", "failure_url", "Channel", "pg_id", "Paymode"
                    ,"Scheme", "emi_months", "card_no", "exp_month", "exp_year", "cvv", "card_name", "cust_name"
                    ,"email_id", "mobile_no", "unique_id", "is_logged_in"
                    ,"bill_address", "bill_city", "bill_state", "bill_country", "bill_zip"
                    ,"ship_address", "ship_city", "ship_state", "ship_country", "ship_zip", "ship_days", "address_count"
                    ,"item_count", "item_value", "item_category"
                    ,"udf_1", "udf_2", "udf_3", "udf_4", "udf_5", "Vpa_address"

                    ,"txn_details", "pg_details", "card_details", "cust_details", "Bill_details", "Item_details", "Other_details", "UPI_details"

                    ,"enc_txn_details", "enc_pg_details", "enc_card_details", "enc_cust_details", "enc_bill_details", "enc_ship_details", "enc_item_details", "enc_other_details"

                    ,"appid", "pgappid", "serviceid", "profileid", "creadtedon", "createdby", "modifiedon", "modifiedby", "isactive", "remarks", "data"
            };

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            decimal Amount = decimal.Parse(lblTotal.InnerText);
            decimal Portal = 0.00M;
            decimal STax = 0.00M;
            SafeXPayRequest_DT ObjRequest_DT = new SafeXPayRequest_DT();

            

            ObjRequest_DT.ag_id = ag_id;
            ObjRequest_DT.me_id = me_id;
            ObjRequest_DT.order_no = order_no;
            ObjRequest_DT.Amount = amount;
            ObjRequest_DT.Country = country;
            ObjRequest_DT.Currency = currency;
            ObjRequest_DT.txn_type = txn_type;
            ObjRequest_DT.success_url = success_url;
            ObjRequest_DT.failure_url = failure_url;
            ObjRequest_DT.Channel = channel;
            ObjRequest_DT.pg_id = pg_id;
            ObjRequest_DT.Paymode = pgPayMode;

            ObjRequest_DT.Scheme = pgscheme;
            ObjRequest_DT.emi_months = pgEmiMonths;
            ObjRequest_DT.card_no = ccCardNo;
            ObjRequest_DT.exp_month = ccExpMonth;
            ObjRequest_DT.exp_year = ccexpYear;
            ObjRequest_DT.cvv = ccCvv2;
            ObjRequest_DT.card_name = ccCardName;
            ObjRequest_DT.cust_name = cust_name;
            ObjRequest_DT.email_id = email_id;
            ObjRequest_DT.mobile_no = mobile_no;
            ObjRequest_DT.unique_id = unique_id;
            ObjRequest_DT.is_logged_in = is_logged_in;
            ObjRequest_DT.bill_address = billAddress;
            ObjRequest_DT.bill_city = billCity;
            ObjRequest_DT.bill_state = billState;
            ObjRequest_DT.bill_country = billCountry;
            ObjRequest_DT.bill_zip = billZip;
            ObjRequest_DT.ship_address = shipAddress;
            ObjRequest_DT.ship_city = shipCity;
            ObjRequest_DT.ship_state = shipState;
            ObjRequest_DT.ship_country = shipCountry;
            ObjRequest_DT.ship_zip = shipZip;
            ObjRequest_DT.ship_days = shipDays;
            ObjRequest_DT.address_count = shipAddressCount;
            ObjRequest_DT.item_count = itemCount;
            ObjRequest_DT.item_value = itemValue;
            ObjRequest_DT.item_category = itemCategory;
            ObjRequest_DT.udf_1 = udf_1;
            ObjRequest_DT.udf_2 = udf_2;
            ObjRequest_DT.udf_3 = udf_3;
            ObjRequest_DT.udf_4 = udf_4;
            ObjRequest_DT.udf_5 = udf_5;
            ObjRequest_DT.Vpa_address = "";

            ObjRequest_DT.txn_details = txn_details;
            ObjRequest_DT.pg_details = pg_details;
            ObjRequest_DT.card_details = card_details;
            ObjRequest_DT.cust_details = cust_details;
            ObjRequest_DT.Bill_details = bill_details;
            ObjRequest_DT.Item_details = item_details;
            ObjRequest_DT.Other_details = other_details;
            ObjRequest_DT.UPI_details = "";

            ObjRequest_DT.enc_txn_details = enc_txn_details;
            ObjRequest_DT.enc_pg_details = enc_pg_details;
            ObjRequest_DT.enc_card_details = enc_card_details;
            ObjRequest_DT.enc_cust_details = enc_cust_details;
            ObjRequest_DT.enc_bill_details = enc_bill_details;
            ObjRequest_DT.enc_ship_details = enc_ship_details;
            ObjRequest_DT.enc_item_details = enc_item_details;
            ObjRequest_DT.enc_other_details = enc_other_details;
            ObjRequest_DT.appid = m_AppID;
            ObjRequest_DT.pgappid = m_PgAppID;
            ObjRequest_DT.serviceid = m_ServiceID;
            ObjRequest_DT.profileid = m_ProfileId;
            ObjRequest_DT.createdby = Session["LoginID"].ToString();

            ObjRequest_DT.data = Convert.ToString(data);

            result = m_ConfirmPaymentBLL.InsertSafeXRequest(ObjRequest_DT, AFields);

            //string pgresquesturl = ConfigurationManager.AppSettings["PGRequestPayURL"].ToString();
            // string PG_Request_url = "http://5.79.69.86:9090/PG/PGReceipt.aspx";
            //string PG_Request_url = ConfigurationManager.AppSettings["PGReturnURL"].ToString();

            //string SVCD = HttpUtility.UrlEncode(KeyClass.Encrypt(m_ServiceID));
            //string AppID = HttpUtility.UrlEncode(KeyClass.Encrypt(m_AppID));
            //string amt = HttpUtility.UrlEncode(KeyClass.Encrypt(Amount.ToString()));
            //string pg_Reuest = HttpUtility.UrlEncode(KeyClass.Encrypt(PG_Request_url));
            //string PF = HttpUtility.UrlEncode(KeyClass.Encrypt(Portal.ToString()));
            //string ST = HttpUtility.UrlEncode(KeyClass.Encrypt(STax.ToString()));
            //string name = HttpUtility.UrlEncode(KeyClass.Encrypt(m_PayeeName));
            //string phone = HttpUtility.UrlEncode(KeyClass.Encrypt(m_PayeeMobile));
            //string email = HttpUtility.UrlEncode(KeyClass.Encrypt(m_PayeeEmailID));

            //2020-03-14 Old Logic for EBS PG
            //pgresquesturl = pgresquesturl + "?SvcID=" + SVCD + "&AppID=" + AppID + "&Amt=" + amt + "&ServiceTax=" + ST
            //    + "&PortalFee=" + PF + "&URL=" + pg_Reuest + "&name=" + name + "&phone=" + phone + "&email=" + email;
            
            //Response.Redirect(pgresquesturl, false);
            string PaymentURL = ConfigurationManager.AppSettings["PGURL"].ToString();
            HttpHelper.RedirectAndPOST(this.Page, PaymentURL, data);
        }

        string GetKioskID()
        {
            List<Tuple<string, string>> nvc = new List<Tuple<string, string>>();
            string culture = HttpContext.Current.Session["CurrentCulture"].ToString();
            string userType = HttpContext.Current.Session["UserType"].ToString();
            string ID = "";

            if (m_UserType == "CITIZEN")
            {
                ID = "";
                if (Request.QueryString["UID"] != null && Request.QueryString["UID"].ToString() != "")
                {
                    ID = Request.QueryString["UID"].ToString();
                }
                else
                {
                    if (Session["LoginID"] != null && Session["LoginID"].ToString() == "")
                    {
                        ID = Session["LoginID"].ToString();
                    }
                }
            }
            else if (m_UserType == "KIOSK")
            {
                ID = HttpContext.Current.Session["KioskID"].ToString();
            }


            return ID;
        }
      




    }
}