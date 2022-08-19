using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using System.Web.Services;
using System.Web.Script.Services;
using System.ServiceModel;
using System.Data.SqlClient;
using CitizenPortalLib.BLL;
using System.Data;
using System.Text;
using System.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace CitizenPortal.g2c
{
    public partial class index : System.Web.UI.Page
    {
        NFBSBLL m_NFBSBLL = new NFBSBLL();
        string m_AppID, m_ServiceID;
        private object lblServTax;

        protected void Page_Load(object sender, EventArgs e)
        {



            try
            {
                string constr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;
                using (SqlConnection sql = new SqlConnection(constr))
                {

                    using (SqlCommand cmd = new SqlCommand("SELECT DepartmentName FROM DepartmentMasterTb"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = sql;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                foreach(DataRow dr in dt.Rows)
                                {
                                    department.InnerHtml.Equals("" + dr["DepartmentName"] + "<br />");

                                    // bdy is div name 
                                    //Response.Write("" + dr["DepartmentName"] + "<br />");

                                }


                            }
                        }
                    }



                }
            }
            catch (Exception ex)

            { }


            //if (Request.QueryString["AppID"] == null) return;
            //if (Request.QueryString["SvcID"] == null) return;

            //m_AppID = Request.QueryString["AppID"].ToString();
            //m_ServiceID = Request.QueryString["SvcID"].ToString();


            //DataSet dt = m_NFBSBLL.GetAppDetails(m_ServiceID, m_AppID);
            //DataTable dtApp = dt.Tables[0];
            //DataTable dtTransDetail = dt.Tables[1];

            //lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
            //lblAadhaar.Text = dtApp.Rows[0]["UIDNo"].ToString(); //UID No
            //lblappdate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"]).ToString("dd/MM/yyyy");
            //lblAppname.Text = dtApp.Rows[0]["ApplicantName"].ToString();
            //lblDeceasedName.Text = dtApp.Rows[0]["DeceasedName"].ToString();
            //lblFather.Text = dtApp.Rows[0]["DeceasedName"].ToString();
            //lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
            //lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();
            //lblDOB.Text = dtApp.Rows[0]["DOB"].ToString();
            //lblBPLNo.Text = dtApp.Rows[0]["BPLCardNo"].ToString();
            //lblBPLYear.Text = dtApp.Rows[0]["BPLCardYear"].ToString();
            //lblapplicant_address.Text = dtApp.Rows[0]["FullAddress"].ToString();
            //lbldist.Text = dtApp.Rows[0]["DistrictName"].ToString();
            //lbltaluka.Text = dtApp.Rows[0]["SubDistrictName"].ToString();
            //lblpin.Text = dtApp.Rows[0]["Pincode"].ToString();

            //lblvillage.Text = dtApp.Rows[0]["VillageName"].ToString();
            //lbltaluka.Text = dtApp.Rows[0]["SubDistrictName"].ToString();
            //lbldist.Text = dtApp.Rows[0]["DistrictName"].ToString();
            //lblpin.Text = dtApp.Rows[0]["Pincode"].ToString();
            //lblMobile.Text = dtApp.Rows[0]["MobileNo"].ToString();

            //lblAcHolder.Text = dtApp.Rows[0]["AccountHolder"].ToString();
            //lblAcNo.Text = dtApp.Rows[0]["AccountNumber"].ToString();
            //lblIFSCCode.Text = dtApp.Rows[0]["IFSCCode"].ToString();

            //TokenNo.Text = dtTransDetail.Rows[0]["AppID"].ToString();
            //AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"].ToString()).ToString("dd/MM/yyyy");
            //lblCertificateName.Text = "NATIONAL FAMILY BENEFIT SCHEME (SEEPD)";

            //lblTrnsID.Text = dtTransDetail.Rows[0]["TrnID"].ToString();
            //lblTrnsDate.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy");
            //lblAppFee.Text = dtTransDetail.Rows[0]["govt"].ToString();
            //lblServTax.Text = dtTransDetail.Rows[0]["misc_charges_01"].ToString();
            //lblPortalFee.Text = dtTransDetail.Rows[0]["portal_serv_fee"].ToString();
            //lblTotalFee.Text = dtTransDetail.Rows[0]["total"].ToString();

            //lbl1Date.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).AddDays(10).ToString("dd/MM/yyyy");
            //lbl2Date.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).AddDays(20).ToString("dd/MM/yyyy");
            //lbl3Date.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).AddDays(30).ToString("dd/MM/yyyy");

            //ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();
        }

      
        }
    }
            
