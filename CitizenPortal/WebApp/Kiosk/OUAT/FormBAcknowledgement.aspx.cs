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
    public partial class FormBAcknowledgement : System.Web.UI.Page
    {

        OUATBLL m_OUATBLL = new OUATBLL();
        string m_AppID, m_ServiceID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            //btnHome.PostBackUrl = Session["HomePage"].ToString();

            DataSet dt = m_OUATBLL.GetOUATFormBAppDetails(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[1];
            DataTable dtTrackStatus = dt.Tables[2];
            DataTable dtEducationDetails = dt.Tables[3];
            DataTable dtSignDetails = dt.Tables[6];
            DataTable dtAge = dt.Tables[7];
            DataTable dtRollDetails = dt.Tables[8];
            DataTable dtMarksDetails = dt.Tables[9];
            DataTable dtDocument = dt.Tables[10];

            if (dtApp.Rows.Count != 0)
            {
                lblAadhaarNo.Text = dtApp.Rows[0]["AadhaarNumber"].ToString();
                FullName.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                //MiddleName.Text = dtApp.Rows[0]["MiddleName"].ToString();
                MotherName.Text = dtApp.Rows[0]["mothername"].ToString();
                FatherName.Text = dtApp.Rows[0]["FatherName"].ToString();

                DOBConverted.Text = dtApp.Rows[0]["DOB"].ToString();
                
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
                    Section1_AbililtyRead.Text = "Yes";
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

                lblIsGCH.Text = dtApp.Rows[0]["IsGCH"].ToString();
                lblIsHC.Text = dtApp.Rows[0]["IsHC"].ToString();
                lblIsNRI.Text = dtApp.Rows[0]["IsNRI"].ToString();
                lblIsWO.Text = dtApp.Rows[0]["IsWO"].ToString();
                lblIsOE.Text = dtApp.Rows[0]["IsOE"].ToString();
                lblIsKM.Text = dtApp.Rows[0]["IsKM"].ToString();

                
                lblHanfiPart.Text = dtApp.Rows[0]["HandicappedPart"].ToString();
                lblHandiPersent.Text = dtApp.Rows[0]["HandicappedPercent"].ToString();
                lblResiDistrict.Text = dtApp.Rows[0]["WesternDistrict"].ToString();
                lblKMFrom.Text = dtApp.Rows[0]["KMFrom"].ToString();
                lblKMTo.Text = dtApp.Rows[0]["KMTo"].ToString();
                lblKMDuration.Text = dtApp.Rows[0]["KMTo"].ToString();
                                
                if (dtApp.Rows[0]["IsHC"].ToString() == "Yes")
                {
                    divPH.Visible = true;
                }
                else { divPH.Visible = false; }
                                
                if (dtApp.Rows[0]["IsWO"].ToString() == "Yes")
                {
                    divWO.Visible = true;
                }
                else { divWO.Visible = false; }
                
                if (dtApp.Rows[0]["IsKM"].ToString() == "Yes")
                {
                    divKM2.Visible = true;
                }
                else { divKM2.Visible = false; }

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

                    lblEduExamName0.Text = dtEducationDetails.Rows[1]["NameOfExamination"].ToString();
                    lblEduPassingYear0.Text = dtEducationDetails.Rows[1]["PassingYear"].ToString();
                    lblEduBoardName0.Text = dtEducationDetails.Rows[1]["NameOfBoard"].ToString();
                    lblEduGrade0.Text = dtEducationDetails.Rows[1]["GradeType"].ToString();
                    lblEduTotalMarks0.Text = dtEducationDetails.Rows[1]["TotalMarks"].ToString();
                    lblEduMarksScored0.Text = dtEducationDetails.Rows[1]["MarkSecured"].ToString();
                    lblEduPercentageMarks0.Text = dtEducationDetails.Rows[1]["Percentage"].ToString();
                    lblEduExamCleared0.Text = dtEducationDetails.Rows[1]["PassingType"].ToString();
                }

                if (dtTrackStatus.Rows.Count != 0)
                {
                    //lblCertificateName.Text = dtTrackStatus.Rows[0]["ServiceName"].ToString();
                    //lbldepartment.Text = dtTrackStatus.Rows[0]["DepartmentName"].ToString();
                }
                //"data:image/png;base64," +
                ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfileSignature.Src = dtSignDetails.Rows[0]["ImageSign"].ToString();

                if (dtRollDetails.Rows.Count > 0)
                {
                    lblExamCenter.Text = dtRollDetails.Rows[0]["ExaminationCentre"].ToString();
                    lblRollNo.Text = dtRollDetails.Rows[0]["rollnumber"].ToString();
                }

                if (dtMarksDetails.Rows.Count > 0)
                {
                    //lblEduSate.Text = dtEducationDetails.Rows[0]["EduState"].ToString();
                    txtTMT_Physics.Text = dtMarksDetails.Rows[0]["TMT_Physics"].ToString();
                    txtMOT_Physics.Text = dtMarksDetails.Rows[0]["MOT_Physics"].ToString();
                    txtTMP_Physics.Text = dtMarksDetails.Rows[0]["TMP_Physics"].ToString();
                    txtMOP_Physics.Text = dtMarksDetails.Rows[0]["MOP_Physics"].ToString();
                    txtTMTP_Physics.Text = dtMarksDetails.Rows[0]["TMTP_Physics"].ToString();
                    txtTMOTP_Physics.Text = dtMarksDetails.Rows[0]["TMOTP_Physics"].ToString();

                    txtTMT_Chemistry.Text = dtMarksDetails.Rows[0]["TMT_Chemistry"].ToString();
                    txtMOT_Chemistry.Text = dtMarksDetails.Rows[0]["MOT_Chemistry"].ToString();
                    txtTMP_Chemistry.Text = dtMarksDetails.Rows[0]["TMP_Chemistry"].ToString();
                    txtMOP_Chemistry.Text = dtMarksDetails.Rows[0]["MOP_Chemistry"].ToString();
                    txtTMTP_Chemistry.Text = dtMarksDetails.Rows[0]["TMTP_Chemistry"].ToString();
                    txtTMOTP_Chemistry.Text = dtMarksDetails.Rows[0]["TMOTP_Chemistry"].ToString();

                    txtTMT_Maths.Text = dtMarksDetails.Rows[0]["TMT_Math"].ToString();
                    txtMOT_Maths.Text = dtMarksDetails.Rows[0]["MOT_Math"].ToString();
                    txtTMP_Maths.Text = dtMarksDetails.Rows[0]["TMP_Math"].ToString();
                    txtMOP_Maths.Text = dtMarksDetails.Rows[0]["MOP_Math"].ToString();
                    txtTMTP_Maths.Text = dtMarksDetails.Rows[0]["TMTP_Math"].ToString();
                    txtTMOTP_Maths.Text = dtMarksDetails.Rows[0]["TMOTP_Math"].ToString();

                    txtTMT_Botany.Text = dtMarksDetails.Rows[0]["TMT_Botany"].ToString();
                    txtMOT_Botany.Text = dtMarksDetails.Rows[0]["MOT_Botany"].ToString();
                    txtTMP_Botany.Text = dtMarksDetails.Rows[0]["TMP_Botany"].ToString();
                    txtMOP_Botany.Text = dtMarksDetails.Rows[0]["MOP_Botany"].ToString();
                    txtTMTP_Botany.Text = dtMarksDetails.Rows[0]["TMTP_Botany"].ToString();
                    txtTMOTP_Botany.Text = dtMarksDetails.Rows[0]["TMOTP_Botany"].ToString();

                    txtTMT_Zoology.Text = dtMarksDetails.Rows[0]["TMT_Zoology"].ToString();
                    txtMOT_Zoology.Text = dtMarksDetails.Rows[0]["MOT_Zoology"].ToString();
                    txtTMP_Zoology.Text = dtMarksDetails.Rows[0]["TMP_Zoology"].ToString();
                    txtMOP_Zoology.Text = dtMarksDetails.Rows[0]["MOP_Zoology"].ToString();
                    txtTMTP_Zoology.Text = dtMarksDetails.Rows[0]["TMTP_Zoology"].ToString();
                    txtTMOTP_Zoology.Text = dtMarksDetails.Rows[0]["TMOTP_Zoology"].ToString();
                    /*
                    txtTMT_Total.Text = dtMarksDetails.Rows[0]["TMT_Total"].ToString();
                    txtMOT_Total.Text = dtMarksDetails.Rows[0]["MOT_Total"].ToString();
                    txtTMP_Total.Text = dtMarksDetails.Rows[0]["TMP_Total"].ToString();
                    txtMOP_Total.Text = dtMarksDetails.Rows[0]["MOP_Total"].ToString();
                    txtTMTP_Total.Text = dtMarksDetails.Rows[0]["TMTP_Total"].ToString();
                    txtTMOTP_Total.Text = dtMarksDetails.Rows[0]["TMOTP_Total"].ToString();
                    */

                    txtTMT_PCM.Text = dtMarksDetails.Rows[0]["TMT_PCM"].ToString();
                    txtMOT_PCM.Text = dtMarksDetails.Rows[0]["MOT_PCM"].ToString();
                    txtTMP_PCM.Text = dtMarksDetails.Rows[0]["TMP_PCM"].ToString();
                    txtMOP_PCM.Text = dtMarksDetails.Rows[0]["MOP_PCM"].ToString();
                    txtTMTP_PCM.Text = dtMarksDetails.Rows[0]["TMTP_PCM"].ToString();
                    txtTMOTP_PCM.Text = dtMarksDetails.Rows[0]["MOTP_PCM"].ToString();

                    txtTMT_PCB.Text = dtMarksDetails.Rows[0]["TMT_PCB"].ToString();
                    txtMOT_PCB.Text = dtMarksDetails.Rows[0]["MOT_PCB"].ToString();
                    txtTMP_PCB.Text = dtMarksDetails.Rows[0]["TMP_PCB"].ToString();
                    txtMOP_PCB.Text = dtMarksDetails.Rows[0]["MOP_PCB"].ToString();
                    txtTMTP_PCB.Text = dtMarksDetails.Rows[0]["TMTP_PCB"].ToString();
                    txtTMOTP_PCB.Text = dtMarksDetails.Rows[0]["MOTP_PCB"].ToString();

                    lblPCM.Text = dtMarksDetails.Rows[0]["PCMPercentage"].ToString();
                    lblPCB.Text = dtMarksDetails.Rows[0]["PCBPercentage"].ToString();


                    if (txtTMT_Maths.Text == "0" && txtMOT_Maths.Text == "0")
                    {
                        lblPCM.Visible = false;
                    }
                    else if (txtTMT_Botany.Text == "0" && txtMOT_Botany.Text == "0")
                    {
                        lblPCB.Visible = false;
                    }


                    if (dtMarksDetails.Rows[0]["ExamType"].ToString() == "CBSE") {

                        lblTheoryTotal.Text = "Total Marks";
                        lblTheoryObtain.Text = "Marks Obtain";
                        lblPractTotal.Text = "Total Marks ";
                        lblPractObtain.Text = "Marks Obtain";
                        lblMarks.Text = "Total Marks";
                        lblObtain.Text = "Marks Obtain";
                        trZoo.Visible = false;
                        lblBiology.Text = "Biology";
                        rbtnMarkN.Visible = false;
                        rbtnMarkY.Visible = true;

                        thPTM.Visible = false;
                        tdPTMP.Visible = false;
                        tdPTMC.Visible = false;
                        tdPTMPM.Visible = false;
                        tdPTMB.Visible = false;
                        tdPTMPZ.Visible = false;
                        //tdPTMT.Visible = false;
                        tdPTMPTPCM.Visible = false;
                        tdPTMPTPCB.Visible = false;

                        thPMO.Visible = false;
                        thPMOP.Visible = false;
                        thPMOC.Visible = false;
                        thPMOM.Visible = false;
                        thPMOB.Visible = false;
                        thPMOZ.Visible = false;
                        //thPMOT.Visible = false;
                        thPMOPCM.Visible = false;
                        thPMOPCB.Visible = false;
                    }
                    else {
                        lblTheoryTotal.Text = "Total Marks in Theory";
                        lblTheoryObtain.Text = "Marks Obtain in Theory";
                        lblPractTotal.Text = "Total Marks in Practical";
                        lblPractObtain.Text = "Marks Obtain in Practical";
                        lblMarks.Text = "Total Marks (Theory + Practical)";
                        lblObtain.Text = "Total Mark Obtain (Theory + Practical)";

                        trZoo.Visible = true;
                        lblBiology.Text = "Botany";

                        rbtnMarkN.Visible = true;
                        rbtnMarkY.Visible = false;

                        thPTM.Visible = true;
                        tdPTMP.Visible = true;
                        tdPTMC.Visible = true;
                        tdPTMPM.Visible = true;
                        tdPTMB.Visible = true;
                        tdPTMPZ.Visible = true;
                        //tdPTMT.Visible = false;
                        tdPTMPTPCM.Visible = true;
                        tdPTMPTPCB.Visible = true;

                        thPMO.Visible = true;
                        thPMOP.Visible = true;
                        thPMOC.Visible = true;
                        thPMOM.Visible = true;
                        thPMOB.Visible = true;
                        thPMOZ.Visible = true;
                        //thPMOT.Visible = false;
                        thPMOPCM.Visible = true;
                        thPMOPCB.Visible = true;
                    }
                }

                //DataTable dtDocument = dt.Tables[2];
                DataTable dtDoc = new DataTable();
                dtDoc.Columns.AddRange(new DataColumn[3] { new DataColumn("Sl No.", typeof(int)),
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