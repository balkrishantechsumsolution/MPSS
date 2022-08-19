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

namespace CitizenPortal.WebApp.Faculty
{
    public partial class SpecialFaculty : AdminBasePage
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();

        string LoginID = "";
        int Department;
        string m_Flag = "";
        //string StrKeyField = Guid.NewGuid().ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());
            lbldate.InnerText = "Experience as on " + DateTime.Now.ToString("dd/MM/yyyy");
            //txtExperiance.Text = hdnExperience.Value;
            if (!IsPostBack)
            {
                divSearch.Visible = false;
                CollegeList();
                
                divTeacher.Visible = false ;
                divBtn.Visible = false;
                
            }
        }

        public void GetDepartment()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetDepartment();
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlDepartment.DataSource = dt;
                    ddlDepartment.DataTextField = "DepartmentName";
                    ddlDepartment.DataValueField = "DepartmentCode";
                    ddlDepartment.DataBind();
                    ddlDepartment.Items.Insert(0, new ListItem("Select", "0"));                    
                }
            }
            catch (Exception ex)
            {

            }
        }
        public void GetBankName()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetBankName();
                if (dt != null && dt.Rows.Count > 0)
                {
                    //ddlBank.DataSource = dt;
                    //ddlBank.DataTextField = "BankName";
                    //ddlBank.DataValueField = "BankCode";
                    //ddlBank.DataBind();
                    //ddlBank.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void GetDesignation()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetDesignation();
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlDesignation.DataSource = dt;
                    ddlDesignation.DataTextField = "Designation";
                    ddlDesignation.DataValueField = "DesignationID";
                    ddlDesignation.DataBind();
                    ddlDesignation.Items.Insert(0, new ListItem("Select", "0"));

                }
            }
            catch (Exception ex)
            {

            }
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
                    //if (!Session["LoginID"].ToString().Contains("Admin"))
                    if (Session["menuRole"].ToString() == "College" || Session["menuRole"].ToString() == "Principal")
                    {
                        ddlCollege.SelectedIndex = ddlCollege.Items.IndexOf(ddlCollege.Items.FindByValue(Session["LoginID"].ToString().Substring(0, 3)));
                        ddlCollege.Enabled = false;
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
        
        private void BindGrid()
        {
            DataTable ds = null;
            ds = m_AdmissionFormBLL.GetCollegeTeacher(ddlCollege.SelectedValue);
            divGrid.Visible = true;
            divTeacher.Visible = false;
            if (ds.Rows.Count > 0)
            {
                if (ds.Rows.Count > 0)
                {
                    grdView.DataSource = ds;
                    divSearch.Visible = true;
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                    DataTable dt = null;
                    grdView.DataSource = dt;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                DataTable dt = null;
                grdView.DataSource = dt;
            }
            grdView.DataBind();
        
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
            string t_DOJ = "";
            string t_DOB = "";
            try
            {
                if (btnSubmit.Text == "Update")
                {
                    m_Flag = "E";
                }
                else
                {
                    m_Flag = "A";
                    hdnTeacherID.Value = "";
                }
                string[] AFields =
                {
                     "FacultyID"
                    ,"ProfileID"
                    ,"CollegeCode"
                    ,"DepartmentCode"
                    ,"DepartmentName"                    
                    ,"DesignationID"
                    ,"FacultyName"
                    ,"Gender"
                    ,"DateOfBirth"
                    
                    ,"EvaluatorID"
                    ,"Statue19No"
                    ,"DateofJoining"
                    ,"Specialization"
                    
                    ,"AadharNo"
                    ,"PANNo"
                    ,"MobileNo"
                    ,"PhoneNo"
                    ,"WhatsAppNo"
                    ,"EmailID"
                    ,"FacultyStatus"
                   
                    ,"Remark"
                    ,"IsActive"
                    ,"CreatedBy"
                    ,"Flag"
                };

                if (DOB.Text != null && DOB.Text != "")
                {
                    t_DOB = Convert.ToDateTime(DOB.Text).ToString("yyyy-MM-dd");
                }

                if (DOJ.Text != null && DOJ.Text != "")
                {
                    t_DOJ = Convert.ToDateTime(DOJ.Text).ToString("yyyy-MM-dd");
                }
                FacultyDetail_DT t_FacultyDetail_DT = new FacultyDetail_DT();

                t_FacultyDetail_DT.FacultyID = txtRedgNo.Text;
                t_FacultyDetail_DT.ProfileID = hdnProfileID.Value;
                t_FacultyDetail_DT.CollegeCode = ddlCollege.SelectedValue;
                t_FacultyDetail_DT.DepartmentCode = ddlDepartment.SelectedValue;
                t_FacultyDetail_DT.DepartmentName = ddlDepartment.SelectedItem.Text;
                t_FacultyDetail_DT.DesignationID = ddlDesignation.SelectedValue;
                t_FacultyDetail_DT.FacultyName = txtFaculty.Text;
                t_FacultyDetail_DT.Gender = ddlGender.SelectedValue;
                t_FacultyDetail_DT.DateOfBirth = t_DOB;

                t_FacultyDetail_DT.EvaluatorID = txtEvaluator.Text;
                t_FacultyDetail_DT.Statue19No = ddlStatue.SelectedValue;
                t_FacultyDetail_DT.DateofJoining = t_DOJ;
                t_FacultyDetail_DT.Specialization = txtSpecilization.Text;
                t_FacultyDetail_DT.AadharNo = txtAadhar.Text;
                t_FacultyDetail_DT.PANNo = txtPAN.Text;
                t_FacultyDetail_DT.MobileNo = txtMobile.Text;
                t_FacultyDetail_DT.PhoneNo = null;
                t_FacultyDetail_DT.WhatsAppNo = txtWhatsApp.Text;
                t_FacultyDetail_DT.EmailID = txtEmail.Text;
                t_FacultyDetail_DT.FacultyStatus = ddlStatus.Text;
                
                t_FacultyDetail_DT.Remark = txtRemark.Text;
                t_FacultyDetail_DT.IsActive = ddlStatus.SelectedValue;
                t_FacultyDetail_DT.CreatedBy = Session["LoginID"].ToString();
                t_FacultyDetail_DT.Flag = m_Flag;
                                
                System.Data.DataTable result = null;
                
                result = m_AdmissionFormBLL.InsertFacultyDetail(t_FacultyDetail_DT, AFields);

                if (result != null && result.Rows.Count > 0)
                {
                    if (result.Rows[0]["Result"].ToString() == "1")
                    {
                        string t_Message = result.Rows[0]["AlertMsg"].ToString();

                        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message",
                        "alert('" + t_Message + "');location.href='/WebApp/Faculty/SpecialFaculty.aspx'", true);
                    }

                    txtFaculty.Text = "";
                    txtRedgNo.Text = "";
                    DOJ.Text = "";
                    txtSpecilization.Text = "";
                    txtMobile.Text = "";
                    
                    txtEmail.Text = "";
                    ddlDesignation.SelectedValue = "0";
                    
                    divSearch.Visible = true;
                    divTeacher.Visible = false;
                    divBtn.Visible = false;
                }
                else { ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Unable to Add/Update Record');", true); }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }

        }

        protected void grdView_PreRender(object sender, EventArgs e)
        {
            if (grdView.Rows.Count > 0)
            {
                grdView.UseAccessibleHeader = true;
                grdView.HeaderRow.TableSection = TableRowSection.TableHeader;
                grdView.FooterRow.TableSection = TableRowSection.TableFooter;
            }
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

        protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int j = 0;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
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

                    
                        t_Anchor.Attributes.Add("onclick", "TakeAction('', '', '" + e.Row.Cells[15].Text + "')");
                    
                    t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                    e.Row.Cells[i].Controls.Add(t_Anchor);
                    e.Row.Cells[i].Attributes.Add("Title", "View");
                    e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                    //e.Row.Cells[11].Attributes.Add("style", "display:none");
                    i++;
                }
                t_Anchor = null;

            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {
                if (m_Flag != "E")
                    e.Row.Cells[j].Attributes.Add("style", "display:none");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            divTeacher.Visible = false;
            divBtn.Visible = false;
            BindGrid();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            m_Flag = "A";
            divTeacher.Visible = true;
            divBtn.Visible = true;
            divGrid.Visible = false;
            
            GetDepartment();            
            GetDesignation();
            //GetBankName();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            m_Flag = "E";
            divTeacher.Visible = false;
            divBtn.Visible = false;
            divGrid.Visible = true;
            
            BindGrid();
            GetDepartment();            
            divSearch.Visible = true;
            GetDesignation();
            GetBankName();
        }

        protected void grdView_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ProfileID = "";

            ProfileID = grdView.SelectedRow.Cells[6].Text;
            EditTeachersProfile(ProfileID);
            m_Flag = "E";
            
        }

        protected void grdView_RowCreated(object sender, GridViewRowEventArgs e)
        {
            //string ProfileID = "";
            
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    ProfileID = e.Row.Cells[19].Text;
            //    //e.Row.Cells[1].Attributes.Add("style", "display:none");
            //    //Attach click event to each row in Gridview
            //    e.Row.Cells[e.Row.Cells.Count - 1].Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.grdView, "Select$" + e.Row.RowIndex);
            //    //EditTeachersProfile(ProfileID);
            //}
        }

        private void EditTeachersProfile(string ProfileID)
        {
            DataTable dt = null;
            dt = m_AdmissionFormBLL.EditTeachersProfile(ProfileID);
            
            if (dt.Rows.Count > 0)
            {
                divGrid.Visible = false;
                divTeacher.Visible = true;
                divBtn.Visible = true;

                divSearch.Visible = false;
                divSubject.Visible = false;
                div1.Visible = false;

                
                /*
                txtFaculty.Text = dt.Rows[0]["FacultyName"].ToString();
                txtSpecilization.Text = dt.Rows[0]["Specialization"].ToString();
                txtRedgNo.Text = dt.Rows[0]["FacultyID"].ToString();
                
                
                txtMobile.Text = dt.Rows[0]["MobileNo"].ToString();
                txtPhone.Text = dt.Rows[0]["PhoneNo"].ToString();
                txtEmail.Text = dt.Rows[0]["EmailID"].ToString();
                ddlStatus.SelectedIndex = ddlStatus.Items.IndexOf(ddlStatus.Items.FindByValue(dt.Rows[0]["IsActive"].ToString()));

                ddlDistrict.SelectedIndex = ddlDistrict.Items.IndexOf(ddlDistrict.Items.FindByValue(dt.Rows[0]["DistrictCode"].ToString()));
                BindBlock(dt.Rows[0]["DistrictCode"].ToString());
                ddlBlock.SelectedIndex = ddlBlock.Items.IndexOf(ddlBlock.Items.FindByValue(dt.Rows[0]["BlockCode"].ToString()));
                BindVillage(dt.Rows[0]["BlockCode"].ToString());
                ddlVillage.SelectedIndex = ddlVillage.Items.IndexOf(ddlVillage.Items.FindByValue(dt.Rows[0]["VillageCode"].ToString()));
                
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
                txtPin.Text = dt.Rows[0]["PinCode"].ToString();
                txtRemark.Text = dt.Rows[0]["Remark"].ToString();

                --==========================--*/
                txtRedgNo.Text = dt.Rows[0]["FacultyID"].ToString();
                ddlCollege.SelectedIndex = ddlCollege.Items.IndexOf(ddlCollege.Items.FindByValue(dt.Rows[0]["CollegeCode"].ToString()));
                ddlDepartment.SelectedIndex = ddlDepartment.Items.IndexOf(ddlDepartment.Items.FindByValue(dt.Rows[0]["DepartmentCode"].ToString()));
                                
                ddlDesignation.SelectedIndex = ddlDesignation.Items.IndexOf(ddlDesignation.Items.FindByValue(dt.Rows[0]["DesignationID"].ToString()));
                txtFaculty.Text = dt.Rows[0]["FacultyName"].ToString();
                ddlGender.SelectedIndex = ddlGender.Items.IndexOf(ddlGender.Items.FindByValue(dt.Rows[0]["Gender"].ToString()));
                DOB.Text = dt.Rows[0]["Dateofbirth"].ToString();
                txtEvaluator.Text = dt.Rows[0]["EvaluatorID"].ToString();
                ddlStatue.SelectedIndex = ddlStatue.Items.IndexOf(ddlStatue.Items.FindByValue(dt.Rows[0]["Statue19No"].ToString()));

                DOJ.Text = dt.Rows[0]["DateOfJoining"].ToString();
                lbldate.InnerHtml = "Experiance as on " + DateTime.Now.ToString("dd/MM/yyyy");// dt.Rows[0]["CurrentDate"].ToString();
                txtExperiance.Text = dt.Rows[0]["Experience"].ToString();

                txtSpecilization.Text = dt.Rows[0]["Specialization"].ToString();
                txtAadhar.Text = dt.Rows[0]["AadharNo"].ToString();
                txtPAN.Text = dt.Rows[0]["PANNo"].ToString();
                txtMobile.Text = dt.Rows[0]["MobileNo"].ToString();
                txtWhatsApp.Text = dt.Rows[0]["WhatsAppNo"].ToString();
                txtEmail.Text = dt.Rows[0]["EmailID"].ToString();

                ddlStatus.SelectedIndex = ddlStatus.Items.IndexOf(ddlStatus.Items.FindByValue(dt.Rows[0]["Status"].ToString()));
                
                txtRemark.Text = dt.Rows[0]["Remark"].ToString();
                
                /*--==========================--*/

                hdnProfileID.Value = dt.Rows[0]["ProfileID"].ToString();
                hdnTeacherID.Value = dt.Rows[0]["FacultyID"].ToString();
                hdnFlag.Value = "E";
                m_Flag = "E";
                btnSubmit.Text = "Update";
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                return;
            }                                 

        }
               
    }
}
