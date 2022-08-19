using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using Newtonsoft.Json;
using System;
using System.Collections.Specialized;
using System.Data;
using System.IO;

namespace CitizenPortal.WebApp.Kiosk.CCTNS
{
    public partial class ComplaintRegistrationAck : System.Web.UI.Page
    {
        string m_AppID, m_ServiceID;

        ComplaintRegBAL complaintRegBAL = null;
        DataSet ds = null;
        DataTable dtl = null;

        string QuickLinksDirectory = System.Configuration.ConfigurationManager.AppSettings["QuickLinksDirectory"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            btnHome.PostBackUrl = Session["HomePage"].ToString();

            complaintRegBAL = new ComplaintRegBAL();
            ds = new DataSet();
            // Fetch Complaint Data
            ds = complaintRegBAL.GetComplaintData(m_ServiceID, m_AppID);
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                // Bind Complaint Acknowlagement data
                BindReceipt(ds);
            }
            else
            { QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID); }


        }

        private void BindReceipt(DataSet ds)
        {

            if (ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
            {
                dtl = new DataTable();
                dtl = ds.Tables[0];

                lblAppID.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["AppID"].ToString());
                lblAadhaar.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Aadhaar"].ToString());
                String date = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Createdon"].ToString());
                if (date != "")
                {
                    lblappdate.Text = Convert.ToDateTime(date).ToString("dd/MM/yyyy");
                    AppDate.Text = Convert.ToDateTime(date).ToString("dd/MM/yyyy");
                }
                lblAppname.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["ApplicantName"].ToString());

                lblGender.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Gender"].ToString());
                lblDOB.Text = Convert.ToDateTime(dtl.Rows[0]["DOB"].ToString()).ToString("dd/MM/yyyy");
                lblMobile.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["MobileNo"].ToString());
                lblapplicant_address.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["ApplFullAddrs"].ToString());

                lblCertificateName.Text = "Complaint Acknowledgement";
                lblDeptName.InnerHtml = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["department"].ToString());

                lblvillage.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["village"].ToString());
                lbltaluka.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["TalukaName"].ToString());
                lbldist.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["DistrictName"].ToString());
                lblpin.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["PinCode"].ToString());

            }

            try
            {
                QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);
            }
            catch { }

            #region Documnet Upload


            if (ds.Tables[1] != null && ds.Tables[1].Rows.Count > 0)
            {

                string AppImage = APICommon.CheckStrIsNullorEmpty(ds.Tables[1].Rows[0]["Path"].ToString());
                ProfilePhoto.Src = APICommon.ReadImageBase64(AppImage);

                ds.Tables[1].Columns.Remove("DocName");
                ds.Tables[1].Columns.Remove("Path");
                ds.Tables[1].Columns.Remove("CatID");
                ds.Tables[1].Columns.Remove("SubCatID");
                ds.Tables[1].Columns.Remove("IsActive");
                ds.Tables[1].Columns.Remove("IsMandatory");
                ds.Tables[1].Columns.Remove("IssueDate");
                ds.Tables[1].Columns.Remove("EndDate");

                grdView.DataSource = ds.Tables[1];
                grdView.DataBind();

            }
            #endregion


            //if (ds.Tables[2] != null && ds.Tables[2].Rows.Count > 0)
            //{
            //    lblStatus.Text = APICommon.CheckStrIsNullorEmpty(ds.Tables[2].Rows[0]["ApplicationStatus"].ToString());
            //}
        }
    }
}