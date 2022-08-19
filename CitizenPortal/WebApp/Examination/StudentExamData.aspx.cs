using CitizenPortalLib;
using CitizenPortalLib.BLL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Examination
{
    public partial class StudentExamData : CommonBasePage
    {
        //CBCSAdmissionFormBLL t_CBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
        ExamFormBLL t_ExamFormBLL = new ExamFormBLL();
        string m_RollNo, m_Semester, m_ExamYear, m_KeyField, m_ServiceID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["RollNo"] == null) return;

            if (Request.QueryString["RollNo"].ToString() != null)
            {
                m_RollNo = Request.QueryString["RollNo"].ToString();
                m_ExamYear = Request.QueryString["ExamYear"].ToString();
                m_Semester = Request.QueryString["Semester"].ToString();
            }


            DataSet dt = t_ExamFormBLL.GetStudentSemesterExamDetail(m_RollNo, m_ExamYear, m_KeyField, m_Semester);
            DataTable StudentDT = dt.Tables[0];
            DataTable SubjectTB = dt.Tables[1];
            DataTable SubjectBackTB = dt.Tables[2];
            DataTable SubjectAggTB = dt.Tables[3];
            DataTable PaymentTB = dt.Tables[4];


            if (!IsPostBack && StudentDT != null && StudentDT.Rows.Count > 0)
            {
                //try
                //{
                ProfilePhoto.Src = StudentDT.Rows[0]["Photograph"].ToString();
                ProfileSignature.Src = StudentDT.Rows[0]["Signature"].ToString();

                FullName.Text = StudentDT.Rows[0]["Name"].ToString();

                lblBrnachName.Text = StudentDT.Rows[0]["CourseName"].ToString();
                lblProgram.Text = StudentDT.Rows[0]["ProgramName"].ToString();

                gender.Text = StudentDT.Rows[0]["Gender"].ToString();

                EmailID.Text = StudentDT.Rows[0]["email"].ToString();
                MobileNo.Text = StudentDT.Rows[0]["Mobile"].ToString();
                Category.Text = StudentDT.Rows[0]["Category"].ToString();
                lblCollege.Text = StudentDT.Rows[0]["CollegeName"].ToString();

                lblRegNo.Text = StudentDT.Rows[0]["RegNo"].ToString();
                lblRoll.Text = StudentDT.Rows[0]["RollNo"].ToString();
                lblRegNo.Text = StudentDT.Rows[0]["RegNo"].ToString();


                lblDOB.Text = StudentDT.Rows[0]["DOB"].ToString();
                lblAdmissionYear.Text = StudentDT.Rows[0]["AdmissionYear"].ToString();
                lblSession.Text = StudentDT.Rows[0]["Session"].ToString();
                lblExamYear.Text = StudentDT.Rows[0]["ExamYear"].ToString();
                lblCurrentSemester.Text = StudentDT.Rows[0]["CurrentSemester"].ToString();




                if (SubjectTB != null && SubjectTB.Rows.Count > 0)
                {
                    PrintRegular.Visible = true;
                    GridViewSubject.DataSource = SubjectTB;
                    GridViewSubject.DataBind();
                }
                else
                {
                    PrintRegular.Visible = false;
                }

                if (SubjectBackTB != null && SubjectBackTB.Rows.Count > 0)
                {
                    PrintBacklog.Visible = true;
                    grdBacklog.DataSource = SubjectBackTB;
                    grdBacklog.DataBind();

                    DataView view = new DataView();
                    view.Table = SubjectBackTB;
                    view.RowFilter = "ToAppear = 'Y'";

                }
                else { PrintBacklog.Visible = false; }
                if (SubjectAggTB != null && SubjectAggTB.Rows.Count > 0)
                {
                    PrintAggregate.Visible = true;
                    grdAgg.DataSource = SubjectAggTB;
                    grdAgg.DataBind();

                    DataView view = new DataView();
                    view.Table = SubjectAggTB;
                    view.RowFilter = "ToAppear = 'Y'";


                }
                else { PrintAggregate.Visible = false; }



            }



        }

    }

}
