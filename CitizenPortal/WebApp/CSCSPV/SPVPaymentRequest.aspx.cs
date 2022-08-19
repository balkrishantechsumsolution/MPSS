using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EncryptDecrypt;
using System.Data.SqlClient;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.BLL;
using System.Data;
using System.Text;
using CitizenPortal.Common;
using CitizenPortalLib;

namespace CitizenPortal.WebApp.CSCSPV
{    
    public partial class SPVPaymentRequest : BasePage
    {
        ConfirmPaymentBLL m_ConfirmPaymentBLL = new ConfirmPaymentBLL();
        SPVRequestBLL m_SPVRequestBLL = new SPVRequestBLL();
        string m_AppID, m_ServiceID, m_OriginalAppID;
        string m_KioskID, m_OMTID;
        private string m_DepartmentFee, m_CSCAmount, m_PortalFee, m_ServiceTax;
        private string m_txn_amount, m_csc_share_amount;
        private string m_ServiceName;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            {
                if (Request.QueryString["AppID"] == null) return;
                if (Request.QueryString["SvcID"] == null) return;

                m_AppID = Request.QueryString["AppID"].ToString();
                m_ServiceID = Request.QueryString["SvcID"].ToString();
                m_OriginalAppID = m_AppID;

                m_KioskID = GetKioskID();// HttpContext.Current.Session["KioskID"].ToString();

                m_OMTID = m_KioskID; // "HR010100203";

                lblKioskID.Text = m_KioskID;
                lblOMTID.Text = m_OMTID;

                DataSet dt = m_ConfirmPaymentBLL.GetSPVPaymentDetails(m_ServiceID, m_AppID, "KIOSK");

                if (dt != null && dt.Tables[0].Rows.Count > 0)
                {
                    DataTable AppDetails = dt.Tables[0];

                    lblAppDate.Text = Convert.ToDateTime(AppDetails.Rows[0]["AppDate"]).ToString("dd/MM/yyyy");
                    lblAppID.Text = AppDetails.Rows[0]["AppID"].ToString();
                    //m_AppID = lblAppID.Text;
                    m_AppID = AppDetails.Rows[0]["AppID_New"].ToString();

                }

                if (dt != null && dt.Tables[1].Rows.Count > 0)
                {
                    DataTable FeeDetails = dt.Tables[1];

                    //lblDeptFee.InnerText = FeeDetails.Rows[0]["Dept"].ToString();
                    //lblGovtFee.InnerText = FeeDetails.Rows[0]["Govt"].ToString();
                    lblPortalFee.Text = FeeDetails.Rows[0]["PortalFee"].ToString();
                    //lblOtherCharges.InnerText = FeeDetails.Rows[0]["Other"].ToString();
                    lblSvcTax.Text = FeeDetails.Rows[0]["SvcTax"].ToString();
                    lblTotal.Text = FeeDetails.Rows[0]["Total"].ToString();
                    lblTotal2.Text = FeeDetails.Rows[0]["TotalOriginal"].ToString();

                    m_DepartmentFee = FeeDetails.Rows[0]["Dept"].ToString();
                    m_CSCAmount = FeeDetails.Rows[0]["PortalFee"].ToString();
                    m_PortalFee = FeeDetails.Rows[0]["PortalFee"].ToString();
                    m_ServiceTax = FeeDetails.Rows[0]["SvcTax"].ToString();

                    m_CSCAmount = Convert.ToDecimal(Convert.ToDecimal(m_CSCAmount) + Convert.ToDecimal(m_ServiceTax)).ToString();


                    lblTotal.Text = FeeDetails.Rows[0]["txn_amount"].ToString();
                    m_txn_amount = FeeDetails.Rows[0]["txn_amount"].ToString();
                    m_csc_share_amount = FeeDetails.Rows[0]["csc_share_amount"].ToString();
                    m_ServiceName = FeeDetails.Rows[0]["ServiceName"].ToString();

                }



                string reg_no = m_AppID;// Session["REGNO"].ToString();
                //REGNO.Value = reg_no;
                //CSCPayment();

            }
        }

        string GetKioskID()
        {
            List<Tuple<string, string>> nvc = new List<Tuple<string, string>>();
            string culture = HttpContext.Current.Session["CurrentCulture"].ToString();
            string userType = HttpContext.Current.Session["UserType"].ToString();
            string ID = "";

            if (HttpContext.Current.Session["KioskID"] != null)
            {
                ID = HttpContext.Current.Session["KioskID"].ToString();
            }
            else if (HttpContext.Current.Session["CitizenID"] != null)
            {
                ID = "50540345361840000001";
            }

            return ID;
        }

        public String rendomNumber(int length)
        {
            string numValue = "";
            Char[] chars = "0123456789".ToCharArray();
            Random random = new Random();

            for (int i = 0; i < length; i++)
            {
                numValue += chars[random.Next(chars.Length)];
            }
            return numValue;
        }

        protected void CSCPayment()
        {
            //SqlConnection con = new SqlConnection(connStr);
            //con.Open();
            //string query = "Select * from PGtest where Reg_No='" + Session["REGNO"].ToString() + "'";
            //SqlCommand cmd = new SqlCommand(query, con);
            //rdr = cmd.ExecuteReader();
            //rdr.Read();
            lblOMTID.Text = m_OMTID;
            lblregno.Text = m_AppID;// This is unique number which is generated for each and every transaction for your application purpose.
            lblamount.Text = lblTotal.Text; //rdr["Amount"].ToString();// This is amount which you have to pay with user.
            string KeyValue = "CoaPhA671Ser457E";// This your PG Key Value configured in Staging PG.

            string mid = "CAP_Odisha";//This is your MID which is configured in staging PG.
            string mitem = "Public Health and Engineering Department";//This is your MITEM which is configured in staging PG.
            string otherval = lblOMTID.Text;
            DateTime tn = DateTime.Now;
            string mrtxid = m_AppID;//This is your MRTXID(this value is created by you as per requirement or application point of view)
            HDNMTRXID.Value = mrtxid;
            //Encrypt these request parameter and send to PG
            byte[] array = System.Text.Encoding.UTF8.GetBytes(KeyValue);
            string enmtrxid = EncryptDecrypt.Encrypt(mrtxid, array);
            string enfee = EncryptDecrypt.Encrypt(lblamount.Text, array);
            string enmitem = EncryptDecrypt.Encrypt(mitem, array);
            string enotherval = EncryptDecrypt.Encrypt(otherval, array);
            string enomtid = EncryptDecrypt.Encrypt(lblOMTID.Text, array);
            //Save these parameters in Hidden Fields
            hdn_mtrxid.Value = enmtrxid;
            hdn_amount.Value = enfee;
            hdn_mid.Value = mid;
            hdn_mitem.Value = enmitem;
            hdn_othervals.Value = enotherval;
            hdn_omtid.Value = enomtid;

        }

        protected void CSCPayment_old() 
        {
            //SqlConnection con = new SqlConnection(connStr);
            //con.Open();
            //string query = "Select * from PGtest where Reg_No='" + Session["REGNO"].ToString() + "'";
            //SqlCommand cmd = new SqlCommand(query, con);
            //rdr = cmd.ExecuteReader();
            //rdr.Read();
            lblOMTID.Text = Session["Id"].ToString();
            lblregno.Text = Session["REGNO"].ToString();// This is unique number which is generated for each and every transaction for your application purpose.
            lblamount.Text = "10"; //rdr["Amount"].ToString();// This is amount which you have to pay with user.
            string KeyValue = "CoaPhA671Ser457E";// This your PG Key Value configured in Staging PG.

            string mid = "CAP_Odisha";//This is your MID which is configured in staging PG.
            string mitem = "Public Health and Engineering Department";//This is your MITEM which is configured in staging PG.
            string otherval = lblOMTID.Text;
            DateTime tn = DateTime.Now;
            string mrtxid = tn.ToFileTime().ToString();//This is your MRTXID(this value is created by you as per requirement or application point of view)
            HDNMTRXID.Value = mrtxid;
            //Encrypt these request parameter and send to PG
            byte[] array = System.Text.Encoding.UTF8.GetBytes(KeyValue);
            string enmtrxid = EncryptDecrypt.Encrypt(mrtxid, array);
            string enfee = EncryptDecrypt.Encrypt(lblamount.Text, array);
            string enmitem = EncryptDecrypt.Encrypt(mitem, array);
            string enotherval = EncryptDecrypt.Encrypt(otherval, array);
            string enomtid = EncryptDecrypt.Encrypt(lblOMTID.Text, array);
            //Save these parameters in Hidden Fields
            hdn_mtrxid.Value = enmtrxid;
            hdn_amount.Value = enfee;
            hdn_mid.Value = mid;
            hdn_mitem.Value = enmitem;
            hdn_othervals.Value = enotherval;
            hdn_omtid.Value = enomtid;

        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            //TransLogSubmit();
            CSCBridgePay();
        }

        void CSCBridgePay()
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["Connectdata"])))
            {
                BridgePGUtil objBridgePGUtil = new BridgePGUtil();
                string merchant_id = ConfigurationManager.AppSettings["MERCHANT_ID"];
                string productid = ConfigurationManager.AppSettings["product_id1"];
                string productname = ConfigurationManager.AppSettings["product_name1"];
                string csc_id = Session["KioskID"].ToString();
                string txn_amount = m_txn_amount;//m_DepartmentFee;
                string csc_share_amount = m_csc_share_amount;
                string param1 = m_ServiceID;
                string param2 = m_OriginalAppID;
                string param3 = m_ServiceName;
                string param4 = "";
                string csc_email = Session["CSCEmail"].ToString();

                string merchant_receipt_no = merchant_id + DateTime.Now.Year.ToString().PadLeft(4, '0') +
                                             DateTime.Now.Month.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Day.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Hour.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Minute.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Second.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Millisecond.ToString().PadLeft(4, '0');
                merchant_receipt_no = merchant_receipt_no + "_" + m_OriginalAppID;

                string return_url = ConfigurationManager.AppSettings["SUCCESS_URL"];
                string cancel_url = ConfigurationManager.AppSettings["FAILURE_URL"];

                string message = objBridgePGUtil.CreateMessage(merchant_id, csc_id, txn_amount, csc_share_amount,
                    merchant_receipt_no, return_url, cancel_url, productid, productname, param1, param2, param3, param4, "", csc_email);

                string[] AFields =
                {
                    "CSCID",
                    "CSC_Email",
                    "SvcID",
                    "AppID",
                    "Merchant_ID",
                    "Merchant_Receipt_No",
                    "ProductID",
                    "ProductName",
                    "Txn_Amount",
                    "DepartmentFee",
                    "CSC_Share_Amount",
                    "PortalFee",
                    "SvcTax",
                    "Param1",
                    "Param2",
                    "Param3",
                    "Param4",
                    "RequestMessage",
                    "CreatedBy"
                };

                string t_SPVRequest = "";
                CSCBridgeRequest_DT objCSCBridgeRequest_DT = new CSCBridgeRequest_DT();
                objCSCBridgeRequest_DT.CSCID = csc_id;
                objCSCBridgeRequest_DT.CSC_Email = csc_email;
                objCSCBridgeRequest_DT.SvcID = m_ServiceID;
                objCSCBridgeRequest_DT.AppID = m_OriginalAppID;
                objCSCBridgeRequest_DT.Merchant_ID = merchant_id;
                objCSCBridgeRequest_DT.Merchant_Receipt_No = merchant_receipt_no;
                objCSCBridgeRequest_DT.ProductID = productid;
                objCSCBridgeRequest_DT.ProductName = productname;
                objCSCBridgeRequest_DT.Txn_Amount = txn_amount;
                objCSCBridgeRequest_DT.DepartmentFee = m_DepartmentFee;
                objCSCBridgeRequest_DT.CSC_Share_Amount = csc_share_amount;
                objCSCBridgeRequest_DT.PortalFee = m_PortalFee;
                objCSCBridgeRequest_DT.SvcTax = m_ServiceTax;
                objCSCBridgeRequest_DT.Param1 = param1;
                objCSCBridgeRequest_DT.Param2 = param2;
                objCSCBridgeRequest_DT.Param3 = param3;
                objCSCBridgeRequest_DT.Param4 = param4;
                objCSCBridgeRequest_DT.RequestMessage = message;
                objCSCBridgeRequest_DT.CreatedBy = csc_id;


                t_SPVRequest = m_SPVRequestBLL.InsertCSCBridgeRequest(objCSCBridgeRequest_DT, AFields);


                message = ConfigurationManager.AppSettings["MERCHANT_ID"] + "|" + message;
                Response.Clear();
                StringBuilder sb = new StringBuilder();
                sb.Append("<html>");
                sb.AppendFormat(@"<body onload='document.forms[""form""].submit()'>");
                sb.AppendFormat("<form name='form' action='{0}' method='post'>", objBridgePGUtil.CreateURLappendString());
                sb.AppendFormat("<input type='hidden' name='message' value='{0}'>", message);
                // Other params go here
                sb.Append("</form>");
                sb.Append("</body>");
                sb.Append("</html>");
                Response.Write(sb.ToString());
                Response.End();


            }
            else
            {
                Response.Write("Null Session  Go fro Home Page");
            }
        }

        protected void TransLogSubmit()
        {

            string mid = "CAP_Odisha";
            string mitem = "Public Health and Engineering Department";

            //SqlConnection con = new SqlConnection(connStr);
            //SqlCommand cmd = null;
            //cmd = con.CreateCommand();
            //SqlTransaction trans = null;
            try
            {
                string t_SPVRequest = "";
                SPVRequest_DT objSPVRequest_DT = new SPVRequest_DT();
                string[] AFields = {
                        "AppID"
                        ,"ServiceID"
                        ,"Trans_No"
                        ,"Reg_No"
                        ,"mrtxid"
                        ,"amount"
                        ,"mid"
                        ,"mitem"
                        ,"othervals"
                        ,"smer"
                        //,"oxitrxid"
                        ,"trxstatus"
                        ,"doublverstatus"
                        ,"pay_status"
                        ,"vleid"
                        //,"Cr_date"
                        //,"Trans_date"
                        ,"CreatedBy"
                        ,"CreatedOn"
                    };

                DateTime tn = DateTime.Now;
                string Trans = m_AppID;

                objSPVRequest_DT.AppID = m_OriginalAppID;
                objSPVRequest_DT.ServiceID = m_ServiceID;

                objSPVRequest_DT.Trans_No = Trans;
                objSPVRequest_DT.Reg_No = m_AppID;
                objSPVRequest_DT.mrtxid = HDNMTRXID.Value;
                objSPVRequest_DT.amount = lblamount.Text.Trim();
                objSPVRequest_DT.mid = mid;
                objSPVRequest_DT.mitem = mitem;
                objSPVRequest_DT.othervals = m_OMTID;
                objSPVRequest_DT.smer = HDNSMER.Value;
                //objSPVRequest_DT.oxitrxid = m_OMTID;
                objSPVRequest_DT.trxstatus = "N"; 
                objSPVRequest_DT.doublverstatus = "N";
                objSPVRequest_DT.pay_status = "N";
                objSPVRequest_DT.vleid = m_OMTID;
                objSPVRequest_DT.CreatedBy = m_KioskID;
                objSPVRequest_DT.CreatedOn = tn;

                t_SPVRequest = m_SPVRequestBLL.InsertV3(objSPVRequest_DT, AFields);

                //con.Open();
                //trans = con.BeginTransaction();
                //cmd.Transaction = trans;
                //DateTime tn = DateTime.Now;
                //string Trans = tn.ToFileTime().ToString();

                //cmd.CommandText = "Insert_Transactions_Master";
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@Trans_No", SqlDbType.VarChar).Value = Trans;
                //cmd.Parameters.AddWithValue("@Reg_No", SqlDbType.VarChar).Value = Session["RegNo"].ToString();
                //cmd.Parameters.AddWithValue("@mrtxid", SqlDbType.VarChar).Value = HDNMTRXID.Value;
                //cmd.Parameters.AddWithValue("@amount", SqlDbType.VarChar).Value = lblamount.Text.Trim();
                //cmd.Parameters.AddWithValue("@mid", SqlDbType.VarChar).Value = mid;
                //cmd.Parameters.AddWithValue("@mitem", SqlDbType.VarChar).Value = mitem;
                //cmd.Parameters.AddWithValue("@othervals", SqlDbType.VarChar).Value = Session["Id"].ToString();
                //cmd.Parameters.AddWithValue("@smer", SqlDbType.VarChar).Value = HDNSMER.Value;
                //cmd.Parameters.AddWithValue("@vleid", SqlDbType.VarChar).Value = Session["Id"].ToString();
                //cmd.Parameters.AddWithValue("@trxstatus", SqlDbType.VarChar).Value = "N";
                //cmd.Parameters.AddWithValue("@doublverstatus", SqlDbType.VarChar).Value = "N";
                //cmd.Parameters.AddWithValue("@pay_status", SqlDbType.VarChar).Value = "N";
                //cmd.ExecuteNonQuery();
                //trans.Commit();

                RemotePost myremotepost = new RemotePost();
                //myremotepost.Url = "http://103.253.36.55:8082/PaymentGateway.aspx"; //for staging server
                myremotepost.Url = "http://wallet.csc.gov.in/PaymentGateway.aspx"; // for live server
                myremotepost.Add("mtrxid", hdn_mtrxid.Value);
                myremotepost.Add("mid", hdn_mid.Value);
                myremotepost.Add("mitem", hdn_mitem.Value);
                myremotepost.Add("amount", hdn_amount.Value);
                myremotepost.Add("othervals", hdn_othervals.Value);
                myremotepost.Add("omtid", hdn_omtid.Value);
                myremotepost.Post();
                
            }
            catch (Exception ee)
            {
                //trans.Rollback();
                string msg = ee.Message;

            }
            finally
            {
                //trans.Dispose();
                //con.Dispose();
                //con.Close();

            }
        }
    }
}