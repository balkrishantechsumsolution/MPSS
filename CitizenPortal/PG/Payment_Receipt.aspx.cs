using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortal.Models;


namespace CitizenPortal.PG
{
    public partial class Payment_Receipt : System.Web.UI.Page
    {
        string pgReturnUrl = "";
        string pgstatus = "";
        string serviceid, Appid, Passkey, Paymentmode, Transdt, Transamt, TransId, Pgname;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (this.MasterPageFile == "../Master/Empty.Master")
            //    {
            //        divsms.Visible = true;
            //        lblsms.Text = "Invalid Request Parameter!!!";//receive null then
            //        table_div.Visible = false;
            //        return;
            //    } 
            string m_PGSequence;// m_ServiceID;
            string m_pgstatus;
            string m_ServiceID;
            //  Request.QueryString["SvcID"] == null ||(Request.QueryString["SvcID"] == ""||
            if (Request.QueryString["SvcID"] == null || Request.QueryString["TransID"] == null ||  Request.QueryString["Status"] == null)
            {
                divsms.Visible = true;
                lblsms.Text = "Invalid Request Parameter !!";//receive null then
                table_div.Visible = false;
                return;
            }
            if (Request.QueryString["SvcID"] == "" || Request.QueryString["TransID"] == "" ||  Request.QueryString["Status"] == "" )
            {
                divsms.Visible = true;
                lblsms.Text = "Blank Request Parameter !!";//recieve blank then
                table_div.Visible = false;
                return;
            }

            string Mobile = "", smsText = "";

            //if (Request.QueryString["PGSequence"] == null) return;
            //if(Request.QueryString["Status"]== null) return;
            // if (Request.QueryString["SvcID"] == null) return;
            m_ServiceID =KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["SvcID"]));
            m_PGSequence =KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["TransID"]));
            m_pgstatus =KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["Status"]));
           
            
           

          
            DataSet ds1 = GetAccountList(m_PGSequence);
            if(ds1== null)
            {
                divsms.Visible = true;
                lblsms.Text = "Record Not Found";
                table_div.Visible = false;
                return;

               
            }
            if (ds1.Tables[0].Rows.Count > 0)
            {
                lblRefernceNo.InnerText = ds1.Tables[0].Rows[0]["ReferenceNo"].ToString();
                lblServiceName.InnerText = ds1.Tables[0].Rows[0]["SvcName"].ToString();
                lblUserName.InnerText = "";//ds1.Tables[0].Rows[0]["ReferenceNo"].ToString();
                lblpaymentdate.InnerText = ds1.Tables[0].Rows[0]["Bank_TransDate"].ToString();
                lblEmailid.InnerText = "";//ds1.Tables[0].Rows[0]["ReferenceNo"].ToString();
                lblMobile.InnerText = ""; //ds1.Tables[0].Rows[0]["ReferenceNo"].ToString();
                lblBankRefNo.InnerText = ds1.Tables[0].Rows[0]["ReferenceNo"].ToString();
                lblAmt.InnerText = ds1.Tables[0].Rows[0]["Bank_TotalAmt"].ToString();
                lblPaymentMode.InnerText = ds1.Tables[0].Rows[0]["Bank_PaymentMode"].ToString();
                if(m_pgstatus =="PG006")
                {
                    lblResponestatus.InnerText = "Transaction Already Paid";//TODO: To be improved further, as this case will never arise again.
                    pgstatus = lblResponestatus.InnerText;
                }
                else
                { lblResponestatus.InnerText = ds1.Tables[0].Rows[0]["Description"].ToString();
                    pgstatus = lblResponestatus.InnerText;
                }
                lblPaymentGateway.InnerText = ds1.Tables[0].Rows[0]["PGName"].ToString();
                pgReturnUrl = ds1.Tables[0].Rows[0]["PGRetrunURL"].ToString();
                serviceid  = ds1.Tables[0].Rows[0]["ServiceID"].ToString();
                Appid = ds1.Tables[0].Rows[0]["AppID"].ToString();
                Passkey = "";//ds1.Tables[0].Rows[0]["PGRetrunURL"].ToString();
                Paymentmode = ds1.Tables[0].Rows[0]["Bank_PaymentMode"].ToString();
                Transdt = ds1.Tables[0].Rows[0]["Bank_TransDate"].ToString();
                Transamt = ds1.Tables[0].Rows[0]["Bank_TotalAmt"].ToString();
                Pgname = ds1.Tables[0].Rows[0]["PGName"].ToString(); ;
                TransId= ds1.Tables[0].Rows[0]["ReferenceNo"].ToString(); 

                Mobile = ds1.Tables[0].Rows[0]["Mobile"].ToString();
                smsText = ds1.Tables[0].Rows[0]["smsText"].ToString();

                //lblClient.Enabled = true;
                //lblClient.Text = Convert.ToString(ds.Tables[0].Columns[0]);
                //lblBranch.Text = Convert.ToString(ds.Tables[0].Columns["Bname"]);


            }
            else
            {
                Response.Write("Record are not found");
                return;
            }


            if (!IsPostBack)
            {
                CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                string MobileNo = Mobile;

                if (MobileNo != "")
                {
                    //string smsText = smsText;

                    //test.sendsms(MobileNo, "Payment is successful for Reference No " + m_AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
                    //test.sendsms(MobileNo, smsText);
                }
            }
            

            // m_ServiceID = Request.QueryString["SvcID"].ToString();
        }
        // string pgreturnurl = pgReturnUrl;
       // pgreturnurl = pgReturnUrl;
        protected DataSet GetAccountList(string Pgsequence)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("GetPaymentReciept", con);
            cmd.Parameters.AddWithValue("@PgsequenceNo", Pgsequence);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            return ds;

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            string SVCID = HttpUtility.UrlEncode(KeyClass.Encrypt(serviceid));
            string REFNO = HttpUtility.UrlEncode(KeyClass.Encrypt(TransId));
            string PG_Status = HttpUtility.UrlEncode(KeyClass.Encrypt(pgstatus));
            string appid = HttpUtility.UrlEncode(KeyClass.Encrypt(Appid));
            string PKey = HttpUtility.UrlEncode(KeyClass.Encrypt(Passkey));
            string td = HttpUtility.UrlEncode(KeyClass.Encrypt(Transdt));
            string tamt = HttpUtility.UrlEncode(KeyClass.Encrypt(Transamt));
            string pm = HttpUtility.UrlEncode(KeyClass.Encrypt(Paymentmode));
            string pname = HttpUtility.UrlEncode(KeyClass.Encrypt(Pgname));

            //// string  pg
            //string url = pgReturnUrl + "?ServiceId=" + SVCID + "&ApplicationId=" + appid + "&PassKey=" + PKey + "&Transid=" + REFNO + "&TransDt=" + td + "&TransAmount=" + tamt + "&PaymentMode=" + pm + "&PGName" + pname + "&Status=" + PG_Status;
            ////string url = "http://5.79.69.86:9090/g2c/forms/index.aspx";
            //Response.Redirect(url);


            Response.Redirect("/WebApp/Kiosk/Forms/PaymentReceipt.aspx?SvcID=" + serviceid + "&AppID=" + Appid + "&PassKey=" + PKey + "&Transid=" + REFNO + "&TransDt=" + td + "&TransAmount=" + tamt + "&PaymentMode=" + pm + "&PGName" + pname + "&Status=" + PG_Status);

        }

    }
}