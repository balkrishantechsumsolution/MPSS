using CitizenPortal.WebApp.Common.QRCode;
using CitizenPortalLib;
using CitizenPortalLib.BLL;
using java.lang;
using javax.security.auth;
using Org.BouncyCastle.Asn1.IsisMtt.X509;
using SqlHelper;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class ViewAcknowledgeCorrespondent : CommonBasePage
    {
      
        string m_UserID, m_ServiceID;
        static data sqlhelper = new data();

        protected void Page_Load(object sender, EventArgs e)
         {
            //if (Request.QueryString["AppID"] == null) return;
            //if (Request.QueryString["SvcID"] != null) { m_ServiceID = '' }

            m_UserID = Session["LoginID"].ToString();


            DataTable dtApp = new DataTable();
            SqlParameter[] parameter = {
                 new SqlParameter("@UserID", m_UserID),
                 new SqlParameter("@ServiceID", "1469")
            };

            dtApp = sqlhelper.ExecuteDataTable("GetCorrespondentRenewalSP", parameter);
           

            if (dtApp.Rows.Count != 0)
            {

                txtSocietyName.Text = dtApp.Rows[0]["SocietyName"].ToString();
                txtSchoolName.Text = dtApp.Rows[0]["SchoolName"].ToString();
                txtSchoolAddress.Text = dtApp.Rows[0]["SchoolAddress"].ToString();
                txtHouse.Text = dtApp.Rows[0]["House"].ToString();
                txtColony.Text = dtApp.Rows[0]["Colony"].ToString();
                txtCity.Text = dtApp.Rows[0]["City"].ToString();
                txtBlock.Text = dtApp.Rows[0]["Block"].ToString();
                txtDistrict.Text = dtApp.Rows[0]["District"].ToString();
                txtPinCode.Text = dtApp.Rows[0]["PinCode"].ToString();
                txtSchoolMobile.Text = dtApp.Rows[0]["SchoolMobile"].ToString();
                txtSoceityRegNo.Text = dtApp.Rows[0]["SoceityRegNo"].ToString();
                txtSoceityRegDate.Text = dtApp.Rows[0]["SoceityRegDate"].ToString();
                txtSoceityValDate.Text = dtApp.Rows[0]["SoceityValDate"].ToString();
                txtPANNO.Text = dtApp.Rows[0]["PANNO"].ToString();
                txtSoceityNoOfMember.Text = dtApp.Rows[0]["SoceityNoOfMember"].ToString();
                txtSocietyDirectorName.Text = dtApp.Rows[0]["SocietyDirectorName"].ToString();
                txtSocietyCity.Text = dtApp.Rows[0]["SocietyCity"].ToString();
                txtSocietyPost.Text = dtApp.Rows[0]["SocietyPost"].ToString();
                txtSocietyDistrict.Text = dtApp.Rows[0]["SocietyDistrict"].ToString();
                txtSocietyPinCode.Text = dtApp.Rows[0]["SocietyPinCode"].ToString();
                txtSocietyMobileNo.Text = dtApp.Rows[0]["SocietyMobileNo"].ToString();
                txtSocietyOtherOperated.Text = dtApp.Rows[0]["SocietyOtherOperated"].ToString();
                txtMunicipalCorp.Text = dtApp.Rows[0]["MunicipalCorp"].ToString();
                txtDisSchoolHeadQuater.Text = dtApp.Rows[0]["DisSchoolHeadQuater"].ToString();
                txtNrPoliceSt.Text = dtApp.Rows[0]["NrPoliceSt"].ToString();
                txtNrPoliceStDistance.Text = dtApp.Rows[0]["NrPoliceStDistance"].ToString();
                txtNrPoliceStDivision.Text = dtApp.Rows[0]["NrPoliceStDivision"].ToString();
                txtNrPolicePhNo.Text = dtApp.Rows[0]["NrPolicePhNo"].ToString();
                txtNrGovtHighSch.Text = dtApp.Rows[0]["NrGovtHighSch"].ToString();
                txtNrGovtHighSchAdd.Text = dtApp.Rows[0]["NrGovtHighSchAdd"].ToString();
                txtNrGovtHighSchDistance.Text = dtApp.Rows[0]["NrGovtHighSchDistance"].ToString();
                txtNrGovtHigherSch.Text = dtApp.Rows[0]["NrGovtHigherSch"].ToString();
                txtNrGovtHigherSchAdd.Text = dtApp.Rows[0]["NrGovtHigherSchAdd"].ToString();
                txtNrGovtHigherSchDist.Text = dtApp.Rows[0]["NrGovtHigherSchDist"].ToString();
                txtNrPvtHighSch.Text = dtApp.Rows[0]["NrPvtHighSch"].ToString();
                txtNrPvtHighSchAdd.Text = dtApp.Rows[0]["NrPvtHighSchAdd"].ToString();
                txtNrPvtHigherSch.Text = dtApp.Rows[0]["NrPvtHigherSch"].ToString();
                txtNrPvtHigherSchAdd.Text = dtApp.Rows[0]["NrPvtHigherSchAdd"].ToString();
                txtNrPvtHigherSchDist.Text = dtApp.Rows[0]["NrPvtHigherSchDist"].ToString();
                txtBrdUni.Text = dtApp.Rows[0]["BrdUni"].ToString();
                txtFromDate.Text = dtApp.Rows[0]["FromDate"].ToString();
                txtRegNo.Text = dtApp.Rows[0]["RegNo"].ToString();
                txtRegDate.Text = dtApp.Rows[0]["RegDate"].ToString();
                txtRunCommitteeSch.Text = dtApp.Rows[0]["RunCommitteeSch"].ToString();
                txtSchPraveshika.Text = dtApp.Rows[0]["SchPraveshika"].ToString();
                txtSankiyadetLKG.Text = dtApp.Rows[0]["SankiyadetLKG"].ToString();
                txtSankiyadetUKG.Text = dtApp.Rows[0]["SankiyadetUKG"].ToString();
                txtSankiyadetCls14.Text = dtApp.Rows[0]["SankiyadetCls14"].ToString();
                txtSankiyadetClsPrav.Text = dtApp.Rows[0]["SankiyadetClsPrav"].ToString();
                txtSankiyadetClsPrathma.Text = dtApp.Rows[0]["SankiyadetClsPrathma"].ToString();
                txtSankiyadetClsDuti.Text = dtApp.Rows[0]["SankiyadetClsDuti"].ToString();
                txtSankiyadetClsAnti.Text = dtApp.Rows[0]["SankiyadetClsAnti"].ToString();
                txtSankiyadetClsPoravePth.Text = dtApp.Rows[0]["SankiyadetClsPoravePth"].ToString();
                txtSankiyadetClsPoraveAnti.Text = dtApp.Rows[0]["SankiyadetClsPoraveAnti"].ToString();
                txtSankiyadetClsPoraveUtt.Text = dtApp.Rows[0]["SankiyadetClsPoraveUtt"].ToString();
                txtSankiyadetClsPoraveUttAnti.Text = dtApp.Rows[0]["SankiyadetClsPoraveUttAnti"].ToString();
                txtHeadMist.Text = dtApp.Rows[0]["HeadMist"].ToString();
                txtHeadMistQual.Text = dtApp.Rows[0]["HeadMistQual"].ToString();
                txtPrinMist.Text = dtApp.Rows[0]["PrinMist"].ToString();
                txtPrinMistQual.Text = dtApp.Rows[0]["PrinMistQual"].ToString();
                txtSQTDED.Text = dtApp.Rows[0]["SQTDED"].ToString();
                txtSQTBTI.Text = dtApp.Rows[0]["SQTBTI"].ToString();
                txtSQTMED.Text = dtApp.Rows[0]["SQTMED"].ToString();
                txtSQTBED.Text = dtApp.Rows[0]["SQTBED"].ToString();
                txtSQTShikSha.Text = dtApp.Rows[0]["SQTShikSha"].ToString();
                txtPQTDED.Text = dtApp.Rows[0]["PQTDED"].ToString();
                txtPQTBTI.Text = dtApp.Rows[0]["PQTBTI"].ToString();
                txtPQTMED.Text = dtApp.Rows[0]["PQTMED"].ToString();
                txtPQTBED.Text = dtApp.Rows[0]["PQTBED"].ToString();
                txtPQTShikshaSha.Text = dtApp.Rows[0]["PQTShikshaSha"].ToString();             
                txtHCQTMED.Text = dtApp.Rows[0]["HCQTMED"].ToString();
                txtHCQTBED.Text = dtApp.Rows[0]["HCQTBED"].ToString();
                txtHCQTShikshaSha.Text = dtApp.Rows[0]["HCQTShikshaSha"].ToString();
                txtHCQTDED.Text = dtApp.Rows[0]["HCQTDED"].ToString();
                txtHCQTBTI.Text = dtApp.Rows[0]["HCQTBTI"].ToString();
                txtAQTMED.Text = dtApp.Rows[0]["AQTMED"].ToString();
                txtAQTBED.Text = dtApp.Rows[0]["AQTBED"].ToString();
                txtAQTShikshaSha.Text = dtApp.Rows[0]["AQTShikshaSha"].ToString();
                txtAQTDED.Text = dtApp.Rows[0]["AQTDED"].ToString();
                txtAQTBTI.Text = dtApp.Rows[0]["AQTBTI"].ToString();
                txtAQTPTI.Text = dtApp.Rows[0]["AQTPTI"].ToString();
                txtAssitTeachSci.Text = dtApp.Rows[0]["AssitTeachSci"].ToString();
                txtStudMed.Text = dtApp.Rows[0]["StudMed"].ToString();
                txtFeesPrathama.Text = dtApp.Rows[0]["FeesPrathama"].ToString();
                txtFeesPurvamadiyma.Text = dtApp.Rows[0]["FeesPurvamadiyma"].ToString();
                txtFeesUttarmadiyma.Text = dtApp.Rows[0]["FeesUttarmadiyma"].ToString();
                txtLedger.Text = dtApp.Rows[0]["Ledger"].ToString();
                txtAssistantOff.Text = dtApp.Rows[0]["AssistantOff"].ToString();
                txtFourthGrade.Text = dtApp.Rows[0]["FourthGrade"].ToString();
                txtMorgFT.Text = dtApp.Rows[0]["MorgFT"].ToString();
                txtMorgFC.Text = dtApp.Rows[0]["MorgFC"].ToString();
                txtMorgTT.Text = dtApp.Rows[0]["MorgTT"].ToString();
                txtMorgTC.Text = dtApp.Rows[0]["MorgTC"].ToString();
                txtAFTMorgFT.Text = dtApp.Rows[0]["AFTMorgFT"].ToString();
                txtAFTMorgFC.Text = dtApp.Rows[0]["AFTMorgFC"].ToString();
                txtAFTMorgTT.Text = dtApp.Rows[0]["AFTMorgTT"].ToString();
                txtAFTMorgTC.Text = dtApp.Rows[0]["AFTMorgTC"].ToString();
                txtKhasra.Text = dtApp.Rows[0]["Khasra"].ToString();
                txtArea.Text = dtApp.Rows[0]["Area"].ToString();
                txtRentAdd.Text = dtApp.Rows[0]["RentAdd"].ToString();
                txtRentOwnerAdd.Text = dtApp.Rows[0]["RentOwnerAdd"].ToString();
                txtAreaSchLand.Text = dtApp.Rows[0]["AreaSchLand"].ToString();
                txtAreaSchBuildLand.Text = dtApp.Rows[0]["AreaSchBuildLand"].ToString();
                txtTotalAreaSchBuild.Text = dtApp.Rows[0]["TotalAreaSchBuild"].ToString();
                txtTotalAreaSchBuildEmty.Text = dtApp.Rows[0]["TotalAreaSchBuildEmty"].ToString();
                txtNoOFClsStudy.Text = dtApp.Rows[0]["NoOFClsStudy"].ToString();
                txtFDArea.Text = dtApp.Rows[0]["FDArea"].ToString();
                txtFDSqFT.Text = dtApp.Rows[0]["FDSqFT"].ToString();
                txtNoOFRoomsTEACH.Text = dtApp.Rows[0]["NoOFRoomsTEACH"].ToString();
                txtNoOFRoomsTEACHArea.Text = dtApp.Rows[0]["NoOFRoomsTEACHArea"].ToString();
                txtNoOFRoomsTEACHSqFT.Text = dtApp.Rows[0]["NoOFRoomsTEACHSqFT"].ToString();
                txtNoOFRoomsLabLib.Text = dtApp.Rows[0]["NoOFRoomsLabLib"].ToString();
                txtNoOFRoomsLabLibArea.Text = dtApp.Rows[0]["NoOFRoomsLabLibArea"].ToString();
                txtNoOFRoomsLabLibSqFT.Text = dtApp.Rows[0]["NoOFRoomsLabLibSqFT"].ToString();
                txtPlayArea.Text = dtApp.Rows[0]["PlayArea"].ToString();
                txtPlaySqFT.Text = dtApp.Rows[0]["PlaySqFT"].ToString();
                txtTotalNoToil.Text = dtApp.Rows[0]["TotalNoToil"].ToString();
                txtTotalNoToilGl.Text = dtApp.Rows[0]["TotalNoToilGl"].ToString();
                txtTotalNoToilBY.Text = dtApp.Rows[0]["TotalNoToilBY"].ToString();
                txtEqipWater.Text = dtApp.Rows[0]["EqipWater"].ToString();
                txtSubLabNum.Text = dtApp.Rows[0]["SubLabNum"].ToString();
                txtSubLabArea.Text = dtApp.Rows[0]["SubLabArea"].ToString();
                txtSubLabSqFT.Text = dtApp.Rows[0]["SubLabSqFT"].ToString();
                txtNoBooks.Text = dtApp.Rows[0]["NoBooks"].ToString();
                txtAreaLib.Text = dtApp.Rows[0]["AreaLib"].ToString();
                txtSqFTLib.Text = dtApp.Rows[0]["SqFTLib"].ToString();
                txtTotFurt.Text = dtApp.Rows[0]["TotFurt"].ToString();
                txtTotFurtGB.Text = dtApp.Rows[0]["TotFurtGB"].ToString();
                txtTotChaires.Text = dtApp.Rows[0]["TotChaires"].ToString();
                txtTotBenches.Text = dtApp.Rows[0]["TotBenches"].ToString();
                txtTotFurtStaff.Text = dtApp.Rows[0]["TotFurtStaff"].ToString();
                txtTotChairStaff.Text = dtApp.Rows[0]["TotChairStaff"].ToString();
                txtTotAlmariresStaff.Text = dtApp.Rows[0]["TotAlmariresStaff"].ToString();
                txtTotComp.Text = dtApp.Rows[0]["TotComp"].ToString();
                txtTotPrinter.Text = dtApp.Rows[0]["TotPrinter"].ToString();
                txtTotFaxes.Text = dtApp.Rows[0]["TotFaxes"].ToString();
                txtTotOther.Text = dtApp.Rows[0]["TotOther"].ToString();
                txtTotFireExt.Text = dtApp.Rows[0]["TotFireExt"].ToString();
                txtSummittedAmt.Text = dtApp.Rows[0]["SummittedAmt"].ToString();
                txtPhyHandStudFact.Text = dtApp.Rows[0]["PhyHandStudFact"].ToString();

                //rbPhyHandStudAdPrv1.Checked = dtApp.Rows[0]["PhyHandStudAdPrv"].ToString();
                //rbCRCS1.Checked = dtApp.Rows[0]["CRCS1"].ToString();
                //rbElectric1.Checked = dtApp.Rows[0]["Electric"].ToString();
                //rbSchoolType1.Checked = dtApp.Rows[0]["SchoolType"].ToString();
                //rbSocietyBrd1.Checked = dtApp.Rows[0]["SocietyBrd1"].ToString();
                //rbOAreaSchoolOperated1.Checked = dtApp.Rows[0]["OAreaSchoolOperated"].ToString();

                //var fileLabEqip = dtApp.Rows[0]["fileLabEqip"].ToString();
                //var fileRentAgree = dtApp.Rows[0]["fileRentAgree"].ToString();
                //var fileKhasra = dtApp.Rows[0]["fileKhasra"].ToString();
                //var fileAttTime = dtApp.Rows[0]["fileAttTime"].ToString();
                //var fileTeachSht = dtApp.Rows[0]["fileTeachSht"].ToString();


            }
        }
      
    }
}