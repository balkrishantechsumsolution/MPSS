using Microsoft.Owin;
using SqlHelper;
using sun.net.www.content.image;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class MPSSReports : System.Web.UI.Page
    {
        static data sqlhelper = new data();


        private GridView gv;
        int i = 0;
        protected void Page_Init(object sender, EventArgs e)
        {
            i = 0;
            gv = new GridView();

            gv.ID = "gv";
            gv.AutoGenerateColumns = true;
            gv.Columns.Add(new TemplateField());
            gv.RowCreated += gv_RowCreated;
            gv.RowDataBound += gv_RowDataBound;
            gv.PageIndexChanging += gv_PageIndexChanged;
            gv.AllowPaging = true;
            gv.PageSize = 50;

            pnl.Controls.Add(gv);

            BindGrid();
        }

        public void BindGrid()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = ShowData();
                ViewState["CurrentTable"] = dt;
                ViewState["Paging"] = dt;
                gv.DataSource = dt;
                gv.DataBind();
                lblTotal.Text = "Total Rows: " + dt.Rows.Count;
            }

            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);



            }
        }
        protected void gv_PageIndexChanged(object sender, GridViewPageEventArgs e)
        {
            gv.PageIndex = e.NewPageIndex;
            gv.DataSource = ViewState["Paging"];
            gv.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginID"].ToString() == null)
            {
                return;
            }

        }

        void gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowType != DataControlRowType.Header && e.Row.RowType != DataControlRowType.Footer)
            {
                LinkButton lb1 = new LinkButton();
                lb1.ID = "Attachment";
                lb1.Text = "Attachment";
                lb1.Command += lb1_Command;

                lb1.ToolTip = "Attachment";
                lb1.CssClass = "tagBubbleAttachment";
                lb1.CommandName = "Attachment";
                lb1.CommandArgument = e.Row.RowIndex.ToString();
                e.Row.Cells[1].Controls.Add(lb1);




                LinkButton lb = new LinkButton();
                lb.ID = "View";
                lb.Text = "ViewForm";
                lb.Command += lb_Command;

                lb.ToolTip = "View";
                lb.CssClass = "tagBubbleView";
                lb.CommandName = "View";
                lb.CommandArgument = e.Row.RowIndex.ToString();

                e.Row.Cells[2].Controls.Add(lb);




            }

        }

        void gv_RowCreated(object sender, GridViewRowEventArgs e)
        {
            CheckBox chk = new CheckBox();
            chk.ID = "CheckBox";
            //chk.Click += chk_Click;
            e.Row.Cells[0].Controls.Add(chk);
        }

        void lb1_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Attachment")
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];

                var lb = (LinkButton)sender;
                var i = int.Parse(lb.CommandArgument);
                if (i >= 0)
                {
                    string ID = dt.Rows[i]["APPID"].ToString();
                    string AppID = "";
                    string newWin = "";
                    newWin = "window.open(\"Acknowledgement.aspx?AppID=" + ID + "&SvcID=1466\", \"_blank\", \"WIDTH=1080,HEIGHT=790,scrollbars=no, menubar=no,resizable=yes,directories=no,location=no\");";

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "pop", newWin, true);
                }
            }

        }

        void lb_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];

                var lb = (LinkButton)sender;
                var i = int.Parse(lb.CommandArgument);
                if (i >= 0)
                {
                    string ID = dt.Rows[i]["APPID"].ToString();
                    Response.Redirect("~/WebApp/Kiosk/MPSS/ViewScholarShipFrm.aspx?AppID=" + ID + "&SvcID=1466");
                }
            }
        }
        protected DataTable ShowData()
        {
            DataTable dt = new DataTable();

            SqlParameter[] parameter = {
                 new SqlParameter("@FinancialYr", ddlFinancialYr.SelectedValue),
                 new SqlParameter("@ReportType", ddlReportType.SelectedValue)
            };

            dt = sqlhelper.ExecuteDataTable("GetReportsdata", parameter);



            return dt;
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            BindGrid();


        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            ExportGridToExcel();
        }
        private void ExportGridToExcel()
        {
            DataTable dt = new DataTable();
            dt = ShowData();
            string attachment = "attachment; filename=DB.xls";
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/vnd.ms-excel";
            string tab = "";
            foreach (DataColumn dc in dt.Columns)
            {
                Response.Write(tab + dc.ColumnName);
                tab = "\t";
            }
            Response.Write("\n");
            int i;
            foreach (DataRow dr in dt.Rows)
            {
                tab = "";
                for (i = 0; i < dt.Columns.Count; i++)
                {
                    Response.Write(tab + dr[i].ToString());
                    tab = "\t";
                }
                Response.Write("\n");
            }
            Response.End();
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebApp/G2G/DeptProfile.aspx");
        }
    }



}