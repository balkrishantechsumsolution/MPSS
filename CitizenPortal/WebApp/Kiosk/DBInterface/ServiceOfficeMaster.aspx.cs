using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.DBInterface
{
    public partial class ServiceOfficeMaster : System.Web.UI.Page
    {
        ServicesBLL m_ServicesBLL = new ServicesBLL();
        private string m_CreatedBy = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            //m_CreatedBy = Session["LoginID"].ToString();
            m_CreatedBy = "mohan.kumar";

            divErr.Style.Add("display", "none");

            if (!IsPostBack)
            {
                BindInitialData();
            }
        }

        void BindInitialData()
        {
            DataSet ds = null;

            ds = m_ServicesBLL.GetServiceOfficeData("1", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");


            DataTable dtDistrict = ds.Tables[0];
            DataTable dtDepartment = ds.Tables[1];
            DataTable dtDesignation = ds.Tables[2];
            DataTable dtOffice = ds.Tables[3];
            DataTable dtDesignatedOfficer = ds.Tables[4];

            ddlDistrict.DataTextField = "DistrictName";
            ddlDistrict.DataValueField = "DistrictCode";
            ddlDistrict.DataSource = dtDistrict;
            ddlDistrict.DataBind();
            ddlDistrict.Items.Insert(0, new ListItem("-Select District-", "0"));

            ddlDept.DataTextField = "DepartmentName";
            ddlDept.DataValueField = "DepartmentID";
            ddlDept.DataSource = dtDepartment;
            ddlDept.DataBind();
            ddlDept.Items.Insert(0, new ListItem("-Select Department-", "0"));


            ddlDistrict2.DataTextField = "DistrictName";
            ddlDistrict2.DataValueField = "DistrictCode";
            ddlDistrict2.DataSource = dtDistrict;
            ddlDistrict2.DataBind();
            ddlDistrict2.Items.Insert(0, new ListItem("-Select District-", "0"));

            ddlDept2.DataTextField = "DepartmentName";
            ddlDept2.DataValueField = "DepartmentID";
            ddlDept2.DataSource = dtDepartment;
            ddlDept2.DataBind();
            ddlDept2.Items.Insert(0, new ListItem("-Select Department-", "0"));

            ddlDistrict3.DataTextField = "DistrictName";
            ddlDistrict3.DataValueField = "DistrictCode";
            ddlDistrict3.DataSource = dtDistrict;
            ddlDistrict3.DataBind();
            ddlDistrict3.Items.Insert(0, new ListItem("-Select District-", "0"));

            ddlDept3.DataTextField = "DepartmentName";
            ddlDept3.DataValueField = "DepartmentID";
            ddlDept3.DataSource = dtDepartment;
            ddlDept3.DataBind();
            ddlDept3.Items.Insert(0, new ListItem("-Select Department-", "0"));


            ddlDesignatedOfficer.DataTextField = "DesignatedOfficer";
            ddlDesignatedOfficer.DataValueField = "DesignatedOfficerCode";
            ddlDesignatedOfficer.DataSource = dtDesignatedOfficer;
            ddlDesignatedOfficer.DataBind();
            ddlDesignatedOfficer.Items.Insert(0, new ListItem("-Select Department-", "0"));

            ddlAppellateAuthority.DataTextField = "DesignatedOfficer";
            ddlAppellateAuthority.DataValueField = "DesignatedOfficerCode";
            ddlAppellateAuthority.DataSource = dtDesignatedOfficer;
            ddlAppellateAuthority.DataBind();
            ddlAppellateAuthority.Items.Insert(0, new ListItem("-Select Department-", "0"));

            ddlRevisionalAuthority.DataTextField = "DesignatedOfficer";
            ddlRevisionalAuthority.DataValueField = "DesignatedOfficerCode";
            ddlRevisionalAuthority.DataSource = dtDesignatedOfficer;
            ddlRevisionalAuthority.DataBind();
            ddlRevisionalAuthority.Items.Insert(0, new ListItem("-Select Department-", "0"));

            txtDesignatedOfficer.Text =
                txtDesignatedAddress.Text = txtAppellateAuthority.Text = txtAppellateAddress.Text =
                    txtRevisionalAuthority.Text = txtRevisionalAddress.Text = "";

        }

        protected void ddlDept_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindDesignatedOfficer("2");
        }


        void BindDesignatedOfficer(string Flag)
        {
            DataSet ds = null;

            ds = m_ServicesBLL.GetServiceOfficeData(Flag, ddlDistrict.SelectedValue, ddlDept.SelectedValue, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

            DataTable dtOfficer = ds.Tables[0];

            ddlDesignatedOfficer.DataTextField = "DesignatedOfficer";
            ddlDesignatedOfficer.DataValueField = "DesignatedOfficerCode";
            ddlDesignatedOfficer.DataSource = dtOfficer;
            ddlDesignatedOfficer.DataBind();
            ddlDesignatedOfficer.Items.Insert(0, new ListItem("-Select Officer-", "0"));
        }

        void BindAppellateAuthority(string Flag)
        {
            DataSet ds = null;

            ds = m_ServicesBLL.GetServiceOfficeData(Flag, ddlDistrict2.SelectedValue, ddlDept2.SelectedValue, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

            DataTable dtOfficer = ds.Tables[0];

            ddlAppellateAuthority.DataTextField = "DesignatedOfficer";
            ddlAppellateAuthority.DataValueField = "DesignatedOfficerCode";
            ddlAppellateAuthority.DataSource = dtOfficer;
            ddlAppellateAuthority.DataBind();
            ddlAppellateAuthority.Items.Insert(0, new ListItem("-Select Officer-", "0"));
        }

        void BindRevisionalAuthority(string Flag)
        {
            DataSet ds = null;

            ds = m_ServicesBLL.GetServiceOfficeData(Flag, ddlDistrict3.SelectedValue, ddlDept3.SelectedValue, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");


            DataTable dtOfficer = ds.Tables[0];

            ddlRevisionalAuthority.DataTextField = "DesignatedOfficer";
            ddlRevisionalAuthority.DataValueField = "DesignatedOfficerCode";
            ddlRevisionalAuthority.DataSource = dtOfficer;
            ddlRevisionalAuthority.DataBind();
            ddlRevisionalAuthority.Items.Insert(0, new ListItem("-Select Officer-", "0"));

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DataSet dsDataSet = null;
            DataTable dt = null;

            dsDataSet = m_ServicesBLL.GetServiceOfficeData("9"
                , ddlDistrict.SelectedValue, ddlBlock.SelectedValue, ddlDept.SelectedValue, ddlDesignatedOfficer.SelectedValue, txtDesignatedOfficer.Text, txtDesignatedAddress.Text
                , ddlDistrict2.SelectedValue, ddlBlock2.SelectedValue, ddlDept2.SelectedValue, ddlAppellateAuthority.SelectedValue, txtAppellateAuthority.Text, txtAppellateAddress.Text
                , ddlDistrict3.SelectedValue, ddlBlock3.SelectedValue, ddlDept3.SelectedValue, ddlRevisionalAuthority.SelectedValue, txtRevisionalAuthority.Text, txtRevisionalAddress.Text
                , "DepartmentList", "ServiceList", "", "", m_CreatedBy);

            dt = dsDataSet.Tables[0];
            if (dt != null && dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["Result"].ToString() == "1")
                {
                    divErr.InnerHtml = "Data Submitted Successfully !!";
                    divErr.Attributes.Add("class", "success");
                    divErr.Style.Add("display", "");
                    BindInitialData();
                }
            }

        }

        protected void ddlDept2_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindAppellateAuthority("3");
        }

        protected void ddlDept3_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindRevisionalAuthority("4");
        }

        protected void ddlDesignatedOfficer_SelectedIndexChanged(object sender, EventArgs e)
        {
            //BindOfficerDetails("21");
            DataSet ds = null;

            ds = m_ServicesBLL.GetServiceOfficeData("21", ddlDistrict.SelectedValue, ddlDept.SelectedValue, ddlBlock.SelectedValue, ddlDesignatedOfficer.SelectedValue, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");


            DataTable dtOfficer = ds.Tables[0];

            if (dtOfficer.Rows.Count > 0)
            {
                txtDesignatedOfficer.Text = dtOfficer.Rows[0]["DesignatedOfficer"].ToString();
                txtDesignatedAddress.Text = dtOfficer.Rows[0]["OfficeAddress"].ToString();
            }
            else
            {
                txtDesignatedOfficer.Text = "";
                txtDesignatedAddress.Text = "";

            }

        }

        protected void ddlAppellateAuthority_SelectedIndexChanged(object sender, EventArgs e)
        {
            //BindOfficerDetails("31");
            DataSet ds = null;

            ds = m_ServicesBLL.GetServiceOfficeData("31", ddlDistrict2.SelectedValue, ddlDept2.SelectedValue, ddlBlock2.SelectedValue, ddlAppellateAuthority.SelectedValue, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");


            DataTable dtOfficer = ds.Tables[0];

            if (dtOfficer.Rows.Count > 0)
            {
                txtAppellateAuthority.Text = dtOfficer.Rows[0]["DesignatedOfficer"].ToString();
                txtAppellateAddress.Text = dtOfficer.Rows[0]["OfficeAddress"].ToString();
            }
            else
            {
                txtAppellateAuthority.Text = "";
                txtAppellateAddress.Text = "";

            }

        }

        protected void ddlRevisionalAuthority_SelectedIndexChanged(object sender, EventArgs e)
        {
            //BindRevisionalAuthority("41");
            DataSet ds = null;

            ds = m_ServicesBLL.GetServiceOfficeData("41", ddlDistrict3.SelectedValue, ddlDept3.SelectedValue, ddlBlock3.SelectedValue, ddlRevisionalAuthority.SelectedValue, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");


            DataTable dtOfficer = ds.Tables[0];

            if (dtOfficer.Rows.Count > 0)
            {
                txtRevisionalAuthority.Text = dtOfficer.Rows[0]["DesignatedOfficer"].ToString();
                txtRevisionalAddress.Text = dtOfficer.Rows[0]["OfficeAddress"].ToString();
            }
            else
            {
                txtRevisionalAuthority.Text = "";
                txtRevisionalAddress.Text = "";
            }
        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet ds = null;

            ds = m_ServicesBLL.GetServiceOfficeData("12", ddlDistrict.SelectedValue, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

            DataTable dt = ds.Tables[0];

            ddlBlock.DataTextField = "BlockName";
            ddlBlock.DataValueField = "BlockCode";
            ddlBlock.DataSource = dt;
            ddlBlock.DataBind();
            ddlBlock.Items.Insert(0, new ListItem("-Select Block-", "0"));
        }

        protected void ddlDistrict2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet ds = null;

            ds = m_ServicesBLL.GetServiceOfficeData("22", ddlDistrict2.SelectedValue, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

            DataTable dt = ds.Tables[0];

            ddlBlock2.DataTextField = "BlockName";
            ddlBlock2.DataValueField = "BlockCode";
            ddlBlock2.DataSource = dt;
            ddlBlock2.DataBind();
            ddlBlock2.Items.Insert(0, new ListItem("-Select Block-", "0"));
        }

        protected void ddlDistrict3_SelectedIndexChanged(object sender, EventArgs e)
        {

            DataSet ds = null;

            ds = m_ServicesBLL.GetServiceOfficeData("32", ddlDistrict3.SelectedValue, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

            DataTable dt = ds.Tables[0];

            ddlBlock3.DataTextField = "BlockName";
            ddlBlock3.DataValueField = "BlockCode";
            ddlBlock3.DataSource = dt;
            ddlBlock3.DataBind();
            ddlBlock3.Items.Insert(0, new ListItem("-Select Block-", "0"));

        }
    }
}