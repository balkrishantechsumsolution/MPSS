using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CitizenPortalLib.BLL;
using CitizenPortalLib;

namespace CitizenPortal.WebApp.Kiosk.PG
{
    public partial class Acknowledgement : CommonBasePage
    {
        OUATBLL m_OUATBLL = new OUATBLL();
        string m_AppID, m_ServiceID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            btnHome.PostBackUrl = Session["HomePage"].ToString();
           // "AppDetails", "TransDetails", "TrackStatus", "EducationDetails", "PGSignature", "AgeDataTb"
            DataSet dt = m_OUATBLL.GetPGAdmissionAppDetails(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[1];
            DataTable dtTrackStatus = dt.Tables[2];
            DataTable dtEducationDetails = dt.Tables[3];
            DataTable dtAge = dt.Tables[5];
            DataTable dtGraduate = dt.Tables[7];

            if (dtApp.Rows.Count != 0)
            {
               
                lblDeptName.Text= dtApp.Rows[0]["DepartmentName"].ToString();
                lblCourseName.Text = dtApp.Rows[0]["CourseType"].ToString();
                lblProgName.Text = dtApp.Rows[0]["Program"].ToString();

                lblAadhaarNo.Text = dtApp.Rows[0]["AadhaarNumber"].ToString();
                FullName.Text = dtApp.Rows[0]["CandidateName"].ToString();
                //MiddleName.Text = dtApp.Rows[0]["MiddleName"].ToString();
                MotherName.Text = dtApp.Rows[0]["MotherName"].ToString();
                FatherName.Text = dtApp.Rows[0]["FatherName"].ToString();
                DOBConverted.Text = dtApp.Rows[0]["DOB"].ToString();
                
                AgeYear.Text = dtAge.Rows[0]["Years"].ToString() + " years";//Years.ToString();
                AgeMonth.Text = dtAge.Rows[0]["Months"].ToString() + " months";//Months.ToString();
                AgeDay.Text = dtAge.Rows[0]["Days"].ToString() + " days";//Days.ToString();

                gender.Text = dtApp.Rows[0]["Gender"].ToString();
                Religion.Text = dtApp.Rows[0]["Religion"].ToString();
                Category.Text = dtApp.Rows[0]["Category"].ToString();
                mothertongue.Text = dtApp.Rows[0]["MotherTongue"].ToString();
                Nationality.Text = dtApp.Rows[0]["Nationality"].ToString();
                EmailID.Text = dtApp.Rows[0]["EmailId"].ToString();
                MobileNo.Text = dtApp.Rows[0]["MobileNo"].ToString();
                //stdcode.Text = dtApp.Rows[0]["StdCode"].ToString();
                lblFatherOccupation.Text = dtApp.Rows[0]["FatherOccupation"].ToString();
                lblMotherOccupation.Text = dtApp.Rows[0]["MotherOccupation"].ToString();
                lblGuardianName.Text = dtApp.Rows[0]["GuardianName"].ToString();
                lblGuardianOccupation.Text = dtApp.Rows[0]["GuardianOccupation"].ToString();
                lblMaritialStatus.Text = dtApp.Rows[0]["MaritalStatus"].ToString();
                lblUniversityRegNo.Text = dtApp.Rows[0]["UniversityRegNo"].ToString();

                PBlock.Text = dtApp.Rows[0]["PermanentBlock"].ToString();//?
                PAddressLine1.Text = dtApp.Rows[0]["ParmanentAddressline1"].ToString();
                PAddressLine2.Text = dtApp.Rows[0]["ParmanentAddressline2"].ToString();
                PLandMark.Text = dtApp.Rows[0]["ParLandmark"].ToString();//?
                PLocality.Text = dtApp.Rows[0]["ParLocality"].ToString();
                PRoadStreetName.Text = dtApp.Rows[0]["ParRoadstreet"].ToString();
                PddlState.Text = dtApp.Rows[0]["PermanentState"].ToString();
                PddlDistrict.Text = dtApp.Rows[0]["PermanentDistrict"].ToString();//?
                PddlVillage.Text = dtApp.Rows[0]["PermanentPanchayat"].ToString();//?
                PPinCode.Text = dtApp.Rows[0]["prepincode"].ToString();

                //ContentPlaceHolder1_HFb64.Text = dtApp.Rows[0]["Image"].ToString();//?
                CAddressLine1.Text = dtApp.Rows[0]["PresentAddressline1"].ToString();//?
                CAddressLine2.Text = dtApp.Rows[0]["PresentAddressline2"].ToString();//?
                CLandMark.Text = dtApp.Rows[0]["PreLandmark"].ToString();//?
                CLocality.Text = dtApp.Rows[0]["PreLocality"].ToString();//?
                CRoadStreetName.Text = dtApp.Rows[0]["PreRoadstreet"].ToString();//?
                CPinCode.Text = dtApp.Rows[0]["parPinCode"].ToString();//?
                CddlState.Text = dtApp.Rows[0]["CurrentState"].ToString();//?
                CddlDistrict.Text = dtApp.Rows[0]["CurrentDistrict"].ToString();//?
                CBlock.Text = dtApp.Rows[0]["CurrentBlock"].ToString();//?
                CddlVillage.Text = dtApp.Rows[0]["CurrentPanchayat"].ToString();//?
                lblStreamName.Text = dtApp.Rows[0]["ApplyingFor"].ToString();

                if (Convert.ToString(dtApp.Rows[0]["Section1_IsHandicap"]).Equals("yes"))
                {
                    //A.,A.
                    lblHandicapStatus.Text = dtApp.Rows[0]["Section1_IsHandicap"].ToString();
                    lblHandicapType.Text = dtApp.Rows[0]["Section1_HandicapType"].ToString();
                    lblDisabilityPercentage.Text = dtApp.Rows[0]["Section1_DisabilityPercent"].ToString();
                    TRSection1.Visible = true;
                    TRSection1_Disability.Visible = true;
                    TRSection1_Handicap.Visible = true;
                }
                else
                {
                    TRSection1.Visible = true;
                    lblHandicapStatus.Text = dtApp.Rows[0]["Section1_IsHandicap"].ToString();
                    TRSection1_Disability.Visible = false;
                    TRSection1_Handicap.Visible = false;
                }
                if (Convert.ToString(dtApp.Rows[0]["Section2_IsExDefence"]).Equals("yes"))
                {
                    //A.,A.
                    lblParentExDefenceEmply.Text= dtApp.Rows[0]["Section2_IsExDefence"].ToString();
                    Label2.Text = dtApp.Rows[0]["Section2_DeptName"].ToString();
                    Label3.Text = dtApp.Rows[0]["Section2_PostName"].ToString();
                    TRSection2.Visible = true;
                    TRSection2_Department.Visible = true;
                    TRSection2_Post.Visible = true;
                }
                else
                {
                    TRSection2.Visible = true;
                    lblParentExDefenceEmply.Text = dtApp.Rows[0]["Section2_IsExDefence"].ToString();
                    TRSection2_Department.Visible = false;
                    TRSection2_Post.Visible = false;
                }
                if (Convert.ToString(dtApp.Rows[0]["Section3_IsPlyedInInterUniv"]).Equals("yes"))
                {
                    //A.,A.
                    TRSection3.Visible = true;
                    TRSection3_TournamentName.Visible = true;
                    TRSection3_TournamentYear.Visible = true;
                    lblPlayedNational.Text = dtApp.Rows[0]["Section3_IsPlyedInInterUniv"].ToString();
                    Label4.Text = dtApp.Rows[0]["Section3_TournamentName"].ToString();
                    Label5.Text = dtApp.Rows[0]["Section3_TournamentYear"].ToString();
                }
                else
                {
                    TRSection3.Visible = true;
                    lblPlayedNational.Text = dtApp.Rows[0]["Section3_IsPlyedInInterUniv"].ToString();
                    TRSection3_TournamentName.Visible = false;
                    TRSection3_TournamentYear.Visible = false;
                }
                if (Convert.ToString(dtApp.Rows[0]["Section4_IsPossessNcc"]).Equals("yes"))
                {
                    //A.,A.
                    TRSection4.Visible = true;
                    TRSection4_authority.Visible = true;
                    TRSection4_PassYear.Visible = true;
                    lblHasNCCCertificate.Text = dtApp.Rows[0]["Section4_IsPossessNcc"].ToString();
                    lblNCCPassYear.Text = dtApp.Rows[0]["Section4_PassYear"].ToString();
                    lblAppAuthority.Text = dtApp.Rows[0]["Section4_NameOfAuthority"].ToString();
                }
                else
                {
                    TRSection4.Visible = true;
                    lblHasNCCCertificate.Text = dtApp.Rows[0]["Section4_IsPossessNcc"].ToString();
                    TRSection4_authority.Visible = false;
                    TRSection4_PassYear.Visible = false;
                }
                if (Convert.ToString(dtApp.Rows[0]["Section5_IsKashmiri"]).Equals("yes"))
                {
                    //A.,A.
                    TRSection5.Visible = true;
                    TRSection5_MigrationYear.Visible = true;
                    TRSection5_Address.Visible = true;
                    lblIsKashmiriMigrant.Text = dtApp.Rows[0]["Section5_IsKashmiri"].ToString();
                    lblMigrationYear.Text = dtApp.Rows[0]["Section5_MigrationYear"].ToString();
                    lblMigrationAddress.Text = dtApp.Rows[0]["Section5_Address"].ToString();
                }
                else
                {
                    TRSection5.Visible = true;
                    lblIsKashmiriMigrant.Text = dtApp.Rows[0]["Section5_IsKashmiri"].ToString();
                    TRSection5_MigrationYear.Visible = false;
                    TRSection5_Address.Visible = false;
                }
                if (Convert.ToString(dtApp.Rows[0]["Section6_IsMLib"]).Equals("yes"))
                {
                    //A.,A.,,
                    TRSection6.Visible = true;
                    TRSection6_Designation.Visible = true;
                    TRSection6_Place.Visible = true;
                    lblWorkingOdisha.Text = dtApp.Rows[0]["Section6_IsMLib"].ToString();
                    lblOrganisatioDtl.Text = dtApp.Rows[0]["Section6_OrganisationDetail"].ToString() + " | " + dtApp.Rows[0]["Section6_Place"].ToString();
                    lblTotalExp.Text = dtApp.Rows[0]["Section6_TotalExp"].ToString() + " | " + dtApp.Rows[0]["Section6_Designation"].ToString();
                }
                else
                {
                    TRSection6.Visible = true;
                    lblWorkingOdisha.Text = dtApp.Rows[0]["Section6_IsMLib"].ToString();
                    TRSection6_Designation.Visible = false;
                    TRSection6_Place.Visible = false;
                }
                if (Convert.ToString(dtApp.Rows[0]["Section6A_IsMba"]).Equals("yes"))
                {
                    //A.,A.,
                    TRSection6A.Visible = true;
                    TRSection6A_Examination.Visible = true;
                    TRSection6A_MarksSecured.Visible = true;
                    lblHavingMBAdegree.Text = dtApp.Rows[0]["Section6A_IsMba"].ToString();
                    lblMBAExamName.Text = dtApp.Rows[0]["Section6A_ExaminationName"].ToString();
                    lblMBAExamYear.Text = dtApp.Rows[0]["Section6A_ExaminationYear"].ToString() + " | " + dtApp.Rows[0]["Section6A_MarkSecured"].ToString();

                }
                else
                {
                    TRSection6A.Visible = true;
                    lblHavingMBAdegree.Text = dtApp.Rows[0]["Section6A_IsMba"].ToString();
                    TRSection6A_Examination.Visible = false;
                    TRSection6A_MarksSecured.Visible = false;
                }
                
                lblSection7_NSS.Text = dtApp.Rows[0]["Section7_IsNSS"].ToString();
                lblSection8_Hostel.Text = dtApp.Rows[0]["Section8_IsHostel"].ToString();
                lblSection9_Distinction.Text = dtApp.Rows[0]["Section9_IsGraduationDist"].ToString();


                if (dtTransDetail.Rows.Count != 0)
                {
                    lblAppID.Text = dtTransDetail.Rows[0]["AppID"].ToString();
                    //AppName.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                    lblTrnsID.InnerHtml = dtTransDetail.Rows[0]["TrnID"].ToString();
                    lblTrnsDate.InnerHtml = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy");
                    lblAppFee.Text = dtTransDetail.Rows[0]["govt"].ToString();
                    lblServTax.Text = dtTransDetail.Rows[0]["misc_charges_01"].ToString();
                    lblPortalFee.Text = dtTransDetail.Rows[0]["portal_serv_fee"].ToString();
                    lblTotalFee.Text = dtTransDetail.Rows[0]["total"].ToString();
                    AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["CreatedOn"]).ToString("dd/MM/yyyy");
                }

                if (dtTrackStatus.Rows.Count != 0)
                {
                    //lblCertificateName.Text = dtTrackStatus.Rows[0]["ServiceName"].ToString();
                    //lbldepartment.Text = dtTrackStatus.Rows[0]["DepartmentName"].ToString();
                }
                //"data:image/png;base64," +
                ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfileSignature.Src = dtApp.Rows[0]["Signature"].ToString();
                if (dtEducationDetails.Rows.Count > 0)
                {                   
                    //HSC DEtails----------------------
                    lblHSCBoard.Text= dtEducationDetails.Rows[0]["HscBoardName"].ToString();
                    lblHSCExamPass.Text = dtEducationDetails.Rows[0]["HscNameExamPass"].ToString();
                    lblHSCExamClear.Text = dtEducationDetails.Rows[0]["HscExamCleard"].ToString();
                    lblHSCRoll.Text = dtEducationDetails.Rows[0]["HscBoardRollNo"].ToString();
                    lblHSCPassYear.Text = dtEducationDetails.Rows[0]["HscYearPassing"].ToString();
                    lblHSCGradeSystem.Text = dtEducationDetails.Rows[0]["HscGradeSystem"].ToString();
                    lblHSCTotalMark.Text = dtEducationDetails.Rows[0]["HscTotalMark"].ToString();
                    lblHSCMarkSecured.Text = dtEducationDetails.Rows[0]["HscMarkSecured"].ToString();
                    lblHSCPercentage.Text = dtEducationDetails.Rows[0]["HscPercentage"].ToString();

                    //SSC Details-------------------
                    lblSSCBoard.Text = dtEducationDetails.Rows[0]["SscBoardName"].ToString();
                    lblSSCExamPassed.Text = dtEducationDetails.Rows[0]["SscNameExamPass"].ToString();
                    lblSSCRoll.Text = dtEducationDetails.Rows[0]["SscBoardRollNo"].ToString();
                    lblSSCPassYear.Text = dtEducationDetails.Rows[0]["SscYearPassing"].ToString();
                    lblSSCDivision.Text = dtEducationDetails.Rows[0]["SSCExamCleard"].ToString();
                    lblSSCGradeSystem.Text = dtEducationDetails.Rows[0]["SscGradeSystem"].ToString();
                    lblSSCTotalMark.Text = dtEducationDetails.Rows[0]["SscTotalMark"].ToString();
                    lblSSCMarkSecured.Text = dtEducationDetails.Rows[0]["SscMarkSecured"].ToString();
                    lblSSCPercentage.Text = dtEducationDetails.Rows[0]["SscPercentage"].ToString();

                    //BSC Details-------------
                    lblBSCBoard.Text = dtEducationDetails.Rows[0]["BscBoardUniversity"].ToString();
                    lblBSCDegree.Text = dtEducationDetails.Rows[0]["BscDegreeDimploma"].ToString();
                    lblBSCMaxMark.Text = dtEducationDetails.Rows[0]["BscMaxMarks"].ToString();
                    lblBSCMarkSecured.Text = dtEducationDetails.Rows[0]["BscMarksSecured"].ToString();
                    lblBSCGrade.Text = dtEducationDetails.Rows[0]["BscGrade"].ToString();
                    lblBSCDivision.Text = dtEducationDetails.Rows[0]["BscDivision"].ToString();
                    lblBSCPassyear.Text = dtEducationDetails.Rows[0]["BscPassYear"].ToString();
                    lblBSCOptionalSubject.Text = dtEducationDetails.Rows[0]["BscMainOptionalSubject"].ToString();

                }

                string IsPassGraduate = dtApp.Rows[0]["IsPassGraduate"].ToString();
                TROnlyHons.Visible = false;
                TROnlyPass.Visible = false;
                TRLLB5Yrs.Visible = false;
                TRLLB3YrsHons.Visible = false;
                TRLLB3YrsPass.Visible = false;
                TRMBA.Visible = false;
                TRMBA_Exp.Visible = false;
                TRMTech.Visible = false;
                TDProDegree.Visible = false;
                TRBEBTechBsc.Visible = false;
                TRHons_PassDivision.Visible = false;
                TDHonsDiv.Visible = false;
                TDPassDiv.Visible = false;
                TD3HonsDiv.Visible = false;
                TDMscDiv.Visible = false;
                TRPG_RSAndGIS.Visible = false;

                if (IsPassGraduate == "Yes")
                {
                    lblTypeOfValue.Text = "";
                    TRQualigyngExam.Visible = false;
                }
                else
                {
                    lblTypeOfValue.Text = "Appeared";
                    TRQualigyngExam.Visible = true;
                }
                if (dtGraduate.Rows.Count > 0)
                {

                    string CourseType = dtGraduate.Rows[0]["CourseType"].ToString();
                    string ApplyingFor = dtGraduate.Rows[0]["ApplyingFor"].ToString();
                    string Programme = dtGraduate.Rows[0]["ProgrammId"].ToString();

                    
                    if (CourseType == "Regular")
                    {
                        if (ApplyingFor == "Graduate with honours")
                        {
                            lblOnlyHons_TotalMark.Text = dtGraduate.Rows[0]["TotalMark_Hon"].ToString();
                            lblOnlyHons_TotalMarkSecure.Text = dtGraduate.Rows[0]["TotalMarkSecure_Hon"].ToString();
                            TROnlyHons.Visible = true;

                        }
                        else if (ApplyingFor == "Graduate with PASS/EQUIVALENT")
                        {
                            lblOnlyPass_TotalMark.Text = dtGraduate.Rows[0]["TotalMark_Pass"].ToString();
                            lblOnlyPass_TotalMarkSecure.Text = dtGraduate.Rows[0]["TotalMarkSecure_Pass"].ToString();
                            TROnlyPass.Visible = true;

                        }
                        else if (ApplyingFor == "Law graduates under 5-year LL.B. integrated course")
                        {
                            lblLLB5Yrs_TotalMark.Text = dtGraduate.Rows[0]["LLM_TotalMark5Yrs"].ToString();
                            lblLLB5Yrs_TotalMarkSecure.Text = dtGraduate.Rows[0]["LLM_TotalMarkSecure5Yrs"].ToString();
                            TRLLB5Yrs.Visible = true;

                        }
                        else if (ApplyingFor == "Law graduates under 3-years LL.B. course")
                        {
                            string LLB3YrsCourseType = dtGraduate.Rows[0]["LLM_3Yrs_Type"].ToString();
                            if (LLB3YrsCourseType == "Honours graduate with LLB")
                            {
                                lblLLB3YrsHons_CourseType.Text = dtGraduate.Rows[0]["LLM_3Yrs_Type"].ToString();
                                lblLLB3YrsHons_Division.Text = dtGraduate.Rows[0]["LLM_3Yrs_LLBHonDiv"].ToString();
                                lblLLB3YrsHons_TotalMarks.Text = dtGraduate.Rows[0]["LLM_3Yrs_LLBHonTotalMark"].ToString();
                                lblLLB3YrsHons_TotalMarksSecure.Text = dtGraduate.Rows[0]["LLM_3Yrs_LLBHonMarkSecure"].ToString();
                                TRLLB3YrsHons.Visible = true;
                                TD3Yrs_Division.Visible = true;

                            }
                            else if (LLB3YrsCourseType == "Pass Graduate/Equivalent with LLB")
                            {
                                lblLLB3YrsPass_CourseType.Text = dtGraduate.Rows[0]["LLM_3Yrs_Type"].ToString();
                                lblLLB3YrsPass_TotalMark.Text = dtGraduate.Rows[0]["TotalMark_Pass"].ToString();
                                lblLLB3YrsPass_TotalMarkSecure.Text = dtGraduate.Rows[0]["TotalMarkSecure_Pass"].ToString();
                                lblLLB3Yrs_TotalMark.Text = dtGraduate.Rows[0]["LLM_3Yrs_LLBPassTotalMark"].ToString();
                                lblLLB3Yrs_TotalMarkSecure.Text = dtGraduate.Rows[0]["LLM_3Yrs_LLBPassMarkSecure"].ToString();
                                TRLLB3YrsPass.Visible = true;
                                TD3Yrs_Division.Visible = false;


                            }
                            else
                            {

                            }
                        }
                        else if (ApplyingFor == "Graduate/equivalent with MAT")
                        {

                            lblMBA_TotalMarks.Text = dtGraduate.Rows[0]["MBA_TotalMarks"].ToString();
                            lblMBA_TotalMarkSecure.Text = dtGraduate.Rows[0]["MBA_TotalMarkSecured"].ToString();
                            lblMBA_MATScore.Text = dtGraduate.Rows[0]["MBA_MatScore"].ToString();
                            TDMAT.Visible = true;
                            TRMBA.Visible = true;
                        }
                        else if (ApplyingFor == "Graduate/Equivalent with non MAT")
                        {
                            lblMBA_TotalMarks.Text = dtGraduate.Rows[0]["MBA_TotalMarks"].ToString();
                            lblMBA_TotalMarkSecure.Text = dtGraduate.Rows[0]["MBA_TotalMarkSecured"].ToString();
                            TDMAT.Visible = false;
                            TRMBA.Visible = true;
                        }
                        else
                        {
                            TROnlyHons.Visible = false;
                            TROnlyPass.Visible = false;
                            TRLLB5Yrs.Visible = false;
                            TRLLB3YrsHons.Visible = false;
                            TRLLB3YrsPass.Visible = false;
                            TRMBA.Visible = false;
                            TRMBA_Exp.Visible = false;
                            TRMTech.Visible = false;
                            TRBEBTechBsc.Visible = false;
                        }
                    }
                    else if (CourseType == "Self Financing")
                    {

                        if (ApplyingFor == "Graduate with honours")
                        {
                                                        
                            if (Programme == "P039")
                            {
                                lbl3honsDivision.Text = dtGraduate.Rows[0]["MTech_GraduateDiv"].ToString();
                                lblPG_RSGIS.Text = dtGraduate.Rows[0]["MTech_Hons_PG_RSAndGIS"].ToString();

                                TRMTech.Visible = true;
                                TDProDegree.Visible = false;
                                TD3HonsDiv.Visible = true;
                                TDMscDiv.Visible = false;                                                              
                                TRPG_RSAndGIS.Visible = true;
                            }
                            else
                            {
                                lblOnlyHons_TotalMark.Text = dtGraduate.Rows[0]["TotalMark_Hon"].ToString();
                                lblOnlyHons_TotalMarkSecure.Text = dtGraduate.Rows[0]["TotalMarkSecure_Hon"].ToString();
                                TROnlyHons.Visible = true;
                            }
                        }
                        else if (ApplyingFor == "Graduate with PASS/EQUIVALENT")
                        {

                            if (Programme == "P039")
                            {
                                //lblPG_RSGIS.Text = dtGraduate.Rows[0]["MTech_Hons_PG_RSAndGIS"].ToString();
                                //TRMTech.Visible = true;
                                //TDProDegree.Visible = false;
                                //TD3HonsDiv.Visible = false;
                                //TDMscDiv.Visible = false;
                                //TRPG_RSAndGIS.Visible = true;
                                lbl3honsDivision.Text = dtGraduate.Rows[0]["MTech_GraduateDiv"].ToString();
                                lblPG_RSGIS.Text = dtGraduate.Rows[0]["MTech_Hons_PG_RSAndGIS"].ToString();

                                TRMTech.Visible = true;
                                TDProDegree.Visible = false;
                                TD3HonsDiv.Visible = true;
                                TDMscDiv.Visible = false;
                                TRPG_RSAndGIS.Visible = true;
                            }
                            else
                            {
                                lblOnlyPass_TotalMark.Text = dtGraduate.Rows[0]["TotalMark_Pass"].ToString();
                                lblOnlyPass_TotalMarkSecure.Text = dtGraduate.Rows[0]["TotalMarkSecure_Pass"].ToString();
                                TROnlyPass.Visible = true;
                            }

                        }
                        else if (ApplyingFor == "Professionals with 2yr+ exp." && Programme == "P032")
                        {
                            lblMBA_TotalMarks.Text = dtGraduate.Rows[0]["MBA_TotalMarks"].ToString();
                            lblMBA_TotalMarkSecure.Text = dtGraduate.Rows[0]["MBA_TotalMarkSecured"].ToString();
                            lblMBA_WorkExp.Text = dtGraduate.Rows[0]["WorkExp_MBA"].ToString();
                            TDMAT.Visible = false;
                            TRMBA.Visible = true;
                            TRMBA_Exp.Visible = true;

                        }
                        else if (ApplyingFor == "On job Professional with 2yr+ exp." && Programme == "P032")
                        {
                            lblMBA_TotalMarks.Text = dtGraduate.Rows[0]["MBA_TotalMarks"].ToString();
                            lblMBA_TotalMarkSecure.Text = dtGraduate.Rows[0]["MBA_TotalMarkSecured"].ToString();
                            lblMBA_WorkExp.Text = dtGraduate.Rows[0]["WorkExp_MBA"].ToString();
                            TDMAT.Visible = false;
                            TRMBA.Visible = true;
                            TRMBA_Exp.Visible = true;
                        }
                        else if (ApplyingFor == "Entrepreneur and self employed person with Own-SSIS" && Programme == "P032")
                        {
                            lblMBA_TotalMarks.Text = dtGraduate.Rows[0]["MBA_TotalMarks"].ToString();
                            lblMBA_TotalMarkSecure.Text = dtGraduate.Rows[0]["MBA_TotalMarkSecured"].ToString();
                            TDMAT.Visible = false;
                            TRMBA.Visible = true;
                        }
                        else if (Programme == "P033" || Programme == "P051")
                        {
                            lblMBA_TotalMarks.Text = dtGraduate.Rows[0]["MBA_TotalMarks"].ToString();
                            lblMBA_TotalMarkSecure.Text = dtGraduate.Rows[0]["MBA_TotalMarkSecured"].ToString();
                            TDMAT.Visible = false;
                            TRMBA.Visible = true;
                        }
                        else if (ApplyingFor == "Honours Graduate" && (Programme == "P040" || Programme == "P041" || Programme == "P045"))
                        {
                            lbl3honsDivision.Text = dtGraduate.Rows[0]["MTech_GraduateDiv"].ToString();
                            lblMscDivision.Text = dtGraduate.Rows[0]["MTech_MscDiv"].ToString();
                            TRMTech.Visible = true;
                            TDProDegree.Visible = false;
                            TD3HonsDiv.Visible = true;
                            TDMscDiv.Visible = true;
                        }
                        else if (ApplyingFor == "Professional Degree (B.E/B.Tech)" && (Programme == "P040" || Programme == "P041" || Programme == "P045"))
                        {

                            TRMTech.Visible = true;
                            TDMscDiv.Visible = false;
                            TD3HonsDiv.Visible = false;
                            TDProDegree.Visible = true;
                            lblProDegree.Text = dtGraduate.Rows[0]["MTech_ProDegreeDiv"].ToString();
                        }
                        else if (ApplyingFor == "Honours Graduate" && Programme == "P036")
                        {//Msc in Applied 

                            lblOnlyHons_TotalMark.Text = dtGraduate.Rows[0]["TotalMark_Hon"].ToString();
                            lblOnlyHons_TotalMarkSecure.Text = dtGraduate.Rows[0]["TotalMarkSecure_Hon"].ToString();
                            TROnlyHons.Visible = true;

                        }
                        else if (ApplyingFor == "Pass Graduate/Equivalent" && Programme == "P036")
                        {//Msc in Applied 
                            lblOnlyPass_TotalMark.Text = dtGraduate.Rows[0]["TotalMark_Pass"].ToString();
                            lblOnlyPass_TotalMarkSecure.Text = dtGraduate.Rows[0]["TotalMarkSecure_Pass"].ToString();
                            TROnlyPass.Visible = true;

                        }
                        else if (ApplyingFor == "B.Sc./B.E./B.Tech in Chemical Engineering" && Programme == "P036")
                        {//Msc in Applied 
                            lblBEBTechBscMark.Text = dtGraduate.Rows[0]["BE_BTech_Bsc_TotalMark"].ToString();
                            lblBEBTechBscMarkSecure.Text = dtGraduate.Rows[0]["BE_BTech_Bsc_MarkSecure"].ToString();
                            TRBEBTechBsc.Visible = true;
                        }
                        else if (ApplyingFor == "Qualifying Exam B.Sc./B.E./B.Tech/Home Sc. in B.Pharm" && Programme == "P042")
                        {//Msc in Food Sc 
                            lblBEBTechBscMark.Text = dtGraduate.Rows[0]["BE_BTech_Bsc_TotalMark"].ToString();
                            lblBEBTechBscMarkSecure.Text = dtGraduate.Rows[0]["BE_BTech_Bsc_MarkSecure"].ToString();
                            TRBEBTechBsc.Visible = true;
                        }
                        else if (ApplyingFor == "Hons Graduate" && Programme == "P044")
                        {//Msc in Nano sc
                            TRHons_PassDivision.Visible = true;
                            TDHonsDiv.Visible = true;
                            lblHonsGrdDivision.Text = dtGraduate.Rows[0]["Hons_Div"].ToString();
                        }
                        else if (ApplyingFor == "Pass Graduate" && Programme == "P044")
                        {//Msc in Nano sc
                            TRHons_PassDivision.Visible = true;
                            TDPassDiv.Visible = true;
                            lblPassGrdDivision.Text = dtGraduate.Rows[0]["Pass_Div"].ToString();
                        }
                        else if (ApplyingFor == "Hons Graduate with PG Diploma in RS & GIS" && Programme == "P037")
                        {//M.Tech Geospatial
                            lbl3honsDivision.Text = dtGraduate.Rows[0]["MTech_GraduateDiv"].ToString();
                            lblPG_RSGIS.Text = dtGraduate.Rows[0]["MTech_Hons_PG_RSAndGIS"].ToString();
                            TRMTech.Visible = true;
                            TDProDegree.Visible = false;
                            TD3HonsDiv.Visible = true;
                            TDMscDiv.Visible = false;
                            TRPG_RSAndGIS.Visible = true;
                        }
                        else if (ApplyingFor == "M.Sc." && Programme == "P037")
                        {//M.Tech Geospatial
                            TRMTech.Visible = true;
                            TDMscDiv.Visible = true;
                            TD3HonsDiv.Visible = false;
                            TDProDegree.Visible = false;
                            lblMscDivision.Text = dtGraduate.Rows[0]["MTech_MscDiv"].ToString();

                        }
                        else if (ApplyingFor == "B.Tech/B.E" && Programme == "P037")
                        {//M.Tech Geospatial
                            TRMTech.Visible = true;
                            TDMscDiv.Visible = false;
                            TD3HonsDiv.Visible = false;
                            TDProDegree.Visible = true;
                            lblProDegree.Text = dtGraduate.Rows[0]["MTech_ProDegreeDiv"].ToString();
                        }
                        else if (ApplyingFor == "Hons Graduate" && Programme == "P049")
                        {//PG Diploma Bioinformatics
                            TRMTech.Visible = true;
                            TDMscDiv.Visible = true;
                            TD3HonsDiv.Visible = false;
                            TDProDegree.Visible = false;
                            lblMscDivision.Text = dtGraduate.Rows[0]["MTech_MscDiv"].ToString();

                            TRHons_PassDivision.Visible = true;
                            TDHonsDiv.Visible = true;
                            lblHonsGrdDivision.Text = dtGraduate.Rows[0]["Hons_Div"].ToString();
                        }
                        else if (ApplyingFor == "Pass Graduate" && Programme == "P049")
                        {//PG Diploma Bioinformatics
                            TRMTech.Visible = true;
                            TDMscDiv.Visible = true;
                            TD3HonsDiv.Visible = false;
                            TDProDegree.Visible = false;
                            lblMscDivision.Text = dtGraduate.Rows[0]["MTech_MscDiv"].ToString();

                            TRHons_PassDivision.Visible = true;
                            TDPassDiv.Visible = true;
                            lblPassGrdDivision.Text = dtGraduate.Rows[0]["Pass_Div"].ToString();

                        }
                        else if (ApplyingFor == "Honours Graduate" && Programme == "P053")
                        {//Msc in food science 

                            lblOnlyHons_TotalMark.Text = dtGraduate.Rows[0]["TotalMark_Hon"].ToString();
                            lblOnlyHons_TotalMarkSecure.Text = dtGraduate.Rows[0]["TotalMarkSecure_Hon"].ToString();
                            TROnlyHons.Visible = true;

                        }
                        else if (ApplyingFor == "Pass Graduate" && Programme == "P053")
                        {//Msc in food science
                            lblOnlyPass_TotalMark.Text = dtGraduate.Rows[0]["TotalMark_Pass"].ToString();
                            lblOnlyPass_TotalMarkSecure.Text = dtGraduate.Rows[0]["TotalMarkSecure_Pass"].ToString();
                            TROnlyPass.Visible = true;

                        }
                        else if (ApplyingFor == "B.E./B.Tech./B.Sc. Home Sc./B.Pharm (4years study after +2)" && Programme == "P053")
                        {//Msc in food science

                            TRMTech.Visible = true;
                            TDMscDiv.Visible = false;
                            TD3HonsDiv.Visible = false;
                            TDProDegree.Visible = true;
                            lblProDegree.Text = dtGraduate.Rows[0]["MTech_ProDegreeDiv"].ToString();
                        }
                    }

                }
                    try
                {
                    DataTable dtDocument = dt.Tables[6];
                    DataTable dtDoc = new DataTable();
                    dtDoc.Columns.AddRange(new DataColumn[3] { new DataColumn("Sr No", typeof(int)),
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
                catch
                { }
                
                try
                {
                    
                    QRCode1.GenerateQRCodeApplication(m_ServiceID, m_AppID);
                   // QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);
                }
                catch { }
            }
        }
    }
}