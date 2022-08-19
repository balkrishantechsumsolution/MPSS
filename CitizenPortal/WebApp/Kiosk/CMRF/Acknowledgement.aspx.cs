using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.CMRF
{
    public partial class Acknowledgement : System.Web.UI.Page
    {
        CMRFBLL m_CMRFBLL = new CMRFBLL();
        string m_AppID, m_ServiceID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();


            DataSet dt = m_CMRFBLL.GetAppDetails(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];

            DataTable dtTransDetail = dt.Tables[1];
            lblAutherizePerson.Text= dtApp.Rows[0]["CurrentOwnerID"].ToString();
            lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
            lblAadhaar.Text = dtApp.Rows[0]["UIDNo"].ToString(); //UID No
            lblappdate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"]).ToString("dd/MM/yyyy");
            lblAppname.Text = dtApp.Rows[0]["ApplicantName"].ToString();

            lblFather.Text = dtApp.Rows[0]["DiseaseName"].ToString();
            lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
            lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();
            lblDOB.Text = dtApp.Rows[0]["DOB"].ToString();

            lblAmt.Text = "Rs. " + dtApp.Rows[0]["FundAmount"].ToString();
            lblOccupation.Text = dtApp.Rows[0]["Occupation"].ToString();
            lblType.Text = dtApp.Rows[0]["ApplicationType"].ToString();
            lblCategory.Text = dtApp.Rows[0]["ApplicationCategory"].ToString();
            lblPurpose.Text = dtApp.Rows[0]["FundPurpose"].ToString();
            
            if (dtApp.Rows[0]["FundReceivedEarlier"].ToString() == "0")
            {
                divEarlier.Visible = false;
                divEarlier.Attributes.Add("style","display:none;");
            }
            else
            {
                divEarlier.Visible = true;
                //divEarlier.Attributes.Add("style", "display:block;");
                lblFundRece.Text = dtApp.Rows[0]["FundReceivedPurpose"].ToString();
                lblEarlierAmt.Text = "Rs. " + dtApp.Rows[0]["FundReceivedAmount"].ToString();
            }
            lblRecommended.Text = dtApp.Rows[0]["RecommendedBy"].ToString();
            lblRemark.Text = dtApp.Rows[0]["RemarkRecom"].ToString();

            lblapplicant_address.Text = dtApp.Rows[0]["FullAddress"].ToString();
            lblvillage.Text = dtApp.Rows[0]["village"].ToString();
            lbltaluka.Text = dtApp.Rows[0]["SubDistrict"].ToString();
            lbldist.Text = dtApp.Rows[0]["District"].ToString();
            lblpin.Text = dtApp.Rows[0]["Pincode"].ToString();
            lblMobile.Text = dtApp.Rows[0]["MobileNo"].ToString();
                        
            lblAgri.Text = "From Agriculture Rs." + dtApp.Rows[0]["AgricultureIncome"].ToString();
            lblSal.Text = "From Salary Rs." + dtApp.Rows[0]["SalaryIncome"].ToString();
            lblOth.Text = "From Other Rs." + dtApp.Rows[0]["OtherIncome"].ToString();


            //lblTot.Text = "Annual Income Rs." + (Convert.ToInt32(dtApp.Rows[0]["AgricultureIncome"].ToString()) +
            //Convert.ToInt32(dtApp.Rows[0]["SalaryIncome"].ToString()) +
            //Convert.ToInt32(dtApp.Rows[0]["OtherIncome"].ToString())).ToString();

            divDeseased.Attributes.Add("style", "display:none;");

            //if (dtApp.Rows[0]["IsHandDiseased"].ToString() == "0")
            //{
            //    divDeseased.Visible = false;
            //    divDeseased.Attributes.Add("style", "display:none;");
            //}
            //else
            //{
            //    divDeseased.Visible = true;
            //    //divDeseased.Attributes.Add("style", "display:block;");
            //    lblDiseased.Text = dtApp.Rows[0]["DiseaseName"].ToString();
            //    lblAppratus.Text = dtApp.Rows[0]["Appratus"].ToString();
            //    lblMedCost.Text = "Rs. " + dtApp.Rows[0]["MedicineCost"].ToString();
            //    lblExpenditure.Text = "Rs. " + dtApp.Rows[0]["OtherExpenditure"].ToString();
            //    lblPlace.Text = dtApp.Rows[0]["TreatmentPlace"].ToString();
            //    lblReason.Text = dtApp.Rows[0]["TreatmentReason"].ToString();
            //}
            //TreatmentRequired
            TokenNo.Text = dtTransDetail.Rows[0]["AppID"].ToString();
            AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"].ToString()).ToString("dd/MM/yyyy");
            lblCertificateName.Text = "Chief Minister Relife Fund (CMRF)";
            lblKiosk.Text = dtTransDetail.Rows[0]["CreatedBy"].ToString();
            lblTrnsID.Text = dtTransDetail.Rows[0]["TrnID"].ToString();
            lblTrnsDate.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy");
            lblAppFee.Text = dtTransDetail.Rows[0]["govt"].ToString();
            lblServTax.Text = dtTransDetail.Rows[0]["misc_charges_01"].ToString();
            lblPortalFee.Text = dtTransDetail.Rows[0]["portal_serv_fee"].ToString();
            lblTotalFee.Text = dtTransDetail.Rows[0]["total"].ToString();

            //lbl1Date.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).AddDays(10).ToString("dd/MM/yyyy");
            //lbl2Date.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).AddDays(20).ToString("dd/MM/yyyy");
            //ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();
            ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();//"data:image/png;base64," +
            try
            {

                QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);
            }
            catch { }
        }
    }
}