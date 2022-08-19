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


    public partial class FrmBioMatricReport : System.Web.UI.Page
    {
    public DataTable dtGlobal;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
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

            if(Session["LoginID"]==null)
            {


                Response.Redirect("/g2c/forms/index.aspx");
            }
            else {
                drpCenter.SelectedValue = Session["LoginID"].ToString().Substring(6,1);
                drpCenter.Enabled = false;
            }
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void drpday_SelectedIndexChanged(object sender, EventArgs e)
        {

        OISFDALReport obj = new OISFDALReport();


        DataSet ds = obj.GetOISFAppDetails("OP06R", drpCenter.SelectedValue, drpday.SelectedValue, "", "", "", "", "", "", "", "");

        if (ds.Tables[0].Rows.Count > 0)
        {
            drpRange.DataSource = ds.Tables[0];
            drpRange.DataTextField = "RangeText";
            drpRange.DataValueField = "RangeValue";
            drpRange.DataBind();
            drpRange.Items.Insert(0, "Select");

        }


    }

 

    protected void grdReport_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       
            if (e.Row.RowType == DataControlRowType.DataRow)
        {
            System.Web.UI.HtmlControls.HtmlImage img = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("ProfilePhoto");
            img.Src = "data:image/png;base64," + dtGlobal.Rows[e.Row.RowIndex]["ApplicantImageStr"].ToString();


            System.Web.UI.HtmlControls.HtmlImage Img11 = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("Img1");
            Img11.Src = dtGlobal.Rows[e.Row.RowIndex]["ImageSign"].ToString();
        }
    }



    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Loadgrid2();
        GridView grdReport= grdBioMatrix;
        string EventTypeVar = "";


        if (drpEvent.SelectedValue == "1")
        {
             grdReport = grdBioMatrix;
            EventTypeVar="Bio Matrix";
        }

        if (drpEvent.SelectedValue == "2")
        {
            grdReport = grdPM;
            EventTypeVar = "Physical Measurement";
        }

        if (drpEvent.SelectedValue == "3")
        {
            grdReport = grdMedicalFitness;
            EventTypeVar = "Medical Fitness";
        }
        if (drpEvent.SelectedValue == "4")
        {
            grdReport = grdHighJump;
            EventTypeVar = "High Jump";
        }
        if (drpEvent.SelectedValue == "5")
        {
            grdReport = grdBroadJumping;
            EventTypeVar = "Broad Jump";
        }
        if (drpEvent.SelectedValue == "6")
        {
            grdReport = grdRopeclimbing;
            EventTypeVar = "Rope Climbing";
        }
        if (drpEvent.SelectedValue == "7")
        {
            grdReport = grdRunnings;
            EventTypeVar = "Running";
        }
        if (drpEvent.SelectedValue == "8")
        {
            grdReport = grdcrossCountry;
            EventTypeVar = "Cross Country";
        }
        if (drpEvent.SelectedValue == "9")
        {
            grdReport = grdSwimming;
            EventTypeVar = "Swimming";
        }
        if (drpEvent.SelectedValue == "10")
        {
            grdReport = grdDriving;
            EventTypeVar = "Driving";
        }

      




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
        sb.Append("<table BORDER='1' rules='all'   id='grdAttendanceData' style='font-size:14px;width:100%;'>");
        sb.Append(" <tr><td colspan='2' align='center'><h3> <b>Recruitment of Constable in 9th SIRB -2016 - 17 </b></h3><img src='odisha_policelogo.jpg' style='height: 53px; width: 71px' /></td></tr> ");
        sb.Append("<tr><td><b>Event Sheet:</b> - "+ EventTypeVar+ " </td> <td><b> Category :</b> " + category+ " </td></tr>");
        sb.Append("<tr><td> <b>Venue :</b> " + drpCenter.SelectedItem.Text+ "</td><td > <b>Roll No </b>:" + rollNumber + " </td></tr>");
        sb.Append("<tr><td><b> Date :</b> " + Date  + " </td><td></td></tr></table> ");
        sb.Append(style + gridHTML);
        //         sb.Replace("<tr style='page-break-before:always;'>				<td>", @"<tr style='page-break-before:always;'><td><table style='width: 100 %; height: 10 %; border: 1px solid black;'><tr><td></td><td align='right'> Roll No </td></tr> 
        //<tr><td colspan='2' align='center'><h4> Recruitment of Constable in 9th SIRB -2016 - 17 </h4></td></tr> 
        //   <tr><td>Event Sheet: -Physical Measurement </td> <td> Category  </td></tr> 
        //      <tr><td> Venue : </td><td></td></tr>    <tr><td> Date  </td><td></td></tr></table>      ");

         sb.Replace("<tr style='page-break-before:always;'>				<td>", "<tr style='page-break-before:always;'><td><table BORDER='1' rules='all'   id='grdAttendanceData' style='font-size:14px;width:100%;'><tr><td colspan='2' align='center'><h3><b> Recruitment of Constable in 9th SIRB -2016 - 17</b> </h3><img src='odisha_policelogo.jpg' style='height: 53px; width: 71px' /></td></tr></td></tr><tr><td><b>Event Sheet:</b> - " + EventTypeVar + " </td> <td>  <b>Category :</b> " + category + " </td></tr><tr><td><b> Venue :</b> " + drpCenter.SelectedItem.Text + "</td><td ><b> Roll No :</b>" + rollNumber + " </td><td></td></tr><tr><td><b>Date :</b> " + Date + " </td><td></td></tr></table> ");







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

    public void Loadgrid2()
    {
        OISFDALReport obj = new OISFDALReport();


        DataSet ds = obj.GetOISFAppDetails("OP141", drpCenter.SelectedValue.ToString(), drpday.SelectedValue.ToString(), drpRange.SelectedValue, drpEvent.SelectedValue, "", "", "", "", "", "");

        if (ds.Tables[0].Rows.Count > 0)
        {
            if (drpEvent.SelectedValue == "1")
            {
                lblEventSheetType.Text = "Bio Matrix Event Sheet";
                grdBioMatrix.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdBioMatrix.DataBind();


                grdPM.DataSource = null;
                grdPM.DataBind();

                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();

                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();

                grdRunnings.DataSource = null;
                grdRunnings.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();





            }

            else if (drpEvent.SelectedValue == "2")
            {
                lblEventSheetType.Text = "Physical Measurement Event Sheet";
                grdPM.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdPM.DataBind();

                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();


                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();

                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();

                grdRunnings.DataSource = null;
                grdRunnings.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();
            }
            else if (drpEvent.SelectedValue == "3")
            {




                lblEventSheetType.Text = "Medical Fitness  Event Sheet";
                grdMedicalFitness.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdMedicalFitness.DataBind();


                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();

                grdPM.DataSource = null;
                grdPM.DataBind();



                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();

                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();

                grdRunnings.DataSource = null;
                grdRunnings.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();
            }
            else if (drpEvent.SelectedValue == "4")
            {


                lblEventSheetType.Text = "High Jump Event Sheet";
                grdHighJump.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdHighJump.DataBind();



                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();

                grdPM.DataSource = null;
                grdPM.DataBind();

                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();



                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();

                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();

                grdRunnings.DataSource = null;
                grdRunnings.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();
            }



            else if (drpEvent.SelectedValue == "5")
            {


                lblEventSheetType.Text = "Broad Jump Event Sheet";
                grdBroadJumping.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdBroadJumping.DataBind();



                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();

                grdPM.DataSource = null;
                grdPM.DataBind();

                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();

                grdRunnings.DataSource = null;
                grdRunnings.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();
            }
            else if (drpEvent.SelectedValue == "6")
            {


                lblEventSheetType.Text = "Rope Climbing Event Sheet";
                grdRopeclimbing.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdRopeclimbing.DataBind();

                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();

                grdPM.DataSource = null;
                grdPM.DataBind();

                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();



                grdRunnings.DataSource = null;
                grdRunnings.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();
            }
            else if (drpEvent.SelectedValue == "7")
            {


                lblEventSheetType.Text = "Running Event Sheet";
                grdRunnings.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdRunnings.DataBind();



                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();

                grdPM.DataSource = null;
                grdPM.DataBind();

                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();

                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();


                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();
            }
            else if (drpEvent.SelectedValue == "8")
            {



                lblEventSheetType.Text = "Cross Country Event Sheet";
                grdcrossCountry.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdcrossCountry.DataBind();


                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();

                grdPM.DataSource = null;
                grdPM.DataBind();

                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();

                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();

                grdRunnings.DataSource = null;
                grdRunnings.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();



                grdDriving.DataSource = null;
                grdDriving.DataBind();

            }
            else if (drpEvent.SelectedValue == "9")
            {


                lblEventSheetType.Text = "Swimming Event Sheet";
                grdSwimming.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdSwimming.DataBind();


                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();

                grdPM.DataSource = null;
                grdPM.DataBind();

                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();

                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();

                grdRunnings.DataSource = null;
                grdRunnings.DataBind();


                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();

            }
            else if (drpEvent.SelectedValue == "10")
            {


                lblEventSheetType.Text = "Driving Event Sheet";
                grdDriving.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdDriving.DataBind();


                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();

                grdPM.DataSource = null;
                grdPM.DataBind();

                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();

                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();

                grdRunnings.DataSource = null;
                grdRunnings.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();



            }
            else
            {
                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();

                grdPM.DataSource = null;
                grdPM.DataBind();

                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();

                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();

                grdRunnings.DataSource = null;
                grdRunnings.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();
            }

        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "No Data Found !!!", true);
            grdBioMatrix.DataSource = null;
            grdBioMatrix.DataBind();

            grdPM.DataSource = null;
            grdPM.DataBind();

            grdMedicalFitness.DataSource = null;
            grdMedicalFitness.DataBind();


            grdHighJump.DataSource = null;
            grdHighJump.DataBind();

            grdBroadJumping.DataSource = null;
            grdBroadJumping.DataBind();

            grdRopeclimbing.DataSource = null;
            grdRopeclimbing.DataBind();

            grdRunnings.DataSource = null;
            grdRunnings.DataBind();

            grdSwimming.DataSource = null;
            grdSwimming.DataBind();

            grdcrossCountry.DataSource = null;
            grdcrossCountry.DataBind();

            grdDriving.DataSource = null;
            grdDriving.DataBind();

        }


    }

    public void Loadgrid()
    {
        OISFDALReport obj = new OISFDALReport();


        DataSet ds = obj.GetOISFAppDetails("OP14", drpCenter.SelectedValue.ToString(), drpday.SelectedValue.ToString(), drpRange.SelectedValue, drpEvent.SelectedValue, "", "", "", "", "", "");

        if (ds.Tables[0].Rows.Count > 0)
        {
            if (drpEvent.SelectedValue=="1")
            {
                lblEventSheetType.Text = "Bio Matrix Event Sheet";
                grdBioMatrix.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdBioMatrix.DataBind();
 

                grdPM.DataSource = null;
                grdPM.DataBind();

                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();

                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();

                grdRunnings.DataSource = null;
                grdRunnings.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();

                



            }

          else  if (drpEvent.SelectedValue == "2")
            {
                lblEventSheetType.Text = "Physical Measurement Event Sheet";
                grdPM.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdPM.DataBind();

                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();
 

                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();

                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();

                grdRunnings.DataSource = null;
                grdRunnings.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();
            }
           else if (drpEvent.SelectedValue == "3")
            {

                 


                lblEventSheetType.Text = "Medical Fitness  Event Sheet";
                grdMedicalFitness.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdMedicalFitness.DataBind();


                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();

                grdPM.DataSource = null;
                grdPM.DataBind();

               

                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();

                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();

                grdRunnings.DataSource = null;
                grdRunnings.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();
            }
           else if (drpEvent.SelectedValue == "4")
            {


                lblEventSheetType.Text = "High Jump Event Sheet";
                grdHighJump.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdHighJump.DataBind();



                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();

                grdPM.DataSource = null;
                grdPM.DataBind();

                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();

 

                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();

                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();

                grdRunnings.DataSource = null;
                grdRunnings.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();
            }


          
           else if (drpEvent.SelectedValue == "5")
            {


                lblEventSheetType.Text = "Broad Jump Event Sheet";
                grdBroadJumping.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdBroadJumping.DataBind();



                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();

                grdPM.DataSource = null;
                grdPM.DataBind();

                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();
 
                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();

                grdRunnings.DataSource = null;
                grdRunnings.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();
            }
           else if (drpEvent.SelectedValue == "6")
            {


                lblEventSheetType.Text = "Rope Climbing Event Sheet";
                grdRopeclimbing.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdRopeclimbing.DataBind();

                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();

                grdPM.DataSource = null;
                grdPM.DataBind();

                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();

               

                grdRunnings.DataSource = null;
                grdRunnings.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();
            }
           else if (drpEvent.SelectedValue == "7")
            {


                lblEventSheetType.Text = "Running Event Sheet";
                grdRunnings.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdRunnings.DataBind();



                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();

                grdPM.DataSource = null;
                grdPM.DataBind();

                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();

                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();

               
                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();
            }
           else if (drpEvent.SelectedValue == "8")
            {



                lblEventSheetType.Text = "Cross Country Event Sheet";
                grdcrossCountry.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdcrossCountry.DataBind();


                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();

                grdPM.DataSource = null;
                grdPM.DataBind();

                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();

                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();

                grdRunnings.DataSource = null;
                grdRunnings.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

               

                grdDriving.DataSource = null;
                grdDriving.DataBind();

            }
            else if (drpEvent.SelectedValue == "9")
            {


                lblEventSheetType.Text = "Swimming Event Sheet";
                grdSwimming.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdSwimming.DataBind();


                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();

                grdPM.DataSource = null;
                grdPM.DataBind();

                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();

                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();

                grdRunnings.DataSource = null;
                grdRunnings.DataBind();
 

                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();

            }
            else if (drpEvent.SelectedValue == "10")
            {


                lblEventSheetType.Text = "Driving Event Sheet";
                grdDriving.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdDriving.DataBind();


                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();

                grdPM.DataSource = null;
                grdPM.DataBind();

                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();

                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();

                grdRunnings.DataSource = null;
                grdRunnings.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();
 


            }
            else
            {
                grdBioMatrix.DataSource = null;
                grdBioMatrix.DataBind();

                grdPM.DataSource = null;
                grdPM.DataBind();

                grdMedicalFitness.DataSource = null;
                grdMedicalFitness.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJumping.DataSource = null;
                grdBroadJumping.DataBind();

                grdRopeclimbing.DataSource = null;
                grdRopeclimbing.DataBind();

                grdRunnings.DataSource = null;
                grdRunnings.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdcrossCountry.DataSource = null;
                grdcrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();
            }

        }
        else  
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "No Data Found !!!", true);
            grdBioMatrix.DataSource = null;
            grdBioMatrix.DataBind();

            grdPM.DataSource = null;
            grdPM.DataBind();

            grdMedicalFitness.DataSource = null;
            grdMedicalFitness.DataBind();


            grdHighJump.DataSource = null;
            grdHighJump.DataBind();

            grdBroadJumping.DataSource = null;
            grdBroadJumping.DataBind();

            grdRopeclimbing.DataSource = null;
            grdRopeclimbing.DataBind();

            grdRunnings.DataSource = null;
            grdRunnings.DataBind();

            grdSwimming.DataSource = null;
            grdSwimming.DataBind();

            grdcrossCountry.DataSource = null;
            grdcrossCountry.DataBind();

            grdDriving.DataSource = null;
            grdDriving.DataBind();

        }
        

    }

 

    protected void drpRange_SelectedIndexChanged(object sender, EventArgs e)
    {
        Loadgrid();

    }
}
