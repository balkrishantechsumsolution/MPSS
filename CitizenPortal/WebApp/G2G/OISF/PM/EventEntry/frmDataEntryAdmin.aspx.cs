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

namespace CitizenPortal.WebApp.G2G.OISF.PM.EventEntry
{
    public partial class frmDataEntryAdmin : System.Web.UI.Page
    {
        public DataTable dtGlobal = null;
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
                trvenue.Visible = true; //btnSubmit.Visible = true;
            }


            if (Session["LoginID"] == null)
            {


                Response.Redirect("/g2c/forms/index.aspx");
            }
            else
            {
                if (Session["LoginID"].ToString().ToUpper().Contains("GROUNDADMIN"))
                {

                }
                else
                {
                    Response.Redirect("/g2c/forms/index.aspx");
                }
                drpCenter.SelectedValue = Session["LoginID"].ToString().Substring(11, 1);
                drpCenter.Enabled = false;
            }
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

        protected void grdReport_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {


                OISFDALReport obj = new OISFDALReport();
                if (e.CommandName == "SubmitRow1")
                {
                    int index = Convert.ToInt32(e.CommandArgument);


                    GridViewRow row = grdReport.Rows[index];


                    HiddenField hdnAppNo = (HiddenField)row.FindControl("hdnAppNo");
                    TextBox txtHeightValue = (TextBox)row.FindControl("txtHeight");
                    TextBox txtWeightValue = (TextBox)row.FindControl("txtWeight");
                    TextBox txtChestExpValue = (TextBox)row.FindControl("txtChestExp");
                    TextBox txtChestUnExpValue = (TextBox)row.FindControl("txtChestUnExp");
                    TextBox txtRemarksValue = (TextBox)row.FindControl("txtRemarks");


                    Label lblRollNumberValue = (Label)row.FindControl("lblRollNumber");


                    if (txtHeightValue.Text == "" || txtWeightValue.Text == "" || txtChestExpValue.Text == "" || txtChestUnExpValue.Text == "")

                    {

                        if (txtHeightValue.Text.Trim() == "")
                        {

                            txtHeightValue.BackColor = System.Drawing.Color.Red;
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "Please Enter Height", true);
                            throw new Exception("Please Enter Height");
                        }
                        else
                        { txtHeightValue.BackColor = System.Drawing.Color.White; }

                        if (txtWeightValue.Text.Trim() == "")
                        {

                            txtWeightValue.BackColor = System.Drawing.Color.Red;
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "Please Enter Weight", true);

                            throw new Exception("Please Enter Weight");
                        }
                        else
                        { txtWeightValue.BackColor = System.Drawing.Color.White; }

                        if (txtChestExpValue.Text.Trim() == "")
                        {
                            txtChestExpValue.BackColor = System.Drawing.Color.Red;
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "Please Enter  Chest Expandable", true);

                            throw new Exception("Please Enter Chest Expandable");

                        }
                        else
                        { txtChestExpValue.BackColor = System.Drawing.Color.White; }

                        if (txtChestUnExpValue.Text.Trim() == "")
                        {
                            txtChestUnExpValue.BackColor = System.Drawing.Color.Red;
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "Please Enter Chest Un Expandable", true);

                            throw new Exception("Please Enter Un Expandable");

                        }
                        else
                        { txtChestUnExpValue.BackColor = System.Drawing.Color.White; }

                    }
                    else
                    {

                        txtHeightValue.BackColor = System.Drawing.Color.White;

                        txtWeightValue.BackColor = System.Drawing.Color.White;

                        txtChestUnExpValue.BackColor = System.Drawing.Color.White;

                        txtChestExpValue.BackColor = System.Drawing.Color.White;
                        bool result = obj.UpdateOISFAppDetails("OP12", hdnAppNo.Value, lblCategory.Text, txtHeightValue.Text, txtWeightValue.Text, txtChestUnExpValue.Text, txtChestExpValue.Text, "", lblRollNumberValue.Text, "PM", txtRemarksValue.Text);
                        if (result)
                        {


                            DataSet ds = obj.GetOISFAppDetails("OP13", hdnAppNo.Value, "PM", "", "", "", "", "", "", "", "");
                            if (ds.Tables[0].Rows.Count == 1)
                            {


                                CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                                string MobileNo = ds.Tables[0].Rows[0]["mobilenumber"].ToString();
                                string smsText = ds.Tables[0].Rows[0]["SMSText"].ToString();


                                if (MobileNo.Trim() != "")
                                {

                                    test.sendsms(MobileNo, smsText);
                                }
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record Inserted Successfully !!!')", true);
                                LoadGridData();
                            }


                        }
                    }


                }



            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record not Inserted !!!')", true);


            }
        }

        public void LoadGridData()

        {
            OISFDALReport obj = new OISFDALReport();


            DataSet ds = obj.GetOISFAppDetails("OP102", drpCenter.SelectedValue.ToString(), drpday.SelectedValue.ToString(), drpRange.SelectedValue, "", drpEventType.SelectedValue, "", "", "", "", "");




            if (ds.Tables[0].Rows.Count > 0)
            {
                if (drpEventType.SelectedValue == "1")
                {
                    lblEventTypeValue.Text = "Bio Matrix Event Sheet";
                    grdBioMetric.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdBioMetric.DataBind();


                    grdReport.DataSource = null;
                    grdReport.DataBind();

                    grdMedical.DataSource = null;
                    grdMedical.DataBind();


                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();

                    grdRunning.DataSource = null;
                    grdRunning.DataBind();

                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();

                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();

                    grdDriving.DataSource = null;
                    grdDriving.DataBind();





                }

                else if (drpEventType.SelectedValue == "2")
                {
                    lblEventTypeValue.Text = "Physical Measurement Event Sheet";
                    grdReport.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdReport.DataBind();

                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();


                    grdMedical.DataSource = null;
                    grdMedical.DataBind();


                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();

                    grdRunning.DataSource = null;
                    grdRunning.DataBind();

                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();

                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();

                    grdDriving.DataSource = null;
                    grdDriving.DataBind();
                }
                else if (drpEventType.SelectedValue == "3")
                {




                    lblEventTypeValue.Text = "Medical Fitness  Event Sheet";
                    grdMedical.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdMedical.DataBind();


                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();

                    grdReport.DataSource = null;
                    grdReport.DataBind();



                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();

                    grdRunning.DataSource = null;
                    grdRunning.DataBind();

                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();

                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();

                    grdDriving.DataSource = null;
                    grdDriving.DataBind();
                }
                else if (drpEventType.SelectedValue == "4")
                {


                    lblEventTypeValue.Text = "High Jump Event Sheet";
                    grdHighJump.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdHighJump.DataBind();



                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();

                    grdReport.DataSource = null;
                    grdReport.DataBind();

                    grdMedical.DataSource = null;
                    grdMedical.DataBind();



                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();

                    grdRunning.DataSource = null;
                    grdRunning.DataBind();

                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();

                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();

                    grdDriving.DataSource = null;
                    grdDriving.DataBind();
                }



                else if (drpEventType.SelectedValue == "5")
                {


                    lblEventTypeValue.Text = "Broad Jump Event Sheet";
                    grdBroadJump.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdBroadJump.DataBind();



                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();

                    grdReport.DataSource = null;
                    grdReport.DataBind();

                    grdMedical.DataSource = null;
                    grdMedical.DataBind();


                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();

                    grdRunning.DataSource = null;
                    grdRunning.DataBind();

                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();

                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();

                    grdDriving.DataSource = null;
                    grdDriving.DataBind();
                }
                else if (drpEventType.SelectedValue == "6")
                {


                    lblEventTypeValue.Text = "Rope Climbing Event Sheet";
                    grdRopeClimbing.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdRopeClimbing.DataBind();

                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();

                    grdReport.DataSource = null;
                    grdReport.DataBind();

                    grdMedical.DataSource = null;
                    grdMedical.DataBind();


                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();



                    grdRunning.DataSource = null;
                    grdRunning.DataBind();

                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();

                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();

                    grdDriving.DataSource = null;
                    grdDriving.DataBind();
                }
                else if (drpEventType.SelectedValue == "7")
                {


                    lblEventTypeValue.Text = "Running Event Sheet";
                    grdRunning.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdRunning.DataBind();



                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();

                    grdReport.DataSource = null;
                    grdReport.DataBind();

                    grdMedical.DataSource = null;
                    grdMedical.DataBind();


                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();


                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();

                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();

                    grdDriving.DataSource = null;
                    grdDriving.DataBind();
                }
                else if (drpEventType.SelectedValue == "8")
                {



                    lblEventTypeValue.Text = "Cross Country Event Sheet";
                    grdCrossCountry.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdCrossCountry.DataBind();


                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();

                    grdReport.DataSource = null;
                    grdReport.DataBind();

                    grdMedical.DataSource = null;
                    grdMedical.DataBind();


                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();

                    grdRunning.DataSource = null;
                    grdRunning.DataBind();

                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();



                    grdDriving.DataSource = null;
                    grdDriving.DataBind();

                }
                else if (drpEventType.SelectedValue == "9")
                {


                    lblEventTypeValue.Text = "Swimming Event Sheet";
                    grdSwimming.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdSwimming.DataBind();


                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();

                    grdReport.DataSource = null;
                    grdReport.DataBind();

                    grdMedical.DataSource = null;
                    grdMedical.DataBind();


                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();

                    grdRunning.DataSource = null;
                    grdRunning.DataBind();


                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();

                    grdDriving.DataSource = null;
                    grdDriving.DataBind();

                }
                else if (drpEventType.SelectedValue == "10")
                {


                    lblEventTypeValue.Text = "Driving Event Sheet";
                    grdDriving.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdDriving.DataBind();


                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();

                    grdReport.DataSource = null;
                    grdReport.DataBind();

                    grdMedical.DataSource = null;
                    grdMedical.DataBind();


                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();

                    grdRunning.DataSource = null;
                    grdRunning.DataBind();

                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();

                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();



                }
                else
                {
                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();

                    grdReport.DataSource = null;
                    grdReport.DataBind();

                    grdMedical.DataSource = null;
                    grdMedical.DataBind();


                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();

                    grdRunning.DataSource = null;
                    grdRunning.DataBind();

                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();

                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();

                    grdDriving.DataSource = null;
                    grdDriving.DataBind();
                }

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found !!!')", true);
                grdBioMetric.DataSource = null;
                grdBioMetric.DataBind();

                grdReport.DataSource = null;
                grdReport.DataBind();

                grdMedical.DataSource = null;
                grdMedical.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJump.DataSource = null;
                grdBroadJump.DataBind();

                grdRopeClimbing.DataSource = null;
                grdRopeClimbing.DataBind();

                grdRunning.DataSource = null;
                grdRunning.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdCrossCountry.DataSource = null;
                grdCrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();

            }

            grdReport.DataBind();
        }

        protected void grdReport_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdReport.PageIndex = e.NewPageIndex;
            LoadGridData();


        }




        protected void grdReport_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{

            //    int pagesize = grdReport.PageSize;
            //    int pageindex = grdReport.PageIndex;
            //    int ActualRowIndex = (pagesize * pageindex) + e.Row.RowIndex;

            //    System.Web.UI.HtmlControls.HtmlImage img = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("ProfilePhoto");
            //    img.Src = "data:image/png;base64," + dtGlobal.Rows[ActualRowIndex]["ApplicantImageStr"].ToString();


            //    System.Web.UI.HtmlControls.HtmlImage Img11 = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("Img1");
            //    Img11.Src = dtGlobal.Rows[ActualRowIndex]["ImageSign"].ToString();
            //}
        }



        protected void btnSearch_Click(object sender, EventArgs e)
        {
            OISFDALReport obj = new OISFDALReport();


            DataSet ds = obj.GetOISFAppDetails("OP171", drpCenter.SelectedValue, drpday.SelectedValue, drpRange.SelectedValue, txtSearch.Text, drpEventType.SelectedValue, "", "", "", "", "");

            if (ds.Tables[0].Rows.Count > 0)
            {
                if (drpEventType.SelectedValue == "1")
                {
                    lblEventTypeValue.Text = "Bio Matrix Event Sheet";
                    grdBioMetric.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdBioMetric.DataBind();


                    grdReport.DataSource = null;
                    grdReport.DataBind();

                    grdMedical.DataSource = null;
                    grdMedical.DataBind();


                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();

                    grdRunning.DataSource = null;
                    grdRunning.DataBind();

                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();

                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();

                    grdDriving.DataSource = null;
                    grdDriving.DataBind();





                }

                else if (drpEventType.SelectedValue == "2")
                {
                    lblEventTypeValue.Text = "Physical Measurement Event Sheet";
                    grdReport.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdReport.DataBind();

                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();


                    grdMedical.DataSource = null;
                    grdMedical.DataBind();


                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();

                    grdRunning.DataSource = null;
                    grdRunning.DataBind();

                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();

                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();

                    grdDriving.DataSource = null;
                    grdDriving.DataBind();
                }
                else if (drpEventType.SelectedValue == "3")
                {




                    lblEventTypeValue.Text = "Medical Fitness  Event Sheet";
                    grdMedical.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdMedical.DataBind();


                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();

                    grdReport.DataSource = null;
                    grdReport.DataBind();



                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();

                    grdRunning.DataSource = null;
                    grdRunning.DataBind();

                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();

                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();

                    grdDriving.DataSource = null;
                    grdDriving.DataBind();
                }
                else if (drpEventType.SelectedValue == "4")
                {


                    lblEventTypeValue.Text = "High Jump Event Sheet";
                    grdHighJump.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdHighJump.DataBind();



                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();

                    grdReport.DataSource = null;
                    grdReport.DataBind();

                    grdMedical.DataSource = null;
                    grdMedical.DataBind();



                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();

                    grdRunning.DataSource = null;
                    grdRunning.DataBind();

                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();

                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();

                    grdDriving.DataSource = null;
                    grdDriving.DataBind();
                }



                else if (drpEventType.SelectedValue == "5")
                {


                    lblEventTypeValue.Text = "Broad Jump Event Sheet";
                    grdBroadJump.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdBroadJump.DataBind();



                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();

                    grdReport.DataSource = null;
                    grdReport.DataBind();

                    grdMedical.DataSource = null;
                    grdMedical.DataBind();


                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();

                    grdRunning.DataSource = null;
                    grdRunning.DataBind();

                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();

                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();

                    grdDriving.DataSource = null;
                    grdDriving.DataBind();
                }
                else if (drpEventType.SelectedValue == "6")
                {


                    lblEventTypeValue.Text = "Rope Climbing Event Sheet";
                    grdRopeClimbing.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdRopeClimbing.DataBind();

                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();

                    grdReport.DataSource = null;
                    grdReport.DataBind();

                    grdMedical.DataSource = null;
                    grdMedical.DataBind();


                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();



                    grdRunning.DataSource = null;
                    grdRunning.DataBind();

                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();

                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();

                    grdDriving.DataSource = null;
                    grdDriving.DataBind();
                }
                else if (drpEventType.SelectedValue == "7")
                {


                    lblEventTypeValue.Text = "Running Event Sheet";
                    grdRunning.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdRunning.DataBind();



                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();

                    grdReport.DataSource = null;
                    grdReport.DataBind();

                    grdMedical.DataSource = null;
                    grdMedical.DataBind();


                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();


                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();

                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();

                    grdDriving.DataSource = null;
                    grdDriving.DataBind();
                }
                else if (drpEventType.SelectedValue == "8")
                {



                    lblEventTypeValue.Text = "Cross Country Event Sheet";
                    grdCrossCountry.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdCrossCountry.DataBind();


                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();

                    grdReport.DataSource = null;
                    grdReport.DataBind();

                    grdMedical.DataSource = null;
                    grdMedical.DataBind();


                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();

                    grdRunning.DataSource = null;
                    grdRunning.DataBind();

                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();



                    grdDriving.DataSource = null;
                    grdDriving.DataBind();

                }
                else if (drpEventType.SelectedValue == "9")
                {


                    lblEventTypeValue.Text = "Swimming Event Sheet";
                    grdSwimming.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdSwimming.DataBind();


                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();

                    grdReport.DataSource = null;
                    grdReport.DataBind();

                    grdMedical.DataSource = null;
                    grdMedical.DataBind();


                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();

                    grdRunning.DataSource = null;
                    grdRunning.DataBind();


                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();

                    grdDriving.DataSource = null;
                    grdDriving.DataBind();

                }
                else if (drpEventType.SelectedValue == "10")
                {


                    lblEventTypeValue.Text = "Driving Event Sheet";
                    grdDriving.DataSource = ds.Tables[0];
                    dtGlobal = ds.Tables[0];
                    grdDriving.DataBind();


                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();

                    grdReport.DataSource = null;
                    grdReport.DataBind();

                    grdMedical.DataSource = null;
                    grdMedical.DataBind();


                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();

                    grdRunning.DataSource = null;
                    grdRunning.DataBind();

                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();

                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();



                }
                else
                {
                    grdBioMetric.DataSource = null;
                    grdBioMetric.DataBind();

                    grdReport.DataSource = null;
                    grdReport.DataBind();

                    grdMedical.DataSource = null;
                    grdMedical.DataBind();


                    grdHighJump.DataSource = null;
                    grdHighJump.DataBind();

                    grdBroadJump.DataSource = null;
                    grdBroadJump.DataBind();

                    grdRopeClimbing.DataSource = null;
                    grdRopeClimbing.DataBind();

                    grdRunning.DataSource = null;
                    grdRunning.DataBind();

                    grdSwimming.DataSource = null;
                    grdSwimming.DataBind();

                    grdCrossCountry.DataSource = null;
                    grdCrossCountry.DataBind();

                    grdDriving.DataSource = null;
                    grdDriving.DataBind();
                }

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found !!!')", true);
                grdBioMetric.DataSource = null;
                grdBioMetric.DataBind();

                grdReport.DataSource = null;
                grdReport.DataBind();

                grdMedical.DataSource = null;
                grdMedical.DataBind();


                grdHighJump.DataSource = null;
                grdHighJump.DataBind();

                grdBroadJump.DataSource = null;
                grdBroadJump.DataBind();

                grdRopeClimbing.DataSource = null;
                grdRopeClimbing.DataBind();

                grdRunning.DataSource = null;
                grdRunning.DataBind();

                grdSwimming.DataSource = null;
                grdSwimming.DataBind();

                grdCrossCountry.DataSource = null;
                grdCrossCountry.DataBind();

                grdDriving.DataSource = null;
                grdDriving.DataBind();

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {

                OISFDALReport obj = new OISFDALReport();



                int pagesize = grdReport.PageSize;
                int pageindex = grdReport.PageIndex;

                if (grdReport.Rows.Count > 0)
                {

                    foreach (GridViewRow row in grdReport.Rows)
                    {
                        int rowindex = row.RowIndex;

                        int ActualRowIndex = (pagesize * pageindex) + rowindex;
                        int MinRowIndex = (pagesize * pageindex);
                        int MaxRowIndex = (pagesize * pageindex) + 5;

                        if (ActualRowIndex >= MinRowIndex && ActualRowIndex <= MaxRowIndex)
                        {

                            HiddenField hdnAppNo = (HiddenField)row.FindControl("hdnAppNo");
                            TextBox txtHeightValue = (TextBox)row.FindControl("txtHeight");
                            TextBox txtWeightValue = (TextBox)row.FindControl("txtWeight");
                            TextBox txtChestExpValue = (TextBox)row.FindControl("txtChestExp");
                            TextBox txtChestUnExpValue = (TextBox)row.FindControl("txtChestUnExp");

                            Label lblRollNumberValue = (Label)row.FindControl("lblRollNumber");


                            if (txtHeightValue.Text == "" || txtWeightValue.Text == "" || txtChestExpValue.Text == "" || txtChestUnExpValue.Text == "")

                            {



                            }
                            else
                            {
                                bool result = obj.UpdateOISFAppDetails("OP12", hdnAppNo.Value, lblCategory.Text, txtHeightValue.Text, txtWeightValue.Text, txtChestUnExpValue.Text, txtChestExpValue.Text, "", lblRollNumberValue.Text, "", "");
                                if (result)
                                {


                                    DataSet ds = obj.GetOISFAppDetails("OP13", hdnAppNo.Value, "", "", "", "", "", "", "", "", "");
                                    if (ds.Tables[0].Rows.Count == 1)
                                    {

                                    }


                                }

                            }

                        }


                    }
                }
                else if (grdBioMetric.Rows.Count > 0)
                {
                    foreach (GridViewRow row in grdBioMetric.Rows)
                    {
                        int rowindex = row.RowIndex;

                        int ActualRowIndex = (pagesize * pageindex) + rowindex;
                        int MinRowIndex = (pagesize * pageindex);
                        int MaxRowIndex = (pagesize * pageindex) + 5;

                        HiddenField hdnAppNo = (HiddenField)row.FindControl("hdnAppNo");
                        DropDownList drpBioMetrixvalue = (DropDownList)row.FindControl("drpBioMetrix");

                        Label lblRollNumberValue = (Label)row.FindControl("lblRollNumber");

                        bool result = obj.UpdateOISFAppDetails("OP12", hdnAppNo.Value, lblCategory.Text, drpBioMetrixvalue.SelectedValue, "", "", "", "", lblRollNumberValue.Text, "BM", "");
                        if (result)
                        {


                            DataSet ds = obj.GetOISFAppDetails("OP13", hdnAppNo.Value, "BM", "", "", "", "", "", "", "", "");
                            if (ds.Tables[0].Rows.Count == 1)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record Inserted Successfully !!!')", true);
                                LoadGridData();
                            }


                        }


                    }


                }
                else if (grdMedical.Rows.Count > 0)
                {
                    foreach (GridViewRow row in grdMedical.Rows)
                    {
                        int rowindex = row.RowIndex;

                        int ActualRowIndex = (pagesize * pageindex) + rowindex;
                        int MinRowIndex = (pagesize * pageindex);
                        int MaxRowIndex = (pagesize * pageindex) + 5;


                        HiddenField hdnAppNo = (HiddenField)row.FindControl("hdnAppNo");
                        DropDownList drpFitnessvalue = (DropDownList)row.FindControl("drpFitness");


                        Label lblRollNumberValue = (Label)row.FindControl("lblRollNumber");

                        bool result = obj.UpdateOISFAppDetails("OP12", hdnAppNo.Value, lblCategory.Text, drpFitnessvalue.SelectedValue, "", "", "", "", lblRollNumberValue.Text, "MD", "");
                        if (result)
                        {


                            DataSet ds = obj.GetOISFAppDetails("OP13", hdnAppNo.Value, "MD", "", "", "", "", "", "", "", "");
                            if (ds.Tables[0].Rows.Count == 1)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record Inserted Successfully !!!')", true);
                                LoadGridData();
                            }


                        }


                    }





                }








                LoadGridData();
            }
            catch (Exception ex)
            {

                ClientScript.RegisterStartupScript(this.GetType(), "alert", ex.Message, true);
            }
        }

        protected void drpEventType_SelectedIndexChanged(object sender, EventArgs e)
        {

            OISFDALReport obj11 = new OISFDALReport();
            DataSet ds11 = obj11.GetOISFAppDetails("OP16", drpCenter.SelectedValue.ToString(), drpday.SelectedValue.ToString(), drpEventType.SelectedValue, "", "", "", "", "", "", "");

            DataTable dt = ds11.Tables[0];



            lblEventTypeValue.Text = drpEventType.SelectedItem.Text;
            lblVenue.Text = drpCenter.SelectedItem.Text;
            lblDate.Text = dt.Rows[0]["Date"].ToString();
            lblCategory.Text = dt.Rows[0]["category"].ToString();

            LoadGridData();


        }

        protected void grdBioMetric_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                int pagesize = grdBioMetric.PageSize;
                int pageindex = grdBioMetric.PageIndex;
                int ActualRowIndex = (pagesize * pageindex) + e.Row.RowIndex;

                //System.Web.UI.HtmlControls.HtmlImage img = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("ProfilePhoto");
                //img.Src = "data:image/png;base64," + dtGlobal.Rows[ActualRowIndex]["ApplicantImageStr"].ToString();


                //System.Web.UI.HtmlControls.HtmlImage Img11 = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("Img1");
                //Img11.Src = dtGlobal.Rows[ActualRowIndex]["ImageSign"].ToString();

                DropDownList drpBioMatricValue = (DropDownList)e.Row.FindControl("drpBioMetrix");
                drpBioMatricValue.SelectedValue= dtGlobal.Rows[ActualRowIndex]["BioMetrix"].ToString();
            }

        }

        protected void grdMedical_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int pagesize = grdMedical.PageSize;
                int pageindex = grdMedical.PageIndex;
                int ActualRowIndex = (pagesize * pageindex) + e.Row.RowIndex;

                //System.Web.UI.HtmlControls.HtmlImage img = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("ProfilePhoto");
                //img.Src = "data:image/png;base64," + dtGlobal.Rows[ActualRowIndex]["ApplicantImageStr"].ToString();


                //System.Web.UI.HtmlControls.HtmlImage Img11 = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("Img1");
                //Img11.Src = dtGlobal.Rows[ActualRowIndex]["ImageSign"].ToString();


                DropDownList drpBioMatricValue = (DropDownList)e.Row.FindControl("drpFitness");
                drpBioMatricValue.SelectedValue = dtGlobal.Rows[ActualRowIndex]["MedicalFitness"].ToString();
            }

        }

        protected void grdMedical_RowCommand(object sender, GridViewCommandEventArgs e)
        {


            OISFDALReport obj = new OISFDALReport();
            if (e.CommandName == "SubmitRow")
            {
                int index = Convert.ToInt32(e.CommandArgument);


                GridViewRow row = grdMedical.Rows[index];


                HiddenField hdnAppNo = (HiddenField)row.FindControl("hdnAppNo");
                DropDownList drpFitnessvalue = (DropDownList)row.FindControl("drpFitness");
                TextBox txtRemarksvalue = (TextBox)row.FindControl("txtRemarks");



                Label lblRollNumberValue = (Label)row.FindControl("lblRollNumber");

                bool result = obj.UpdateOISFAppDetails("OP12", hdnAppNo.Value, lblCategory.Text, drpFitnessvalue.SelectedValue, "", "", "", "", lblRollNumberValue.Text, "MD", txtRemarksvalue.Text);
                if (result)
                {


                    DataSet ds = obj.GetOISFAppDetails("OP13", hdnAppNo.Value, "MD", "", "", "", "", "", "", "", "");
                    if (ds.Tables[0].Rows.Count == 1)
                    {


                        CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                        string MobileNo = ds.Tables[0].Rows[0]["mobilenumber"].ToString();
                        string smsText = ds.Tables[0].Rows[0]["SMSText"].ToString();


                        if (MobileNo.Trim() != "")
                        {

                            test.sendsms(MobileNo, smsText);
                        }
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record Inserted Successfully !!!')", true);
                        LoadGridData();
                    }


                }


            }

        }

        protected void grdBioMetric_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            OISFDALReport obj = new OISFDALReport();
            if (e.CommandName == "SubmitRow")
            {
                int index = Convert.ToInt32(e.CommandArgument);


                GridViewRow row = grdBioMetric.Rows[index];


                HiddenField hdnAppNo = (HiddenField)row.FindControl("hdnAppNo");
                DropDownList drpBioMetrixvalue = (DropDownList)row.FindControl("drpBioMetrix");
                TextBox txtRemarksvalue = (TextBox)row.FindControl("txtRemarks");
                Label lblRollNumberValue = (Label)row.FindControl("lblRollNumber");

                bool result = obj.UpdateOISFAppDetails("OP12", hdnAppNo.Value, lblCategory.Text, drpBioMetrixvalue.SelectedValue, "", "", "", "", lblRollNumberValue.Text, "BM", txtRemarksvalue.Text);
                if (result)
                {


                    DataSet ds = obj.GetOISFAppDetails("OP13", hdnAppNo.Value, "BM", "", "", "", "", "", "", "", "");
                    if (ds.Tables[0].Rows.Count == 1)
                    {


                        CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                        string MobileNo = ds.Tables[0].Rows[0]["mobilenumber"].ToString();
                        string smsText = ds.Tables[0].Rows[0]["SMSText"].ToString();


                        if (MobileNo.Trim() != "")
                        {

                            test.sendsms(MobileNo, smsText);
                        }


                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record Inserted Successfully !!!')", true);
                        LoadGridData();
                    }


                }


            }

        }

        protected void grdHighJump_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            OISFDALReport obj = new OISFDALReport();
            if (e.CommandName == "SubmitRow")
            {
                int index = Convert.ToInt32(e.CommandArgument);


                GridViewRow row = grdHighJump.Rows[index];


                HiddenField hdnAppNo = (HiddenField)row.FindControl("hdnAppNo");
                DropDownList drpHighjump1value = (DropDownList)row.FindControl("drpHighjump1");
                DropDownList drpHighjump2value = (DropDownList)row.FindControl("drpHighjump2");
                DropDownList drpHighjump3value = (DropDownList)row.FindControl("drpHighjump3");
                TextBox txtRemarksvalue = (TextBox)row.FindControl("txtRemarks");
                Label lblRollNumberValue = (Label)row.FindControl("lblRollNumber");

                if (drpHighjump1value.SelectedValue == "0" && drpHighjump2value.SelectedValue == "0" && drpHighjump3value.SelectedValue == "0")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Select Atleast One chance !!!')", true);
                }
                else
                {

                    bool result = obj.UpdateOISFAppDetails("OP12", hdnAppNo.Value, lblCategory.Text, drpHighjump1value.SelectedValue, drpHighjump2value.SelectedValue, drpHighjump3value.SelectedValue, "", "", lblRollNumberValue.Text, "HJ", txtRemarksvalue.Text);
                    if (result)
                    {


                        DataSet ds = obj.GetOISFAppDetails("OP13", hdnAppNo.Value, "HJ", "", "", "", "", "", "", "", "");
                        if (ds.Tables[0].Rows.Count == 1)
                        {


                            CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                            string MobileNo = ds.Tables[0].Rows[0]["mobilenumber"].ToString();
                            string smsText = ds.Tables[0].Rows[0]["SMSText"].ToString();


                            if (MobileNo.Trim() != "")
                            {

                                test.sendsms(MobileNo, smsText);
                            }
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record Inserted Successfully !!!')", true);
                            LoadGridData();
                        }


                    }
                }


            }

        }

        protected void grdBroadJump_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            OISFDALReport obj = new OISFDALReport();
            if (e.CommandName == "SubmitRow")
            {
                int index = Convert.ToInt32(e.CommandArgument);


                GridViewRow row = grdBroadJump.Rows[index];


                HiddenField hdnAppNo = (HiddenField)row.FindControl("hdnAppNo");
                DropDownList drpdrpBroadjump1value = (DropDownList)row.FindControl("drpBroadjump1");
                DropDownList drpdrpBroadjump2value = (DropDownList)row.FindControl("drpBroadjump2");
                DropDownList drpdrpBroadjump3value = (DropDownList)row.FindControl("drpBroadjump3");
                DropDownList drpdrpBroadjump4value = (DropDownList)row.FindControl("drpBroadjump4");
                TextBox txtRemarksvalue = (TextBox)row.FindControl("txtRemarks");
                Label lblRollNumberValue = (Label)row.FindControl("lblRollNumber");
                if (drpdrpBroadjump1value.SelectedValue == "0" && drpdrpBroadjump2value.SelectedValue == "0" && drpdrpBroadjump3value.SelectedValue == "0" && drpdrpBroadjump4value.SelectedValue == "0")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Select Atleast One chance !!!')", true);
                }
                else
                {
                    bool result = obj.UpdateOISFAppDetails("OP12", hdnAppNo.Value, lblCategory.Text, drpdrpBroadjump1value.SelectedValue, drpdrpBroadjump2value.SelectedValue, drpdrpBroadjump3value.SelectedValue, drpdrpBroadjump4value.SelectedValue, "", lblRollNumberValue.Text, "BJ", txtRemarksvalue.Text);
                    if (result)
                    {


                        DataSet ds = obj.GetOISFAppDetails("OP13", hdnAppNo.Value, "BJ", "", "", "", "", "", "", "", "");
                        if (ds.Tables[0].Rows.Count == 1)
                        {


                            CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                            string MobileNo = ds.Tables[0].Rows[0]["mobilenumber"].ToString();
                            string smsText = ds.Tables[0].Rows[0]["SMSText"].ToString();


                            if (MobileNo.Trim() != "")
                            {

                                test.sendsms(MobileNo, smsText);
                            }
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record Inserted Successfully !!!')", true);
                            LoadGridData();
                        }


                    }
                }

            }
        }

        protected void grdRopeClimbing_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            OISFDALReport obj = new OISFDALReport();
            if (e.CommandName == "SubmitRow")
            {
                int index = Convert.ToInt32(e.CommandArgument);


                GridViewRow row = grdRopeClimbing.Rows[index];


                HiddenField hdnAppNo = (HiddenField)row.FindControl("hdnAppNo");
                DropDownList drpRopeClimbingvalue = (DropDownList)row.FindControl("drpRopeClimbing");

                TextBox txtRemarksvalue = (TextBox)row.FindControl("txtRemarks");
                Label lblRollNumberValue = (Label)row.FindControl("lblRollNumber");
                if (drpRopeClimbingvalue.SelectedValue == "0")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Select Atleast  chance !!!')", true);
                }
                else
                {
                    bool result = obj.UpdateOISFAppDetails("OP12", hdnAppNo.Value, lblCategory.Text, drpRopeClimbingvalue.SelectedValue, "", "", "", "", lblRollNumberValue.Text, "RC", txtRemarksvalue.Text);
                    if (result)
                    {


                        DataSet ds = obj.GetOISFAppDetails("OP13", hdnAppNo.Value, "RC", "", "", "", "", "", "", "", "");
                        if (ds.Tables[0].Rows.Count == 1)
                        {

                            CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                            string MobileNo = ds.Tables[0].Rows[0]["mobilenumber"].ToString();
                            string smsText = ds.Tables[0].Rows[0]["SMSText"].ToString();


                            if (MobileNo.Trim() != "")
                            {

                                test.sendsms(MobileNo, smsText);
                            }
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record Inserted Successfully !!!')", true);
                            LoadGridData();
                        }


                    }
                }


            }
        }

        protected void grdRunning_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            OISFDALReport obj = new OISFDALReport();
            if (e.CommandName == "SubmitRow")
            {
                int index = Convert.ToInt32(e.CommandArgument);


                GridViewRow row = grdRunning.Rows[index];


                HiddenField hdnAppNo = (HiddenField)row.FindControl("hdnAppNo");
                DropDownList drpRunningvalue = (DropDownList)row.FindControl("drpRunning");

                TextBox txtRemarksvalue = (TextBox)row.FindControl("txtRemarks");
                Label lblRollNumberValue = (Label)row.FindControl("lblRollNumber");
                if (drpRunningvalue.SelectedValue == "0")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Select value for Running  !!!')", true);
                }
                else
                {
                    bool result = obj.UpdateOISFAppDetails("OP12", hdnAppNo.Value, lblCategory.Text, drpRunningvalue.SelectedValue, "", "", "", "", lblRollNumberValue.Text, "RN", txtRemarksvalue.Text);
                    if (result)
                    {


                        DataSet ds = obj.GetOISFAppDetails("OP13", hdnAppNo.Value, "RN", "", "", "", "", "", "", "", "");
                        if (ds.Tables[0].Rows.Count == 1)
                        {



                            CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                            string MobileNo = ds.Tables[0].Rows[0]["mobilenumber"].ToString();
                            string smsText = ds.Tables[0].Rows[0]["SMSText"].ToString();


                            if (MobileNo.Trim() != "")
                            {

                                test.sendsms(MobileNo, smsText);
                            }
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record Inserted Successfully !!!')", true);
                            LoadGridData();
                        }


                    }
                }


            }


        }

        protected void grdCrossCountry_RowCommand(object sender, GridViewCommandEventArgs e)
        {


            OISFDALReport obj = new OISFDALReport();
            if (e.CommandName == "SubmitRow")
            {
                int index = Convert.ToInt32(e.CommandArgument);


                GridViewRow row = grdCrossCountry.Rows[index];


                HiddenField hdnAppNo = (HiddenField)row.FindControl("hdnAppNo");
                DropDownList drpCrossCountryvalue = (DropDownList)row.FindControl("drpCrossCountry");

                TextBox txtRemarksvalue = (TextBox)row.FindControl("txtRemarks");
                Label lblRollNumberValue = (Label)row.FindControl("lblRollNumber");
                if (drpCrossCountryvalue.SelectedValue == "0")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Select value for Cross Country  !!!')", true);
                }
                else
                {
                    bool result = obj.UpdateOISFAppDetails("OP12", hdnAppNo.Value, lblCategory.Text, drpCrossCountryvalue.SelectedValue, "", "", "", "", lblRollNumberValue.Text, "CC", txtRemarksvalue.Text);
                    if (result)
                    {


                        DataSet ds = obj.GetOISFAppDetails("OP13", hdnAppNo.Value, "CC", "", "", "", "", "", "", "", "");
                        if (ds.Tables[0].Rows.Count == 1)
                        {

                            CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                            string MobileNo = ds.Tables[0].Rows[0]["mobilenumber"].ToString();
                            string smsText = ds.Tables[0].Rows[0]["SMSText"].ToString();


                            if (MobileNo.Trim() != "")
                            {

                                test.sendsms(MobileNo, smsText);
                            }
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record Inserted Successfully !!!')", true);
                            LoadGridData();
                        }


                    }
                }


            }

        }

        protected void grdSwimming_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            OISFDALReport obj = new OISFDALReport();
            if (e.CommandName == "SubmitRow")
            {
                int index = Convert.ToInt32(e.CommandArgument);


                GridViewRow row = grdSwimming.Rows[index];


                HiddenField hdnAppNo = (HiddenField)row.FindControl("hdnAppNo");
                DropDownList drpSwimmingvalue = (DropDownList)row.FindControl("drpSwimming");

                TextBox txtRemarksvalue = (TextBox)row.FindControl("txtRemarks");
                Label lblRollNumberValue = (Label)row.FindControl("lblRollNumber");
                if (drpSwimmingvalue.SelectedValue == "0")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Select value for Swimming  !!!')", true);
                }
                else
                {
                    bool result = obj.UpdateOISFAppDetails("OP12", hdnAppNo.Value, lblCategory.Text, drpSwimmingvalue.SelectedValue, "", "", "", "", lblRollNumberValue.Text, "SW", txtRemarksvalue.Text);
                    if (result)
                    {


                        DataSet ds = obj.GetOISFAppDetails("OP13", hdnAppNo.Value, "SW", "", "", "", "", "", "", "", "");
                        if (ds.Tables[0].Rows.Count == 1)
                        {

                            CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                            string MobileNo = ds.Tables[0].Rows[0]["mobilenumber"].ToString();
                            string smsText = ds.Tables[0].Rows[0]["SMSText"].ToString();


                            if (MobileNo.Trim() != "")
                            {

                                test.sendsms(MobileNo, smsText);
                            }
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record Inserted Successfully !!!')", true);
                            LoadGridData();
                        }


                    }
                }


            }
        }

        protected void grdDriving_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            OISFDALReport obj = new OISFDALReport();
            if (e.CommandName == "SubmitRow")
            {
                int index = Convert.ToInt32(e.CommandArgument);


                GridViewRow row = grdDriving.Rows[index];


                HiddenField hdnAppNo = (HiddenField)row.FindControl("hdnAppNo");
                DropDownList drpDrivingvalue = (DropDownList)row.FindControl("drpDriving");

                TextBox txtRemarksvalue = (TextBox)row.FindControl("txtRemarks");
                Label lblRollNumberValue = (Label)row.FindControl("lblRollNumber");
                if (drpDrivingvalue.SelectedValue == "0")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Select value for Driving  !!!')", true);
                }
                else
                {
                    bool result = obj.UpdateOISFAppDetails("OP12", hdnAppNo.Value, lblCategory.Text, drpDrivingvalue.SelectedValue, "", "", "", "", lblRollNumberValue.Text, "DR", txtRemarksvalue.Text);
                    if (result)
                    {


                        DataSet ds = obj.GetOISFAppDetails("OP13", hdnAppNo.Value, "DR", "", "", "", "", "", "", "", "");
                        if (ds.Tables[0].Rows.Count == 1)
                        {


                            CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                            string MobileNo = ds.Tables[0].Rows[0]["mobilenumber"].ToString();
                            string smsText = ds.Tables[0].Rows[0]["SMSText"].ToString();


                            if (MobileNo.Trim() != "")
                            {

                                test.sendsms(MobileNo, smsText);
                            }
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record Inserted Successfully !!!')", true);
                            LoadGridData();
                        }


                    }
                }


            }



        }

        protected void grdBioMetric_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdBioMetric.PageIndex = e.NewPageIndex;
            LoadGridData();
        }

        protected void grdMedical_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdMedical.PageIndex = e.NewPageIndex;
            LoadGridData();
        }

        protected void grdHighJump_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdHighJump.PageIndex = e.NewPageIndex;
            LoadGridData();
        }

        protected void grdBroadJump_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdBroadJump.PageIndex = e.NewPageIndex;
            LoadGridData();
        }

        protected void grdRopeClimbing_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdRopeClimbing.PageIndex = e.NewPageIndex;
            LoadGridData();
        }

        protected void grdRunning_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdRunning.PageIndex = e.NewPageIndex;
            LoadGridData();
        }

        protected void grdCrossCountry_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdCrossCountry.PageIndex = e.NewPageIndex;
            LoadGridData();
        }

        protected void grdSwimming_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdSwimming.PageIndex = e.NewPageIndex;
            LoadGridData();
        }

        protected void grdDriving_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdDriving.PageIndex = e.NewPageIndex;
            LoadGridData();

        }

        protected void grdHighJump_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                int pagesize = grdHighJump.PageSize;
                int pageindex = grdHighJump.PageIndex;
                int ActualRowIndex = (pagesize * pageindex) + e.Row.RowIndex;

                //System.Web.UI.HtmlControls.HtmlImage img = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("ProfilePhoto");
                //img.Src = "data:image/png;base64," + dtGlobal.Rows[ActualRowIndex]["ApplicantImageStr"].ToString();


                //System.Web.UI.HtmlControls.HtmlImage Img11 = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("Img1");
                //Img11.Src = dtGlobal.Rows[ActualRowIndex]["ImageSign"].ToString();


                DropDownList firstEventChanceValue = (DropDownList)e.Row.FindControl("drpHighjump1");
                firstEventChanceValue.SelectedValue = dtGlobal.Rows[ActualRowIndex]["firstEventChance"].ToString();

                DropDownList SecondEventChanceValue = (DropDownList)e.Row.FindControl("drpHighjump2");
                SecondEventChanceValue.SelectedValue = dtGlobal.Rows[ActualRowIndex]["SecondEventChance"].ToString();

                DropDownList ThirdEventChanceValue = (DropDownList)e.Row.FindControl("drpHighjump3");
                ThirdEventChanceValue.SelectedValue = dtGlobal.Rows[ActualRowIndex]["ThirdEventChance"].ToString();



                
                

            }
        }

        protected void grdBroadJump_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                int pagesize = grdBroadJump.PageSize;
                int pageindex = grdBroadJump.PageIndex;
                int ActualRowIndex = (pagesize * pageindex) + e.Row.RowIndex;

                //System.Web.UI.HtmlControls.HtmlImage img = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("ProfilePhoto");
                //img.Src = "data:image/png;base64," + dtGlobal.Rows[ActualRowIndex]["ApplicantImageStr"].ToString();


                //System.Web.UI.HtmlControls.HtmlImage Img11 = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("Img1");
                //Img11.Src = dtGlobal.Rows[ActualRowIndex]["ImageSign"].ToString();



                DropDownList firstEventChanceValue = (DropDownList)e.Row.FindControl("drpBroadjump1");
                firstEventChanceValue.SelectedValue = dtGlobal.Rows[ActualRowIndex]["firstEventChance"].ToString();

                DropDownList SecondEventChanceValue = (DropDownList)e.Row.FindControl("drpBroadjump2");
                SecondEventChanceValue.SelectedValue = dtGlobal.Rows[ActualRowIndex]["SecondEventChance"].ToString();

                DropDownList ThirdEventChanceValue = (DropDownList)e.Row.FindControl("drpBroadjump3");
                ThirdEventChanceValue.SelectedValue = dtGlobal.Rows[ActualRowIndex]["ThirdEventChance"].ToString();



                DropDownList ForthEventChanceValue = (DropDownList)e.Row.FindControl("drpBroadjump3");
                ForthEventChanceValue.SelectedValue = dtGlobal.Rows[ActualRowIndex]["ThirdEventChance"].ToString();



            }
        }

        protected void grdRopeClimbing_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                int pagesize = grdRopeClimbing.PageSize;
                int pageindex = grdRopeClimbing.PageIndex;
                int ActualRowIndex = (pagesize * pageindex) + e.Row.RowIndex;

                //System.Web.UI.HtmlControls.HtmlImage img = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("ProfilePhoto");
                //img.Src = "data:image/png;base64," + dtGlobal.Rows[ActualRowIndex]["ApplicantImageStr"].ToString();


                //System.Web.UI.HtmlControls.HtmlImage Img11 = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("Img1");
                //Img11.Src = dtGlobal.Rows[ActualRowIndex]["ImageSign"].ToString();

                DropDownList firstEventChanceValue = (DropDownList)e.Row.FindControl("drpRopeClimbing");
                firstEventChanceValue.SelectedValue = dtGlobal.Rows[ActualRowIndex]["chance"].ToString();
            }
        }

        protected void grdRunning_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                int pagesize = grdRunning.PageSize;
                int pageindex = grdRunning.PageIndex;
                int ActualRowIndex = (pagesize * pageindex) + e.Row.RowIndex;

                //System.Web.UI.HtmlControls.HtmlImage img = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("ProfilePhoto");
                //img.Src = "data:image/png;base64," + dtGlobal.Rows[ActualRowIndex]["ApplicantImageStr"].ToString();


                //System.Web.UI.HtmlControls.HtmlImage Img11 = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("Img1");
                //Img11.Src = dtGlobal.Rows[ActualRowIndex]["ImageSign"].ToString();

                DropDownList firstEventChanceValue = (DropDownList)e.Row.FindControl("drpRunning");
                firstEventChanceValue.SelectedValue = dtGlobal.Rows[ActualRowIndex]["chance"].ToString();


            }
        }

        protected void grdCrossCountry_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                int pagesize = grdCrossCountry.PageSize;
                int pageindex = grdCrossCountry.PageIndex;
                int ActualRowIndex = (pagesize * pageindex) + e.Row.RowIndex;

                //System.Web.UI.HtmlControls.HtmlImage img = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("ProfilePhoto");
                //img.Src = "data:image/png;base64," + dtGlobal.Rows[ActualRowIndex]["ApplicantImageStr"].ToString();


                //System.Web.UI.HtmlControls.HtmlImage Img11 = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("Img1");
                //Img11.Src = dtGlobal.Rows[ActualRowIndex]["ImageSign"].ToString();

                DropDownList firstEventChanceValue = (DropDownList)e.Row.FindControl("drpCrossCountry");
                firstEventChanceValue.SelectedValue = dtGlobal.Rows[ActualRowIndex]["chance"].ToString();
            }

        }

        protected void grdSwimming_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                int pagesize = grdSwimming.PageSize;
                int pageindex = grdSwimming.PageIndex;
                int ActualRowIndex = (pagesize * pageindex) + e.Row.RowIndex;

                //System.Web.UI.HtmlControls.HtmlImage img = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("ProfilePhoto");
                //img.Src = "data:image/png;base64," + dtGlobal.Rows[ActualRowIndex]["ApplicantImageStr"].ToString();


                //System.Web.UI.HtmlControls.HtmlImage Img11 = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("Img1");
                //Img11.Src = dtGlobal.Rows[ActualRowIndex]["ImageSign"].ToString();


                DropDownList firstEventChanceValue = (DropDownList)e.Row.FindControl("drpSwimming");
                firstEventChanceValue.SelectedValue = dtGlobal.Rows[ActualRowIndex]["chance"].ToString();
            }
        }

        protected void grdDriving_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                int pagesize = grdDriving.PageSize;
                int pageindex = grdDriving.PageIndex;
                int ActualRowIndex = (pagesize * pageindex) + e.Row.RowIndex;

                //System.Web.UI.HtmlControls.HtmlImage img = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("ProfilePhoto");
                //img.Src = "data:image/png;base64," + dtGlobal.Rows[ActualRowIndex]["ApplicantImageStr"].ToString();


                //System.Web.UI.HtmlControls.HtmlImage Img11 = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("Img1");
                //Img11.Src = dtGlobal.Rows[ActualRowIndex]["ImageSign"].ToString();



                DropDownList firstEventChanceValue = (DropDownList)e.Row.FindControl("drpDriving");
                firstEventChanceValue.SelectedValue = dtGlobal.Rows[ActualRowIndex]["chance"].ToString();



            }
        }
    }
}