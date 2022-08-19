using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Data;

namespace CitizenPortal.WebApp.Kiosk.DTE
{
    public partial class FinancingAcknowledgement4 : System.Web.UI.Page
    {
        FinancialAssistanceBLL m_FinancialAssistanceBLL = new FinancialAssistanceBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet dt = m_FinancialAssistanceBLL.GetAppDetails4(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[1];

            if (dtApp.Rows.Count != 0)
            {
                lblAadhaar.Text = dtApp.Rows[0]["UIDNO"].ToString();
                lblAppname.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();
                lblDOB.Text = Convert.ToDateTime(dtApp.Rows[0]["DOB"].ToString()).ToString("dd/MM/yyyy");
                lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
                lblReligion.Text = dtApp.Rows[0]["Religion"].ToString();
                lblcategory.Text = dtApp.Rows[0]["Category"].ToString();
                lblEml.Text = dtApp.Rows[0]["EmailId"].ToString();
                lblMobile.Text = dtApp.Rows[0]["MobileNo"].ToString();
                lblannualincome.Text = dtApp.Rows[0]["AnnualIncome"].ToString();
                ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();//"data:image/png;base64," + 
                lblapplicant_address.Text = dtApp.Rows[0]["FullAddress"].ToString();
                lbltaluka.Text = dtApp.Rows[0]["BlockName"].ToString();
                lbldist.Text = dtApp.Rows[0]["DistrictName"].ToString();
                lblvillage.Text = dtApp.Rows[0]["VillageName"].ToString();
                lblpin.Text = dtApp.Rows[0]["pincode"].ToString();
                lblRegistrationNo.Text = dtApp.Rows[0]["RegistrationNumber"].ToString();
                lblAdmissionYear.Text = dtApp.Rows[0]["AdmissionYear"].ToString();
                lblSemester.Text = dtApp.Rows[0]["Semester"].ToString();
                lblInstituteType.Text = dtApp.Rows[0]["TypeOfInstitute"].ToString();
                lblnameofuniversity.Text = dtApp.Rows[0]["InstituteName"].ToString();
                lblFinancingGuardianName.Text= dtApp.Rows[0]["FinancingGuardianName"].ToString();
                lblFinancingGuardianRelation.Text= dtApp.Rows[0]["FinancingGuardianRelation"].ToString();
                lblBranch.Text = dtApp.Rows[0]["Branch"].ToString();
                lblBankName.Text = dtApp.Rows[0]["BankName"].ToString();
                lblBankAcNo.Text = dtApp.Rows[0]["BankAccountNo"].ToString();
                lblBankIFSCode.Text = dtApp.Rows[0]["BankIFSCcode"].ToString();
                lblAcHolderName.Text = dtApp.Rows[0]["AccountHolderName"].ToString();
                lblIssuingAuthority.Text = dtApp.Rows[0]["IssuingAuthorityName"].ToString();
                lblIssuingAddress.Text = dtApp.Rows[0]["IssuingAddress"].ToString();
                lblIssuingContactNo.Text = dtApp.Rows[0]["IssuingContactNo"].ToString();
                lblIssuingEmailId.Text = dtApp.Rows[0]["IssuingEmailId"].ToString();
            }

            string t_Status = "";
            DataTable dtDocument = dt.Tables[2];
            DataTable dtDoc = new DataTable();
            dtDoc.Columns.AddRange(new DataColumn[3] { new DataColumn("Sl No.", typeof(int)),
                            new DataColumn("Document Name", typeof(string)),
                            new DataColumn("Status",typeof(string)) });

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

            if (dtTransDetail.Rows.Count != 0)
            {
                lblReferenceID.Text = dtTransDetail.Rows[0]["AppID"].ToString();
                lblTrnsID.Text = dtTransDetail.Rows[0]["TrnID"].ToString();
                lblTrnsDate.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy");
                lblAmt.Text = dtTransDetail.Rows[0]["total"].ToString();
                AppDate.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["AppDate"]).ToString("dd/MM/yyyy");
            }

            try
            {
                QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);
            }
            catch { }
        }
    }
}