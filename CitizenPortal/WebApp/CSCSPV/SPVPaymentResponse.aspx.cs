using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace CitizenPortal.WebApp.CSCSPV
{
    public partial class SPVPaymentResponse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String oxitrxid = Request.Form["oxitrxid"];//This is response parameter from PG
                String mtrxid1 = Request.Form["mtrxid"];//This is your mtrxid which PG can response back to you.
                String trxstatus = Request.Form["trxstatus"];//This is first txn status from PG its 0 or 1(0 for success and 1 for failure)
                String trxmsg = Request.Form["trxmsg"];//This is txn message from PG its Success.
                String paidamt = Request.Form["paidamt"];//This is your amount which PG can response back to you.

                String KeyValue = "CoaPhA671Ser457E";
                String DecryptedData = string.Empty;
                byte[] array = System.Text.Encoding.UTF8.GetBytes(KeyValue);

                String deoxitrxid = EncryptDecrypt.Decrypt(oxitrxid, array);
                String demtrxid1 = EncryptDecrypt.Decrypt(mtrxid1, array);
                String detrxstatus = EncryptDecrypt.Decrypt(trxstatus, array);
                String detrxmsg = EncryptDecrypt.Decrypt(trxmsg, array);
                String depaidamt = EncryptDecrypt.Decrypt(paidamt, array);

                SPVRequestBLL t_SPVRequestBLL = new SPVRequestBLL();
                ConfirmPaymentBLL t_ConfirmPaymentBLL = new ConfirmPaymentBLL();


                // if your txn status is 0 then you can proceed this txn to double verification otherwise not.
                if (detrxstatus.Equals("0"))
                {
                    DataTable dt = t_SPVRequestBLL.GetAppDetails(demtrxid1);

                    string t_OMTID = dt.Rows[0]["vleid"].ToString();
                    string t_AppID = dt.Rows[0]["AppID"].ToString();
                    string t_ServiceID = dt.Rows[0]["ServiceID"].ToString();
                    string t_CreatedBy = dt.Rows[0]["CreatedBy"].ToString();

                    //Update txn status,oxitrxid in your transaction table.
                    bool chk = UpdateLog("update Transactions_Master set trxstatus='Y',trxmsg='" + detrxmsg + "',oxitrxid='" + deoxitrxid + "' where IsActive = 1 And mrtxid='" + demtrxid1 + "'");
                    if (chk == true)
                    {
                        //Encrypt the required data and request for double verification
                        string encdata = "oxitrxid|" + oxitrxid + "&mtrxid|" + mtrxid1 + "&paidamt|" + paidamt;
                        string Encdata = EncryptDecrypt.Encrypt(encdata, array);

                        //Then you can request the double verification URL with your encrypted MID.
                        //WebRequest myWebRequest = WebRequest.Create("http://103.253.36.55:8082/DV/Default.aspx?Encdata=" + Encdata + "&mid=COAP_Orissa"); //for staging server
                        WebRequest myWebRequest = WebRequest.Create("http://wallet.csc.gov.in/DV/Default.aspx?Encdata=" + Encdata + "&mid=CAP_Odisha");

                        WebResponse myWebResponse = myWebRequest.GetResponse();
                        XmlDocument doc = new XmlDocument();
                        doc.Load(myWebResponse.GetResponseStream());

                        XmlNode root1 = doc.DocumentElement.SelectSingleNode("//mtrxid");
                        XmlNode root2 = doc.DocumentElement.SelectSingleNode("//oxitrxid");
                        XmlNode root3 = doc.DocumentElement.SelectSingleNode("//trxstatus");
                        XmlNode root4 = doc.DocumentElement.SelectSingleNode("//trxmsg");
                        XmlNode root5 = doc.DocumentElement.SelectSingleNode("//paidamt");

                        //If trxstatus is 0 then txn is successfull otherwise not.
                        if (Convert.ToInt32(root3.InnerText.ToString()) == 0)
                        {
                            //if Double Verification is successfull then update your transaction table.
                            string dvupdate = "update Transactions_Master set doublverstatus='Y',pay_status='Y',Trans_date=getdate() where IsActive = 1 And mrtxid='" + demtrxid1 + "'";
                            bool payfinal = UpdateLog(dvupdate);
                            //bool payfinal = true;
                            if (payfinal == true)
                            {
                                string[] AFields = {
                                    "Service_ID"
                                    , "AppID"
                                    , "CreatedBy"
                                    , "SPVReferenceNo"
                                };

                                Transaction_DT objTransaction_DT = new Transaction_DT();
                                objTransaction_DT.CreatedBy = t_CreatedBy;                                
                                objTransaction_DT.Service_ID = t_ServiceID;
                                objTransaction_DT.AppID = t_AppID;
                                objTransaction_DT.SPVReferenceNo = deoxitrxid;


                                t_ConfirmPaymentBLL.InsertSPVWalletTransaction(objTransaction_DT, AFields);

                                //This is successfull message to show to user
                                lblAmt.Text = root5.InnerText.ToString();
                                //lblCSCID.Text = Session["Id"].ToString();
                                //lblregno.Text = Session["REGNO"].ToString();
                                lblCSCID.Text = t_OMTID;
                                lblregno.Text = demtrxid1;
                                lbldate.Text = DateTime.Now.Date.ToLongDateString();
                                TransID.Text = root2.InnerText.ToString();
                                string msg = "Transaction is Successfull";
                                lblmsg.Text = msg;

                                Response.Redirect("/WebApp/Kiosk/Forms/PaymentReceipt.aspx?SvcID=" + t_ServiceID + "&AppID=" + t_AppID);


                            }

                        }

                        else
                        {

                            string DV = "Error: UnSuccessful Transaction (Failure in Double verification)";
                            lblmsg.Text = DV;


                        }
                    }

                }


                else
                {

                    lblmsg.Text = detrxmsg;


                }


            }
        }
        protected bool UpdateLog(string UpdateQry)
        {

            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);

            SqlCommand cmd = null;
            cmd = con.CreateCommand();
            SqlTransaction trans = null;
            try
            {

                con.Open();
                trans = con.BeginTransaction();
                cmd.Transaction = trans;
                cmd.CommandText = UpdateQry;
                cmd.CommandType = CommandType.Text;

                cmd.ExecuteNonQuery();
                trans.Commit();

                return true;


            }
            catch (Exception ee)
            {
                trans.Rollback();
                return false;

            }
            finally
            {
                trans.Dispose();
                con.Dispose();
                con.Close();

            }


        }
    }
}