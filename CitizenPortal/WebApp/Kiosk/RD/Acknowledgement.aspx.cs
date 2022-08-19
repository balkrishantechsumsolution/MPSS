using CitizenPortalLib.BLL;
using System;
using System.Data;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.RD
{
    public partial class Acknowledgement : System.Web.UI.Page
    {
        SeniorCitizenBLL m_SeniorCitizenBLL = new SeniorCitizenBLL();
        string m_AppID, m_ServiceID;

        protected void btnHome_Click(object sender, EventArgs e)
        {
            try
            {
                string url = Session["HomePage"].ToString();
                Response.Redirect(url);
            }
            catch (Exception ex)
            {

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();
            if (Request.QueryString["Dept"] == "Y")
            {
                btnHome.Visible = false;
                BtnViewIdCard.Visible = false;
            }
            else
            {
                btnHome.Visible = true;
                BtnViewIdCard.Visible = false;
            }
            //btnHome.PostBackUrl = Session["HomePage"].ToString();

            DataSet dt = m_SeniorCitizenBLL.GetSeniorCitizenIDCardData(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[1];
            DataTable dtTrackStatus = dt.Tables[2];
            DataTable dtSign = dt.Tables[3];
            DataTable dtRelative = dt.Tables[4];
            DataTable dtServant = dt.Tables[5];
            DataTable dtAge = dt.Tables[6];
            DataTable dtActionHistory = dt.Tables[8];

            if (dtApp.Rows.Count != 0)
            {
                ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfileSignature.Src = dtSign.Rows[0]["ImageSign"].ToString();

                lblAadhaarNo.Text = dtApp.Rows[0]["AadhaarNumber"].ToString();
                FullName.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                DateTime date = Convert.ToDateTime(dtApp.Rows[0]["DOB"]);
                DOBConverted.Text = date.ToString("dd-MM-yyyy");
                DateTime AsOndate = Convert.ToDateTime(dtApp.Rows[0]["CreatedOn"]);
                lblasondate.Text = AsOndate.ToString("dd.MM.yyyy");
                //new fields added 15 jun
                lblpsdistrict.Text = dtApp.Rows[0]["district"].ToString();
                PoliceStationName.Text = dtApp.Rows[0]["PoliceStation"].ToString();
                SpouceName.Text = dtApp.Rows[0]["SpouseName"].ToString();
                RelativeStatus.Text = dtApp.Rows[0]["RelativeSameCity"].ToString();
                MedicalHistoryStatus.Text = dtApp.Rows[0]["MedicalHistory"].ToString();
                if (MedicalHistoryStatus.Text == "Yes")
                {
                    MedicalPanel.Visible = true;
                }
                else
                {
                    MedicalPanel.Visible = false;
                }

                lblbloodgroup.Text = dtApp.Rows[0]["BloodGroup"].ToString();
                lblArthritis.Text = dtApp.Rows[0]["Arthritis"].ToString();
                lblHeart.Text = dtApp.Rows[0]["HeartDisease"].ToString();
                lblCancer.Text = dtApp.Rows[0]["Cancer"].ToString();
                lblRespiratory.Text = dtApp.Rows[0]["RespiratoryDiseases"].ToString();
                lblAlzheimer.Text = dtApp.Rows[0]["AlzheimerDiseases"].ToString();
                lblOsteoporosis.Text = dtApp.Rows[0]["Osteoporosis"].ToString();
                lblDiabetes.Text = dtApp.Rows[0]["Diabetes"].ToString();
                lblInfluenza.Text = dtApp.Rows[0]["InfluenzaPheumonia"].ToString();
                lblOthers.Text = dtApp.Rows[0]["Others"].ToString();
                lblFDrName.Text = dtApp.Rows[0]["DoctorName"].ToString();
                lblDrMobile.Text = dtApp.Rows[0]["DoctorMobileNo"].ToString();
                lblDrAddress.Text = dtApp.Rows[0]["DoctorAddress"].ToString();
                lblDrPinCode.Text = dtApp.Rows[0]["DoctorPinCode"].ToString();

                AgeYear.Text = dtAge.Rows[0]["Years"].ToString() + " years";//Years.ToString();
                AgeMonth.Text = dtAge.Rows[0]["Months"].ToString() + " months";//Months.ToString();
                AgeDay.Text = dtAge.Rows[0]["Days"].ToString() + " days";//Days.ToString();

                gender.Text = dtApp.Rows[0]["Gender"].ToString();
                Nationality.Text = dtApp.Rows[0]["Nationality"].ToString();
                EmailID.Text = dtApp.Rows[0]["email_id"].ToString();
                MobileNo.Text = dtApp.Rows[0]["MobileNo"].ToString();

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
                CddlDistrict.Text = dtApp.Rows[0]["CurrentDistrict"].ToString();
                //bind relative repater control
                if (dtRelative.Rows.Count > 0)
                {
                    RptRelative.DataSource = dtRelative;
                    RptRelative.DataBind();
                }
                //bind servant repeater control
                if (dtServant.Rows.Count > 0)
                {
                    RptServant.DataSource = dtServant;
                    RptServant.DataBind();
                }

                //if (dtApp.Rows[0]["ReadOdia"].ToString() == "Yes")
                //{
                //    Section1_AbililtyRead.Text = "Yes";
                //}
                //else
                //{
                //    Section1_AbililtyRead.Text = "No";//"/0x52";
                //}


                //if (dtApp.Rows[0]["WriteOdia"].ToString() == "Yes")
                //{
                //    Section1_AbilityWrite.Text = "Yes";
                //}
                //else
                //{
                //    Section1_AbilityWrite.Text = "No";
                //}


                //if (dtApp.Rows[0]["SpeakOdia"].ToString() == "Yes")
                //{
                //    Section1_AbilitySpeak.Text = "Yes";
                //}
                //else
                //{
                //    Section1_AbilitySpeak.Text = "No";
                //}


                DataTable dtDocument = dt.Tables[7];
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
                    HdfAppId.Value = dtTransDetail.Rows[0]["AppID"].ToString();
                    //AppName.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                    lblTrnsID.InnerHtml = dtTransDetail.Rows[0]["TrnID"].ToString();
                    lblTrnsDate.InnerHtml = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy");
                    lblAppFee.Text = dtTransDetail.Rows[0]["govt"].ToString();
                    lblServTax.Text = dtTransDetail.Rows[0]["misc_charges_01"].ToString();
                    lblPortalFee.Text = dtTransDetail.Rows[0]["portal_serv_fee"].ToString();
                    lblTotalFee.Text = dtTransDetail.Rows[0]["total"].ToString();
                    AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"]).ToString("dd/MM/yyyy");
                }


                try
                {
                    QRCode.GenerateQRCodeApplication(m_ServiceID, m_AppID);
                }
                catch { }
                //bind Action History data
                if (dtActionHistory != null && dtActionHistory.Rows.Count > 0)
                {
                    try { ActionHistory(dtActionHistory); }
                    catch { }
                }
            }
        }

        public void ActionHistory(DataTable dt)
        {
            try
            {
                //Building an HTML string.
                StringBuilder html = new StringBuilder();

                //Table start.
                html.Append("<table class='table-bordered' cellspacing='0' style='width:100%; border:0;'>");

                //Building the Header row.
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<th style='padding:5px;'>");
                    html.Append(column.ColumnName);
                    html.Append("</th>");
                }
                html.Append("</tr>");

                //Building the Data rows.
                foreach (DataRow row in dt.Rows)
                {
                    html.Append("<tr>");
                    foreach (DataColumn column in dt.Columns)
                    {
                        html.Append("<td style='padding:5px;'>");
                        html.Append(row[column.ColumnName]);
                        html.Append("</td>");
                    }
                    html.Append("</tr>");
                }

                //Table end.
                html.Append("</table>");

                //Append the HTML string to Placeholder.
                PLHActionHistory.Controls.Add(new Literal { Text = html.ToString() });
            }
            catch (Exception ex)
            {

            }
        }


    }
}