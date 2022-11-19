using CitizenPortal.Common;
using CitizenPortalLib;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using sun.java2d.cmm;
using System;
using System.Collections.Generic;
using System.Data;

namespace CitizenPortal.WebApp.Kiosk.Forms
{
    public partial class PaymentReceipt : CommonBasePage
    {
        string m_AppID, m_ServiceID, m_AckURL = "";
        PaymentReceiptBLL m_PaymentReceiptBLL = null;

        protected void btnNext_Click(object sender, EventArgs e)
        {
            string t_URL = "";

            if (m_ServiceID=="1465")
            {
                t_URL = "~/WebApp/Kiosk/MPSS/AcknowledgementEnroll.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID + "&Status=Y";
            }
            else if (m_ServiceID == "1466")
            {
                t_URL = "~/WebApp/Kiosk/MPSS/Acknowledgement.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID + "&Status=Y";
            }
            else
            {
                t_URL = "~/WebApp/Kiosk/MPSS/AcknowledgementEnroll.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID + "&Status=Y";
            }
            
                       
            Response.Redirect(t_URL);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string UserHomePage = "";
            if (Session["UserType"].ToString() == "CITIZEN")
            {
                UserHomePage = "/Default.aspx";
            }
            else
            {
                LoginBLL login = new LoginBLL();

                System.Data.DataSet dtUser = login.GetUserData(Session["LoginID"].ToString(), Session["UserType"].ToString());
                System.Data.DataTable user = dtUser.Tables[0];
                UserHomePage = user.Rows[0]["HomePage"].ToString();

            }


            Response.Redirect(UserHomePage);
            //Response.Redirect(m_AckURL + "?SvcID=" + m_ServiceID + "&AppID=" + m_AppID, false);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();
            btnHome.PostBackUrl = Session["HomePage"].ToString();

            m_PaymentReceiptBLL = new PaymentReceiptBLL();
            DataSet dt = m_PaymentReceiptBLL.GetPaymentDetail(m_ServiceID, m_AppID);

           

                if (dt != null && dt.Tables[1].Rows.Count > 0)
                {
                DataTable ApplicantDetails = dt.Tables[1];

                lblKiosk.InnerText = ApplicantDetails.Rows[0]["KioskName"].ToString();
                lblCreatedBy.InnerText = ApplicantDetails.Rows[0]["KioskID"].ToString();
                lblKioskEmail.Text = ApplicantDetails.Rows[0]["KioskEmailID"].ToString();
                lblKioskMobile.Text = ApplicantDetails.Rows[0]["KioskMobile"].ToString();

                lblBenificery.InnerText = ApplicantDetails.Rows[0]["FullName"].ToString();

                lblAppName.InnerText = ApplicantDetails.Rows[0]["FullName"].ToString();
                lblAppEmail.Text = ApplicantDetails.Rows[0]["EmailID"].ToString();
                lblAppMobile.Text = ApplicantDetails.Rows[0]["Mobile"].ToString();

                lblOffice.Text = ApplicantDetails.Rows[0]["ConcernedOffice"].ToString();
                lblOfficer.Text = ApplicantDetails.Rows[0]["DesignatedOfficer"].ToString();
                lblOfficerNo.Text = ApplicantDetails.Rows[0]["DesignatedOfficerMobile"].ToString();

               

                try
                {

                    QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);

                }
                catch { }


                ////Start: CSC SPV Recon Call
                //SPVRequestBLL m_SPVRequestBLL = new SPVRequestBLL();
                //string t_SPVRequest = "";
                //DataTable dtRecon = m_SPVRequestBLL.GetCSCBridgeRecon(m_ServiceID, m_AppID);

                //if (dtRecon.Rows.Count > 0 && dtRecon.Rows[0]["csc_txn"].ToString() != "")
                //{
                //    string t_csc_txn = dtRecon.Rows[0]["csc_txn"].ToString();
                //    string t_merchant_id = dtRecon.Rows[0]["merchant_id"].ToString();
                //    string t_csc_id = dtRecon.Rows[0]["csc_id"].ToString();
                //    string t_merchant_txn = dtRecon.Rows[0]["merchant_txn"].ToString();
                //    string t_txn_status = dtRecon.Rows[0]["txn_status"].ToString();
                //    string t_merchant_txn_date_time = dtRecon.Rows[0]["merchant_txn_date_time"].ToString();
                //    string t_product_id = dtRecon.Rows[0]["product_id"].ToString();
                //    string t_txn_amount = dtRecon.Rows[0]["txn_amount"].ToString();
                //    string t_amount_parameter = dtRecon.Rows[0]["amount_parameter"].ToString();
                //    string t_txn_mode = dtRecon.Rows[0]["txn_mode"].ToString();
                //    string t_txn_type = dtRecon.Rows[0]["txn_type"].ToString();
                //    string t_merchant_receipt_no = dtRecon.Rows[0]["merchant_receipt_no"].ToString();
                //    string t_csc_share_amount = dtRecon.Rows[0]["csc_share_amount"].ToString();
                //    string t_pay_to_email = dtRecon.Rows[0]["pay_to_email"].ToString();
                //    string t_currency = dtRecon.Rows[0]["currency"].ToString();
                //    string t_discount = dtRecon.Rows[0]["discount"].ToString();
                //    string t_param_1 = dtRecon.Rows[0]["param_1"].ToString();
                //    string t_param_2 = dtRecon.Rows[0]["param_2"].ToString();
                //    string t_param_3 = dtRecon.Rows[0]["param_3"].ToString();
                //    string t_param_4 = dtRecon.Rows[0]["param_4"].ToString();
                //    string t_txn_status_message = dtRecon.Rows[0]["txn_status_message"].ToString();
                //    string t_status_message = dtRecon.Rows[0]["status_message"].ToString();



                //    string recon_result = BridgePGUtil.recon_log(t_merchant_id, t_merchant_txn, t_csc_txn, t_csc_id,
                //           t_product_id, t_txn_amount,
                //           t_merchant_txn_date_time, t_txn_status, t_merchant_receipt_no);

                //    Dictionary<string, string> namesRecon = new Dictionary<string, string>();
                //    string[] arrRecon = recon_result.Split('|');
                //    foreach (var ar1 in arrRecon)
                //    {
                //        string[] itemArr = ar1.Split('=');
                //        if (itemArr.Length > 1)
                //        {
                //            namesRecon.Add(itemArr[0], itemArr[1]);
                //        }
                //    }

                //    string t_recon_merchant_id = namesRecon["merchant_id"];
                //    string t_recon_csc_id = t_csc_id;
                //    string t_recon_merchant_txn = namesRecon["merchant_txn"];
                //    string t_recon_merchant_txn_status = namesRecon["merchant_txn_status"];
                //    string t_recon_csc_txn = namesRecon["csc_txn"];
                //    string t_recon_recon_reference = namesRecon["recon_reference"];
                //    string t_recon_recon_log_status = namesRecon["recon_log_status"];
                //    string t_recon_param_1 = t_param_1;
                //    string t_recon_param_2 = t_param_2;


                //    CSCBridgeReconLog_DT objCSCBridgeRecon_DT = new CSCBridgeReconLog_DT();

                //    string[] aReconFields =
                //    {
                //        "SvcID"
                //        , "AppID"
                //        , "CSCID"
                //        , "merchant_id"
                //        , "merchant_txn"
                //        , "merchant_txn_status"
                //        , "csc_txn"
                //        , "recon_reference"
                //        , "recon_log_status"
                //        , "CreatedBy"
                //        , "ReconMessage"
                //    };

                //    objCSCBridgeRecon_DT.SvcID = t_recon_param_1;
                //    objCSCBridgeRecon_DT.AppID = t_recon_param_2;
                //    objCSCBridgeRecon_DT.CSCID = t_recon_csc_id;
                //    objCSCBridgeRecon_DT.merchant_id = t_recon_merchant_id;
                //    objCSCBridgeRecon_DT.merchant_txn = t_recon_merchant_txn;
                //    objCSCBridgeRecon_DT.merchant_txn_status = t_recon_merchant_txn_status;
                //    objCSCBridgeRecon_DT.csc_txn = t_recon_csc_txn;
                //    objCSCBridgeRecon_DT.recon_reference = t_recon_recon_reference;
                //    objCSCBridgeRecon_DT.recon_log_status = t_recon_recon_log_status;
                //    objCSCBridgeRecon_DT.CreatedBy = t_recon_csc_id;
                //    objCSCBridgeRecon_DT.ReconMessage = recon_result;

                //    t_SPVRequest = m_SPVRequestBLL.InsertCSCBridgeRecon(objCSCBridgeRecon_DT, aReconFields);
                //}
                //End: CSC SPV Recon Call


                if (!IsPostBack)
                {
                    CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                    string MobileNo = ApplicantDetails.Rows[0]["Mobile"].ToString();
                    string MailID = ApplicantDetails.Rows[0]["EMailID"].ToString();
                    string ProfileID = "";

                    if (MobileNo != "")
                    {
                        string smsText = ApplicantDetails.Rows[0]["smsText"].ToString();

                        //test.sendsms(MobileNo, "Payment is successful for Reference No " + m_AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
                        test.sendsms(MobileNo, smsText);
                    }

                    if (MailID != "")
                    {
                        string mailText = ApplicantDetails.Rows[0]["MailText"].ToString();
                        string bcc = ApplicantDetails.Rows[0]["Bcc"].ToString();

                        //                        mailText = @"Respected Sir,<br/><br/>
                        //As per discussion with Mr.Pinaki Mohanty (Project Coodinator, CMGI) that dept decided for the pilot run for 6 services <br/>
                        //1. Habisha Brata service is going to be LIVE as pilot on 3rd Oct, 16 <br/>
                        //2. Rest 5 Services of SSPD is going to be LIVE as pilot on 18th Oct,16.<br/>
                        //3. CM will inaugurate Common Application Portal with 5 Services (SSPD) in the first week of Nov,16 <br/>
                        //<br/>
                        //Below are the requirement before going LIVE - 
                        //<br/>
                        //Server/Hardware Details: 4 Server with details for Production<br/>
                        //1. 64 GB RAM: 1 for Web Server, 1 for Application Server, 2 for DB Server.<br/>
                        //2. 10TB Hard Disk<br/>
                        //3. Load Balancer<br/>
                        //<br/>
                        //Software related details <br/>
                        //1. SMS Gateway (We will be using our own SMS Gateway)<br/>
                        //2. E-mail Server (We will be using our own Mail Server)<br/>
                        //3. Domain Name Details (We will be using our own Domain)<br/>
                        //4. UIDAI Live Credential (For ekyc)<br/>
                        //5. Live CSC Connect Details<br/>
                        //6. Live CSC SPV Wallet Details<br/>
                        //7. Payment Gateway Details<br/>
                        //                            Thank you,<br/><br/>                            
                        //                            Regards,<br/>
                        //                            Odisha CAP Team.  <br />                            
                        //                            <br/>";

                        //CommonUtility.SendEmailWithAttachment("gunwant1984@yahoo.com", null, null, EmailTemplates.EmailSubject[EmailEvent.AccountActivation], @"<br /> Dear Sir,<br />
                        //                This is a Test mail sent from Odisha CAP Portal.<br/>
                        //                <br/>
                        //                Thank you,<br/><br/>                            
                        //                Regards,<br/>
                        //                Odisha CAP Team.  <br />                            
                        //                <br/>", true, null);


                        //CommonUtility.SendEmailWithAttachment("gunwant1984@yahoo.com", null, null, EmailTemplates.EmailSubject[EmailEvent.AccountActivation], mailText, true, null);

                        //CommonUtility.SendEmailWithAttachment("ssethi.satnam@gmail.com", null, null, EmailTemplates.EmailSubject[EmailEvent.AccountActivation], mailText, true, null);
                        //CommonUtility.SendEmailWithAttachment("satnamssethi59@gmail.com", null, null, EmailTemplates.EmailSubject[EmailEvent.AccountActivation], mailText, true, null);
                        //CommonUtility.SendEmailWithAttachment("s.singh.sabharwal@gmail.com", null, null, EmailTemplates.EmailSubject[EmailEvent.AccountActivation], mailText, true, null);


                        if (dt != null && dt.Tables[0].Rows.Count > 0)
                        {
                            DataTable AppDetails = dt.Tables[0];


                            lblAppDate.InnerText = AppDetails.Rows[0]["AppDate"].ToString();
                            //lblAppDate.InnerText = DateTime.Now.ToString();
                            lblAppID.InnerText = AppDetails.Rows[0]["AppID"].ToString();
                            lblAppName.InnerText = AppDetails.Rows[0]["AppName"].ToString();
                            //lblServiceID.InnerText = AppDetails.Rows[0]["ServiceID"].ToString();
                            lblServiceName.InnerText = AppDetails.Rows[0]["ServiceName"].ToString();
                            //lblCreatedBy.InnerText = AppDetails.Rows[0]["CreatedBy"].ToString();

                            lblDeptFee.InnerText = AppDetails.Rows[0]["Dept"].ToString();
                            lblGovtFee.InnerText = AppDetails.Rows[0]["Govt"].ToString();
                            lblPortalFee.InnerText = AppDetails.Rows[0]["PortalFee"].ToString();
                            lblOtherCharges.InnerText = AppDetails.Rows[0]["Other"].ToString();
                            lblSvcTax.InnerText = AppDetails.Rows[0]["SvcTax"].ToString();
                            lblTotal.InnerText = AppDetails.Rows[0]["Total"].ToString();

                            lblTransactionID.InnerText = AppDetails.Rows[0]["TrnID"].ToString();

                            m_AckURL = AppDetails.Rows[0]["AckURL"].ToString();
                            lblPayThrough.Text = AppDetails.Rows[0]["PayThrough"].ToString();

                            lblTransDate.InnerText = Convert.ToDateTime(AppDetails.Rows[0]["TransDate"]).ToString("dd/MM/yyyy");
                            lblAmtInText.Text = AppDetails.Rows[0]["AmtInText"].ToString();

                            if (AppDetails.Rows[0]["HideKioskOption"].ToString() == "1")
                            {
                                trKiosk1.Visible = trKiosk2.Visible = false;
                            }

                            try
                            {
                                CommonUtility.SendEmailWithAttachment(m_ServiceID, m_AppID, ProfileID, MailID, null, bcc,
                                    "Payment Confirmation for " + AppDetails.Rows[0]["ServiceName"].ToString(), mailText, true, null);
                            }
                            catch
                            {

                            }
                        }

                    }
                }
            }
            if (m_ServiceID != null)
            {
                if (m_ServiceID == "403")
                {
                    Response.Redirect("/WebApp/Kiosk/OUAT/Acknowledgement.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID, false);
                }
                else if (m_ServiceID == "409")
                {
                    Response.Redirect("/WebApp/Kiosk/OUAT/AgroFormAcknowledgement.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID, false);
                }
                else if (m_ServiceID == "405")
                {
                    Response.Redirect("/WebApp/Kiosk/OUAT/FormBAcknowledgement.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID, false);
                }
                else if (m_ServiceID == "421")
                {
                    Response.Redirect("/WebApp/Kiosk/Transport/RoadTaxReceipt.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID);
                }
                else if (m_ServiceID == "424")
                {
                    Response.Redirect("/WebApp/Kiosk/RD/Acknowledgement.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID, false);
                }
                else if (m_ServiceID == "428")
                {
                    Response.Redirect("/WebApp/Kiosk/OUAT/AgroFormBAcknowledgement.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID, false);
                }
                else if (m_ServiceID == "431")
                {
                    Response.Redirect("/WebApp/Kiosk/CCTNS/CCTNS_API_Interface.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID, false);
                }
                else if (m_ServiceID == "435")
                {
                    Response.Redirect("/WebApp/Kiosk/CCTNS/ComplaintRegistrationAck.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID, false);
                }
                else if (m_ServiceID == "429")
                {
                    Response.Redirect("/WebApp/Kiosk/CCTNS/CharacterCertikficateAcknow.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID, false);
                }
                //else if (m_ServiceID == "449")
                //{
                //    Response.Redirect("/WebApp/Kiosk/CBCS/Acknowledgement.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID, false);
                //}
            }
        }
    }
}