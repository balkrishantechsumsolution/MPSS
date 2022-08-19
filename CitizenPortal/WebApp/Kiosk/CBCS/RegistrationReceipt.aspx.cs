using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.BLL;
using System.Data;
using CitizenPortalLib;

namespace CitizenPortal.WebApp.Kiosk.CBCS
{
    public partial class RegistrationReceipt : CommonBasePage
    {
        CBCSAdmissionFormBLL t_CBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppId"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppId"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();
            DataSet dt = t_CBCSAdmissionFormBLL.GetStudentAdmissionData(m_ServiceID, m_AppID);
            DataTable StudentDT = dt.Tables[0];
            DataTable LastCourseDT = dt.Tables[1];
            DataTable SubjectListDT = dt.Tables[2];
            DataTable DOBDT = dt.Tables[3];
            DataTable dtTransDetail = dt.Tables[5];
            try
            {
                QRCode.GenerateQRCodeApplication(m_ServiceID, m_AppID);
            }
            catch { }

            if (StudentDT != null && StudentDT.Rows.Count > 0)
            {
                try
                {
                    ProfilePhoto.Src = StudentDT.Rows[0]["ApplicantImageStr"].ToString();
                    ProfileSignature.Src = StudentDT.Rows[0]["ImageSign"].ToString();
                    FullName.Text = StudentDT.Rows[0]["Name"].ToString();

                    lblRollNo.Text = StudentDT.Rows[0]["RollNo"].ToString();
                    lblCollegeCode.Text = StudentDT.Rows[0]["CollegeCode"].ToString();
                    lblCollegeName.Text = StudentDT.Rows[0]["CollegeName"].ToString();
                    DateTime date = Convert.ToDateTime(StudentDT.Rows[0]["DOB"]);
                    DOBConverted.Text = date.ToString("dd-MM-yyyy");
                    lblAppDate.Text = Convert.ToString(StudentDT.Rows[0]["CreatedOn"]);
                    Category.Text = StudentDT.Rows[0]["Category"].ToString();
                    gender.Text = StudentDT.Rows[0]["Gender"].ToString();

                    lblRegistrationNo.Text= Convert.ToString(StudentDT.Rows[0]["RegNo"]);
                    CurrentDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
                }
                catch (Exception ex)
                { }

                if (SubjectListDT != null && SubjectListDT.Rows.Count > 0)
                {
                    lblbranch.Text = SubjectListDT.Rows[0]["Course"].ToString();
                    
                }
            }
        }
    }
}