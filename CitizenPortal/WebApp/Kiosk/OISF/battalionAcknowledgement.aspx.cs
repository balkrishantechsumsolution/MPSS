using System;
using System.Data;
using CitizenPortalLib.BLL;

namespace CitizenPortal.WebApp.Kiosk.OISF
{
    public partial class battalionAcknowledgement : System.Web.UI.Page
    {
        OISFBLL m_OISFBLL = new OISFBLL();
        string m_AppID, m_ServiceID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet dt = m_OISFBLL.GetOISFAppDetailsBattalion(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[1];
            DataTable dtTrackStatus = dt.Tables[2];
            DataTable dtEducationDetails = dt.Tables[3];

            if (dtApp.Rows.Count != 0)
            {

                lbl50Battalion.Text = dtApp.Rows[0]["BattalionNameOf50RsDD"].ToString();
                lbl50DDNo.Text = dtApp.Rows[0]["FormNumberOf50RsDD"].ToString();
                lbl50IssueDate.Text = dtApp.Rows[0]["IssueDateOf50RsDD"].ToString();
                lbl50FromNo.Text = dtApp.Rows[0]["DDNumberOf50RsDD"].ToString();

                FullName.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                //MiddleName.Text = dtApp.Rows[0]["MiddleName"].ToString();
                //LastName.Text = dtApp.Rows[0]["LastName"].ToString();
                FatherName.Text = dtApp.Rows[0]["FatherName"].ToString();

                DOBConverted.Text = dtApp.Rows[0]["DOB"].ToString();
                int Years;
                int Months;
                int Days;
                DateTime Dob = DateTime.Parse(DOBConverted.Text);

                DateTime Now = DateTime.Parse("01/01/2016");
                Years = new DateTime(Now.Subtract(Dob).Ticks).Year - 1;
                DateTime PastYearDate = Dob.AddYears(Years);
                Months = 0;
                for (int i = 1; i <= 12; i++)
                {
                    if (PastYearDate.AddMonths(i) == Now)
                    {
                        Months = i;
                        break;
                    }
                    else if (PastYearDate.AddMonths(i) >= Now)
                    {
                        Months = i - 1;
                        break;
                    }
                }
                Days = Now.Subtract(PastYearDate.AddMonths(Months)).Days;
                int Hours = Now.Subtract(PastYearDate).Hours;
                int Minutes = Now.Subtract(PastYearDate).Minutes;
                int Seconds = Now.Subtract(PastYearDate).Seconds;
                //string.Format("Age: {0} Year(s) {1} Month(s) {2} Day(s) {3} Hour(s) {4} Second(s)",Years, Months, Days, Hours, Seconds);
                AgeYear.Text = Years.ToString();
                AgeMonth.Text = Months.ToString();
                AgeDay.Text = Days.ToString();

                gender.Text = dtApp.Rows[0]["Gender"].ToString();
                Religion.Text = dtApp.Rows[0]["Religion"].ToString();
                Category.Text = dtApp.Rows[0]["Category"].ToString();
                Nationality.Text = dtApp.Rows[0]["Nationality"].ToString();
                EmailID.Text = dtApp.Rows[0]["email_id"].ToString();
                MobileNo.Text = dtApp.Rows[0]["MobileNo"].ToString();
                //stdcode.Text = dtApp.Rows[0]["StdCode"].ToString();
                phoneno.Text = dtApp.Rows[0]["phone_no"].ToString();
                PBlock.Text = dtApp.Rows[0]["PermanentBlock"].ToString();//?
                PAddressLine1.Text = dtApp.Rows[0]["houseNumber"].ToString();
                PAddressLine2.Text = dtApp.Rows[0]["postOffice"].ToString();
                PLandMark.Text = dtApp.Rows[0]["landmark"].ToString();//?
                PLocality.Text = dtApp.Rows[0]["locality"].ToString();
                PRoadStreetName.Text = dtApp.Rows[0]["street"].ToString();
                PddlState.Text = dtApp.Rows[0]["PermanentState"].ToString();
                PddlDistrict.Text = dtApp.Rows[0]["PermanentDistrict"].ToString();//?
                PddlVillage.Text = dtApp.Rows[0]["PermanentPanchayat"].ToString();//?
                PPinCode.Text = dtApp.Rows[0]["pincode"].ToString();

                //ContentPlaceHolder1_HFb64.Text = dtApp.Rows[0]["Image"].ToString();//?
                CAddressLine1.Text = dtApp.Rows[0]["AddrcareOf"].ToString();//?
                CAddressLine2.Text = dtApp.Rows[0]["AddrBuilding"].ToString();//?
                CLandMark.Text = dtApp.Rows[0]["Addrlandmark"].ToString();//?
                CLocality.Text = dtApp.Rows[0]["Addrlocality"].ToString();//?
                CRoadStreetName.Text = dtApp.Rows[0]["AddrStreet"].ToString();//?
                CPinCode.Text = dtApp.Rows[0]["CurrentPinCode"].ToString();//?
                CddlState.Text = dtApp.Rows[0]["CurrentState"].ToString();//?
                CddlDistrict.Text = dtApp.Rows[0]["CurrentDistrict"].ToString();//?
                CBlock.Text = dtApp.Rows[0]["CurrentBlock"].ToString();//?
                CddlVillage.Text = dtApp.Rows[0]["CurrentPanchayat"].ToString();//?

                Section1_PassOdia.Text = dtApp.Rows[0]["Section1_PassOdia"].ToString();
                if (dtApp.Rows[0]["Section1_AbililtyRead"].ToString() == "1")
                {
                    //Section1_AbililtyRead.Text = "Yes";//dtApp.Rows[0]["Section1_AbililtyRead"].ToString();
                    Section1_AbililtyRead.Text = "\u2713";
                }
                else
                {
                    //Section1_AbililtyRead.Text = "NO";
                    Section1_AbililtyRead.Text = "\u2717";//"/0x52";
                }
                if (dtApp.Rows[0]["Section1_AbilityWrite"].ToString() == "1")
                {
                    //Section1_AbilityWrite.Text = "Yes";//dtApp.Rows[0]["Section1_AbililtyRead"].ToString();
                    Section1_AbilityWrite.Text = "\u2713";
                }
                else
                {
                    //Section1_AbilityWrite.Text = "NO";
                    Section1_AbilityWrite.Text = "\u2717";
                }
                if (dtApp.Rows[0]["Section1_AbilitySpeak"].ToString() == "1")
                {
                    //Section1_AbilitySpeak.Text = "Yes";//dtApp.Rows[0]["Section1_AbililtyRead"].ToString();
                    Section1_AbilitySpeak.Text = "\u2713";
                }
                else
                {
                    //Section1_AbilitySpeak.Text = "NO";
                    Section1_AbilitySpeak.Text = "\u2717";
                }

                Section2_Married.Text = dtApp.Rows[0]["Section2_Married"].ToString();
                if (dtApp.Rows[0]["Section2_Married"].ToString() == "no")
                {
                    Marrid_Condition.Visible = false;
                }
                else
                {
                    Section2A_MoreThanOneSpouse.Text = dtApp.Rows[0]["Section2A_MoreThanOneSpouse"].ToString();
                }

                Section3_ExServiceMan.Text = dtApp.Rows[0]["Section3_ExServiceMan"].ToString();
                if (dtApp.Rows[0]["Section3_ExServiceMan"].ToString() == "no")
                {
                    Section3_ExServiceMan.Text = "No";
                    ExServiceMan_Condition.Visible = false;
                }
                else
                {
                    Section3_ExServiceMan.Text = "Yes";
                    //Section3A_ServiceRendered.Text = dtApp.Rows[0]["Section3A_ServiceRendered"].ToString();
                    Section3B_ServiceDurationFrom.Text = dtApp.Rows[0]["Section3B_ServiceDurationFrom"].ToString();
                    Section3B_ServiceDurationTo.Text = dtApp.Rows[0]["Section3B_ServiceDurationTo"].ToString();
                    Section3C_ServiceYear.Text = dtApp.Rows[0]["Section3C_ServiceYear"].ToString();
                    Section3C_ServiceMonth.Text = dtApp.Rows[0]["Section3C_ServiceMonth"].ToString();
                    Section3C_ServiceDay.Text = dtApp.Rows[0]["Section3C_ServiceDay"].ToString();
                }

                Section4_IsSportsPerson.Text = dtApp.Rows[0]["Section4_IsSportsPerson"].ToString();
                if (dtApp.Rows[0]["Section4_IsSportsPerson"].ToString() == "no")
                {
                    Section4_IsSportsPerson.Text = "No";
                    SportsPerson_Condition.Visible = false;
                }
                else
                {
                    Section4_IsSportsPerson.Text = "Yes";
                    Section4A_SportsParticipated.Text = dtApp.Rows[0]["Section4A_SportsParticipated"].ToString();
                    Section4C_SportsFedAssName.Text = dtApp.Rows[0]["Section4C_SportsFedAssName"].ToString();
                    Section4B_WantsRelaxation.Text = dtApp.Rows[0]["Section4B_WantsRelaxation"].ToString();
                    RelaxationHeight.Text = dtApp.Rows[0]["Section4B_RelaxationHeight"].ToString();
                    RelaxationChest.Text = dtApp.Rows[0]["Section4B_RelaxationChest"].ToString();
                    RelaxationWeight.Text = dtApp.Rows[0]["Section4B_RelaxationWeight"].ToString();
                }

                Section5.Text = dtApp.Rows[0]["Section5"].ToString();
                if (dtApp.Rows[0]["Section5"].ToString() == "no")
                {
                    Section5.Text = "No";
                    plyntnalYesNo_Condition.Visible = false;
                }
                else
                {
                    Section5.Text = "Yes";
                    Section5A_ParticipateEvent.Text = dtApp.Rows[0]["Section5A_ParticipateEvent"].ToString();
                    Section5B_SportsCategory.Text = dtApp.Rows[0]["Section5B_SportsCategory"].ToString();
                    Section5C_SportsMedal.Text = dtApp.Rows[0]["Section5C_SportsMedal"].ToString();
                }

                Section6_NCCCertificate.Text = dtApp.Rows[0]["Section6_NCCCertificate"].ToString();
                if (dtApp.Rows[0]["Section6_NCCCertificate"].ToString() == "no")
                {
                    Section6_NCCCertificate.Text = "No";
                    NCC_Condition.Visible = false;
                }
                else
                {
                    Section6_NCCCertificate.Text = "Yes";
                    Section6A_NCCCertificateCategory.Text = dtApp.Rows[0]["Section6A_NCCCertificate"].ToString();
                }

                Section7A_RegNo.Text = dtApp.Rows[0]["Section7A_RegNo"].ToString();
                Section7A_RegDate.Text = dtApp.Rows[0]["Section7A_RegDate"].ToString();
                Section7B_NameEmpExchg.Text = dtApp.Rows[0]["Section7B_NameEmpExchg"].ToString();
                Section7B_DistrictEmpExchg.Text = dtApp.Rows[0]["EmpExDistrictName"].ToString();//needs to be corrected 

                Section8_HasDL.Text = dtApp.Rows[0]["Section8_HasDL"].ToString();
                if (dtApp.Rows[0]["Section8_HasDL"].ToString() == "no")
                {
                    Drivinglicense_Condition.Visible = false;
                }
                else
                {
                    Section8A_LicenseVehicle.Text = dtApp.Rows[0]["Section8A_LicenseVehicle"].ToString();
                    Section8B_LicenseNo.Text = dtApp.Rows[0]["Section8B_LicenseNo"].ToString();
                    Section8B_LicenseDate.Text = dtApp.Rows[0]["Section8B_LicenseDate"].ToString();
                    Section8C_NameRTOOffice.Text = dtApp.Rows[0]["Section8C_NameRTOOffice"].ToString();
                    Section8C_NameRTODistrict.Text = dtApp.Rows[0]["RTODistrictName"].ToString();
                }

                if (dtApp.Rows[0]["Section9_InvolvedCriminal"].ToString() == "no")
                {
                    InvolvedCriminal_Condition.Visible = false;
                    Section9_InvolvedCriminalYesNo.Text = "No";//"\u2717";
                }
                else
                {
                    Section9_InvolvedCriminalYesNo.Text = "Yes";//"\u2713";
                    Section9A_ArrestDetail.Text = dtApp.Rows[0]["Section9A_ArrestDetail"].ToString();
                    Section9B_CaseRefNo.Text = dtApp.Rows[0]["Section9B_CaseRefNo"].ToString();
                    Section9C_State.Text = dtApp.Rows[0]["Section9C_State"].ToString();//Added State
                    Section9C_District.Text = dtApp.Rows[0]["Section9C_District"].ToString();
                    Section9D_PoliceStationNo.Text = dtApp.Rows[0]["Section9D_PoliceStationNo"].ToString();
                    Section9E_IPCSection.Text = dtApp.Rows[0]["Section9E_IPCSection"].ToString();
                }

                lbl200Battalion.Text = dtApp.Rows[0]["IssueBankNameOf200RsDD"].ToString();
                lbl200DDNo.Text = dtApp.Rows[0]["IssueNumberOf200RsDD"].ToString();
                lbl200IssueDate.Text = dtApp.Rows[0]["IssueDateOf200RsDD"].ToString();
                lbl200Amount.Text = dtApp.Rows[0]["AmountOf200RsDD"].ToString();
            }

            if (dtTransDetail.Rows.Count != 0)
            {
                lblAppID.Text = dtTransDetail.Rows[0]["AppID"].ToString();
                AppName.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                lblTrnsID.InnerHtml = dtTransDetail.Rows[0]["TrnID"].ToString();
                lblTrnsDate.InnerText = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy");
                lblAppFee.Text = dtTransDetail.Rows[0]["govt"].ToString();
                lblServTax.Text = dtTransDetail.Rows[0]["misc_charges_01"].ToString();
                lblPortalFee.Text = dtTransDetail.Rows[0]["portal_serv_fee"].ToString();
                lblTotalFee.Text = dtTransDetail.Rows[0]["total"].ToString();
                AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"]).ToString("dd/MM/yyyy");
            }

            if (dtTrackStatus.Rows.Count != 0)
            {
                //lblCertificateName.Text = dtTrackStatus.Rows[0]["ServiceName"].ToString();
                //lbldepartment.Text = dtTrackStatus.Rows[0]["DepartmentName"].ToString();
            }
            //"data:image/png;base64," +
            ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();
            ProfileSignature.Src = dtApp.Rows[0]["Signature"].ToString();
            lblEduSate.Text = dtEducationDetails.Rows[0]["EduState"].ToString();
            lblEduExamName.Text = dtEducationDetails.Rows[0]["NameOfExamination"].ToString();
            lblEduPassingYear.Text = dtEducationDetails.Rows[0]["PassingYear"].ToString();
            lblEduBoardName.Text = dtEducationDetails.Rows[0]["NameOfBoard"].ToString();
            lblEduGrade.Text = dtEducationDetails.Rows[0]["GradeType"].ToString();
            lblEduTotalMarks.Text = dtEducationDetails.Rows[0]["TotalMarks"].ToString();
            lblEduMarksScored.Text = dtEducationDetails.Rows[0]["MarkSecured"].ToString();
            lblEduPercentageMarks.Text = dtEducationDetails.Rows[0]["Percentage"].ToString();
            lblEduExamCleared.Text = dtEducationDetails.Rows[0]["PassingType"].ToString();

            try
            {
                QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);
            }
            catch { }
        }
    }
}