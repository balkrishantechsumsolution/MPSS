using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.DegreeSU
{
    public partial class Acknowledgement : CommonBasePage
    {
        DuplicateDegreeSUBLL m_DuplicateDegreeBLL = new DuplicateDegreeSUBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();


            DataSet dt = m_DuplicateDegreeBLL.GetDuplicateDegreeSU(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[1];

            DataTable dtGrid = dt.Tables[3];
            if (dtGrid.Rows.Count != 0)
            {
                marksDtlTble.Visible = true;
                lblstatus.Text = dtGrid.Rows[0]["StatusText"].ToString();
                Gridview1.DataSource = dtGrid;
                Gridview1.DataBind();
            }
            else
            {

                marksDtlTble.Visible = false;
            }

            if (dt.Tables[0].Rows.Count != 0)
            {
                lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
                lblAppNo.Text = dtApp.Rows[0]["AppID"].ToString();
                lblAadhaar.Text = dtApp.Rows[0]["UIDNo"].ToString();
                AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"]).ToString("dd/MM/yyyy HH:mm:ss");
                lblAppname.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
                lblDOB.Text = dtApp.Rows[0]["DOB"].ToString();
                lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();

                lblRegistration.Text = dtApp.Rows[0]["RegistrationNo"].ToString();
                lblRollNo.Text = dtApp.Rows[0]["RollNo"].ToString();
                lblAdmission.Text = dtApp.Rows[0]["AdmissionYear"].ToString();
                lblPassing.Text = dtApp.Rows[0]["PassingYear"].ToString();
                lblLeaving.Text = dtApp.Rows[0]["LastExamDate"].ToString();
                lblInstitute.Text = dtApp.Rows[0]["CollegeName"].ToString();
                //lblDetails.Text = dtApp.Rows[0]["ExaminationDetails"].ToString();
                lblReason.Text = dtApp.Rows[0]["Reason"].ToString();
                
                lblCourse.Text = dtApp.Rows[0]["Program"].ToString();

                lblSubject1.Text = dtApp.Rows[0]["Subject1"].ToString();
                lblSubject2.Text = dtApp.Rows[0]["Subject2"].ToString();
                lblSubject3.Text = dtApp.Rows[0]["Subject3"].ToString();
                lblSubject4.Text = dtApp.Rows[0]["Subject4"].ToString();

                lblCertificateName.Text = dtTransDetail.Rows[0]["ServiceName"].ToString();
                lblDeptName.InnerHtml = dtTransDetail.Rows[0]["DepartmentName"].ToString();

                lblvillage.Text = dtApp.Rows[0]["VillageName"].ToString();
                lbltaluka.Text = dtApp.Rows[0]["SubDistrictName"].ToString();
                lbldist.Text = dtApp.Rows[0]["DistrictName"].ToString();
                lblpin.Text = dtApp.Rows[0]["Pincode"].ToString();
                lblMobile.Text = dtApp.Rows[0]["MobileNo"].ToString();
                lblEmail.Text = dtApp.Rows[0]["EmailID"].ToString();
                lblapplicant_address.Text = dtApp.Rows[0]["FullAddress"].ToString();
                lblAppID.Text = dtTransDetail.Rows[0]["AppID"].ToString();
               
                AppName.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                lblTrnsID.InnerHtml = dtTransDetail.Rows[0]["TrnID"].ToString();
                lblTrnsDate.InnerHtml = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy");
                //lblPayStatus.Text = dtTransDetail.Rows[0]["Paid_status"].ToString();
                lblTotalFee.Text = dtTransDetail.Rows[0]["total"].ToString();
                lblAmtWord.Text = dtTransDetail.Rows[0]["AmtInText"].ToString();
                ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();

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
            else
            { QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID); }
        }
    }
}