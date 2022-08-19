using CitizenPortalLib.BLL;
using CitizenPortalLib.DAL;
using System;
using System.Data;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G.OUAT
{
    public partial class AttendanceSheet_PG : System.Web.UI.Page
    {
        public DataTable dtGlobal;
        private OUATBLL obj = new OUATBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void Loadgrid()
        {
            DataSet ds = new DataSet();
            if (drpRange.SelectedValue=="0")
            {
                ds = obj.GetOUATPGAttendanceSheet("OUA2PG", drpCenter.SelectedValue.ToString(), txtSearch.Text, "", "");
            }
            if (drpRange.SelectedValue != "0")
            {
                ds = obj.GetOUATPGAttendanceSheet("OUA2PG", drpCenter.SelectedValue.ToString(), txtSearch.Text, drpRange.SelectedValue,"" );
            }

            if (ds.Tables[0].Rows.Count > 0)
            {
                grdAttendanceSheet.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdAttendanceSheet.DataBind();
            }
        }
        public void PrintGrid()
        {
            DataSet ds = obj.GetOUATPGAttendanceSheet("OUA2PG", drpCenter.SelectedValue.ToString(), txtSearch.Text, drpRange.SelectedValue, "Print");

            if (ds.Tables[0].Rows.Count > 0)
            {
                grdAttendanceSheet.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdAttendanceSheet.DataBind();
            }
        }

        protected void grdAttendanceSheet_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                System.Web.UI.HtmlControls.HtmlImage img = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("ProfilePhoto");
                img.Src = dtGlobal.Rows[e.Row.RowIndex]["ApplicantImageStr"].ToString();

                System.Web.UI.HtmlControls.HtmlImage Img11 = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("Img1");
                Img11.Src = dtGlobal.Rows[e.Row.RowIndex]["Signature"].ToString();
            }
        }

        public void Loadgrid2()
        {
            DataSet ds = obj.GetOUATPGAttendanceSheet("OUA2PG", drpCenter.SelectedValue.ToString(), txtSearch.Text,drpRange.SelectedValue, "Print");

            if (ds.Tables[0].Rows.Count > 0)
            {
                grdAttendanceSheet.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdAttendanceSheet.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                Loadgrid();
            }
            catch (Exception ex)
            {
            }
        }

        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void drpRange_SelectedIndexChanged(object sender, EventArgs e)
        {
            Loadgrid();
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            try
            {
                Loadgrid2();

                grdAttendanceSheet.UseAccessibleHeader = true;
                grdAttendanceSheet.HeaderRow.TableSection = TableRowSection.TableHeader;
                grdAttendanceSheet.FooterRow.TableSection = TableRowSection.TableFooter;
                grdAttendanceSheet.Attributes["style"] = "border-collapse:separate";
                foreach (GridViewRow row in grdAttendanceSheet.Rows)
                {
                    int pagebreakvalue = 10;
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
                grdAttendanceSheet.RenderControl(hw);
                // string gridHTML =sw.ToString();
                // gridHTML= sw.ToString().Replace("\"", "'").Replace(System.Environment.NewLine, "");
                StringBuilder sb = new StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload = new function(){");
                sb.Append("var printWin = window.open('', '', 'left=0");
                sb.Append(",top=0,width=1000,height=600,status=0');");
                sb.Append("printWin.document.write(\"");

                OISFDALReport obj11 = new OISFDALReport();

                DataSet ds = obj.GetOUATPGAttendanceSheet("OUA2PG", drpCenter.SelectedValue.ToString(), txtSearch.Text,drpRange.SelectedValue,"Print");

                DataTable dt = ds.Tables[0];
                string rollNumberRange = "";//dt.Rows[0]["RollNoRange"].ToString();
                string ExamDate = dt.Rows[0]["ExamDate"].ToString();
                string style = "<style type = 'text/css'>thead {display:table-header-group;} tfoot{display:table-footer-group;}</style>";
                sb.Append("<table BORDER='1' rules='all'   id='grdAttendanceData' style='font-size:14px;width:100%;'>");
                sb.Append(" <tr><td><img src='download1.png' style='height: 43px;' /></td><td  align='center'><b> ORISSA UNIVERSITY OF AGRICULTURE AND TECHNOLOGY, BHUBANESWAR <br/>UG.  COMMON ENTRANCE EXAMINATION - 2017<br/> ATTENDANCE SHEET</b> </td> </tr> ");

                sb.Append("<tr><td  align='center'>Center Name : </td> <td  align='center'> <b>College of Agriculture, Bhubaneswar (" + drpCenter.SelectedItem.Text.ToString() + " ) </b></td></tr>");
                sb.Append("<tr><td  align='center'>Roll Range : " + rollNumberRange + "</td> <td  align='center'>Exam. Date : <b>" + ExamDate + "</b> </td></tr></table>");
                sb.Append(style + sw.ToString().Replace("\"", "'").Replace(System.Environment.NewLine, ""));

                sb.Replace("<tr style='page-break-before:always;'>				<td>", "<tr><td>Total candidates Present:</td></tr><tr><td>Total Candidate absent : &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Signature of the Invigilator</td></tr><tr style='page-break-before:always;'><td><table BORDER='1' rules='all'   id='grdAttendanceData' style='font-size:14px;width:100%;'><tr> <tr><td><img src='download1.png' style='height: 43px; width: 71px'   /></td><td  align='center'><b> ORISSA UNIVERSITY OF AGRICULTURE AND TECHNOLOGY, BHUBANESWAR <br/>UG.  COMMON ENTRANCE EXAMINATION - 2017<br/> ATTENDANCE SHEET</b> </td> </tr><tr><td  align='center'>Center Name : </td> <td  align='center'><b> College of Agriculture, Bhubaneswar (" + drpCenter.SelectedItem.Text.ToString() + " )</b></td></tr><tr><td  align='center'>Roll Range : " + rollNumberRange + "</td> <td  align='center'>Exam. Date : <b>" + ExamDate + "</b> </td></tr></table>");
                sb.Append("<table BORDER='1' style='font-size:14px;width:100%;'><tr><td>Total candidates Present:</td></tr><tr><td>Total Candidate absent : &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Signature of the Invigilator</td></tr></table>");

                sb.Append("\");");
                sb.Append("printWin.document.close();");
                sb.Append("printWin.focus();");
                sb.Append("printWin.print();");
                sb.Append("printWin.close();");
                sb.Append("};");
                sb.Append("</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "GridPrint", sb.ToString());
                sb.Clear();

                sw.Flush();
                sw.Close();
                PrintGrid();
            }
            catch (Exception ex)
            {
            }
        }
    }
}