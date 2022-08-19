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
    public partial class frmPMEventSheet : System.Web.UI.Page
    {
        public DataTable dtGlobal;

       

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
        }

        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {
            /* Verifies that the control is rendered */
        }
        protected void drpday_SelectedIndexChanged(object sender, EventArgs e)
        {


            OISFDALReport obj = new OISFDALReport();


            DataSet ds = obj.GetOISFAppDetails("OP14", drpCenter.SelectedValue.ToString(), drpday.SelectedValue.ToString(), "", "", "", "", "", "", "", "");

            grdReport.DataSource = ds.Tables[0];
            dtGlobal = ds.Tables[0];
            grdReport.DataBind();


        }



        protected void grdReport_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                System.Web.UI.HtmlControls.HtmlImage img = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("ProfilePhoto");
                img.Src = "data:image/png;base64," + dtGlobal.Rows[e.Row.RowIndex]["ApplicantImageStr"].ToString();


                System.Web.UI.HtmlControls.HtmlImage Img11 = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("Img1");
                Img11.Src = "data:image/png;base64," + dtGlobal.Rows[e.Row.RowIndex]["ApplicantImageStr"].ToString();
            }
        }



        protected void btnPrint_Click(object sender, EventArgs e)
        {

            grdReport.UseAccessibleHeader = true;
            grdReport.HeaderRow.TableSection = TableRowSection.TableHeader;
            grdReport.FooterRow.TableSection = TableRowSection.TableFooter;
            grdReport.Attributes["style"] = "border-collapse:separate";
            foreach (GridViewRow row in grdReport.Rows)
            {
                int pagebreakvalue = 5;
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

            string style = "<style type = 'text/css'>thead {display:table-header-group;} tfoot{display:table-footer-group;}</style>";
            sb.Append("<table style='width: 100 %; height: 5 %; border: 1px solid black;'><tr><td></td><td align='right'> Roll No :" + rollNumber + " </td></tr>");
            sb.Append(" <tr><td colspan='2' align='center'><b> Recruitment of Constable in 9th SIRB -2016 - 17 </b></td></tr> ");
            sb.Append("<tr><td>Event Sheet: -Bio-Matric </td> <td> Category : " + category + " </td></tr>");
            sb.Append("<tr><td> Venue : " + drpCenter.SelectedItem.Text + "</td><td></td></tr>");
            sb.Append("<tr><td> Date : " + Date + " </td><td></td></tr></table> ");
            sb.Append(style + gridHTML);
            //         sb.Replace("<tr style='page-break-before:always;'>				<td>", @"<tr style='page-break-before:always;'><td><table style='width: 100 %; height: 10 %; border: 1px solid black;'><tr><td></td><td align='right'> Roll No </td></tr> 
            //<tr><td colspan='2' align='center'><h4> Recruitment of Constable in 9th SIRB -2016 - 17 </h4></td></tr> 
            //   <tr><td>Event Sheet: -Physical Measurement </td> <td> Category  </td></tr> 
            //      <tr><td> Venue : </td><td></td></tr>    <tr><td> Date  </td><td></td></tr></table>      ");

            sb.Replace("<tr style='page-break-before:always;'>				<td>", "<tr style='page-break-before:always;'><td><table style='width: 100 %; height: 30 %; border: 1px solid black;'><tr><td></td><td align='right'> Roll No :" + rollNumber + " </td></tr><tr><td colspan='2' align='center'><h4> Recruitment of Constable in 9th SIRB -2016 - 17 </h4></td></tr><tr><td>Event Sheet: -Physical Measurement </td> <td>  Category : " + category + " </td></tr><tr><td> Venue : " + drpCenter.SelectedItem.Text + "</td><td></td></tr><tr><td>Date : " + Date + " </td><td></td></tr></table> ");







            sb.Append("\");");
            sb.Append("printWin.document.close();");
            sb.Append("printWin.focus();");
            sb.Append("printWin.print();");
            sb.Append("printWin.close();");
            sb.Append("};");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(), "GridPrint", sb.ToString());
            OISFDALReport obj = new OISFDALReport();


            DataSet ds = obj.GetOISFAppDetails("OP14", drpCenter.SelectedValue.ToString(), drpday.SelectedValue.ToString(), "", "", "", "", "", "", "", "");

            grdReport.DataSource = ds.Tables[0];
            dtGlobal = ds.Tables[0];
            grdReport.DataBind();
        }
    }
}