using CitizenPortal.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.PG
{
    public partial class PGResponseVerify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            DataTable ResponseTb = GetDetailPGrefrenceID();

            for (int j = 0; j < ResponseTb.Rows.Count; j++)
            {
                AppIDListModel objModel = new AppIDListModel();
                if (ResponseTb.Rows[j]["AppID"].ToString() != ""
                    && ResponseTb.Rows[j]["ReferenceNo"].ToString() != ""
                    && ResponseTb.Rows[j]["RowID"].ToString() != "")
                {
                    objModel.AppID = ResponseTb.Rows[j]["AppID"].ToString();
                    //DataTable dt = GetDetailthroughAppId(objModel.AppID);

                    PgAllResultVerifyApiTb Model = new PgAllResultVerifyApiTb();
                    Model.pgreferenceno = ResponseTb.Rows[j]["ReferenceNo"].ToString();
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
                        string Rowid = ResponseTb.Rows[j]["RowID"].ToString();
                        string Recon_Status = Status[1];
                        string Recon_ezpaytranid = id[1];
                        string Recon_amount = amt[1];
                        string Recon_trandate = trandate[1];
                        string Recon_pgreferenceno = referenceno[1];
                        string Recon_sdt = sdt[1];

                        UpdateLog(Rowid, objModel.AppID, Model.pgreferenceno, Recon_Status, Recon_ezpaytranid, Recon_amount, Recon_trandate, Recon_pgreferenceno, Recon_sdt);









                    }
                }


            }
        }

        protected void BtnUpdateRequest_Click(object sender, EventArgs e)
        {
            DataTable RequestTb = GetDetailPGRequestrefrenceID();

            for (int j = 0; j < RequestTb.Rows.Count; j++)
            {
                AppIDListModel objModel = new AppIDListModel();
                if (RequestTb.Rows[j]["AppID"].ToString() != ""
                    && RequestTb.Rows[j]["ReferenceNo"].ToString() != ""
                    && RequestTb.Rows[j]["RowID"].ToString() != "")
                {
                    objModel.AppID = RequestTb.Rows[j]["AppID"].ToString();
                    //DataTable dt = GetDetailthroughAppId(objModel.AppID);

                    PgAllResultVerifyApiTb Model = new PgAllResultVerifyApiTb();
                    Model.pgreferenceno = RequestTb.Rows[j]["ReferenceNo"].ToString();
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
                        string Rowid = RequestTb.Rows[j]["RowID"].ToString();
                        string Recon_Status = Status[1];
                        string Recon_ezpaytranid = id[1];
                        string Recon_amount = amt[1];
                        string Recon_trandate = trandate[1];
                        string Recon_pgreferenceno = referenceno[1];
                        string Recon_sdt = sdt[1];

                        UpdateLogRequest(Rowid, objModel.AppID, Model.pgreferenceno, Recon_Status, Recon_ezpaytranid, Recon_amount, Recon_trandate, Recon_pgreferenceno, Recon_sdt);









                    }
                }


            }
        }

        protected DataTable GetDetailPGrefrenceID()
        {

            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("GetProcAllListPGResponseSp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable Dt = new DataTable();
            da.Fill(Dt);
            con.Close();
            return Dt;

        }
        protected DataTable GetDetailPGRequestrefrenceID()
        {

            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("GetProcAllListPGRequestSp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable Dt = new DataTable();
            da.Fill(Dt);
            con.Close();
            return Dt;

        }

        protected bool UpdateLog(string RowId, string Appid, string ReferenceNo,
            string Recon_Status, string Recon_ezpaytranid, string Recon_Amount, string Recon_TransDate, string Recon_pgreferenceno, string Recon_sdt)
        {

            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);

            SqlCommand cmd = null;
            //  cmd = con.CreateCommand();
            cmd = new SqlCommand("Recon_PGResponseSP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@RowId", RowId);
            cmd.Parameters.AddWithValue("@Appid", Appid);
            cmd.Parameters.AddWithValue("@ReferenceNo", ReferenceNo);
            cmd.Parameters.AddWithValue("@Recon_Status", Recon_Status);
            cmd.Parameters.AddWithValue("@Recon_ezpaytranid", Recon_ezpaytranid);
            cmd.Parameters.AddWithValue("@Recon_TransDate", Recon_TransDate);
            cmd.Parameters.AddWithValue("@Recon_Amount", Recon_Amount);
            cmd.Parameters.AddWithValue("@Recon_pgreferenceno", Recon_pgreferenceno);
            cmd.Parameters.AddWithValue("@Recon_sdt", Recon_sdt);
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


        protected bool UpdateLogRequest(string RowId, string Appid, string ReferenceNo,
           string Recon_Status, string Recon_ezpaytranid, string Recon_Amount, string Recon_TransDate, string Recon_pgreferenceno, string Recon_sdt)
        {

            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = null;
            cmd = new SqlCommand("Recon_PGRequestSP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@RowId", RowId);
            cmd.Parameters.AddWithValue("@Appid", Appid);
            cmd.Parameters.AddWithValue("@ReferenceNo", ReferenceNo);
            cmd.Parameters.AddWithValue("@Recon_Status", Recon_Status);
            cmd.Parameters.AddWithValue("@Recon_ezpaytranid", Recon_ezpaytranid);
            cmd.Parameters.AddWithValue("@Recon_TransDate", Recon_TransDate);
            cmd.Parameters.AddWithValue("@Recon_Amount", Recon_Amount);
            cmd.Parameters.AddWithValue("@Recon_pgreferenceno", Recon_pgreferenceno);
            cmd.Parameters.AddWithValue("@Recon_sdt", Recon_sdt);
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