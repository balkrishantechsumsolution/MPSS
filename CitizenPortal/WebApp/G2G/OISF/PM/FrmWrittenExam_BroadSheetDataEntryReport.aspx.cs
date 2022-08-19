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
    public partial class FrmWrittenExam_BroadSheetDataEntryReport : BasePage
    {
        public DataTable dtGlobal;
        OISFDALReport obj = new OISFDALReport();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
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
            catch (Exception ex)
            {


            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            Loadgrid();

        }

        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {
            /* Verifies that the control is rendered */
        }


        public void Loadgrid()
        {


            DataSet ds = obj.GetOISFAppDetails("WRN2", drpCenter.SelectedValue, drpday.SelectedValue, drpCategory.SelectedValue, drpSropts.SelectedValue, drpNCC.SelectedValue, drpWrittenExamStatus.SelectedValue, DrpFinalStatus.SelectedValue, drpRollnumber.SelectedValue, "", "");

            if (ds.Tables[0].Rows.Count > 0)
            {

                grdBroadSheet.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdBroadSheet.DataBind();
            }
        }

        public void BindRollNumbrrGrid()
        {
            OISFDALReport obj = new OISFDALReport();


            DataSet ds = obj.GetOISFAppDetails("WRN1", drpCenter.SelectedValue, drpday.SelectedValue, drpCategory.SelectedValue, drpSropts.SelectedValue, drpNCC.SelectedValue, drpWrittenExamStatus.SelectedValue, DrpFinalStatus.SelectedValue, "", "", "");
            drpRollnumber.DataSource = ds.Tables[0];
            drpRollnumber.DataTextField = "Roll Number";
            drpRollnumber.DataValueField = "Roll Number";
            drpRollnumber.DataBind();

        }


        protected void drpday_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindRollNumbrrGrid();


        }

     
        protected void drpCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindRollNumbrrGrid();
        }

        protected void drpSropts_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindRollNumbrrGrid();
        }

        protected void drpNCC_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindRollNumbrrGrid();
        }

        protected void drpWrittenExamStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindRollNumbrrGrid();
        }

        protected void DrpFinalStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindRollNumbrrGrid();
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {



            grdBroadSheet.UseAccessibleHeader = true;
            grdBroadSheet.HeaderRow.TableSection = TableRowSection.TableHeader;
            grdBroadSheet.FooterRow.TableSection = TableRowSection.TableFooter;
            grdBroadSheet.Attributes["style"] = "border-collapse:separate";
            foreach (GridViewRow row in grdBroadSheet.Rows)
            {
                int pagebreakvalue = 15;
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
            grdBroadSheet.RenderControl(hw);
            string gridHTML = sw.ToString().Replace("\"", "'").Replace(System.Environment.NewLine, "");
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload = new function(){");
            sb.Append("var printWin = window.open('', '', 'left=0");
            sb.Append(",top=0,width=1000,height=600,status=0');");
            sb.Append("printWin.document.write(\"");
            string style = "<style type = 'text/css'>thead {display:table-header-group;} tfoot{display:table-footer-group;}</style>";
            sb.Append("<table BORDER='1' rules='all'   id='grdAttendanceData' style='font-size:14px;width:100%;'>");
            sb.Append(" <tr><td colspan='2' align='center'><h3> <b>Recruitment of Constable in 9th SIRB -2016 - 17 </b></h3><img src='odisha_policelogo.jpg' style='height: 53px; width: 71px' /></td></tr> ");
            sb.Append("<tr><td> <b>Venue :</b> " + drpCenter.SelectedItem.Text + "</td><td > <b>Batch No. </b>:" + drpday.SelectedItem.Text + " </td></tr></table>");
            sb.Append(style + gridHTML);

            



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
    }
}