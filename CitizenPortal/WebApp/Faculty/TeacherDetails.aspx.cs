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
    public partial class TeacherDetails : AdminBasePage
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
                    ddlBank.DataSource = dt;
                    ddlBank.DataTextField = "BankName";
                    ddlBank.DataValueField = "BankCode";
                    ddlBank.DataBind();
                    ddlBank.Items.Insert(0, new ListItem("Select", "0"));
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

        public void GetQualification(string QualificationType)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetQualification(QualificationType);
                if (dt != null && dt.Rows.Count > 0)
                {
                    if (QualificationType == "UG")
                    {
                        DataView dv = new DataView(dt);
                        dv.RowFilter = "QualificationType = '" + QualificationType + "'"; 
                        ddlQualGraduation.DataSource = dv.ToTable();
                        ddlQualGraduation.DataTextField = "Qualification";
                        ddlQualGraduation.DataValueField = "QualificationCode";
                        ddlQualGraduation.DataBind();
                        ddlQualGraduation.Items.Insert(0, new ListItem("Select", "0"));
                    }

                    if (QualificationType == "PG")
                    {
                        DataView dv = new DataView(dt);
                        dv.RowFilter = "QualificationType = '" + QualificationType + "'"; 
                        ddlQualPostGraduation.DataSource = dv.ToTable();
                        ddlQualPostGraduation.DataTextField = "Qualification";
                        ddlQualPostGraduation.DataValueField = "QualificationCode";
                        ddlQualPostGraduation.DataBind();
                        ddlQualPostGraduation.Items.Insert(0, new ListItem("Select", "0"));
                    }

                    if (QualificationType == "DOC")
                    {
                        DataView dv = new DataView(dt);
                        dv.RowFilter = "QualificationType = '" + QualificationType + "'";
                        ddlQualDoctorate.DataSource = dv.ToTable();
                        ddlQualDoctorate.DataTextField = "Qualification";
                        ddlQualDoctorate.DataValueField = "QualificationCode";
                        ddlQualDoctorate.DataBind();
                        ddlQualDoctorate.Items.Insert(0, new ListItem("Select", "0"));
                    }
                    
                    if (QualificationType == "PDOC")
                    {
                        DataView dv = new DataView(dt);
                        dv.RowFilter = "QualificationType = '" + QualificationType + "'";
                        ddlQualPostDoctorate.DataSource = dv.ToTable();
                        ddlQualPostDoctorate.DataTextField = "Qualification";
                        ddlQualPostDoctorate.DataValueField = "QualificationCode";
                        ddlQualPostDoctorate.DataBind();
                        ddlQualPostDoctorate.Items.Insert(0, new ListItem("Select", "0"));
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void BindDistrict(string statecode)
        {
            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL();
            System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetDistrictFromState(statecode);

            ddlDistrict.DataTextField = "DistrictName";
            ddlDistrict.DataValueField = "DistrictCode";
            ddlDistrict.DataSource = dtDistrict;
            ddlDistrict.DataBind();

            ddlDistrict.Items.Insert(0, new ListItem("-Select-", "0"));
        }

        private void BindBlock(string districtcode)
        {
            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL();
            System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetBlock_OUAT(districtcode);

            ddlBlock.DataTextField = "Blockname";
            ddlBlock.DataValueField = "Blockcode";
            ddlBlock.DataSource = dtDistrict;
            ddlBlock.DataBind();

            ddlBlock.Items.Insert(0, new ListItem("-Select-", "0"));
            ddlBlock.Focus();
        }

        private void BindVillage(string blockcode)
        {
            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL();
            System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetPanchayat_OUAT(blockcode);

            ddlVillage.DataTextField = "Panchayatname";
            ddlVillage.DataValueField = "PanchayatCode";
            ddlVillage.DataSource = dtDistrict;
            ddlVillage.DataBind();

            ddlVillage.Items.Insert(0, new ListItem("-Select-", "0"));
            ddlVillage.Focus();
        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindBlock(ddlDistrict.SelectedValue);
        }

        protected void ddlBlock_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindVillage(ddlBlock.SelectedValue);
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
            if (txtAccount.Text.Trim() != txtReAccount.Text.Trim())
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Re-enter Account No does not match with Account No.');", true);
                return;
            }

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
                    
                    ,"GraduationQualificationin"
                    ,"PostGraduationQualification"
                    ,"DoctorateQualification"
                    ,"PostDoctorateQualification"
                    
                    ,"ExperianceTotal"
                    ,"ExperianceUG"
                    ,"ExperiancePG"
                    ,"IndustrialExperiance"

                    ,"Address"
                    ,"DistrictCode"
                    ,"BlockCode"
                    ,"VillageCode"
                    ,"PinCode"
                    
                    ,"BankCode"
                    ,"BankName"
                    ,"BankHolderName"
                    ,"AccountNo"
                    ,"BankAddress"
                    ,"BankPinCode"
                    ,"IFISCCode"
                    ,"Remark"
                    ,"IsActive"
                    ,"CreatedBy"
                    ,"Flag"
                };

                t_DOB = Convert.ToDateTime(DOB.Text).ToString("yyyy-MM-dd");
                t_DOJ = Convert.ToDateTime(DOJ.Text).ToString("yyyy-MM-dd");

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
                t_FacultyDetail_DT.GraduationQualificationin = ddlQualGraduation.SelectedValue;
                t_FacultyDetail_DT.PostGraduationQualification = ddlQualPostGraduation.SelectedValue;
                t_FacultyDetail_DT.DoctorateQualification = ddlQualDoctorate.SelectedValue;
                t_FacultyDetail_DT.PostDoctorateQualification = ddlQualPostDoctorate.SelectedValue;
                t_FacultyDetail_DT.ExperianceTotal = txtTotalExperiance.Text;
                t_FacultyDetail_DT.ExperianceUG = txtUGExperiance.Text;
                t_FacultyDetail_DT.ExperiancePG = txtPGExperiance.Text;
                t_FacultyDetail_DT.IndustrialExperiance = txtResExp.Text;
                t_FacultyDetail_DT.Address = txtAddress.Text;
                t_FacultyDetail_DT.DistrictCode = ddlDistrict.SelectedValue;
                t_FacultyDetail_DT.BlockCode = ddlBlock.SelectedValue;
                t_FacultyDetail_DT.VillageCode = ddlVillage.SelectedValue;
                t_FacultyDetail_DT.PinCode = txtPin.Text;
                t_FacultyDetail_DT.BankCode = ddlBank.SelectedValue;
                t_FacultyDetail_DT.BankName = ddlBank.SelectedItem.Text;
                t_FacultyDetail_DT.BankHolderName = txtName.Text;
                t_FacultyDetail_DT.AccountNo = txtReAccount.Text;

                t_FacultyDetail_DT.BankAddress = txtBankAddress.Text;
                t_FacultyDetail_DT.BankPinCode = txtBankPin.Text;
                t_FacultyDetail_DT.IFISCCode = txtIFSCCode.Text;
                t_FacultyDetail_DT.Remark = txtRemark.Text;
                t_FacultyDetail_DT.IsActive = ddlStatus.SelectedValue;
                t_FacultyDetail_DT.CreatedBy = Session["LoginID"].ToString();
                t_FacultyDetail_DT.Flag = m_Flag;

                //t_FacultyDetail_DT.TeacherID = hdnTeacherID.Value;
                //t_FacultyDetail_DT.ProfileID = hdnProfileID.Value;
                //t_FacultyDetail_DT.CollegeCode = ddlCollege.SelectedValue;
                //t_FacultyDetail_DT.SubjectCode = ddlSubject.SelectedValue;
                //t_FacultyDetail_DT.SubjectName = ddlSubject.SelectedItem.Text;
                //t_FacultyDetail_DT.TeacherName = txtFaculty.Text.Trim();
                //t_FacultyDetail_DT.DesignationID = ddlDesignation.SelectedValue;
                //t_FacultyDetail_DT.Specialization = txtSpecilization.Text.Trim();
                //t_FacultyDetail_DT.UnivRegNo = txtRedgNo.Text.Trim();
                //t_FacultyDetail_DT.DateOfJoining = Convert.ToDateTime(DOJ.Text.Trim()).ToString("yyyy-MM-dd"); 
                //t_FacultyDetail_DT.Experience = txtExperiance.Text.Trim();
                //t_FacultyDetail_DT.MobileNo = txtMobile.Text.Trim();
                //t_FacultyDetail_DT.PhoneNo = txtPhone.Text.Trim();
                //t_FacultyDetail_DT.EmailID = txtEmail.Text.Trim();
                //t_FacultyDetail_DT.District = ddlDistrict.SelectedValue;
                //t_FacultyDetail_DT.Block = ddlBlock.SelectedValue;
                //t_FacultyDetail_DT.Village = ddlVillage.SelectedValue;
                //t_FacultyDetail_DT.Address = txtAddress.Text.Trim();
                //t_FacultyDetail_DT.PinCode = txtPin.Text.Trim();
                //t_FacultyDetail_DT.Remark = txtRemark.Text;
                //t_FacultyDetail_DT.CreatedBy = LoginID;
                //t_FacultyDetail_DT.Flag = m_Flag;

                System.Data.DataTable result = null;
                
                result = m_AdmissionFormBLL.InsertFacultyDetail(t_FacultyDetail_DT, AFields);

                if (result != null && result.Rows.Count > 0)
                {
                    if (result.Rows[0]["Result"].ToString() == "1")
                    {
                        string t_Message = result.Rows[0]["AlertMsg"].ToString();

                        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message",
                        "alert('" + t_Message + "');location.href='/WebApp/Faculty/TeacherDetails.aspx'", true);
                    }

                    txtFaculty.Text = "";
                    txtRedgNo.Text = "";
                    DOJ.Text = "";
                    txtSpecilization.Text = "";
                    txtMobile.Text = "";
                    
                    txtEmail.Text = "";
                    ddlDesignation.SelectedValue = "0";
                    ddlDistrict.SelectedValue = "0";
                    ddlBlock.SelectedValue = "0";
                    ddlVillage.SelectedValue = "0";
                    
                    txtAddress.Text = "";

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
            BindDistrict("22");
            GetDepartment();
            GetQualification("UG");
            GetQualification("PG");
            GetQualification("DOC");
            GetQualification("PDOC");
            GetDesignation();
            GetBankName();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            m_Flag = "E";
            divTeacher.Visible = false;
            divBtn.Visible = false;
            divGrid.Visible = true;
            BindDistrict("22");
            BindGrid();
            GetDepartment();
            GetQualification("UG");
            GetQualification("PG");
            GetQualification("DOC");
            GetQualification("PDOC");
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
                ddlQualGraduation.SelectedIndex = ddlQualGraduation.Items.IndexOf(ddlQualGraduation.Items.FindByValue(dt.Rows[0]["GraduationQualificationin"].ToString()));
                ddlQualPostGraduation.SelectedIndex = ddlQualPostGraduation.Items.IndexOf(ddlQualPostGraduation.Items.FindByValue(dt.Rows[0]["PostGraduationQualification"].ToString()));
                ddlQualDoctorate.SelectedIndex = ddlQualDoctorate.Items.IndexOf(ddlQualDoctorate.Items.FindByValue(dt.Rows[0]["DoctorateQualification"].ToString()));
                ddlQualPostDoctorate.SelectedIndex = ddlQualPostDoctorate.Items.IndexOf(ddlQualPostDoctorate.Items.FindByValue(dt.Rows[0]["PostDoctorateQualification"].ToString()));

                txtTotalExperiance.Text = dt.Rows[0]["ExperianceTotal"].ToString();
                txtUGExperiance.Text = dt.Rows[0]["ExperianceUG"].ToString();
                txtPGExperiance.Text = dt.Rows[0]["ExperiancePG"].ToString();
                txtAddress.Text = dt.Rows[0]["Address"].ToString();

                ddlDistrict.SelectedIndex = ddlDistrict.Items.IndexOf(ddlDistrict.Items.FindByValue(dt.Rows[0]["DistrictCode"].ToString()));
                BindBlock(dt.Rows[0]["DistrictCode"].ToString());
                ddlBlock.SelectedIndex = ddlBlock.Items.IndexOf(ddlBlock.Items.FindByValue(dt.Rows[0]["BlockCode"].ToString()));
                BindVillage(dt.Rows[0]["BlockCode"].ToString());
                ddlVillage.SelectedIndex = ddlVillage.Items.IndexOf(ddlVillage.Items.FindByValue(dt.Rows[0]["VillageCode"].ToString()));

                txtPin.Text = dt.Rows[0]["PinCode"].ToString();

                ddlBank.SelectedIndex = ddlBank.Items.IndexOf(ddlBank.Items.FindByValue(dt.Rows[0]["BankCode"].ToString()));
                
                txtName.Text = dt.Rows[0]["BankHolderName"].ToString();
                txtReAccount.Text = dt.Rows[0]["AccountNo"].ToString();
                txtBankAddress.Text = dt.Rows[0]["BankAddress"].ToString();
                txtBankPin.Text = dt.Rows[0]["BankPinCode"].ToString();
                txtIFSCCode.Text = dt.Rows[0]["IFISCCode"].ToString();
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
