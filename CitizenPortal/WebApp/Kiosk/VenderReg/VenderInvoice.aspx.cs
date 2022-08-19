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




namespace CitizenPortal.WebApp.Kiosk.VenderReg
{
    public partial class VenderInvoice : System.Web.UI.Page
    {
        string ShopName = "";
        string Customername = "";
        string Userid ="";
        string Appid = "";
        string AccountNumber = "";
        decimal Amount = 00.0m ;
        decimal Portal = 0.0M;
        decimal STax = 0.00M;
        string Mobile = "";
        string ServiceID = "";
        string Param1 = "";
        string CreatedBy = "";
        string CreatedOn = "";
        string ModifiedBy = "";
        string ModifiedOn = "";
        string Remark = "";

        //string redirecturl = "";
        //string encryptredirecturl = "";
        //string   returnURL ="" ;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["shopname"] == null)
            {
                Response.Redirect("venderLogin.aspx");
                
            }
            if (Session["Venderuserid"] == null)
            {
                Response.Redirect("venderLogin.aspx");
            }
            else
            {
                ShopName = Session["shopname"].ToString();
                Userid = Session["Venderuserid"].ToString();
            }
            

            //Session["Id"] = "GuestUser";
            //Session["role"] = "Citizen";
            //string user = Session["Id"].ToString();
            //string role = Session["role"].ToString();
            //string URL = "";

            //Response.Cookies["Id"].Value = user;

            //Session["CurrentCulture"] = "en-GB";
            //Session["SCAID"] = "";
            //Session["SCALoginID"] = "";
            //Session["__SessionHelper__"] = "";
            //Session["KioskID"] = Session["Id"].ToString();
            //Session["LoginID"] = Session["Id"].ToString();
            //Session["FullName"] = "Guest User";
            //Session["PaymentFlag"] = "C";
            //Session["Role"] = role;
            //Session["sRole"] = role;
            //Session["Balance"] = 0;
            //Session["UserType"] = "CITIZEN";
            //Session["HomePage"] = "/g2c/forms/index.aspx";
        }

        protected void btn_Pay_Click(object sender, EventArgs e)
         {

           
            Customername = txt_Customer.Text;
            Appid ="" ;
            DataTable dt1 = new DataTable();

            dt1 = InserLog( ShopName, Customername,  Userid,  Appid,  AccountNumber,   Amount, STax ,Portal ,Remark , Mobile,ServiceID,  Param1,  CreatedBy , CreatedOn,  ModifiedBy,  ModifiedOn);
            if(dt1.Rows.Count>0)
            {
                Appid = dt1.Rows[0][0].ToString();
            }
            else
            {
                Response.Write("Not Found"); 
            }
            STax = int.Parse(txtservice.Text);
            Portal =int.Parse( txt_Portal.Text);
            Remark = txtRemark.Text; 
            Amount =((int.Parse( txt_Amt_transfer.Text)) + (int.Parse( txt_Portal.Text)) + (int.Parse(txt_Portal.Text)));
            ServiceID = "850";
            Mobile = txt_Mobile.Text; 
            UpdateLog(ShopName, Customername, Userid, Appid, AccountNumber, Amount, STax, Portal, Remark, Mobile, ServiceID,Param1, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn);
            string pgresquesturl = ConfigurationManager.AppSettings["PGRequestPayURL"].ToString();
            string PG_Request_url = ConfigurationManager.AppSettings["PGReturnURL"].ToString();
            string SVCD = HttpUtility.UrlEncode(KeyClass.Encrypt(ServiceID));
            string AppID= HttpUtility.UrlEncode(KeyClass.Encrypt(Appid)); 
            string amt  = HttpUtility.UrlEncode(KeyClass.Encrypt(Amount.ToString()));
            string pg_Reuest = HttpUtility.UrlEncode(KeyClass.Encrypt(PG_Request_url));
            string PF = HttpUtility.UrlEncode(KeyClass.Encrypt(Portal.ToString()));
            string ST = HttpUtility.UrlEncode(KeyClass.Encrypt(STax.ToString()));
            Response.Redirect(pgresquesturl + "?SvcID=" + SVCD + "&AppID=" + AppID + "&Amt=" + amt + "&ServiceTax=" + ST + "&PortalFee=" + PF + "&URL=" + pg_Reuest, false);
            // string technology = HttpUtility.UrlEncode(Encrypt(txtname.Text.Trim()));
           // Response.Redirect(pgresquesturl + "?SvcID=" + SVCD + "&AppID=" + AppID + "&Amt=" + amt + "&URL=" + pg_Reuest);
           


        }

       
        protected DataTable InserLog(string ShopName, string Customername, string Userid, string Appid, string AccountNumber,decimal  Amount, decimal STax , decimal Portal  ,string remark , string Mobile, string ServiceID, string Param1, string CreatedBy, string CreatedOn, string ModifiedBy, string ModifiedOn)
        {
            DataTable dt = new DataTable();
            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = null;
            cmd = new SqlCommand("VenderInvoiceReciptSp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ShopName", ShopName);
            cmd.Parameters.AddWithValue("@Customername", Customername);
            cmd.Parameters.AddWithValue("@Userid", Userid);
            cmd.Parameters.AddWithValue("@Appid", Appid);
            cmd.Parameters.AddWithValue("@AccountNumber", AccountNumber);
            cmd.Parameters.AddWithValue("@Amount", Amount);
            cmd.Parameters.AddWithValue("@PortalFee", Portal);
            cmd.Parameters.AddWithValue("@ServiceTax", STax);
            cmd.Parameters.AddWithValue("@Remark", Remark);
            cmd.Parameters.AddWithValue("@Mobile", Mobile);
            cmd.Parameters.AddWithValue("@ServiceID", ServiceID);
            cmd.Parameters.AddWithValue("@Param1", Param1);
            cmd.Parameters.AddWithValue("@CreatedBy", CreatedBy);
            cmd.Parameters.AddWithValue("@CreatedOn", CreatedOn);
            cmd.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
            cmd.Parameters.AddWithValue("@ModifiedOn", ModifiedOn);
            
          
            try
            {

                con.Open();

                using (SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                {

                    dt.Load(rdr);
                    // cmd.ExecuteNonQuery();

                }
                    return dt;


            }
            catch (Exception ex)
            {
                // trans.Rollback();
                throw ex;

            }
            finally
            {
                // trans.Dispose();
                // con.Dispose();
                con.Close();

            }

        }
        protected void UpdateLog(string ShopName, string Customername, string Userid, string Appid, string AccountNumber, decimal Amount, decimal STax, decimal Portal, string remark, string Mobile, string ServiceID, string Param1, string CreatedBy, string CreatedOn, string ModifiedBy, string ModifiedOn)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = null;
            cmd = new SqlCommand("VenderUpdateInvoiceReciptSp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ShopName", ShopName);
            cmd.Parameters.AddWithValue("@Customername", Customername);
            cmd.Parameters.AddWithValue("@Userid", Userid);
            cmd.Parameters.AddWithValue("@Appid", Appid);
            cmd.Parameters.AddWithValue("@AccountNumber", AccountNumber);
            cmd.Parameters.AddWithValue("@Amount", Amount);
            cmd.Parameters.AddWithValue("@PortalFee", Portal);
            cmd.Parameters.AddWithValue("@ServiceTax", STax);
            cmd.Parameters.AddWithValue("@Remark", Remark);
            cmd.Parameters.AddWithValue("@Mobile", Mobile);
            cmd.Parameters.AddWithValue("@ServiceID", ServiceID);
            cmd.Parameters.AddWithValue("@Param1", Param1);
            cmd.Parameters.AddWithValue("@CreatedBy", CreatedBy);
            cmd.Parameters.AddWithValue("@CreatedOn", CreatedOn);
            cmd.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
            cmd.Parameters.AddWithValue("@ModifiedOn", ModifiedOn);
            

            try
            {

                con.Open();
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                // trans.Rollback();
                throw ex;

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