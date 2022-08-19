using CitizenPortalLib;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G.SU
{
    public partial class FinanceReport : AdminBasePage
    {
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        string LoginID = ""; int checkcount = 0;

        List<string> Checked = new List<string>();

        bool m_DispPanel = false;
        string m_Status = "";
        bool m_DispCheckBox = true;
        string m_ServiceID = "";
        string m_Message = "";
        string id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            int Department;

            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());

            //GenrateRollNoSP
            if (!IsPostBack)
            {
                CollegeList();
                BranchList();
                BindService("132");
                //pnlApproval.Visible = false;
                divApp.Visible = false;
            }
            if (ddlServices.SelectedIndex != 0)
            {
                string Status = "";

                if (ddlStatus.SelectedIndex != 0)
                {
                    Status = ddlStatus.SelectedValue;
                }

                if(Status == "P")
                {
                    m_DispCheckBox = true;
                }
                else
                {
                    m_DispCheckBox = false;
                }


                BindData();
            }
            
        }

        private void BindService(string departmentcode)
        {
            ServicesBLL t_ServicesBLL = new ServicesBLL();
            System.Data.DataTable dtServices = t_ServicesBLL.GetDeptServices(departmentcode);

            ddlServices.DataTextField = "ServiceName";
            ddlServices.DataValueField = "ServiceCode";
            ddlServices.DataSource = dtServices;
            ddlServices.DataBind();

            ddlServices.Items.Insert(0, new ListItem("-Select Services-", "0"));
        }
        
        public void CollegeList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.Get_CollegeList();
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlCollege.DataSource = dt;
                    ddlCollege.DataTextField = "CollegeName";
                    ddlCollege.DataValueField = "CollegeCode";
                    ddlCollege.DataBind();
                    ddlCollege.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void BranchList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetCBCSCourseLists();
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlBranch.DataSource = dt;
                    ddlBranch.DataTextField = "Course";
                    ddlBranch.DataValueField = "BranchCode";
                    ddlBranch.DataBind();
                    ddlBranch.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindData();
        }
                
        public void BindData()
        {
            
            string FromDate = "";
            string ToDate = "";
            string Service = "";
            string District = "";
            string Status = "";

            if (ddlServices.SelectedIndex != 0)
            {
                string t_Service = ddlServices.SelectedValue;
                string[] t_temp = t_Service.Split('_');
                Service = t_temp[0];
            }
            
            if (ddlStatus.SelectedIndex != 0)
            {
                Status = ddlStatus.SelectedValue;
            }
            if (txtFromDate.Text != "" && txtToDate.Text != "")
            {
                FromDate = Convert.ToDateTime(txtFromDate.Text).ToString("yyyy-MM-dd");
                ToDate = Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd");
            }
            
            try
            {
                //grdFin.Columns.Clear();

                DataTable t_DT = new DataTable();
                
                t_DT = m_AdmissionFormBLL.GetFinanceData(LoginID, ddlCollege.SelectedValue, ddlBranch.SelectedValue, Service, FromDate, ToDate, Status, txtAppID.Text.Trim());
                if (t_DT != null && t_DT.Rows.Count > 0)
                {
                    divApp.Visible = true;
                    grdFin.DataSource = t_DT;
                    grdFin.DataBind();
                                        
                }
                else
                {
                    grdFin.Columns.Clear();
                    divApp.Visible = false;
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Not Found','No Record Found For Search Criteria !');", true);
                }
                
            }
            catch (Exception ex)
            {

            }
        }
        
        protected void gvDetail_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Attributes.Add("Style", "text-align:center");
                //e.Row.Cells[12].Attributes.Add("Style", "text-align:center");

                if (m_DispCheckBox)
                    e.Row.Cells[1].Attributes.Add("Style", "Display:none");
                else
                    e.Row.Cells[0].Attributes.Add("Style", "Display:none");

                //if (rbt_Pending.Checked)
                //{
                //    e.Row.Cells[13].Attributes.Add("Style", "Display:none");
                //}

            }
        }

        protected void gvDetail_RowDataBound(object sender, GridViewRowEventArgs e)
        {


            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Controls.Clear();

                CheckBox t_chk = new CheckBox();

                t_chk.ID = e.Row.Cells[1].Text + "_Chk";
                t_chk.Enabled = true;
                if (ViewState["Checked"] != null && ((List<string>)ViewState["Checked"]).Contains(t_chk.ID))
                {
                    t_chk.Checked = true;
                }
                else
                {
                    t_chk.Checked = false;
                }

                if (m_DispCheckBox)
                {
                    e.Row.Cells[0].Controls.Add(t_chk);
                }
            }

            int i = 0;
            HtmlAnchor t_Anchor = null;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //    int t_Column = e.Row.Cells.Count - 1;
                //    e.Row.Cells[t_Column].Controls.Clear();

                //    HtmlAnchor t_Anchor = new HtmlAnchor();
                //    t_Anchor.ID = e.Row.Cells[1].Text + "_lbtn";
                //    t_Anchor.InnerHtml = "View";

                //t_LinkButton.ClientIDMode = ClientIDMode.Static;
                //t_LinkButton.CommandArgument = e.Row.Cells[1].Text;
                //t_LinkButton.CommandName = "ViewReceipt";            
                //t_LinkButton.Enabled = true;

                //t_LinkButton.Command += new CommandEventHandler(t_LinkButton_Command);

                //string t_URL = Page.ResolveUrl("~/Handler/ShowReceipt.ashx");

                //if (rbt_Pending.Checked)
                //{
                //    t_Anchor.Attributes.Add("onclick", "DisplayImage('" + e.Row.Cells[1].Text + "','" + t_URL + "')");
                //    t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                //}
                //else
                //{
                //    t_Anchor.Attributes.Add("onclick", "DisplayImage('" + e.Row.Cells[0].Text + "','" + t_URL + "')");
                //    t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                //}
                //t_LinkButton.Click += new EventHandler(t_LinkButton_Click);

                //if (e.Row.Cells[12].Text != "" && e.Row.Cells[12].Text != null)
                //{
                //    t_LinkButton.Enabled = true;
                //    t_LinkButton.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                //}
                //else
                //{
                //    t_LinkButton.Enabled = false;
                //    t_LinkButton.Attributes.Add("style", "display:none;");
                //}

                // e.Row.Cells[t_Column].Controls.Add(t_Anchor);
                //}
                //t_Anchor = null;

                //-------------------------------//
                /*
                i = e.Row.Cells.Count - 1;

                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "TakeAction_" + e.Row.RowIndex;

                t_Anchor.InnerHtml = "View";

                t_Anchor.Attributes.Add("onclick", "TakeAction('', '" + ddlServices.SelectedItem.Value.Substring(0, 3) + "', '" + e.Row.Cells[1].Text + "')");

                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[i].Controls.Add(t_Anchor);
                e.Row.Cells[i].Attributes.Add("Title", "View");
                e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");

                i++;
                */
            }
            t_Anchor = null;

        }

        protected void gvDetail_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //GetSelectedRec();
            //grdView.PageIndex = e.NewPageIndex;
            //grdView.DataBind();
        }

        protected void grdFin_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            divDetails.Visible = true;
            try
            {
                if (e.CommandName == "Action")
                {

                    var value = e.CommandArgument;
                    //LinkButton lnkid = (LinkButton)Gridview1.FindControl("LinkButton1");
                    DataTable dt = new DataTable();

                    using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
                    {
                        SqlCommand cmd = new SqlCommand();

                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "GetFinanceDetailDataSP";

                        cmd.Parameters.Add("@ServiceID", SqlDbType.VarChar).Value = id;
                        
                        cmd.Connection = con;
                        con.Open();

                        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        dt.Load(rdr);
                        con.Close();

                    }
                    gvDetail.DataSource = dt;
                    gvDetail.DataBind();
                    
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton LnkBtn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)LnkBtn.NamingContainer;
                Label lblRegID = (Label)row.FindControl("SvcID");
                id = lblRegID.Text;
            }
            catch (Exception ex)
            {

            }
        }
    }
}