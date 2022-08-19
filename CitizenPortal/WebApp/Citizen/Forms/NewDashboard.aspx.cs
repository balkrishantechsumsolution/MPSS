using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Citizen.Forms
{
    public partial class NewDashboard : BasePage
    {

        CitizenDashboardBLL m_CitizenDashboardBLL = new CitizenDashboardBLL();
        string m_Uid = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string UID = "", ProfileID = "", KeyField = "";
            //int Department;

            UID = Request.QueryString["UID"].ToString();
            m_Uid = UID;
            ProfileID = Request.QueryString["UID"].ToString();
            if (Request.QueryString["KeyField"] != null && Request.QueryString["KeyField"] != "")
            {
                KeyField = Request.QueryString["KeyField"].ToString();
            }
            else
                KeyField = "";

            // Department = Convert.ToInt32(Session["Department"].ToString());
            DataTable dt = null;
            dt = m_CitizenDashboardBLL.GetCitizenDashboardGrid(UID, ProfileID, KeyField);

            gridview.DataSource = dt;
            gridview.DataBind();


            DataTable dt_Services = null;
            dt_Services = m_CitizenDashboardBLL.GetActiveServices(UID, ProfileID, KeyField);

            gridServices.DataSource = dt_Services;
            gridServices.DataBind();


            if (Session["HomePage"] == null)
            {
                Session["HomePage"] = "/WebApp/Citizen/Forms/Dashboard.aspx?UID=" + UID;
            }

            BindMenu(UID, ProfileID, KeyField);
            BindGrid();
        }

        private void BindMenu(string UID, string ProfileID, string KeyField)
        {
            DataTable dt = null;
            dt = m_CitizenDashboardBLL.GetCitizenMenu(UID, ProfileID, KeyField);

            if (dt.Rows.Count != 0)
            {
                /* Div Wil Show For Students To Edit Marks - Mohan Kumar */

                //pnlMenu.Controls.Add(new LiteralControl("<div id='EditSubject' style='min-height: 4.66em; z-index: -760;' class='SrvDiv' id='7007'>"));
                //pnlMenu.Controls.Add(new LiteralControl("<a href='/WebApp/Kiosk/BackExam/EditSubject.aspx?UID=" + ProfileID + "'>"));
                //pnlMenu.Controls.Add(new LiteralControl("<img src='/webapp/kiosk/CBCS/img/sambalpur-university-logo.png' alt='' align='left' style='height: 70px;' />"));
                //pnlMenu.Controls.Add(new LiteralControl("</a><a href='/WebApp/Kiosk/BackExam/EditSubject.aspx?UID=" + ProfileID + "&ProfileID=" + ProfileID + "'>EDIT SUBJECT - 2016 ADMISSIONS</a>"));
                //pnlMenu.Controls.Add(new LiteralControl("<br />"));
                //pnlMenu.Controls.Add(new LiteralControl("<span>EDIT SUBJECT FOR YEAR 2016 ADMISSIONS</span>"));
                //pnlMenu.Controls.Add(new LiteralControl("</div>"));

                pnlMenu.Controls.Clear();
               
                /*Edit Subject*/
                HFRollNo.Value = dt.Rows[0]["RollNo"].ToString();
                if (dt.Rows[0]["IsEditSubject"].ToString() != "0")
                {
                    pnlMenu.Controls.Add(new LiteralControl("<div style='' class='SrvDiv' id='divSubject'>"));
                    pnlMenu.Controls.Add(new LiteralControl("<a onclick=window.open('" + dt.Rows[0]["EditSubjectURL"].ToString() + "?UID=" + ProfileID + "&ProfileID=" + ProfileID + "&UserID=" + dt.Rows[0]["RollNo"].ToString() + "','popup','top=50,left=50,width=800,height=600'); return false; href='#'>"));
                    pnlMenu.Controls.Add(new LiteralControl("<img src='' alt='' align='left' />"));
                    pnlMenu.Controls.Add(new LiteralControl("<b>Edit Subject</b><br />"));
                    pnlMenu.Controls.Add(new LiteralControl("<span>Change GE & SEB-B subject</span>"));
                    pnlMenu.Controls.Add(new LiteralControl("</a>"));
                    pnlMenu.Controls.Add(new LiteralControl("</div>"));
                }
                /*Student History*/
                if (dt.Rows[0]["IsStudentHistory"].ToString() != "0")
                {
                    pnlMenu.Controls.Add(new LiteralControl("<div style='' class='SrvDiv' id='divHistory'>"));
                    pnlMenu.Controls.Add(new LiteralControl("<a onclick=window.open('" + dt.Rows[0]["StudentHistoryURL"].ToString() + "?AppID=" + dt.Rows[0]["AppID"].ToString() + "&SvcID=1449','popup','top=50,left=50,width=1100,height=600'); return false; href='#' > "));
                    pnlMenu.Controls.Add(new LiteralControl("<img src='' alt='' align='left' />"));
                    pnlMenu.Controls.Add(new LiteralControl("<b>Student History</b><br />"));
                    pnlMenu.Controls.Add(new LiteralControl("<span>View Details of the Student</span>"));
                    pnlMenu.Controls.Add(new LiteralControl("</a>"));
                    pnlMenu.Controls.Add(new LiteralControl("</div>"));
                }
                /*Semester Exam*/
                if (dt.Rows[0]["IsSemesterExam"].ToString() != "0")
                {
                    pnlMenu.Controls.Add(new LiteralControl("<div style='' class='SrvDiv' id='divExam'>"));
                    pnlMenu.Controls.Add(new LiteralControl("<a href=" + dt.Rows[0]["ExamFormURL"].ToString() + "&1468 target='_blank'>"));
                    pnlMenu.Controls.Add(new LiteralControl("<img src='' alt='' align='left' />"));
                    pnlMenu.Controls.Add(new LiteralControl("<b>Semester Exam Form</b><br />"));
                    pnlMenu.Controls.Add(new LiteralControl("<span>Click to Fill the Form</span>"));
                    pnlMenu.Controls.Add(new LiteralControl("</a>"));
                    pnlMenu.Controls.Add(new LiteralControl("</div>"));
                }

                if (dt.Rows[0]["IsAdmitCard"].ToString() != "0")
                {
                    pnlMenu.Controls.Add(new LiteralControl("<div style='' class='SrvDiv' id='divAdmit'>"));
                    pnlMenu.Controls.Add(new LiteralControl("<a href=" + dt.Rows[0]["AdmitCardURL"].ToString() + " target='_blank'>"));
                    pnlMenu.Controls.Add(new LiteralControl("<img src='' alt='' align='left' />"));
                    pnlMenu.Controls.Add(new LiteralControl("<b>Semester Exam Admit Card</b><br />"));
                    pnlMenu.Controls.Add(new LiteralControl("<span>Click to Download Admit Card</span>"));
                    pnlMenu.Controls.Add(new LiteralControl("</a>"));
                    pnlMenu.Controls.Add(new LiteralControl("</div>"));
                }

                /*Document Briefcase
                pnlMenu.Controls.Add(new LiteralControl("<div style='' class='SrvDiv' id='divDocument'>"));
                pnlMenu.Controls.Add(new LiteralControl("<a href='" + dt.Rows[0]["DocumentBriefCase"].ToString() + "?UID=" + ProfileID + "&ProfileID=" + ProfileID + "'>"));
                pnlMenu.Controls.Add(new LiteralControl("<img src='' alt='' align='left' />"));
                pnlMenu.Controls.Add(new LiteralControl("<b>Document Brief Case</b><br />"));
                pnlMenu.Controls.Add(new LiteralControl("<span>View all attached document</span>"));
                pnlMenu.Controls.Add(new LiteralControl("</a>"));
                pnlMenu.Controls.Add(new LiteralControl("</div>"));
                */

                /*Document Briefcase*/
                if (dt.Rows[0]["IsUploadDocument"].ToString() != "0")
                {
                    pnlMenu.Controls.Add(new LiteralControl("<div style='' class='SrvDiv' id='divUpload'>"));
                    pnlMenu.Controls.Add(new LiteralControl("<a onclick=window.open('" + dt.Rows[0]["UploadForm"].ToString() + "?UID=" + ProfileID + "&ProfileID=" + ProfileID + "&RollNo=" + dt.Rows[0]["RollNo"].ToString() + "','popup','top=50,left=50,width=800,height=600'); return false; href='#'>"));
                    pnlMenu.Controls.Add(new LiteralControl("<img src='' alt='' align='left' />"));
                    pnlMenu.Controls.Add(new LiteralControl("<b>Upload Files</b><br />"));
                    pnlMenu.Controls.Add(new LiteralControl("<span>Click to Upload Files</span>"));
                    pnlMenu.Controls.Add(new LiteralControl("</a>"));
                    pnlMenu.Controls.Add(new LiteralControl("</div>"));
                }

                if (dt.Rows[0]["ExtraLink"].ToString() != "0")
                {
                    pnlMenu.Controls.Add(new LiteralControl("<div style='' class='SrvDiv' id='divExtra'>"));
                    pnlMenu.Controls.Add(new LiteralControl("<a onclick=window.open('" + dt.Rows[0]["ExtraURL"].ToString() + "','popup','top=10,left=10,width=1300,height=600'); return false; href='#'>"));
                    pnlMenu.Controls.Add(new LiteralControl("<img src='' alt='' align='left' />"));
                    pnlMenu.Controls.Add(new LiteralControl("<b>"+ dt.Rows[0]["ExtraName"].ToString() + "</b><br />"));
                    pnlMenu.Controls.Add(new LiteralControl("<span>Click for Action </span>"));
                    pnlMenu.Controls.Add(new LiteralControl("</a>"));
                    pnlMenu.Controls.Add(new LiteralControl("</div>"));
                }
            }
        }

        //public void BindDummyGridrow()
        //{
        //    DataTable dt = new DataTable();
        //    //dt.Columns.Add("Select");
        //    dt.Columns.Add("Sl. No.");
        //    dt.Columns.Add("Application ID");
        //    dt.Columns.Add("Application Date");
        //    dt.Columns.Add("Application Name");
        //    dt.Columns.Add("Service Name");
        //    dt.Columns.Add("Status");
        //    dt.Columns.Add("Delivery Date");
        //    dt.Columns.Add("Payment");
        //    dt.Columns.Add("Document");
        //    dt.Columns.Add("Certificate");
        //    dt.Columns.Add("Remark");
        //    dt.Columns.Add("Action");
        //    gridview.DataSource = dt;
        //    gridview.DataBind();
        //}

        DataControlFieldCell GetCellByName(GridViewRow Row, String CellName)
        {
            foreach (DataControlFieldCell Cell in Row.Cells)
            {
                if (Cell.ContainingField.ToString() == CellName)
                    return Cell;
            }
            return null;
        }

        protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int i = 0;
                HtmlAnchor t_Anchor = null;
                string t_PaymentStatus = "U";
                string t_AckURL = "";

                TableCell Cell = GetCellByName(e.Row, "PaymentStatus");

                if (Cell != null && Cell.Text != "")
                {
                    if (Cell.Text.ToUpper() == "PAID")
                    {
                        t_PaymentStatus = "P";
                    }
                }

                Cell = GetCellByName(e.Row, "View");

                if (Cell != null && Cell.Text != "" && Cell.Text != "&nbsp;")
                {
                    t_AckURL = Cell.Text.Replace("&nbsp;", "");
                }

                i = e.Row.Cells.Count - 1;

                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "TakeAction_" + e.Row.RowIndex;

                t_Anchor.InnerHtml = "View";

                t_Anchor.Attributes.Add("onclick", "TakeAction('" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[2].Text + "', '" + t_PaymentStatus + "', '" + t_AckURL + "')");

                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[i].Controls.Add(t_Anchor);
                e.Row.Cells[i].Attributes.Add("Title", "View");
                e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");

                i++;

                t_Anchor = null;

                int j = 0;
                j = e.Row.Cells.Count - 2;
                HtmlAnchor t_Status = null;
                t_Status = new HtmlAnchor();
                if (e.Row.Cells[6].Text == "Sent Back")
                {

                    t_Status.ID = "ShowAction_" + e.Row.RowIndex;
                    t_Status.InnerHtml = e.Row.Cells[6].Text;
                    t_Status.Attributes.Add("onclick", "ShowAction('" + e.Row.Cells[0].Text + "','" + e.Row.Cells[2].Text + "')");

                    t_Status.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                    e.Row.Cells[j].Controls.Add(t_Status);
                    e.Row.Cells[j].Attributes.Add("Title", e.Row.Cells[6].Text);
                    e.Row.Cells[j].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");

                    j++;
                }

                t_Status = null;

            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {

                e.Row.Cells[0].Attributes.Add("style", "display:none");
                e.Row.Cells[1].Attributes.Add("style", "display:none");
            }
        }

        protected void grdView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //GetSelectedRec();
            gridview.PageIndex = e.NewPageIndex;
            gridview.DataBind();
        }

        protected void grdService_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int i = 0;
                HtmlAnchor t_Anchor = null;
                string t_PaymentStatus = "U";
                string t_AckURL = "";

                i = e.Row.Cells.Count - 1;

                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "TakeAction_" + e.Row.RowIndex;

                t_Anchor.InnerHtml = "Download";

                t_Anchor.Attributes.Add("onclick", "TakePrint('" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[1].Text + "', '" + e.Row.Cells[2].Text + "', '" + e.Row.Cells[3].Text + "')");

                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[i].Controls.Add(t_Anchor);
                e.Row.Cells[i].Attributes.Add("Title", "Downlolad");
                e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");

                i++;

                t_Anchor = null;

            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {

                e.Row.Cells[0].Attributes.Add("style", "display:none");
                e.Row.Cells[1].Attributes.Add("style", "display:none");
                e.Row.Cells[3].Attributes.Add("style", "display:none");
                e.Row.Cells[8].Attributes.Add("style", "display:none");
            }
        }
        public void BindGrid()
        {
            string LoginID = Session["LoginID"].ToString();
            MigrationSUBLL m_MigrationSUBLL = new MigrationSUBLL();
            DataTable dt = m_MigrationSUBLL.GetCBCAServices(LoginID);
            grdView1.DataSource = dt;

            grdView1.DataBind();

        }
        protected void grdView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                int i = 0;
                HtmlAnchor t_Anchor = null;

                t_Anchor = null;

                //-------------------------------//
                i = 4;

                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "TakeAction1_" + e.Row.RowIndex;

                t_Anchor.InnerHtml = "Apply";

                t_Anchor.Attributes.Add("onclick", "TakeAction1('', '" + m_Uid + "')");

                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[i].Controls.Add(t_Anchor);
                e.Row.Cells[i].Attributes.Add("Title", "Apply");
                e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                t_Anchor = null;



            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {
                //e.Row.Cells[8].Attributes.Add("style", "display:none");
                //e.Row.Cells[9].Attributes.Add("style", "display:none");

            }
        }

    }
}