using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Enrollment
{
    public partial class Acknowledgement : CommonBasePage
    {
        EnrollmentBLL m_BLLObj = new EnrollmentBLL();
        string m_AppID, m_ServiceID;

        protected void Page_Load(object sender, EventArgs e)
         {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] != null) { m_ServiceID = Request.QueryString["SvcID"].ToString(); }

            m_AppID = Request.QueryString["AppID"].ToString();
            

            DataSet dt = m_BLLObj.GetStudentEnrollmentData(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0]; //EnrollmentData
            DataTable dtImage = dt.Tables[1]; // ImageData
            DataTable dtAddress = dt.Tables[2]; //AddressData
            DataTable dtEducationDetails = dt.Tables[3]; //EducationDetail
            DataTable dtAge = dt.Tables[4]; //Age
            DataTable dtTrackStatus = dt.Tables[5];
            DataTable dtTransDetail = dt.Tables[6];
            DataTable dtActionHistory = dt.Tables[7];

            if (dtApp.Rows.Count != 0)
            {
                if (dtApp.Rows[0]["RollNo"].ToString() != "")
                {
                    trRollNo.Visible = true;
                    lblEnrollmentNo.Text = dtApp.Rows[0]["EnrollmentNo"].ToString();
                    lblRollNo.Text = dtApp.Rows[0]["RollNo"].ToString();
                }
                else { trRollNo.Visible = false; }

                lblEnrollType.Text = dtApp.Rows[0]["EnrollType"].ToString();
                lblEnrollment.Text = dtApp.Rows[0]["CSVTUEnrollmentNo"].ToString();
                lblCourse.Text = dtApp.Rows[0]["CourseName"].ToString();
                lblProgram.Text = dtApp.Rows[0]["Program"].ToString();
                //lblRollNo.Text = dtApp.Rows[0]["RollNo"].ToString();
                lblCollege.Text = dtApp.Rows[0]["CollegeCode"].ToString();
                lblCollege.Text = dtApp.Rows[0]["COLLEGENAME"].ToString();
                if (dtImage.Rows.Count > 0)
                {
                    ProfilePhoto.Src = dtImage.Rows[0]["Photograph"].ToString();
                    ProfileSignature.Src = dtImage.Rows[0]["Signature"].ToString();
                }
                AppID.Text = dtApp.Rows[0]["AppID"].ToString();

                FullName.Text = dtApp.Rows[0]["StudentName"].ToString();
                MotherName.Text = dtApp.Rows[0]["MotherName"].ToString();
                FatherName.Text = dtApp.Rows[0]["FatherName"].ToString();
                DOBConverted.Text = dtApp.Rows[0]["DOB"].ToString();
                lblAAO.Text = dtApp.Rows[0]["AAO"].ToString();
                AgeYear.Text = dtAge.Rows[0]["Years"].ToString() + " years";//Years.ToString();
                AgeMonth.Text = dtAge.Rows[0]["Months"].ToString() + " months";//Months.ToString();
                AgeDay.Text = dtAge.Rows[0]["Days"].ToString() + " days";//Days.ToString();

                lblBloodGroup.Text = dtApp.Rows[0]["BloodGroup"].ToString();
                gender.Text = dtApp.Rows[0]["Gender"].ToString();
                Category.Text = dtApp.Rows[0]["Category"].ToString();
                lblAdmittedCategory.Text = dtApp.Rows[0]["AdmittedCategory"].ToString();
                Nationality.Text = dtApp.Rows[0]["Nationality"].ToString();
                EmailID.Text = dtApp.Rows[0]["emailid"].ToString();
                MobileNo.Text = dtApp.Rows[0]["MobileNo"].ToString();

                PWD.Text = dtApp.Rows[0]["PWD"].ToString();
                lblAdmissionYear.Text = dtApp.Rows[0]["AdmissionYear"].ToString();
                lblAdmissionDate.Text = dtApp.Rows[0]["AdmissionDate"].ToString();
                lblCourseType.Text = dtApp.Rows[0]["CourseType"].ToString();
                lblExamType.Text = dtApp.Rows[0]["ExamType"].ToString();
                Nationality.Text = dtApp.Rows[0]["Nationality"].ToString();
                lblDTERegister.Text = dtApp.Rows[0]["DTERegistrationNo"].ToString();
                lblDTERollNo.Text = dtApp.Rows[0]["DTERollNo"].ToString();

                PBlock.Text = dtAddress.Rows[0]["ParSubDistrictName"].ToString();//?
                PAddressLine1.Text = dtAddress.Rows[0]["ParmanentAddressline1"].ToString();
                PAddressLine2.Text = dtAddress.Rows[0]["ParmanentAddressline2"].ToString();
                PLandMark.Text = dtAddress.Rows[0]["ParLandmark"].ToString();//?
                PLocality.Text = dtAddress.Rows[0]["ParLocality"].ToString();
                PRoadStreetName.Text = dtAddress.Rows[0]["ParRoadstreet"].ToString();
                PddlState.Text = dtAddress.Rows[0]["ParSTATEName"].ToString();
                PddlDistrict.Text = dtAddress.Rows[0]["ParDistrictName"].ToString();//?
                PddlVillage.Text = dtAddress.Rows[0]["Parvillage"].ToString();//?
                PPinCode.Text = dtAddress.Rows[0]["ParPincode"].ToString();

                CAddressLine1.Text = dtAddress.Rows[0]["PresentAddressline1"].ToString();//?
                CAddressLine2.Text = dtAddress.Rows[0]["PresentAddressline2"].ToString();//?
                CLandMark.Text = dtAddress.Rows[0]["PreLandmark"].ToString();//?
                CLocality.Text = dtAddress.Rows[0]["PreLocality"].ToString();//?
                CRoadStreetName.Text = dtAddress.Rows[0]["PreRoadstreet"].ToString();//?
                CPinCode.Text = dtAddress.Rows[0]["PrePincode"].ToString();//?
                CddlState.Text = dtAddress.Rows[0]["PreStateName"].ToString();//?
                CddlDistrict.Text = dtAddress.Rows[0]["PreDistrictName"].ToString();//?
                CBlock.Text = dtAddress.Rows[0]["PreSubDistrictName"].ToString();//?
                CddlVillage.Text = dtAddress.Rows[0]["Pervillage"].ToString();//?


                lblIsEnroll.Text = dtApp.Rows[0]["IsEnroll"].ToString();
                lblCSVTUReg.Text = dtApp.Rows[0]["CSVTUEnrollmentNo"].ToString();
                lblGap.Text = dtApp.Rows[0]["GAP"].ToString();
                lblGapYear.Text = dtApp.Rows[0]["GapYear"].ToString();
                lblMigration.Text = dtApp.Rows[0]["Migration"].ToString();
                lblMigrationNo.Text = dtApp.Rows[0]["MigrationNo"].ToString();
                lblMigrationDate.Text = dtApp.Rows[0]["MigrationDate"].ToString();
                lblIsScore.Text = dtApp.Rows[0]["IsScore"].ToString();
                lblScoreCard.Text = dtApp.Rows[0]["ScoreCard"].ToString();

                if (dtApp.Rows[0]["IsEnroll"].ToString() == "Yes")
                {
                    trCourse.Visible = true;
                }
                else { trCourse.Visible = false; }

                if (dtApp.Rows[0]["GAP"].ToString() == "Yes")
                {
                    trGAP.Visible = true;
                }
                else { trGAP.Visible = false; }

                if (dtApp.Rows[0]["Migration"].ToString() == "Yes") {
                    trMigration.Visible = true;
                }
                else { trMigration.Visible = false; }

                if (lblIsScore.Text == "No") { trScore.Visible = false; } else { trScore.Visible = true; }

                if (dtApp.Rows[0]["MarkSheetXDoc"].ToString() == "Yes") { chkClassX.Checked = true; trClassX.Visible = true; } else { chkClassX.Checked = false; trClassX.Visible = false; }
                if (dtApp.Rows[0]["MarkSheetXIIDoc"].ToString() == "Yes") { chkClassXII.Checked = true; trClassXII.Visible = true; } else { chkClassXII.Checked = false; trClassXII.Visible = false; }
                if (dtApp.Rows[0]["DiplomaCerificateDoc"].ToString() == "Yes") { chkDiploma.Checked = true; trClassDiploma.Visible = true; } else { chkDiploma.Checked = false; trClassDiploma.Visible = false; }
                if (dtApp.Rows[0]["UGMarkSheetDoc"].ToString() == "Yes") { chkUG.Checked = true; trUG.Visible = true; } else { chkUG.Checked = false; trUG.Visible = false; }
                if (dtApp.Rows[0]["PGMarkSheetDoc"].ToString() == "Yes") { chkPG.Checked = true; trPG.Visible = true; } else { chkPG.Checked = false; trPG.Visible = false; }
                if (dtApp.Rows[0]["CasteCertificateDoc"].ToString() == "Yes") { chkCaste.Checked = true; trCasteDoc.Visible = true; } else { chkCaste.Checked = false; trCasteDoc.Visible = false; }
                if (dtApp.Rows[0]["DomicileCertificateDoc"].ToString() == "Yes") { chkDomicile.Checked = true; trDomicileDoc.Visible = true; } else { chkDomicile.Checked = false; trDomicileDoc.Visible = false; }
                if (dtApp.Rows[0]["MigrationCertificateDoc"].ToString() == "Yes") { chkMig.Checked = true; trMig.Visible = true; } else { chkMig.Checked = false; trMig.Visible = false; }
                if (dtApp.Rows[0]["GapCertificateDoc"].ToString() == "Yes") { chkGap.Checked = true; trGAPDoc.Visible = true; } else { chkGap.Checked = false; trGAPDoc.Visible = false; }
                if (dtApp.Rows[0]["ScoreCardDoc"].ToString() == "Yes") { chkScore.Checked = true; trScoreDoc.Visible = true; } else { chkScore.Checked = false; trScoreDoc.Visible = false; }
                if (dtApp.Rows[0]["OtherDoc"].ToString() == "Yes") { chkOtherDoc.Checked = true; trOtherDoc.Visible = true; } else { chkOtherDoc.Checked = false; trOtherDoc.Visible = false; }

                lblEntranceNo.Text = dtApp.Rows[0]["EntranceRollNo"].ToString();
                lblExamName.Text = dtApp.Rows[0]["ScoreCard"].ToString();
                lblScoreCard.Text = dtApp.Rows[0]["EntranceMarks"].ToString();
                if (dtApp.Rows[0]["Category"].ToString() != "UR")
                {
                    tblCaste.Visible = true;
                    lblCasteDate.Text = dtApp.Rows[0]["CasteCertificateDate"].ToString();
                    lblCasteNo.Text = dtApp.Rows[0]["CasteCertificateNo"].ToString();
                    lblCaste.Text = dtApp.Rows[0]["CasteIssuingAuthority"].ToString();
                }
                else { tblCaste.Visible = false; }
                lblDomicileState.Text = dtApp.Rows[0]["DomicileState"].ToString();
                lblDomicileDistrict.Text = dtApp.Rows[0]["DomicileDistrict"].ToString();
                lblDomicileTehsile.Text = dtApp.Rows[0]["DomicileTehsil"].ToString();
                lblDomicileDate.Text = dtApp.Rows[0]["DomicileDate"].ToString();
                lblDomicileNo.Text = dtApp.Rows[0]["DomicileNo"].ToString();
                lblDomicileIssue.Text = dtApp.Rows[0]["DomicleAuthority"].ToString();

                if ((dtApp.Rows[0]["PhysicsSubject"].ToString() != "")
                    || (dtApp.Rows[0]["ChemistrySubject"].ToString() != "")
                    || (dtApp.Rows[0]["MathematicsSubject"].ToString() != ""))
                {
                    divQualification.Visible = true;
                lblPhySubject.Text = dtApp.Rows[0]["PhysicsSubject"].ToString();
                txtPhyTotalMarks.Text = dtApp.Rows[0]["PhysicsTM"].ToString();
                txtPhyMarkSecure.Text = dtApp.Rows[0]["PhysicsMO"].ToString();
                txtPhyPercentage.Text = dtApp.Rows[0]["PhysicsPR"].ToString();

                lblCheSubject.Text = dtApp.Rows[0]["ChemistrySubject"].ToString();
                txtCheTotalMarks.Text = dtApp.Rows[0]["ChemistryTM"].ToString();
                txtCheMarkSecure.Text = dtApp.Rows[0]["ChemistryMO"].ToString();
                txtChePercentage.Text = dtApp.Rows[0]["ChemistryPR"].ToString();

                lblMatSubject.Text = dtApp.Rows[0]["MathematicsSubject"].ToString();
                txtMatTotalMarks.Text = dtApp.Rows[0]["MathematicsTM"].ToString();
                txtMatMarkSecure.Text = dtApp.Rows[0]["MathematicsMO"].ToString();
                txtMatPercentage.Text = dtApp.Rows[0]["MathematicsPR"].ToString();
}
                else {
                    divQualification.Visible = false;
                }

                grdEducation.DataSource = dtEducationDetails;
                grdEducation.DataBind();


                //grdView.DataSource = dtDoc;
                //grdView.DataBind();

                if (dtTransDetail.Rows.Count != 0)
                {
                    lblAppID.Text = dtTransDetail.Rows[0]["AppID"].ToString();
                    lblTrnsID.InnerHtml = dtTransDetail.Rows[0]["TrnID"].ToString();

                    if (dtTransDetail.Rows[0]["TrnID"].ToString() != "")
                    {
                        lblPayStatus.Text = "Paid";
                        lblPayment.Text = "Paid";
                        lblAppStatus.Text = dtApp.Rows[0]["AppStatus"].ToString();
                        lblTrnsDate.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy");
                    }
                    else { lblPayStatus.Text = "UnPaid"; lblPayment.Text = "UnPaid"; lblAppStatus.Text = "Application Save"; }

                    lblTotalFee.Text = dtTransDetail.Rows[0]["total"].ToString();
                    AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["CreatedOn"]).ToString("dd/MM/yyyy");
                }
                else { }

                if (dtTrackStatus.Rows.Count != 0)
                {
                    //lblCertificateName.Text = dtTrackStatus.Rows[0]["ServiceName"].ToString();
                    //lbldepartment.Text = dtTrackStatus.Rows[0]["DepartmentName"].ToString();
                }

                if (dtActionHistory.Rows.Count != 0)
                {
                    grdHistory.DataSource = dtActionHistory;
                    grdHistory.DataBind();
                }

                try
                {
                    QRCode.GenerateQRCodeApplication(m_ServiceID, m_AppID);
                    //Missing Function Level Access Control (stop to access copy url from popup window and run it other window)
                    //string strPreviousPage = "";
                    //if (Request.UrlReferrer != null)
                    //{
                    //    strPreviousPage = Request.UrlReferrer.Segments[Request.UrlReferrer.Segments.Length - 1];
                    //}
                    //if (strPreviousPage == "")
                    //{
                    //    Response.Redirect("~/customError.aspx");
                    //}
                }

                catch
                {

                }
            }
        }
        protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int i = 0;
                HtmlAnchor t_Anchor = null;
                if (e.Row.Cells[2].Text == "Attached")
                {
                    i = e.Row.Cells.Count - 1;
                    t_Anchor = new HtmlAnchor();
                    t_Anchor.ID = "ViewDoc_" + e.Row.RowIndex;
                    t_Anchor.InnerHtml = "View";
                    t_Anchor.Attributes.Add("onclick", "ViewDoc('" + m_AppID + "', '" + m_ServiceID + "','" + e.Row.Cells[3].Text + "')");
                    t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                    e.Row.Cells[i].Controls.Add(t_Anchor);
                    e.Row.Cells[i].Attributes.Add("Title", "View");
                    e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                    i++;
                }
                t_Anchor = null;
            }
        }
    }
}