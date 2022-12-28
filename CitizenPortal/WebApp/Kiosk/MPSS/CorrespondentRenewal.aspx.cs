using CitizenPortalLib.DataStructs;
using iTextSharp.text.pdf;
using Newtonsoft.Json;
using SqlHelper;
using sun.security.jca;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class CorrespondentRenewal : System.Web.UI.Page
    {
        static data sqlhelper = new data();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string m_UserID= Session["LoginID"].ToString();

                Correspondends_DT t_ObjDT = new Correspondends_DT();
                t_ObjDT.SocietyName = txtSocietyName.Text.Trim();
                t_ObjDT.SchoolName = txtSchoolName.Text.Trim();
                t_ObjDT.SchoolAddress = txtSchoolAddress.Text.Trim();
                t_ObjDT.House = txtHouse.Text.Trim();
                t_ObjDT.Colony = txtColony.Text.Trim();
                t_ObjDT.City = txtCity.Text.Trim();
                t_ObjDT.Block = txtBlock.Text.Trim();
                t_ObjDT.District = txtDistrict.Text.Trim();
                t_ObjDT.PinCode = txtPinCode.Text.Trim();
                t_ObjDT.SchoolMobile = txtSchoolMobile.Text.Trim();
                t_ObjDT.SoceityRegNo = txtSoceityRegNo.Text.Trim();
                t_ObjDT.SoceityRegDate = txtSoceityRegDate.Text.Trim();
                t_ObjDT.SoceityValDate = txtSoceityValDate.Text.Trim();
                t_ObjDT.PANNO = txtPANNO.Text.Trim();
                t_ObjDT.SoceityNoOfMember = txtSoceityNoOfMember.Text.Trim();
                t_ObjDT.SocietyDirectorName = txtSocietyDirectorName.Text.Trim();
                t_ObjDT.SocietyCity = txtSocietyCity.Text.Trim();
                t_ObjDT.SocietyPost = txtSocietyPost.Text.Trim();
                t_ObjDT.SocietyDistrict = txtSocietyDistrict.Text.Trim();
                t_ObjDT.SocietyPinCode = txtSocietyPinCode.Text.Trim();
                t_ObjDT.SocietyMobileNo = txtSocietyMobileNo.Text.Trim();
                t_ObjDT.SocietyOtherOperated = txtSocietyOtherOperated.Text.Trim();
                t_ObjDT.MunicipalCorp = txtMunicipalCorp.Text.Trim();
                t_ObjDT.DisSchoolHeadQuater = txtDisSchoolHeadQuater.Text.Trim();
                t_ObjDT.NrPoliceSt = txtNrPoliceSt.Text.Trim();
                t_ObjDT.NrPoliceStDistance = txtNrPoliceStDistance.Text.Trim();
                t_ObjDT.NrPoliceStDivision = txtNrPoliceStDivision.Text.Trim();
                t_ObjDT.NrPolicePhNo = txtNrPolicePhNo.Text.Trim();
                t_ObjDT.NrGovtHighSch = txtNrGovtHighSch.Text.Trim();
                t_ObjDT.NrGovtHighSchAdd = txtNrGovtHighSchAdd.Text.Trim();
                t_ObjDT.NrGovtHighSchDistance = txtNrGovtHighSchDistance.Text.Trim();
                t_ObjDT.NrGovtHigherSch = txtNrGovtHigherSch.Text.Trim();
                t_ObjDT.NrGovtHigherSchAdd = txtNrGovtHigherSchAdd.Text.Trim();
                t_ObjDT.NrGovtHigherSchDist = txtNrGovtHigherSchDist.Text.Trim();
                t_ObjDT.NrPvtHighSch = txtNrPvtHighSch.Text.Trim();
                t_ObjDT.NrPvtHighSchAdd = txtNrPvtHighSchAdd.Text.Trim();
                t_ObjDT.NrPvtHigherSch = txtNrPvtHigherSch.Text.Trim();
                t_ObjDT.NrPvtHigherSchAdd = txtNrPvtHigherSchAdd.Text.Trim();
                t_ObjDT.NrPvtHigherSchDist = txtNrPvtHigherSchDist.Text.Trim();
                t_ObjDT.BrdUni = txtBrdUni.Text.Trim();
                t_ObjDT.FromDate = txtFromDate.Text.Trim();
                t_ObjDT.RegNo = txtRegNo.Text.Trim();
                t_ObjDT.RegDate = txtRegDate.Text.Trim();
                t_ObjDT.RunCommitteeSch = txtRunCommitteeSch.Text.Trim();
                t_ObjDT.SchPraveshika = txtSchPraveshika.Text.Trim();
                t_ObjDT.SankiyadetLKG = txtSankiyadetLKG.Text.Trim();
                t_ObjDT.SankiyadetUKG = txtSankiyadetUKG.Text.Trim();
                t_ObjDT.SankiyadetCls14 = txtSankiyadetCls14.Text.Trim();
                t_ObjDT.SankiyadetClsPrav = txtSankiyadetClsPrav.Text.Trim();
                t_ObjDT.SankiyadetClsPrathma = txtSankiyadetClsPrathma.Text.Trim();
                t_ObjDT.SankiyadetClsDuti = txtSankiyadetClsDuti.Text.Trim();
                t_ObjDT.SankiyadetClsAnti = txtSankiyadetClsAnti.Text.Trim();
                t_ObjDT.SankiyadetClsPoravePth = txtSankiyadetClsPoravePth.Text.Trim();
                t_ObjDT.SankiyadetClsPoraveAnti = txtSankiyadetClsPoraveAnti.Text.Trim();
                t_ObjDT.SankiyadetClsPoraveUtt = txtSankiyadetClsPoraveUtt.Text.Trim();
                t_ObjDT.SankiyadetClsPoraveUttAnti = txtSankiyadetClsPoraveUttAnti.Text.Trim();
                t_ObjDT.HeadMist = txtHeadMist.Text.Trim();
                t_ObjDT.HeadMistQual = txtHeadMistQual.Text.Trim();
                t_ObjDT.PrinMist = txtPrinMist.Text.Trim();
                t_ObjDT.PrinMistQual = txtPrinMistQual.Text.Trim();
                t_ObjDT.SQTDED = txtSQTDED.Text.Trim();
                t_ObjDT.SQTBTI = txtSQTBTI.Text.Trim();
                t_ObjDT.SQTMED = txtSQTMED.Text.Trim();
                t_ObjDT.SQTBED = txtSQTBED.Text.Trim();
                t_ObjDT.SQTShikSha = txtSQTShikSha.Text.Trim();
                t_ObjDT.PQTDED = txtPQTDED.Text.Trim();
                t_ObjDT.PQTBTI = txtPQTBTI.Text.Trim();
                t_ObjDT.PQTMED = txtPQTMED.Text.Trim();
                t_ObjDT.PQTBED = txtPQTBED.Text.Trim();
                t_ObjDT.PQTShikshaSha = txtPQTShikshaSha.Text.Trim();
                t_ObjDT.HCQTMED = txtHCQTMED.Text.Trim();
                t_ObjDT.HCQTBED = txtHCQTBED.Text.Trim();
                t_ObjDT.HCQTShikshaSha = txtHCQTShikshaSha.Text.Trim();
                t_ObjDT.HCQTDED = txtHCQTDED.Text.Trim();
                t_ObjDT.HCQTBTI = txtHCQTBTI.Text.Trim();
                t_ObjDT.AQTMED = txtAQTMED.Text.Trim();
                t_ObjDT.AQTBED = txtAQTBED.Text.Trim();
                t_ObjDT.AQTShikshaSha = txtAQTShikshaSha.Text.Trim();
                t_ObjDT.AQTDED = txtAQTDED.Text.Trim();
                t_ObjDT.AQTBTI = txtAQTBTI.Text.Trim();
                t_ObjDT.AQTPTI = txtAQTPTI.Text.Trim();
                t_ObjDT.AssitTeachSci = txtAssitTeachSci.Text.Trim();
                t_ObjDT.StudMed = txtStudMed.Text.Trim();
                t_ObjDT.FeesPrathama = txtFeesPrathama.Text.Trim();
                t_ObjDT.FeesPurvamadiyma = txtFeesPurvamadiyma.Text.Trim();
                t_ObjDT.FeesUttarmadiyma = txtFeesUttarmadiyma.Text.Trim();
                t_ObjDT.Ledger = txtLedger.Text.Trim();
                t_ObjDT.AssistantOff = txtAssistantOff.Text.Trim();
                t_ObjDT.FourthGrade = txtFourthGrade.Text.Trim();
                t_ObjDT.MorgFT = txtMorgFT.Text.Trim();
                t_ObjDT.MorgFC = txtMorgFC.Text.Trim();
                t_ObjDT.MorgTT = txtMorgTT.Text.Trim();
                t_ObjDT.MorgTC = txtMorgTC.Text.Trim();
                t_ObjDT.AFTMorgFT = txtAFTMorgFT.Text.Trim();
                t_ObjDT.AFTMorgFC = txtAFTMorgFC.Text.Trim();
                t_ObjDT.AFTMorgTT = txtAFTMorgTT.Text.Trim();
                t_ObjDT.AFTMorgTC = txtAFTMorgTC.Text.Trim();
                t_ObjDT.Khasra = txtKhasra.Text.Trim();
                t_ObjDT.Area = txtArea.Text.Trim();
                t_ObjDT.RentAdd = txtRentAdd.Text.Trim();
                t_ObjDT.RentOwnerAdd = txtRentOwnerAdd.Text.Trim();
                t_ObjDT.AreaSchLand = txtAreaSchLand.Text.Trim();
                t_ObjDT.AreaSchBuildLand = txtAreaSchBuildLand.Text.Trim();
                t_ObjDT.TotalAreaSchBuild = txtTotalAreaSchBuild.Text.Trim();
                t_ObjDT.TotalAreaSchBuildEmty = txtTotalAreaSchBuildEmty.Text.Trim();
                t_ObjDT.NoOFClsStudy = txtNoOFClsStudy.Text.Trim();
                t_ObjDT.FDArea = txtFDArea.Text.Trim();
                t_ObjDT.FDSqFT = txtFDSqFT.Text.Trim();
                t_ObjDT.NoOFRoomsTEACH = txtNoOFRoomsTEACH.Text.Trim();
                t_ObjDT.NoOFRoomsTEACHArea = txtNoOFRoomsTEACHArea.Text.Trim();
                t_ObjDT.NoOFRoomsTEACHSqFT = txtNoOFRoomsTEACHSqFT.Text.Trim();
                t_ObjDT.NoOFRoomsLabLib = txtNoOFRoomsLabLib.Text.Trim();
                t_ObjDT.NoOFRoomsLabLibArea = txtNoOFRoomsLabLibArea.Text.Trim();
                t_ObjDT.NoOFRoomsLabLibSqFT = txtNoOFRoomsLabLibSqFT.Text.Trim();
                t_ObjDT.PlayArea = txtPlayArea.Text.Trim();
                t_ObjDT.PlaySqFT = txtPlaySqFT.Text.Trim();
                t_ObjDT.TotalNoToil = txtTotalNoToil.Text.Trim();
                t_ObjDT.TotalNoToilGl = txtTotalNoToilGl.Text.Trim();
                t_ObjDT.TotalNoToilBY = txtTotalNoToilBY.Text.Trim();
                t_ObjDT.EqipWater = txtEqipWater.Text.Trim();
                t_ObjDT.SubLabNum = txtSubLabNum.Text.Trim();
                t_ObjDT.SubLabArea = txtSubLabArea.Text.Trim();
                t_ObjDT.SubLabSqFT = txtSubLabSqFT.Text.Trim();
                t_ObjDT.NoBooks = txtNoBooks.Text.Trim();
                t_ObjDT.AreaLib = txtAreaLib.Text.Trim();
                t_ObjDT.SqFTLib = txtSqFTLib.Text.Trim();
                t_ObjDT.TotFurt = txtTotFurt.Text.Trim();
                t_ObjDT.TotFurtGB = txtTotFurtGB.Text.Trim();
                t_ObjDT.TotChaires = txtTotChaires.Text.Trim();
                t_ObjDT.TotBenches = txtTotBenches.Text.Trim();
                t_ObjDT.TotFurtStaff = txtTotFurtStaff.Text.Trim();
                t_ObjDT.TotChairStaff = txtTotChairStaff.Text.Trim();
                t_ObjDT.TotAlmariresStaff = txtTotAlmariresStaff.Text.Trim();
                t_ObjDT.TotComp = txtTotComp.Text.Trim();
                t_ObjDT.TotPrinter = txtTotPrinter.Text.Trim();
                t_ObjDT.TotFaxes = txtTotFaxes.Text.Trim();
                t_ObjDT.TotOther = txtTotOther.Text.Trim();
                t_ObjDT.TotFireExt = txtTotFireExt.Text.Trim();
                t_ObjDT.SummittedAmt = txtSummittedAmt.Text.Trim();
                t_ObjDT.PhyHandStudFact = txtPhyHandStudFact.Text.Trim();

                var chkrbPhyHandStudAdPrv = false;

                if (rbPhyHandStudAdPrv1.Checked)
                {
                    chkrbPhyHandStudAdPrv = true;
                }
                else
                {
                    chkrbPhyHandStudAdPrv = false;
                }

                t_ObjDT.PhyHandStudAdPrv = chkrbPhyHandStudAdPrv.ToString();


                string chkrbCRCS = "0";

                if (rbCRCS1.Checked)
                {
                    chkrbCRCS = "1";
                }
                else if (rbCRCS2.Checked)
                {
                    chkrbCRCS = "2";
                }
                else if (rbCRCS3.Checked)
                {
                    chkrbCRCS = "3";
                }
                else if (rbCRCS4.Checked)
                {
                    chkrbCRCS = "4";
                }
                else if (rbCRCS5.Checked)
                {
                    chkrbCRCS = "5";
                }
                else if (rbCRCS6.Checked)
                {
                    chkrbCRCS = "6";
                }


                t_ObjDT.CRCS1 = chkrbCRCS;

                var chkrbElectric = false;

                if (rbElectric1.Checked)
                {
                    chkrbElectric = true;
                }
                else
                {
                    chkrbElectric = false;
                }
                t_ObjDT.Electric = chkrbElectric.ToString();

                string chkrbSchoolType = "0";

                if (rbSchoolType1.Checked)
                {
                    chkrbSchoolType = "1";
                }
                else if (rbSchoolType2.Checked)
                {
                    chkrbSchoolType = "2";
                }
                else if (rbSchoolType3.Checked)
                {
                    chkrbSchoolType = "3";
                }
                else if (rbSchoolType4.Checked)
                {
                    chkrbSchoolType = "4";
                }
                t_ObjDT.SchoolType = chkrbSchoolType;

                var chkrbSocietyBrd = false;

                if (rbSocietyBrd1.Checked)
                {
                    chkrbSocietyBrd = true;
                }
                else
                {
                    chkrbSocietyBrd = false;
                }
                t_ObjDT.SocietyBrd1 = chkrbSocietyBrd.ToString();


                var chkrbOAreaSchoolOperated = false;

                if (rbOAreaSchoolOperated1.Checked)
                {
                    chkrbOAreaSchoolOperated = true;
                }
                else
                {
                    chkrbOAreaSchoolOperated = false;
                }

                t_ObjDT.OAreaSchoolOperated = chkrbOAreaSchoolOperated.ToString();

                t_ObjDT.fileLabEqip = hdnLabEquipments.Value;
                t_ObjDT.fileRentAgree = hdnRentAgreement.Value;
                t_ObjDT.fileKhasra = hdnLandReg.Value;
                t_ObjDT.fileAttTime = hdnAttachTime.Value;
                t_ObjDT.fileTeachSht = hdnAttachedSubject.Value;
                t_ObjDT.fileSocietyMembersReg = hdnAttachLstSocM.Value;

                SqlParameter[] parameter = {
            new SqlParameter("@SocietyName", t_ObjDT.SocietyName),
 new SqlParameter("@SchoolName", t_ObjDT.SchoolName),
 new SqlParameter("@SchoolAddress", t_ObjDT.SchoolAddress),
 new SqlParameter("@House", t_ObjDT.House),
 new SqlParameter("@Colony", t_ObjDT.Colony),
 new SqlParameter("@City", t_ObjDT.City),
 new SqlParameter("@Block", t_ObjDT.Block),
 new SqlParameter("@District", t_ObjDT.District),
 new SqlParameter("@PinCode", t_ObjDT.PinCode),
 new SqlParameter("@SchoolMobile", t_ObjDT.SchoolMobile),
 new SqlParameter("@SoceityRegNo", t_ObjDT.SoceityRegNo),
 new SqlParameter("@SoceityRegDate", t_ObjDT.SoceityRegDate),
 new SqlParameter("@SoceityValDate", t_ObjDT.SoceityValDate),
 new SqlParameter("@PANNO", t_ObjDT.PANNO),
 new SqlParameter("@SoceityNoOfMember", t_ObjDT.SoceityNoOfMember),
 new SqlParameter("@SocietyDirectorName", t_ObjDT.SocietyDirectorName),
 new SqlParameter("@SocietyCity", t_ObjDT.SocietyCity),
 new SqlParameter("@SocietyPost", t_ObjDT.SocietyPost),
 new SqlParameter("@SocietyDistrict", t_ObjDT.SocietyDistrict),
 new SqlParameter("@SocietyPinCode", t_ObjDT.SocietyPinCode),
 new SqlParameter("@SocietyMobileNo", t_ObjDT.SocietyMobileNo),
 new SqlParameter("@SocietyOtherOperated", t_ObjDT.SocietyOtherOperated),
 new SqlParameter("@MunicipalCorp", t_ObjDT.MunicipalCorp),
 new SqlParameter("@DisSchoolHeadQuater", t_ObjDT.DisSchoolHeadQuater),
 new SqlParameter("@NrPoliceSt", t_ObjDT.NrPoliceSt),
 new SqlParameter("@NrPoliceStDistance", t_ObjDT.NrPoliceStDistance),
 new SqlParameter("@NrPoliceStDivision", t_ObjDT.NrPoliceStDivision),
 new SqlParameter("@NrPolicePhNo", t_ObjDT.NrPolicePhNo),
 new SqlParameter("@NrGovtHighSch", t_ObjDT.NrGovtHighSch),
 new SqlParameter("@NrGovtHighSchAdd", t_ObjDT.NrGovtHighSchAdd),
 new SqlParameter("@NrGovtHighSchDistance", t_ObjDT.NrGovtHighSchDistance),
 new SqlParameter("@NrGovtHigherSch", t_ObjDT.NrGovtHigherSch),
 new SqlParameter("@NrGovtHigherSchAdd", t_ObjDT.NrGovtHigherSchAdd),
 new SqlParameter("@NrGovtHigherSchDist", t_ObjDT.NrGovtHigherSchDist),
 new SqlParameter("@NrPvtHighSch", t_ObjDT.NrPvtHighSch),
 new SqlParameter("@NrPvtHighSchAdd", t_ObjDT.NrPvtHighSchAdd),
 new SqlParameter("@NrPvtHigherSch", t_ObjDT.NrPvtHigherSch),
 new SqlParameter("@NrPvtHigherSchAdd", t_ObjDT.NrPvtHigherSchAdd),
 new SqlParameter("@NrPvtHigherSchDist", t_ObjDT.NrPvtHigherSchDist),
 new SqlParameter("@BrdUni", t_ObjDT.BrdUni),
 new SqlParameter("@FromDate", t_ObjDT.FromDate),
 new SqlParameter("@RegNo", t_ObjDT.RegNo),
 new SqlParameter("@RegDate", t_ObjDT.RegDate),
 new SqlParameter("@RunCommitteeSch", t_ObjDT.RunCommitteeSch),
 new SqlParameter("@SchPraveshika", t_ObjDT.SchPraveshika),
 new SqlParameter("@SankiyadetLKG", t_ObjDT.SankiyadetLKG),
 new SqlParameter("@SankiyadetUKG", t_ObjDT.SankiyadetUKG),
 new SqlParameter("@SankiyadetCls14", t_ObjDT.SankiyadetCls14),
 new SqlParameter("@SankiyadetClsPrav", t_ObjDT.SankiyadetClsPrav),
 new SqlParameter("@SankiyadetClsPrathma", t_ObjDT.SankiyadetClsPrathma),
 new SqlParameter("@SankiyadetClsDuti", t_ObjDT.SankiyadetClsDuti),
 new SqlParameter("@SankiyadetClsAnti", t_ObjDT.SankiyadetClsAnti),
 new SqlParameter("@SankiyadetClsPoravePth", t_ObjDT.SankiyadetClsPoravePth),
 new SqlParameter("@SankiyadetClsPoraveAnti", t_ObjDT.SankiyadetClsPoraveAnti),
 new SqlParameter("@SankiyadetClsPoraveUtt", t_ObjDT.SankiyadetClsPoraveUtt),
 new SqlParameter("@SankiyadetClsPoraveUttAnti", t_ObjDT.SankiyadetClsPoraveUttAnti),
 new SqlParameter("@HeadMist", t_ObjDT.HeadMist),
 new SqlParameter("@HeadMistQual", t_ObjDT.HeadMistQual),
 new SqlParameter("@PrinMist", t_ObjDT.PrinMist),
 new SqlParameter("@PrinMistQual", t_ObjDT.PrinMistQual),
 new SqlParameter("@SQTDED", t_ObjDT.SQTDED),
 new SqlParameter("@SQTBTI", t_ObjDT.SQTBTI),
 new SqlParameter("@SQTMED", t_ObjDT.SQTMED),
 new SqlParameter("@SQTBED", t_ObjDT.SQTBED),
 new SqlParameter("@SQTShikSha", t_ObjDT.SQTShikSha),
 new SqlParameter("@PQTDED", t_ObjDT.PQTDED),
 new SqlParameter("@PQTBTI", t_ObjDT.PQTBTI),
 new SqlParameter("@PQTMED", t_ObjDT.PQTMED),
 new SqlParameter("@PQTBED", t_ObjDT.PQTBED),
 new SqlParameter("@PQTShikshaSha", t_ObjDT.PQTShikshaSha),
 new SqlParameter("@HCQTMED", t_ObjDT.HCQTMED),
 new SqlParameter("@HCQTBED", t_ObjDT.HCQTBED),
 new SqlParameter("@HCQTShikshaSha", t_ObjDT.HCQTShikshaSha),
 new SqlParameter("@HCQTDED", t_ObjDT.HCQTDED),
 new SqlParameter("@HCQTBTI", t_ObjDT.HCQTBTI),
 new SqlParameter("@AQTMED", t_ObjDT.AQTMED),
 new SqlParameter("@AQTBED", t_ObjDT.AQTBED),
 new SqlParameter("@AQTShikshaSha", t_ObjDT.AQTShikshaSha),
 new SqlParameter("@AQTDED", t_ObjDT.AQTDED),
 new SqlParameter("@AQTBTI", t_ObjDT.AQTBTI),
 new SqlParameter("@AQTPTI", t_ObjDT.AQTPTI),
 new SqlParameter("@AssitTeachSci", t_ObjDT.AssitTeachSci),
 new SqlParameter("@StudMed", t_ObjDT.StudMed),
 new SqlParameter("@FeesPrathama", t_ObjDT.FeesPrathama),
 new SqlParameter("@FeesPurvamadiyma", t_ObjDT.FeesPurvamadiyma),
 new SqlParameter("@FeesUttarmadiyma", t_ObjDT.FeesUttarmadiyma),
 new SqlParameter("@Ledger", t_ObjDT.Ledger),
 new SqlParameter("@AssistantOff", t_ObjDT.AssistantOff),
 new SqlParameter("@FourthGrade", t_ObjDT.FourthGrade),
 new SqlParameter("@MorgFT", t_ObjDT.MorgFT),
 new SqlParameter("@MorgFC", t_ObjDT.MorgFC),
 new SqlParameter("@MorgTT", t_ObjDT.MorgTT),
 new SqlParameter("@MorgTC", t_ObjDT.MorgTC),
 new SqlParameter("@AFTMorgFT", t_ObjDT.AFTMorgFT),
 new SqlParameter("@AFTMorgFC", t_ObjDT.AFTMorgFC),
 new SqlParameter("@AFTMorgTT", t_ObjDT.AFTMorgTT),
 new SqlParameter("@AFTMorgTC", t_ObjDT.AFTMorgTC),
 new SqlParameter("@Khasra", t_ObjDT.Khasra),
 new SqlParameter("@Area", t_ObjDT.Area),
 new SqlParameter("@RentAdd", t_ObjDT.RentAdd),
 new SqlParameter("@RentOwnerAdd", t_ObjDT.RentOwnerAdd),
 new SqlParameter("@AreaSchLand", t_ObjDT.AreaSchLand),
 new SqlParameter("@AreaSchBuildLand", t_ObjDT.AreaSchBuildLand),
 new SqlParameter("@TotalAreaSchBuild", t_ObjDT.TotalAreaSchBuild),
 new SqlParameter("@TotalAreaSchBuildEmty", t_ObjDT.TotalAreaSchBuildEmty),
 new SqlParameter("@NoOFClsStudy", t_ObjDT.NoOFClsStudy),
 new SqlParameter("@FDArea", t_ObjDT.FDArea),
 new SqlParameter("@FDSqFT", t_ObjDT.FDSqFT),
 new SqlParameter("@NoOFRoomsTEACH", t_ObjDT.NoOFRoomsTEACH),
 new SqlParameter("@NoOFRoomsTEACHArea", t_ObjDT.NoOFRoomsTEACHArea),
 new SqlParameter("@NoOFRoomsTEACHSqFT", t_ObjDT.NoOFRoomsTEACHSqFT),
 new SqlParameter("@NoOFRoomsLabLib", t_ObjDT.NoOFRoomsLabLib),
 new SqlParameter("@NoOFRoomsLabLibArea", t_ObjDT.NoOFRoomsLabLibArea),
 new SqlParameter("@NoOFRoomsLabLibSqFT", t_ObjDT.NoOFRoomsLabLibSqFT),
 new SqlParameter("@PlayArea", t_ObjDT.PlayArea),
 new SqlParameter("@PlaySqFT", t_ObjDT.PlaySqFT),
 new SqlParameter("@TotalNoToil", t_ObjDT.TotalNoToil),
 new SqlParameter("@TotalNoToilGl", t_ObjDT.TotalNoToilGl),
 new SqlParameter("@TotalNoToilBY", t_ObjDT.TotalNoToilBY),
 new SqlParameter("@EqipWater", t_ObjDT.EqipWater),
 new SqlParameter("@SubLabNum", t_ObjDT.SubLabNum),
 new SqlParameter("@SubLabArea", t_ObjDT.SubLabArea),
 new SqlParameter("@SubLabSqFT", t_ObjDT.SubLabSqFT),
 new SqlParameter("@NoBooks", t_ObjDT.NoBooks),
 new SqlParameter("@AreaLib", t_ObjDT.AreaLib),
 new SqlParameter("@SqFTLib", t_ObjDT.SqFTLib),
 new SqlParameter("@TotFurt", t_ObjDT.TotFurt),
 new SqlParameter("@TotFurtGB", t_ObjDT.TotFurtGB),
 new SqlParameter("@TotChaires", t_ObjDT.TotChaires),
 new SqlParameter("@TotBenches", t_ObjDT.TotBenches),
 new SqlParameter("@TotFurtStaff", t_ObjDT.TotFurtStaff),
 new SqlParameter("@TotChairStaff", t_ObjDT.TotChairStaff),
 new SqlParameter("@TotAlmariresStaff", t_ObjDT.TotAlmariresStaff),
 new SqlParameter("@TotComp", t_ObjDT.TotComp),
 new SqlParameter("@TotPrinter", t_ObjDT.TotPrinter),
 new SqlParameter("@TotFaxes", t_ObjDT.TotFaxes),
 new SqlParameter("@TotOther", t_ObjDT.TotOther),
 new SqlParameter("@TotFireExt", t_ObjDT.TotFireExt),
 new SqlParameter("@SummittedAmt", t_ObjDT.SummittedAmt),
 new SqlParameter("@PhyHandStudFact", t_ObjDT.PhyHandStudFact),
 new SqlParameter("@PhyHandStudAdPrv",t_ObjDT.PhyHandStudAdPrv),
new SqlParameter("@CRCS1",t_ObjDT.CRCS1),
new SqlParameter("@Electric",t_ObjDT.Electric),
new SqlParameter("@SchoolType",t_ObjDT.SchoolType),
new SqlParameter("@SocietyBrd1",t_ObjDT.SocietyBrd1),
new SqlParameter("@OAreaSchoolOperated",t_ObjDT.OAreaSchoolOperated),
new SqlParameter("@fileLabEqip",t_ObjDT.fileLabEqip),
new SqlParameter("@fileRentAgree",t_ObjDT.fileRentAgree),
new SqlParameter("@fileKhasra",t_ObjDT.fileKhasra),
new SqlParameter("@fileAttTime",t_ObjDT.fileAttTime),
new SqlParameter("@fileTeachSht",t_ObjDT.fileTeachSht),
new SqlParameter("@fileSocietyMembersReg",t_ObjDT.fileSocietyMembersReg),
new SqlParameter("@UserID",m_UserID),
    };
                
                DataSet result = sqlhelper.ExecuteDataTableNon("InsertCorrespondendsSP", parameter);
                DataTable dt = result.Tables[0];

                //var m_AppID = dt.Rows[0]["AppID"].ToString();
                //var m_ServiceID = "1466";
                //string newWin = "window.open(\"Acknowledgement.aspx?AppID=" + m_AppID + "&SvcID=1466\", \"_blank\", \"WIDTH=1080,HEIGHT=790,scrollbars=no, menubar=no,resizable=yes,directories=no,location=no\");";

                //ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message",
                //       "newWin", true);




                Page.ClientScript.RegisterStartupScript(this.GetType(), "pop", "alert('Profile Updated Successfully.');", true);



               
            }

            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);



            }

        }
        

      

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            string fileSTR = "images\\";
            strFolder = Server.MapPath("./") + fileSTR;
            // Get the name of the file that is posted.
            strFileName = fileSocietyMembersReg.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (fileSocietyMembersReg.Value != "")
            {
                // Create the directory if it does not exist.
                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;
                string strf = Guid.NewGuid().ToString();

                string destFileName = Path.Combine(strFolder, strf + ".jpg");



                if (File.Exists(destFileName))
                {
                    Label1.Text = strFileName + " already exists on the server!";
                }
                else
                {
                    fileSocietyMembersReg.PostedFile.SaveAs(strFilePath);
                    File.Copy(strFilePath, destFileName);
                    string imgPath = "~/images/" + strf + ".jpg";

                    byte[] imageArray = System.IO.File.ReadAllBytes(destFileName);
                    string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                    var val = $"data: image/png; base64,{base64ImageRepresentation}";
                    hdnAttachLstSocM.Value = val;
                    hdnAttachLstSocMPath.Value = destFileName;
                    imgAttachLstSocM.Attributes.Add("src", val);
                    imgAttachLstSocM.Width = Unit.Pixel(200);
                    imgAttachLstSocM.Height = Unit.Pixel(150);
                    imgAttachLstSocM.DataBind();

                    Label1.Text = strFileName + " has been successfully uploaded.";
                }
            }
            else
            {
                Label1.Text = "Click 'Browse' to select the file to upload.";
            }

        }

        protected void btnTimetables_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            string fileSTR = "images\\";
            strFolder = Server.MapPath("./") + fileSTR;
            // Get the name of the file that is posted.
            strFileName = fileAttTime.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (fileAttTime.Value != "")
            {
                // Create the directory if it does not exist.
                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;
                string strf = Guid.NewGuid().ToString();

                string destFileName = Path.Combine(strFolder, strf + ".jpg");



                if (File.Exists(destFileName))
                {
                    lblAttTime.Text = strFileName + " already exists on the server!";
                }
                else
                {
                    fileAttTime.PostedFile.SaveAs(strFilePath);
                    File.Copy(strFilePath, destFileName);
                    string imgPath = "~/images/" + strf + ".jpg";

                    byte[] imageArray = System.IO.File.ReadAllBytes(destFileName);
                    string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                    var val = $"data: image/png; base64,{base64ImageRepresentation}";
                    hdnAttachTime.Value = val;
                    hdnAttachTimePath.Value = destFileName;
                    imgAttachTime.Attributes.Add("src", val);
                    imgAttachTime.Width = Unit.Pixel(200);
                    imgAttachTime.Height = Unit.Pixel(150);
                    imgAttachTime.DataBind();

                    lblAttTime.Text = strFileName + " has been successfully uploaded.";
                }
            }
            else
            {
                lblAttTime.Text = "Click 'Browse' to select the file to upload.";
            }

        }

        protected void btnSubject_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            string fileSTR = "images\\";
            strFolder = Server.MapPath("./") + fileSTR;
            // Get the name of the file that is posted.
            strFileName = fileAttachedSubject.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (fileAttachedSubject.Value != "")
            {
                // Create the directory if it does not exist.
                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;
                string strf = Guid.NewGuid().ToString();

                string destFileName = Path.Combine(strFolder, strf + ".jpg");



                if (File.Exists(destFileName))
                {
                    lblAttachedSubject.Text = strFileName + " already exists on the server!";
                }
                else
                {
                    fileAttachedSubject.PostedFile.SaveAs(strFilePath);
                    File.Copy(strFilePath, destFileName);
                    string imgPath = "~/images/" + strf + ".jpg";

                    byte[] imageArray = System.IO.File.ReadAllBytes(destFileName);
                    string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                    var val = $"data: image/png; base64,{base64ImageRepresentation}";
                    hdnAttachedSubject.Value = val;
                    hdnAttachedSubjectPath.Value = destFileName;
                    imgAttachedSubject.Attributes.Add("src", val);
                    imgAttachedSubject.Width = Unit.Pixel(200);
                    imgAttachedSubject.Height = Unit.Pixel(150);
                    imgAttachedSubject.DataBind();

                    lblAttachedSubject.Text = strFileName + " has been successfully uploaded.";
                }
            }
            else
            {
                lblAttachedSubject.Text = "Click 'Browse' to select the file to upload.";
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            string fileSTR = "images\\";
            strFolder = Server.MapPath("./") + fileSTR;
            // Get the name of the file that is posted.
            strFileName = fileLandReg.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (fileLandReg.Value != "")
            {
                // Create the directory if it does not exist.
                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;
                string strf = Guid.NewGuid().ToString();

                string destFileName = Path.Combine(strFolder, strf + ".jpg");



                if (File.Exists(destFileName))
                {
                    lblLandReg.Text = strFileName + " already exists on the server!";
                }
                else
                {
                    fileLandReg.PostedFile.SaveAs(strFilePath);
                    File.Copy(strFilePath, destFileName);
                    string imgPath = "~/images/" + strf + ".jpg";

                    byte[] imageArray = System.IO.File.ReadAllBytes(destFileName);
                    string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                    var val = $"data: image/png; base64,{base64ImageRepresentation}";
                    hdnLandReg.Value = val;
                    hdnLandRegPath.Value = destFileName;
                    imgLandReg.Attributes.Add("src", val);
                    imgLandReg.Width = Unit.Pixel(200);
                    imgLandReg.Height = Unit.Pixel(150);
                    imgLandReg.DataBind();

                    lblLandReg.Text = strFileName + " has been successfully uploaded.";
                }
            }
            else
            {
                lblLandReg.Text = "Click 'Browse' to select the file to upload.";
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            string fileSTR = "images\\";
            strFolder = Server.MapPath("./") + fileSTR;
            // Get the name of the file that is posted.
            strFileName = fileRentAgreement.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (fileRentAgreement.Value != "")
            {
                // Create the directory if it does not exist.
                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;
                string strf = Guid.NewGuid().ToString();

                string destFileName = Path.Combine(strFolder, strf + ".jpg");



                if (File.Exists(destFileName))
                {
                    lblRentAgreement.Text = strFileName + " already exists on the server!";
                }
                else
                {
                    fileRentAgreement.PostedFile.SaveAs(strFilePath);
                    File.Copy(strFilePath, destFileName);
                    string imgPath = "~/images/" + strf + ".jpg";

                    byte[] imageArray = System.IO.File.ReadAllBytes(destFileName);
                    string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                    var val = $"data: image/png; base64,{base64ImageRepresentation}";
                    hdnRentAgreement.Value = val;
                    hdnRentAgreementPath.Value = destFileName;
                    imgRentAgreement.Attributes.Add("src", val);
                    imgRentAgreement.Width = Unit.Pixel(200);
                    imgRentAgreement.Height = Unit.Pixel(150);
                    imgRentAgreement.DataBind();

                    lblRentAgreement.Text = strFileName + " has been successfully uploaded.";
                }
            }
            else
            {
                lblRentAgreement.Text = "Click 'Browse' to select the file to upload.";
            }

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            string fileSTR = "images\\";
            strFolder = Server.MapPath("./") + fileSTR;
            // Get the name of the file that is posted.
            strFileName = fileLabEquipments.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (fileLabEquipments.Value != "")
            {
                // Create the directory if it does not exist.
                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;
                string strf = Guid.NewGuid().ToString();

                string destFileName = Path.Combine(strFolder, strf + ".jpg");



                if (File.Exists(destFileName))
                {
                    lblLabEquipments.Text = strFileName + " already exists on the server!";
                }
                else
                {
                    fileLabEquipments.PostedFile.SaveAs(strFilePath);
                    File.Copy(strFilePath, destFileName);
                    string imgPath = "~/images/" + strf + ".jpg";

                    byte[] imageArray = System.IO.File.ReadAllBytes(destFileName);
                    string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                    var val = $"data: image/png; base64,{base64ImageRepresentation}";
                    hdnLabEquipments.Value = val;
                    hdnLabEquipmentsPath.Value = destFileName;
                    imgLabEquipments.Attributes.Add("src", val);
                    imgLabEquipments.Width = Unit.Pixel(200);
                    imgLabEquipments.Height = Unit.Pixel(150);
                    imgLabEquipments.DataBind();

                    lblLabEquipments.Text = strFileName + " has been successfully uploaded.";
                }
            }
            else
            {
                lblLabEquipments.Text = "Click 'Browse' to select the file to upload.";
            }


        }
    }
}