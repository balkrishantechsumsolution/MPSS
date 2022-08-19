using System;
using System.Data;
using System.IO;
using System.Web.UI;
using ClosedXML.Excel;
using CitizenPortalLib.BLL;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CitizenPortalLib;

namespace CitizenPortal.WebApp.G2G.DTE
{
    public partial class CollegePGSummary : AdminBasePage
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        private string LoginID = "";
        private int Department = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());

            if (!IsPostBack)
            {
                CollegeList();
            }

            BindGrid(LoginID, Department);

        }

        private void BindGrid(string LoginID, int Department)
        {
            string FromDate = "";
            string ToDate = "";
            string College = "";
            string Status = "";
            string Semester = "";
            string ExamYear = "";
                        
            if (ddlSemester.SelectedIndex != 0)
            {
                Semester = ddlSemester.SelectedValue;
            }
            else
            {Semester = ""; }

            if (ddlExamYear.SelectedIndex != 0)
            {
                ExamYear = ddlExamYear.SelectedValue;
            }
            else
            { ExamYear = ""; }

            if (ddlCollege.SelectedIndex != 0)
            {
                College = ddlCollege.SelectedValue;
            }
            else
            { College = ""; }

            if (txtFromDate.Text != "" && txtToDate.Text != "")
            {
                FromDate = Convert.ToDateTime(txtFromDate.Text).ToString("yyyy-MM-dd");
                ToDate = Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd");
            }

            DataTable dt = null;
            dt = m_G2GDashboardBLL.GetPaymentSummary(LoginID, Department, FromDate, ToDate, "1", Semester, ExamYear, College);

            grdView.DataSource = dt;
            grdView.DataBind();

            lblTotalRecords.InnerText = dt.Rows.Count.ToString();
        }
       
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
                HtmlAnchor t_ViewOutput = null;

                //TableCell Cell = GetCellByName(e.Row, "Document");
                //if (Cell != null)
                //{
                //    t_Anchor = new HtmlAnchor();
                //    t_Anchor.ID = "ViewDocument_" + e.Row.RowIndex;

                //    t_Anchor.InnerHtml = "View Output";

                //    t_Anchor.Attributes.Add("onclick", "ViewOutput()");

                //    t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                //    Cell.Controls.Add(t_Anchor);
                //    Cell.Attributes.Add("Title", "Click to see the ouput of the certificate which will be send/given to applicant");
                //    Cell.Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                //    t_Anchor = null;
                //}
                //int j = 0;
                //j = e.Row.Cells.Count;

                //t_ViewOutput = new HtmlAnchor();
                //t_ViewOutput.ID = "View_Output" + e.Row.RowIndex;

                //t_ViewOutput.InnerHtml = "View Output";

                //t_ViewOutput.Attributes.Add("onclick", "ViewOutput('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[1].Text + "')");

                //t_ViewOutput.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                //e.Row.Cells[j].Controls.Add(t_ViewOutput);
                //e.Row.Cells[j].Attributes.Add("Title", "Click to see the ouput of the certificate which will be send/given to applicant");
                //e.Row.Cells[j].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");

                //i++;

                t_Anchor = null;

                //-------------------------------//
                i = e.Row.Cells.Count - 1;

                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "TakeAction_" + e.Row.RowIndex;

                t_Anchor.InnerHtml = "View";

                t_Anchor.Attributes.Add("onclick", "TakeAction('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[1].Text + "', '" + e.Row.Cells[7].Text + "', '" + e.Row.Cells[8].Text + "', '" + e.Row.Cells[9].Text + "')");

                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[i].Controls.Add(t_Anchor);
                e.Row.Cells[i].Attributes.Add("Title", "View");
                e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");

                i++;

                t_Anchor = null;
            }

            //if (e.Row.RowType == DataControlRowType.DataRow
            //|| e.Row.RowType == DataControlRowType.Header
            //|| e.Row.RowType == DataControlRowType.Footer)
            //{

            //    e.Row.Cells[0].Attributes.Add("style", "display:none");
            //}
        }

        protected void grdView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //GetSelectedRec();
            grdView.PageIndex = e.NewPageIndex;
            grdView.DataBind();
        }

        protected void grdView_PreRender(object sender, EventArgs e)
        {
            if (grdView.Rows.Count > 0)
            {
                grdView.UseAccessibleHeader = true;
                grdView.HeaderRow.TableSection = TableRowSection.TableHeader;
                grdView.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }
        
        public void CollegeList()
        {
            try
            {
                CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.Get_CollegeList();
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlCollege.DataSource = dt;
                    ddlCollege.DataTextField = "CollegeName";
                    ddlCollege.DataValueField = "CollegeCode";
                    ddlCollege.DataBind();
                    ddlCollege.Items.Insert(0, new ListItem("Select", ""));
                    //if (!Session["LoginID"].ToString().Contains("Admin") && !Session["LoginID"].ToString().Contains("Univ") && !Session["LoginID"].ToString().Contains("SOEC"))
                    if (Session["menuRole"].ToString() == "College" || Session["menuRole"].ToString() == "Principal")
                    {
                        ddlCollege.SelectedIndex = ddlCollege.Items.IndexOf(ddlCollege.Items.FindByValue(Session["LoginID"].ToString().Substring(0, 3)));
                        ddlCollege.Enabled = false;
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}