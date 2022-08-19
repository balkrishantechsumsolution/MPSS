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
using System.Net.Http.Headers;

namespace CitizenPortal.PG
{
    public partial class PGMaintain : System.Web.UI.Page
    {
        DataBaseContext objd = new DataBaseContext();

        protected void Page_Load(object sender, EventArgs e)
        {

            DataTable SuccessTable = GetProcSuccessList();
            gvSuccesss.DataSource = SuccessTable;
            gvSuccesss.DataBind();

        }
        protected DataTable GetProcUnpaidList()
        {

            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("GetProcPgRequestSp", con);
            cmd.Parameters.AddWithValue("@flag", 1);
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
        protected DataTable GetProcSuccessList()
        {

            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("GetProcSuccessResponseSP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            da.Fill(ds);
            con.Close();
            return ds;

        }



        protected void btnSuccess_Click(object sender, EventArgs e)
        {
            DataTable SuccessTable = GetProcSuccessList();
            for (int j = 0; j < SuccessTable.Rows.Count; j++)
            {

                if (SuccessTable.Rows[j]["Pgstatus"].ToString() == "Success" && SuccessTable.Rows[j]["sdt"].ToString() != " ")
                {
                    DataTable dt3 = GetDetailPgResponsethroughAppId(SuccessTable.Rows[j]["AppID"].ToString(), SuccessTable.Rows[j]["pgreferenceno"].ToString());
                    
                       if (dt3.Rows.Count == 0)
                        {
                            DataTable Dt2 = GetDetailPGrefrenceID(SuccessTable.Rows[j]["pgreferenceno"].ToString(), SuccessTable.Rows[j]["AppID"].ToString());

                            string ServiceID = Dt2.Rows[0]["ServiceID"].ToString();
                            string AppID = Dt2.Rows[0]["AppID"].ToString();
                            string Bank_ResponseCode = "E000";
                            string Bank_UniqueRefNumber = SuccessTable.Rows[j]["ezpaytranid"].ToString();
                            string Bank_ServiceTax = "";
                            string Bank_ProcessFee = "";
                            string Bank_TotalAmt = SuccessTable.Rows[j]["amount"].ToString(); 
                            string Bank_TransactionAmt = Dt2.Rows[0]["amount"].ToString();
                            string Bank_TransDate = SuccessTable.Rows[j]["trandate"].ToString();
                            string Bank_Interchangevalue = "";
                            string Bank_TDR = "";
                            string Bank_PaymentMode = "";
                            string Bank_SubMerchantId = "654";
                            string BANK_ReferenceNo = SuccessTable.Rows[j]["pgreferenceno"].ToString();
                            string Bank_MerchantId = "123279";
                            string Bank_RS = "";
                            string Bank_TPS = "";
                            string ReferenceNo = SuccessTable.Rows[j]["pgreferenceno"].ToString();
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
                            string SettlementDate = SuccessTable.Rows[j]["sdt"].ToString();
                            string SettlementStatus = SuccessTable.Rows[j]["Pgstatus"].ToString(); 
                            int IsManuallyProcessed = 1;
                           InsertLog(ServiceID, AppID, ReferenceNo, Bank_ResponseCode, Bank_UniqueRefNumber, Bank_ServiceTax, Bank_ProcessFee, Bank_TotalAmt, Bank_TransactionAmt, Bank_TransDate, Bank_Interchangevalue, Bank_TDR, Bank_PaymentMode, Bank_SubMerchantId, BANK_ReferenceNo, Bank_MerchantId, Bank_RS, Bank_TPS, Bank_ResponseString, Param1, Param2, Param3, Param4, Param5, IsActive, Createdby, CreatedOn, Modifiedby, ModifiedOn, SettlementDate, SettlementStatus, IsManuallyProcessed);

                        
                    }

                        }
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
        protected DataTable GetDetailPGrefrenceID(string PGSequenceNo,string Appid)
        {

            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("GetProcPGDetailPgID", con);
            cmd.Parameters.AddWithValue("@PGSequenceNo", PGSequenceNo);
            cmd.Parameters.AddWithValue("@Appid", Appid);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            da.Fill(ds);
            con.Close();
            return ds;

        }
        protected void btnCheckAppresponse_Click(object sender, EventArgs e)
        {
            DataTable result = GetProcUnpaidList();
            AppIDListModel objModel = new AppIDListModel();
            foreach (DataRow Row in result.Rows)
            {
                objModel.AppID = Row[0].ToString();
                DataTable dt = GetDetailthroughAppId(objModel.AppID);
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    PgAllResultVerifyApiTb Model = new PgAllResultVerifyApiTb();
                    Model.pgreferenceno = dt.Rows[i]["PGSequenceNo"].ToString();
                    // string url = "https://eazypay.icicibank.com/EazyPGVerify?ezpaytranid=&amount=&paymentmode=&merchantid=123279&trandate=&pgreferenceno=" + app;
                    // getdetail(url);
                    //RunAsync(url).Wait();
                    HttpClient client = new HttpClient();
                    client.BaseAddress = new Uri("https://eazypay.icicibank.com/");
                    // Add an Accept header for JSON format.  
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    // List all Names.  
                    HttpResponseMessage response = client.GetAsync("EazyPGVerify?ezpaytranid=&amount=&paymentmode=&merchantid=123279&trandate=&pgreferenceno=" + Model.pgreferenceno).Result;  // Blocking call!  
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

                        Model.Pgstatus = Status[1];
                        Model.ezpaytranid = id[1];
                        Model.amount = amt[1];
                        Model.trandate = trandate[1];
                        Model.pgreferenceno = referenceno[1];
                        Model.sdt = sdt[1];
                        Model.IsActive = true;
                        Model.CreatedOn = System.DateTime.Now;
                        Model.AppID = objModel.AppID;
                        Model.IsProcess = null;
                        Model.ProcessDate = null;
                        objd.PgAllResultVerifyApiTbs.Add(Model);
                        objd.SaveChanges();

                    }
                }


            }
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
            cmd.Parameters.AddWithValue("@flag", 1);
            //SqlTransaction trans = null;
            try
            {

                con.Open();
               

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