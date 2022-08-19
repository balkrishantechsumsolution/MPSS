using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using System;
using System.Data;

namespace CitizenPortal.WebApp.Kiosk.CCTNS
{
    public partial class ResidncCertificateAck : System.Web.UI.Page
    {
        string m_AppID, m_ServiceID;
        PaymentReceiptBLL m_PaymentReceiptBLL = null;
        TestCitizenResult oRootObject = null;
        ResidenceBAL residenceBAL = null;
        ResidenceCertificate objRC = null;
        DataSet ds = null;
        DataTable dtChar = null;

        string QuickLinksDirectory = System.Configuration.ConfigurationManager.AppSettings["QuickLinksDirectory"];
        string EdistrictAPI = System.Configuration.ConfigurationManager.AppSettings["EdistrictAPI"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            btnHome.PostBackUrl = Session["HomePage"].ToString();
            tblPlotDtl.Visible = false;
            trSpose.Visible = false;

            residenceBAL = new ResidenceBAL();
            ds = new DataSet();
            // Fetch Data Residence Data
            ds = residenceBAL.GettResidenceDtl(m_ServiceID, m_AppID);
            if (ds.Tables.Count > 0)
            {
                // Bind Residence Certificate Acknowlagement data
                BindReceipt(ds);
            }
            else
            {
                QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);
            }
        }

        private void BindReceipt(DataSet ds)
        {
            
            if (ds.Tables["PlotDtl"] != null && ds.Tables["PlotDtl"].Rows.Count > 0)
            {
                tblPlotDtl.Visible = true;
                DataTable tblPlot = new DataTable();
                tblPlot = ds.Tables["PlotDtl"];
                grdPlotDtl.DataSource = tblPlot;
                grdPlotDtl.DataBind();
            }


            if (ds.Tables["CertDtl"] != null && ds.Tables["CertDtl"].Rows.Count > 0)
            {
                dtChar = new DataTable();
                dtChar = ds.Tables["CertDtl"];
                CitizenEnrollment_DT CE = new CitizenEnrollment_DT(dtChar);

                lblCertificateName.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vCertificateName"].ToString());
                lblDeptName.InnerText = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vDeptName"].ToString());
                //lblStatus.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Status"].ToString());
                lblAppname.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vAppname"].ToString());
                lblBnfsryRelsn.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vBnfsryRelsn"].ToString());
                lblBnfsryName.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vBnfsryName"].ToString());
                lblGender.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vGender"].ToString());
                lblDOB.Text = Convert.ToDateTime(dtChar.Rows[0]["vDOB"].ToString()).ToString("dd/MM/yyyy");
                lblMarital.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vMarital"].ToString());
                lblMobile.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vMobile"].ToString());
                lblEmail.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vEmail"].ToString());

                lblSpouseName.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vSpouseName"].ToString());
                lblRelSpouse.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vRelSpouse"].ToString());
                if (!string.IsNullOrEmpty(lblSpouseName.Text) && !string.IsNullOrEmpty(lblRelSpouse.Text))
                {
                    trSpose.Visible = true;
                }

                lblOdiya.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vOdiya"].ToString());
                lblME.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vME"].ToString());
                lblAddrY.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vAddrY"].ToString());
                lblapplicant_address.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vapplicant_address"].ToString());
                lblState.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vState"].ToString());
                lblDistrict.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vDistrict"].ToString());
                lblSubdivision.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vSubdivision"].ToString());
                lblTehsil.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vTehsil"].ToString());
                lblRI.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vRI"].ToString());
                lblBlock.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vBlock"].ToString());
                lblPanchayat.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vPanchayat"].ToString());
                lblPoliceStation.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vPoliceStation"].ToString());
                lblArea.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vArea"].ToString());
                lblPinCode.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vPinCode"].ToString());
                lblAppID.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vAppID"].ToString());
                lblAppDate.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vAppDate"].ToString());
                lblTrnsID.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vTrnsID"].ToString());
                if (!string.IsNullOrEmpty(dtChar.Rows[0]["vTrnsDate"].ToString()))
                    lblTrnsDate.Text = Convert.ToDateTime(dtChar.Rows[0]["vTrnsDate"]).ToString("dd/MM/yyyy");
                lblAmt.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vAmt"].ToString());
                lblFather.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vFather"].ToString());
                lblMother.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vMother"].ToString());
                lblPurpose.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vPurpose"].ToString());

                if (dtChar.Rows[0]["SubmitterType"].ToString() == "Y")
                {
                    string picarray = dtChar.Rows[0]["vApplicantImageStr"].ToString();//"data:image/png;base64," +
                    ProfilePhoto.Src = "data:image/jpeg;base64," + picarray;
                }

            }

            try
            {
                QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);
            }
            catch { }

            #region Documnet Upload


            if (ds.Tables["AtthmtDtl"] != null && ds.Tables["AtthmtDtl"].Rows.Count > 0)
            {
                DataTable tblDoc = new DataTable();
                tblDoc = ds.Tables["AtthmtDtl"];

                if (dtChar.Rows[0]["SubmitterType"].ToString() == "N")
                {
                    string AppImage = APICommon.CheckStrIsNullorEmpty(tblDoc.Rows[0]["Path"].ToString());
                    ProfilePhoto.Src = APICommon.ReadImageBase64(AppImage);
                }

                tblDoc.Columns.Remove("DocName");
                tblDoc.Columns.Remove("Path");
                tblDoc.Columns.Remove("CatID");
                tblDoc.Columns.Remove("SubCatID");
                tblDoc.Columns.Remove("IsActive");
                tblDoc.Columns.Remove("IsMandatory");
                tblDoc.Columns.Remove("IssueDate");
                tblDoc.Columns.Remove("EndDate");

                grdView.DataSource = tblDoc;
                grdView.DataBind();

            }
            #endregion


            if (ds.Tables["ApiDtl"] != null && ds.Tables["ApiDtl"].Rows.Count > 0)
            {
                lblStatus.Text = APICommon.CheckStrIsNullorEmpty(ds.Tables["ApiDtl"].Rows[0]["ApplicationStatus"].ToString());
            }
        }

    }
}



//lblAppID.Text = APICommon.CheckStrIsNullorEmpty(CE.IDCMGI);
//lblAadhaar.Text = APICommon.CheckStrIsNullorEmpty(CE.AadhaarID);
//lblappdate.Text = Convert.ToDateTime(dtl.Rows[0]["Createdon"]).ToString("dd/MM/yyyy");
//lblAppname.Text = string.IsNullOrEmpty(dtl.Rows[0]["ApplicantName"].ToString()) ? (CE.ApplicantFirstName + " " + CE.ApplicantLastName + " " + CE.ApplicantLastName) : dtl.Rows[0]["ApplicantName"].ToString();
//lblAppname.Text = string.IsNullOrEmpty(dtl.Rows[0]["ApplicantName"].ToString()) ? (CE.ApplicantFirstName + " " + CE.ApplicantLastName + " " + CE.ApplicantLastName) : dtl.Rows[0]["ApplicantName"].ToString();

//lblGender.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Gender"].ToString());
//lblDOB.Text = Convert.ToDateTime(dtl.Rows[0]["DOB"].ToString()).ToString("dd/MM/yyyy");
//lblMobile.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["MobileNo"].ToString());
//lblapplicant_address.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["ApplFullAddrs"].ToString());

//lblAmt.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Amount"].ToString());
//TokenNo.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["AppID"].ToString());
//AppDate.Text = Convert.ToDateTime(dtl.Rows[0]["Createdon"]).ToString("dd/MM/yyyy");
//lblCertificateName.Text = "Residence Application Acknowledgement";
//lblDeptName.InnerHtml = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["department"].ToString());
//lblTrnsID.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["TransactionID"].ToString());

//lblvillage.Text = APICommon.CheckStrIsNullorEmpty(CE.Village);
//lbltaluka.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["TalukaName"].ToString());
//lbldist.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["DistrictName"].ToString());
//lblpin.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["PinCode"].ToString());