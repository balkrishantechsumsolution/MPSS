using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CitizenPortalLib.BLL;
using System.Web.UI.HtmlControls;
using System.Text;
using CitizenPortalLib;
using CitizenPortalLib.DataStructs;

namespace CitizenPortal.WebApp.G2G.MarkEntry
{
    public partial class ActivityConfiguration : AdminBasePage
    {
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        List<string> Checked = new List<string>();
        string m_Message = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MenuRole"].ToString() != "University")  {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid User!!", "alert('"+Session["LoginID"].ToString() +" is not a valid user to use this page.');", true);
                return;
            }
            if (!IsPostBack)
            {
                divDetails.Visible = false;
            }
            
        }

        public void LoadGridData(string p_ActionType)
        {
            string LoginID = "";
            int Department;
            string ExamType = "";
            string Activity = "";
            string t_Year = "";
            string Semester = "";
            

            LoginID = Convert.ToString(Session["LoginID"]);
            Department = Convert.ToInt32(Session["Department"].ToString());

            if (ddlActivity.SelectedIndex != 0)
            {
                Activity = ddlActivity.SelectedValue;
            }            
            
            if (ddlSession.SelectedIndex != 0)
            {
                t_Year = ddlSession.SelectedValue;
            }

            if (ddlSemester.SelectedIndex != 0)
            {
                Semester = ddlSemester.SelectedValue;
            }
                        

            DataSet ds = null;
            ds = m_G2GDashboardBLL.GetActivity(LoginID, Semester, Activity, t_Year, hdfActionType.Value);
            
            if (ds.Tables[0].Rows.Count > 0)
            {
                DataGridView.DataSource = ds.Tables[0];
                divDetails.Visible = true;
                divBtn.Visible = true;
            }
            else
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                DataGridView.DataSource = null;
                DataGridView.DataBind();
                divDetails.Visible = false;
                divBtn.Visible = false;
            }
            DataGridView.DataBind();
        }     

        protected void DataGridView_PreRender(object sender, EventArgs e)
        {
            if (DataGridView.Rows.Count > 0)
            {
                DataGridView.UseAccessibleHeader = true;
                DataGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
                DataGridView.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }

        protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {            
            
            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {
                if (hdfActionType.Value == "0")//Search
                {
                    e.Row.Cells[1].Attributes.Add("style", "display:none");
                    e.Row.Cells[1].Enabled = false;
                    e.Row.Cells[2].Enabled = false;
                    e.Row.Cells[3].Enabled = false;
                    e.Row.Cells[4].Enabled = false;
                    e.Row.Cells[5].Enabled = false;
                    e.Row.Cells[6].Enabled = false;
                }
                else if (hdfActionType.Value == "2")//Add
                {
                    //e.Row.Cells[2].Attributes.Add("style", "display:none");
                    //e.Row.Cells[1].Enabled = true; e.Row.Cells[3].Enabled = false;
                }
                else if (hdfActionType.Value == "1")//Edit
                {
                    e.Row.Cells[1].Enabled = true;
                    ////e.Row.Cells[1].Attributes.Add("style", "display:none");
                    //e.Row.Cells[3].Attributes.Add("style", "display:none");
                    //e.Row.Cells[1].Enabled = true;
                    //e.Row.Cells[2].Enabled = false;
                    //e.Row.Cells[5].Enabled = false;
                }

                
                e.Row.Cells[2].Enabled = false;
                e.Row.Cells[3].Enabled = false;
                e.Row.Cells[4].Enabled = false;
                e.Row.Cells[5].Enabled = false;
                e.Row.Cells[6].Enabled = false;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            hdfActionType.Value = "0";
            LoadGridData(hdfActionType.Value);
        }
       
        public string isApproved(string flg, string req4)
        {
            bool isEnable = false;
            string show = "";

            switch (req4.Trim())
            {
                case "U":
                    {
                        if (flg.Trim().Substring(0, 1) == "U" || flg.Trim().Substring(3, 1) == "U" || flg.Trim().Substring(0, 1) == "A" || flg.Trim().Substring(3, 1) == "A")
                        {
                            isEnable = false;
                            show = "submitted";
                        }
                        else
                        {
                            isEnable = true;
                            show = "Not submitted";
                        }
                        break;
                    }
                case "A":
                    {
                        //if (flg.Trim().Substring(0, 1) == "U" || flg.Trim().Substring(3, 1) == "U")
                        //{
                        //    isEnable = true;
                        //    show = "Not approved";
                        //}
                        if (flg.Trim().Substring(0, 1) == "A" || flg.Trim().Substring(3, 1) == "A")
                        {
                            isEnable = false;
                            show = "approved";
                        }
                        else
                        {
                            isEnable = true;
                            show = "Not approved";
                        }
                        break;
                    }
                default:
                    {
                        isEnable = false;
                        show = "";
                        break;
                    }
            }
            //return isEnable;
            return show;
        }

        public bool isAbsent(string marks)
        {
            if (marks.Trim().ToUpper() == "Y")
            { return true; }
            else { return false; }
        }

        public bool isApplicable(string flg, string chk4)
        {
            bool isApply = false;

            switch (chk4.Trim())
            {


                case "int":
                    {
                        if (flg.Trim().Substring(0, 1) == "N")
                        {
                            isApply = true;
                        }
                        else { isApply = false; }

                        break;
                    }               

                default:
                    {
                        isApply = false;
                        break;
                    }
            }
            return isApply;
        }

        void GetSelectedRec()
        {
            if (ViewState["Checked"] != null)
            {
                Checked = (List<string>)ViewState["Checked"];
            }
            foreach (GridViewRow rows in DataGridView.Rows)
            {
                if (rows.Cells[0].Controls.Count > 0 && rows.Cells[1].Controls[1].GetType().FullName.Equals(typeof(CheckBox).FullName))
                {
                    CheckBox chk = rows.Cells[1].Controls[1] as CheckBox;
                    HiddenField RowID = rows.Cells[0].Controls[1] as HiddenField;
                    string t_RowID = RowID.Value;
                    if (chk.Checked == true)
                    {
                        if (!Checked.Contains(t_RowID))
                            Checked.Add(t_RowID);
                    }
                    else
                    {
                        if (Checked.Contains(t_RowID))
                            Checked.Remove(t_RowID);
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string FromDate = "";
            string ToDate = "";

            //FromDate = Convert.ToDateTime(StartDate.Text).ToString("yyyy-MM-dd");
            //ToDate = Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd");

            int t_UpdateCount = 0;
            string t_RowID = GetRecords();

            if (string.IsNullOrEmpty(t_RowID))
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Select Records to continue');", true);
                return;
            }

            string[] t_RowIDArr = t_RowID.Split(',');
            string t_Semester = "";
            string t_Year = "";
            string t_Activity = "";
            bool t_ShowMsg = false;
            string t_Script = "";
            bool t_status = false;
            m_Message = " Record/s updated";
          
            try
            {

                for (int i = 0; i < t_RowIDArr.Length; i++)
                {
                    foreach (GridViewRow rows in DataGridView.Rows)
                    {
                        GridViewRow row = rows as GridViewRow;
                        CheckBox chkenroll = (CheckBox)rows.FindControl("chkRollNo");
                        System.Web.UI.Control ddlSem = row.FindControl("ExamSemester");
                        System.Web.UI.Control ddlYear = row.FindControl("ddlSession");
                        System.Web.UI.Control ddlAct = row.FindControl("Activity");

                        if (chkenroll.Checked)
                        {
                            CheckBox chk = rows.Cells[1].Controls[1] as CheckBox;
                            HiddenField RowID = rows.Cells[0].Controls[1] as HiddenField;
                            string chk_RowID = RowID.Value;
                            
                            if(chk_RowID == t_RowIDArr[i])
                            {
                                HiddenField hfRowID = (HiddenField)rows.FindControl("HdfAppID");
                                if (hdfActionType.Value == "2" || hdfActionType.Value == "1")
                                {
                                    DropDownList ddlS = (DropDownList)ddlSem;
                                    t_Semester = ddlS.SelectedItem.Value;

                                    DropDownList ddlY = (DropDownList)ddlYear;
                                    t_Year = ddlY.SelectedItem.Value;

                                    DropDownList ddlA = (DropDownList)ddlAct;
                                    t_Activity = ddlA.SelectedItem.Value;
                                }
                                                                
                                Label t_txtCreatedOn = (Label)rows.FindControl("CreatedOn");                                

                                TextBox t_txtStartDate = (TextBox)rows.FindControl("txtStartDate");
                                TextBox t_txtEndDate = (TextBox)rows.FindControl("txtEndDate");

                                //Conditation Validation
                                if (t_Activity == "" || t_Activity == "0")
                                {
                                    t_Script = "Please select Semester of the Exam!";
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Activity", "alert('" + t_Script + "');", true);
                                    return;
                                }
                                if (t_Semester == "" || t_Semester == "0")
                                {
                                    t_Script = "Please select Semester!";
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Semester", "alert('" + t_Script + "');", true);
                                    return;
                                }

                                if (t_Year == "" || t_Year == "0")
                                {
                                    t_Script = "Please select Exam Year!";
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Year", "alert('" + t_Script + "');", true);
                                    return;
                                }
                                                                
                                if (t_txtStartDate.Text == "") { t_Script = "Examination Start Date is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Activity Start Date", "alert('" + t_Script + "');", true); return; }
                                if (t_txtEndDate.Text == "") { t_Script = "Examination End Date is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Activity End Date", "alert('" + t_Script + "');", true); return; }
                                                                

                                DateTime StartDate = Convert.ToDateTime(t_txtStartDate.Text);
                                DateTime EndDate = Convert.ToDateTime(t_txtEndDate.Text);
                                                               

                                if (StartDate.CompareTo(EndDate) > 0)
                                {
                                    t_Script = "End Date should be greated then Start Date!";
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Date", "alert('" + t_Script + "');", true);
                                    return;
                                }

                                string[] AFields =
                                {
                                    "RowID"
                                    ,"Activity"
                                    ,"Semester"                                    
                                    ,"ExamYear"
                                    ,"CreatedOn"
                                    ,"CreatedBy"
                                    
                                    ,"StartDate"
                                    ,"EndDate"
                                    
                                    ,"ActionType"

                            };

                                Activity_DT t_Activity_DT = new Activity_DT();

                                t_Activity_DT.RowID = RowID.Value;
                                t_Activity_DT.Activity = t_Activity;
                                t_Activity_DT.CreatedBy = Session["LoginID"].ToString();
                                t_Activity_DT.Semester = t_Semester;
                                t_Activity_DT.ExamYear = t_Year;
                                t_Activity_DT.CreatedOn = t_txtCreatedOn.Text;

                                t_Activity_DT.StartDate = Convert.ToDateTime(t_txtStartDate.Text).ToString("yyyy-MM-dd HH:mm:ss");
                                t_Activity_DT.EndDate = Convert.ToDateTime(t_txtEndDate.Text).ToString("yyyy-MM-dd HH:mm:ss");

                                t_Activity_DT.ActionType = hdfActionType.Value;

                                CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();

                                System.Data.DataTable result = null;
                                string UID = "";

                                result = m_AdmissionFormBLL.InsertActivity(t_Activity_DT, AFields);

                                if (result != null && result.Rows.Count > 0)
                                {
                                    if (result.Rows[0]["Result"].ToString() != "0")
                                    {
                                        t_UpdateCount++;
                                        
                                    }
                                    t_ShowMsg = true;
                                    m_Message = result.Rows[0]["MSGText"].ToString();
                                }

                                break;
                            }

                        }
                    }
                }
                if (t_ShowMsg == true)
                {
                    
                    t_Script = "alert('\"{0}\" {1}');";
                    //if (hdfActionType.Value  != "1")
                    //    m_Message = "Record inserted sucessfully.";
                    hdfActionType.Value = "0";
                    LoadGridData("0");
                    t_Script = string.Format(t_Script, t_UpdateCount, m_Message);
                    
                }


            }
            catch (Exception ee)
            {

                t_status = false;
                m_Message = ee.Message.Replace("\\", "").Replace("\\r\\n", "").Replace(Environment.NewLine, "").Replace("'", "").Replace("\"", "");
                t_Script = "alert('\"{0}\" {1}')";
                t_Script = string.Format(t_Script, "Error " + DataGridView.Rows.Count, m_Message.Replace("\r\n", ""));

                //ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Message", "alert('" + ee.Message.Replace("'", "") + ee.StackTrace.Replace(Environment.NewLine, "<br />") + "')", true);
            }
            finally
            {
                
            }

            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", t_Script, true);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (ddlActivity.SelectedValue == "0" && ddlSemester.SelectedValue == "0" && ddlSession.SelectedValue == "0")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select Activity, Semester & Exam Year to edit record!!!')", true);
                DataGridView.DataSource = null;
                divDetails.Visible = false;
                divBtn.Visible = false;
                return;
            }
            else
            {
                hdfActionType.Value = "2";
                LoadGridData("2");
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (ddlActivity.SelectedValue == "0" && ddlSemester.SelectedValue == "0" && ddlSession.SelectedValue == "0")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select Activity, Semester & Exam Year to edit record!!!')", true);
                DataGridView.DataSource = null;
                divDetails.Visible = false;
                divBtn.Visible = false;
                return;
            }
            else
            {
                hdfActionType.Value = "1";
                LoadGridData("1");
            }
        }
    }
    
}