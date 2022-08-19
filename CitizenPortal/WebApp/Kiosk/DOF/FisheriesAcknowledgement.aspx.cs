using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Data;

namespace CitizenPortal.WebApp.Kiosk.DOF
{
    public partial class FisheriesAcknowledgement : BasePage
    {
        private FisheriesBLL m_FisheriesBLL = new FisheriesBLL();
        private string m_AppID, m_ServiceID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet dt = m_FisheriesBLL.GetAppDetails(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[1];
            DataTable dtTrackStatus = dt.Tables[2];
            DataTable dtEducationDetails = dt.Tables[3];

            if (dtApp.Rows.Count != 0)
            {
                if (dtApp.Rows[0]["ServiceID"].ToString() == "392")
                {
                    lblDeptName.InnerText = "In Land Fisheries Through Blue Revolution";
                    SpeciesCultured.Visible = false;
                }
                else if (dtApp.Rows[0]["ServiceID"].ToString() == "437")
                {
                    lblDeptName.InnerText = "Biju Matshya Pokhari Yojana";
                    SpeciesCultured.Visible = false;
                }
                else if (dtApp.Rows[0]["ServiceID"].ToString() == "438")
                {
                    lblDeptName.InnerText = "Brackish Water Fisheries Through Blue Revolution";
                    SpeciesCultured.Visible = true;
                    lblSpeciesCultured.Text = dtApp.Rows[0]["SpeciesCultured"].ToString();
                }

                lblAadhaar.Text = dtApp.Rows[0]["UIDNo"].ToString();
                lblAppname.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();
                lblDOB.Text = dtApp.Rows[0]["DOB"].ToString();
                lblAge.Text = dtApp.Rows[0]["FDOB"].ToString();
                lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
                lblGramPanchayat.Text = dtApp.Rows[0]["GramPanchayatName"].ToString();
                lblcategory.Text = dtApp.Rows[0]["Category"].ToString();
                lblEml.Text = dtApp.Rows[0]["EmailId"].ToString();
                lblMobile.Text = dtApp.Rows[0]["MobileNo"].ToString();
                lbltaluka.Text = dtApp.Rows[0]["BlockName"].ToString();
                lblapplicant_address.Text = dtApp.Rows[0]["FullAddress"].ToString();
                lbldist.Text = dtApp.Rows[0]["DistrictName"].ToString();
                lblvillage.Text = dtApp.Rows[0]["VillageName"].ToString();
                lblState.Text = dtApp.Rows[0]["State"].ToString();
                lblpin.Text = dtApp.Rows[0]["PinCode"].ToString();
                lblQuintal.Text = dtApp.Rows[0]["PresentFishQuantal"].ToString();
                lblValue.Text = dtApp.Rows[0]["PresentFishValue"].ToString();
                lblannualincome.Text = dtApp.Rows[0]["AnnualIncome"].ToString();
                lblMeansOfFiananceValue.Text = dtApp.Rows[0]["FinanceMode"].ToString();

                if (dtApp.Rows[0]["FinanceMode"].ToString() == "BankFinance")
                {
                    BankDetail.Visible = false;
                }
                else
                {
                    BankDetail.Visible = true;
                    lblBankName.Text = dtApp.Rows[0]["BankName"].ToString();
                    lblBranchName.Text = dtApp.Rows[0]["BranchName"].ToString();
                }

                lblServiceRequired.Text = dtApp.Rows[0]["ReqdService"].ToString();

                lblEduQualification.Text= dtApp.Rows[0]["EducationalQualification"].ToString();

                if (dtApp.Rows[0]["ReqdService"].ToString() == "Excavation")
                {
                    lblLandType.Text = dtApp.Rows[0]["LandDetail"].ToString();
                    DivPresentFishProdution.Visible = false;
                }
                else if (dtApp.Rows[0]["ReqdService"].ToString() == "Renovation")
                {
                    lblLandType.Text = dtApp.Rows[0]["TankDetail"].ToString();
                    DivPresentFishProdution.Visible = true;
                }

                if (dtApp.Rows[0]["TankDetail"].ToString() == "101")
                {
                    OwnTankDtl.Visible = true;

                    lblLength.Text = dtApp.Rows[0]["TankLength"].ToString();
                    lblBreadth.Text = dtApp.Rows[0]["TankBreadth"].ToString();
                    lblArea.Text = dtApp.Rows[0]["TankArea"].ToString();

                    lblVillageMouza.Text = dtApp.Rows[0]["Village"].ToString();
                    lblKhataNo.Text = dtApp.Rows[0]["KhataNo"].ToString();
                    lblPlotNo.Text = dtApp.Rows[0]["PlotNo"].ToString();
                }
                else
                {
                    OwnTankDtl.Visible = false;
                }

                if (dtApp.Rows[0]["TankDetail"].ToString() == "102")
                {
                    LeaseoutTankDtl.Visible = true;
                    lblLeaseTankCategory.Text = dtApp.Rows[0]["LeaseCategory"].ToString();
                    lblLeasePeriod.Text = dtApp.Rows[0]["LeasePeriod"].ToString();
                    lblLeaseValue.Text = dtApp.Rows[0]["LeaseValue"].ToString();
                }
                else
                {
                    LeaseoutTankDtl.Visible = false;
                }

                if (dtApp.Rows[0]["TankDetail"].ToString() == "103")
                {
                    LeaseoutTankDtl.Visible = true;
                    lblLeaseTankCategory.Text = dtApp.Rows[0]["LeaseCategory"].ToString();
                    lblLeasePeriod.Text = dtApp.Rows[0]["LeasePeriod"].ToString();
                    lblLeaseValue.Text = dtApp.Rows[0]["LeaseValue"].ToString();
                }
                else
                {
                    LeaseoutTankDtl.Visible = false;
                }

                if (dtApp.Rows[0]["Section1_AvailedAnytraining"].ToString() == "yes")
                {
                    AvailTrng.Visible = true;
                    Section1_AvailedAnytraining.Text = dtApp.Rows[0]["Section1_AvailedAnytraining"].ToString();
                    Section1A_NoOfTraining.Text = dtApp.Rows[0]["Section1A_NoOfTraining"].ToString();
                    lblWeek.Text = dtApp.Rows[0]["Section1B_Week"].ToString();
                    lblMonth.Text = dtApp.Rows[0]["Section1B_Month"].ToString();
                    lblYear.Text = dtApp.Rows[0]["Section1B_Year"].ToString();

                    if (dtApp.Rows[0]["Section1C_training_Name"].ToString() == "Others")
                    {
                        lblOthers.Visible = true;
                        others.Visible = true;
                        lblNameOfTraining.Text = dtApp.Rows[0]["Section1C_training_Name"].ToString();
                        lblOthers.Text = dtApp.Rows[0]["Section1C_Other_training"].ToString();
                    }
                    else
                    {
                        others.Visible = false;
                        lblOthers.Visible = false;
                        lblNameOfTraining.Visible = true;
                        lblNameOfTraining.Text = dtApp.Rows[0]["Section1C_training_Name"].ToString();
                    }
                }
                else
                {
                    Section1_AvailedAnytraining.Text = dtApp.Rows[0]["Section1_AvailedAnytraining"].ToString();
                    AvailTrng.Visible = false;
                }

                if (dtApp.Rows[0]["Section2_PFCSMember"].ToString() == "yes")
                {
                    HasMembership.Visible = true;
                    lblHasMemberOfPFCSSHG.Text = dtApp.Rows[0]["Section2_PFCSMember"].ToString();
                    lblNameOfPFCSSHG.Text = dtApp.Rows[0]["Section2A_PFCSName"].ToString();
                    lbllblAddressOfPFCSSHG.Text = dtApp.Rows[0]["Section2B_PFCSAddress"].ToString();
                    lblMemberNoOfPFCSSHG.Text = dtApp.Rows[0]["Section2C_PFCSMemberNo"].ToString();
                }
                else
                {
                    lblHasMemberOfPFCSSHG.Text = dtApp.Rows[0]["Section2_PFCSMember"].ToString();
                    HasMembership.Visible = false;
                }

                if (dtApp.Rows[0]["Section3_InfrastructureatFarmSide"].ToString() == "yes")
                {
                    HasCommInfrFrmSide.Visible = true;
                    lblFarmSideInfrastructure.Text = dtApp.Rows[0]["Section3_InfrastructureatFarmSide"].ToString();

                    //lblRoad.Text = dtApp.Rows[0]["Section3A_Road"].ToString();
                    if (dtApp.Rows[0]["Section3A_Road"].ToString() == "on")
                    {
                        //lblRoad.Text = "Yes";
                        lblRoad.Text = "\u2713";
                    }
                    else
                    {
                        //Section1_AbililtyRead.Text = "NO";
                        lblRoad.Text = "\u2717";//"/0x52";
                    }

                    //lblElectricity.Text = dtApp.Rows[0]["Section3B_Electricity"].ToString();
                    if (dtApp.Rows[0]["Section3B_Electricity"].ToString() == "on")
                    {
                        //lblRoad.Text = "Yes";
                        lblElectricity.Text = "\u2713";
                    }
                    else
                    {
                        //Section1_AbililtyRead.Text = "NO";
                        lblElectricity.Text = "\u2717";//"/0x52";
                    }

                    //lblCanal.Text = dtApp.Rows[0]["Section3C_Canal"].ToString();
                    if (dtApp.Rows[0]["Section3C_Canal"].ToString() == "on")
                    {
                        //lblRoad.Text = "Yes";
                        lblCanal.Text = "\u2713";
                    }
                    else
                    {
                        //Section1_AbililtyRead.Text = "NO";
                        lblCanal.Text = "\u2717";//"/0x52";
                    }
                }
                else
                {
                    lblFarmSideInfrastructure.Text = dtApp.Rows[0]["Section3_InfrastructureatFarmSide"].ToString();
                    HasCommInfrFrmSide.Visible = false;
                }

                if (dtApp.Rows[0]["Section4_PreviouslLoan"].ToString() == "yes")
                {
                    HasAvlLoanPrvly.Visible = true;
                    lblHasLoanPreviously.Text = dtApp.Rows[0]["Section4_PreviouslLoan"].ToString();
                    lblNameOfBank.Text = dtApp.Rows[0]["Section4A_BankName"].ToString();
                    lblPurposeOfLoan.Text = dtApp.Rows[0]["Section4B_PurposeOfLoan"].ToString();
                    lblAmountOfLoan.Text = dtApp.Rows[0]["Section4C_AmountOfLoan"].ToString();
                    lblBalanceOfLoan.Text = dtApp.Rows[0]["Section4D_OutstandingLoan"].ToString();
                }
                else
                {
                    lblHasLoanPreviously.Text = dtApp.Rows[0]["Section4_PreviouslLoan"].ToString();
                    HasAvlLoanPrvly.Visible = false;
                }

                Witness1Name.Text = dtApp.Rows[0]["WitnessName1"].ToString();
                Witness1Address.Text = dtApp.Rows[0]["WitnessAddressLine1"].ToString();
                Witness2Name.Text = dtApp.Rows[0]["WitnessName2"].ToString();
                Witness2Address.Text = dtApp.Rows[0]["WitnessAddressLine2"].ToString();
            }

            DataTable dtDocument = dt.Tables[2];
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

            if (dtTransDetail.Rows.Count != 0)
            {
                lblReferenceID.Text = dtTransDetail.Rows[0]["AppID"].ToString();
                lblTrnsID.Text = dtTransDetail.Rows[0]["TrnID"].ToString();
                lblTrnsDate.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy");
                lblPortalFee.Text = dtTransDetail.Rows[0]["portal_serv_fee"].ToString();
                lblTotalFee.Text = dtTransDetail.Rows[0]["total"].ToString();
                AppDate.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["AppDate"]).ToString("dd/MM/yyyy");
            }

            //if (dtTrackStatus.Rows.Count != 0)
            //{
            //    //lblCertificateName.Text = dtTrackStatus.Rows[0]["ServiceName"].ToString();
            //    //lbldepartment.Text = dtTrackStatus.Rows[0]["DepartmentName"].ToString();
            //}

            ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();//"data:image/png;base64," +
            //lblhighersecondary.Text = dtEducationDetails.Rows[0]["NameOfHigherSecondary"].ToString();
            //lblnameofuniversity.Text = dtEducationDetails.Rows[0]["NameOfUniversity"].ToString();
            //lblpassingyr.Text = dtEducationDetails.Rows[0]["PassingYear"].ToString();
            //lblboard.Text = dtEducationDetails.Rows[0]["NameOfBoard"].ToString();
            //lblgrade.Text = dtEducationDetails.Rows[0]["PassingType"].ToString();
            //lblstate.Text = dtEducationDetails.Rows[0]["StateName"].ToString();
            //lblPercentage.Text = dtEducationDetails.Rows[0]["Percentage"].ToString();

            try
            {
                QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);
            }
            catch { }
        }
    }
}