using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Net.Mail;
using System.Net;
using System.Web.Configuration;

namespace CitizenPortal.Models
{
    public class OTP
    {
        DataTable dt = new DataTable();
        string CreatedBy = "", CreatedOn = "", ModifiedBy = "", ModifiedOn = "";
        int IsActive = 1;


        public void insertDatatable(string msg, string otp, string mobile)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand("insertCititzensmssend", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Sms", msg);
            cmd.Parameters.AddWithValue("@OTP", otp);
            cmd.Parameters.AddWithValue("@Mobile", mobile);
            cmd.Parameters.AddWithValue("@validTill", "");
            cmd.Parameters.AddWithValue("@CreatedBy", CreatedBy);
            cmd.Parameters.AddWithValue("@CreatedOn", CreatedOn);
            cmd.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
            cmd.Parameters.AddWithValue("@ModifiedOn", ModifiedOn);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);

            cmd.ExecuteNonQuery();
            con.Close();





        }

        public void ForgetLogMaintain( string UserID , string Mobile ,string OldPassword , string NewPassword )
        {
            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand("InsertLogFOrgotPAsswordSP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.Parameters.AddWithValue("@Mobile", Mobile);
            cmd.Parameters.AddWithValue("@OldPassword", OldPassword);
            cmd.Parameters.AddWithValue("@NewPassword", NewPassword);
            cmd.Parameters.AddWithValue("@CreatedBy", CreatedBy);
            cmd.Parameters.AddWithValue("@CreatedOn", CreatedOn);
            cmd.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
            cmd.Parameters.AddWithValue("@ModifiedOn", ModifiedOn);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);

            cmd.ExecuteNonQuery();
            con.Close();

        }
    }
}