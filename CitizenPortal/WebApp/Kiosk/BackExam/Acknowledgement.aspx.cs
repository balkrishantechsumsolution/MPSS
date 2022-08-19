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

namespace CitizenPortal.WebApp.Kiosk.BackExam
{
    public partial class Acknowledgement : CommonBasePage
    {
        BackExamBLL m_BackExamBLL = new BackExamBLL();
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
            DataSet dt = m_BackExamBLL.GetStudentExamData(m_ServiceID, m_AppID);
            DataTable StudentDT = dt.Tables[0];
            DataTable PaperDT = dt.Tables[1];
            DataTable TrnsDT = dt.Tables[2];

            if (StudentDT != null && StudentDT.Rows.Count > 0)
            {
                try
                {
                    ProfilePhoto.Src = StudentDT.Rows[0]["ApplicantImageStr"].ToString();
                    ProfileSignature.Src = StudentDT.Rows[0]["ImageSign"].ToString();
                    LblSem.Text= StudentDT.Rows[0]["Exam_Freq"].ToString();
                    lblappno.Text= StudentDT.Rows[0]["AppID"].ToString();
                    lblAadhaarNo.Text = StudentDT.Rows[0]["AadhaarNo"].ToString();
                    FullName.Text = StudentDT.Rows[0]["StudentName"].ToString();
                    DateTime date = Convert.ToDateTime(StudentDT.Rows[0]["DOB"]);
                    DOBConverted.Text = date.ToString("dd-MM-yyyy");
                    DateTime AsOndate = Convert.ToDateTime(StudentDT.Rows[0]["CreatedOn"]);
                    lblappdate.Text = AsOndate.ToString("dd.MM.yyyy");
                    AppDate.Text = AsOndate.ToString("dd.MM.yyyy");
                    

                    gender.Text = StudentDT.Rows[0]["Gender"].ToString();

                    EmailID.Text = StudentDT.Rows[0]["EmailID"].ToString();
                    MobileNo.Text = StudentDT.Rows[0]["MobileNo"].ToString();
                    FatherName.Text = StudentDT.Rows[0]["FatherName"].ToString();
                    MotherName.Text = StudentDT.Rows[0]["MotherName"].ToString();

                    mothertongue.Text = StudentDT.Rows[0]["Tongue"].ToString();
                    Category.Text = StudentDT.Rows[0]["Category"].ToString();

                    //lblDOA.Text = StudentDT.Rows[0]["AdmissionDate"].ToString();
                    lblCollegeCode.Text = StudentDT.Rows[0]["CollegeCode"].ToString();
                    lblCollegeName.Text = StudentDT.Rows[0]["CollegeName"].ToString();
                    lblRollNo.Text = StudentDT.Rows[0]["RollNo"].ToString();
                }
                catch (Exception ex)
                {

                }
                if (TrnsDT != null && TrnsDT.Rows.Count > 0)
                {
                    lblAppID.Text = TrnsDT.Rows[0]["AppID"].ToString();
                    AppDate.Text = TrnsDT.Rows[0]["TransDate"].ToString();
                    lblTrnsID.Text = TrnsDT.Rows[0]["TrnID"].ToString();
                    lblTrnsDate.Text = TrnsDT.Rows[0]["TransDate"].ToString();
                    lblAppFee.Text = TrnsDT.Rows[0]["Total"].ToString();
                    lblTotalFee.Text = TrnsDT.Rows[0]["AmtInText"].ToString();
                }

                if (PaperDT != null && PaperDT.Rows.Count > 0) {
                    grdHistory.DataSource = PaperDT;
                    grdHistory.DataBind();
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
    }
}