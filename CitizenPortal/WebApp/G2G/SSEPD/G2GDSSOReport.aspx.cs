using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace CitizenPortal.WebApp.G2G.SSEPD
{
    public partial class G2GDSSOReport : BasePage
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        DataTable dtresult;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "print", "<script>GetDistrict(21);</script>");GetDistrict_OUATSP
                DataSet ds = new DataSet();
                ds = BindDistrict();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddlDistrict.DataSource = ds;
                    ddlDistrict.DataTextField = "DistrictName";
                    ddlDistrict.DataValueField = "DistrictCode";
                    ddlDistrict.DataBind();
                    ddlDistrict.Items.Insert(0, new ListItem("--Select--", "0"));
                }
            }
        }

        protected void grdView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.RowType == DataControlRowType.DataRow
           || e.Row.RowType == DataControlRowType.Header
           || e.Row.RowType == DataControlRowType.Footer)
                {

                    //e.Row.Cells[0].Attributes.Add("style", "display:none");
                   
                }

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt = BindReport();
            if (dt != null && dt.Rows.Count > 0)
            {
                grdView.Visible = true;
                lblTotalRecords.InnerText = Convert.ToString(dt.Rows.Count);
                grdView.DataSource = dt;
                grdView.DataBind();
                lblmsg.Text = "";
                btnExcel.Enabled = true;
            }
            else
            {
                grdView.Visible = false;
                lblTotalRecords.InnerText = "0";
                lblmsg.Text = "No Record Found For Selected Criteria !";
                btnExcel.Enabled = false;
            }
        }

        public DataTable BindReport()
        {
            try
            {
                DataSet ds = new DataSet();

                string FromDate = "";
                string ToDate = "";
                string DistrictCode = "";
                string BlockCode = "";
                string LoginID = "";
                string service = "";
                string Status = "";

                LoginID = Session["LoginID"].ToString();

                if (ddlService.SelectedValue != "")
                {
                    service = ddlService.SelectedValue;
                }

                if (ddlDistrict.SelectedValue != "")
                {
                    DistrictCode = ddlDistrict.SelectedValue;
                }
                if (ddlTaluka.SelectedValue != "")
                {
                    BlockCode = ddlTaluka.SelectedValue;
                }
                if (ddlStatus.SelectedIndex > 0)
                {
                    Status = ddlStatus.SelectedValue;
                }

                if (txtFromDate.Text != "" && txtToDate.Text != "")
                {
                    FromDate = Convert.ToDateTime(txtFromDate.Text).ToString("yyyy-MM-dd");
                    ToDate = Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd");
                }

                dtresult = new DataTable();
                dtresult = m_G2GDashboardBLL.GetG2GReport_DSSO(LoginID, service, DistrictCode, BlockCode, FromDate, ToDate,Status);
               
            }
            catch (Exception ex)
            {

            }
            return dtresult;
        }
        //bind district
        public DataSet BindDistrict()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MasterDB"].ToString());
            // CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();
            SqlCommand cmd = new SqlCommand("GetDistrict_OUATSP", con);
            cmd.Parameters.Add("@StateCode", SqlDbType.Int).Value=21;
            cmd.Parameters.Add("@LangID", SqlDbType.Int).Value=1;
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            try
            {
                con.Open();
                Reader = cmd.ExecuteReader();

                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "DistrictData" });
                con.Close();
                return oDataTable;

            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                    cmd.Dispose();
                }
            }
        }
        public DataSet BindBlock()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MasterDB"].ToString());
            // CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();
            SqlCommand cmd = new SqlCommand("GetBlockSP", con);
            cmd.Parameters.Add("@DistrictCode", SqlDbType.Int).Value = ddlDistrict.SelectedValue;
            cmd.Parameters.Add("@LangID", SqlDbType.Int).Value = 1;
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            try
            {
                con.Open();
                Reader = cmd.ExecuteReader();

                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "BlockData" });
                con.Close();
                return oDataTable;

            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                    cmd.Dispose();
                }
            }
        }

        protected void ddlDistrict_TextChanged(object sender, EventArgs e)
        {
            try
            {
                DataSet ds = new DataSet();
                ds = BindBlock();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddlTaluka.DataSource = ds;
                    ddlTaluka.DataTextField = "blockname";
                    ddlTaluka.DataValueField = "blockcode";
                    ddlTaluka.DataBind();
                    ddlTaluka.Items.Insert(0, new ListItem("--Select--", "0"));
                }

            }
            catch (Exception ex)
            {

            }
        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            try
            {
              
                DataTable dt = BindReport();
                if (dt != null && dt.Rows.Count > 0)
                {
                    //prepare the output stream
                    string delimiter = ",";
                    Response.Clear();
                    Response.ContentType = "text/csv";
                    Response.AppendHeader("Content-Disposition",
                        string.Format("attachment; filename={0}", "DSSO " + DateTime.Now+".csv"));

                    //write the csv column headers
                    for (int i = 0; i < dt.Columns.Count; i++)
                    {
                        Response.Write(dt.Columns[i].ColumnName);
                        Response.Write((i < dt.Columns.Count - 1) ? delimiter : Environment.NewLine);
                    }

                    //write the data
                    foreach (DataRow row in dt.Rows)
                    {
                        for (int i = 0; i < dt.Columns.Count; i++)
                        {
                            Response.Write(row[i].ToString());
                            Response.Write((i < dt.Columns.Count - 1) ? delimiter : Environment.NewLine);
                        }
                    }

                    Response.End();
                }
            }
            catch (Exception ex)
            {

            }
        }   
      
    }
}