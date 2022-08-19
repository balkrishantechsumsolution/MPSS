using CitizenPortalLib.DAL;
using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Seed
{
    public partial class NewRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["id"] != null && Request.QueryString["fr"] != null)
                {
                    string ExamCode = Request.QueryString["id"];
                    string StateorDistrict = Request.QueryString["fr"];
                    lblAthorityPlace.Visible = false;
                    lblAthorityState.Visible = false;
                    ddlAthorityPlaceorDistrict.Visible = false;
                    ddlAthorityStateorOffice.Visible = false;
                    lblGP.Visible = false;
                    ddlGP.Visible = false;
                    lbltodaydate.Text = DateTime.Now.ToString();
                    if (StateorDistrict.ToUpper() == "STATE")
                    {
                        lblAthorityPlace.Visible = true;
                        lblAthorityState.Visible = true;
                        lblHeadingAthorityStateorOffice.Text = "State :";
                        lblHeadingAthorityPlaceorDistrict.Text = "Place :";
                        lblAthorityPlace.Text = "Bhubaneswar";
                        lblAthorityState.Text = "Odisha";
                        lblNotifyAthority.Text = "Joint Director of Agriculture (F & S) / Additional Director(Ext.)";
                    }
                    else
                    {
                        lblGP.Visible = true;
                        ddlGP.Visible = true;
                        ddlAthorityPlaceorDistrict.Visible = true;
                        ddlAthorityStateorOffice.Visible = true;
                        lblGP.Text = "GP :<span style='color: Red;'> *</span>";
                        lblHeadingAthorityStateorOffice.Text = "DAO Office :";
                        lblHeadingAthorityPlaceorDistrict.Text = "District :";
                        lblNotifyAthority.Text = "District Agriculture Officer";

                    }

                    DBCon.BindDropDownList(ddlAppType, "2", ExamCode, "AppType");
                    ddlAppType.Items.Insert(0, new ListItem("--Select--", "0"));
                    DBCon.BindDropDownList(ddlPhotoIdType, "2", ExamCode, "PhotoIDType");
                    ddlPhotoIdType.Items.Insert(0, new ListItem("--Select--", "0"));
                    DBCon.BindCategoryList(rdoCompanyType, "2", ExamCode, "CompanyType");
                    DBCon.BindDropDownList(ddlCompanyName, "2", ExamCode, "CompanyName");
                    ddlCompanyName.Items.Insert(0, new ListItem("--Select--", "0"));

                    ddlBBlock.Items.Insert(0, new ListItem("--Select--", "0"));
                    ddlPBlock.Items.Insert(0, new ListItem("--Select--", "0"));
                    ddlPDistrict.Items.Insert(0, new ListItem("--Select--", "0"));
                    ddlBdistrict.Items.Insert(0, new ListItem("--Select--", "0"));
                    ddlGP.Items.Insert(0, new ListItem("--Select--", "0"));
                    ddlAthorityPlaceorDistrict.Items.Insert(0, new ListItem("--Select--", "0"));
                    ddlAthorityStateorOffice.Items.Insert(0, new ListItem("--Select--", "0"));

                    DBCon.BindCheckList(chkDocDtls, "2", ExamCode, "DocDtls");
                }
            }

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    SeedLiBO SeedBO = new SeedLiBO();

                    SeedBO.App_no = "123";


                    SeedBO.App_For = Request.QueryString["fr"].ToString().ToUpper() == "STATE" ? "STATE" : "DISTRICT";

                    SeedBO.Notified_Authority = lblNotifyAthority.Text;
                    SeedBO.AthorityPlace = lblAthorityPlace.Visible == true ? lblAthorityPlace.Text : "";
                    SeedBO.AthorityDistrict = lblAthorityPlace.Visible == true ? "" : ddlAthorityPlaceorDistrict.SelectedItem.Text;
                    SeedBO.AthorityState = lblAthorityState.Visible == true ? lblAthorityState.Text : "";
                    SeedBO.DAO_Office = lblAthorityState.Visible == true ? "" : ddlAthorityStateorOffice.SelectedItem.Text;
                    SeedBO.Bussiness_Type = lblBussinessType.Text;
                    SeedBO.Application_Date = DateTime.Now;
                    SeedBO.Name_of_Firm = txtFirmName.Text;
                    SeedBO.Applicant_Type = ddlAppType.SelectedItem.Text;
                    SeedBO.Applicant_Name = txtApplicantName.Text;
                    SeedBO.Postal_Address = txtPAddress.Text;
                    SeedBO.State = lblPState.Text;
                    SeedBO.District = ddlPDistrict.SelectedItem.Text;
                    SeedBO.Block = ddlPBlock.SelectedItem.Text;
                    SeedBO.Email = txtPEmail.Text;
                    SeedBO.Pin_Code = txtPPinCode.Text;
                    SeedBO.MobileNo = txtPmobileNo.Text;
                    SeedBO.Telephone = txtPtelephoneNo.Text;
                    SeedBO.Photo_ID_Type = ddlPhotoIdType.SelectedItem.Text;
                    SeedBO.Photo_ID_Number = txtPhotoIdNumber.Text;
                    SeedBO.Applicant_Photo_Path = "/Quick Links/ORFiles/Seed/photo/" + "123.jpg";
                    SeedBO.BAddress = txtBAddress.Text;
                    SeedBO.BState = lblBstate.Text;
                    SeedBO.BDistrict = ddlBdistrict.SelectedItem.Text;
                    SeedBO.BPin_Code = txtBPinCode.Text;
                    SeedBO.BBlock = ddlBBlock.SelectedItem.Text;
                    SeedBO.BGP = Request.QueryString["fr"].ToString().ToUpper() == "STATE" ? "" : ddlGP.SelectedItem.Text;
                    SeedBO.Company_Type = rdoCompanyType.SelectedItem.Text;
                    SeedBO.Company_Name = txtCompanyName.Visible == true ? txtCompanyName.Text : ddlCompanyName.SelectedItem.Text;
                    SeedBO.SOSAddress = txtSourceOfSeedAddress.Text;
                    SeedBO.Principal_Certificate_Path = "/Quick Links/ORFiles/Seed/PrincipalCertificate/" + "123.pdf";



                    string Doc_dtls_chk = string.Empty;

                    for (int i = 0; i < chkDocDtls.Items.Count; i++)
                    {

                        if (chkDocDtls.Items[i].Selected)
                        {
                            Doc_dtls_chk += "'" + chkDocDtls.Items[i].Value + "'";
                            Doc_dtls_chk += ",";

                        }

                    }

                    Doc_dtls_chk = Doc_dtls_chk.Remove(Doc_dtls_chk.LastIndexOf(','));

                    // int[] words = Doc_dtls_chk.Split("|");



                    SeedBO.Doc_dtls_chk = Doc_dtls_chk;
                    SeedBO.Treasury_Name = txtTreasuryName.Text;
                    SeedBO.Challan_Number = txtChallanNumber.Text;
                    SeedBO.Challan_Date = Convert.ToDateTime(DBCon.MMDD4Y(txtChallanDate.Text));
                    SeedBO.Amount = txtAmount.Text;
                    SeedBO.insert_dt = DateTime.Now;
                    SeedBO.update_dt = DateTime.Now;
                    SeedBO.paidstatus = "N";
                    if (rdoCompanyType.SelectedValue == "4")
                    {
                        SeedBO.Processing_Reg_No = txtProcessRegNo.Text;
                        SeedBO.Issue_Date = Convert.ToDateTime(DBCon.MMDD4Y(txtIssueDate.Text));
                        SeedBO.Valid_Upto = Convert.ToDateTime(DBCon.MMDD4Y(txtValiUpto.Text));
                    }
                    else
                    {
                        SeedBO.Processing_Reg_No = "";
                        SeedBO.Issue_Date = Convert.ToDateTime(DBCon.MMDD4Y("01/01/1900"));
                        SeedBO.Valid_Upto = Convert.ToDateTime(DBCon.MMDD4Y("01/01/1900"));
                    }

                    SeedDAL db = new SeedDAL();

                    bool result = db.insertSeedLiciensingDtls(SeedBO, "Insert_SeedLi_USP");
                    if (result)
                    {
                        ////bool result1 = ImageCrop1.MoveToServiceFolder("/Quick Links/ORFiles/Seed/photo/", "123", true);

                        ////if (!result1)
                        ////{

                        ////    throw new Exception("Kindly upload your Image");

                        ////}

                        string fileName = System.IO.Path.GetFileName(FuPrincipalCertificate.FileName);
                        string fileExtension = System.IO.Path.GetExtension(fileName);

                        if (fileName == "")
                        {
                            throw new Exception("Kindly upload Principal Certificate document ..");
                        }
                        string Extension2 = fileExtension;
                        if (Extension2.ToLower().Trim() != ".pdf")
                        {
                            throw new Exception("Invalid Principal Certificate document Format Please Upload only .pdf Document");
                        }
                        if (FuPrincipalCertificate.PostedFile.ContentLength > 204800)
                        {

                            throw new Exception("Principal Certificate document size should not be greater than 200 KB !");

                        }
                        bool Reslt = SaveAttachment(FuPrincipalCertificate.PostedFile, "123", ".pdf", "PrincipalCertificate");
                        if (!Reslt)
                        {
                            throw new Exception("Kindly upload Principal Certificate document.");
                        }


                        Response.Redirect("ShowReciept.aspx?fr=" + Request.QueryString["fr"] + "&id=247&app_no=" + "123");
                    }

                }
                else
                {

                    throw new Exception("Something goes wrong please fill the details carefully");

                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool SaveAttachment(HttpPostedFile FileUp, string App_no, string extEC, string Folder)
        {

            bool msgElc = false;

            string filename = FileUp.FileName.Trim().ToUpper();
            string fileExt = extEC;
            // string fileExt = filename.Substring(filename.IndexOf("."), 4);

            string path = "/Quick Links/ORFiles/Seed/" + Folder + "/";
            System.Web.HttpContext.Current.Session.Add("path", path);
            string dir = DBCon._MapPath(path);
            if (!Directory.Exists(dir))
            {
                Directory.CreateDirectory(dir);
            }
            switch (fileExt)
            {
                case ".jpg":
                    path = path + App_no + extEC;
                    FileUp.SaveAs(DBCon._MapPath(path));
                    if (!File.Exists(DBCon._MapPath(path)))
                    {
                        throw new Exception("Please Attach  File!!");
                    }

                    break;
                case ".pdf":

                    path = path + App_no + extEC;
                    FileUp.SaveAs(DBCon._MapPath(path));
                    if (!File.Exists(DBCon._MapPath(path)))
                    {
                        throw new Exception("Please Attach  File!!");
                    }

                    break;
                default:
                    {
                        throw new Exception("Please attach valid file");
                    }
            }
            if (!File.Exists(DBCon._MapPath(path)))
            {
                msgElc = false;
            }
            else
            {
                msgElc = true;
            }
            return msgElc;
        }

    }
}