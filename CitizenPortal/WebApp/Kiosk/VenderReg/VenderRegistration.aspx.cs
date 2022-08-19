using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.VenderReg
{
    public partial class VenderRegistation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        //    Session["Id"] = "GuestUser";
        //    Session["role"] = "Citizen";
        //    string user = Session["Id"].ToString();
        //    string role = Session["role"].ToString();
        //    string URL = "";

        //    Response.Cookies["Id"].Value = user;

        //    Session["CurrentCulture"] = "en-GB";
        //    Session["SCAID"] = "";
        //    Session["SCALoginID"] = "";
        //    Session["__SessionHelper__"] = "";
        //    Session["KioskID"] = Session["Id"].ToString();
        //    Session["LoginID"] = Session["Id"].ToString();
        //    Session["FullName"] = "Guest User";
        //    Session["PaymentFlag"] = "C";
        //    Session["Role"] = role;
        //    Session["sRole"] = role;
        //    Session["Balance"] = 0;
        //    Session["UserType"] = "CITIZEN";
        //    Session["HomePage"] = "/g2c/forms/index.aspx";
        }

        protected void btn_Reg_Click(object sender, EventArgs e)
        { 
            

          

            InserLog(txtShopName.Text , txt_OwnerName.Text ,txt_Address.Text ,TxtEmail.Text,txt_BankAc.Text , txt_bankName.Text,txt_IFsc.Text,txt_UserId.Text ,txt_Password.Text ,"" ,txt_UserId.Text,"","","");

            Response.Redirect("VenderLogin.aspx");
        }

        protected void InserLog ( string ShopName ,string OwnerName , string Address,string Email ,string BankAccount ,string BankName, string IfscCode ,string  UserID , string Password , string Param1 , string CreatedBy ,string CreatedOn , string ModifiedBy , string ModifiedOn)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = null;
            cmd = new SqlCommand("InsertVenderRegSp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ShopName", ShopName);
            cmd.Parameters.AddWithValue("@OwnerName", OwnerName);
            cmd.Parameters.AddWithValue("@Address", Address);
            cmd.Parameters.AddWithValue("@Email", Email);
            cmd.Parameters.AddWithValue("@BankAccount", BankAccount);
            cmd.Parameters.AddWithValue("@BankName", BankName);
            cmd.Parameters.AddWithValue("@IfscCode", IfscCode);
            cmd.Parameters.AddWithValue("@UserID", UserID); 
            cmd.Parameters.AddWithValue("@Password", Password);
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