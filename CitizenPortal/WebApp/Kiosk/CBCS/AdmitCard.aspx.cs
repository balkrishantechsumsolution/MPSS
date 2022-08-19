using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.CBCS
{
    public partial class AdmitCard : AdminBasePage
    {
        string m_AppID, m_ServiceID, m_Semester;
        AdmitCardBLL t_AdmitCardBLL = new AdmitCardBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet dt = t_AdmitCardBLL.GetAdmitCard(m_ServiceID, m_AppID, m_Semester);
            DataTable StudentDT = dt.Tables[0];
            DataTable SubjectListDT = dt.Tables[1];
            DataTable TrnsDT = dt.Tables[2];

            if (StudentDT != null && StudentDT.Rows.Count > 0)
            {
                try
                {
                    ProfilePhoto.Src = StudentDT.Rows[0]["ApplicantImageStr"].ToString();
                    ProfileSignature.Src = StudentDT.Rows[0]["ImageSign"].ToString();

                    lblCanddidateName.Text = StudentDT.Rows[0]["Name"].ToString();
                    DateTime date = Convert.ToDateTime(StudentDT.Rows[0]["DOB"]);
                    DOBConverted.Text = date.ToString("dd-MM-yyyy");
                    DateTime AsOndate = Convert.ToDateTime(StudentDT.Rows[0]["CreatedOn"]);
                    
                    lblGender.Text = StudentDT.Rows[0]["Gender"].ToString();

                    lblAdmissionNo.Text = StudentDT.Rows[0]["AdmissionNo"].ToString();
                    lblDOA.Text = StudentDT.Rows[0]["AdmissionDate"].ToString();
                    lblCollegeName.Text = StudentDT.Rows[0]["CollegeName"].ToString();
                    FatherName.Text = StudentDT.Rows[0]["Father"].ToString();
                    lblBrnachName.Text = StudentDT.Rows[0]["Branch"].ToString();
                    lblRollNo.Text = StudentDT.Rows[0]["RollNo"].ToString();
                    lblRegistrationNo.Text = StudentDT.Rows[0]["RegNo"].ToString();
                    lblExamType.Text = StudentDT.Rows[0]["ExamType"].ToString();
                    lblVenue.Text = StudentDT.Rows[0]["ExamCenter"].ToString();
                    lblSemester.Text = StudentDT.Rows[0]["Semester"].ToString();

                    if (SubjectListDT != null && SubjectListDT.Rows.Count > 0)
                    {
                        //lblBrnachName.Text = SubjectListDT.Rows[0]["Course"].ToString();

                        GridViewSubject.DataSource = SubjectListDT;
                        GridViewSubject.DataBind();
                    }

                    if (TrnsDT != null && TrnsDT.Rows.Count > 0)
                    {
                        lblAppID.Text = TrnsDT.Rows[0]["AppID"].ToString();
                        AppDate.Text = TrnsDT.Rows[0]["TransDate"].ToString();
                        lblTrnsID.Text = TrnsDT.Rows[0]["TrnID"].ToString();
                        lblTrnsDate.Text = TrnsDT.Rows[0]["TransDate"].ToString();
                        lblAppFee.Text = TrnsDT.Rows[0]["Total"].ToString();
                        lblTotalFee.Text = TrnsDT.Rows[0]["AmtInText"].ToString();
                        tblTrans.Visible = true;
                    }
                    else { tblTrans.Visible = false; }

                }
                catch (Exception ex)
                {

                }

                try
                {

                    QRCode.GenerateQRCodeDetails(m_ServiceID, lblRollNo.Text);

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
                catch { }
            }
        }
    }
}