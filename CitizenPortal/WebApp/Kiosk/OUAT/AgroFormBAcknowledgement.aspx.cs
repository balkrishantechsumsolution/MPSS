using CitizenPortalLib.BLL;
using System;
using System.Data;

namespace CitizenPortal.WebApp.Kiosk.OUAT
{
    public partial class AgroFormBAcknowledgement : System.Web.UI.Page
    {
        OUATBLL m_OUATBLL = new OUATBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet dt = m_OUATBLL.GetOUATAgroFormBAppDetails(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[1];
            DataTable dtTrackStatus = dt.Tables[2];
            DataTable dtEducationDetails = dt.Tables[3];
          
            DataTable dtAge = dt.Tables[5];

            if (dtApp.Rows.Count != 0)
            {
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

                lblApplicationNumber.Text= dtApp.Rows[0]["AgroFormA_AppID"].ToString();
                lblEntranceRollNo.Text= dtApp.Rows[0]["EntranceRollNo"].ToString();
                lblTransactionNumber.Text= dtApp.Rows[0]["TransactionNo"].ToString();
                lblTransactionDate.Text = Convert.ToDateTime(dtApp.Rows[0]["Transactiondate"].ToString()).ToString("dd/MM/yyyy");
                lblDisciple.Text = dtApp.Rows[0]["Discipline"].ToString();

                ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfileSignature.Src = dtApp.Rows[0]["Signature"].ToString();
            }

            //if (dtTransDetail.Rows.Count != 0)
            //{
            //    lblAppID.Text = dtTrackStatus.Rows[0]["AgroFormA_AppID"].ToString();
            //    lblTrnsID.InnerHtml = dtTransDetail.Rows[0]["TrnID"].ToString();
            //    lblTrnsDate.InnerHtml = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy");
            //    lblAppFee.Text = dtTransDetail.Rows[0]["govt"].ToString();
            //    lblServTax.Text = dtTransDetail.Rows[0]["misc_charges_01"].ToString();
            //    lblPortalFee.Text = dtTransDetail.Rows[0]["portal_serv_fee"].ToString();
            //    lblTotalFee.Text = dtTransDetail.Rows[0]["total"].ToString();
            //    AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"]).ToString("dd/MM/yyyy");
            //}

            if (dtEducationDetails.Rows.Count != 0)
            {
                HscRollNo.Text = dtEducationDetails.Rows[0]["enrollmentNo"].ToString();
                HscBoardName.Text= dtEducationDetails.Rows[0]["EduState"].ToString();
                HscGrade.Text= dtEducationDetails.Rows[0]["TotalMarks"].ToString();
                HscExam.Text= dtEducationDetails.Rows[0]["NameOfBoard"].ToString();
                HscMarksOgpa.Text= dtEducationDetails.Rows[0]["GradeType"].ToString();
                HscMarksScored.Text= dtEducationDetails.Rows[0]["MarkSecured"].ToString();
                HscPercentage.Text= dtEducationDetails.Rows[0]["Percentage"].ToString();
                HscPassYear.Text= dtEducationDetails.Rows[0]["PassingYear"].ToString();

                SscRollNo.Text = dtEducationDetails.Rows[1]["enrollmentNo"].ToString();
                SscBoardName.Text = dtEducationDetails.Rows[1]["EduState"].ToString();
                SscGrade.Text = dtEducationDetails.Rows[1]["TotalMarks"].ToString();
                SscExam.Text = dtEducationDetails.Rows[1]["NameOfBoard"].ToString();
                SscMarksOgpa.Text = dtEducationDetails.Rows[1]["GradeType"].ToString();
                SscMarksScored.Text = dtEducationDetails.Rows[1]["MarkSecured"].ToString();
                SscPercentage.Text = dtEducationDetails.Rows[1]["Percentage"].ToString();
                SscPassYear.Text = dtEducationDetails.Rows[1]["PassingYear"].ToString();

                AgroRollNo.Text = dtEducationDetails.Rows[2]["enrollmentNo"].ToString();
                AgroBoardName.Text = dtEducationDetails.Rows[2]["EduState"].ToString();
                AgroGrade.Text = dtEducationDetails.Rows[2]["TotalMarks"].ToString();
                AgroExam.Text = dtEducationDetails.Rows[2]["NameOfBoard"].ToString();
                AgroMarksOgpa.Text = "OGPA";
                AgroMarksScored.Text = dtEducationDetails.Rows[2]["MarkSecured"].ToString();
                AgroPercentage.Text = dtEducationDetails.Rows[2]["Percentage"].ToString();
                AgroPassYear.Text = dtEducationDetails.Rows[2]["PassingYear"].ToString();
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


            try
            {
                QRCode.GenerateQRCodeApplication(m_ServiceID, m_AppID);
            }
            catch { }
        }
    }
}