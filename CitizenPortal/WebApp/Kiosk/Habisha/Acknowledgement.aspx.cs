using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Habisha
{
    public partial class Acknowledgement : System.Web.UI.Page
    {        
        HSBTBLL m_HabishaBLL = new HSBTBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();


            DataSet dt = m_HabishaBLL.GetHabishaData(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[1];
            DataTable dtTrackStatus = dt.Tables[2];

            if (dt.Tables[0].Rows.Count != 0)
            {
                lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
                lblAadhaar.Text = dtApp.Rows[0]["UIDNo"].ToString();
                AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"]).ToString("dd/MM/yyyy HH:mm:ss");
                lblAppname.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
                lblDOB.Text = dtApp.Rows[0]["DOB"].ToString();
                lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();

                lblDOJ.Text = dtApp.Rows[0]["date_jouney"].ToString();
                lblDOR.Text = dtApp.Rows[0]["date_return"].ToString();
                lblDisease.Text = dtApp.Rows[0]["disease_detail"].ToString();
                lblReason.Text = dtApp.Rows[0]["disease_history"].ToString();

                lblapplicant_address.Text = dtApp.Rows[0]["FullAddress"].ToString();
                lblvillage.Text = dtApp.Rows[0]["VillageName"].ToString();
                lbltaluka.Text = dtApp.Rows[0]["SubDistrictName"].ToString();
                lbldist.Text = dtApp.Rows[0]["DistrictName"].ToString();
                lblpin.Text = dtApp.Rows[0]["Pincode"].ToString();
                lblMobile.Text = dtApp.Rows[0]["MobileNo"].ToString();

                if (dtApp.Rows[0]["atende_detail"].ToString() != null && dtApp.Rows[0]["atende_detail"].ToString() != "")
                {
                    divAttendee.Attributes.Add("style", "display:block");
                    lblAttAddress.Text = dtApp.Rows[0]["AttFullAddress"].ToString();
                    lblAttendee.Text = dtApp.Rows[0]["atende_detail"].ToString();
                    lblAttPhone.Text = dtApp.Rows[0]["atende_phone"].ToString();
                    lblAttVillage.Text = dtApp.Rows[0]["AttendeePanchayat"].ToString();
                    lblAttBlock.Text = dtApp.Rows[0]["AttendeeBlock"].ToString();
                    lblAttDistrict.Text = dtApp.Rows[0]["AttendeeDistrict"].ToString();
                    lblAttPin.Text = dtApp.Rows[0]["Pincode"].ToString();
                }
                else
                { divAttendee.Attributes.Add("style", "display:none"); }
                lblAppID.Text = dtTransDetail.Rows[0]["AppID"].ToString();
                lblCertificateName.Text = dtTrackStatus.Rows[0]["ServiceName"].ToString();
                //lbldepartment.Text = dtTrackStatus.Rows[0]["DepartmentName"].ToString();
                AppName.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                lblTrnsID.InnerHtml = dtTransDetail.Rows[0]["TrnID"].ToString();
                lblTrnsDate.InnerHtml = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy");
                lblAppFee.Text = dtTransDetail.Rows[0]["govt"].ToString();
                lblServTax.Text = dtTransDetail.Rows[0]["misc_charges_01"].ToString();
                lblPortalFee.Text = dtTransDetail.Rows[0]["portal_serv_fee"].ToString();
                lblTotalFee.Text = dtTransDetail.Rows[0]["total"].ToString();

                ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();

                try
                {

                    QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);

                }
                catch { }
            }

        }
    }
}