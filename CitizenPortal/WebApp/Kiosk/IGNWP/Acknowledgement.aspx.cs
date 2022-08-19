using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.IGNWP
{
    public partial class Acknowledgement : System.Web.UI.Page
    {
        IGNWPBLL m_IGNWPBLL = new IGNWPBLL();
        string m_AppID, m_ServiceID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();


            DataSet dt = m_IGNWPBLL.GetIGNWP(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[1];

            lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
            lblAadhaar.Text = dtApp.Rows[0]["UIDNo"].ToString();
            AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"]).ToString("dd/MM/yyyy");
            lblAppname.Text = dtApp.Rows[0]["ApplicantName"].ToString();
            lblDeasesed.Text = dtApp.Rows[0]["DeceasedName"].ToString();
            lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
            lblDOB.Text = Convert.ToDateTime(dtApp.Rows[0]["DOB"].ToString()).ToString("dd/MM/yyyy");
            lblapplicant_address.Text = dtApp.Rows[0]["FullAddress"].ToString();            
            lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();

            lblBPLCardNo.Text = dtApp.Rows[0]["BPLCardNo"].ToString();
            lblBPLCardYear.Text = dtApp.Rows[0]["BPLCardYear"].ToString();

            lblvillage.Text = dtApp.Rows[0]["VillageName"].ToString();
            lbltaluka.Text = dtApp.Rows[0]["SubDistrictName"].ToString();
            lbldist.Text = dtApp.Rows[0]["DistrictName"].ToString();
            lblpin.Text = dtApp.Rows[0]["Pincode"].ToString();
            lblMobile.Text = dtApp.Rows[0]["MobileNo"].ToString();
            lblAmt.Text = dtTransDetail.Rows[0]["AmtInText"].ToString();
            lblAcHolder.Text = dtApp.Rows[0]["AccountHolder"].ToString();
            lblAcNo.Text = dtApp.Rows[0]["AccountNumber"].ToString();
            lblIFSCCode.Text = dtApp.Rows[0]["IFSCCode"].ToString();

            lblAppID.Text = dtTransDetail.Rows[0]["AppID"].ToString(); 
            //AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"].ToString()).ToString("dd/MM/yyyy");
            //lblCertificateName.Text = "Indira Gandhi National Widow Pension Scheme (IGNWP)";
            AppName.Text = dtApp.Rows[0]["ApplicantName"].ToString();            
            lblTrnsID.InnerHtml = dtTransDetail.Rows[0]["TrnID"].ToString();
            lblTrnsDate.InnerHtml = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy");
            lblAppFee.Text = dtTransDetail.Rows[0]["govt"].ToString();
            lblServTax.Text = dtTransDetail.Rows[0]["misc_charges_01"].ToString();
            lblPortalFee.Text = dtTransDetail.Rows[0]["portal_serv_fee"].ToString();
            lblTotalFee.Text = dtTransDetail.Rows[0]["total"].ToString();

            //lbl1Date.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).AddDays(10).ToString("dd/MM/yyyy");
            //lbl2Date.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).AddDays(20).ToString("dd/MM/yyyy");
            //lbl3Date.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).AddDays(30).ToString("dd/MM/yyyy");
            lblExptDate.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).AddDays(30).ToString("dd/MM/yyyy");
            lblCertificateName.Text = dtTransDetail.Rows[0]["ServiceName"].ToString();
            lblDeptName.InnerHtml = dtTransDetail.Rows[0]["DepartmentName"].ToString();
            ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();
            DataTable dtDocument = dt.Tables[2];
            DataTable dtDoc = new DataTable();
            dtDoc.Columns.AddRange(new DataColumn[3] { new DataColumn("Sl No.", typeof(int)),
                            new DataColumn("Document Name", typeof(string)),
                            new DataColumn("Status",typeof(string)) });
            string t_Status = "";
            for (int i = 0; i < dtDocument.Rows.Count; i++)
            {
                if (dtDocument.Rows[i]["IsUploaded"].ToString() == "1")
                    t_Status = "Attached";
                else
                    t_Status = "Not Attached";

                dtDoc.Rows.Add(i + 1, dtDocument.Rows[i]["DocDesc"].ToString(), t_Status);
            }

            grdView.DataSource = dtDoc;
            grdView.DataBind();
            try
            {

                QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);

            }
            catch { }

        }
    }
}