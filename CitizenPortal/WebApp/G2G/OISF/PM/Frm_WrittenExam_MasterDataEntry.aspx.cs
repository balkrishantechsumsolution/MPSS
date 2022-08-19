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
    public partial class Frm_WrittenExam_MasterDataEntry : BasePage
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



        public void Loadgrid()
        {


            DataSet ds = obj.GetOISFAppDetails("WRB1", drpCenter.SelectedValue.ToString(), drpCampus.SelectedItem.Text, drpHallNo.SelectedItem.Text, drpRange.SelectedValue, "", "", "", "", "", "");

            if (ds.Tables[0].Rows.Count > 0)
            {

                grdBroadSheet.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdBroadSheet.DataBind();
            }
        }

        protected void drpRange_SelectedIndexChanged(object sender, EventArgs e)
        {
            Loadgrid();
        }

        protected void grdBroadSheet_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdBroadSheet.EditIndex = e.NewEditIndex;
            Loadgrid();
        }

        protected void grdBroadSheet_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = (GridViewRow)grdBroadSheet.Rows[e.RowIndex];

            Label lblAPPIDValue = (Label)row.FindControl("lblAPPID");

            TextBox txtEducationalAchievementValue = (TextBox)row.FindControl("txtEducationalAchievement");


            TextBox txtSportAchievementValue = (TextBox)row.FindControl("txtSportAchievement");


            TextBox txtNCCValue = (TextBox)row.FindControl("txtNCC");


            TextBox txtWrittenExamValue = (TextBox)row.FindControl("txtWrittenExam");

            
            bool result=obj.UpdateOISFAppDetails("WRB2", lblAPPIDValue.Text, txtEducationalAchievementValue.Text, txtSportAchievementValue.Text, txtNCCValue.Text, txtWrittenExamValue.Text, "", "", "", "", "" );
            grdBroadSheet.EditIndex = -1;
            if (result)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record Updated Successfully !!!')", true);
            }
            else
            {

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Record Updated !!!')", true);

            }


        }

        protected void grdBroadSheet_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            grdBroadSheet.EditIndex = -1;
            Loadgrid();

        }
    }
}