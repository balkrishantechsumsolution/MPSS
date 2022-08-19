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

namespace CitizenPortal.WebApp.Result
{
    public partial class StudentResultData : CommonBasePage
    {
       
        StudentResultBLL t_ObjBLL = new StudentResultBLL();
        string m_RollNo, m_Semester, m_ExamYear, m_KeyField, m_ServiceID;

        protected void grdResult_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {               
                int j = e.Row.Cells.Count;
                e.Row.Cells[j - 2].Attributes.Add("style", "display:none");
                e.Row.Cells[0].Attributes.Add("style", "display:none");
            }

            int i = 0;
            HtmlAnchor t_Anchor = null;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                i = e.Row.Cells.Count - 1;

                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "TakeAction_" + e.Row.RowIndex;

                t_Anchor.InnerHtml = "View";

                //if (ddlStatus.SelectedValue == "P")
                {
                    t_Anchor.Attributes.Add("onclick", "TakeAction('', '', '" + e.Row.Cells[i].Text + "')");
                    e.Row.Cells[i - 1].Attributes.Add("style", "display:none");
                }

                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[i].Controls.Add(t_Anchor);
                e.Row.Cells[i].Attributes.Add("Title", "View");
                e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                e.Row.Cells[0].Attributes.Add("style", "display:none");
                i++;
            }
            t_Anchor = null;

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["RollNo"] == null) return;

            if (Request.QueryString["RollNo"].ToString() != null)
            {
                m_RollNo = Request.QueryString["RollNo"].ToString();
                //m_ExamYear = Request.QueryString["ExamYear"].ToString();
            }


            DataTable StudentDT = t_ObjBLL.GetStudentBasicInfo(m_RollNo);
            DataTable ResultDT = t_ObjBLL.GetStudentResultData(m_RollNo, "", "", "", "");

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
                
                if (ResultDT != null && ResultDT.Rows.Count > 0)
                {
                    PrintRegular.Visible = true;
                    grdResult.DataSource = ResultDT;
                    grdResult.DataBind();
                }
                
            }



        }

        
            

    }

}
