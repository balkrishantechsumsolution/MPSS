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
using System.Linq.Expressions;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class ViewScholarShipFrm : CommonBasePage
    {

        string m_AppID, m_ServiceID;
        static data sqlhelper = new data();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (Session["LoginID"].ToString() != null)
                {


                    string culture = "en-GB";

                    if (HFCurrentLang.Value == "")
                    {
                        HFCurrentLang.Value = "1";
                        btnLang.Value = "हिन्दी";

                    }

                    if (HFCurrentLang.Value != "")
                    {
                        if (HFCurrentLang.Value == "1")
                        {
                            culture = "en-GB";
                            HFCurrentLang.Value = "1";
                            btnLang.Value = "हिन्दी";
                        }
                        else if (HFCurrentLang.Value == "2")
                        {
                            culture = "hi-IN";
                            HFCurrentLang.Value = "2";
                            btnLang.Value = "English";
                        }
                    }

                    Session["CurrentCultureLabels"] = culture;
                }



                if (Request.QueryString["AppID"] == null) return;
                if (Request.QueryString["SvcID"] != null) { m_ServiceID = Request.QueryString["SvcID"].ToString(); }

                m_AppID = Request.QueryString["AppID"].ToString();


                DataTable dtApp = new DataTable();
                SqlParameter[] parameter = {
                 new SqlParameter("@AppID", m_AppID),
                 new SqlParameter("@ServiceID", m_ServiceID)
            };

                dtApp = sqlhelper.ExecuteDataTable("GetViewScholarShipFormDataSP", parameter);


                if (dtApp.Rows.Count != 0)
                {
                    txtNoOfSibling.Text = dtApp.Rows[0]["NoOfSibling"].ToString();
                    txtPreAttDays.Text = dtApp.Rows[0]["PreAttDays"].ToString();

                    txtMobieNoParent.Text = dtApp.Rows[0]["MobieNoParent"].ToString();
                    txtFamiyIncome.Text = dtApp.Rows[0]["FamilyIncome"].ToString();
                    txtMonthlyFee.Text = dtApp.Rows[0]["MonthlyFee"].ToString();
                    txtJobSalary.Text = dtApp.Rows[0]["JobSalary"].ToString();
                    txtBlock.Text = dtApp.Rows[0]["Block"].ToString();
                    txtDistrict.Text = dtApp.Rows[0]["District"].ToString();
                    txtCity.Text = dtApp.Rows[0]["City"].ToString();
                    ddlDisAbilityType.SelectedValue = dtApp.Rows[0]["DisAbilityType"].ToString();
                    txtHostelName.Text = dtApp.Rows[0]["HostelName"].ToString();
                    txtSambathaCode.Text = dtApp.Rows[0]["SambathaCode"].ToString();
                    ddlCuurentSchoolName.SelectedValue = dtApp.Rows[0]["CuurentSchoolName"].ToString();
                    txtColony.Text = dtApp.Rows[0]["Colony"].ToString();
                    txtHouse.Text = dtApp.Rows[0]["HouseNo"].ToString();
                    txtPinCode.Text = dtApp.Rows[0]["pincode"].ToString();
                    txtStudentName.Text = dtApp.Rows[0]["StudentName"].ToString();
                    ddlGender.SelectedValue = dtApp.Rows[0]["Gender"].ToString();
                    ddlClass.SelectedValue = dtApp.Rows[0]["Class"].ToString();
                    ddlSection.SelectedValue = dtApp.Rows[0]["Section"].ToString();
                    txtBirthdate.Text = dtApp.Rows[0]["Birthdate"].ToString();
                    txtSubject.Text = dtApp.Rows[0]["Subject"].ToString();
                    txtSchool.Text = dtApp.Rows[0]["School"].ToString();
                    txtBankAccNo.Text = dtApp.Rows[0]["BankAccountNo"].ToString();
                    txtBankIFSCCode.Text = dtApp.Rows[0]["BankAccountIFSCCode"].ToString();
                    txtFatherName.Text = dtApp.Rows[0]["FatherName"].ToString();
                    txtFatherOcc.Text = dtApp.Rows[0]["FatherOcc"].ToString();
                    txtMotherName.Text = dtApp.Rows[0]["MotherName"].ToString();
                    txtMotherOcc.Text = dtApp.Rows[0]["MotherOcc"].ToString();
                    ddlCaste.SelectedValue = dtApp.Rows[0]["Caste"].ToString();
                    txtSubCaste.Text = dtApp.Rows[0]["SubCaste"].ToString();
                    txtDigitalCasteNo.Text = dtApp.Rows[0]["CasteCertNo"].ToString();
                    ddlReligion.SelectedValue = dtApp.Rows[0]["Regilion"].ToString();
                    txtExamBoardName.Text = dtApp.Rows[0]["ExamBoardName"].ToString();
                    txtDateAdmisCurrSch.Text = dtApp.Rows[0]["DateAdmisCurrSch"].ToString();
                    txtDateAdmisCurrClass.Text = dtApp.Rows[0]["DateAdmisCurrClass"].ToString();
                    txtAdmissionNo.Text = dtApp.Rows[0]["AdmissionNo"].ToString();
                    txtCurrentCls.Text = dtApp.Rows[0]["CurrentCls"].ToString();
                    txtLastCls.Text = dtApp.Rows[0]["LastCls"].ToString();
                    ddlMedium.SelectedValue = dtApp.Rows[0]["Mediums"].ToString();
                    ddlDisAbility.SelectedValue = dtApp.Rows[0]["Disability"].ToString();
                    txtEquipDisability.Text = dtApp.Rows[0]["EquipDisability"].ToString();
                    txtFreeUniform.Text = dtApp.Rows[0]["FreeUniform"].ToString();
                    txtYrLastExam.Text = dtApp.Rows[0]["YrLastExam"].ToString();
                    txtLastAnnualResult.Text = dtApp.Rows[0]["LastAnnualResult"].ToString();
                    txtPassPercentage.Text = dtApp.Rows[0]["PassPercentage"].ToString();
                    txtLastClsInt.Text = dtApp.Rows[0]["LastClsInt"].ToString();
                    txtCodeFacultySt.Text = dtApp.Rows[0]["CodeFacultySt"].ToString();
                    txtCodeTradeVocationalPrg.Text = dtApp.Rows[0]["CodeTradeVocationalPrg"].ToString();
                    txtTypeJobRoleVocationalPrg.Text = dtApp.Rows[0]["TypeJobRoleVocationalPrg"].ToString();
                    txtLvlNSFQ.Text = dtApp.Rows[0]["LvlNSFQ"].ToString();
                    txtObjVocationalPrg.Text = dtApp.Rows[0]["ObjVocationalPrg"].ToString();
                    txtJobStaus.Text = dtApp.Rows[0]["JobStaus"].ToString();
                    txtLadliLaxmiNo.Text = dtApp.Rows[0]["LadliLaxmiNo"].ToString();
                    txtBirthdate.Text = dtApp.Rows[0]["TBirthdate"].ToString();
                    txtDateAdmisCurrSch.Text = dtApp.Rows[0]["TDateAdmisCurrSch"].ToString();
                    txtDateAdmisCurrClass.Text = dtApp.Rows[0]["TDateAdmisCurrClass"].ToString();
                    txtPrincipalMoNo.Text = dtApp.Rows[0]["PrincipalMoNo"].ToString();
                    txtPrincipalBankIFSC.Text = dtApp.Rows[0]["PrincipalBankIFSC"].ToString();
                    txtPrincipalConfirmBankNo.Text = dtApp.Rows[0]["PrincipalConfirmBankNo"].ToString();
                    txtPrincipalBankNo.Text = dtApp.Rows[0]["PrincipalBankNo"].ToString();
                    txtScBankName.Text = dtApp.Rows[0]["ScBankName"].ToString();
                    txtScActive.Text = dtApp.Rows[0]["ScActive"].ToString();
                    txtUserMoNo.Text = dtApp.Rows[0]["UserMoNo"].ToString();
                    txtStudentBankName.Text = dtApp.Rows[0]["StudentBankName"].ToString();
                    txtSchoolEntryCls.Text = dtApp.Rows[0]["SchoolEntryCls"].ToString();
                    txtDiceCode.Text = dtApp.Rows[0]["DiceCode"].ToString();
                    ddlCuurentClass.SelectedValue = dtApp.Rows[0]["StudyCls"].ToString();
                    ddlPreviousClass.SelectedValue = dtApp.Rows[0]["PrestudyCls"].ToString();
                    ddlAllSubject.SelectedValue = dtApp.Rows[0]["AllSubject"].ToString();
                    ddlPreAllSubject.SelectedValue = dtApp.Rows[0]["PreAllSubject"].ToString();
                    txtDetached.Text = dtApp.Rows[0]["Detached"].ToString();
                    txtDetachedPer.Text = dtApp.Rows[0]["DetachedPer"].ToString();
                    txtDetachedPerEqp.Text = dtApp.Rows[0]["DetachedPerEqp"].ToString();
                    txtDetachedPerEscort.Text = dtApp.Rows[0]["DetachedPerEscort"].ToString();
                    txtStudentHindiName.Text = dtApp.Rows[0]["NameInHindi"].ToString();
                    // txtUserID.Text = dtApp.Rows[0]["UserID"].ToString();
                    myImg.Attributes.Add("src", dtApp.Rows[0]["Img"].ToString());
                    imgCheque.Attributes.Add("src", dtApp.Rows[0]["Cheque"].ToString());
                    imgPassbook.Attributes.Add("src", dtApp.Rows[0]["Passbook"].ToString());
                    ImageTC.Attributes.Add("src", dtApp.Rows[0]["ImgTC"].ToString());
                    txtSamagraID.Text = dtApp.Rows[0]["SamagraID"].ToString();
                    txtFamilySamagraID.Text = dtApp.Rows[0]["FamilySamagraID"].ToString();
                    txtAadhar.Text = dtApp.Rows[0]["Aadhar"].ToString();



                    //IsFatherDead.Checked = Convert.ToBoolean(dtApp.Rows[0]["IsFatherDead"].ToString());
                    //IsMPOrigin.Checked = Convert.ToBoolean(dtApp.Rows[0]["IsMPOrigin"].ToString());
                    //IsParentIcomeTaxPayer.Checked = Convert.ToBoolean(dtApp.Rows[0]["IsParentIcomeTaxPayer"].ToString());
                    //IsHosteller.Checked = Convert.ToBoolean(dtApp.Rows[0]["IsHosteller"].ToString());
                    //IsDGSCaste.Checked = Convert.ToBoolean(dtApp.Rows[0]["IsDGSCaste"].ToString());
                    //IsFamilyBPL.Checked = Convert.ToBoolean(dtApp.Rows[0]["IsFamilyBPL"].ToString());
                    //IsDisadvantagedgroup.Checked = Convert.ToBoolean(dtApp.Rows[0]["IsDisadvantagedgroup"].ToString());
                    //IsClsFirstEnrollStatus.Checked = Convert.ToBoolean(dtApp.Rows[0]["IsClsFirstEnrollStatus"].ToString());
                    //IsFreeTextbooks.Checked = Convert.ToBoolean(dtApp.Rows[0]["IsFreeTextbooks"].ToString());
                    //IsResidingHostel.Checked = Convert.ToBoolean(dtApp.Rows[0]["IsResidingHostel"].ToString());
                    //IsRecSpecialTraining.Checked = Convert.ToBoolean(dtApp.Rows[0]["IsRecSpecialTraining"].ToString());
                    //IsRegVocationalPrg.Checked = Convert.ToBoolean(dtApp.Rows[0]["IsRegVocationalPrg"].ToString());
                    //Ishomeless.Checked = Convert.ToBoolean(dtApp.Rows[0]["Ishomeless"].ToString());
                    //IsFreeTransport.Checked = Convert.ToBoolean(dtApp.Rows[0]["IsFreeTransport"].ToString());
                    //IsFreeEscortDis.Checked = Convert.ToBoolean(dtApp.Rows[0]["IsFreeEscortDis"].ToString());
                    //IsRTE.Checked = Convert.ToBoolean(dtApp.Rows[0]["IsRTE"].ToString());
                    //IsAnyHaveScholarShip.Checked = Convert.ToBoolean(dtApp.Rows[0]["IsAnyHaveScholarShip"].ToString());
                    //FreeBicycle.Checked = Convert.ToBoolean(dtApp.Rows[0]["FreeBicycle"].ToString());
                    //rbnpass1.Checked = Convert.ToBoolean(dtApp.Rows[0]["IsPassOtherBoard"].ToString());
                    //rbnpass2.Checked = Convert.ToBoolean(dtApp.Rows[0]["IsPassOtherBoard"].ToString());

                }


            }
            catch (System.Exception ex)
            {

            }
        }

    }
}