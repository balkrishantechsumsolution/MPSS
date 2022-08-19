using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib;
using CitizenPortalLib.DAL;
using System.Data;
using System.Text;


namespace CitizenPortal.WebApp.G2G.OISF.PM.EventEntry.Reports
{
    public partial class EventReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                OISFDALReport obj = new OISFDALReport();


                DataSet ds = obj.GetOISFAppDetails("OP06", "", "", "", "", "", "", "", "", "", "");

                drpCenter.DataSource = ds.Tables[0];
                drpCenter.DataTextField = "CenterName";
                drpCenter.DataValueField = "CenterCode";
                drpCenter.DataBind();
                drpCenter.SelectedItem.Text = "Select";

                drpday.DataSource = ds.Tables[1];

                drpday.DataTextField = "batchno";
                drpday.DataValueField = "batchno";
                drpday.DataBind();

                drpday.Items.Insert(0, "Select");
                drpday.SelectedValue = "Select";
            }
            else
            {
                //trvenue.Visible = true;
            }


            if (Session["LoginID"] == null)
            {


                Response.Redirect("/g2c/forms/index.aspx");
            }
            else
            {
                drpCenter.SelectedValue = Session["LoginID"].ToString().Substring(6, 1);
                drpCenter.Enabled = false;
            }

        }

        protected void drpday_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public void LoadGridData()

        {
            OISFDALReport obj = new OISFDALReport();


            DataSet ds = obj.GetOISFEventDetails(drpCenter.SelectedValue.ToString(), drpday.SelectedValue.ToString().Substring(0, 2).Trim());

            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    DataGridView.DataSource = ds.Tables[0];
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                    DataTable dt = null;
                    DataGridView.DataSource = dt;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                DataTable dt = null;
                DataGridView.DataSource = dt;
            }
            DataGridView.DataBind();
        }

        protected void drpEventType_SelectedIndexChanged(object sender, EventArgs e)
        {


            //lblEvenType.Text = drpEventType.SelectedItem.Text;
            OISFDALReport obj11 = new OISFDALReport();
            DataSet ds11 = obj11.GetOISFAppDetails("OP16", drpCenter.SelectedValue.ToString(), drpday.SelectedValue.ToString(), "", "", "", "", "", "", "", "");

            DataTable dt = ds11.Tables[0];

            //lblVenue.Text = drpCenter.SelectedItem.Text;
            //lblDate.Text = dt.Rows[0]["Date"].ToString();
            //lblCategory.Text = dt.Rows[0]["category"].ToString();

            LoadGridData();

        }


        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void DataGridView_PreRender(object sender, EventArgs e)
        {
            if (DataGridView.Rows.Count > 0)
            {
                DataGridView.UseAccessibleHeader = true;
                DataGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
                DataGridView.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            GridView grdReport = DataGridView;
            string EventTypeVar = drpEventType.SelectedItem.Text;






            grdReport.UseAccessibleHeader = true;
            grdReport.HeaderRow.TableSection = TableRowSection.TableHeader;
            grdReport.FooterRow.TableSection = TableRowSection.TableFooter;
            grdReport.Attributes["style"] = "border-collapse:separate";
            foreach (GridViewRow row in grdReport.Rows)
            {
                int pagebreakvalue = 30;
                if (row.RowIndex == (pagebreakvalue) && row.RowIndex != 0)
                {
                    row.Attributes["style"] = "page-break-before:always;";
                }
                else if (row.RowIndex > pagebreakvalue && row.RowIndex % pagebreakvalue == 0 && row.RowIndex != 0)
                {
                    row.Attributes["style"] = "page-break-before:always;";
                }
            }
            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            grdReport.RenderControl(hw);
            string gridHTML = sw.ToString().Replace("\"", "'").Replace(System.Environment.NewLine, "");
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload = new function(){");
            sb.Append("var printWin = window.open('', '', 'left=0");
            sb.Append(",top=0,width=1000,height=600,status=0');");
            sb.Append("printWin.document.write(\"");

            OISFDALReport obj11 = new OISFDALReport();


            DataSet ds11 = obj11.GetOISFAppDetails("OP16", drpCenter.SelectedValue.ToString(), drpday.SelectedValue.ToString(), "", "", "", "", "", "", "", "");

            DataTable dt = ds11.Tables[0];
            string rollNumber = dt.Rows[0]["RollNumber"].ToString();
            string category = dt.Rows[0]["category"].ToString();
            string Date = dt.Rows[0]["Date"].ToString();

            string style = "<style type = 'text/css'>thead {display:none;} tfoot{display:table-footer-group;}</style>";
            sb.Append("<table BORDER='1' rules='all'   id='grdAttendanceData' style='font-size:14px;width:100%;'><tr><td></td><td align='right'> Roll No :" + rollNumber + " </td></tr>");
            sb.Append(" <tr><td colspan='2' align='center'><h4> Recruitment of Constable in 9th SIRB -2016 - 17 </h4></td></tr> ");
            sb.Append("<tr><td>Attendance Sheet: - " + EventTypeVar + " </td> <td> Category : " + category + " </td></tr>");
            sb.Append("<tr><td> Venue : " + drpCenter.SelectedItem.Text + "</td><td></td></tr>");
            sb.Append("<tr><td> Date : " + Date + " </td><td></td></tr></table>");
            sb.Append(style + gridHTML);








            sb.Append("\");");
            sb.Append("printWin.document.close();");
            sb.Append("printWin.focus();");
            sb.Append("printWin.print();");
            sb.Append("printWin.close();");
            sb.Append("};");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(), "GridPrint", sb.ToString());
            LoadGridData();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            LoadGridData();
        }
    }
}