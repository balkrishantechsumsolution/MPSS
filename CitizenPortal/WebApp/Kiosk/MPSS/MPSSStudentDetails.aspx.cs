using CitizenPortalLib.DataStructs;
using iTextSharp.text.pdf;
using Newtonsoft.Json;
using SqlHelper;
using sun.security.jca;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class MPSSStudentDetails : System.Web.UI.Page
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
        }

        protected void gv_PageIndexChanged(object sender, GridViewPageEventArgs e)
        {
            gv.PageIndex = e.NewPageIndex;
            gv.DataSource = ViewState["Paging"];
            gv.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["SchoolID"] == null) return;
            if (Request.QueryString["Amountdate"] == null) { return; }

            if (Session["LoginID"].ToString() == null)
            {
                return;
            }
            else
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

        }

        void gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowType != DataControlRowType.Header && e.Row.RowType != DataControlRowType.Footer)
            {
                TableCell cell = e.Row.Cells[e.Row.Cells.Count - 1];

                string PaymentMode = cell.Text;
                if (PaymentMode == "Unpaid")
                {
                    cell.BackColor = Color.Red;
                }

                LinkButton lb = new LinkButton();
                lb.ID = "Attachment";
                lb.Text = "Attachment";
                lb.Command += lb_Command;

                lb.ToolTip = "Attachment";
                lb.CssClass = "tagBubbleAttachment";
                lb.CommandName = "Attachment";
                lb.CommandArgument = e.Row.RowIndex.ToString();

                //e.Row.Cells[e.Row.Cells.Count - 1].Controls.Add(lb);
                e.Row.Cells[1].Controls.Add(lb);
            }



        }

        void gv_RowCreated(object sender, GridViewRowEventArgs e)
        {
            


        }



        void lb_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Attachment")
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];

                var lb = (LinkButton)sender;
                var i = int.Parse(lb.CommandArgument);
                if (i >= 0)
                {
                    string ID = dt.Rows[i]["StudentID"].ToString();
                    string AppID = dt.Rows[i]["AppID"].ToString();
                    string newWin = "";
                    newWin = "window.open(\"MPSSAttachmentShows.aspx?ID=" + ID + "&AppID=" + AppID + "&SvcID=1466&TypeID=2\", \"_blank\", \"WIDTH=1080,HEIGHT=790,scrollbars=no, menubar=no,resizable=yes,directories=no,location=no\");";

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "pop", newWin, true);
                }
            }

        }
        protected DataTable ShowData()
        {
            var SchoolID = "";
            var Amountdate = "";

            if (Request.QueryString["SchoolID"] != null) { SchoolID = Request.QueryString["SchoolID"].ToString(); }
            if (Request.QueryString["Amountdate"] != null) { Amountdate = Request.QueryString["Amountdate"].ToString(); }

            DataTable dt = new DataTable();
            SqlParameter[] parameter = {
                 new SqlParameter("@Fromdate", txtFromdate.Text),
                  new SqlParameter("@Todate", txtTodate.Text),
                   new SqlParameter("@SchoolID", SchoolID),
                    new SqlParameter("@Amountdate", Amountdate),
                 new SqlParameter("@SvcID", "1466")
            };

            dt = sqlhelper.ExecuteDataTable("MPSSStudentPaymentDetaisForApproval", parameter);

            return dt;
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {




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
            Response.Redirect("~/WebApp/Kiosk/MPSS/ApprovalList.aspx");
        }
    }
}