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


namespace CitizenPortal.WebApp.G2G.OISF.PM
{
    public partial class FrmAttendanceSheetAllEvent : System.Web.UI.Page
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
        }


        public void Loadgrid()
        {
            OISFDALReport obj = new OISFDALReport();


            DataSet ds = obj.GetOISFAppDetails("OP20", drpCenter.SelectedValue.ToString(), drpday.SelectedValue.ToString(), drpRange.SelectedValue, drpEvent.SelectedValue, "", "", "", "", "", "");

            if (ds.Tables[0].Rows.Count > 0)
            {
                grdAttendanceData.DataSource = ds.Tables[0];
                grdAttendanceData.DataBind();
            }
            else
            {

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found !!!')", true);
                grdAttendanceData.DataSource = null;
                grdAttendanceData.DataBind();


            }
        }


        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            GridView grdReport = grdAttendanceData;
            string EventTypeVar = drpEvent.SelectedItem.Text ;


          



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
            sb.Append("<table BORDER='1' rules='all'   id='grdAttendanceData' style='font-size:14px;width:100%;'>");
            sb.Append(" <tr><td colspan='2' align='center'><h3> <b>Recruitment of Constable in 9th SIRB -2016 - 17 </b></h3>  <img src='odisha_policelogo.jpg' style='height: 53px; width: 71px' /></td></tr> ");
            sb.Append("<tr><td><b>Attendance Sheet:</b> - " + EventTypeVar + " </td> <td><b> Category :</b> " + category + " </td></tr>");
            sb.Append("<tr><td> <b>Venue :</b> " + drpCenter.SelectedItem.Text + "</td><td > <b>Roll No </b>:" + rollNumber + " </td></tr>");
            sb.Append("<tr><td> <b>Date :</b> " + Date + " </td><td></td></tr></table>");
            sb.Append(style + gridHTML);
            //         sb.Replace("<tr style='page-break-before:always;'>				<td>", @"<tr style='page-break-before:always;'><td><table style='width: 100 %; height: 10 %; border: 1px solid black;'><tr><td></td><td align='right'> Roll No </td></tr> 
            //<tr><td colspan='2' align='center'><h4> Recruitment of Constable in 9th SIRB -2016 - 17 </h4></td></tr> 
            //   <tr><td>Event Sheet: -Physical Measurement </td> <td> Category  </td></tr> 
            //      <tr><td> Venue : </td><td></td></tr>    <tr><td> Date  </td><td></td></tr></table>      ");
            sb.Replace("<table cellspacing='0' rules='all' border='1' id='grdAttendanceData' style='font-size:14px;width:100%;border-collapse:collapse;border-collapse:separate'>", "<table BORDER='1' rules='all'   id='grdAttendanceData' style='font-size:14px;width:100%;'><tr><td style='width: 4 % '>Sr No</td><td>Roll No  </td><td style='width: 20 % '>Candidate Name  </td><td>Date Of Birth</td><td  style='width: 20 % '>Father 's  Name  </td><td>Mobile Number</td><td>Present/Absent</td></tr>");
 sb.Replace("<tr style='page-break-before:always;'>				<td>", " <tr style='page-break-before:always;'><td colspan='7'><table BORDER='1' rules='all'   id='grdAttendanceData' style='font-size:17px;width:100%;'><tr><td colspan='2' align='center'><h3><b> Recruitment of Constable in 9th SIRB -2016 - 17</b> </h3><img src='odisha_policelogo.jpg' style='height: 53px; width: 71px' /></td></tr></td></tr><tr><td><b>Attendance Sheet:</b> - " + EventTypeVar + " </td> <td>  <b>Category :</b> " + category + " </td></tr><tr><td><b> Venue :</b> " + drpCenter.SelectedItem.Text + "</td><td ><b> Roll No :</b>" + rollNumber + " </td><td></td></tr><tr><td><b>Date :</b> " + Date + " </td><td></td></tr></table> </td><tr><td >Sr No</td><td>Roll No</td><td>Sr No</td><td>Date Of Birth</td><td>Father's  Name</td><td>Mobile Number</td><td>Present/Absent</td></tr><tr><td>");







            sb.Append("\");");
            sb.Append("printWin.document.close();");
            sb.Append("printWin.focus();");
            sb.Append("printWin.print();");
            sb.Append("printWin.close();");
            sb.Append("};");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(), "GridPrint", sb.ToString());
            Loadgrid();
        }

      

        protected void drpRange_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblEventSheetType.Text = drpEvent.SelectedItem.Text + "Attendance Sheet";
            Loadgrid();
        }

        protected void drpday_SelectedIndexChanged(object sender, EventArgs e)
        {
            OISFDALReport obj = new OISFDALReport();


            DataSet ds = obj.GetOISFAppDetails("OP06R",drpCenter.SelectedValue, drpday.SelectedValue, "", "", "", "", "", "", "", "");

            if (ds.Tables[0].Rows.Count > 0)
            {
                drpRange.DataSource = ds.Tables[0];
                drpRange.DataTextField = "RangeText";
                drpRange.DataValueField = "RangeValue";
                drpRange.DataBind();
                drpRange.Items.Insert(0, "Select");
            
            }
            }
    }
}