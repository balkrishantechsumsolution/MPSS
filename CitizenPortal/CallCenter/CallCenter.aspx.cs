using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CitizenPortalLib;
using CitizenPortalLib.BLL;

using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;

namespace CitizenPortal.CallCenter
{
    public partial class CallCenter : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MasterDB"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnSend.Visible = false;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBox1.Text == "")
                {
                    hdf_ref.Value = TextBox1.Text;
                    hdf_dob.Value = TextBox2.Text;
                    hdf_referal.Value = TextBox3.Text;
                    SqlDataAdapter sqlda;
                    DataSet ds;
                    SqlCommand com;
                    con.Open();
                    com = new SqlCommand();
                    com.CommandText = "SearchSMS_SP2";
                    com.CommandType = CommandType.StoredProcedure;
                    com.Connection = con;
                    com.Parameters.Add(new SqlParameter("@appid", SqlDbType.VarChar, 50));
                    com.Parameters.Add(new SqlParameter("@DOB", SqlDbType.VarChar, 50));
                    com.Parameters.Add(new SqlParameter("@Mobile", SqlDbType.VarChar, 50));
                    com.Parameters["@appid"].Value = TextBox1.Text;
                    com.Parameters["@DOB"].Value = TextBox2.Text;
                    com.Parameters["@Mobile"].Value = TextBox3.Text;
                    sqlda = new SqlDataAdapter(com);
                    ds = new DataSet();
                    sqlda.Fill(ds);
                    con.Close();
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        GridView.Visible = true;
                        GridView.DataSource = ds;
                        GridView.DataBind();
                        btnSend.Visible = true;
                        Literal1.Visible = false;

                    }
                    else
                    {
                        btnSend.Visible = false;
                        GridView.Visible = false;
                        Literal1.Visible = true;
                        Literal1.Text = "No Record Found !";

                    }

                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";

                }
                if (TextBox3.Text == "")
                {
                    hdf_ref.Value = TextBox1.Text;
                    hdf_dob.Value = TextBox2.Text;
                    hdf_referal.Value = TextBox3.Text;
                    SqlDataAdapter sqlda;
                    DataSet ds;
                    SqlCommand com;
                    con.Open();
                    com = new SqlCommand();
                    com.CommandText = "SearchSMS_SP2";
                    com.CommandType = CommandType.StoredProcedure;
                    com.Connection = con;
                    com.Parameters.Add(new SqlParameter("@appid", SqlDbType.VarChar, 50));
                    com.Parameters.Add(new SqlParameter("@DOB", SqlDbType.VarChar, 50));
                    com.Parameters.Add(new SqlParameter("@Mobile", SqlDbType.VarChar, 50));
                    com.Parameters["@appid"].Value = TextBox1.Text;
                    com.Parameters["@DOB"].Value = TextBox2.Text;
                    com.Parameters["@Mobile"].Value = TextBox3.Text;
                    sqlda = new SqlDataAdapter(com);
                    ds = new DataSet();
                    sqlda.Fill(ds);
                    con.Close();
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        Literal1.Visible = false;
                        GridView.Visible = true;
                        GridView.DataSource = ds;
                        GridView.DataBind();
                        btnSend.Visible = true;

                    }
                    else
                    {
                        btnSend.Visible = false;
                        GridView.Visible = false;
                        Literal1.Visible = true;
                        Literal1.Text = "No Record Found !";

                    }

                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                }
                else
                {
                    hdf_ref.Value = TextBox1.Text;
                    hdf_dob.Value = TextBox2.Text;
                    hdf_referal.Value = TextBox3.Text;
                    SqlDataAdapter sqlda;
                    DataSet ds;
                    SqlCommand com;
                    con.Open();
                    com = new SqlCommand();
                    com.CommandText = "SearchSMS_SP2";
                    com.CommandType = CommandType.StoredProcedure;
                    com.Connection = con;
                    com.Parameters.Add(new SqlParameter("@appid", SqlDbType.VarChar, 50));
                    com.Parameters.Add(new SqlParameter("@DOB", SqlDbType.VarChar, 50));
                    com.Parameters.Add(new SqlParameter("@Mobile", SqlDbType.VarChar, 50));
                    com.Parameters["@appid"].Value = TextBox1.Text;
                    com.Parameters["@DOB"].Value = TextBox2.Text;
                    com.Parameters["@Mobile"].Value = TextBox3.Text;
                    sqlda = new SqlDataAdapter(com);
                    ds = new DataSet();
                    sqlda.Fill(ds);
                    con.Close();
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        GridView.Visible = true;
                        GridView.DataSource = ds;
                        GridView.DataBind();
                        btnSend.Visible = true;
                        Literal1.Visible = false;

                    }
                    else
                    {
                        btnSend.Visible = false;
                        GridView.Visible = false;
                        Literal1.Visible = true;
                        Literal1.Text = "No Record Found !";

                    }

                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                }

            }
            catch (Exception ex)
            {
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {

            SqlDataAdapter sqlda;
            DataSet ds;
            SqlCommand com;
            con.Open();
            com = new SqlCommand();
            com.CommandText = "SearchSMS_SP2";
            com.CommandType = CommandType.StoredProcedure;
            com.Connection = con;
            com.Parameters.Add(new SqlParameter("@appid", SqlDbType.VarChar, 50));
            com.Parameters.Add(new SqlParameter("@DOB", SqlDbType.VarChar, 50));
            com.Parameters.Add(new SqlParameter("@Mobile", SqlDbType.VarChar, 50));
           
            com.Parameters["@appid"].Value = hdf_ref.Value;
            com.Parameters["@DOB"].Value = hdf_dob.Value;
            com.Parameters["@Mobile"].Value = hdf_referal.Value;
            sqlda = new SqlDataAdapter(com);
            ds = new DataSet();
            sqlda.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string lblRefID = ds.Tables[0].Rows[0]["Reference ID"].ToString();
                string lblDOB = ds.Tables[0].Rows[0]["DOB"].ToString();
                string lblProfileID = ds.Tables[0].Rows[0]["Profile ID"].ToString();
                string lblMobile = ds.Tables[0].Rows[0]["Mobile"].ToString();



                string datetime = DateTime.Now.ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SendSMS_SP";


                cmd.Parameters.Add("@ReferenceID", SqlDbType.VarChar).Value = lblRefID.Trim();
                cmd.Parameters.Add("@DOB", SqlDbType.VarChar).Value = lblDOB.Trim();
                cmd.Parameters.Add("@ReferalID", SqlDbType.VarChar).Value = lblProfileID.Trim();
                cmd.Parameters.Add("@Mobile", SqlDbType.VarChar).Value = lblMobile.Trim();
                
                cmd.Parameters.Add("@DateTime", SqlDbType.VarChar).Value = datetime.Trim();

                cmd.Parameters.Add("@txt", SqlDbType.Char, 1000);
                cmd.Parameters["@txt"].Direction = ParameterDirection.Output;

                cmd.Connection = con;
                cmd.ExecuteNonQuery();
             
                string MobileNo = cmd.Parameters["@Mobile"].Value.ToString();
                string smstext = cmd.Parameters["@txt"].Value.ToString();


                CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();
               
                if (MobileNo != "")
                {
                    test.sendsms(MobileNo, smstext);
                    //test.sendsms(MobileNo, "Payment is successful for Reference No " + m_AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");

                }
               

                con.Close();
          

                

                GridView.Visible = false;
                Literal1.Visible = true;
                Literal1.Text = "Send Successfully !";
                btnSend.Visible = false;


            }
            else
            {

            }
        }
    }
}