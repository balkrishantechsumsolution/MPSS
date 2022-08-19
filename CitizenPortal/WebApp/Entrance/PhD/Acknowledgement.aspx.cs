using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.OUAT.PGPhD
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

            DataSet dt = m_OUATBLL.GetCSVTUPGPhDAppDetail(m_AppID, m_ServiceID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[6];
            DataTable dtTrackStatus = dt.Tables[5];
            DataTable dtEducationDetails = dt.Tables[2];
            DataTable dtImage = dt.Tables[1];
            DataTable dtAge = dt.Tables[7];

            DataTable dtEntrance = dt.Tables[3];
            DataTable dtExperiance = dt.Tables[4];
            DataTable dtDocument = dt.Tables[8];


            if (dtApp.Rows.Count != 0)
            {
                lblIsExempted.Text = dtApp.Rows[0]["IsEntranceExempted"].ToString();
                lblCourseType.Text = dtApp.Rows[0]["CourseType"].ToString();

                lblResearch.Text = dtApp.Rows[0]["ResearchCenters"].ToString();
                lblDiscipline.Text = dtApp.Rows[0]["DisciplineName"].ToString();
                lblSpecialization.Text = dtApp.Rows[0]["Specialization"].ToString();
                lblRollNo.Text = dtApp.Rows[0]["RollNo"].ToString();
                lblExempted.Text = dtApp.Rows[0]["IsExempted"].ToString();
                lblExamRelaxation.Text = dtApp.Rows[0]["CategoryofExemption"].ToString();
                
                if (dtApp.Rows[0]["ExemptionType"].ToString() == "EX001")
                {
                    divENT.Visible = true; divMPhil.Visible = false; divFellowship.Visible = false; divResearch.Visible = false;
                    txtCETName.Text = dtApp.Rows[0]["Entrance"].ToString();
                    txtCETYear.Text = dtApp.Rows[0]["CETYear"].ToString();
                    txtCETPercentage.Text = dtApp.Rows[0]["CETPercentage"].ToString();
                    txtCETValid.Text = dtApp.Rows[0]["CETValid"].ToString();
                    txtCETDetail.Text = dtApp.Rows[0]["CETDetail"].ToString();

                }
                else if (dtApp.Rows[0]["ExemptionType"].ToString() == "EX002")
                {
                    divENT.Visible = false; divMPhil.Visible = true; divFellowship.Visible = false; divResearch.Visible = false;
                    txtMPhilFrom.Text = dtApp.Rows[0]["MPhilFrom"].ToString();
                    txtMPhilTo.Text = dtApp.Rows[0]["MPhilTo"].ToString();
                    txtMode.Text = dtApp.Rows[0]["Mode"].ToString();
                    txtMPhilCourse.Text = dtApp.Rows[0]["MPhilCourse"].ToString();
                    txtMPhilUniv.Text = dtApp.Rows[0]["MPhilUniv"].ToString();
                    txtMPhilDetail.Text = dtApp.Rows[0]["MPhilDetail"].ToString();
                }
                else if (dtApp.Rows[0]["ExemptionType"].ToString() == "EX003")
                {
                    divENT.Visible = false; divMPhil.Visible = false; divFellowship.Visible = true; divResearch.Visible = false;
                    txtFellowFrom.Text = dtApp.Rows[0]["FellowFrom"].ToString();
                    txtFellowTo.Text = dtApp.Rows[0]["FellowTo"].ToString();
                    txtFellowCollege.Text = dtApp.Rows[0]["FellowCollege"].ToString();
                    txtFellowUniv.Text = dtApp.Rows[0]["FellowUniv"].ToString();
                    txtSeniorityNo.Text = dtApp.Rows[0]["SeniorityNo"].ToString();
                    txtFellowPost.Text = dtApp.Rows[0]["FellowPost"].ToString();
                }
                else if (dtApp.Rows[0]["ExemptionType"].ToString() == "EX004")
                {
                    divENT.Visible = false; divMPhil.Visible = false; divFellowship.Visible = false; divResearch.Visible = true;
                    txtResearchFrom.Text = dtApp.Rows[0]["ResearchFrom"].ToString();
                    txtResearchTo.Text = dtApp.Rows[0]["ResearchTo"].ToString();
                    txtLaboratry.Text = dtApp.Rows[0]["Laboratry"].ToString();
                    txtResearchOrg.Text = dtApp.Rows[0]["ResearchOrg"].ToString();
                    txtResearchPost.Text = dtApp.Rows[0]["ResearchPost"].ToString();
                    txtResearchNature.Text = dtApp.Rows[0]["ResearchNature"].ToString();

                }
                else { divENT.Visible = false; divMPhil.Visible = false; divFellowship.Visible = false; divResearch.Visible = false; }


                lblJournal.Text = dtApp.Rows[0]["ResearchPublished"].ToString();
                lblJournalDetail.Text = dtApp.Rows[0]["PublishedDetail"].ToString();
                lblConference.Text = dtApp.Rows[0]["ResearchPresented"].ToString();
                lblConferenceDetail.Text = dtApp.Rows[0]["PresentedDetail"].ToString();
                lblCourse.Text = dtApp.Rows[0]["AnyOtherCourse"].ToString();

                if (dtApp.Rows[0]["AnyOtherCourse"].ToString() == "Yes")
                {
                    lblCourseFrom.Text = dtApp.Rows[0]["CourseFrom"].ToString();
                    lblCourseMode.Text = dtApp.Rows[0]["CourseMode"].ToString();
                    lblCourseName.Text = dtApp.Rows[0]["CourseName"].ToString();
                    lblCourseCollege.Text = dtApp.Rows[0]["CourseCollege"].ToString();
                    lblCourseUniversity.Text = dtApp.Rows[0]["CourseUniversity"].ToString();
                    lblCourseRollNo.Text = dtApp.Rows[0]["CourseRollNo"].ToString();

                }

                lblPunishment.Text = dtApp.Rows[0]["DisciplinaryAction"].ToString();
                if (dtApp.Rows[0]["DisciplinaryAction"].ToString() == "Yes")
                {
                    lblPunishmentDetail.Text = dtApp.Rows[0]["PresentedDetail"].ToString();
                }

                PWD.Text = dtApp.Rows[0]["PhysicallyChallenged"].ToString();
                isOrtho.Text = dtApp.Rows[0]["IsOrtho"].ToString();
                IsVisual.Text = dtApp.Rows[0]["IsVisual"].ToString();
                IsHearing.Text = dtApp.Rows[0]["IsHearing"].ToString();
                if (dtApp.Rows[0]["AnyOtherCourse"].ToString() == "Yes")
                {
                    trCourse.Visible = true;
                }
                else
                {
                    trCourse.Visible = false;
                }

                ProfilePhoto.Src = dtImage.Rows[0]["Photograph"].ToString();
                ProfileSignature.Src = dtImage.Rows[0]["Signature"].ToString();

                AppID.Text = dtApp.Rows[0]["AppID"].ToString();
                //lblAadhaarNo.Text = dtApp.Rows[0]["AadhaarNumber"].ToString();
                FullName.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                MotherName.Text = dtApp.Rows[0]["MotherName"].ToString();
                FatherName.Text = dtApp.Rows[0]["FatherName"].ToString();
                DOBConverted.Text = dtApp.Rows[0]["DOB"].ToString();

                AgeYear.Text = dtAge.Rows[0]["Years"].ToString() + " years";//Years.ToString();
                AgeMonth.Text = dtAge.Rows[0]["Months"].ToString() + " months";//Months.ToString();
                AgeDay.Text = dtAge.Rows[0]["Days"].ToString() + " days";//Days.ToString();

                //lblBloodGroup.Text= dtApp.Rows[0]["BloodGroup"].ToString();
                //lblAnnualIncome.Text = dtApp.Rows[0]["AnnualIncome"].ToString();
                gender.Text = dtApp.Rows[0]["Gender"].ToString();
                //Religion.Text = dtApp.Rows[0]["Religion"].ToString();
                Category.Text = dtApp.Rows[0]["Category"].ToString();
                //mothertongue.Text = dtApp.Rows[0]["mothertongue"].ToString();
                Nationality.Text = dtApp.Rows[0]["Nationality"].ToString();
                EmailID.Text = dtApp.Rows[0]["emailid"].ToString();
                MobileNo.Text = dtApp.Rows[0]["MobileNo"].ToString();
                //MaritalStatus.Text = dtApp.Rows[0]["MaritalStatus"].ToString();

                PBlock.Text = dtApp.Rows[0]["ParSubDistrictName"].ToString();//?
                PAddressLine1.Text = dtApp.Rows[0]["ParmanentAddressline1"].ToString();
                PAddressLine2.Text = dtApp.Rows[0]["ParmanentAddressline2"].ToString();
                PLandMark.Text = dtApp.Rows[0]["ParLandmark"].ToString();//?
                PLocality.Text = dtApp.Rows[0]["ParLocality"].ToString();
                PRoadStreetName.Text = dtApp.Rows[0]["ParRoadstreet"].ToString();
                PddlState.Text = dtApp.Rows[0]["ParSTATEName"].ToString();
                PddlDistrict.Text = dtApp.Rows[0]["ParDistrictName"].ToString();//?
                PddlVillage.Text = dtApp.Rows[0]["Parvillage"].ToString();//?
                PPinCode.Text = dtApp.Rows[0]["ParPincode"].ToString();

                CAddressLine1.Text = dtApp.Rows[0]["PresentAddressline1"].ToString();//?
                CAddressLine2.Text = dtApp.Rows[0]["PresentAddressline2"].ToString();//?
                CLandMark.Text = dtApp.Rows[0]["PreLandmark"].ToString();//?
                CLocality.Text = dtApp.Rows[0]["PreLocality"].ToString();//?
                CRoadStreetName.Text = dtApp.Rows[0]["PreRoadstreet"].ToString();//?
                CPinCode.Text = dtApp.Rows[0]["PrePincode"].ToString();//?
                CddlState.Text = dtApp.Rows[0]["PreStateName"].ToString();//?
                CddlDistrict.Text = dtApp.Rows[0]["PreDistrictName"].ToString();//?
                CBlock.Text = dtApp.Rows[0]["PreSubDistrictName"].ToString();//?
                CddlVillage.Text = dtApp.Rows[0]["Pervillage"].ToString();//?

                if (dtApp.Rows[0]["NRIPincode"].ToString() != "")
                {
                    PerAddress.Visible = false;
                    NRIAddress.Visible = true;
                    CAddressLine1.Text = dtApp.Rows[0]["NRIAddressline1"].ToString();//?
                    CAddressLine2.Text = dtApp.Rows[0]["NRIAddressline2"].ToString();//?
                    NRICountry.Text = dtApp.Rows[0]["NRICountry"].ToString();//?
                    NRIddlVillage.Text = dtApp.Rows[0]["NRICityTown"].ToString();//?
                    NRIPinCode.Text = dtApp.Rows[0]["NRIPincode"].ToString();
                }
                else { PerAddress.Visible = true; NRIAddress.Visible = false; }

                grdEducation.DataSource = dtEducationDetails;
                grdEducation.DataBind();

                if (dtEntrance.Rows.Count > 1)
                {
                    divEnrance.Visible = true;
                    grdExam.DataSource = dtEntrance;
                    grdExam.DataBind();
                }
                else { divEnrance.Visible = false; }


                if (dtExperiance.Rows.Count > 1)
                {
                    divExperiance.Visible = true;
                    grdWork.DataSource = dtExperiance;
                    grdWork.DataBind();
                }
                else { divExperiance.Visible = false; }


                DataTable dtDoc = new DataTable();
                dtDoc.Columns.AddRange(new DataColumn[4] { new DataColumn("Sr No", typeof(int)),
                            new DataColumn("Document Name", typeof(string)),
                            new DataColumn("Status",typeof(string)),
                            new DataColumn("View", typeof(string))
                });

                string t_Status = "";
                for (int i = 0; i < dtDocument.Rows.Count; i++)
                {
                    if (dtDocument.Rows[i]["IsUploaded"].ToString() == "1")
                        t_Status = "Attached";
                    else
                        t_Status = "Not Attached";

                    dtDoc.Rows.Add(i + 1, dtDocument.Rows[i]["DocDesc"].ToString(), t_Status, dtDocument.Rows[i]["Path"].ToString());
                }

                grdView.DataSource = dtDoc;
                grdView.DataBind();

                if (dtTransDetail.Rows.Count != 0)
                {
                    lblAppID.Text = dtTransDetail.Rows[0]["AppID"].ToString();
                    //AppName.Text = dtApp.Rows[0]["ApplicantName"].ToString();
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
                    AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"]).ToString("dd/MM/yyyy");
                }
                else { }

                if (dtTrackStatus.Rows.Count != 0)
                {
                    //lblCertificateName.Text = dtTrackStatus.Rows[0]["ServiceName"].ToString();
                    //lbldepartment.Text = dtTrackStatus.Rows[0]["DepartmentName"].ToString();
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