using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Complaint
{
    public partial class Acknowledgement : System.Web.UI.Page
    {
        ComplaintRegistrationBLL m_ComplaintRegistrationBLL = new ComplaintRegistrationBLL();
        string m_AppID, m_ServiceID;
        private object lblAmtInText;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();


            DataSet dt = m_ComplaintRegistrationBLL.GetAppDetails(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[1];

            lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
            lblAadhaar.Text = dtApp.Rows[0]["UIDNo"].ToString(); //UID No
            lblappdate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"]).ToString("dd/MM/yyyy");
            lblAppname.Text = dtApp.Rows[0]["ApplicantName"].ToString();            
            lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();
            lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
            lblDOB.Text = Convert.ToDateTime(dtApp.Rows[0]["DOB"].ToString()).ToString("dd/MM/yyyy");
                        
            lblapplicant_address.Text = dtApp.Rows[0]["FullAddress"].ToString();
            lbldist.Text = dtApp.Rows[0]["DistrictName"].ToString();
            lbltaluka.Text = dtApp.Rows[0]["SubDistrictName"].ToString();
            lblpin.Text = dtApp.Rows[0]["Pincode"].ToString();
            lblvillage.Text = dtApp.Rows[0]["VillageName"].ToString();
            lbltaluka.Text = dtApp.Rows[0]["SubDistrictName"].ToString();
            lbldist.Text = dtApp.Rows[0]["DistrictName"].ToString();
            lblpin.Text = dtApp.Rows[0]["Pincode"].ToString();
            lblMobile.Text = dtApp.Rows[0]["MobileNo"].ToString();
            lblEmailID.Text = dtApp.Rows[0]["emailId"].ToString();

            lblService.Text = dtApp.Rows[0]["Services"].ToString();
            lblComplaintType.Text = dtApp.Rows[0]["ComplaintType"].ToString();
            lblDepartment.Text = dtApp.Rows[0]["Department"].ToString();
            lblDistrict.Text = dtApp.Rows[0]["DistrictName"].ToString();
            lblOffice.Text = dtApp.Rows[0]["OfficeName"].ToString();
            lblOfficer.Text = dtApp.Rows[0]["OfficerName"].ToString();
            lblDated.Text = dtApp.Rows[0]["ApplicationDate"].ToString();
            lblAck.Text = dtApp.Rows[0]["ReferenceID"].ToString();
            lblComplainDesc.Text = dtApp.Rows[0]["ComplaintDescription"].ToString();
            AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"].ToString()).ToString("dd/MM/yyyy");

            ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();

            if (dtTransDetail.Rows.Count != 0)
            {
                tblTrans.Attributes.Add("style", "");
                lblAmt.Text = dtTransDetail.Rows[0]["AmtInText"].ToString();
                TokenNo.Text = dtTransDetail.Rows[0]["AppID"].ToString();
                lblCertificateName.Text = dtTransDetail.Rows[0]["ServiceName"].ToString();
                lblDeptName.InnerHtml = dtTransDetail.Rows[0]["DepartmentName"].ToString();
                lblTrnsID.Text = dtTransDetail.Rows[0]["TrnID"].ToString();
                lblTrnsDate.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy");
                lblAppFee.Text = dtTransDetail.Rows[0]["govt"].ToString();
                lblServTax.Text = dtTransDetail.Rows[0]["misc_charges_01"].ToString();
                lblPortalFee.Text = dtTransDetail.Rows[0]["portal_serv_fee"].ToString();
                lblTotalFee.Text = dtTransDetail.Rows[0]["total"].ToString();

                lbl1Date.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).AddDays(30).ToString("dd/MM/yyyy");
            }
            else
            {
                tblTrans.Attributes.Add("style","display:none");
            }
            // lbl2Date.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).AddDays(20).ToString("dd/MM/yyyy");
            //lbl3Date.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).AddDays(30).ToString("dd/MM/yyyy");
            /*
             lblDDOB.Text = dtApp.Rows[0]["IFSCCode"].ToString();
             lblDDOD.Text = dtApp.Rows[0]["IFSCCode"].ToString();
             lblAge.Text = dtApp.Rows[0]["IFSCCode"].ToString();
             lblDAddress.Text = dtApp.Rows[0]["IFSCCode"].ToString();
             lblDVillage.Text = dtApp.Rows[0]["IFSCCode"].ToString();
             lblDBlock.Text = dtApp.Rows[0]["IFSCCode"].ToString();
             lblDDistrict.Text = dtApp.Rows[0]["IFSCCode"].ToString();
             lblDPin.Text = dtApp.Rows[0]["IFSCCode"].ToString();
             */
             
            DataTable dtDocument = dt.Tables[2];
            if (dtDocument.Rows.Count != 0)
            {
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
            }
            try
            {
                QRCode1.GenerateQRCodeApplication(m_ServiceID, m_AppID);
            }
            catch(Exception ex) { }
            btnHome.PostBackUrl = Session["HomePage"].ToString();
        }
    }
}
