using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Data;

namespace CitizenPortal.WebApp.Kiosk.DOF
{
    public partial class CraftAcknowledgement : BasePage
    {
        CRAFTBLL m_CRAFTBLL = new CRAFTBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Loading Page
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet dt = m_CRAFTBLL.GetAppDetails(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[1];
            //DataTable dtTrackStatus = dt.Tables[2];

            if (dtApp.Rows.Count != 0)
            {
                lblAadhaar.Text = dtApp.Rows[0]["UIDNO"].ToString();
                lblAppname.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();
                lblMother.Text = ""; //dtApp.Rows[0]["FatherName"].ToString();
                lblDOB.Text = Convert.ToDateTime(dtApp.Rows[0]["DOB"].ToString()).ToString("dd/MM/yyyy");
                lblFthrAge.Text = "";//dtApp.Rows[0]["BPLNo"].ToString();
                lblMtherAge.Text = "";//dtApp.Rows[0]["BPLYear"].ToString();
                lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
                lblReligion.Text = dtApp.Rows[0]["Religion"].ToString();
                lblCategory.Text = dtApp.Rows[0]["Category"].ToString();
                lblEml.Text = dtApp.Rows[0]["EmailId"].ToString();
                lblMobile.Text = dtApp.Rows[0]["MobileNo"].ToString();
                lblBPLNo.Text = dtApp.Rows[0]["BPLNo"].ToString();
                lblBPLYear.Text = dtApp.Rows[0]["BPLYear"].ToString();
                lblAnualIncom.Text= dtApp.Rows[0]["Annual_Income"].ToString();

                ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();//"data:image/png;base64," + 
                lblapplicant_address.Text = dtApp.Rows[0]["FullAddress"].ToString();

                lbltaluka.Text = dtApp.Rows[0]["BlockName"].ToString();
                lbldist.Text = dtApp.Rows[0]["DistrictName"].ToString();
                lblvillage.Text = dtApp.Rows[0]["VillageName"].ToString();
                lblpin.Text = dtApp.Rows[0]["pincode"].ToString();
                lblPoliceStation.Text = dtApp.Rows[0]["PoliceStation"].ToString();

                lblRegistrationNo.Text = dtApp.Rows[0]["BoatRegistrationNo"].ToString();
                lblLicenseNo.Text = dtApp.Rows[0]["BoatRegistrationDate"].ToString();

                if(dtApp.Rows[0]["Boat_Condition"].ToString()=="Bad")
                {
                    BoatCondition.Text = "No";
                    FirstEngine.Visible = true;
                    FirstEngineDetail.Visible = true;
                    EngineNo.Text = dtApp.Rows[0]["EngineNumber"].ToString();
                    EngineMake.Text = dtApp.Rows[0]["EngineMake"].ToString();
                    EngineCapacity.Text = dtApp.Rows[0]["EngineCapacity"].ToString();
                    BankFinanceYear.Text = dtApp.Rows[0]["FinanceYear"].ToString();
                    BankFinancingName.Text = dtApp.Rows[0]["FinanceBank"].ToString();
                }
                else
                {
                    BoatCondition.Text = "Yes";
                    FirstEngine.Visible = false;
                    FirstEngineDetail.Visible = false;
                }

                lblOAL.Text = dtApp.Rows[0]["BoatOal"].ToString();
                lblDepth.Text = dtApp.Rows[0]["BoatDepth"].ToString();
                lblWidth.Text = dtApp.Rows[0]["BoatWidth"].ToString();

                if (dtApp.Rows[0]["BankFinance"].ToString() == "yes")
                {
                    BnkFnceDtl.Visible = true;
                    BankFinance.Text = dtApp.Rows[0]["BankFinance"].ToString();
                    BankName1.Text = dtApp.Rows[0]["BankName1"].ToString();
                    BankAddress1.Text = dtApp.Rows[0]["BankAddress1"].ToString();
                    BankName2.Text = dtApp.Rows[0]["BankName2"].ToString();
                    BankAddress2.Text = dtApp.Rows[0]["BankAddress2"].ToString();
                }
                else
                {
                    BankFinance.Text = dtApp.Rows[0]["BankFinance"].ToString();
                    BnkFnceDtl.Visible = false;
                }


                lblManufactureDate.Text = dtApp.Rows[0]["Date_Of_Manufacture"].ToString();


                if(dtApp.Rows[0]["EngineType1"].ToString()== "Other Type Of Engine")
                {
                    otherEngineName.Visible = true;
                    lblEngineName.Text = dtApp.Rows[0]["EngineType1"].ToString();
                    lblOtherEngineName.Text = dtApp.Rows[0]["Other_Engine_Name"].ToString();
                }
                else
                {
                    lblEngineName.Text = dtApp.Rows[0]["EngineType1"].ToString();
                    otherEngineName.Visible = false;
                }



                if (dtApp.Rows[0]["EngineType2"].ToString()=="Engine Type - Other")
                {
                    OtherEngineHP.Visible = true;
                    EngineHP.Visible = true;
                    lblEngineType.Text = dtApp.Rows[0]["EngineType2"].ToString();
                    lblOtherEngineHP.Text = dtApp.Rows[0]["Other_Engine_Hp"].ToString();
                }
                else
                {
                    OtherEngineHP.Visible = false;
                    EngineHP.Visible = true;
                    lblEngineType.Text = dtApp.Rows[0]["EngineType2"].ToString();
                    lblEngineHP.Text = dtApp.Rows[0]["EngineHP"].ToString();
                }


                if (dtApp.Rows[0]["EngineType2"].ToString() == "Engine Type - Other"|| dtApp.Rows[0]["EngineHP"].ToString() == "Other")
                {
                    OtherEngineHP.Visible = true;
                    EngineHP.Visible = true;
                    lblEngineType.Text = dtApp.Rows[0]["EngineType2"].ToString();
                    lblOtherEngineHP.Text = dtApp.Rows[0]["Other_Engine_Hp"].ToString();
                }
                //else
                //{
                //    OtherEngineHP.Visible = false;
                //    EngineHP.Visible = false;
                //    lblEngineType.Text = dtApp.Rows[0]["EngineType2"].ToString();
                //    lblEngineHP.Text = dtApp.Rows[0]["EngineHP"].ToString();
                //}


                if (dtApp.Rows[0]["Engine_Purchase"].ToString() == "Direct Purchase")
                {
                    MentionPurchase.Visible = true;
                    DirPurOrDeptPur.Text = dtApp.Rows[0]["Engine_Purchase"].ToString();

                    if (dtApp.Rows[0]["Purchase_Type"].ToString()== "Others")
                    {
                        otherPurchase.Visible = true;
                        PurchaseName.Text = dtApp.Rows[0]["Purchase_Type"].ToString();
                        OthrPurchase.Text = dtApp.Rows[0]["Purchase_Type_Other"].ToString();
                    }
                    else
                    {
                        otherPurchase.Visible = false;
                        PurchaseName.Text = dtApp.Rows[0]["Purchase_Type"].ToString();
                    }
                }
                else
                {
                    MentionPurchase.Visible = false;
                    DirPurOrDeptPur.Text = dtApp.Rows[0]["Engine_Purchase"].ToString();
                }

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
                lblAmt.Text = dtTransDetail.Rows[0]["total"].ToString();
                AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"]).ToString("dd/MM/yyyy");
            }

            try
            {
                QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);
            }
            catch { }
        }
    }
}