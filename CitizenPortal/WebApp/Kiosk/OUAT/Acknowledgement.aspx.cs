using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.OUAT
{
    public partial class Acknowledgement : System.Web.UI.Page
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

            DataSet dt = m_OUATBLL.GetOUATAppDetails(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[1];
            DataTable dtTrackStatus = dt.Tables[2];
            DataTable dtEducationDetails = dt.Tables[3];
            DataTable dtAge = dt.Tables[7];

            if (dtApp.Rows.Count != 0)
            {
                lblAadhaarNo.Text = dtApp.Rows[0]["AadhaarNumber"].ToString();
                FullName.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                //MiddleName.Text = dtApp.Rows[0]["MiddleName"].ToString();
                MotherName.Text = dtApp.Rows[0]["mothername"].ToString();
                FatherName.Text = dtApp.Rows[0]["FatherName"].ToString();

                DOBConverted.Text = dtApp.Rows[0]["DOB"].ToString();
                //int Years;
                //int Months;
                //int Days;
                //DateTime Dob = DateTime.Parse(DOBConverted.Text);

                //DateTime Now = DateTime.Parse("01/01/2016");
                //Years = new DateTime(Now.Subtract(Dob).Ticks).Year - 1;
                //DateTime PastYearDate = Dob.AddYears(Years);
                //Months = 0;
                //for (int i = 1; i <= 12; i++)
                //{
                //    if (PastYearDate.AddMonths(i) == Now)
                //    {
                //        Months = i;
                //        break;
                //    }
                //    else if (PastYearDate.AddMonths(i) >= Now)
                //    {
                //        Months = i - 1;
                //        break;
                //    }
                //}
                //Days = Now.Subtract(PastYearDate.AddMonths(Months)).Days;
                //int Hours = Now.Subtract(PastYearDate).Hours;
                //int Minutes = Now.Subtract(PastYearDate).Minutes;
                //int Seconds = Now.Subtract(PastYearDate).Seconds;
                ////string.Format("Age: {0} Year(s) {1} Month(s) {2} Day(s) {3} Hour(s) {4} Second(s)",Years, Months, Days, Hours, Seconds);
                AgeYear.Text = dtAge.Rows[0]["Years"].ToString() + " years";//Years.ToString();
                AgeMonth.Text = dtAge.Rows[0]["Months"].ToString() + " months";//Months.ToString();
                AgeDay.Text = dtAge.Rows[0]["Days"].ToString() + " days";//Days.ToString();

                gender.Text = dtApp.Rows[0]["Gender"].ToString();
                Religion.Text = dtApp.Rows[0]["Religion"].ToString();
                Category.Text = dtApp.Rows[0]["Category"].ToString();
                mothertongue.Text = dtApp.Rows[0]["mothertongue"].ToString();
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
                lblResidentType.Text = dtApp.Rows[0]["ResidentType"].ToString();
                lblExamCent1.Text = dtApp.Rows[0]["FirstChoiceOfExaminationCenter"].ToString();
                lblExamCent2.Text = dtApp.Rows[0]["SecondChoiceOfExaminationCenter"].ToString();
                lblExamCent3.Text = dtApp.Rows[0]["ThirdChoiceOfExaminationCenter"].ToString();

                if (dtApp.Rows[0]["knowodia"].ToString() == "True")
                {
                    lblOdia.Text = "Yes";
                    trResType.Attributes.Add("style", "display:none;");
                    trLang.Attributes.Add("style", "display:;");
                }
                else
                {
                    trResType.Attributes.Add("style", "display:;");
                    trLang.Attributes.Add("style", "display:none;");
                    lblOdia.Text = "No";
                }
                if (dtApp.Rows[0]["knowodia"].ToString() == "False")
                {
                    trResType.Attributes.Add("style", "display:;");
                    trLang.Attributes.Add("style", "display:none;");
                    lblOdia.Text = "No";

                }
                else
                {
                    lblOdia.Text = "Yes";
                    trResType.Attributes.Add("style", "display:none;");
                    trLang.Attributes.Add("style", "display:;");
                }


                if (dtApp.Rows[0]["readodia"].ToString() == "True")
                {
                    //Section1_AbililtyRead.Text = "Yes";//dtApp.Rows[0]["Section1_AbililtyRead"].ToString();
                    Section1_AbililtyRead.Text = "YES";
                }
                else
                {
                    //Section1_AbililtyRead.Text = "NO";
                    Section1_AbililtyRead.Text = "NO";//"/0x52";
                }
                if (dtApp.Rows[0]["writeodia"].ToString() == "True")
                {
                    //Section1_AbilityWrite.Text = "Yes";//dtApp.Rows[0]["Section1_AbililtyRead"].ToString();
                    Section1_AbilityWrite.Text = "Yes";
                }
                else
                {
                    //Section1_AbilityWrite.Text = "NO";
                    Section1_AbilityWrite.Text = "NO";
                }
                if (dtApp.Rows[0]["speakodia"].ToString() == "True")
                {
                    //Section1_AbilitySpeak.Text = "Yes";//dtApp.Rows[0]["Section1_AbililtyRead"].ToString();
                    Section1_AbilitySpeak.Text = "Yes";
                }
                else
                {
                    //Section1_AbilitySpeak.Text = "NO";
                    Section1_AbilitySpeak.Text = "NO";
                }



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
                    AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"]).ToString("dd/MM/yyyy");
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
                    //lblEduSate.Text = dtEducationDetails.Rows[0]["EduState"].ToString();
                    lblEduExamName.Text = dtEducationDetails.Rows[0]["NameOfExamination"].ToString();
                    lblEduPassingYear.Text = dtEducationDetails.Rows[0]["PassingYear"].ToString();
                    lblEduBoardName.Text = dtEducationDetails.Rows[0]["NameOfBoard"].ToString();
                    lblEduGrade.Text = dtEducationDetails.Rows[0]["GradeType"].ToString();
                    lblEduTotalMarks.Text = dtEducationDetails.Rows[0]["TotalMarks"].ToString();
                    lblEduMarksScored.Text = dtEducationDetails.Rows[0]["MarkSecured"].ToString();
                    lblEduPercentageMarks.Text = dtEducationDetails.Rows[0]["Percentage"].ToString();
                    lblEduExamCleared.Text = dtEducationDetails.Rows[0]["PassingType"].ToString();
                }
                try
                {
                    QRCode1.GenerateQRCodeApplication(m_ServiceID, m_AppID);
                    //QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);
                }
                catch { }
            }
        }
    }
}