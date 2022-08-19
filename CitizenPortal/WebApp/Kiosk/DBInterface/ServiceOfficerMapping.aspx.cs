using System;
using System.Data;
using CitizenPortalLib.BLL;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.DBInterface
{
    public partial class ServiceOfficerMapping : System.Web.UI.Page
    {
        ServicesBLL ob = new ServicesBLL();
        private string m_CreatedBy = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            m_CreatedBy = Session["LoginID"].ToString();
            //m_CreatedBy = "mohan.kumar";
            if (!IsPostBack)
            {
                bindServices();
              
                txtTimeLimit.Text = "";
                btnSubmit.Visible = true;
                btnEdit.Visible = false;
                btnCancel.Visible = false;
                blank();
                txtRevisionalOffice.Visible = false;

                ddlRevisionOfficerName.Visible = true;
                ddlAppellateOfficer.Visible = true;
                ddlDesignatedOfficer.Visible = true;
                txtAppellateOffice.Visible = false;
                txtDesignatedOffice.Visible = false;
                //
                btnAddRevisional.Visible = true;
                btnAddDesignated.Visible = true;
                btnAddAppellate.Visible = true;
                btnResetForAppellate.Visible = false;
                btnResetForDesignated.Visible = false;
                btnReset.Visible = false;
                ddlDepartment.Enabled = false;
                //if (ddlRevisionOfficerName.SelectedValue=="0" && ddlAppellateOfficer.SelectedValue == "0" && ddlDesignatedOfficer.SelectedValue == "0")
                //{
                //    ddlServices.SelectedValue = "0";
                //    ddlServices.SelectedValue = "0";
                //}
                //else
                //{ }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string value = hdCommand.Value;
            string districtCode = hdnDistrictCode.Value;
                if (value == "Ins")
                {
                   
                    ob.ServiceOfficerMapping(ddlServices.SelectedValue, ddlDepartment.SelectedValue,
                      
                        txtDesignatedOffice.Text, txtDesignatedOfficeAddress.Text, txtDesignatedEmailID.Text,
                        txtDesignatedMobileNo.Text,
                        
                        txtAppellateOffice.Text, txtAppellateOfficeAddress.Text, txtAppellateEmailID.Text,
                        txtAppellateMobileNo.Text,
                     
                        txtRevisionalOffice.Text, txtRevisionalOfficeAddress.Text, txtRevisionalEmailID.Text,
                        txtRevisionalMobileNo.Text,
                        txtTimeLimit.Text, "9", ddlDistrict.SelectedValue, m_CreatedBy);
                    bindServices();
                    bindDepartment();

                    btnSubmit.Visible = true;
                    blank();
                    txtTimeLimit.Text = "";
                    btnAddRevisional.Visible = true;
                    btnAddDesignated.Visible = true;
                    btnAddAppellate.Visible = true;
                    btnResetForAppellate.Visible = false;
                    btnResetForDesignated.Visible = false;
                    btnReset.Visible = false;
                }
                if (value == "Update")
                {
                   
                    ob.ServiceOfficerMapping(ddlServices.SelectedValue, ddlDepartment.SelectedValue,
                        // txtDesignatedOfficer.Text, 
                        txtDesignatedOffice.Text, txtDesignatedOfficeAddress.Text, txtDesignatedEmailID.Text,
                        txtDesignatedMobileNo.Text,
                        //txtAppellateAuthority.Text, 
                        txtAppellateOffice.Text, txtAppellateOfficeAddress.Text, txtAppellateEmailID.Text,
                        txtAppellateMobileNo.Text,
                        // txtRevisionalAuthority.Text,
                        txtRevisionalOffice.Text, txtRevisionalOfficeAddress.Text, txtRevisionalEmailID.Text,
                        txtRevisionalMobileNo.Text,
                        txtTimeLimit.Text, "9", ddlDistrict.SelectedValue, m_CreatedBy);

                    bindServices();
                    bindDepartment();

                    btnSubmit.Visible = true;
                    blank();
                    txtTimeLimit.Text = "";

                    btnAddRevisional.Visible = true;
                    btnAddDesignated.Visible = true;
                    btnAddAppellate.Visible = true;
                    btnResetForAppellate.Visible = false;
                    btnResetForDesignated.Visible = false;
                    btnReset.Visible = false;
                }
            }
        
      

        protected void ddlServices_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnAddAppellate.Visible = true;
            btnAddDesignated.Visible = true;
            DataSet ds = null;
            ds = ob.ServiceOfficerMapping(ddlServices.SelectedValue, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "1", ddlDistrict.SelectedValue, m_CreatedBy);
            
            if (ddlServices.SelectedValue != "0")
            {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
                ddlDepartment.SelectedValue = ds.Tables[0].Rows[0]["DepartmentID"].ToString();
                ddlDepartment.Enabled = false;  

            }
            else
            {
                ddlDepartment.DataSource = ds.Tables[0];
                ddlDepartment.DataTextField = "DepartmentName";
                ddlDepartment.DataValueField = "DepartmentId";
                ddlDepartment.DataBind();
                ddlDepartment.Items.Insert(0, new ListItem("", "0", true));
                


            }

            BindValues();

        }

        void BindValues()
        {
            DataSet ds = null;
            
            ds = ob.ServiceOfficerMapping(ddlServices.SelectedValue, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "3", ddlDistrict.SelectedValue, m_CreatedBy);
            DataTable dt = ds.Tables[0];
           // DataTable dt = ds.Tables[1];
            int count = Convert.ToInt32(dt.Rows.Count);
            if (count > 0)
            {
                if (ds.Tables[1].Rows.Count > 0)
                {
                    if (ds.Tables[1].Rows[0]["TimeLimit"].ToString() != "")
                    {
                        txtTimeLimit.Text = ds.Tables[1].Rows[0]["TimeLimit"].ToString();
                    }
                    else
                    {
                        txtTimeLimit.Text = "";
                    }
                }
                else
                {
                    if (dt.Rows[0]["TimeLimit"].ToString() != "")
                    {
                        txtTimeLimit.Text = dt.Rows[0]["TimeLimit"].ToString();
                    }
                    else
                    {
                        txtTimeLimit.Text = "";
                    }

                }

                dt = ds.Tables[1];

                if (dt.Rows.Count > 0)
                {
                    //ddlDistrict.SelectedValue=ds.Tables[4].Rows[0]["DistrictCode"].ToString();
                    txtDesignatedOffice.Text = dt.Rows[0]["DesignatedOffice"].ToString();
                    txtDesignatedOfficeAddress.Text = dt.Rows[0]["DesignatedAddress"].ToString();
                    txtDesignatedEmailID.Text = dt.Rows[0]["DesignatedMailID"].ToString();
                    txtDesignatedMobileNo.Text = dt.Rows[0]["DesignatedMobile"].ToString();

                    txtAppellateOffice.Text = dt.Rows[0]["AppellateOffice"].ToString();
                    txtAppellateOfficeAddress.Text = dt.Rows[0]["AppellateAddress"].ToString();
                    txtAppellateEmailID.Text = dt.Rows[0]["AppellateMailID"].ToString();
                    txtAppellateMobileNo.Text = dt.Rows[0]["AppellateMobile"].ToString();
                  
                    ddlRevisionOfficerName.SelectedValue = dt.Rows[0]["MapID"].ToString();
                    ddlDesignatedOfficer.SelectedValue = dt.Rows[0]["MapID"].ToString();
                    ddlAppellateOfficer.SelectedValue = dt.Rows[0]["MapID"].ToString();

                    txtRevisionalOfficeAddress.Text = dt.Rows[0]["RevisionalAddress"].ToString();
                    txtRevisionalEmailID.Text = dt.Rows[0]["RevisionalMailID"].ToString();
                    txtRevisionalMobileNo.Text = dt.Rows[0]["RevisionalMobile"].ToString();

                    btnAddRevisional.Visible = true;
                    btnReset.Visible = false;
                    ddlRevisionOfficerName.Visible = true;
                    txtRevisionalOffice.Visible = false;
                    hdCommand.Value = "Update";
                    btnSubmit.Visible = true;
                    btnEdit.Visible = false;
                    //btnCancel.Visible = true;

                    ddlRevisionOfficerName.Visible = true;
                    ddlDesignatedOfficer.Visible = true;
                    ddlAppellateOfficer.Visible = true;
                    txtDesignatedOffice.Visible=false;
                    txtAppellateOffice.Visible = false;
                    txtRevisionalOffice.Visible = false;

                    HighLightTextBoxOnUpdateMode();
                    btnAddRevisional.Visible = true;
                    btnAddDesignated.Visible = true;
                    btnAddAppellate.Visible = true;
                    btnResetForAppellate.Visible = false;
                    btnResetForDesignated.Visible = false;
                    btnReset.Visible = false;

                    txtRevisionalOfficeAddress.ReadOnly = true;
                    txtRevisionalEmailID.ReadOnly = true;
                    txtRevisionalMobileNo.ReadOnly = true;

                    txtAppellateOfficeAddress.ReadOnly = true;
                    txtAppellateEmailID.ReadOnly = true;
                    txtAppellateMobileNo.ReadOnly = true;

                    txtDesignatedOfficeAddress.ReadOnly = true;
                    txtDesignatedEmailID.ReadOnly = true;
                    txtDesignatedMobileNo.ReadOnly = true;

                    btnCancel.Visible = false;
                }
                else
                {
                    hdCommand.Value = "Ins";
                    if (ds.Tables[2].Rows.Count>0)

                    {
                        if(ddlRevisionOfficerName.SelectedValue=="0")
                        {

                        }
                      
                        else
                        {
                            //ddlDistrict.SelectedValue = "0";
                            ddlRevisionOfficerName.Visible = true;
                            txtRevisionalOffice.Visible = false;
                           
                            txtDesignatedOffice.Text = "";
                            txtDesignatedOfficeAddress.Text = "";
                            txtDesignatedEmailID.Text = "";
                            txtDesignatedMobileNo.Text = "";
                            txtDesignatedOffice.Text = "";
                            
                            txtAppellateOffice.Text = "";
                            txtAppellateOfficeAddress.Text = "";
                            txtAppellateEmailID.Text = "";
                            txtAppellateMobileNo.Text = "";
                            txtAppellateOffice.Text = "";
                        
                            btnAddRevisional.Visible = true;
                            btnReset.Visible = false;
                            btnSubmit.Visible = true;
                            btnEdit.Visible = false; btnCancel.Visible = false;
                            ddlRevisionOfficerName.SelectedValue = "0";
                            ddlAppellateOfficer.SelectedValue = "0";
                            ddlDesignatedOfficer.SelectedValue = "0";
                            txtRevisionalOfficeAddress.Text = "";
                            txtRevisionalEmailID.Text = "";
                            txtRevisionalMobileNo.Text = "";

                            ddlRevisionOfficerName.Visible = true;
                            ddlDesignatedOfficer.Visible = true;
                            ddlAppellateOfficer.Visible = true;
                            txtDesignatedOffice.Visible = false;
                            txtAppellateOffice.Visible = false;
                            txtRevisionalOffice.Visible = false;

                            btnAddRevisional.Visible = true;
                            btnAddDesignated.Visible = true;
                            btnAddAppellate.Visible = true;
                            btnResetForAppellate.Visible = false;
                            btnResetForDesignated.Visible = false;
                            btnReset.Visible = false;

                            txtRevisionalOfficeAddress.ReadOnly = false;
                            txtRevisionalEmailID.ReadOnly = false;
                            txtRevisionalMobileNo.ReadOnly = false;

                            txtAppellateOfficeAddress.ReadOnly = false;
                            txtAppellateEmailID.ReadOnly = false;
                            txtAppellateMobileNo.ReadOnly = false;

                            txtDesignatedOfficeAddress.ReadOnly = false;
                            txtDesignatedEmailID.ReadOnly = false;
                            txtDesignatedMobileNo.ReadOnly = false;
                        }
                      
                    }
                    else
                    {
                       // ddlDistrict.SelectedValue = "0";
                        ddlRevisionOfficerName.Visible = true;
                        txtRevisionalOffice.Visible = false;
                        blank();
                        btnSubmit.Visible = true;
                        btnEdit.Visible = false; btnCancel.Visible = false;
                        ddlRevisionOfficerName.SelectedValue = "0";
                        ddlAppellateOfficer.SelectedValue = "0";
                        ddlDesignatedOfficer.SelectedValue = "0";

                        ddlRevisionOfficerName.Visible = true;
                        ddlDesignatedOfficer.Visible = true;
                        ddlAppellateOfficer.Visible = true;
                        txtDesignatedOffice.Visible = false;
                        txtAppellateOffice.Visible = false;
                        txtRevisionalOffice.Visible = false;

                        btnAddRevisional.Visible = true;
                        btnAddDesignated.Visible = true;
                        btnAddAppellate.Visible = true;
                        btnResetForAppellate.Visible = false;
                        btnResetForDesignated.Visible = false;
                        btnReset.Visible = false;

                        txtRevisionalOfficeAddress.ReadOnly = false;
                        txtRevisionalEmailID.ReadOnly = false;
                        txtRevisionalMobileNo.ReadOnly = false;

                        txtAppellateOfficeAddress.ReadOnly = false;
                        txtAppellateEmailID.ReadOnly = false;
                        txtAppellateMobileNo.ReadOnly = false;

                        txtDesignatedOfficeAddress.ReadOnly = false;
                        txtDesignatedEmailID.ReadOnly = false;
                        txtDesignatedMobileNo.ReadOnly = false;
                    }
                  
                }
            }


        }

        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnAddAppellate.Visible = true;
            btnAddDesignated.Visible = true;
           
            DataSet ds = null;
            ds = ob.ServiceOfficerMapping("", ddlDepartment.SelectedValue, "", "", "", "", "", "", "", "", "", "", "", "", "", "2", "", m_CreatedBy);


            if (ddlDepartment.SelectedValue != "0")
            {
                if (ds.Tables[0].Rows.Count>0)
                {
                    ddlServices.SelectedValue = ds.Tables[0].Rows[0]["SvcId"].ToString();

                }
                else
                {

                }

            }
            else
            {
                ddlServices.DataSource = ds.Tables[0];
                ddlServices.DataTextField = "SvcName";
                ddlServices.DataValueField = "SvcId";
                ddlServices.DataBind();
                ddlServices.Items.Insert(0, new ListItem("-Select-", "0", true));


            }

           BindValues(); 
        }
        protected void bindServices()
        {
            DataSet ds = null;
            ds = ob.ServiceOfficerMapping("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "0", "", m_CreatedBy);
            ddlServices.DataSource = ds.Tables[0];
            ddlServices.DataTextField = "SvcName";
            ddlServices.DataValueField = "SvcId";
            ddlServices.DataBind();
            ddlServices.Items.Insert(0, new ListItem("-Select-", "0", true));

            ddlDepartment.DataSource = ds.Tables[1];
            ddlDepartment.DataTextField = "DepartmentName";
            ddlDepartment.DataValueField = "DepartmentId";
            ddlDepartment.DataBind();
            ddlDepartment.Items.Insert(0, new ListItem("", "0", true));

            if (ds.Tables[2] != null && ds.Tables[4].Rows.Count > 0)
            {
                if (ds.Tables[5].Rows[0]["SuperAdmin"].ToString()== m_CreatedBy)
                {
                    ddlDistrict.DataSource = ds.Tables[4];
                    ddlDistrict.DataTextField = "DistrictName";
                    ddlDistrict.DataValueField = "DistrictCode";
                    ddlDistrict.DataBind();
                    ddlDistrict.Items.Insert(0, new ListItem("-Select District-", "0", true));
                    hdnDistrictCode.Value = ds.Tables[4].Rows[0]["DistrictCode"].ToString();
                }
                else
                {
                    ddlDistrict.DataSource = ds.Tables[2];
                    ddlDistrict.DataTextField = "DistrictName";
                    ddlDistrict.DataValueField = "DistrictCode";
                    ddlDistrict.DataBind();
                    ddlDistrict.Enabled = false;
                    hdnDistrictCode.Value = ds.Tables[2].Rows[0]["DistrictCode"].ToString();
                }
            }

            else
                ddlDistrict.SelectedValue = "DistrictName";
             
            
            ddlRevisionOfficerName.DataSource = ds.Tables[3];
            ddlRevisionOfficerName.DataTextField = "RevisionalOfficeName";
            ddlRevisionOfficerName.DataValueField = "mapid";
            ddlRevisionOfficerName.DataBind();
            txtRevisionalOffice.Visible = false;
            ddlRevisionOfficerName.Visible = true;
            ddlRevisionOfficerName.Items.Insert(0, new ListItem("-Select Revisional Officer-", "0", true));

            ddlAppellateOfficer.DataSource = ds.Tables[3];
            ddlAppellateOfficer.DataTextField = "AppellateOfficeName";
            ddlAppellateOfficer.DataValueField = "mapid";
            ddlAppellateOfficer.DataBind();
            txtAppellateOffice.Visible = false;
            ddlAppellateOfficer.Visible = true;
            ddlAppellateOfficer.Items.Insert(0, new ListItem("-Select Appellate Officer-", "0", true));

            ddlDesignatedOfficer.DataSource = ds.Tables[3];
            ddlDesignatedOfficer.DataTextField = "DesignatedOfficeName";
            ddlDesignatedOfficer.DataValueField = "mapid";
            ddlDesignatedOfficer.DataBind();
            txtDesignatedOffice.Visible = false;
            ddlDesignatedOfficer.Visible = true;
            ddlDesignatedOfficer.Items.Insert(0, new ListItem("-Select Designated Officer-", "0", true));

        }
        protected void bindDepartment()
        {
            DataSet dt = null;
            dt = ob.ServiceOfficerMapping("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "0", "", m_CreatedBy);
            ddlDepartment.DataSource = dt.Tables[1];
            ddlDepartment.DataTextField = "DepartmentName";
            ddlDepartment.DataValueField = "DepartmentId";
            ddlDepartment.DataBind();
           ddlDepartment.Items.Insert(0, new ListItem("", "0", true));
        }

        protected void blank()
        {
            //txtDesignatedOfficer.Attributes.Add("class", "w80");
            txtDesignatedOffice.Attributes.Add("class", "w80");
            txtDesignatedOffice.Attributes.Add("class", "w80");
            txtDesignatedEmailID.Attributes.Add("class", "w80");
            txtDesignatedMobileNo.Attributes.Add("class", "w80");

            //txtAppellateAuthority.Attributes.Add("class", "w80");
            txtAppellateOffice.Attributes.Add("class", "w80");
            txtAppellateOfficeAddress.Attributes.Add("class", "w80");
            txtAppellateEmailID.Attributes.Add("class", "w80");
            txtAppellateMobileNo.Attributes.Add("class", "w80");

            // txtRevisionalAuthority.Attributes.Add("class", "w80");
            txtRevisionalOffice.Attributes.Add("class", "w80");
            txtRevisionalOfficeAddress.Attributes.Add("class", "w80");
            txtRevisionalEmailID.Attributes.Add("class", "w80");
            txtRevisionalMobileNo.Attributes.Add("class", "w80");


            //  txtDesignatedOfficer.Text = "";
            txtDesignatedOffice.Text = "";
            txtDesignatedEmailID.Text = "";
            txtDesignatedMobileNo.Text = "";
            txtDesignatedOffice.Text = "";
            // txtAppellateAuthority.Text = "";
            txtAppellateOffice.Text = "";
            txtAppellateEmailID.Text = "";
            txtAppellateMobileNo.Text = "";
            txtAppellateOffice.Text = "";
            //  txtRevisionalAuthority.Text = "";
            txtRevisionalOffice.Text = "";
            txtRevisionalEmailID.Text = "";
            txtRevisionalMobileNo.Text = "";
            txtRevisionalOffice.Text = "";
            txtAppellateOfficeAddress.Text = "";
            txtDesignatedOfficeAddress.Text = "";
            txtRevisionalOfficeAddress.Text = "";
            //txtTimeLimit.Text = "";
        }

        protected void txtRevisionalOffice_TextChanged(object sender, EventArgs e)
        {
            DataSet dt = null;
            dt = ob.serachByAuthority(txtRevisionalOffice.Text);
            //GridView1.DataSource = dt.Tables[0];
            //GridView1.DataBind();
            //GridView1.Visible = true;
        }


        protected void btnEdit_Click(object sender, EventArgs e)
        {
            string value = hdCommand.Value;
            ob.ServiceOfficerMapping(ddlServices.SelectedValue, ddlDepartment.SelectedValue,
              
                txtDesignatedOffice.Text, txtDesignatedOffice.Text, txtDesignatedEmailID.Text, txtDesignatedMobileNo.Text,
               
                txtAppellateOffice.Text, txtAppellateOffice.Text, txtAppellateEmailID.Text, txtAppellateMobileNo.Text,
               
                ddlRevisionOfficerName.SelectedValue, txtRevisionalOfficeAddress.Text, txtRevisionalEmailID.Text, txtRevisionalMobileNo.Text,
                txtTimeLimit.Text, "9", "", m_CreatedBy);
           
            bindServices();
            bindDepartment();
            blank();
            btnSubmit.Visible = true;
            btnEdit.Visible = false;
            btnCancel.Visible = false;
        }

        protected void lnkRevisionalAuthority_Click(object sender, EventArgs e)
        {
            LinkButton Lnk = (LinkButton)sender;

            DataSet ds = null;







            ds = ob.serachByAuthority(Lnk.Text);
            ddlServices.SelectedValue = ds.Tables[0].Rows[0]["SvcId"].ToString();
            ddlDepartment.SelectedValue = ds.Tables[0].Rows[0]["DepartmentId"].ToString();

            //txtDesignatedOfficer.Text = ds.Tables[0].Rows[0]["DesignatedOfficerDesignation"].ToString();
            txtDesignatedOffice.Text = ds.Tables[0].Rows[0]["DesignatedOfficerName"].ToString();
            txtDesignatedOffice.Text = ds.Tables[0].Rows[0]["DesignatedOfficeName"].ToString();
            txtDesignatedEmailID.Text = ds.Tables[0].Rows[0]["DesignatedEmailID"].ToString();
            txtDesignatedMobileNo.Text = ds.Tables[0].Rows[0]["DesignatedMobileNo"].ToString();


            //txtAppellateAuthority.Text = ds.Tables[0].Rows[0]["AppellateAuthorityDesignation"].ToString();
            txtAppellateOffice.Text = ds.Tables[0].Rows[0]["AppellateOfficerName"].ToString();
            txtAppellateOffice.Text = ds.Tables[0].Rows[0]["AppellateOfficeName"].ToString();
            txtAppellateEmailID.Text = ds.Tables[0].Rows[0]["AppellateEmailID"].ToString();
            txtAppellateMobileNo.Text = ds.Tables[0].Rows[0]["AppellateMobileNo"].ToString();

            // txtRevisionalAuthority.Text = ds.Tables[0].Rows[0]["RevisionalAuthorityDesignation"].ToString();
            txtRevisionalOffice.Text = ds.Tables[0].Rows[0]["RevisionalOfficerName"].ToString();
            txtRevisionalOffice.Text = ds.Tables[0].Rows[0]["RevisionalOfficeName"].ToString();
            txtRevisionalEmailID.Text = ds.Tables[0].Rows[0]["RevisionalEmailID"].ToString();
            txtRevisionalMobileNo.Text = ds.Tables[0].Rows[0]["RevisionalMobileNo"].ToString();
            txtTimeLimit.Text = ds.Tables[0].Rows[0]["TimeLimit"].ToString();
            hdCommand.Value = "Update";
            btnSubmit.Visible = true;
            //btnEdit.Visible = true;

           // btnCancel.Visible = true;
            //GridView1.Visible = false;
        }

        protected void lnkAppellatePersonName_Click(object sender, EventArgs e)
        {
            LinkButton Lnk = (LinkButton)sender;

            DataSet ds = null;

            ds = ob.serachByAuthority(Lnk.Text);


            ddlServices.SelectedValue = ds.Tables[1].Rows[0]["SvcId"].ToString();
            ddlDepartment.SelectedValue = ds.Tables[1].Rows[0]["DepartmentId"].ToString();
            // txtDesignatedOfficer.Text = ds.Tables[1].Rows[0]["DesignatedOfficerDesignation"].ToString();
            txtDesignatedOffice.Text = ds.Tables[1].Rows[0]["DesignatedOfficerName"].ToString();
            txtDesignatedOffice.Text = ds.Tables[1].Rows[0]["DesignatedOfficeName"].ToString();
            txtDesignatedEmailID.Text = ds.Tables[1].Rows[0]["DesignatedEmailID"].ToString();
            txtDesignatedMobileNo.Text = ds.Tables[1].Rows[0]["DesignatedMobileNo"].ToString();


            // txtAppellateAuthority.Text = ds.Tables[1].Rows[0]["AppellateAuthorityDesignation"].ToString();
            txtAppellateOffice.Text = ds.Tables[1].Rows[0]["AppellateOfficerName"].ToString();
            txtAppellateOffice.Text = ds.Tables[1].Rows[0]["AppellateOfficeName"].ToString();
            txtAppellateEmailID.Text = ds.Tables[1].Rows[0]["AppellateEmailID"].ToString();
            txtAppellateMobileNo.Text = ds.Tables[1].Rows[0]["AppellateMobileNo"].ToString();

            // txtRevisionalAuthority.Text = ds.Tables[1].Rows[0]["RevisionalAuthorityDesignation"].ToString();
            txtRevisionalOffice.Text = ds.Tables[1].Rows[0]["RevisionalOfficerName"].ToString();
            txtRevisionalOffice.Text = ds.Tables[1].Rows[0]["RevisionalOfficeName"].ToString();
            txtRevisionalEmailID.Text = ds.Tables[1].Rows[0]["RevisionalEmailID"].ToString();
            txtRevisionalMobileNo.Text = ds.Tables[1].Rows[0]["RevisionalMobileNo"].ToString();
            txtTimeLimit.Text = ds.Tables[1].Rows[0]["TimeLimit"].ToString();
            hdCommand.Value = "Update";
            btnSubmit.Visible = true;
           // btnEdit.Visible = true;
            //btnCancel.Visible = true;
            //GridView2.Visible = false;
        }

        protected void lnkOfficerName_Click(object sender, EventArgs e)
        {
            LinkButton Lnk = (LinkButton)sender;

            DataSet ds = null;


            ds = ob.serachByAuthority(Lnk.Text);
            ddlServices.SelectedValue = ds.Tables[2].Rows[0]["SvcId"].ToString();
            ddlDepartment.SelectedValue = ds.Tables[2].Rows[0]["DepartmentId"].ToString();
            // txtDesignatedOfficer.Text = ds.Tables[2].Rows[0]["DesignatedOfficerDesignation"].ToString();
            txtDesignatedOffice.Text = ds.Tables[2].Rows[0]["DesignatedOfficerName"].ToString();
            txtDesignatedOffice.Text = ds.Tables[2].Rows[0]["DesignatedOfficeName"].ToString();
            txtDesignatedEmailID.Text = ds.Tables[2].Rows[0]["DesignatedEmailID"].ToString();
            txtDesignatedMobileNo.Text = ds.Tables[2].Rows[0]["DesignatedMobileNo"].ToString();


            // txtAppellateAuthority.Text = ds.Tables[2].Rows[0]["AppellateAuthorityDesignation"].ToString();
            txtAppellateOffice.Text = ds.Tables[2].Rows[0]["AppellateOfficerName"].ToString();
            txtAppellateOffice.Text = ds.Tables[2].Rows[0]["AppellateOfficeName"].ToString();
            txtAppellateEmailID.Text = ds.Tables[2].Rows[0]["AppellateEmailID"].ToString();
            txtAppellateMobileNo.Text = ds.Tables[2].Rows[0]["AppellateMobileNo"].ToString();

            // txtRevisionalAuthority.Text = ds.Tables[2].Rows[0]["RevisionalAuthorityDesignation"].ToString();
            txtRevisionalOffice.Text = ds.Tables[2].Rows[0]["RevisionalOfficerName"].ToString();
            txtRevisionalOffice.Text = ds.Tables[2].Rows[0]["RevisionalOfficeName"].ToString();
            txtRevisionalEmailID.Text = ds.Tables[2].Rows[0]["RevisionalEmailID"].ToString();
            txtRevisionalMobileNo.Text = ds.Tables[2].Rows[0]["RevisionalMobileNo"].ToString();
            txtTimeLimit.Text = ds.Tables[2].Rows[0]["TimeLimit"].ToString();
            hdCommand.Value = "Update";
            btnSubmit.Visible = true;
           // btnEdit.Visible = true;
           // btnCancel.Visible = true;
            //GridView3.Visible = false;

        }

        //protected void txtAppellateOffice_TextChanged(object sender, EventArgs e)
        //{
        //    DataSet dt = null;
        //    dt = ob.serachByAuthority(txtAppellateOffice.Text);
        //    //GridView2.DataSource = dt.Tables[1];
        //    //GridView2.DataBind();
        //    //GridView2.Visible = true;
        //    //blank();
        //}

        //protected void txtDesignatedOffice_TextChanged(object sender, EventArgs e)
        //{
        //    DataSet dt = null;
        //    dt = ob.serachByAuthority(txtDesignatedOffice.Text);
        //    //GridView3.DataSource = dt.Tables[2];
        //    //GridView3.DataBind();
        //    //GridView3.Visible = true;

        //    //blank();
        //}

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            bindServices();
            bindDepartment();
            blank();
            txtTimeLimit.Text = "";
            btnSubmit.Visible = true;
            btnEdit.Visible = false;
            btnCancel.Visible = false;
        }
        protected void HighLightTextBoxOnUpdateMode()
        {
            //txtDesignatedOfficer.Attributes.Add("class", "editModetxt w80");
            txtDesignatedOffice.Attributes.Add("class", "editModetxt w80");
            txtDesignatedOffice.Attributes.Add("class", "editModetxt w80");
            txtDesignatedEmailID.Attributes.Add("class", "editModetxt w80");
            txtDesignatedMobileNo.Attributes.Add("class", "editModetxt w80");
            // txtAppellateAuthority.Attributes.Add("class", "editModetxt w80");
            txtAppellateOffice.Attributes.Add("class", "editModetxt w80");
            txtAppellateOffice.Attributes.Add("class", "editModetxt w80");
            txtAppellateEmailID.Attributes.Add("class", "editModetxt w80");
            txtAppellateMobileNo.Attributes.Add("class", "editModetxt w80");

            //txtRevisionalAuthority.Attributes.Add("class", "editModetxt w80");
            txtRevisionalOffice.Attributes.Add("class", "editModetxt w80");
            txtRevisionalOffice.Attributes.Add("class", "editModetxt w80");
            txtRevisionalEmailID.Attributes.Add("class", "editModetxt w80");
            txtRevisionalMobileNo.Attributes.Add("class", "editModetxt w80");
           
        }

       

        protected void ddlRevisionOfficerName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlRevisionOfficerName.SelectedValue=="0")
            {
                if(ddlAppellateOfficer.SelectedValue=="0")
                {
                    if(ddlDesignatedOfficer.SelectedValue=="0")
                    {
                        ddlServices.SelectedValue = "0";
                        ddlDepartment.SelectedValue = "0";
                        btnEdit.Visible = false;
                        btnSubmit.Visible = true;
                        btnCancel.Visible = false;
                        blank();
                        
                    }
               
                }
                txtRevisionalOfficeAddress.ReadOnly = false;
                txtRevisionalEmailID.ReadOnly = false;
                txtRevisionalMobileNo.ReadOnly = false;
                txtRevisionalOfficeAddress.Text = "";
                txtRevisionalEmailID.Text = "";
                txtRevisionalMobileNo.Text = "";
            }
            else
            {
                DataSet ds = null;
                ds = ob.ServiceOfficerMapping("", "", "", "", "", "", "", "", "", "", ddlRevisionOfficerName.SelectedValue, "", "", "", "", "5", "", m_CreatedBy);

                //ddlServices.SelectedValue= ds.Tables[0].Rows[0]["serviceid"].ToString();
                //ddlDepartment.SelectedValue= ds.Tables[0].Rows[0]["departmentid"].ToString();

                txtRevisionalOfficeAddress.Text = ds.Tables[0].Rows[0]["OfficeAddress"].ToString();
                txtRevisionalOfficeAddress.ReadOnly = true;
                txtRevisionalEmailID.Text = ds.Tables[0].Rows[0]["EmailID"].ToString();
                txtRevisionalEmailID.ReadOnly = true;
                txtRevisionalMobileNo.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
                txtRevisionalMobileNo.ReadOnly = true;

                //btnEdit.Visible = true;
                btnSubmit.Visible = true;
               // btnCancel.Visible = true;
            }
        }
        protected void btnAddRevisional_Click(object sender, EventArgs e)
        {

          

            btnReset.Visible = true;
            //blank();
           
            btnSubmit.Visible = true;
            btnCancel.Visible = false;
            btnEdit.Visible = false;
            //


            hdnRevisionalOfficerName.Value = ddlRevisionOfficerName.SelectedValue.ToString(); 
            hdnRevisionlAddress.Value = txtRevisionalOfficeAddress.Text;
            hdnRevisionalEmail.Value = txtRevisionalEmailID.Text;
            hdnRevisionalMobile.Value = txtRevisionalMobileNo.Text;

            txtRevisionalOfficeAddress.ReadOnly = false;
            txtRevisionalEmailID.ReadOnly = false;
            txtRevisionalMobileNo.ReadOnly = false;
            ddlRevisionOfficerName.Visible = false;
            txtRevisionalOffice.Visible = true;
            btnAddRevisional.Visible = false;

            txtRevisionalOfficeAddress.Text = "";
            txtRevisionalEmailID.Text = "";
            txtRevisionalMobileNo.Text = "";
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            DataSet ds = null;
            ds = ob.ServiceOfficerMapping("", "", "", "", "", "", "", "", "", "", ddlRevisionOfficerName.SelectedValue, "", "", "", "", "5", "", m_CreatedBy);
            if (ds.Tables[3].Rows.Count>0)
            {
                ddlRevisionOfficerName.SelectedValue = ds.Tables[3].Rows[0]["OfficeName"].ToString();
                ddlRevisionOfficerName.SelectedValue =hdnRevisionalOfficerName.Value;
                txtRevisionalOfficeAddress.Text= hdnRevisionlAddress.Value;
                txtRevisionalEmailID.Text = hdnRevisionalEmail.Value;
                txtRevisionalMobileNo.Text = hdnRevisionalMobile.Value;
            }
            else
            {
               // ddlRevisionOfficerName.SelectedValue = ds.Tables[0].Rows[0]["mapid"].ToString();
                ddlRevisionOfficerName.SelectedValue = hdnRevisionalOfficerName.Value;
                txtRevisionalOfficeAddress.Text = hdnRevisionlAddress.Value;
                txtRevisionalEmailID.Text = hdnRevisionalEmail.Value;
                txtRevisionalMobileNo.Text = hdnRevisionalMobile.Value;
            }
            //blank();
            btnSubmit.Visible = true;
            ddlRevisionOfficerName.Visible = true;
            txtRevisionalOffice.Visible = false;
            btnAddRevisional.Visible = true;
            btnReset.Visible = false;
            btnCancel.Visible = false;
            btnEdit.Visible = false;
            txtRevisionalOfficeAddress.ReadOnly = false;
            txtRevisionalEmailID.ReadOnly = false;
            txtRevisionalMobileNo.ReadOnly = false;
            //ddlRevisionOfficerName.SelectedValue ="0";
          
        }

        protected void ddlDesignatedOfficer_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDesignatedOfficer.SelectedValue == "0")
            {
                if (ddlRevisionOfficerName.SelectedValue == "0")
                {
                    if (ddlAppellateOfficer.SelectedValue == "0")
                    {

                        ddlServices.SelectedValue = "0";
                        ddlDepartment.SelectedValue = "0";
                        btnEdit.Visible = false;
                        btnSubmit.Visible = true;
                        btnCancel.Visible = false;
                        blank();
                       
                    }
                }
                txtDesignatedOfficeAddress.ReadOnly = false;
                txtDesignatedEmailID.ReadOnly = false;
                txtDesignatedMobileNo.ReadOnly = false;

                txtDesignatedOfficeAddress.Text = "";
                txtDesignatedEmailID.Text = "";
                txtDesignatedMobileNo.Text = "";
            }
            else
            {
                DataSet ds = null;
                ds = ob.ServiceOfficerMapping("", "", ddlDesignatedOfficer.SelectedValue, "", "", "","", "", "", "", "", "", "", "", "", "7", "", m_CreatedBy);

                //ddlServices.SelectedValue = ds.Tables[0].Rows[0]["serviceid"].ToString();
                //ddlDepartment.SelectedValue = ds.Tables[0].Rows[0]["departmentid"].ToString();

                txtDesignatedOfficeAddress.Text = ds.Tables[0].Rows[0]["OfficeAddress"].ToString();
                txtDesignatedOfficeAddress.ReadOnly = true;
                txtDesignatedEmailID.Text = ds.Tables[0].Rows[0]["EmailID"].ToString();
                txtDesignatedEmailID.ReadOnly = true;
                txtDesignatedMobileNo.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
                txtDesignatedMobileNo.ReadOnly = true;
                //btnEdit.Visible = true;
                btnSubmit.Visible = true;
               // btnCancel.Visible = true;
            }
        }

        protected void ddlAppellateOfficer_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlAppellateOfficer.SelectedValue == "0")
            {
                if (ddlDesignatedOfficer.SelectedValue == "0")
                {
                    if (ddlRevisionOfficerName.SelectedValue == "0")
                    {
                        ddlServices.SelectedValue = "0";
                        ddlDepartment.SelectedValue = "0";
                        btnEdit.Visible = false;
                        btnSubmit.Visible = true;
                        btnCancel.Visible = false;
                        blank();
                        
                    }
                }
                txtAppellateOfficeAddress.ReadOnly = false;
                txtAppellateEmailID.ReadOnly = false;
                txtAppellateMobileNo.ReadOnly = false;

                txtAppellateOfficeAddress.Text = "";
                txtAppellateEmailID.Text = "";
                txtAppellateMobileNo.Text = "";
            }
            else
            {
                DataSet ds = null;
                ds = ob.ServiceOfficerMapping("", "", "", "", "", "", ddlAppellateOfficer.SelectedValue, "", "", "", "", "", "", "", "", "6", "", m_CreatedBy);

                //ddlServices.SelectedValue = ds.Tables[0].Rows[0]["serviceid"].ToString();
                //ddlDepartment.SelectedValue = ds.Tables[0].Rows[0]["departmentid"].ToString();

                txtAppellateOfficeAddress.Text = ds.Tables[0].Rows[0]["OfficeAddress"].ToString();
                txtAppellateOfficeAddress.ReadOnly = true;
                txtAppellateEmailID.Text = ds.Tables[0].Rows[0]["EmailID"].ToString();
                txtAppellateEmailID.ReadOnly = true;
                txtAppellateMobileNo.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
                txtAppellateMobileNo.ReadOnly = true;
                //btnEdit.Visible = true;
                btnSubmit.Visible = true;
                //btnCancel.Visible = true;
            }
        }

        protected void btnAddAppellate_Click(object sender, EventArgs e)
        {
            ddlAppellateOfficer.Visible = false;
            txtAppellateOffice.Visible = true;
            btnAddAppellate.Visible = false;

            btnResetForAppellate.Visible = true;
            //blank();

            txtAppellateOfficeAddress.ReadOnly = false;
            txtAppellateEmailID.ReadOnly = false;
            txtAppellateMobileNo.ReadOnly = false;

            btnSubmit.Visible = true;
            btnCancel.Visible = false;
            btnEdit.Visible = false;

            hdnAppelateOfficerName.Value = ddlAppellateOfficer.SelectedValue;
            hdnAppellateAddress.Value = txtAppellateOfficeAddress.Text;
            hdnAppellateEmail.Value = txtAppellateEmailID.Text;
            hdnAppellateMobile.Value = txtAppellateMobileNo.Text;

            txtAppellateOffice.Text = "";
            txtAppellateOfficeAddress.Text = "";
            txtAppellateEmailID.Text = "";
            txtAppellateMobileNo.Text = "";
        }

        protected void btnResetForAppellate_Click(object sender, EventArgs e)
        {
            DataSet ds = null;
            ds = ob.ServiceOfficerMapping("", "", "", "", "", "", "", "", "", "", ddlRevisionOfficerName.SelectedValue, "", "", "", "", "6", "", m_CreatedBy);
            if (ds.Tables[3].Rows.Count > 0)
            {
                ddlAppellateOfficer.SelectedValue = ds.Tables[3].Rows[0]["OfficeName"].ToString();
            }
            else
            {

               ddlAppellateOfficer.SelectedValue=  hdnAppelateOfficerName.Value;
                txtAppellateOfficeAddress.Text= hdnAppellateAddress.Value;
               txtAppellateEmailID.Text= hdnAppellateEmail.Value;
               txtAppellateMobileNo.Text= hdnAppellateMobile.Value;
            }
          //  blank();
            btnSubmit.Visible = true;

            ddlAppellateOfficer.Visible = true;

            txtAppellateOffice.Visible = false;
            btnAddAppellate.Visible = true;
            btnResetForAppellate.Visible = false;
            btnCancel.Visible = false;
            btnEdit.Visible = false;

            txtAppellateOfficeAddress.ReadOnly = false;
            txtAppellateEmailID.ReadOnly = false;
            txtAppellateMobileNo.ReadOnly = false;

            //ddlAppellateOfficer.SelectedValue = "0";

        }

        protected void btnAddDesignated_Click(object sender, EventArgs e)
        {
            ddlDesignatedOfficer.Visible = false;
            txtDesignatedOffice.Visible = true;
            btnAddDesignated.Visible = false;

            btnResetForDesignated.Visible = true;
          //  blank();
            txtDesignatedOfficeAddress.ReadOnly = false;
            txtDesignatedEmailID.ReadOnly = false;
            txtDesignatedMobileNo.ReadOnly = false;

            btnSubmit.Visible = true;
            btnCancel.Visible = false;
            btnEdit.Visible = false;


            hdnDesignatedOfficerName.Value = ddlDesignatedOfficer.SelectedValue;
            hdnDesignatedAddress.Value = txtDesignatedOfficeAddress.Text;
            hdnDesignatedeMail.Value = txtDesignatedEmailID.Text;
            hdnDesignatedMobile.Value = txtDesignatedMobileNo.Text;

            //txtAppellateOfficeAddress.Text = "";
            //txtAppellateEmailID.Text = "";
            //txtAppellateMobileNo.Text = "";
            txtDesignatedMobileNo.Text = "";
            txtDesignatedEmailID.Text = "";
            txtDesignatedOfficeAddress.Text = "";
            txtDesignatedOffice.Text = "";
        }

        protected void btnResetForDesignated_Click(object sender, EventArgs e)
        {
            DataSet ds = null;
            ds = ob.ServiceOfficerMapping("", "", "", "", "", "", "", "", "", "", ddlRevisionOfficerName.SelectedValue, "", "", "", "", "6", "", m_CreatedBy);
            if (ds.Tables[3].Rows.Count > 0)
            {
                ddlDesignatedOfficer.SelectedValue = ds.Tables[3].Rows[0]["OfficeName"].ToString();
            }
            else
            {
                ddlDesignatedOfficer.SelectedValue= hdnDesignatedOfficerName.Value;
               txtDesignatedOfficeAddress.Text= hdnDesignatedAddress.Value ;
               txtDesignatedEmailID.Text= hdnDesignatedeMail.Value;
                txtDesignatedMobileNo.Text=hdnDesignatedMobile.Value ;
            }
           // blank();
            btnSubmit.Visible = true;

            ddlDesignatedOfficer.Visible = true;

            txtDesignatedOffice.Visible = false;
            btnAddDesignated.Visible = true;
            btnResetForDesignated.Visible = false;
            btnCancel.Visible = false;
            btnEdit.Visible = false;

            txtDesignatedOfficeAddress.ReadOnly = false;
            txtDesignatedEmailID.ReadOnly = false;
            txtDesignatedMobileNo.ReadOnly = false;
          
            //ddlDesignatedOfficer.SelectedValue = "0";
        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlServices.SelectedValue = "0";
            ddlDepartment.SelectedValue = "0";
            ddlRevisionOfficerName.SelectedValue = "0";
            ddlAppellateOfficer.SelectedValue = "0";
            ddlDesignatedOfficer.SelectedValue = "0";
            blank();
        }
    }
}