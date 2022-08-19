using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CitizenPortalLib;
using System.Web.Services;

namespace CitizenPortal.WebApp.G2G.SU
{
    public partial class AdminDashboard : AdminBasePage
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            string LoginID = "";
            int Department;

            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());

            if (!IsPostBack)
            {
                BindDistrict("21");
                BindService("132");               

                CheckProfile(LoginID, Department);
            }
            BindChart(LoginID);
            BindGrid(LoginID, Department);

        }

        private void BindGrid(string LoginID, int Department)
        {
            string FromDate = "";
            string ToDate = "";
            string Service = "";
            string District = "";
            string Status = "";

            if (ddlServices.SelectedIndex != 0)
            {
                string t_Service = ddlServices.SelectedValue;
                string[] t_temp = t_Service.Split('_');
                Service = t_temp[0];
            }

            if (ddlDistrict.SelectedIndex != 0)
            {
                District = ddlDistrict.SelectedValue;
            }

            if (ddlStatus.SelectedIndex != 0)
            {
                Status = ddlStatus.SelectedValue;
            }
            if (txtFromDate.Text != "" && txtToDate.Text != "")
            {
                FromDate = Convert.ToDateTime(txtFromDate.Text).ToString("yyyy-MM-dd");
                ToDate = Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd");
            }

            DataTable dt = null;
            dt = m_G2GDashboardBLL.GetSUG2GDashboard(LoginID, Department, Service, District, Status, FromDate, ToDate, "", "");

            grdView.DataSource = dt;
            grdView.DataBind();

            lblTotalRecords.InnerText = dt.Rows.Count.ToString();
        }

        private void BindChart(string LoginID)
        {
            int AdmissionYear = 0;
            string CollegeCode = "";
            string BranchCode = "";
            string HonsCode = "";
            int ReportType = 0;

            DataTable dt = null;
            dt = m_G2GDashboardBLL.GetChartData(LoginID, AdmissionYear, CollegeCode, BranchCode,HonsCode, ReportType);

            
        }

        private void BindService(string departmentcode)
        {
            ServicesBLL t_ServicesBLL = new ServicesBLL();
            System.Data.DataTable dtServices = t_ServicesBLL.GetDeptServices(departmentcode);

            ddlServices.DataTextField = "ServiceName";
            ddlServices.DataValueField = "ServiceCode";
            ddlServices.DataSource = dtServices;
            ddlServices.DataBind();

            ddlServices.Items.Insert(0, new ListItem("-Select Services-", "0"));
        }

        private void BindDistrict(string districtcode)
        {
            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL();
            System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetDistrictFromState(districtcode);

            ddlDistrict.DataTextField = "DistrictName";
            ddlDistrict.DataValueField = "DistrictCode";
            ddlDistrict.DataSource = dtDistrict;
            ddlDistrict.DataBind();

            ddlDistrict.Items.Insert(0, new ListItem("-Select-", "0"));
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
                /**/
                HtmlAnchor t_ViewOutput = null;

                TableCell Cell = GetCellByName(e.Row, "Document");
                if (Cell != null)
                {
                    t_Anchor = new HtmlAnchor();
                    t_Anchor.ID = "ViewDocument_" + e.Row.RowIndex;

                    t_Anchor.InnerHtml = "View Output";

                    t_Anchor.Attributes.Add("onclick", "ViewOutput()");

                    t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                    Cell.Controls.Add(t_Anchor);
                    Cell.Attributes.Add("Title", "Click to see the ouput of the certificate which will be send/given to applicant");
                    Cell.Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                    t_Anchor = null;
                }
                int j = 0;
                j = e.Row.Cells.Count - 2;

                t_ViewOutput = new HtmlAnchor();
                t_ViewOutput.ID = "View_Output" + e.Row.RowIndex;

                t_ViewOutput.InnerHtml = "View Output";

                t_ViewOutput.Attributes.Add("onclick", "ViewOutput('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[1].Text + "')");

                t_ViewOutput.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[j].Controls.Add(t_ViewOutput);
                e.Row.Cells[j].Attributes.Add("Title", "Click to see the ouput of the certificate which will be send/given to applicant");
                e.Row.Cells[j].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");

                i++;
                /**/
                t_Anchor = null;

                //-------------------------------//
                i = e.Row.Cells.Count - 1;

                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "TakeAction_" + e.Row.RowIndex;

                t_Anchor.InnerHtml = "View";

                t_Anchor.Attributes.Add("onclick", "TakeAction('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[1].Text + "')");

                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[i].Controls.Add(t_Anchor);
                e.Row.Cells[i].Attributes.Add("Title", "View");
                e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");

                i++;

                t_Anchor = null;
            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {

                e.Row.Cells[0].Attributes.Add("style", "display:none");
            }
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

        public void CheckProfile(string LoginID, int Department)
        {
            DataTable DT = new DataTable();
            WorkFlowBLL m_workFlowBLL = new WorkFlowBLL();
            DT = m_workFlowBLL.CheckProfile(LoginID, Department);

            if (DT.Rows.Count != 0)
            {
                if (DT.Rows[0]["IsProfileverified"].ToString() != "1")
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message",
                        "alert('"+ DT.Rows[0]["Alertmag"].ToString() + "');window.location.href = '" + DT.Rows[0]["ReturnURL"].ToString() + "';", true);
                    //Response.Redirect(DT.Rows[0]["ReturnURL"].ToString());
                }
            }
        }

        public class SeriesItem
        {
            public string name { get; set; }
            public int[] data { get; set; }
        }

        public class xAxis
        {
            public string[] categories { get; set; }
            public bool crosshair { get; set; }
        }
        public class BarChartData
        {
            public SeriesItem[] series { get; set; }
            public xAxis xAxis { get; set; }

            public BarChartData()
            {
            }

            public BarChartData(SeriesItem[] Series, xAxis XAxis)
            {
                series = Series;
                xAxis = XAxis;
            }
        }
        [WebMethod]
        public static BarChartData YearWiseStudent()
        {
            string LoginID = "";// Session["LoginID"].ToString();
            G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
            int AdmissionYear = 0;
            string CollegeCode = "";
            string BranchCode = "";
            string HonsCode = "";
            int ReportType = 0;

            DataTable DTResult = null;
            DTResult = m_G2GDashboardBLL.GetChartData(LoginID, AdmissionYear, CollegeCode, BranchCode,HonsCode, ReportType);
            
            List<SeriesItem> series = new List<SeriesItem>();
            List<int> arr = null;

            //series.Add(new SeriesItem() { name = "Total Count", data = new int[] { 2015, 2018 } });
            //series.Add(new SeriesItem() { name = "Pendency", data = new int[] { 40, 68 } });
            for (int i = 0; i < DTResult.Columns.Count; i++)
            {
                //if (DTResult.Columns[i].ColumnName == "AH" || DTResult.Columns[i].ColumnName == "AP"
                //            || DTResult.Columns[i].ColumnName == "CH" || DTResult.Columns[i].ColumnName == "CP" || DTResult.Columns[i].ColumnName == "SH" || DTResult.Columns[i].ColumnName == "SP")
                {
                    SeriesItem seriesItem = new SeriesItem();
                    seriesItem.name = DTResult.Columns[i].ColumnName;
                    arr = new List<int>();
                    for (int j = 0; j < DTResult.Rows.Count; j++)
                    {
                        arr.Add(Convert.ToInt32(DTResult.Rows[j][DTResult.Columns[i].ColumnName]));
                    }
                    seriesItem.data = arr.ToArray();
                    series.Add(seriesItem);
                }
            }

            //xAxis x = new xAxis() { crosshair = true, categories = new string[] { "2018", "2019" } };
            xAxis x = new xAxis();
            x.crosshair = true;
            string[] GYear = new string[4];

            for (int i = 0; i < DTResult.Rows.Count; i++)
            {
                GYear[i] = DTResult.Rows[i][0].ToString();
            }
            x.categories = GYear;

            BarChartData chartData = new BarChartData(series.ToArray(), x);
            return chartData;
        }

        [WebMethod]
        public static BarChartData BranchWiseHonours()
        {
            string LoginID = "";// Session["LoginID"].ToString();
            G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
            int AdmissionYear = 0;
            string CollegeCode = "";
            string BranchCode = "";
            string HonsCode = "";
            int ReportType = 1;

            DataTable DTResult = null;
            DTResult = m_G2GDashboardBLL.GetChartData(LoginID, AdmissionYear, CollegeCode, BranchCode, HonsCode, ReportType);

            List<SeriesItem> series = new List<SeriesItem>();
            List<int> arr = null;

            //series.Add(new SeriesItem() { name = "Total Count", data = new int[] { 2015, 2018 } });
            //series.Add(new SeriesItem() { name = "Pendency", data = new int[] { 40, 68 } });
            for (int i = 0; i < DTResult.Columns.Count; i++)
            {
                if (DTResult.Columns[i].ColumnName == "AH" || DTResult.Columns[i].ColumnName == "AP"
                            || DTResult.Columns[i].ColumnName == "CH" || DTResult.Columns[i].ColumnName == "CP" || DTResult.Columns[i].ColumnName == "SH" || DTResult.Columns[i].ColumnName == "SP")
                {
                    SeriesItem seriesItem = new SeriesItem();
                    seriesItem.name = DTResult.Columns[i].ColumnName;
                    arr = new List<int>();
                    for (int j = 0; j < DTResult.Rows.Count; j++)
                    {
                        arr.Add(Convert.ToInt32(DTResult.Rows[j][DTResult.Columns[i].ColumnName]));
                    }
                    seriesItem.data = arr.ToArray();
                    series.Add(seriesItem);
                }
            }

            //xAxis x = new xAxis() { crosshair = true, categories = new string[] { "2018", "2019" } };
            xAxis x = new xAxis();
            x.crosshair = true;
            string[] GYear = new string[4];

            for (int i = 0; i < DTResult.Rows.Count; i++)
            {
                GYear[i] = DTResult.Rows[i]["AdmissionYear"].ToString();
            }
            x.categories = GYear;

            BarChartData chartData = new BarChartData(series.ToArray(), x);
            return chartData;
        }
    }
}