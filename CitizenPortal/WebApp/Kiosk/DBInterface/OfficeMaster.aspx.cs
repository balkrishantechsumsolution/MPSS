using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.BLL;
using System.Data;

namespace CitizenPortal.WebApp.Kiosk.DBInterface
{
    public partial class OfficeMaster : System.Web.UI.Page
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

            ds = m_ServicesBLL.GetInitialData("1", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");


            DataTable dtDistrict = ds.Tables[0];
            DataTable dtDepartment = ds.Tables[1];
            DataTable dtDesignation = ds.Tables[2];
            DataTable dtOffice = ds.Tables[3];

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

            ddlDesignation.DataTextField = "DesignatedOfficer";
            ddlDesignation.DataValueField = "SNo";
            ddlDesignation.DataSource = dtDesignation;
            ddlDesignation.DataBind();
            ddlDesignation.Items.Insert(0, new ListItem("-Select Officer-", "0"));

            ddlOffice.DataTextField = "OfficeName";
            ddlOffice.DataValueField = "OfficeCode";
            ddlOffice.DataSource = dtOffice;
            ddlOffice.DataBind();
            ddlOffice.Items.Insert(0, new ListItem("-Select Office-", "0"));

            ddlOfficeSub.Items.Clear();
            ddlBlock.Items.Clear();
            txtDesignatedOfficer.Text =
                txtDesignatedOfficeAddress.Text =
                    txtDesignatedPinCode.Text = txtDesignatedEmailID.Text = txtDesignatedMobileNo.Text = "";
        }

        protected void ddlOffice_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet ds = null;

            ds = m_ServicesBLL.GetInitialData("2", ddlOffice.SelectedValue, "", "", "", "", "", "", "", "", "", "", "", "", "", "");

            DataTable dt = ds.Tables[0];

            ddlOfficeSub.DataTextField = "OfficeName";
            ddlOfficeSub.DataValueField = "OfficeCode";
            ddlOfficeSub.DataSource = dt;
            ddlOfficeSub.DataBind();
            ddlOfficeSub.Items.Insert(0, new ListItem("-Select SubOffice-", "0"));

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {


            //m_ServicesBLL.GetInitialData("3", "DistrictCode", "DepartmentCode", "DesignationCode", "OfficeName", "SubOfficeName"
            //, "DesignationOfficer", "OfficeAddress", "PinCode", "EmailID", "MobileNo", "", "", "", "", CreatedBy);

            DataSet dsDataSet = null;
            DataTable dt = null;

            dsDataSet = m_ServicesBLL.GetInitialData("3", ddlDistrict.SelectedValue, ddlDept.SelectedValue, ddlDesignation.SelectedValue, ddlOffice.SelectedValue, ddlOfficeSub.SelectedValue
                , txtDesignatedOfficer.Text, txtDesignatedOfficeAddress.Text, txtDesignatedPinCode.Text, txtDesignatedEmailID.Text, txtDesignatedMobileNo.Text, ddlBlock.SelectedValue, "", "", "", m_CreatedBy);

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

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet ds = null;

            ds = m_ServicesBLL.GetInitialData("22", ddlDistrict.SelectedValue, "", "", "", "", "", "", "", "", "", "", "", "", "", "");

            DataTable dt = ds.Tables[0];

            ddlBlock.DataTextField = "BlockName";
            ddlBlock.DataValueField = "BlockCode";
            ddlBlock.DataSource = dt;
            ddlBlock.DataBind();
            ddlBlock.Items.Insert(0, new ListItem("-Select Block-", "0"));
        }
    }
}