using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortal.Models;
using System.Net.Http;
using System.Threading.Tasks;
using System.Net.Http.Headers;
using System.Net;
using Newtonsoft.Json;
using System.IO;

namespace CitizenPortal.PG
{
    public partial class PGReport : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }
        static HttpClient client = new HttpClient();
        DataBaseContext objd = new DataBaseContext();
        List<PgResultVerifyApi> PgList = new List<PgResultVerifyApi>();
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            grdAccount.Visible = false;
            DataTable dt = GetDetailthroughAppId(txtAppID.Text);
            GVSearchItem.Visible = true;
            GVSearchItem.DataSource = dt;
            GVSearchItem.DataBind();
        }
        
        protected void GVSearchItem_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            grdAccount.Visible = false;
            if (e.CommandName == "API")
            {
                string app = e.CommandArgument.ToString();
                // string url = "https://eazypay.icicibank.com/EazyPGVerify?ezpaytranid=&amount=&paymentmode=&merchantid=123279&trandate=&pgreferenceno=" + app;
                // getdetail(url);
                //RunAsync(url).Wait();
                HttpClient client = new HttpClient();
                client.BaseAddress = new Uri("https://eazypay.icicibank.com/");
                // Add an Accept header for JSON format.  
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                // List all Names.  
                HttpResponseMessage response = client.GetAsync("EazyPGVerify?ezpaytranid=&amount=&paymentmode=&merchantid=123279&trandate=&pgreferenceno=" + app).Result;  // Blocking call!  
                if (response.IsSuccessStatusCode)
                {
                    var products = response.Content.ReadAsStringAsync().Result;
                    var data = products.Split('&');
                    var Status = data[0].Split('=');
                    var id = data[1].Split('=');
                    var amt = data[2].Split('=');
                    var trandate = data[3].Split('=');
                    var referenceno = data[4].Split('=');
                    var sdt = data[5].Split('=');
                    PgResultVerifyApi Model = new PgResultVerifyApi();
                    Model.status = Status[1];
                    Model.ezpaytranid = id[1];
                    Model.amount = amt[1];
                    Model.trandate = trandate[1];
                    Model.pgreferenceno = referenceno[1];
                    Model.sdt = sdt[1];
                    Model.IsActive = true;
                    Model.CreatedOn = System.DateTime.Now;
                    Model.AppID = txtAppID.Text;
                    Model.IsProcess = null;
                    Model.ProcessDate = null;
                    objd.PgResultVerifyApis.Add(Model);
                    objd.SaveChanges();

                    DataTable dT1 = GetDetailAppId(txtAppID.Text);
                    grdAccount.Visible = true;
                    grdAccount.DataSource = dT1;
                    grdAccount.DataBind();
                }
                else
                {

                    //Console.WriteLine("{0} ({1})", (int)response.StatusCode, response.ReasonPhrase);
                }

            }
        }

        protected void grdAccountItem_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Manage")
            {

                string[] arg = new string[7];
                arg = e.CommandArgument.ToString().Split(';');
                string status = arg[0];
                string EzaypayID = arg[1];
                string Amt = arg[2];
                string TransDate = arg[3];
                string PGReference = arg[4];
                string sdt = arg[5];
                string Appid = arg[6];

                if (status == "Success" && sdt != " ")
                {
                    DataTable dt3 = GetDetailPgResponsethroughAppId(Appid, PGReference);
                    //for single record  
                    if (dt3 == null)
                    {
                        if (dt3.Rows.Count == 0)
                        {
                            DataTable Dt2 = GetDetailPGrefrenceID(PGReference);

                            string ServiceID = Dt2.Rows[0]["ServiceID"].ToString();
                            string AppID = Dt2.Rows[0]["AppID"].ToString();
                            string Bank_ResponseCode = "E000";
                            string Bank_UniqueRefNumber = EzaypayID;
                            string Bank_ServiceTax = "";
                            string Bank_ProcessFee = "";
                            string Bank_TotalAmt = Amt;
                            string Bank_TransactionAmt = Dt2.Rows[0]["Amount"].ToString();
                            string Bank_TransDate = TransDate;
                            string Bank_Interchangevalue = "";
                            string Bank_TDR = "";
                            string Bank_PaymentMode = "";
                            string Bank_SubMerchantId = "654";
                            string BANK_ReferenceNo = PGReference;
                            string Bank_MerchantId = "123279";
                            string Bank_RS = "";
                            string Bank_TPS = "";
                            string ReferenceNo = PGReference;
                            string Bank_ResponseString = "";
                            string Param1 = "";
                            string Param2 = "";
                            string Param3 = "";
                            string Param4 = "";
                            string Param5 = "";
                            int IsActive = 1;
                            string Createdby = "";
                            string CreatedOn = "";
                            string Modifiedby = "";
                            string ModifiedOn = "";
                            string SettlementDate = sdt;
                            string SettlementStatus = status;
                            int IsManuallyProcessed = 1;
                            InsertLog(ServiceID, AppID, ReferenceNo, Bank_ResponseCode, Bank_UniqueRefNumber, Bank_ServiceTax, Bank_ProcessFee, Bank_TotalAmt, Bank_TransactionAmt, Bank_TransDate, Bank_Interchangevalue, Bank_TDR, Bank_PaymentMode, Bank_SubMerchantId, BANK_ReferenceNo, Bank_MerchantId, Bank_RS, Bank_TPS, Bank_ResponseString, Param1, Param2, Param3, Param4, Param5, IsActive, Createdby, CreatedOn, Modifiedby, ModifiedOn, SettlementDate, SettlementStatus, IsManuallyProcessed);

                        }
                    }

                }



            }
            else
            {
                lblMsg.Text = "Already Exist In Tb";

            }
        }


        protected DataTable GetDetailPgResponsethroughAppId(string Appid, string PgRefrenceNo)
        {

            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("GetProcResponseTbPgID", con);
            cmd.Parameters.AddWithValue("@Appid", Appid);
            cmd.Parameters.AddWithValue("@PGId", PgRefrenceNo);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            da.Fill(ds);
            con.Close();
            return ds;

        }
        protected DataTable GetDetailthroughAppId(string Appid)
        {

            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("GetDetailAppid", con);
            cmd.Parameters.AddWithValue("@Appid", Appid);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            da.Fill(ds);
            con.Close();
            return ds;

        }
        protected DataTable GetDetailAppId(string Appid)
        {

            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("GetdDetailbankresponseICICIList", con);
            cmd.Parameters.AddWithValue("@Appid", Appid);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            da.Fill(ds);
            con.Close();
            return ds;

        }

        protected DataTable GetDetailPGrefrenceID(string PGSequenceNo)
        {

            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("GetProcPGDetailPgID", con);
            cmd.Parameters.AddWithValue("@PGSequenceNo", PGSequenceNo);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            da.Fill(ds);
            con.Close();
            return ds;

        }
        protected bool InsertLog(string ServiceID, string AppID, string ReferenceNo, string Bank_ResponseCode, string Bank_UniqueRefNumber, string Bank_ServiceTax, string Bank_ProcessFee, string Bank_TotalAmt, string Bank_TransactionAmt, string Bank_TransDate, string Bank_Interchangevalue, string Bank_TDR, string Bank_PaymentMode, string Bank_SubMerchantId, string BANK_ReferenceNo, string Bank_MerchantId, string Bank_RS, string Bank_TPS, string Bank_ResponseString, string Param1, string Param2, string Param3, string Param4, string Param5, int IsActive, string Createdby, string CreatedOn, string Modifiedby, string ModifiedOn, string SettlementDate, string SettlementStatus, int IsManuallyProcessed)
        {

            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);

            SqlCommand cmd = null;
            //  cmd = con.CreateCommand();
            cmd = new SqlCommand("PGResponseManualSP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ServiceID", ServiceID);
            cmd.Parameters.AddWithValue("@AppID", AppID);
            cmd.Parameters.AddWithValue("@ReferenceNo", ReferenceNo);
            cmd.Parameters.AddWithValue("@Bank_ResponseCode", Bank_ResponseCode);
            cmd.Parameters.AddWithValue("@Bank_UniqueRefNumber", Bank_UniqueRefNumber);
            cmd.Parameters.AddWithValue("@Bank_ServiceTax", Bank_ServiceTax);
            cmd.Parameters.AddWithValue("@Bank_ProcessFee", Bank_ProcessFee);
            cmd.Parameters.AddWithValue("@Bank_TotalAmt", Bank_TotalAmt);
            cmd.Parameters.AddWithValue("@Bank_TransactionAmt", Bank_TransactionAmt);
            cmd.Parameters.AddWithValue("@Bank_TransDate", Bank_TransDate);
            cmd.Parameters.AddWithValue("@Bank_Interchangevalue", Bank_Interchangevalue);
            cmd.Parameters.AddWithValue("@Bank_TDR", Bank_TDR);
            cmd.Parameters.AddWithValue("@Bank_PaymentMode", Bank_PaymentMode);
            cmd.Parameters.AddWithValue("@Bank_SubMerchantId", Bank_SubMerchantId);
            cmd.Parameters.AddWithValue("@BANK_ReferenceNo", BANK_ReferenceNo);
            cmd.Parameters.AddWithValue("@Bank_MerchantId", Bank_MerchantId);
            cmd.Parameters.AddWithValue("@Bank_RS", Bank_RS);
            cmd.Parameters.AddWithValue("@Bank_TPS", Bank_TPS);
            cmd.Parameters.AddWithValue("@Bank_ResponseString", Bank_ResponseString);
            cmd.Parameters.AddWithValue("@Param1", Param1);
            cmd.Parameters.AddWithValue("@Param2", Param2);
            cmd.Parameters.AddWithValue("@Param3", Param3);
            cmd.Parameters.AddWithValue("@Param4", Param4);
            cmd.Parameters.AddWithValue("@Param5", Param5);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@Createdby", Createdby);
            cmd.Parameters.AddWithValue("@CreatedOn", CreatedOn);
            cmd.Parameters.AddWithValue("@Modifiedby", Modifiedby);
            cmd.Parameters.AddWithValue("@ModifiedOn", ModifiedOn);
            cmd.Parameters.AddWithValue("@SettlementDate", SettlementDate);
            cmd.Parameters.AddWithValue("@SettlementStatus", SettlementStatus);
            cmd.Parameters.AddWithValue("@IsManuallyProcessed", IsManuallyProcessed);
            cmd.Parameters.AddWithValue("@flag", 2);
            //SqlTransaction trans = null;
            try
            {

                con.Open();
                // trans = con.BeginTransaction();
                // cmd.Transaction = trans;


                cmd.ExecuteNonQuery();
                // trans.Commit();

                return true;


            }
            catch (Exception ex)
            {
                // trans.Rollback();
                return false;

            }
            finally
            {
                // trans.Dispose();
                // con.Dispose();
                con.Close();

            }


        }

    }
}