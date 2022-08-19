using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Data;

namespace CitizenPortal.WebApp.Kiosk.OUAT
{
    public partial class AcknowledgementForDoctoralMaster : BasePage
    {
        OUATBLL m_OUATBLL = new OUATBLL();
        string m_AppID, m_ServiceID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet dt = m_OUATBLL.GetOUATPHDAppDetails(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[1];
            DataTable dtTrackStatus = dt.Tables[2];
            DataTable dtEducationDetails = dt.Tables[3];
            DataTable dtSign = dt.Tables[4];
            DataTable dtAge = dt.Tables[5];

            if (dtApp.Rows.Count != 0)
            {
                lblProgramme.Text = dtApp.Rows[0]["OUATCourse"].ToString();
                lblCollegeName.Text = dtApp.Rows[0]["CollegeName"].ToString();
                lblDegreeName.Text = dtApp.Rows[0]["DegreeName"].ToString();

                if(dtApp.Rows[0]["SubjectName"].ToString()=="-Select-")
                {
                    NameSubject.InnerText = "";
                    lblSubjectName.Text = "";
                }
                else
                {
                    lblSubjectName.Text = dtApp.Rows[0]["SubjectName"].ToString();
                }

                ICARYesNo.Text= dtApp.Rows[0]["ICARYesNo"].ToString();
                //ICARName.Text= dtApp.Rows[0]["ICARCollegeName"].ToString();

                ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfileSignature.Src = dtSign.Rows[0]["ImageSign"].ToString();

                lblAadhaarNo.Text = dtApp.Rows[0]["AadhaarNumber"].ToString();
                FullName.Text = dtApp.Rows[0]["ApplicantName"].ToString();
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
                MaritalStatus.Text = dtApp.Rows[0]["MaritalStatus"].ToString();

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


                if (dtApp.Rows[0]["ReservationQuota"].ToString() == "Yes")
                {
                    divReservedQuota.Visible = true;
                    ReservedQuota.Text = dtApp.Rows[0]["ReservationQuota"].ToString().ToString();

                    if (dtApp.Rows[0]["PhysicallyChallenged"].ToString() == "1")
                    {
                        divPhyChlng.Visible = true;
                        divPCType.Visible = true;
                        divPCPart.Visible = true;
                        divPCPercnt.Visible = true;
                        lblPC.Text = "Yes";
                        lblPCType.Text = dtApp.Rows[0]["HandicapType"].ToString();
                        lblPCPart.Text = dtApp.Rows[0]["HandicappedPart"].ToString();
                        lblPCPercnt.Text = dtApp.Rows[0]["HandicappedPercent"].ToString();
                    }
                    else
                    {
                        lblPC.Text = "No";
                        divPhyChlng.Visible = false;
                        divPCType.Visible = false;
                        divPCPart.Visible = false;
                        divPCPercnt.Visible = false;
                    }


                    if (dtApp.Rows[0]["NRISponsership"].ToString() == "1")
                    {
                        lblNRI.Text = "Yes";
                    }
                    else
                    {
                        lblNRI.Text = "No";
                    }


                    if (dtApp.Rows[0]["OtherState"].ToString() == "1")
                    {
                        divOtherState.Visible = true;
                        lblOthrState.Text = "Yes";
                        lblOtherStateName.Text = dtApp.Rows[0]["OtherStateName"].ToString();
                    }
                    else
                    {
                        lblOthrState.Text = "No";
                        divOtherState.Visible = false;
                    }


                    if (dtApp.Rows[0]["Horticulture"].ToString() == "1")
                    {
                        lblHoticultre.Text = "Yes";
                    }
                    else
                    {
                        lblHoticultre.Text = "No";
                    }

                }
                else
                {
                    divReservedQuota.Visible = false;
                    divPhyChlng.Visible = false;
                    divPCType.Visible = false;
                    divPCPart.Visible = false;
                    divPCPercnt.Visible = false;
                    divOtherStateQuota.Visible = false;
                    divOtherState.Visible = false;
                    ReservedQuota.Text = dtApp.Rows[0]["ReservationQuota"].ToString().ToString();
                }


                if (dtApp.Rows[0]["Section1_RecievedAnyGoldmadel"].ToString() == "Yes")
                {
                    MedalStatus.Text = "Yes";
                }
                else
                {
                    MedalStatus.Text = "No";
                }


                if (dtApp.Rows[0]["Section3_AreYouEmployed"].ToString() == "Yes")
                {
                    DivEmployed.Visible = true;
                    EmpolyedStatus.Text = dtApp.Rows[0]["Section3_AreYouEmployed"].ToString();
                    DesignationName.Text = dtApp.Rows[0]["Section3_Dsignation"].ToString();
                    EmployerName.Text = dtApp.Rows[0]["Section3_EmployerName"].ToString();
                    EmployerAddress.Text = dtApp.Rows[0]["Section3_EmployerAddress"].ToString();
                    NOCStatus.Text = dtApp.Rows[0]["Section3_CerifiedFurnished"].ToString();
                }
                else
                {
                    EmpolyedStatus.Text = dtApp.Rows[0]["Section3_AreYouEmployed"].ToString();
                    DivEmployed.Visible = false;
                }


                if (dtApp.Rows[0]["Section2_SpecialClaim"].ToString() == "Yes")
                {
                    divSports.Visible = true;
                    divNcc.Visible = true;
                    

                    lblSpecialClaim.Text = dtApp.Rows[0]["Section2_SpecialClaim"].ToString();

                    if(dtApp.Rows[0]["Section2_DescribeSpecialClaim"].ToString() == "N.S.S")
                    {
                        divNss.Visible = true;
                        lblNss.Text = "N.S.S";
                        txtNss.Text = dtApp.Rows[0]["Section2_Nss"].ToString();
                    }
                    else
                    {
                        divNss.Visible = false;
                    }


                    if (dtApp.Rows[0]["Section2_DescribeSpecialClaim"].ToString() == "N.C.C")
                    {
                        divNcc.Visible = true;
                        lblNss.Text = "N.C.C";
                    }
                    else
                    {
                        divNss.Visible = false;
                    }


                    if (dtApp.Rows[0]["Section2_DescribeSpecialClaim"].ToString() == "Sports")
                    {
                        divSports.Visible = true;
                        lblSports.Text = "N.S.S";
                        txtSports.Text = dtApp.Rows[0]["Section2_Sports"].ToString();
                    }
                    else
                    {
                        divSports.Visible = false;
                    }
                }
                else
                {
                    divSports.Visible = false;
                    divNcc.Visible = false;
                    divNss.Visible = false;
                    lblSpecialClaim.Text = dtApp.Rows[0]["Section2_SpecialClaim"].ToString();
                }


                lblResidentType.Text = dtApp.Rows[0]["ResidenceType"].ToString();


                if (dtApp.Rows[0]["OdiaLang"].ToString() == "Yes")
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


                if (dtApp.Rows[0]["OdiaLang"].ToString() == "No")
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


                if (dtApp.Rows[0]["ReadOdia"].ToString() == "Yes")
                {
                    Section1_AbililtyRead.Text = "Yes";
                }
                else
                {
                    Section1_AbililtyRead.Text = "No";//"/0x52";
                }


                if (dtApp.Rows[0]["WriteOdia"].ToString() == "Yes")
                {
                    Section1_AbilityWrite.Text = "Yes";
                }
                else
                {
                    Section1_AbilityWrite.Text = "No";
                }


                if (dtApp.Rows[0]["SpeakOdia"].ToString() == "Yes")
                {
                    Section1_AbilitySpeak.Text = "Yes";
                }
                else
                {
                    Section1_AbilitySpeak.Text = "No";
                }


                if (dtEducationDetails.Rows.Count > 0)
                {
                    lblHscName.Text = dtEducationDetails.Rows[0]["HscName"].ToString();
                    lblHscTotalMarks.Text = dtEducationDetails.Rows[0]["HscTotalMarks"].ToString();
                    lblHscMarksGot.Text = dtEducationDetails.Rows[0]["HscMarksGot"].ToString();
                    lblHscPercentage.Text = dtEducationDetails.Rows[0]["HscPercentage"].ToString();
                    lblHscDivision.Text = dtEducationDetails.Rows[0]["HSCGradeType"].ToString();
                    lblHscPassingYear.Text = dtEducationDetails.Rows[0]["HscPassingYear"].ToString();

                    lblSscName.Text = dtEducationDetails.Rows[0]["SscName"].ToString();
                    lblSscTotalMarks.Text = dtEducationDetails.Rows[0]["SscTotalMarks"].ToString();
                    lblSscMarksGot.Text = dtEducationDetails.Rows[0]["SscMarksGot"].ToString();
                    lblSscPercentage.Text = dtEducationDetails.Rows[0]["SscPercentage"].ToString();
                    lblSscDivision.Text = dtEducationDetails.Rows[0]["SSCGradeType"].ToString();
                    lblSscPassingYear.Text = dtEducationDetails.Rows[0]["SscPassingYear"].ToString();

                    lblBscName.Text = dtEducationDetails.Rows[0]["BscName"].ToString();
                    lblBscTotalMarks.Text = dtEducationDetails.Rows[0]["BscTotalMarks"].ToString();
                    lblBscMarksGot.Text = dtEducationDetails.Rows[0]["BscMarksGot"].ToString();
                    lblBscPercentage.Text = dtEducationDetails.Rows[0]["BscPercentage"].ToString();
                    lblBscDivision.Text = dtEducationDetails.Rows[0]["BSCGradeType"].ToString();
                    lblBscPassingYear.Text = dtEducationDetails.Rows[0]["BscPassingYear"].ToString();

                    if (dtEducationDetails.Rows[0]["MscName"].ToString()!="" || dtEducationDetails.Rows[0]["MscPassingYear"].ToString()!="" || dtEducationDetails.Rows[0]["MscPercentage"].ToString()!="")
                    {
                        divMSC.Visible = true;
                        lblMscName.Text = dtEducationDetails.Rows[0]["MscName"].ToString();
                        lblMscTotalMarks.Text = dtEducationDetails.Rows[0]["MscTotalMarks"].ToString();
                        lblMscMarksGot.Text = dtEducationDetails.Rows[0]["MscMarksGot"].ToString();
                        lblMscPercentage.Text = dtEducationDetails.Rows[0]["MscPercentage"].ToString();
                        lblMscDivision.Text = dtEducationDetails.Rows[0]["MSCGradeType"].ToString();
                        lblMscPassingYear.Text = dtEducationDetails.Rows[0]["MscPassingYear"].ToString();
                    }
                    else
                        divMSC.Visible = false;
                }


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


                try
                {
                    QRCode.GenerateQRCodeApplication(m_ServiceID, m_AppID);
                }
                catch { }
            }
        }
    }
}