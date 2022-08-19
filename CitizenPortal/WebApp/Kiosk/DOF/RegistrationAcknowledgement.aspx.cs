using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Data;

namespace CitizenPortal.WebApp.Kiosk.DOF
{
    public partial class RegistrationAcknowledgement : BasePage
    {
        FisheriesRegistrationBLL m_FisheriesRegistrationBLL = new FisheriesRegistrationBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Loading Page
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet dt = m_FisheriesRegistrationBLL.GetAppDetails(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[1];

            if (dtApp.Rows.Count != 0)
            {
                lblAadhaar.Text = dtApp.Rows[0]["UIDNO"].ToString();
                lblAppname.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();
                lblMother.Text = "";
                lblDOB.Text = Convert.ToDateTime(dtApp.Rows[0]["DOB"].ToString()).ToString("dd/MM/yyyy");
                lblFthrAge.Text = "";
                lblMtherAge.Text = "";
                lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
                lblReligion.Text = dtApp.Rows[0]["Religion"].ToString();
                lblCategory.Text = dtApp.Rows[0]["Category"].ToString();
                lblEml.Text = dtApp.Rows[0]["EmailId"].ToString();
                lblMobile.Text = dtApp.Rows[0]["MobileNo"].ToString();

                ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();//"data:image/png;base64," +
                lblapplicant_address.Text = dtApp.Rows[0]["FullAddress"].ToString();

                lbltaluka.Text = dtApp.Rows[0]["BlockName"].ToString();
                lbldist.Text = dtApp.Rows[0]["DistrictName"].ToString();
                lblvillage.Text = dtApp.Rows[0]["VillageName"].ToString();
                lblpin.Text = dtApp.Rows[0]["pincode"].ToString();

                lblAcHolder.Text = dtApp.Rows[0]["VesselName"].ToString();
                lblRegistrationNo.Text = dtApp.Rows[0]["VesselRegNo"].ToString();
                lblWhereVessel.Text = dtApp.Rows[0]["VesselWhere"].ToString();
                lblWhenVessel.Text = dtApp.Rows[0]["VesselWhen"].ToString();

                lblBoatType.Text = dtApp.Rows[0]["VesselBoatType"].ToString();
                lblBoatMaterial.Text = dtApp.Rows[0]["VesselMaterials"].ToString();
                lblBoatSheathing.Text = dtApp.Rows[0]["VesselSheathing"].ToString();

                lblBoatLength.Text = dtApp.Rows[0]["BoatLength"].ToString();
                lblBoatBreadth.Text = dtApp.Rows[0]["BoatBreadth"].ToString();
                lblEngineVHP.Text = dtApp.Rows[0]["EngineVHP"].ToString();
                lblEngineNo.Text = dtApp.Rows[0]["EngineNo"].ToString();
                lblTradeMark.Text = dtApp.Rows[0]["TradeMark"].ToString();
                lblVesselType.Text = dtApp.Rows[0]["VesselType"].ToString();
                lblVesselGear.Text = dtApp.Rows[0]["VesselGearType"].ToString();
                lblBoatConstPlace.Text = dtApp.Rows[0]["VesselBoatPlace"].ToString();
                lblBoatYardName.Text = dtApp.Rows[0]["VesselBoatName"].ToString();
                lblBoatConstYear.Text = dtApp.Rows[0]["VesselBaseYear"].ToString();
                lblOperateBase.Text = dtApp.Rows[0]["VesselConsYear"].ToString();
                lblCrewNo.Text = dtApp.Rows[0]["NofCrews"].ToString();
                lblCrewDesignation.Text = dtApp.Rows[0]["CrewsDesignation"].ToString();

                if (dtTransDetail.Rows.Count != 0)
                {
                    lblReferenceID.Text = dtTransDetail.Rows[0]["AppID"].ToString();
                    lblTrnsID.Text = dtTransDetail.Rows[0]["TrnID"].ToString();
                    lblTrnsDate.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy");
                    lblAmt.Text = dtTransDetail.Rows[0]["total"].ToString();
                    AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"]).ToString("dd/MM/yyyy");
                }

                //if (dtTrackStatus.Rows.Count != 0)
                //{
                //    //lblCertificateName.Text = dtTrackStatus.Rows[0]["ServiceName"].ToString();
                //    //lbldepartment.Text = dtTrackStatus.Rows[0]["DepartmentName"].ToString();
                //}
                ////

                //ProfileSignature.Src = dtApp.Rows[0]["Signature"].ToString();


                try
                {
                    QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);
                }
                catch { }
            }
        }
    }
}