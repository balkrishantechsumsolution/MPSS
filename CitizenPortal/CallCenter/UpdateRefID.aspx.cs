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
using CitizenPortal;



namespace CitizenPortal.CallCenter
{
    public partial class UpdateRefID : System.Web.UI.Page
    {
        OISFBLL m_OISFBLL = new OISFBLL();
        string m_AppID, m_ServiceID;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MasterDB"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnUpdate.Visible = false;
                Panel1.Visible = false;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBox1.Text != "")
                {
                    hdf_ref.Value = TextBox1.Text;
          
                    SqlDataAdapter sqlda;
                    DataSet ds;
                    SqlCommand com;
                    con.Open();
                    com = new SqlCommand();
                    com.CommandText = "SearchDUNumberSP";
                    com.CommandType = CommandType.StoredProcedure;
                    com.Connection = con;
                    com.Parameters.Add(new SqlParameter("@DUNumber", SqlDbType.VarChar, 50));
                    com.Parameters["@DUNumber"].Value = TextBox1.Text;

                    com.Parameters.Add(new SqlParameter("@Text ", "DUNo"));
                   
                   

                    sqlda = new SqlDataAdapter(com);
                    ds = new DataSet();
                    sqlda.Fill(ds);
                    con.Close();
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        GridView.Visible = true;
                        GridView.DataSource = ds;
                        GridView.DataBind();
                        btnUpdate.Visible = true;
                        Literal1.Visible = false;
                        Panel1.Visible = true;
                    }
                    else
                    {
                        btnUpdate.Visible = false;
                        GridView.Visible = false;
                        Literal1.Visible = true;
                        Literal1.Text = "No Record Found !";
                        Panel1.Visible = false;

                    }

                    TextBox1.Text = "";
                 
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
            com.CommandText = "UpdateReferenceIDSP";
            com.CommandType = CommandType.StoredProcedure;
            com.Connection = con;
            com.Parameters.Add(new SqlParameter("@DUNumber", SqlDbType.VarChar, 50));
          
            com.Parameters["@DUNumber"].Value = hdf_ref.Value;

            com.Parameters.Add(new SqlParameter("@Text ", "RefID"));
            sqlda = new SqlDataAdapter(com);
            ds = new DataSet();
            sqlda.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                DateTime dt = DateTime.Now;
                string datetime = dt.ToString("dd/M/yyyy", CultureInfo.InvariantCulture);
                string updatedRefID = TextBox2.Text;
                string lblRefID = ds.Tables[0].Rows[0]["Reference ID"].ToString();
                string lblDOB = ds.Tables[0].Rows[0]["DOB"].ToString();
                string lblDUNumber = ds.Tables[0].Rows[0]["DU Number"].ToString();
                string lblName = ds.Tables[0].Rows[0]["Name"].ToString();
                 
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "UpdateReferenceIDSP";
                //cmd.CommandText = "UpdateRefIDSPSP123";
                //----
                cmd.Parameters.Add("@F1", SqlDbType.VarChar).Value = ds.Tables[0].Rows[0]["F1"].ToString();
                cmd.Parameters.Add("@F2", SqlDbType.VarChar).Value = ds.Tables[0].Rows[0]["F2"].ToString();
                cmd.Parameters.Add("@F3", SqlDbType.VarChar).Value = ds.Tables[0].Rows[0]["F3"].ToString();
                cmd.Parameters.Add("@F4", SqlDbType.DateTime).Value = ds.Tables[0].Rows[0]["F4"].ToString();
                cmd.Parameters.Add("@F5", SqlDbType.VarChar).Value = ds.Tables[0].Rows[0]["F5"].ToString();
                cmd.Parameters.Add("@F6", SqlDbType.VarChar).Value = ds.Tables[0].Rows[0]["F6"].ToString();
                cmd.Parameters.Add("@F7", SqlDbType.VarChar).Value = ds.Tables[0].Rows[0]["F7"].ToString();
                cmd.Parameters.Add("@F8", SqlDbType.VarChar).Value = ds.Tables[0].Rows[0]["F8"].ToString();
                cmd.Parameters.Add("@F9", SqlDbType.VarChar).Value = ds.Tables[0].Rows[0]["F9"].ToString();
                cmd.Parameters.Add("@F10", SqlDbType.VarChar).Value = ds.Tables[0].Rows[0]["F10"].ToString();
                cmd.Parameters.Add("@F11", SqlDbType.VarChar).Value = ds.Tables[0].Rows[0]["F11"].ToString();
                cmd.Parameters.Add("@F12", SqlDbType.DateTime).Value = ds.Tables[0].Rows[0]["F12"].ToString();
                cmd.Parameters.Add("@F13", SqlDbType.VarChar).Value = ds.Tables[0].Rows[0]["F13"].ToString();
                cmd.Parameters.Add("@F14", SqlDbType.VarChar).Value = ds.Tables[0].Rows[0]["F14"].ToString();
                cmd.Parameters.Add("@F15", SqlDbType.VarChar).Value = ds.Tables[0].Rows[0]["F15"].ToString();
                cmd.Parameters.Add("@F16", SqlDbType.VarChar).Value = ds.Tables[0].Rows[0]["F16"].ToString();
                cmd.Parameters.Add("@F17", SqlDbType.VarChar).Value = ds.Tables[0].Rows[0]["F17"].ToString();
                cmd.Parameters.Add("@F18", SqlDbType.VarChar).Value = ds.Tables[0].Rows[0]["F18"].ToString();
                cmd.Parameters.Add("@F19", SqlDbType.VarChar).Value = ds.Tables[0].Rows[0]["F19"].ToString();

                //----
                cmd.Parameters.Add("@DUNumber", SqlDbType.VarChar).Value = lblDUNumber.Trim();
                cmd.Parameters.Add("@ReferenceID", SqlDbType.VarChar).Value = lblRefID.Trim();
                cmd.Parameters.Add("@UpdatedRefID", SqlDbType.VarChar).Value = updatedRefID.Trim();
                cmd.Parameters.Add("@DOB", SqlDbType.VarChar).Value = lblDOB.Trim();
                cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = lblName.Trim();
                cmd.Parameters.Add("@DateTime", SqlDbType.VarChar).Value = datetime.Trim();

                cmd.Parameters.Add("@msg", SqlDbType.Char, 1000);
                cmd.Parameters["@msg"].Direction = ParameterDirection.Output;

                cmd.Parameters.Add("@ResponseID", SqlDbType.Char, 1000);
                cmd.Parameters["@ResponseID"].Direction = ParameterDirection.Output;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                string smstext = cmd.Parameters["@msg"].Value.ToString();
                int id = int.Parse(cmd.Parameters["@ResponseID"].Value.ToString());
                if(id==1)
                {

                    DataSet t_Result = null;
                    t_Result = m_OISFBLL.SubmitPayment("388", updatedRefID, "CallCenter", "Citizen", lblDUNumber);

                    if (t_Result != null && t_Result.Tables[0].Rows.Count > 0)
                    {
                        if (t_Result.Tables[0].Rows[0]["Result"].ToString() == "1")
                        {
                            // btnSubmit.Visible = false;

                            // divErr.InnerHtml = "Payment Done Successfully !! Transaction ID is " + t_Result.Tables[0].Rows[0]["TrnID"].ToString();
                            //divErr.Attributes.Add("class", "success");
                            // divErr.Style.Add("display", "");
                        }
                    }

                }
                else
                {
                    

                }
                con.Close();
                GridView.Visible = false;
                Literal1.Visible = true;
                Literal1.Text = smstext;
                Panel1.Visible = false;
                TextBox2.Text = "";
                

            }
            else
            {

            }
        }
    }
}