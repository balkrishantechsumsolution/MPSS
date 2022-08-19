using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.Sambalpur
{
    public partial class UpdateDatabasePassword : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDepartment_Click(object sender, EventArgs e)
        {
            SqlConnection co = new SqlConnection(ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString);
            string pass = "SELECT userid,password FROM Dept_UserLoginTb";
            //string pass = "SELECT LoginId,password FROM CitizenUserMasterTB";
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(pass, co);
            da.Fill(ds);

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                //  SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegiConnectionString"].ConnectionString);
                conn.Open();

                string insertQuery = "update Dept_UserLoginTb set EncryptPass='" + EncryptSHA256(ds.Tables[0].Rows[i]["password"].ToString()) + "' where userid='" + ds.Tables[0].Rows[i]["userid"].ToString() + "'";
                //string insertQuery = "update CitizenUserMasterTB set EncryptPass='" + EncryptSHA256(ds.Tables[0].Rows[i]["password"].ToString()) + "' where LoginId='" + ds.Tables[0].Rows[i]["LoginId"].ToString() + "'";
                SqlCommand cmd = new SqlCommand(insertQuery, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            Response.Write("Successfully Dept_UserLoginTb Table Updated.");
        }

        protected void btnCitizen_Click(object sender, EventArgs e)
        {
            SqlConnection co = new SqlConnection(ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString);
           
            string pass = "SELECT top 10000 LoginId,password FROM CitizenUserMasterTB where EncryptPass IS NULL and isactive=1";
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(pass, co);
            da.Fill(ds);

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                //  SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegiConnectionString"].ConnectionString);
                conn.Open();                
                string insertQuery = "update CitizenUserMasterTB set EncryptPass='" + EncryptSHA256(ds.Tables[0].Rows[i]["password"].ToString()) + "' where LoginId='" + ds.Tables[0].Rows[i]["LoginId"].ToString() + "' and EncryptPass IS NULL and isactive=1";
                SqlCommand cmd = new SqlCommand(insertQuery, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            Response.Write("Successfully CitizenUserMasterTB table Updated.");
        }
        //Encrypt string in javascript and C# by the same way sha256 to get same results
        public static string EncryptSHA256(string value)
        {
            string p = "";
            var message = Encoding.ASCII.GetBytes(value);
            SHA256Managed hashString = new SHA256Managed();
            string hex = "";

            var hashValue = hashString.ComputeHash(message);
            foreach (byte x in hashValue)
            {
                hex += String.Format("{0:x2}", x);
            }

            p = hex;

            return p;
        }
    }
}