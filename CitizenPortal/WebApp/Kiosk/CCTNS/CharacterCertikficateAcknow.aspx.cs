using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.CCTNS
{
    public partial class CharacterCertikficateAcknow : System.Web.UI.Page
    {
        CharacterCertificateBAL _CharacterCertificateBAL = new CharacterCertificateBAL();
        string m_AppID, m_ServiceID;
        DataTable dtChar = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            btnHome.PostBackUrl = Session["HomePage"].ToString();

            DataSet ds = _CharacterCertificateBAL.GetAppDetails(m_ServiceID, m_AppID);
           
            DataTable dtTrsDetails = ds.Tables["TransDetails"];
            

            if (ds.Tables["AppDetails"] != null && ds.Tables["AppDetails"].Rows.Count > 0)
            {
                dtChar = ds.Tables["AppDetails"];

                lblCertificateName.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vCertificateName"].ToString());
                lblDeptName.InnerText = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vDeptName"].ToString());
                //lblStatus.Text = APICommon.CheckStrIsNullorEmpty(dtl.Rows[0]["Status"].ToString());
                lblAppname.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vAppname"].ToString());
                lblBnfsryRelsn.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vBnfsryRelsn"].ToString());
                lblBnfsryName.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vBnfsryName"].ToString());
                lblGender.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vGender"].ToString());
                lblDOB.Text = Convert.ToDateTime(dtChar.Rows[0]["vDOB"].ToString()).ToString("dd/MM/yyyy");
                //lblMarital.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vMarital"].ToString());
                lblMobile.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vMobile"].ToString());
                lblEmail.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vEmail"].ToString());

                //lblSpouseName.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vSpouseName"].ToString());
                //lblRelSpouse.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vRelSpouse"].ToString());
                //if (!string.IsNullOrEmpty(lblSpouseName.Text) && !string.IsNullOrEmpty(lblRelSpouse.Text))
                //{
                //    trSpose.Visible = true;
                //}

                //lblOdiya.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vOdiya"].ToString());
                //lblME.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vME"].ToString());
                //lblAddrY.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vAddrY"].ToString());
                lblapplicant_address.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vapplicant_address"].ToString());
                lblState.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vState"].ToString());
                lblDistrict.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vDistrict"].ToString());
                lblSubdivision.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vSubdivision"].ToString());               
                lblPanchayat.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["vPanchayat"].ToString());   
                lblPoliceStation.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["LocalPoliceStation"].ToString());
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

                lblModeOfReceiving.Text = APICommon.CheckStrIsNullorEmpty(dtChar.Rows[0]["ModeOfReceiving"].ToString());

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
                DataTable tblDoc = ds.Tables["AtthmtDtl"];

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



            //string picarray = dtApp.Rows[0]["ApplicantImageStr"].ToString();//"data:image/png;base64," +
            //ProfilePhoto.Src = "data:image/jpeg;base64," + picarray;

            //DataTable dtDocument = dt.Tables[2];
            //DataTable dtDoc = new DataTable();
            //dtDoc.Columns.AddRange(new DataColumn[3] { new DataColumn("Sl No.", typeof(int)),
            //                new DataColumn("Document Name", typeof(string)),
            //                new DataColumn("Status",typeof(string)) });
            //string t_Status = "";
            //for (int i = 0; i < dtDocument.Rows.Count; i++)
            //{
            //    if (dtDocument.Rows[i]["IsUploaded"].ToString() == "1")
            //        t_Status = "Attached";
            //    else
            //        t_Status = "Not Attached";

            //    dtDoc.Rows.Add(i + 1, dtDocument.Rows[i]["DocDesc"].ToString(), t_Status);
            //}

            //grdView.DataSource = dtDoc;
            //grdView.DataBind();

            //try
            //{

            //    QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);

            //}
            //catch { }
        }
    }
}
