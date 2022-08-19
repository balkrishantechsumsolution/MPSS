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
    public partial class frmAttendanceSheet_WrittenExam : BasePage
    {
        public DataTable dtGlobal;
        OISFDALReport obj = new OISFDALReport();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {


                    drpCampus.Items.Insert(0, "Select");
                    drpCampus.SelectedValue = "Select";

                    drpHallNo.Items.Insert(0, "Select");
                    drpHallNo.SelectedValue = "Select";
                    ExamHall.Visible = false;
                    RangeRow.Visible = false;


                }

            }
            catch (Exception ex)
            {


            }

        }



        protected void drpCenter_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                DataSet ds = obj.GetOISFAppDetails("WR01", drpCenter.SelectedValue, "", "", "", "", "", "", "", "", "");
                drpCampus.DataSource = ds.Tables[0];
                drpCampus.DataTextField = "CenterName";
                drpCampus.DataValueField = "CenterName";
                drpCampus.DataBind();

                drpCampus.Items.Insert(0, "Select");
                drpCampus.SelectedValue = "Select";


                DataSet ds1 = obj.GetOISFAppDetails("WR0N", "", "", "", "", "", "", "", "", "", "");
                DataTable dtNull = ds1.Tables[0];
 
                drpHallNo.DataSource = dtNull;
                drpHallNo.DataTextField = "text";
                drpHallNo.DataValueField = "value";
                drpHallNo.DataBind();
                 

             
                drpRange.DataSource = dtNull;
                drpRange.DataTextField = "text";
                drpRange.DataValueField = "value";
                drpRange.DataBind();
                


                if (drpCenter.SelectedValue == "1")
                {
                    ExamHall.Visible = true;
                    RangeRow.Visible = false;
                }
                else if (drpCenter.SelectedValue == "2")
                {
                    ExamHall.Visible = false;
                    RangeRow.Visible = true;

                }
                else  
                {
                    ExamHall.Visible = false;
                    RangeRow.Visible = false;

                }

            }
            catch (Exception ex)
            {


            }
        }

        protected void drpCampus_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (drpCenter.SelectedValue == "1")
                {
                    DataSet ds = obj.GetOISFAppDetails("WR02", drpCampus.SelectedItem.Text, "", "", "", "", "", "", "", "", "");
                    drpHallNo.DataSource = ds.Tables[0];
                    drpHallNo.DataTextField = "ExaminationHall";
                    drpHallNo.DataValueField = "ExaminationHall";
                    drpHallNo.DataBind();

                    drpHallNo.Items.Insert(0, "Select");
                    drpHallNo.SelectedValue = "Select";

                }
                else if (drpCenter.SelectedValue == "2")
                {

                    DataSet ds = obj.GetOISFAppDetails("WR12", drpCampus.SelectedItem.Text, "", "", "", "", "", "", "", "", "");
                    drpRange.DataSource = ds.Tables[0];
                    drpRange.DataTextField = "RangeText";
                    drpRange.DataValueField = "RangeValue";
                    drpRange.DataBind();

                    drpRange.Items.Insert(0, "Select");
                    drpRange.SelectedValue = "Select";
                 
                }





            }
            catch (Exception ex)
            {


            }
        }



        protected void drpHallNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                Loadgrid();

            }
            catch (Exception ex)
            {


            }
        }

        public void Loadgrid2()
        {


            DataSet ds = obj.GetOISFAppDetails("WR04", drpCenter.SelectedValue.ToString(), drpCampus.SelectedItem.Text, drpHallNo.SelectedItem.Text, drpRange.SelectedValue, "", "", "", "", "", "");

            if (ds.Tables[0].Rows.Count > 0)
            {

                grdAttendanceSheet.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdAttendanceSheet.DataBind();
            }
        }

        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {
            /* Verifies that the control is rendered */
        }

        public void Loadgrid()
        {


            DataSet ds = obj.GetOISFAppDetails("WR03", drpCenter.SelectedValue.ToString(), drpCampus.SelectedItem.Text, drpHallNo.SelectedItem.Text, drpRange.SelectedValue, "", "", "", "", "", "");

            if (ds.Tables[0].Rows.Count > 0)
            {

                grdAttendanceSheet.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdAttendanceSheet.DataBind();
            }
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
                grdAttendanceSheet.RenderControl(hw);
                string gridHTML = sw.ToString().Replace("\"", "'").Replace(System.Environment.NewLine, "");
                StringBuilder sb = new StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload = new function(){");
                sb.Append("var printWin = window.open('', '', 'left=0");
                sb.Append(",top=0,width=1000,height=600,status=0');");
                sb.Append("printWin.document.write(\"");



                OISFDALReport obj11 = new OISFDALReport();


                DataSet ds = obj.GetOISFAppDetails("WR05", drpCenter.SelectedValue.ToString(), drpCampus.SelectedItem.Text, drpHallNo.SelectedItem.Text, "", "", "", "", "", "", "");

                DataTable dt = ds.Tables[0];
                string rollNumber = dt.Rows[0]["RollNumber"].ToString();
                string HallNo = drpHallNo.SelectedItem.Text;

                if(drpCenter.SelectedValue=="2")
                { HallNo = ""; }

                string Strength = dt.Rows[0]["Capacity"].ToString();

                string style = "<style type = 'text/css'>thead {display:table-header-group;} tfoot{display:table-footer-group;}</style>";
                //sb.Append("<table rules='all'   id='grdAttendanceData' style='font-size:14px;width:100%;'>");
                //sb.Append(" <tr><td rowspan='4'><img src='OdisaLogo.png' style='width: 90px' /></td><td  align='center'> ATTENDANCE SHEET </td> <td rowspan='4'><img src='odisha_policelogo.jpg' style='width: 90px' /></td></tr> ");

                //sb.Append(" <tr><td   align='center'><h3> <b>Recruitment of Constable in 9th SIRB -2016 - 17 </b></h3></td></tr> ");
                //sb.Append("<tr><td  align='center'><h3> <b>" + drpCenter.SelectedItem.Text + " </td></tr>");
                //sb.Append("<tr><td   align='center'><h3> <b>" + drpCampus.SelectedItem.Text + " </td></tr><tr><td><b>RollNo Range </b><br/>" + rollNumber + "</td><td align='center'><b>Hall/Room No.:</b>" + HallNo + "</td> <td><b>Strength :</b>" + Strength + "</td></tr></table>");
                //// sb.Append("<tr><td><b> Date :</b> " + Date + " </td><td></td></tr></table> ");

                sb.Append("<table id='grdAttendanceData' style='width: 100%; vertical-align: middle; text-align: center;'>");
                sb.Append("<tr>");
                sb.Append("<td>");
                sb.Append("<img alt='Logo' src='https://lokaseba-odisha.in/g2c/img/lokaseba_logo.png' style='width: 90px;' />");
                sb.Append("</td>");
                sb.Append("<td style='text-align: center; vertical-align: middle;'>");
                sb.Append("<span class='auto-style3'>ATTENDANCE SHEET</span>");
                sb.Append("<br />");
                sb.Append("<asp:Label runat='server' ID='lblCompany' Style='font-size: 18px; font-weight: bolder; text-transform: none;'>Recruitment of Constable in 9th SIRB - 2016-17</asp:Label>");
                sb.Append("<br /><asp:Label runat='server' ID='lblCompus' Style='font-weight: bolder; text-transform: none; font-size: 18px;' Text=''>" + drpCenter.SelectedItem.Text + "</asp:Label>");
                sb.Append("<br /><asp:Label runat='server' ID='lbVenue' Style='font-weight: bolder; text-transform: none; font-size: 15px;' Text=''>" + drpCampus.SelectedItem.Text + "</asp:Label></td>");
                sb.Append("<td style='font-size: 9px; vertical-align: middle; text-align: center; height: 113px;'>");
                sb.Append("<img alt='Logo' src='https://lokaseba-odisha.in/WebApp/Kiosk/OISF/img/odisha_policelogo.jpg' style='width: 90px;' /></td>");
                sb.Append("</tr>");
                sb.Append("</table>");

                sb.Append("<table style='width: 100%'>");
                sb.Append("<tr>");
                sb.Append("<td style='white-space: nowrap;text-align: left'> Roll No. Range : " + rollNumber);
                sb.Append("</td>");
                sb.Append("<td style='white-space: nowrap;text-align: center'> Hall / Room No.:" + HallNo);
                sb.Append("</td>");
                sb.Append("<td style='white-space: nowrap;text-align: right'>Strength :" + Strength);
                sb.Append("&nbsp;</td>");
                sb.Append("</tr>");
                sb.Append("</table>");
                sb.Append(style + gridHTML);


                //sb.Replace("<tr style='page-break-before:always;'>				<td>", "<tr style='page-break-before:always;'><td><table rules='all'   id='grdAttendanceData' style='font-size:14px;width:100%;'><tr><tr><td rowspan='4'><img src='OdisaLogo.png' style='height: 53px; width: 71px' /></td><td  align='center'> ATTENDANCE SHEET </td> <td rowspan='4'><img src='odisha_policelogo.jpg' style='height: 53px; width: 71px' /></td></tr><tr><td   align='center'><h3> <b>Recruitment of Constable in 9th SIRB -2016 - 17 </b></h3></td></tr><tr><td  align='center'><h3> <b>" + drpCenter.SelectedItem.Text + " </td></tr><tr><td   align='center'><h3> <b>" + drpCampus.SelectedItem.Text + " </td></tr><tr><td><b>RollNo.Range</b> <br/>" + rollNumber + "</td><td align='center'><b>Hall/Room No.:</b>" + HallNo+ "</td> <td><b>Strength :</b>" + Strength+"</td></tr></table>");

                sb.Replace("<tr style='page-break-before:always;'>				<td>", "<tr style='page-break-before:always;'><td> "+

                    "<table style='width: 100%; vertical-align: middle; text-align: center;'> "+
"<tr>" +
"<td>" +
"<img alt='Logo' src='https://lokaseba-odisha.in/g2c/img/lokaseba_logo.png' style='width: 90px;' />" +
"</td>" +
"<td style='text-align: center; vertical-align: middle;'>" +

"<span class='auto-style3'>ATTENDANCE SHEET</span>" +
"<br />" +
"<asp:Label runat='server' ID='lblCompany' Style='font-size: 18px; font-weight: bolder; text-transform: none;'>Recruitment of Constable in 9th SIRB - 2016-17</asp:Label>" +
"<br /><asp:Label runat='server' ID='lblCompus' Style='font-weight: bolder; text-transform: none; font-size: 18px;' Text=''>" + drpCenter.SelectedItem.Text + "</asp:Label>" +
"<br /><asp:Label runat='server' ID='lbVenue' Style='font-weight: bolder; text-transform: none; font-size: 15px;' Text=''>" + drpCampus.SelectedItem.Text + "</asp:Label></td>" +
"<td style='font-size: 9px; vertical-align: middle; text-align: center; height: 113px;'>" +
"<img alt='Logo' src='https://lokaseba-odisha.in/WebApp/Kiosk/OISF/img/odisha_policelogo.jpg' style='width: 90px;' /></td>" +
"</tr>" +
"</table>" +
"<table style='width: 100%'>" +
"<tr>" +
"<td style='white-space: nowrap;text-align: left'> Roll No. Range : " + rollNumber +
"</td>" +
"<td style='white-space: nowrap;text-align: center'> Hall / Room No.:" + HallNo +
"</td>" +
"<td style='white-space: nowrap;text-align: right'>Strength :" + Strength +
"&nbsp;</td>" +
"</tr>" +
"</table>");

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
            catch (Exception ex)
            {


            }
        }

        protected void grdAttendanceSheet_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                System.Web.UI.HtmlControls.HtmlImage img = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("ProfilePhoto");
                img.Src = dtGlobal.Rows[e.Row.RowIndex]["ApplicantImageStr"].ToString();


                System.Web.UI.HtmlControls.HtmlImage Img11 = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("Img1");
                Img11.Src = dtGlobal.Rows[e.Row.RowIndex]["ImageSign"].ToString();
            }
        }

        protected void drpRange_SelectedIndexChanged(object sender, EventArgs e)
        {
            Loadgrid();
        }
    }
}