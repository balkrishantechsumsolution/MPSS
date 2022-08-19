using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Examination
{
    public partial class Acknowledgement : CommonBasePage
    {
        ExamFormBLL t_ExamFormBLL = new ExamFormBLL();
        string m_AppID, m_ServiceID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            //if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet dt = t_ExamFormBLL.GetStudentExamDetail(m_ServiceID, m_AppID);
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
                    Regular.Visible = true;
                    GridViewSubject.DataSource = SubjectTB;
                    GridViewSubject.DataBind();

                    lblRegularCount.Text = SubjectTB.Rows.Count.ToString();
                    lblRegularSelected.Text = SubjectTB.Rows.Count.ToString();
                    

                }
                else
                {
                    Regular.Visible = false;
                    lblRegularSelected.Text = "0";
                    lblRegularCount.Text = "0";
                }

                if (SubjectBackTB != null && SubjectBackTB.Rows.Count > 0)
                {
                    Backlog.Visible = true;
                    grdBacklog.DataSource = SubjectBackTB;
                    grdBacklog.DataBind();
                    lblBacklogCount.Text = SubjectBackTB.Rows.Count.ToString();

                    DataView view = new DataView();
                    view.Table = SubjectBackTB;
                    view.RowFilter = "ToAppear = 'Y'";

                    lblBacklogSelected.Text = view.ToTable().Rows.Count.ToString();
                }
                else { Backlog.Visible = false; lblBacklogSelected.Text = "0"; lblBacklogCount.Text = "0"; }
                if (SubjectAggTB != null && SubjectAggTB.Rows.Count > 0)
                {
                    Aggregate.Visible = true;
                    grdAgg.DataSource = SubjectAggTB;
                    grdAgg.DataBind();

                    lblAggregateCount.Text = SubjectAggTB.Rows.Count.ToString();

                    DataView view = new DataView();
                    view.Table = SubjectAggTB;
                    view.RowFilter = "ToAppear = 'Y'";

                    lblAggregateSelected.Text = view.ToTable().Rows.Count.ToString();

                }
                else { Aggregate.Visible = false; lblAggregateSelected.Text = "0"; lblAggregateCount.Text = "0"; }
                if (PaymentTB.Rows.Count > 0)
                {
                    lblAppID.Text = PaymentTB.Rows[0]["AppID"].ToString();
                    AppDate.Text = PaymentTB.Rows[0]["CreatedOn"].ToString();
                    lblTrnsID.Text = PaymentTB.Rows[0]["TrnID"].ToString();
                    lblTrnsDate.Text = PaymentTB.Rows[0]["trans_date"].ToString();
                    lblTotalFee.Text = PaymentTB.Rows[0]["Amount"].ToString();
                    lblPayStatus.Text = PaymentTB.Rows[0]["PayStatus"].ToString();
                }

            }
        }
        
    }
}