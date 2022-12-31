using CitizenPortal.WebApp.Common.QRCode;
using CitizenPortalLib;
using CitizenPortalLib.BLL;
using java.lang;
using javax.security.auth;
using Org.BouncyCastle.Asn1.IsisMtt.X509;
using SqlHelper;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class AdmitCardMPSOS : System.Web.UI.Page
    {
        string m_AppID, m_ServiceID;
        static data sqlhelper = new data();


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["AppID"] == null) return;
                if (Request.QueryString["SvcID"] != null) { m_ServiceID = Request.QueryString["SvcID"].ToString(); }

                m_AppID = Request.QueryString["AppID"].ToString();
               // m_AppID = "220000000565";

                DataTable dtApp = new DataTable();
                SqlParameter[] parameter = {
                 new SqlParameter("@AppID", m_AppID),
                 new SqlParameter("@ServiceID", m_ServiceID)
            };

                dtApp = sqlhelper.ExecuteDataTable("GetAdmitCardSP", parameter);


                if (dtApp.Rows.Count != 0)
                {
                    if (dtApp.Rows[0]["StudentName"].ToString() != "")
                    {
                        txtRegNo.Text = dtApp.Rows[0]["AppID"].ToString();
                        txtRollNo.Text = dtApp.Rows[0]["rollNumber"].ToString();
                        txtUniqueCode.Text = dtApp.Rows[0]["UniqueCode"].ToString();
                        txtCentreNo.Text = dtApp.Rows[0]["Centre_Code"].ToString();
                        FullName.Text = dtApp.Rows[0]["StudentName"].ToString();
                        txtCentreName.Text = dtApp.Rows[0]["EXAMCENTRENAME"].ToString();
                        FatherName.Text = dtApp.Rows[0]["FatherName"].ToString();
                        MotherName.Text = dtApp.Rows[0]["MotherName"].ToString();
                        txtExamName.Text = dtApp.Rows[0]["ExamName"].ToString();
                        txtSchoolName.Text = dtApp.Rows[0]["school"].ToString();
                        txtDOB.Text = dtApp.Rows[0]["Birthdate"].ToString();
                        txtClass.Text = dtApp.Rows[0]["Class"].ToString();

                        var val = dtApp.Rows[0]["Img"].ToString();
                        ProfilePhoto.Attributes.Add("src", val);
                        ProfilePhoto.DataBind();
                    }

                }
            }

            catch
            {

            }
        }
    }


}
