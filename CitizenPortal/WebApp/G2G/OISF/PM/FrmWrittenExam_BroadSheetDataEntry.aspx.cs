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
    public partial class FrmWrittenExam_BroadSheetDataEntry : BasePage
    {
        public DataTable dtGlobal;
        OISFDALReport obj = new OISFDALReport();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                
                
                if(Session["LoginID"]==null)
                {
                    Response.Redirect("/g2c/forms/index.aspx");
                }



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
                Response.Redirect("/g2c/forms/index.aspx");

            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            Loadgrid();

        }


        public void Loadgrid()
        {
            DataSet ds = null;
            if (txtSearchRollnumber.Text.Trim().Length > 0)
            {
                ds = obj.GetOISFAppDetails("WRN3",txtSearchRollnumber.Text,"","","","","","","", "", "");

            }
            else
            { 

              ds = obj.GetOISFAppDetails("WRN2", drpCenter.SelectedValue, drpday.SelectedValue, drpCategory.SelectedValue, drpSropts.SelectedValue, drpNCC.SelectedValue, drpWrittenExamStatus.SelectedValue, DrpFinalStatus.SelectedValue, drpRollnumber.SelectedValue,  "", "");
            }
            if (ds.Tables[0].Rows.Count > 0)
            {

                grdBroadSheet.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdBroadSheet.DataBind();
            }
        }


        protected void grdBroadSheet_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {

           
            if (Session["LoginID"].ToString().ToUpper().Contains("DEPTADMIN")
                    || Session["LoginID"].ToString().ToUpper().Contains("DEPTADMIN2")
                    || Session["LoginID"].ToString().ToUpper().Contains("DEPTADMIN3")
                    || Session["LoginID"].ToString().ToUpper().Contains("DEPTADMIN4")
                    || Session["LoginID"].ToString().ToUpper().Contains("DEPTADMIN5")
                    || Session["LoginID"].ToString().ToUpper().Contains("DEPTADMIN6")
                    )
                {
                
                grdBroadSheet.EditIndex = e.NewEditIndex;
                Loadgrid();
            }
            else
            {

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('This Edit Facility Only available at Department Admin Level Only !!!')", true);
            }
            }
            catch (Exception ex)
            {

            }
        }

        protected void grdBroadSheet_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = (GridViewRow)grdBroadSheet.Rows[e.RowIndex];

            Label lblROLLNOValue = (Label)row.FindControl("lblROLLNO");


            TextBox txtWrittenExamValue = (TextBox)row.FindControl("txtWrittenExam");



            DropDownList drpEducationalAchievementGrdValue = (DropDownList)row.FindControl("drpEducationalAchievementGrd");


            DropDownList DrpFinalStatusGrdValue = (DropDownList)row.FindControl("DrpFinalStatusGrd");



            DropDownList drpSportAchievementGrdValue = (DropDownList)row.FindControl("drpSportAchievementGrd");


            DropDownList drpNCCCertificateGrdValue = (DropDownList)row.FindControl("drpNCCCertificateGrd");

            DropDownList drpCategoryGrdValue = (DropDownList)row.FindControl("drpCategoryGrd");

            DropDownList drpBonusMarksHeigthGrdValue = (DropDownList)row.FindControl("drpBonusMarksHeigthGrd");
            DropDownList drpRunningGrdValue = (DropDownList)row.FindControl("drpRunningGrd");

            DropDownList drpHighJumpGrdValue = (DropDownList)row.FindControl("drpHighJumpGrd");
            DropDownList drpBroadJumpGrdValue = (DropDownList)row.FindControl("drpBroadJumpGrd");

            DropDownList drpRopeClimbingGrdValue = (DropDownList)row.FindControl("drpRopeClimbingGrd");

            DropDownList drpCrossCountryGrdValue = (DropDownList)row.FindControl("drpCrossCountryGrd");

            DropDownList drpDrivingGrdValue = (DropDownList)row.FindControl("drpDrivingGrd");


            TextBox txtName = (TextBox)row.FindControl("txtName");
            TextBox txtFatherName = (TextBox)row.FindControl("txtFatherName");
            TextBox txtDOB = (TextBox)row.FindControl("txtDOB");


            bool result = obj.UpdateOISFAppDetails("WRB2", lblROLLNOValue.Text, txtWrittenExamValue.Text,
                drpEducationalAchievementGrdValue.SelectedValue + drpNCCCertificateGrdValue.SelectedValue,
                DrpFinalStatusGrdValue.SelectedValue, drpSportAchievementGrdValue.SelectedValue,
                drpCategoryGrdValue.SelectedValue,
                drpBonusMarksHeigthGrdValue.SelectedValue + drpHighJumpGrdValue.SelectedValue,
                drpRunningGrdValue.SelectedValue,
                drpBroadJumpGrdValue.SelectedValue + drpRopeClimbingGrdValue.SelectedValue,
                drpCrossCountryGrdValue.SelectedValue + drpDrivingGrdValue.SelectedValue, txtName.Text, txtFatherName.Text, txtDOB.Text, "", "");
            grdBroadSheet.EditIndex = -1;
            if (result)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record Updated Successfully !!!')", true);
            }
            else
            {

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Record Updated !!!')", true);

            }

            Loadgrid();


        }

        protected void grdBroadSheet_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            grdBroadSheet.EditIndex = -1;
            Loadgrid();

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

        protected void grdBroadSheet_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {

                    
                          DropDownList DrpFinalStatusGrdValue = (DropDownList)e.Row.FindControl("DrpFinalStatusGrd");
                    DrpFinalStatusGrdValue.SelectedValue = dtGlobal.Rows[e.Row.RowIndex]["FinalStatus"].ToString();



                    DropDownList drpEducationalAchievementGrdValue = (DropDownList)e.Row.FindControl("drpEducationalAchievementGrd");
                    drpEducationalAchievementGrdValue.SelectedValue = dtGlobal.Rows[e.Row.RowIndex]["EducationalAchievement"].ToString();

                    DropDownList drpSportAchievementGrdValue = (DropDownList)e.Row.FindControl("drpSportAchievementGrd");
                    drpSportAchievementGrdValue.SelectedValue = dtGlobal.Rows[e.Row.RowIndex]["SportAchievementAdd"].ToString();

                    DropDownList drpNCCCertificateGrdValue = (DropDownList)e.Row.FindControl("drpNCCCertificateGrd");
                    drpNCCCertificateGrdValue.SelectedValue = dtGlobal.Rows[e.Row.RowIndex]["NCC"].ToString();


                    DropDownList drpCategoryGrdValue = (DropDownList)e.Row.FindControl("drpCategoryGrd");
                    drpCategoryGrdValue.SelectedValue = dtGlobal.Rows[e.Row.RowIndex]["Category"].ToString();


                    DropDownList drpBonusMarksHeigthGrdValue = (DropDownList)e.Row.FindControl("drpBonusMarksHeigthGrd");
                    drpBonusMarksHeigthGrdValue.SelectedValue = dtGlobal.Rows[e.Row.RowIndex]["BonusHeight"].ToString();



                    DropDownList drpRunningGrdValue = (DropDownList)e.Row.FindControl("drpRunningGrd");
                    drpRunningGrdValue.SelectedValue = dtGlobal.Rows[e.Row.RowIndex]["Running"].ToString();



                    DropDownList drpHighJumpGrdValue = (DropDownList)e.Row.FindControl("drpHighJumpGrd");
                    drpHighJumpGrdValue.SelectedValue = dtGlobal.Rows[e.Row.RowIndex]["HighJump"].ToString();


                    DropDownList drpBroadJumpGrdValue = (DropDownList)e.Row.FindControl("drpBroadJumpGrd");
                    drpBroadJumpGrdValue.SelectedValue = dtGlobal.Rows[e.Row.RowIndex]["Broadjump"].ToString();


                    DropDownList drpRopeClimbingGrdValue = (DropDownList)e.Row.FindControl("drpRopeClimbingGrd");
                    drpRopeClimbingGrdValue.SelectedValue = dtGlobal.Rows[e.Row.RowIndex]["RopeClimbing"].ToString();


                    DropDownList drpCrossCountryGrdValue = (DropDownList)e.Row.FindControl("drpCrossCountryGrd");
                    drpCrossCountryGrdValue.SelectedValue = dtGlobal.Rows[e.Row.RowIndex]["CrossCountry"].ToString();


                    DropDownList drpDrivingGrdValue = (DropDownList)e.Row.FindControl("drpDrivingGrd");
                    drpDrivingGrdValue.SelectedValue = dtGlobal.Rows[e.Row.RowIndex]["Driving"].ToString();
                    
                    
                    




                }

            }



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
    }
}