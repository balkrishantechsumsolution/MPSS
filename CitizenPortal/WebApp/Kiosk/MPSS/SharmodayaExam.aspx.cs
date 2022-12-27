using CitizenPortalLib.DataStructs;
using iTextSharp.text.pdf;
using java.lang;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SqlHelper;
using sun.net.www.content.text;
using sun.security.jca;
using sun.swing;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;

using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using static CitizenPortalLib.CommonFunction;
using Exception = System.Exception;

namespace CitizenPortal.WebApp.Kiosk.MPSOS
{
    public partial class SharmodayaExam : System.Web.UI.Page
    {
        static data sqlhelper = new data();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindGenderDropDown();
                BindClassDropDown();
                //BindScClassDropDown();
                BindSchoolDistrictDropDown();
                BindRegDistrictDropDown();
                BindAddDistrictDropDown();
                BindSchoolDropDown();
                BindCasteDropDown();

                BindSchoolClassReserve();
                BindPreviousSchoolDistrictDropDown();
                ClearData();
            }



        }

        public void BindSchoolDropDown()
        {
            DataTable dt = new DataTable();

            var District = ddlSchoolDistrict.SelectedItem.Value.ToUpper();

            SqlParameter[] parameter = {
                        new SqlParameter("@District",District)
            };
            dt = sqlhelper.ExecuteDataTable("GetSchoolMasterReserveSP", parameter);

            if (dt.Rows.Count > 0)
            {
                ddlSchool.DataTextField = dt.Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
                ddlSchool.DataValueField = dt.Columns["ID"].ToString();
                // to retrive specific  textfield name   
                ddlSchool.DataSource = dt;      //assigning datasource to the dropdownlist  
                ddlSchool.DataBind();

            }
            ddlSchool.Items.Insert(0, new ListItem("Please select", ""));

        }

        public void BindSchoolClassReserve()
        {
            //DataTable dt = new DataTable();

            //var SchoolID = ddlSchool.SelectedValue;
            //var District = ddlSchoolDistrict.SelectedItem.Text.ToUpper();

            //SqlParameter[] parameter = {
            //        new SqlParameter("@SchoolID", SchoolID),
            //            new SqlParameter("@District",District)
            //};

            //dt = sqlhelper.ExecuteDataTable("GetSchoolClassReserveSP", parameter);

            //if (dt.Rows.Count > 0)
            //{
            //    GridView1.DataSource = dt;
            //    GridView1.DataBind();
            //}


        }

        public void BindGenderDropDown()
        {
            DataTable dt = new DataTable();

            var District = ddlSchoolDistrict.SelectedItem.Value.ToUpper();
            var Class = ddlClass.SelectedItem.Value.ToUpper();
            var School = ddlSchool.SelectedItem.Value.ToUpper();

            SqlParameter[] parameter = {
                        new SqlParameter("@District",District),
                         new SqlParameter("@Class",Class),
                          new SqlParameter("@School",School)
            };


            dt = sqlhelper.ExecuteDataTable("GetMPBOCGenderSP", parameter);

            if (dt.Rows.Count > 0)
            {
                ddlGender.DataTextField = dt.Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
                ddlGender.DataValueField = dt.Columns["ID"].ToString();
                // to retrive specific  textfield name   
                ddlGender.DataSource = dt;      //assigning datasource to the dropdownlist  
                ddlGender.DataBind();

            }
            ddlGender.Items.Insert(0, new ListItem("Please select", ""));

        }
        //public void BindScClassDropDown()
        //{
        //    DataTable dt = new DataTable();

        //    dt = sqlhelper.ExecuteDataTable("GetMPBOCClassSP");

        //    if (dt.Rows.Count > 0)
        //    {
        //        ddlScClass.DataTextField = dt.Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
        //        ddlScClass.DataValueField = dt.Columns["ID"].ToString();
        //        // to retrive specific  textfield name   
        //        ddlScClass.DataSource = dt;      //assigning datasource to the dropdownlist  
        //        ddlScClass.DataBind();

        //    }
        //    ddlScClass.Items.Insert(0, new ListItem("Please select", ""));

        //}
        public void BindAddDistrictDropDown()
        {
            DataTable dt = new DataTable();
            SqlParameter[] parameter = {
                    new SqlParameter("@StateCode", "23"),
                        new SqlParameter("@LangID", "1"),

            };

            dt = sqlhelper.ExecuteDataTable("[GetMPBOCDistrictSTSP]", parameter);

            if (dt.Rows.Count > 0)
            {
                ddlAddDistrict.DataTextField = dt.Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
                ddlAddDistrict.DataValueField = dt.Columns["ID"].ToString();
                // to retrive specific  textfield name   
                ddlAddDistrict.DataSource = dt;      //assigning datasource to the dropdownlist  
                ddlAddDistrict.DataBind();

            }
            ddlAddDistrict.Items.Insert(0, new ListItem("Please select", ""));

        }

        public void BindPreviousSchoolDistrictDropDown()
        {
            DataTable dt = new DataTable();
            SqlParameter[] parameter = {
                    new SqlParameter("@StateCode", "23"),
                        new SqlParameter("@LangID", "1")
            };

            dt = sqlhelper.ExecuteDataTable("[GetMPBOCDistrictSTSP]", parameter);

            if (dt.Rows.Count > 0)
            {
                ddlPreviousSchoolDistrict.DataTextField = dt.Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
                ddlPreviousSchoolDistrict.DataValueField = dt.Columns["ID"].ToString();
                // to retrive specific  textfield name   
                ddlPreviousSchoolDistrict.DataSource = dt;      //assigning datasource to the dropdownlist  
                ddlPreviousSchoolDistrict.DataBind();

            }
            ddlPreviousSchoolDistrict.Items.Insert(0, new ListItem("Please select", ""));

        }
        public void BindSchoolDistrictDropDown()
        {
            DataTable dt = new DataTable();
            var Class = ddlClass.SelectedItem.Value.ToUpper();

            SqlParameter[] parameter = {
                    new SqlParameter("@StateCode", "23"),
                        new SqlParameter("@LangID", "1"),
                        new SqlParameter("@Class",Class)
            };

            dt = sqlhelper.ExecuteDataTable("[GetDistrictSTSP]", parameter);

            if (dt.Rows.Count > 0)
            {
                ddlSchoolDistrict.DataTextField = dt.Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
                ddlSchoolDistrict.DataValueField = dt.Columns["ID"].ToString();
                // to retrive specific  textfield name   
                ddlSchoolDistrict.DataSource = dt;      //assigning datasource to the dropdownlist  
                ddlSchoolDistrict.DataBind();

            }
            ddlSchoolDistrict.Items.Insert(0, new ListItem("Please select", ""));

        }

        public void BindRegDistrictDropDown()
        {
            DataTable dt = new DataTable();
            SqlParameter[] parameter = {
                    new SqlParameter("@StateCode", "23"),
                        new SqlParameter("@LangID", "1")
            };

            dt = sqlhelper.ExecuteDataTable("[GetMPBOCDistrictSTSP]", parameter);

            if (dt.Rows.Count > 0)
            {
                ddlRegDistrict.DataTextField = dt.Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
                ddlRegDistrict.DataValueField = dt.Columns["ID"].ToString();
                // to retrive specific  textfield name   
                ddlRegDistrict.DataSource = dt;      //assigning datasource to the dropdownlist  
                ddlRegDistrict.DataBind();

            }
            ddlRegDistrict.Items.Insert(0, new ListItem("Please select", ""));

        }
        public void BindClassDropDown()
        {
            DataTable dt = new DataTable();

            dt = sqlhelper.ExecuteDataTable("GetMPBOCClassSP");

            if (dt.Rows.Count > 0)
            {
                ddlClass.DataTextField = dt.Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
                ddlClass.DataValueField = dt.Columns["ID"].ToString();
                // to retrive specific  textfield name   
                ddlClass.DataSource = dt;      //assigning datasource to the dropdownlist  
                ddlClass.DataBind();

            }
            ddlClass.Items.Insert(0, new ListItem("Please select", ""));

        }

        public void BindCasteDropDown()
        {
            DataTable dt = new DataTable();

            var District = ddlSchoolDistrict.SelectedItem.Value.ToUpper();
            var Class = ddlClass.SelectedItem.Value.ToUpper();
            var School = ddlSchool.SelectedItem.Value.ToUpper();

            SqlParameter[] parameter = {
                        new SqlParameter("@District",District),
                         new SqlParameter("@Class",Class),
                          new SqlParameter("@School",School)
            };

            dt = sqlhelper.ExecuteDataTable("GetMPBOCCasteSP", parameter);

            if (dt.Rows.Count > 0)
            {
                ddlCaste.DataTextField = dt.Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
                ddlCaste.DataValueField = dt.Columns["ID"].ToString();
                // to retrive specific  textfield name   
                ddlCaste.DataSource = dt;      //assigning datasource to the dropdownlist  
                ddlCaste.DataBind();

            }
            ddlCaste.Items.Insert(0, new ListItem("Please select", ""));

        }





        protected void btnPhoto_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            string fileSTR = "images\\";
            strFolder = Server.MapPath("./") + fileSTR;
            // Get the name of the file that is posted.
            strFileName = File1.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (File1.Value != "")
            {
                // Create the directory if it does not exist.
                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;
                string strf = Guid.NewGuid().ToString();

                string destFileName = Path.Combine(strFolder, strf + ".jpg");



                if (File.Exists(destFileName))
                {
                    lblUploadResultPhoto.Text = strFileName + " already exists on the server!";
                }
                else
                {
                    File1.PostedFile.SaveAs(strFilePath);
                    File.Copy(strFilePath, destFileName);
                    string imgPath = "~/images/" + strf + ".jpg";

                    byte[] imageArray = System.IO.File.ReadAllBytes(destFileName);
                    string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                    var val = $"data: image/png; base64,{base64ImageRepresentation}";
                    hdnImage.Value = val;
                    hdnImageName.Value = destFileName;
                    myImg.Attributes.Add("src", val);
                    myImg.Width = Unit.Pixel(200);
                    myImg.Height = Unit.Pixel(150);
                    myImg.DataBind();

                    lblUploadResultPhoto.Text = strFileName + " has been successfully uploaded.";
                }
            }
            else
            {
                lblUploadResultPhoto.Text = "Click 'Browse' to select the file to upload.";
            }
            // Display the result of the upload.
            frmConfirmationPhoto.Visible = true;

        }



        protected void btnSubMain_Click(object sender, EventArgs e)
        {
            try
            {

                string[] replaceThese = { "data:image/png;base64,", "data:image/jpeg;base64,", "data:image/jpg;base64," };


                var chkrbnpass = false;

                var chkNative = false;

                var disDropDown = ddlDisAbility.SelectedItem.Value;

                if (hdnImageName.Value == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Image could not be Attached.');", true);
                    return;
                }



                if (disDropDown == "Y")
                {
                    tdDisAbility.Visible = true;
                    if (hdnFileDisAbilityName.Value == "")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Disable Certificate could not be Attached.');", true);
                        return;
                    }
                }
                else
                {
                    tdDisAbility.Visible = false;
                    txtDisAbilityNo.Text = "";
                    ddlDisAbilityType.SelectedItem.Value = "0";

                }


                if (rbnNative1.Checked)
                {
                    chkNative = true;

                    if (hdnFileNativeCertName.Value == "")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Domicile Certificate could not be Attached.');", true);
                        return;
                    }
                }
                else
                {
                    chkNative = false;
                }


                var chkIsMarksheetSub = false;

                if (RadioButton2.Checked)
                {

                    div3.Visible= true;

                    if (hdnFile5MShName.Value == "")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Previous Marksheet could not be Attached.');", true);
                        return;
                    }
                }

                if (RadioButton1.Checked)
                {
                    div3.Visible = false;
                    chkIsMarksheetSub = true;
                    RequiredFieldValidator20.Enabled = false;
                    RequiredFieldValidator15.Enabled = false;
                    RequiredFieldValidator18.Enabled = false;
                

                }
                else
                {
                    chkIsMarksheetSub = false;

                    if (hdnFile5MShName.Value == "")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Previous Marksheet could not be Attached.');", true);
                        return;
                    }

                }

                if (ddlCaste.SelectedItem.Value != "1")
                {
                    div4.Visible = true;
                }
                else
                {
                    div4.Visible = false;
                }


                if (txtCastCertNo.Text != "")
                {
                    if (hdnFileCasteName.Value == "")
                    {
                        if (ddlCaste.SelectedItem.Value != "1")
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Caste Certificate could not be Attached.');", true);
                            return;
                        }
                    }

                }

                







                MPBOCStudentdata_DT t_ObjDT = new MPBOCStudentdata_DT();
                t_ObjDT.StudentName = txtFullName.Text.Trim();
                t_ObjDT.StudentID = txtRegNo.Text.Trim();

                t_ObjDT.IsPassOtherBoard = chkrbnpass;
                t_ObjDT.IsMPNative = chkNative;
                t_ObjDT.FatherName = txtFatherName.Text.Trim();
                t_ObjDT.MotherName = txtMotherName.Text.Trim();
                t_ObjDT.Birthdate = hdnBirthDate.Value.Trim();
                t_ObjDT.Gender = ddlGender.SelectedValue.Trim();
                t_ObjDT.Class = ddlClass.SelectedValue;
                t_ObjDT.School = ddlSchool.SelectedValue;

                t_ObjDT.Img = hdnImage.Value;
                t_ObjDT.File5MSh = hdnFile5MSh.Value;
                t_ObjDT.FileDisAbility = hdnFileDisAbility.Value;
                t_ObjDT.FileCaste = hdnFileCaste.Value;
                t_ObjDT.FileNativeCert = hdnFileNativeCert.Value;

                t_ObjDT.NImg = hdnImageName.Value;
                t_ObjDT.NFile5MSh = hdnFile5MShName.Value;
                t_ObjDT.NFileDisAbility = hdnFileDisAbilityName.Value;
                t_ObjDT.NFileCaste = hdnFileCasteName.Value;
                t_ObjDT.NFileNativeCert = hdnFileNativeCertName.Value;

                t_ObjDT.Category = ddlCaste.SelectedValue.Trim();

                t_ObjDT.City = txtCity.Text.Trim();
                t_ObjDT.Block = txtBlock.Text.Trim();
                t_ObjDT.District = ddlAddDistrict.SelectedValue.Trim();
                t_ObjDT.Colony = txtColony.Text.Trim();
                t_ObjDT.HouseNo = txtHouse.Text.Trim();
                t_ObjDT.pincode = txtPinCode.Text.Trim();



                t_ObjDT.CastCertNo = txtCastCertNo.Text.Trim();
                t_ObjDT.RegDistrict = ddlRegDistrict.SelectedValue.Trim();
                t_ObjDT.PassingYear = ddlPassYear.SelectedValue.Trim();
                t_ObjDT.ScClass = ddlScClass.SelectedValue.Trim();
                t_ObjDT.SchoolVikaskhand = ddlSchoolVikaskhand.SelectedValue.Trim();
                t_ObjDT.SchoolDistrict = ddlSchoolDistrict.SelectedValue.Trim();
                t_ObjDT.PreviousSchoolDistrict = ddlPreviousSchoolDistrict.SelectedValue.Trim();
                t_ObjDT.SchoolType = ddlSchoolType.SelectedValue.Trim();
                t_ObjDT.Grade = txtGrade.Text.Trim();


                t_ObjDT.DisAbility = ddlDisAbility.SelectedValue.Trim();
                t_ObjDT.DisAbilityType = ddlDisAbilityType.SelectedValue.Trim();
                t_ObjDT.DisAbilityNo = txtDisAbilityNo.Text.Trim();

                t_ObjDT.IsMarksheetSub = chkIsMarksheetSub;

                long defaultLongVal = 0;
                long.TryParse(txtSamagraNo.Text.Trim(), out defaultLongVal);


                t_ObjDT.SamagraNo = defaultLongVal;

                long defaultIntVal = 0;
                long.TryParse(txtMobie.Text.Trim(), out defaultIntVal);
                t_ObjDT.MobieNo = defaultIntVal;

                decimal MarksPercentageVal = 0;
                decimal.TryParse(txtMarksPercentage.Text.Trim(), out MarksPercentageVal);
                t_ObjDT.MarksPercentage = MarksPercentageVal;


                decimal TotalMarksVal = 0;
                decimal.TryParse(txtTotalMarks.Text.Trim(), out TotalMarksVal);
                t_ObjDT.TotalMarks = TotalMarksVal;

                decimal MarksObtainVal = 0;
                decimal.TryParse(txtMarksObtain.Text.Trim(), out MarksObtainVal);
                t_ObjDT.MarksObtain = MarksObtainVal;

                t_ObjDT.CertIssueDate = txtCertIssueDate.Text.Trim();

                t_ObjDT.PreviousSchoolName = txtPreviousSchoolName.Text.Trim();
                t_ObjDT.SamagraFamilyID = hdnSamagraFamilyID.Value;
                t_ObjDT.UniqueCode = hdnUniqueCode.Value;
                t_ObjDT.CardHolderName = hdnCardHolderName.Value;

                if (t_ObjDT.Birthdate != "")
                {
                    //t_ObjDT.TBirthdate = DateTime.ParseExact(t_ObjDT.Birthdate, "dd/MM/yyyy HH:mm:ss", CultureInfo.InvariantCulture);
                    t_ObjDT.TBirthdate = DateTime.ParseExact(t_ObjDT.Birthdate, "dd/MM/yyyy", null);
                }


                if (t_ObjDT.CertIssueDate != "")
                {
                    //t_ObjDT.TBirthdate = DateTime.ParseExact(t_ObjDT.Birthdate, "dd/MM/yyyy HH:mm:ss", CultureInfo.InvariantCulture);
                    t_ObjDT.TCertIssueDate = DateTime.ParseExact(t_ObjDT.CertIssueDate, "dd/MM/yyyy", null);
                }
                else
                {
                    DateTime? newdate = null;
                    t_ObjDT.TCertIssueDate = newdate;

                }

                SqlParameter[] parameter = {
                    new SqlParameter("@StudentName", t_ObjDT.StudentName),
                        new SqlParameter("@StudentID", t_ObjDT.StudentID),
                        new SqlParameter("@Birthdate", t_ObjDT.TBirthdate),
                        new SqlParameter("@Gender", t_ObjDT.Gender),
                        new SqlParameter("@Class", t_ObjDT.Class),
                        new SqlParameter("@Section", t_ObjDT.Section),
                        new SqlParameter("@Subject", t_ObjDT.Subject),
                        new SqlParameter("@School", t_ObjDT.School),
                        new SqlParameter("@FatherName", t_ObjDT.FatherName),
                        new SqlParameter("@MotherName", t_ObjDT.MotherName),
                        new SqlParameter("@Category", t_ObjDT.Category),
                        new SqlParameter("@SubCaste", t_ObjDT.SubCaste),
                        new SqlParameter("@Regilion", t_ObjDT.Regilion),
                        new SqlParameter("@IsMPNative", t_ObjDT.IsMPNative),
                        new SqlParameter("@Block", t_ObjDT.Block),
                         new SqlParameter("@City", t_ObjDT.City),
                        new SqlParameter("@District", t_ObjDT.District),
                        new SqlParameter("@Colony", t_ObjDT.Colony),
                        new SqlParameter("@HouseNo", t_ObjDT.HouseNo),
                        new SqlParameter("@pincode", t_ObjDT.pincode),
                        new SqlParameter("@MobieNo", t_ObjDT.MobieNo),
                        new SqlParameter("@SamagraNo", t_ObjDT.SamagraNo),
                        new SqlParameter("@IsDeclare", t_ObjDT.IsDeclare),
                        new SqlParameter("@IsPassOtherBoard", t_ObjDT.IsPassOtherBoard),
                        new SqlParameter("@DisAbility", t_ObjDT.DisAbility)
                        ,new SqlParameter("@DisAbilityType", t_ObjDT.DisAbilityType)
                        ,new SqlParameter("@DisAbilityNo", t_ObjDT.DisAbilityNo)
                        ,new SqlParameter("@IsMarksheetSub", t_ObjDT.IsMarksheetSub)

                        ,new SqlParameter("@SchoolType", t_ObjDT.SchoolType)
                        ,new SqlParameter("@SchoolDistrict", t_ObjDT.SchoolDistrict)
                        ,new SqlParameter("@SchoolVikaskhand", t_ObjDT.SchoolVikaskhand)
                        ,new SqlParameter("@ScClass", t_ObjDT.ScClass)
                        ,new SqlParameter("@PassingYear", t_ObjDT.PassingYear)
                        ,new SqlParameter("@MarksObtain", t_ObjDT.MarksObtain)
                        ,new SqlParameter("@TotalMarks", t_ObjDT.TotalMarks)
                        ,new SqlParameter("@MarksPercentage", t_ObjDT.MarksPercentage)
                        ,new SqlParameter("@RegDistrict", t_ObjDT.RegDistrict)
                        ,new SqlParameter("@CastCertNo", t_ObjDT.CastCertNo)
                        ,new SqlParameter("@CertIssueDate", t_ObjDT.TCertIssueDate)
                        ,new SqlParameter("@Grade", t_ObjDT.Grade),
                        new SqlParameter("@Img", t_ObjDT.Img),
                        new SqlParameter("@File5MSh", t_ObjDT.File5MSh),
                        new SqlParameter("@FileDisAbility", t_ObjDT.FileDisAbility),
                        new SqlParameter("@FileCaste", t_ObjDT.FileCaste),
                        new SqlParameter("@FileNativeCert", t_ObjDT.FileNativeCert),
                        new SqlParameter("@NImg", t_ObjDT.NImg),
                        new SqlParameter("@NFile5MSh", t_ObjDT.NFile5MSh),
                        new SqlParameter("@NFileDisAbility", t_ObjDT.NFileDisAbility),
                        new SqlParameter("@NFileCaste", t_ObjDT.NFileCaste),
                        new SqlParameter("@NFileNativeCert", t_ObjDT.NFileNativeCert),
                       new SqlParameter("@PreviousSchoolName", t_ObjDT.PreviousSchoolName),
                       new SqlParameter("@PreviousSchoolDistrict", t_ObjDT.PreviousSchoolDistrict),
                         new SqlParameter("@SamagraFamilyID", t_ObjDT.SamagraFamilyID),
                           new SqlParameter("@UniqueCode", t_ObjDT.UniqueCode),
                             new SqlParameter("@CardHolderName", t_ObjDT.CardHolderName)
            };


                DataTable dt = sqlhelper.ExecuteDataTable("InsertMPBOCStudentDetailsSP", parameter);
                var m_AppID = dt.Rows[0][0].ToString();
                var m_ServiceID = "2465";


                Response.Redirect("/WebApp/Kiosk/MPSS/AcknowledgementMPBOC.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID);
            }

            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);

            }
        }

        protected void Button5MSh_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            string fileSTR = "images5MSh\\";
            strFolder = Server.MapPath("./") + fileSTR;
            // Get the name of the file that is posted.
            strFileName = File5MSh.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (File5MSh.Value != "")
            {
                // Create the directory if it does not exist.
                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;
                string strf = Guid.NewGuid().ToString();
                string destFileName = Path.Combine(strFolder, strf + ".jpg");
                if (File.Exists(destFileName))
                {
                    Label5MSh.Text = strFileName + " already exists on the server!";
                }
                else
                {
                    File5MSh.PostedFile.SaveAs(strFilePath);
                    File.Copy(strFilePath, destFileName);
                    string imgPath = "~/images5MSh/" + strf + ".jpg";
                    byte[] imageArray = System.IO.File.ReadAllBytes(destFileName);
                    string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                    var val = $"data: image/png; base64,{base64ImageRepresentation}";
                    hdnFile5MSh.Value = val;
                    hdnFile5MShName.Value = destFileName;
                    Label5MSh.Text = strFileName + " has been successfully uploaded.";
                }
                Button5MSh.Visible = false;
                File5MSh.Visible = false;
            }
            else
            {
                Label5MSh.Text = "Click 'Browse' to select the file to upload.";
            }
            // Display the result of the upload.
            Panel5MSh.Visible = true;


        }

        protected void ButtonDisAbility_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            string fileSTR = "imagesDisAbility\\";
            strFolder = Server.MapPath("./") + fileSTR;
            // Get the name of the file that is posted.
            strFileName = FileDisAbility.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (FileDisAbility.Value != "")
            {
                // Create the directory if it does not exist.
                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;
                string strf = Guid.NewGuid().ToString();
                string destFileName = Path.Combine(strFolder, strf + ".jpg");
                if (File.Exists(destFileName))
                {
                    LabelDisAbility.Text = strFileName + " already exists on the server!";
                }
                else
                {
                    FileDisAbility.PostedFile.SaveAs(strFilePath);
                    File.Copy(strFilePath, destFileName);
                    string imgPath = "~/imagesDisAbility/" + strf + ".jpg";
                    byte[] imageArray = System.IO.File.ReadAllBytes(destFileName);
                    string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                    var val = $"data: image/png; base64,{base64ImageRepresentation}";
                    hdnFileDisAbility.Value = val;
                    hdnFileDisAbilityName.Value = destFileName;
                    LabelDisAbility.Text = strFileName + " has been successfully uploaded.";
                }
                ButtonDisAbility.Visible = false;
                FileDisAbility.Visible = false;
            }
            else
            {
                LabelDisAbility.Text = "Click 'Browse' to select the file to upload.";
            }
            // Display the result of the upload.
            PanelDisAbility.Visible = true;


        }

        protected void ButtonCaste_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            string fileSTR = "imagesCaste\\";
            strFolder = Server.MapPath("./") + fileSTR;
            // Get the name of the file that is posted.
            strFileName = FileCaste.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (FileCaste.Value != "")
            {
                // Create the directory if it does not exist.
                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;
                string strf = Guid.NewGuid().ToString();
                string destFileName = Path.Combine(strFolder, strf + ".jpg");
                if (File.Exists(destFileName))
                {
                    LabelCaste.Text = strFileName + " already exists on the server!";
                }
                else
                {
                    FileCaste.PostedFile.SaveAs(strFilePath);
                    File.Copy(strFilePath, destFileName);
                    string imgPath = "~/imagesCaste/" + strf + ".jpg";
                    byte[] imageArray = System.IO.File.ReadAllBytes(destFileName);
                    string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                    var val = $"data: image/png; base64,{base64ImageRepresentation}";
                    hdnFileCaste.Value = val;
                    hdnFileCasteName.Value = destFileName;
                    LabelCaste.Text = strFileName + " has been successfully uploaded.";
                }
                ButtonCaste.Visible = false;
                FileCaste.Visible = false;
            }
            else
            {
                LabelCaste.Text = "Click 'Browse' to select the file to upload.";
            }
            // Display the result of the upload.
            PanelCaste.Visible = true;


        }

        protected void ButtonNativeCert_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            string fileSTR = "imagesNativeCert\\";
            strFolder = Server.MapPath("./") + fileSTR;
            // Get the name of the file that is posted.
            strFileName = FileNativeCert.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (FileNativeCert.Value != "")
            {
                // Create the directory if it does not exist.
                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;
                string strf = Guid.NewGuid().ToString();
                string destFileName = Path.Combine(strFolder, strf + ".jpg");
                if (File.Exists(destFileName))
                {
                    LabelNativeCert.Text = strFileName + " already exists on the server!";
                }
                else
                {
                    FileNativeCert.PostedFile.SaveAs(strFilePath);
                    File.Copy(strFilePath, destFileName);
                    string imgPath = "~/imagesNativeCert/" + strf + ".jpg";
                    byte[] imageArray = System.IO.File.ReadAllBytes(destFileName);
                    string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                    var val = $"data: image/png; base64,{base64ImageRepresentation}";
                    hdnFileNativeCert.Value = val;
                    hdnFileNativeCertName.Value = destFileName;
                    LabelNativeCert.Text = strFileName + " has been successfully uploaded.";
                }
                ButtonNativeCert.Visible = false;
                FileNativeCert.Visible = false;
            }
            else
            {
                LabelNativeCert.Text = "Click 'Browse' to select the file to upload.";
            }
            // Display the result of the upload.
            PanelNativeCert.Visible = true;

        }







        protected void ddlSchoolDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSchoolDropDown();
            BindCasteDropDown();
            BindGenderDropDown();

        }

        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSchoolDistrictDropDown();
        }

        protected void btnShow_Click1(object sender, EventArgs e)
        {
            try
            {
                string captcha = Session["LoginCaptchaTest"].ToString();
                string strCaptcha = txtCaptcha.Text.Trim();
                if (Session["LoginCaptchaTest"] == null)
                {
                    lblCaptcha.Text = "Captcha Expired. Please re-load the Page.";
                    return;

                }
                else if (captcha == strCaptcha)
                {
                    lblCaptcha.Text = "";


                   string url = "https://labour.mp.gov.in/WebServices/MPBOC.asmx";
                    string method = "";
                    string responseText = "";

                    var Id = txtRegNo.Text.Trim();

                    var param = new Dictionary<string, string>();
                    param.Add("UniquePortalCode", Id);
                    param.Add("SCode", "$MPBOC$^%&@123");



                    //string responseText;
                    method = "GetCardHoderDetailsByUniqueCode";

                    var responseStatusCode = CallWebService(url, "http://tempuri.org/", method, param, out responseText);

                    string jsonData = responseText;
                    char[] delimiterChars = { '<' };
                    string[] sList = jsonData.Split(delimiterChars);


                    string data = sList[0];



                    dynamic stuff = JObject.Parse(data);


                    var SUCCESS = JTokenToArray<string>(stuff.Value<JToken>("SUCCESS"));



                    var st = JsonConvert.DeserializeObject<SuccessData>(Convert.ToString(SUCCESS));

                    string SamagraFamilyID = st.SamagraFamilyID;
                    string SamagraMemberID = st.SamagraMemberID;
                    string CardHolderName = st.CardHolderName;
                    string UniqueCode = st.UniqueCode;
                    if (SamagraMemberID != "")
                    {
                        pnlDetails.Visible = true;
                        pnlPhoto.Visible = true;
                        hdnSamagraFamilyID.Value = SamagraFamilyID;
                        hdnSamagraMemberID.Value = SamagraMemberID;
                        hdnCardHolderName.Value = CardHolderName;
                        hdnUniqueCode.Value = UniqueCode;

                        //txtFatherName.Text = hdnCardHolderName.Value;
                        txtSamagraNo.Text = hdnSamagraFamilyID.Value;
                        txtSamagraMemberID.Text = hdnSamagraMemberID.Value;
                        UniqueID.Text = hdnUniqueCode.Value;
                        CardHolder.Text = hdnCardHolderName.Value;
                        txtRegNo.ReadOnly = true;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('No Record Founds.');", true);
                    }
                }

                else
                {
                    lblCaptcha.Text = "Wrong Captcha Entered. Please re-enter Captcha.";
                    return;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('No Record Found.');", true);

            }

        }


        public static JObject JTokenToArray<T>(JToken jToken)
        {

            JObject parent = null;
            foreach (JToken jItem in jToken)
            {
                parent = (JObject)jItem;
                return parent;
            }
            return parent;

        }


        public class SuccessData
        {
            public string SamagraFamilyID;
            public string SamagraMemberID;
            public string CardHolderName;
            public string UniqueCode;


        }

        public static HttpStatusCode CallWebService(string webWebServiceUrl,
                                    string webServiceNamespace,
                                    string methodName,
                                    Dictionary<string, string> parameters,
                                    out string responseText)
        {

            const string soapTemplate =
        @"<?xml version=""1.0"" encoding=""utf-8""?>
<soap12:Envelope xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" xmlns:soap12=""http://www.w3.org/2003/05/soap-envelope"">
  <soap12:Body>
    <{0} xmlns=""{1}"">
      {2}    </{0}>
  </soap12:Body>
</soap12:Envelope>";

            var req = (HttpWebRequest)WebRequest.Create(webWebServiceUrl);
            req.Headers.Add("SOAPAction", "\"http://tempuri.org/GetCardHoderDetailsByUniqueCode\"");
            req.ContentType = "application/soap+xml;charset=\"utf-8\"";
            req.Accept = "text/xml";
            req.Method = "POST";

            string parametersText;

            if (parameters != null && parameters.Count > 0)
            {
                var sb = new System.Text.StringBuilder();
                foreach (var oneParameter in parameters)
                    sb.AppendFormat("  <{0}>{1}</{0}>\r\n", oneParameter.Key, System.Security.SecurityElement.Escape(oneParameter.Value));

                parametersText = sb.ToString();
            }
            else
            {
                parametersText = "";
            }

            string soapText = string.Format(soapTemplate, methodName, webServiceNamespace, parametersText);


            using (Stream stm = req.GetRequestStream())
            {
                using (var stmw = new StreamWriter(stm))
                {
                    stmw.Write(soapText);
                }
            }

            var responseHttpStatusCode = HttpStatusCode.Unused;
            responseText = null;

            using (var response = (HttpWebResponse)req.GetResponse())
            {
                responseHttpStatusCode = response.StatusCode;

                if (responseHttpStatusCode == HttpStatusCode.OK)
                {
                    int contentLength = (int)response.ContentLength;

                    if (contentLength > 0)
                    {
                        int readBytes = 0;
                        int bytesToRead = contentLength;
                        byte[] resultBytes = new byte[contentLength];

                        using (var responseStream = response.GetResponseStream())
                        {
                            while (bytesToRead > 0)
                            {
                                // Read may return anything from 0 to 10. 
                                int actualBytesRead = responseStream.Read(resultBytes, readBytes, bytesToRead);

                                // The end of the file is reached. 
                                if (actualBytesRead == 0)
                                    break;

                                readBytes += actualBytesRead;
                                bytesToRead -= actualBytesRead;
                            }

                            responseText = Encoding.UTF8.GetString(resultBytes);
                            //responseText = Encoding.ASCII.GetString(resultBytes);
                        }
                    }
                }
            }



            return responseHttpStatusCode;
        }


        public void ClearData()
        {
            txtFullName.Text = "";
            txtMotherName.Text = "";
            hdnBirthDate.Value = "";
            ddlGender.SelectedValue = "";
            ddlClass.SelectedValue = "0";
            ddlSchool.SelectedValue = "0";

            hdnImage.Value = "";
            hdnFile5MSh.Value = "";
            hdnFileDisAbility.Value = "";
            hdnFileCaste.Value = "";
            hdnFileNativeCert.Value = "";

            hdnImageName.Value = "";
            hdnFile5MShName.Value = "";
            hdnFileDisAbilityName.Value = "";
            hdnFileCasteName.Value = "";
            hdnFileNativeCertName.Value = "";

            ddlCaste.SelectedValue = "0";

            txtCity.Text = "";
            txtBlock.Text = "";
            ddlAddDistrict.SelectedValue = "0";
            txtColony.Text = "";
            txtHouse.Text = "";
            txtPinCode.Text = "";



            txtCastCertNo.Text = "";
            ddlRegDistrict.SelectedValue = "0";
            ddlPassYear.SelectedValue = "0";
            ddlScClass.SelectedValue = "0";
            ddlSchoolVikaskhand.SelectedValue = "0";
            ddlSchoolDistrict.SelectedValue = "0";
            ddlPreviousSchoolDistrict.SelectedValue = "0";
            ddlSchoolType.SelectedValue = "";
            txtGrade.Text = "";


            ddlDisAbility.SelectedValue = "0";
            ddlDisAbilityType.SelectedValue = "0";
            txtDisAbilityNo.Text = "";

            txtMobie.Text = "";

            txtMarksPercentage.Text = "";

            txtTotalMarks.Text = "";

            txtMarksObtain.Text = "";

            txtCertIssueDate.Text = "";

            txtPreviousSchoolName.Text = "";
            pnlDetails.Visible = false;
            pnlPhoto.Visible = false;

        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebApp/Kiosk/MPSS/MPSOSPage.aspx");
        }
    }
}

