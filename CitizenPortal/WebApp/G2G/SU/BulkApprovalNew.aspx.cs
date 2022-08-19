using CitizenPortalLib;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G.SU
{
    public partial class BulkApprovalNew : System.Web.UI.Page
    {
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        string LoginID = ""; int checkcount = 0;

        List<string> Checked = new List<string>();

        bool m_DispPanel = false;
        string m_Status = "";
        bool m_DispCheckBox = true;
        string m_ServiceID = "";
        string m_Message = "";        

        protected void Page_Load(object sender, EventArgs e)
        {
            int Department;
            Session["LoginID"] = "SUSuperAdmin";
            Session["Department"] = "132";

            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());

            //GenrateRollNoSP
            if (!IsPostBack)
            {
                CollegeList();
                BranchList();
                BindService("132");
                pnlApproval.Visible = false;
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
            //BindData();
        }

        protected void BtnSaveRollNo_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    StringBuilder sb = new StringBuilder();
            //    //sb.AppendLine("<?xml version=\"1.0\" ?>");
            //    foreach (GridViewRow row in DataGridView.Rows)
            //    {

            //        string AppID = "";
            //        string RollNo = "";


            //        LoginID = Session["LoginID"].ToString();

            //        AppID = ((HiddenField)row.FindControl("HDFAppID")).Value;
            //        CheckBox ChkItem = (CheckBox)row.FindControl("CheckBox1");
            //        RollNo = ((Label)row.FindControl("lblRollNo")).Text;

            //        if (!ChkItem.Checked)
            //            continue;
            //        sb.AppendLine("<RollNoData>");
            //        sb.AppendLine("<Data>");
            //        sb.AppendLine("<AppID>" + AppID + "</AppID>");
            //        sb.AppendLine("<RollNumber>" + RollNo + "</RollNumber>");
            //        sb.AppendLine("</Data>");
            //        sb.AppendLine("</RollNoData>");

            //        checkcount++;

            //    }
            //    if (sb.Length > 1)
            //    {
            //        DataTable dt = new DataTable();
            //        dt = m_AdmissionFormBLL.Insert_RollNoList(sb.ToString(), LoginID);

            //        if (dt != null && dt.Rows.Count > 0)
            //        {
            //            CitizenPortalLib.EMailSMS SMSServices = new CitizenPortalLib.EMailSMS();
            //            //foreach (DataRow dr in dt.Rows)
            //            //{
            //            ////send to applicant
            //            //if (dr["MobileNo"].ToString() != "")
            //            //{
            //            //    SMSServices.sendsms(dr["MobileNo"].ToString(), dr["SMSText"].ToString());
            //            //}
            //            //}


            //            Data();
            //            //RedirectPageWithMsg(this.Page, URL_t, "Transaction Refund Reference No For this Request is " + RequestNo + " Kindly Note Down for Further Reference");
            //            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Data Save','Roll number save successfully !');", true);

            //        }
            //    }
            //    else
            //    {
            //        if (checkcount == 0)
            //        {
            //            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Checkbox Validate','Please checked atleast one rows !');", true);
            //        }
            //    }
            //}
            //catch (Exception ex)
            //{

            //}
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
                gvDetail.Columns.Clear();

                DataTable t_DT = new DataTable();
                
                t_DT = m_AdmissionFormBLL.GetBulkData(LoginID, ddlCollege.SelectedValue, ddlBranch.SelectedValue, Service, FromDate, ToDate, Status, txtAppID.Text.Trim());
                if (t_DT != null && t_DT.Rows.Count > 0)
                {
                    divApp.Visible = true;

                    BoundField t_BoundField;
                    ButtonField t_ButtonField;

                    if (m_DispCheckBox)
                    {
                        t_BoundField = new BoundField();
                        t_BoundField.HeaderText = "Select";
                        gvDetail.Columns.Add(t_BoundField);
                    }

                    for (int i = 0; i < t_DT.Columns.Count; i++)
                    {
                        t_BoundField = new BoundField();
                        t_BoundField.DataField = t_DT.Columns[i].ColumnName;
                        t_BoundField.SortExpression = t_DT.Columns[i].ColumnName;

                        if (t_DT.Columns[i].DataType.Equals(typeof(int)) ||
                            t_DT.Columns[i].DataType.Equals(typeof(decimal)))
                        {
                            t_BoundField.ItemStyle.CssClass = "tdRT";
                            t_BoundField.HeaderStyle.CssClass = "tdRT";
                        }
                        else
                        {
                            t_BoundField.ItemStyle.CssClass = "tdLT";
                            t_BoundField.HeaderStyle.CssClass = "tdLT";
                        }
                        t_BoundField.HeaderText = t_DT.Columns[i].ColumnName;

                        gvDetail.Columns.Add(t_BoundField);
                    }

                    t_ButtonField = new ButtonField();
                    t_ButtonField.HeaderText = "Detail";
                    gvDetail.Columns.Add(t_ButtonField);

                    gvDetail.DataSource = t_DT;
                    gvDetail.DataBind();

                    if (ddlStatus.SelectedItem.Value == "P")
                    {
                        pnlApproval.Visible = true;
                    }
                    else
                    {
                        pnlApproval.Visible = false;
                    }
                }
                else
                {
                    divApp.Visible = false;
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Not Found','No Record Found For Search Criteria !');", true);
                }
                
            }
            catch (Exception ex)
            {

            }
        }

        //protected void DataGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    try
        //    {
        //        if (e.Row.RowType == DataControlRowType.DataRow)
        //        {

        //            LoginID = Session["LoginID"].ToString();

        //            if (ddlStatus.SelectedItem.Text == "Approved")
        //            {
        //                DataGridView.HeaderRow.Cells[0].Visible = false;
        //                e.Row.Cells[0].Visible = false;


        //            }
        //            else
        //            {
        //                DataGridView.HeaderRow.Cells[0].Visible = true;
        //                e.Row.Cells[0].Visible = true;
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //}

        void GetSelectedRec()
        {
            if (ViewState["Checked"] != null)
            {
                Checked = (List<string>)ViewState["Checked"];
            }
            foreach (GridViewRow rows in gvDetail.Rows)
            {
                if (rows.Cells[0].Controls.Count > 0 && rows.Cells[0].Controls[0].GetType().FullName.Equals(typeof(CheckBox).FullName))
                {
                    CheckBox chk = rows.Cells[0].Controls[0] as CheckBox;
                    if (chk.Checked == true)
                    {
                        if (!Checked.Contains(chk.ID))
                            Checked.Add(chk.ID);
                    }
                    else
                    {
                        if (Checked.Contains(chk.ID))
                            Checked.Remove(chk.ID);
                    }
                }
            }
            ViewState.Remove("Checked");
            ViewState["Checked"] = Checked;
        }

        string GetRecords()
        {
            GetSelectedRec();
            string t_RowID = "";
            if (ViewState["Checked"] != null)
            {
                Checked = (List<string>)ViewState["Checked"];
                int t_itemcount = Checked.Count;
                if (t_itemcount == 0)
                {
                    //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "PageScript", "alert('Please Select a Record');", true);
                    return "";
                }
                for (int i = 0; i < t_itemcount; i++)
                {
                    if (i > 0)
                        t_RowID = t_RowID + ",";

                    t_RowID += Checked[i].Split('_')[0];
                }
                Checked.Clear();
                ViewState["Checked"] = Checked;
                return t_RowID;
            }
            return "";
        }


        DataControlFieldCell GetCellByName(GridViewRow Row, String CellName)
        {
            foreach (DataControlFieldCell Cell in Row.Cells)
            {
                if (Cell.ContainingField.ToString() == CellName)
                    return Cell;
            }
            return null;
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
            }
            t_Anchor = null;

        }

        protected void gvDetail_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //GetSelectedRec();
            //grdView.PageIndex = e.NewPageIndex;
            //grdView.DataBind();
        }


        protected void btn_Submit_Click(object sender, EventArgs e)
        {

            string t_MailBody = "", m_Message;
            string KeyField = Guid.NewGuid().ToString();

            string t_RowID = GetRecords();

            if (string.IsNullOrEmpty(t_RowID))
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Select Records to continue');", true);
                return;
            }

            string t_Status = "R";
            m_Message = "Rejected";
            string t_Script = "";
            string t_Kiosks = "";

            if (rbt_Approve.Checked)
            {
                t_Status = "A";
                m_Message = "Approved";
            }

            string[] t_RowIDArr = t_RowID.Split(',');

            string Comment = txt_Remarks.Text.Replace("'", "''");

            for (int i = 0; i < t_RowIDArr.Length; i++)
            {

                string[] AFields =
                {
                     "AppID"
                    , "RowID"
                    , "CreatedBy"
                    , "KeyField"
                    , "Action"
                    , "Remarks"
                };

                Admission_DT objAdmission_DT = new Admission_DT();
                objAdmission_DT.KeyField = KeyField;
                objAdmission_DT.CreatedBy = LoginID;
                objAdmission_DT.Action = t_Status;
                objAdmission_DT.RowID = t_RowIDArr[i];
                objAdmission_DT.Remarks = Comment;



                DataTable t_DT = null;
                t_DT = m_AdmissionFormBLL.SubmitG2GAdmissionData(objAdmission_DT, AFields);

                if (t_DT != null && t_DT.Rows[0]["Result"].ToString() == "1")
                {
                    CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                    string MobileNo = t_DT.Rows[0]["Mobile"].ToString();
                    string MailID = t_DT.Rows[0]["EMailID"].ToString();
                    string ProfileID = "";

                    if (MobileNo != "")
                    {
                        string smsText = t_DT.Rows[0]["smsText"].ToString();
                        
                        test.sendsms(MobileNo, smsText);
                    }

                    if (MailID != "")
                    {
                        string mailText = t_DT.Rows[0]["MailText"].ToString();
                        string bcc = t_DT.Rows[0]["Bcc"].ToString();
                        string mailSubject = t_DT.Rows[0]["MailSubject"].ToString();
                    
                        try
                        {
                            CommonUtility.SendEmailWithAttachment(m_ServiceID, "", "", MailID, null, bcc,
                                mailSubject, mailText, true, null);
                        }
                        catch
                        {

                        }


                    }
                }

            }

            //t_Script = "alert('\"{0}\" {1}');location.href='TopUpApproval.aspx?Unq=" + Session["sUNQ"].ToString() + "&ServiceID=" + Request.QueryString["ServiceId"].ToString() + "';";
            //t_Script = "alert('\"{0}\" {1}');location.href='/WebApp/Kiosk/SOMultiple.aspx?KF=" + KeyField + "';";
            t_Script = "alert('\"{0}\" {1}');";
            t_Script = string.Format(t_Script, t_RowIDArr.Length, m_Message);

            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", t_Script, true);
            BindData();
        }

        
    }
}