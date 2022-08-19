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

namespace CitizenPortal.WebApp.Kiosk.CBCS
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
                CollegeList();
                divTeacher.Visible = false ;
                divBtn.Visible = false;
                
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
        public void GetSubject()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetTeachersSubject();
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlSubject.DataSource = dt;
                    ddlSubject.DataTextField = "SubjectName";
                    ddlSubject.DataValueField = "Code";
                    ddlSubject.DataBind();
                    ddlSubject.Items.Insert(0, new ListItem("Select", "0"));
                    
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
                     "TeacherID"
                    ,"ProfileID"
                    ,"CollegeCode"
                    ,"SubjectCode"
                    ,"SubjectName"
                    ,"TeacherName"
                    ,"DesignationID"
                    ,"Specialization"
                    ,"UnivRegNo"
                    ,"DateOfJoining"
                    ,"Experience"
                    ,"MobileNo"
                    ,"PhoneNo"
                    ,"EmailID"
                    ,"Address"
                    ,"District"
                    ,"Block"
                    ,"Village"
                    ,"PinCode"
                    ,"Remark"
                    ,"CreatedBy"
                    ,"Flag"
                };

                CollegeTeachers_DT t_CollegeTeachers_DT = new CollegeTeachers_DT();

                t_CollegeTeachers_DT.TeacherID = hdnTeacherID.Value;
                t_CollegeTeachers_DT.ProfileID = hdnProfileID.Value;
                t_CollegeTeachers_DT.CollegeCode = ddlCollege.SelectedValue;
                t_CollegeTeachers_DT.SubjectCode = ddlSubject.SelectedValue;
                t_CollegeTeachers_DT.SubjectName = ddlSubject.SelectedItem.Text;
                t_CollegeTeachers_DT.TeacherName = txtTeacher.Text.Trim();
                t_CollegeTeachers_DT.DesignationID = ddlDesignation.SelectedValue;
                t_CollegeTeachers_DT.Specialization = txtSpecilization.Text.Trim();
                t_CollegeTeachers_DT.UnivRegNo = txtRedgNo.Text.Trim();
                t_CollegeTeachers_DT.DateOfJoining = Convert.ToDateTime(DOJ.Text.Trim()).ToString("yyyy-MM-dd"); 
                t_CollegeTeachers_DT.Experience = txtExperiance.Text.Trim();
                t_CollegeTeachers_DT.MobileNo = txtMobile.Text.Trim();
                t_CollegeTeachers_DT.PhoneNo = txtPhone.Text.Trim();
                t_CollegeTeachers_DT.EmailID = txtEmail.Text.Trim();
                t_CollegeTeachers_DT.District = ddlDistrict.SelectedValue;
                t_CollegeTeachers_DT.Block = ddlBlock.SelectedValue;
                t_CollegeTeachers_DT.Village = ddlVillage.SelectedValue;
                t_CollegeTeachers_DT.Address = txtAddress.Text.Trim();
                t_CollegeTeachers_DT.PinCode = txtPin.Text.Trim();
                t_CollegeTeachers_DT.Remark = txtRemark.Text;
                t_CollegeTeachers_DT.CreatedBy = LoginID;
                t_CollegeTeachers_DT.Flag = m_Flag;

                System.Data.DataTable result = null;
                
                result = m_AdmissionFormBLL.InsertCollegeTeachers(t_CollegeTeachers_DT, AFields);

                if (result != null && result.Rows.Count > 0)
                {
                    if (result.Rows[0]["Result"].ToString() == "1")
                    {
                        string t_Message = result.Rows[0]["AlertMsg"].ToString();

                        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message",
                        "alert('" + t_Message + "');location.href='/WebApp/Kiosk/CBCS/TeacherDetails.aspx'", true);
                    }

                    txtTeacher.Text = "";
                    txtRedgNo.Text = "";
                    DOJ.Text = "";
                    txtSpecilization.Text = "";
                    txtMobile.Text = "";
                    txtPhone.Text = "";
                    txtEmail.Text = "";
                    ddlDesignation.SelectedValue = "0";
                    ddlDistrict.SelectedValue = "0";
                    ddlBlock.SelectedValue = "0";
                    ddlVillage.SelectedValue = "0";
                    ddlSubject.SelectedValue = "0";
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
                //e.Row.Cells[j].Text = "Edit";
                //HtmlAnchor t_ViewOutput = null;

                //j = e.Row.Cells.Count - 1;

                //t_ViewOutput = new HtmlAnchor();
                //t_ViewOutput.ID = "View_Output" + e.Row.RowIndex;

                //t_ViewOutput.InnerHtml = "Edit";

                //t_ViewOutput.Attributes.Add("onclick", "StudentHistory('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[j].Text + "')");

                //t_ViewOutput.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                //e.Row.Cells[j].Controls.Add(t_ViewOutput);
                //e.Row.Cells[j].Attributes.Add("Title", "Click to edit the record");
                //e.Row.Cells[j].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");

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
            BindDistrict("21");
            //BindGrid();
            //CollegeList();
            GetSubject();
            GetDesignation();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            m_Flag = "E";
            divTeacher.Visible = false;
            divBtn.Visible = false;
            divGrid.Visible = true;
            BindDistrict("21");
            BindGrid();
            //CollegeList();
            GetSubject();
            GetDesignation();
        }

        protected void grdView_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ProfileID = "";

            ProfileID = grdView.SelectedRow.Cells[20].Text;
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

                ddlCollege.SelectedIndex = ddlCollege.Items.IndexOf(ddlCollege.Items.FindByValue(dt.Rows[0]["CollegeCode"].ToString()));
                ddlSubject.SelectedIndex = ddlSubject.Items.IndexOf(ddlSubject.Items.FindByValue(dt.Rows[0]["SubjectCode"].ToString()));
                ddlDesignation.SelectedIndex = ddlDesignation.Items.IndexOf(ddlDesignation.Items.FindByValue(dt.Rows[0]["DesignationID"].ToString()));

                txtTeacher.Text = dt.Rows[0]["TeacherName"].ToString();
                txtSpecilization.Text = dt.Rows[0]["Specialization"].ToString();
                txtRedgNo.Text = dt.Rows[0]["UnivRegNo"].ToString();
                DOJ.Text = dt.Rows[0]["DateOfJoining"].ToString();
                lbldate.InnerHtml = "Experiance as on " + DateTime.Now.ToString("dd/MM/yyyy");// dt.Rows[0]["CurrentDate"].ToString();
                txtExperiance.Text = dt.Rows[0]["Experience"].ToString(); 
                
                txtMobile.Text = dt.Rows[0]["MobileNo"].ToString();
                txtPhone.Text = dt.Rows[0]["PhoneNo"].ToString();
                txtEmail.Text = dt.Rows[0]["EmailID"].ToString();
                ddlStatus.SelectedIndex = ddlStatus.Items.IndexOf(ddlStatus.Items.FindByValue(dt.Rows[0]["IsActive"].ToString()));

                ddlDistrict.SelectedIndex = ddlDistrict.Items.IndexOf(ddlDistrict.Items.FindByValue(dt.Rows[0]["District"].ToString()));
                BindBlock(ddlDistrict.SelectedValue);
                ddlBlock.SelectedIndex = ddlBlock.Items.IndexOf(ddlBlock.Items.FindByValue(dt.Rows[0]["Block"].ToString()));
                BindVillage(ddlBlock.SelectedValue);
                ddlVillage.SelectedIndex = ddlVillage.Items.IndexOf(ddlVillage.Items.FindByValue(dt.Rows[0]["Village"].ToString()));
                
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
                txtPin.Text = dt.Rows[0]["PinCode"].ToString();
                txtRemark.Text = dt.Rows[0]["Remark"].ToString();
                hdnProfileID.Value = ProfileID;
                hdnTeacherID.Value = dt.Rows[0]["TeacherID"].ToString();
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
