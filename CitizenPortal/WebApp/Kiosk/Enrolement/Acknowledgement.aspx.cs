using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Enrolement
{
    public partial class Acknowledgement : CommonBasePage
    {
        EnrolementBLL t_EnrolementBLL = new EnrolementBLL();
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
            DataSet dt = t_EnrolementBLL.GetStudentEnrolementData(m_ServiceID, m_AppID);
            DataTable StudentDT = dt.Tables[0];
            DataTable LastCourseDT = dt.Tables[1];
            DataTable SubjectListDT = dt.Tables[2];
            DataTable DOBDT = dt.Tables[3];
            DataTable TrnsDT = dt.Tables[5];
            DataTable ActionDT = dt.Tables[6];

            if (StudentDT != null && StudentDT.Rows.Count > 0)
            {
                try
                {
                    ProfilePhoto.Src = StudentDT.Rows[0]["ApplicantImageStr"].ToString();
                    ProfileSignature.Src = StudentDT.Rows[0]["ImageSign"].ToString();

                    lblAadhaarNo.Text = StudentDT.Rows[0]["AadhaarNo"].ToString();
                    FullName.Text = StudentDT.Rows[0]["Name"].ToString();
                    DateTime date = Convert.ToDateTime(StudentDT.Rows[0]["DOB"]);
                    DOBConverted.Text = date.ToString("dd-MM-yyyy");
                    DateTime AsOndate = Convert.ToDateTime(StudentDT.Rows[0]["CreatedOn"]);
                    lblappdate.Text = AsOndate.ToString("dd.MM.yyyy");
                    AppDate.Text = AsOndate.ToString("dd.MM.yyyy");
                    //new fields added 15 jun

                    //lblbloodgroup.Text = dtApp.Rows[0]["BloodGroup"].ToString();

                    AgeYear.Text = DOBDT.Rows[0]["Years"].ToString() + " years";//Years.ToString();
                    AgeMonth.Text = DOBDT.Rows[0]["Months"].ToString() + " months";//Months.ToString();
                    AgeDay.Text = DOBDT.Rows[0]["Days"].ToString() + " days";//Days.ToString();

                    gender.Text = StudentDT.Rows[0]["Gender"].ToString();

                    EmailID.Text = StudentDT.Rows[0]["email"].ToString();
                    MobileNo.Text = StudentDT.Rows[0]["Mobile"].ToString();
                    FatherName.Text = StudentDT.Rows[0]["Father"].ToString();
                    MotherName.Text = StudentDT.Rows[0]["Mother"].ToString();

                    if (StudentDT.Rows[0]["Gaurdian"].ToString() != null || StudentDT.Rows[0]["Gaurdian"].ToString() != "")
                    {
                        trRelation.Visible = true;
                        lblGuardian.Text = StudentDT.Rows[0]["Gaurdian"].ToString();
                        lblRelation.Text = StudentDT.Rows[0]["Relation"].ToString();
                    }
                    else
                    {
                        trRelation.Visible = false;
                    }

                    mothertongue.Text = StudentDT.Rows[0]["MotherTongue"].ToString();
                    Category.Text = StudentDT.Rows[0]["Category"].ToString();

                    FullPermanentAddress.Text = StudentDT.Rows[0]["PermanentFullAddress"].ToString();
                    lblPState.Text = StudentDT.Rows[0]["PermanentState"].ToString();
                    lblPDistrict.Text = StudentDT.Rows[0]["PermanentDistrict"].ToString();//?
                    lblPBlock.Text = StudentDT.Rows[0]["PermanentBlock"].ToString();//?
                    lblPVillage.Text = StudentDT.Rows[0]["PermanentPanchayat"].ToString();//?
                    lblPPIN.Text = StudentDT.Rows[0]["PermanentPinCode"].ToString();

                    FullPresentAddress.Text = StudentDT.Rows[0]["CurrentFullAddress"].ToString();//?
                    lblState.Text = StudentDT.Rows[0]["CurrentState"].ToString();//?
                    lblDistrict.Text = StudentDT.Rows[0]["CurrentDistrict"].ToString();//?
                    lblBlock.Text = StudentDT.Rows[0]["CurrentBlock"].ToString();//?
                    lblVillage.Text = StudentDT.Rows[0]["CurrentPanchayat"].ToString();//?
                    lblDistrict.Text = StudentDT.Rows[0]["CurrentDistrict"].ToString();
                    lblPIN.Text = StudentDT.Rows[0]["CurrentPinCode"].ToString();//?

                    lblAdmissionNo.Text = StudentDT.Rows[0]["AdmissionNo"].ToString();
                    lblDOA.Text = StudentDT.Rows[0]["AdmissionDate"].ToString();
                    lblCollegeCode.Text = StudentDT.Rows[0]["CollegeCode"].ToString();
                    lblCollegeName.Text = StudentDT.Rows[0]["CollegeName"].ToString();
                    lblRollNo.Text = StudentDT.Rows[0]["RollNo"].ToString();
                    lblRegd.Text = StudentDT.Rows[0]["RegNo"].ToString();
                }
                catch (Exception ex)
                {

                }

                if (LastCourseDT != null && LastCourseDT.Rows.Count > 0)
                {
                    GridViewCourse.DataSource = LastCourseDT;
                    GridViewCourse.DataBind();
                }

                if (SubjectListDT != null && SubjectListDT.Rows.Count > 0)
                {
                    tblSubjectList.Visible = true;
                    lblBrnachName.Text = SubjectListDT.Rows[0]["Course"].ToString();

                    GridViewSubject.DataSource = SubjectListDT;
                    GridViewSubject.DataBind();
                }
                else
                {
                    tblSubjectList.Visible = false;
                }

                //display document list
                DataTable dtDocument = dt.Tables[4];
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

                if (TrnsDT != null && TrnsDT.Rows.Count > 0)
                {
                    lblAppID.Text = TrnsDT.Rows[0]["AppID"].ToString();
                    AppDate.Text = TrnsDT.Rows[0]["TransDate"].ToString();
                    lblTrnsID.Text = TrnsDT.Rows[0]["TrnID"].ToString();
                    lblTrnsDate.Text = TrnsDT.Rows[0]["TransDate"].ToString();
                    lblAppFee.Text = TrnsDT.Rows[0]["Total"].ToString();
                    lblTotalFee.Text = TrnsDT.Rows[0]["AmtInText"].ToString();
                }

                if (ActionDT != null && ActionDT.Rows.Count > 0)
                {
                    //grdHistory.DataSource = ActionDT;
                    //grdHistory.DataBind();
                }
            }

            try
            {

                QRCode.GenerateQRCodeApplication(m_ServiceID, m_AppID);

                string strPreviousPage = "";
                if (Request.UrlReferrer != null)
                {
                    strPreviousPage = Request.UrlReferrer.Segments[Request.UrlReferrer.Segments.Length - 1];
                }
                if (strPreviousPage == "")
                {
                    Response.Redirect("~/customError.aspx");
                }

            }
            catch { }
        }

        public void AdmissionSubjectList(DataTable dt)
        {
            try
            {
                //Building an HTML string.
                StringBuilder html = new StringBuilder();

                //Table start.
                html.Append("<table class='table-bordered' cellspacing='0' style='width:100%; border:1;'>");

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
                        html.Append("<td style='padding:5px;border:1;aligen:center;'>");
                        html.Append(row[column.ColumnName]);
                        html.Append("</td>");
                    }
                    html.Append("</tr>");
                }

                //Table end.
                html.Append("</table>");

                //Append the HTML string to Placeholder.
                //PLHSubjectList.Controls.Add(new Literal { Text = html.ToString() });
            }
            catch (Exception ex)
            {

            }
        }
    }
}