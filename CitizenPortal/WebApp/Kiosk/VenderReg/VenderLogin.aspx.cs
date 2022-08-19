using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Net;
using System.Net.Mail;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web.Configuration;

namespace CitizenPortal.WebApp.Kiosk.VenderReg
{
    public partial class VenderLogin : System.Web.UI.Page
    {
        string userid, passwprd, shopaname, Newpasswod;
        string lastlogtime = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            myModal.Visible = false;
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

            // forgetpassword.Visible = false;
        }
        protected void btn_Forget_Click(object sender, EventArgs e)
        {
            divtab.Visible = false;
            myModal.Visible = true;
        }
        protected void btnCanelClick(object sender, EventArgs e)
        {
            Response.Redirect("VenderLogin.aspx");
        }
        
        protected void btn_login_Click(object sender, EventArgs e)
        {



            DataSet ds1 = new DataSet();
            ds1 = loginLog(txt_loginid.Text, txt_Password.Text);

            if (ds1.Tables[0].Rows.Count > 0)
            {
                userid = ds1.Tables[0].Rows[0][0].ToString();
                passwprd = ds1.Tables[0].Rows[0][1].ToString();
                shopaname = ds1.Tables[0].Rows[0][2].ToString();

                if (userid == txt_loginid.Text && txt_Password.Text == passwprd)
                {
                    Session["Venderuserid"] = userid;
                    Session["passwprd"] = passwprd;
                    Session["shopname"] = shopaname;
                    lblmeg.ForeColor = System.Drawing.Color.Green;
                    lblmeg.Text = "Login Succesfully";
                    Insertlog(userid, lastlogtime);
                    Response.Redirect("VenderInvoice.aspx");

                }
                else
                {
                   lblmeg.ForeColor = System.Drawing.Color.Red;
                    lblmeg.BackColor = System.Drawing.Color.White;
                    lblmeg.Text = "Login Failed!! Login Id And Passoword are not Match";

                }


            }
            else
            {
                lblmeg.BackColor = System.Drawing.Color.Red;
                lblmeg.Text = "Login Failed!! Login Id And Passoword are not Match";

            }
           




        }
        private static string CreateRandomPassword(int passwordLength)
        {
            string allowedChars = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789!@$?_-";
            char[] chars = new char[passwordLength];
            Random rd = new Random();

            for (int i = 0; i < passwordLength; i++)
            {
                chars[i] = allowedChars[rd.Next(0, allowedChars.Length)];
            }

            return new string(chars);
        }
        protected void btnSendEmail(object sender, EventArgs e)
        {
            int i = 5;
            
            Newpasswod = CreateRandomPassword(i);


            string email = txtEmail.Text;
            string username = txtUsrID.Text;
            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            string sql = "select  UserID ,Password from VenderRegTB where Email='" + email + "' or UserID='" + username + "' ";
            // "select  UserID ,Password from VenderRegTB where Email='" + email + " or  UserID='" + username +  "' ";
            SqlCommand cmd1 = con.CreateCommand();
            cmd1.CommandType = CommandType.Text;
            cmd1.CommandText = sql;

            using (SqlDataReader sdr = cmd1.ExecuteReader())
            {
                if (sdr.Read())
                {
                    userid = sdr["UserID"].ToString();
                    passwprd = sdr["Password"].ToString();
                }
            }

            con.Close();

            UpdateLog(userid, Newpasswod);
            Insertlog(userid, lastlogtime);
            SendEmail();
            string script = "<script type=\"text/javascript\">alert('Please login !!');</script>";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
            Response.Redirect("VenderLogin.aspx");





        }
        protected DataSet loginLog(string loginid, string password)
        {
            DataSet ds = new DataSet();
            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = null;
            cmd = new SqlCommand("loginVenderSp", con);
            cmd.Parameters.AddWithValue("@UserID", loginid);
            cmd.Parameters.AddWithValue("@Password", password);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();
            return ds;



        }
        protected bool UpdateLog(string UserName, string password)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            SqlConnection con = new SqlConnection(connStr);
            string sql = "UPDATE VenderRegTB SET Password = '" + password + "' Where  UserID = '" + UserName + "'";
            SqlCommand cmd1 = con.CreateCommand();
            cmd1.CommandType = CommandType.Text;
            cmd1.CommandText = sql;
            cmd1.Parameters.AddWithValue("@Password", password);
            cmd1.Parameters.AddWithValue("@UserID", UserName);

            try
            {

                con.Open();

                cmd1.ExecuteNonQuery();

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
        protected void SendEmail()
        {

            if (!string.IsNullOrEmpty(Newpasswod))
            {
                MailMessage mm = new MailMessage("sender@gmail.com", txtEmail.Text.Trim());
                mm.Subject = "Password Recovery";
                mm.Body = string.Format("Hi {0},<br /><br />Your password is {1}.<br /><br />Thank You.", userid, Newpasswod);
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential();
                NetworkCred.UserName = WebConfigurationManager.AppSettings["SMTPUserName"].ToString(); ;
                NetworkCred.Password = WebConfigurationManager.AppSettings["SMTPPassword"].ToString(); ;
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
                lblmeg.ForeColor = Color.Green;
                lblmeg.Text = "Password has been sent to your email address.";
            }
            else
            {
                lblmeg.ForeColor = Color.Red;
                lblmeg.Text = "This email address does not match our records.";
            }
        }

        protected void Insertlog(string username, string logtime)
        {
            {
                string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

                SqlConnection con = new SqlConnection(connStr);
                SqlCommand cmd = null;
                cmd = new SqlCommand("InsertVenderLog", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserName", username);
                cmd.Parameters.AddWithValue("@LastLoginTime", logtime);
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

        protected void btn_REg_Click(object sender, EventArgs e)
        {
            Response.Redirect("VenderRegistration.aspx");
        }
        

    }
}