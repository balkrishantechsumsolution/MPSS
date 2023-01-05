using System;
using Microsoft.Owin;
using SqlHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.DataVisualization.Charting;
using System.Text;
using System.Web.UI.HtmlControls;
using javax.swing.text.html;
using DocumentFormat.OpenXml.Bibliography;
using sun.net.www.content.image;

namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class CenterCodeWiseMPSOSView : System.Web.UI.Page
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
            if (Request["hfCentreCode"] != null)
            {


                hfCentreCode.Value = Request["hfCentreCode"].ToString();
               
            }

            if (Request["hfClass"] != null)
            {


                hfClass.Value = Request["hfClass"].ToString();

            }
            BindGrid();
        }

        public void BindGrid()
        {
            try
            {
                DataTable dt = new DataTable();

                //hfCentreCode.Value = txtSamagraNo.Text;
                //hfBirthdate.Value = txtBirthdate.Text;
                //hfApplicationID.Value = txtApplicationID.Text;
                //hfRegNo.Value = txtRegNo.Text;

                string CentreCode = hfCentreCode.Value;
                string Class = hfClass.Value;


                SqlParameter[] parameter = {
                     new SqlParameter("@Centre_Code", CentreCode.ToString()),
                      new SqlParameter("@Class", Class.ToString()),

                };

                    dt = sqlhelper.ExecuteDataTable("GetMPSOSDOCATTENDBULKViewPageSP", parameter);

                    gv.DataSource = dt;
                    ViewState["CurrentTable"] = dt;
                    ViewState["Paging"] = dt;
                    ViewState["Paging"] = dt;
                    gv.DataBind();
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
            hfCentreCode.Value = txtCentreCode.Text;
            hfClass.Value = txtClass.Text;
        }

        void gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowType != DataControlRowType.Header && e.Row.RowType != DataControlRowType.Footer)
            {
                TableCell cell = e.Row.Cells[e.Row.Cells.Count - 1];

                string PaymentMode = cell.Text;

                LinkButton lb = new LinkButton();
                lb.ID = "Docket";
                lb.Text = "View Docket";
                lb.Command += lb_Command;

                lb.ToolTip = "Docket";
                lb.CssClass = "tagBubbleDocket";
                lb.CommandName = "Docket";
                lb.CommandArgument = e.Row.RowIndex.ToString();

                //e.Row.Cells[e.Row.Cells.Count - 1].Controls.Add(lb);
                e.Row.Cells[1].Controls.Add(lb);

                LinkButton lb2 = new LinkButton();
                lb2.ID = "AttendenceSheet";
                lb2.Text = "View Attendence Sheet";
                lb2.Command += lb_Command;

                lb2.ToolTip = "AttendenceSheet";
                lb2.CssClass = "tagBubbleAttachment";
                lb2.CommandName = "AttendenceSheet";
                lb2.CommandArgument = e.Row.RowIndex.ToString();

                //e.Row.Cells[e.Row.Cells.Count - 1].Controls.Add(lb);
                e.Row.Cells[2].Controls.Add(lb2);


                LinkButton lb3 = new LinkButton();
                lb3.ID = "BulkAttendenceSheet";
                lb3.Text = "View Bulk Attendence Sheet";
                lb3.Command += lb_Command;

                lb3.ToolTip = "BulkAttendenceSheet";
                lb3.CssClass = "tagBubbleBulkAttendenceSheet";
                lb3.CommandName = "BulkAttendenceSheet";
                lb3.CommandArgument = e.Row.RowIndex.ToString();

                //e.Row.Cells[e.Row.Cells.Count - 1].Controls.Add(lb);
                e.Row.Cells[3].Controls.Add(lb3);
            }



        }

        void gv_RowCreated(object sender, GridViewRowEventArgs e)
        {



        }



        void lb_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Docket")
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];

                var lb = (LinkButton)sender;
                var i = int.Parse(lb.CommandArgument);
                if (i >= 0)
                {
                    string ID = dt.Rows[i]["CENTER_CODE"].ToString();
                    string Class = dt.Rows[i]["Class"].ToString();
                    string newWin = "";
                    newWin = "window.open(\"DocketMPSOS.aspx?ID=" + ID + "&Class=" + Class + "\", \"_blank\", \"WIDTH=1080,HEIGHT=790,scrollbars=no, menubar=no,resizable=yes,directories=no,location=no\");";

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "pop", newWin, true);
                }
            }
            if (e.CommandName == "AttendenceSheet")
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];

                var lb = (LinkButton)sender;
                var i = int.Parse(lb.CommandArgument);
                if (i >= 0)
                {
                    string ID = dt.Rows[i]["CENTER_CODE"].ToString();
                    string Class = dt.Rows[i]["Class"].ToString();
                    string newWin = "";
                    newWin = "window.open(\"AttendenceSheet.aspx?ID=" + ID + "&Class=" + Class + "\", \"_blank\", \"WIDTH=1080,HEIGHT=790,scrollbars=no, menubar=no,resizable=yes,directories=no,location=no\");";

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "pop", newWin, true);
                }
            }
            if (e.CommandName == "BulkAttendenceSheet")
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];

                var lb = (LinkButton)sender;
                var i = int.Parse(lb.CommandArgument);
                if (i >= 0)
                {
                    string ID = dt.Rows[i]["CENTER_CODE"].ToString();
                    string Class = dt.Rows[i]["Class"].ToString();
                    string newWin = "";
                    newWin = "window.open(\"BulkAttendenceCheck.aspx?ID=" + ID + "&Class=" + Class + "\", \"_blank\", \"WIDTH=1080,HEIGHT=790,scrollbars=no, menubar=no,resizable=yes,directories=no,location=no\");";

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "pop", newWin, true);
                }
            }

        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            hfCentreCode.Value = txtCentreCode.Text;
            hfClass.Value = txtClass.Text;

            BindGrid();
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebApp/Kiosk/MPSS/MPSOSPage.aspx");
        }
    }
}