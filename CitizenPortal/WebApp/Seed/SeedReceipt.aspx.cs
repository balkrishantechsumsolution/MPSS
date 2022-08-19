using CitizenPortalLib.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Seed
{
    public partial class SeedReceipt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null && Request.QueryString["fr"] != null && Request.QueryString["app_no"] != null)
                {
                    string ExamCode = Request.QueryString["id"];
                    string StateorDistrict = Request.QueryString["fr"];
                    string app_no = Request.QueryString["app_no"];

                    lblGP.Visible = false;
                    ddlGP.Visible = false;
                    lbltodaydate.Text = DateTime.Now.ToString();
                    if (StateorDistrict.ToUpper() == "STATE")
                    {
                        lblHeadingAthorityStateorOffice.Text = "State :";
                        lblHeadingAthorityPlaceorDistrict.Text = "Place :";
                    }
                    else
                    {
                        lblGP.Visible = true;
                        ddlGP.Visible = true;

                        lblGP.Text = "GP :";
                        lblHeadingAthorityStateorOffice.Text = "DAO Office :";
                        lblHeadingAthorityPlaceorDistrict.Text = "District :";
                    }
                    BindData(app_no);
                }

            }
        }

        private void BindData(string ApplicationNo)
        {

            try
            {
                SqlParameter[] sqlprom = new SqlParameter[2];

                sqlprom[0] = new SqlParameter("@flag", "1");
                sqlprom[1] = new SqlParameter("@app_no", ApplicationNo);


                DataTable dt = DBCon.SelectTable(sqlprom, "Seed_247_dtls");
                lblApp_no.Text = dt.Rows[0]["App_no"].ToString();

                lblNotifyAthority.Text = dt.Rows[0]["Notified_Authority"].ToString();
                lblAthorityPlace.Text = dt.Rows[0]["AthorityPlace"].ToString() == "" ? dt.Rows[0]["AthorityDistrict"].ToString() : dt.Rows[0]["AthorityPlace"].ToString();
                //  SeedBO.AthorityDistrict = dt.Rows[0]["AthorityDistrict"].ToString();
                lblAthorityState.Text = dt.Rows[0]["AthorityState"].ToString() == "" ? dt.Rows[0]["DAO_Office"].ToString() : dt.Rows[0]["AthorityState"].ToString();
                //   SeedBO.DAO_Office = dt.Rows[0]["DAO_Office"].ToString();
                lblBussinessType.Text = dt.Rows[0]["Bussiness_Type"].ToString();
                lbltodaydate.Text = dt.Rows[0]["Application_Date"].ToString();
                txtFirmName.Text = dt.Rows[0]["Name_of_Firm"].ToString();
                ddlAppType.Text = dt.Rows[0]["Applicant_Type"].ToString();
                txtApplicantName.Text = dt.Rows[0]["Applicant_Name"].ToString();
                txtPAddress.Text = dt.Rows[0]["Postal_Address"].ToString();
                txtPAddress.Text = dt.Rows[0]["State"].ToString();
                ddlPDistrict.Text = dt.Rows[0]["District"].ToString();
                ddlPBlock.Text = dt.Rows[0]["Block"].ToString();
                txtPEmail.Text = dt.Rows[0]["Email"].ToString();
                txtPPinCode.Text = dt.Rows[0]["Pin_Code"].ToString();
                txtPmobileNo.Text = dt.Rows[0]["MobileNo"].ToString();
                txtPtelephoneNo.Text = dt.Rows[0]["Telephone"].ToString();
                ddlPhotoIdType.Text = dt.Rows[0]["Photo_ID_Type"].ToString();
                txtPhotoIdNumber.Text = dt.Rows[0]["Photo_ID_Number"].ToString();
                imgPhoto.ImageUrl = dt.Rows[0]["Applicant_Photo_Path"].ToString();
                txtBAddress.Text = dt.Rows[0]["BAddress"].ToString();
                lblBstate.Text = dt.Rows[0]["BState"].ToString();
                ddlBdistrict.Text = dt.Rows[0]["BDistrict"].ToString();
                txtBPinCode.Text = dt.Rows[0]["BPin_Code"].ToString();
                ddlBBlock.Text = dt.Rows[0]["BBlock"].ToString();
                ddlGP.Text = dt.Rows[0]["BGP"].ToString();
                rdoCompanyType.Text = dt.Rows[0]["Company_Type"].ToString();
                txtCompanyName.Text = dt.Rows[0]["Company_Name"].ToString();
                txtSourceOfSeedAddress.Text = dt.Rows[0]["SOSAddress"].ToString();
                FuPrincipalCertificate.HRef = dt.Rows[0]["Principal_Certificate_Path"].ToString();


                SqlParameter[] sqlprom1 = new SqlParameter[3];
                sqlprom1[0] = new SqlParameter("@flag", "2");
                sqlprom1[1] = new SqlParameter("@app_no", ApplicationNo);
                sqlprom1[2] = new SqlParameter("@Command", dt.Rows[0]["Doc_dtls_chk"].ToString());

                DataTable dt2 = DBCon.SelectTable(sqlprom1, "Seed_247_dtls");
                StringBuilder stbo = new StringBuilder();
                stbo.Append("<ol>");
                foreach (DataRow dr in dt2.Rows)
                {
                    stbo.Append("<li>" + dr["OptionText"].ToString() + "</li>");


                }
                stbo.Append("</ol>");



                chkDocDtls.Text = stbo.ToString();
                txtTreasuryName.Text = dt.Rows[0]["Treasury_Name"].ToString();
                txtChallanNumber.Text = dt.Rows[0]["Challan_Number"].ToString();
                txtChallanDate.Text = dt.Rows[0]["Challan_Date"].ToString();
                txtAmount.Text = dt.Rows[0]["Amount"].ToString();

                //  SeedBO.paidstatus = dt.Rows[0]["paidstatus"].ToString();
                txtProcessRegNo.Text = dt.Rows[0]["Processing_Reg_No"].ToString() != "" ? dt.Rows[0]["Processing_Reg_No"].ToString() : "--";
                txtIssueDate.Text = dt.Rows[0]["Issue_Date"].ToString() != "01-01-1900 12:00:00 AM" ? dt.Rows[0]["Issue_Date"].ToString() : "--";
                txtValiUpto.Text = dt.Rows[0]["Valid_Upto"].ToString() != "01-01-1900 12:00:00 AM" ? dt.Rows[0]["Valid_Upto"].ToString() : "--";

            }
            catch (Exception ex)
            {

                throw ex;
            }



        }
    }
}