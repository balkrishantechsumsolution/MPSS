using CitizenPortalLib;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G.PG
{
    public partial class PGIntimation : System.Web.UI.Page //BasePage
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        OUATBLL m_OUATBLL = new OUATBLL();
        string m_AppID, m_ServiceID;
        string m_ProfileID = "";
        string m_DocumentPath = "/QuickLinks/{0}/DocUploads/";
        string LoginID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            LoginID = Session["LoginID"].ToString();

            if (Request.QueryString["SvcID"] == null) return;
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            if (!IsPostBack)
            {
                divSubmit.Visible = false;
                divStudentDetails.Visible = false;
                
            }
        }

        private void GetOUATPGCollege(string ProgrameValue)
        {
            DataTable dt_College = null;
            dt_College = m_OUATBLL.GetOUATCollege(ProgrameValue);
            ddlCollege.Items.Clear();
            ddlCollege.DataSource = dt_College;
            ddlCollege.DataTextField = "PGCollegeName";
            ddlCollege.DataValueField = "PGCollegeID";
            ddlCollege.DataBind();
            ddlCollege.Items.Insert(0, new ListItem("--Select College--", "0"));
        }

        private void GetOUATDegree(string CollegeID)
        {
            DataTable dt_Degree = null;
            dt_Degree = m_OUATBLL.GetOUATDegree(CollegeID);
            ddlDegree.Items.Clear();
            ddlDegree.DataSource = dt_Degree;
            ddlDegree.DataTextField = "PGDegreeName";
            ddlDegree.DataValueField = "PGDegreeId";
            ddlDegree.DataBind();
            ddlDegree.Items.Insert(0, new ListItem("--Select Degree--", "0"));
        }

        private void GetOUATSubject(string DegreeID)
        {
            DataTable dt_Subject = null;
            dt_Subject = m_OUATBLL.GetOUATSubject(DegreeID);
            ddlSubject.Items.Clear();
            ddlSubject.DataSource = dt_Subject;
            ddlSubject.DataTextField = "PGDegreeSubject";
            ddlSubject.DataValueField = "RoWID";
            ddlSubject.DataBind();
            ddlSubject.Items.Insert(0, new ListItem("--Select Subject--", "0"));
        }
               

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoginID = Session["LoginID"].ToString();
            int Department = Convert.ToInt32(Session["Department"].ToString());
            string AppID = "";
            

            GetApplicantDetails();
            
            
        }

        private void GetApplicantDetails()
        {
            string RollNo = txtRoll.Text;
            //m_AppID = Request.QueryString["AppID"].ToString();
            //m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet dt = m_OUATBLL.GetSUPGPhDIntimation(m_ServiceID, RollNo, LoginID);
            DataTable dtApp = dt.Tables[0];
            //DataTable dtTransDetail = dt.Tables[1];
            if (dtApp.Rows.Count != 0)
            {
                m_AppID = dtApp.Rows[0]["AppID"].ToString();
                lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
                lblAppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["CreatedOn"]).ToString("dd/MM/yyyy HH:mm:ss");
                lblAppname.Text = dtApp.Rows[0]["FullName"].ToString();
                lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();
                lblMobile.Text = dtApp.Rows[0]["Mobile"].ToString();
                lblEmail.Text = dtApp.Rows[0]["EmailId"].ToString();
                lblDOB.Text = dtApp.Rows[0]["DOB"].ToString();

                lblCategory.Text = dtApp.Rows[0]["Religion"].ToString() + " (" + dtApp.Rows[0]["Category"].ToString() + ") ";
                //ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfileSign.Src = dtApp.Rows[0]["ImageSign"].ToString();
                lblRollNo.Text = dtApp.Rows[0]["RollNumber"].ToString();
                lblProgram.Text = dtApp.Rows[0]["Program"].ToString();
                lblDepartment.Text = dtApp.Rows[0]["DepartmentName"].ToString();
                lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
                lblMother.Text = dtApp.Rows[0]["mothername"].ToString();


                hdnAppID.Value = dtApp.Rows[0]["AppID"].ToString();
                hdnProfileID.Value = dtApp.Rows[0]["ProfileID"].ToString();
                
                HtmlAnchor t_Anchor = null;
                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "fileDownload";

                t_Anchor.InnerHtml = "Download Intimation Letter";
                string t_FilePath = "";
                if (dtApp.Rows[0]["FilePath"].ToString() != null && dtApp.Rows[0]["FilePath"].ToString() != "")
                {
                    trFile.Visible = true;
                    t_FilePath = dtApp.Rows[0]["FilePath"].ToString();
                    lblDownload.Attributes.Add("onclick", "DownloadFile('" + t_FilePath + "','')");
                    lblDownload.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                    lblDownload.InnerText = "Download Intimation Letter";
                    divReport.Visible = false;

                    lblMsg.Text = "Intimation letter already uploaded";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + lblMsg.Text + "');", true);

                }
                else
                {
                    lblDownload.Attributes.Clear();
                    lblDownload.InnerText = "No Intimation Letter Uploaded";
                    divReport.Visible = true;
                    lblMsg.Text = "No Intimation Letter Uploaded";
                }

                try
                {
                    QRCode1.GenerateQRCodeApplication(m_ServiceID, m_AppID);
                }
                catch { }
                divStudentDetails.Visible = true;
            }
            else
            {
                divStudentDetails.Visible = false;
                string m_Message = "No record found Roll Number";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);

                //lblMsg.Text = m_Message;
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);
            }




            
            txtAddNo.Text = "";
            ddlCollege.SelectedIndex = 0;
            ddlDegree.Items.Clear();
            ddlSubject.Items.Clear();

        }

        private void GetStudentDetails(string RollNo)
        {
            DataTable dtApp = null;

            dtApp = m_OUATBLL.GetOUATPGPHDStudentDetails(RollNo);

            //DataTable dtTransDetail = dt.Tables[1];
            if (dtApp.Rows.Count != 0)
            {
                divSubmit.Visible = true;
                divStudentDetails.Visible = true;
                
                lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
                
                lblAppname.Text = dtApp.Rows[0]["FullName"].ToString();
                lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();
                lblMobile.Text = dtApp.Rows[0]["Mobile"].ToString();
                lblEmail.Text = dtApp.Rows[0]["EmailId"].ToString();
                lblDOB.Text = dtApp.Rows[0]["DOB"].ToString();
                lblAge.Text = dtApp.Rows[0]["Age"].ToString() + " years";
                lblCategory.Text = dtApp.Rows[0]["Category"].ToString();
                ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfileSign.Src = dtApp.Rows[0]["ImageSign"].ToString();
                lblRollNo.Text = dtApp.Rows[0]["RollNumber"].ToString();
                //lblDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AllocationTime"]).ToString("dd/MM/yyyy");
                lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
                lblMother.Text = dtApp.Rows[0]["mothername"].ToString();
                
                try
                {
                    QRCode1.GenerateQRCodeApplication(m_ServiceID, lblAppID.Text);
                }
                catch { }
            }
            else
            {
                divSubmit.Visible = false;
                divStudentDetails.Visible = false;
                

                string m_Message = "Sorry! No record found " + m_AppID + " please check the Roll Number.";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //lblProgram ddlProgram.SelectedItem.Text;
            if (txtAddNo.Text == "")
            {
                string m_Message = @"Please select PROGRAMME / COLLEGE / DEGREE / SUBJECT";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (ddlProgram.SelectedValue == "0")
            {
                string m_Message = @"Please select PROGRAMME / COLLEGE / DEGREE / SUBJECT";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (ddlCollege.SelectedValue == "0" || ddlCollege.SelectedValue == "")
            {
                string m_Message = @"Please select PROGRAMME / COLLEGE / DEGREE / SUBJECT";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (ddlDegree.SelectedValue == "0" || ddlDegree.SelectedValue == "")
            {
                string m_Message = @"Please select PROGRAMME / COLLEGE / DEGREE / SUBJECT";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (ddlSubject.SelectedValue == "0" || ddlSubject.SelectedValue == "")
            {
                string m_Message = @"Please select PROGRAMME / COLLEGE / DEGREE / SUBJECT";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            //if (txtAddNo.Text !="" || ddlProgram.SelectedValue !="0" || ddlCollege.SelectedValue != "0" || ddlDegree.SelectedValue != "0" || ddlSubject.SelectedValue != "0")
            {

                
                string[] AFields =
                {

                 "RollNo"
                ,"AppID"
                ,"AadhaarNumber"
                ,"AdmissionNo"
                ,"CollegeName"
                ,"CourseName"
                ,"CreatedBy"
                ,"CollegeLeavingCertificate"
                ,"ConductCertificate"
                ,"MigrationCertificate"
                ,"MedicalFitnessCertificate"
                ,"Subject"
                ,"Programme"

            };

                string t_CLC = "0", t_CC = "0", t_MC = "0", t_MFC = "0";

               
                OUATPGAdmissionData_DT t_OUATPGAdmissionData_DT = new OUATPGAdmissionData_DT();

                t_OUATPGAdmissionData_DT.RollNo = lblRollNo.Text;
                t_OUATPGAdmissionData_DT.AppID = lblAppID.Text;
                t_OUATPGAdmissionData_DT.CreatedBy = Session["LoginID"].ToString();
                t_OUATPGAdmissionData_DT.CollegeLeavingCertificate = t_CLC;
                t_OUATPGAdmissionData_DT.ConductCertificate = t_CC;
                t_OUATPGAdmissionData_DT.MigrationCertificate = t_MC;
                t_OUATPGAdmissionData_DT.MedicalFitnessCertificate = t_MFC;

                System.Data.DataTable result = null;
                string UID = "";

                result = m_OUATBLL.InsertOUATPGAdmissionData(t_OUATPGAdmissionData_DT, AFields);

                if (result != null && result.Rows.Count > 0)
                {
                    if (result.Rows[0]["Result"].ToString() == "1")
                    {
                        string m_Message = "Record Saved Sucessfully!";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);

                        GetOUATPGAdmissionData(txtRoll.Text);
                    }
                }
            }
            //else {

            //    string m_Message = @"Please select PROGRAMME / COLLEGE / DEGREE / SUBJECT";
            //    lblMsg.Text = m_Message;
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
            //}
        }
    

        private void GetOUATPGAdmissionData(string RollNo)
        {
            

            DataTable dtApp = m_OUATBLL.GetOUATPGAdmissionData(RollNo);

            if (dtApp.Rows.Count != 0)
            {
                divSubmit.Visible = false;
                divStudentDetails.Visible = true;
               

                try
                {
                    QRCode1.GenerateQRCodeApplication(m_ServiceID, m_AppID);
                }
                catch { }

                //lblMsg.Text = "College and Course assiged to ROLL NO.: " + txtRoll.Text.ToUpper() + " with Admission No.:" + lblAdmissionNo.Text.ToUpper();
            }
            
        }


        protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            GetOUATPGCollege(ddlProgram.SelectedValue);
        }

        protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            GetOUATDegree(ddlCollege.SelectedValue);
        }

        protected void ddlDegree_SelectedIndexChanged(object sender, EventArgs e)
        {            
            GetOUATSubject(ddlDegree.SelectedValue);
        }

        protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }


        static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();


        public interface IService1Channel : IAddressService, IClientChannel
        { }


        #region File Upload Utilities
        private bool saveAttachment(FileUpload photo, string photoPath, string FullfileName)
        {
            bool savefile = false;
            try
            {
                SaveFileToQuickLinks(photoPath, photo.PostedFile, new string[] { ".jpeg", ".jpg", ".pdf", ".png" }, FullfileName);
                savefile = true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return savefile;
        }
        private string GetDirectory(string Filename)
        {
            return Filename.Substring(0, Filename.LastIndexOf("\\"));
        }
        private void SaveFileToQuickLinks(string Path, HttpPostedFile File, string[] AllowedFormats, string FullfileName)
        {
            string ext = GetFileExtension(File, AllowedFormats);
            SaveFileToQuickLinks(Path + "/" + FullfileName, File);
            return;
        }
        private string GetFileExtension(HttpPostedFile file, string[] AllowedFormats)
        {
            string p;
            if (file != null)
            {
                p = file.FileName;
                return GetFileExtension(p, AllowedFormats);
            }
            else
            {
                return null;
            }
        }
        private string CheckExtension(string ext, string[] AllowedExtensions)
        {
            //return ((ext.ToLower() == ".jpg") || (ext.ToLower() == ".gif")) ? ext.ToLower() : ".txt";
            bool valiedFormat = false;
            if (ext == null) { return null; }
            for (int tempI = 0; tempI < AllowedExtensions.Length; tempI++)
            {
                if (AllowedExtensions[tempI].ToLower() == ext.ToLower()) { valiedFormat = true; }
            }
            if (!valiedFormat) { return ".txt"; }
            else return ext.ToLower();
        }
        private string GetFileExtension(string File, string[] AllowedExtensions)
        {
            string ext = ((File == "") || (File == null)) ? null : CheckExtension(File.Substring(File.LastIndexOf(".")), AllowedExtensions);
            //return (File == "") ? null : CheckExtension(File.Substring(File.LastIndexOf(".")));
            return CheckExtension(ext, AllowedExtensions);
        }
        private string LocMapPath(string url)
        {
            //return "";// Resources.resource.lblQuickLinksDirectory + url.Replace("/", "\\").ToString();
            string QuickLinksDirectory = System.Configuration.ConfigurationManager.AppSettings["QuickLinksDirectory"].ToString();
            string filePath = QuickLinksDirectory + url.Replace("/", "\\").ToString();// ConfigurationManager.AppSettings["Path"].ToString() + url.Replace("/", "\\").ToString();
            return filePath;
        }

        int UploadReport()
        {
            int result = 0;
            FileUpload fu = (FileUpload)fuReport;
            //Label lblSubCatID = (Label)gvDoc.Rows[rowIndex].FindControl("lblSubCatID");
            m_AppID = hdnAppID.Value;
            m_ProfileID = hdnProfileID.Value;

            string _Profileid = m_ProfileID;
            string lblSubCatID = "3";

            string t_CreatedBy = Session["LoginID"].ToString();
            string t_IPAddress = Request.UserHostAddress;
            try
            {
                if (fu.HasFile)
                {
                    string path = string.Format(m_DocumentPath, m_ProfileID);// "/MPOQuickLinks/MPPHSCL/Registration/DocUploads/" + _Profileid + "/" + AppID;
                    string finenameSuffix = Convert.ToString(DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString());
                    string fileName = Path.GetFileName(fu.FileName);
                    //string FullfileName = Path.GetFileName(fu.FileName + "_" + finenameSuffix);
                    string fileExt = Path.GetExtension(fu.FileName).ToLower();
                    string Error = ValidateFileSizeAndExtn(fu);
                    if (Error != string.Empty)
                    {
                        result = 0;
                        throw new Exception(Error);
                    }
                    string lblDocID = "DOC999";
                    string Docname = _Profileid.ToString() + "_" + lblDocID.Trim() + "_" + finenameSuffix.ToString() + fileExt.ToString();
                    if (!saveAttachment(fu, path, Docname))
                    {
                        result = 0;
                        throw new Exception("An error occured while uploading. Please Try later");
                    }

                    DocumentBriefcaseBLL t_DocumentBriefcaseBLL = new DocumentBriefcaseBLL();
                    t_DocumentBriefcaseBLL.SaveG2GDocument(m_ProfileID, "", m_ServiceID, m_AppID,
                        lblDocID.Trim(), Docname.ToString(), path.ToString() + "/" + Docname.ToString()
                        , "", t_CreatedBy, DateTime.Now.ToString("yyy-MM-dd"), ""
                        , Docname, path.ToString() + "/" + Docname.ToString(), "", "", "", "", "", "", "", ""
                        , "", "", "", "", ""
                        , "", "", "", "", "");

                    hdnDocName.Value = path.ToString() + "/" + Docname.ToString();
                    result = 1;

                    divErr.InnerHtml = "File Uploaded Successfully !!";
                    divErr.Attributes.Add("class", "success");
                    divErr.Style.Add("display", "");

                    //DisplayUploadedFiles();

                    //gvDoc.Style.Add("dislpay", "block");
                }
                /* 2016-11-07 File Upload Logic commented as per feedback to not mark the file upload as mandatory option for Dept User */
                //else
                //{
                //    divErr.InnerHtml = "Please select file for upload";
                //    divErr.Style.Add("display", "");
                //    divErr.Attributes.Add("class", "error");
                //    //gvDoc.Style.Add("dislpay", "block");
                //}
                else
                {
                    result = 1;

                }
            }
            catch (Exception ex)
            {

                divErr.InnerHtml = ex.Message;
                divErr.Style.Add("display", "");
                divErr.Attributes.Add("class", "error");
            }
            return result;
        }

        protected void btnUpload_Click(object sender, ImageClickEventArgs e)
        {
            int result;
            
                result = UploadReport();
            
            if(result == 1)
            {
                DisplayUploadedFiles();
            }
        }

        private void SaveFileToQuickLinks(string Filename, HttpPostedFile _File)
        {
            if (_File != null)
            {
                if ((Filename != null))
                {
                    if (_File.ContentLength == 0)
                    {
                        return;
                        //throw new ApplicationException("The uploaded file is either empty or an error occured while uploading the file. Check the file and try again.");
                    }
                    string FilePath = LocMapPath(Filename);
                    String directory = GetDirectory(FilePath);
                    if (!Directory.Exists(directory))
                    {
                        Directory.CreateDirectory(directory);
                    }
                    _File.SaveAs(FilePath);
                    if (File.Exists(FilePath))
                    {
                        File.SetAttributes(FilePath, FileAttributes.Normal);
                    }
                }
            }
        }

        private string ValidateFileSizeAndExtn(FileUpload flUpl)
        {
            string FileExtension = string.Empty;
            if (!flUpl.HasFile)
            {
                return "Select a file to upload !";
            }
            else if (flUpl.FileBytes.Length > (10 * 1048576))// 200KB = 204800, 1 MB = 1048576
            {
                return "File should not be greater than 1500 KB !";
            }
            else if (Path.GetExtension(flUpl.PostedFile.FileName) == "")
            {
                return "File must be .jpg or .jpeg or .pdf !";

            }
            else
            {


                FileExtension = Path.GetExtension(flUpl.PostedFile.FileName).Substring(1).ToUpper();
                byte[] imgfile = null;
                if (FileExtension == "JPG" | FileExtension == "JPEG")
                {
                    Stream fs = null;
                    fs = flUpl.PostedFile.InputStream;
                    BinaryReader br1 = new BinaryReader(fs);
                    imgfile = br1.ReadBytes(flUpl.PostedFile.ContentLength);
                    bool fii = false;
                    fii = CheckForIsImage(imgfile, flUpl);
                    if (fii == false)
                    {
                        return "File must be .jpg or .jpeg or .pdf !";
                    }
                }
                else if (FileExtension == "PDF")
                {
                    System.IO.BinaryReader r = new System.IO.BinaryReader(flUpl.PostedFile.InputStream);
                    string fileclass = string.Empty;
                    byte buffer = 0;
                    buffer = r.ReadByte();
                    fileclass = buffer.ToString();
                    buffer = r.ReadByte();
                    fileclass += buffer.ToString();
                    if ((fileclass == "3780"))
                    {
                        return string.Empty;
                    }
                    else
                    { return "File must be .jpg or .jpeg or .pdf !"; }
                }

                if (FileExtension == "JPG")
                {
                    return string.Empty;
                }
                else if (FileExtension == "JPEG")
                {
                    return string.Empty;
                }
                else
                {
                    return "File must be .jpg or .jpeg or .pdf !";
                }
            }
        }

        public static bool CheckForIsImage(byte[] data, FileUpload FU)
        {
            //read 64 bytes of the stream only to determine the type
            string myStr = System.Text.Encoding.ASCII.GetString(data).Substring(0, 16);
            //check if its definately an image.
            if (myStr.Substring(8, 2).ToString().ToLower() != "if")
            {
                //its not a jpeg
                if (myStr.Substring(0, 3).ToString().ToLower() != "gif")
                {
                    //its not a gif
                    if (myStr.Substring(0, 2).ToString().ToLower() != "bm")
                    {
                        //its not a .bmp
                        if (myStr.Substring(0, 2).ToString().ToLower() != "png")
                        {
                            //its not a .bmp
                            if (myStr.Substring(0, 2).ToString().ToLower() != "ii")
                            {
                                //its not a tiff
                                //ProcessErrors("notImage");
                                FU.PostedFile.InputStream.Close();
                                myStr = null;
                                return false;
                            }
                        }
                    }
                }

            }
            myStr = null;
            return true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string[] AFields =
            {
                "AppID",
                "RollNo",
                "DocPath",
                "MobileNo",
                "EmailID",
                "CreatedBy"
            };

            IntimationData_DT t_IntimationData_DT = new IntimationData_DT();


            t_IntimationData_DT.AppID = lblAppID.Text;
            t_IntimationData_DT.RollNo = lblRollNo.Text;
            t_IntimationData_DT.DocPath = hdnDocName.Value;
            t_IntimationData_DT.MobileNo = lblMobile.Text;
            t_IntimationData_DT.EmailID = lblEmail.Text;
            t_IntimationData_DT.CreatedBy = LoginID;

            System.Data.DataTable result = null;
            string UID = "";

            result = m_OUATBLL.InsertPGPhDIntimationData(t_IntimationData_DT, AFields);

            if (result != null && result.Rows.Count > 0)
            {
                if (result.Rows[0]["Result"].ToString() == "1")
                {
                   EMailSMS m_EMailSMS = new EMailSMS();
                    m_EMailSMS.sendsms(result.Rows[0]["MobileNO"].ToString(), result.Rows[0]["SMSText"].ToString());
                    // SendSMS(result.Rows[0]["Mobile"].ToString(), "Your NFBS Application is Submitted successfully. Your Reference ID is " + AppID + ". From Lokaseba Adhikara -CAP, Odisha Govt.");
                    GetApplicantDetails();
                    string m_Message = "Record Saved Sucessfully!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);
                }
            }

        }
    

        void DisplayUploadedFiles()
        {
            DocumentBriefcaseBLL t_DocumentBriefcaseBLL = new DocumentBriefcaseBLL();
            string t_ProfileID = t_DocumentBriefcaseBLL.GetProfileID(m_ServiceID, m_AppID);

            DataTable dtDoc = t_DocumentBriefcaseBLL.GetG2GSavedDocumentDetails(t_ProfileID, "", m_ServiceID, m_AppID);

            int t_Count = dtDoc.Rows.Count;

            Panel t_Panel = pnlG2GDocs;

            t_Panel.Controls.Clear();

            if (t_Count > 0)
            {
                t_Panel.Controls.Add(new LiteralControl("<table class='table table-striped table-bordered table-hover dataTable no-footer' style='margin-bottom: 0;'>"));

                t_Panel.Controls.Add(new LiteralControl("<tr>"));

                t_Panel.Controls.Add(new LiteralControl("<th>"));
                t_Panel.Controls.Add(new LiteralControl("Document Name"));
                t_Panel.Controls.Add(new LiteralControl("</th>"));
                t_Panel.Controls.Add(new LiteralControl("<th>"));
                t_Panel.Controls.Add(new LiteralControl("Download"));
                t_Panel.Controls.Add(new LiteralControl("</th>"));

                t_Panel.Controls.Add(new LiteralControl("</tr>"));


                for (int i = 0; i < t_Count; i++)
                {
                    t_Panel.Controls.Add(new LiteralControl("<tr>"));

                    t_Panel.Controls.Add(new LiteralControl("<td>"));
                    t_Panel.Controls.Add(new LiteralControl(dtDoc.Rows[i]["DocDesc"].ToString()));
                    t_Panel.Controls.Add(new LiteralControl("</td>"));

                    t_Panel.Controls.Add(new LiteralControl("<td>"));

                    //if (dtDoc.Rows[i]["Path"].ToString() != "")
                    t_Panel.Controls.Add(new LiteralControl("<a target='_blank' href='" + dtDoc.Rows[i]["Path"].ToString() + "' >View</a>"));

                    t_Panel.Controls.Add(new LiteralControl("</td>"));


                    t_Panel.Controls.Add(new LiteralControl("</tr>"));

                }
                t_Panel.Controls.Add(new LiteralControl("</table>"));

            }
        }
        #endregion


        /*
        [WebMethod]
        public static string PrintAdmitLog(string prefix, string RollNo, string AppID)
        {
            string URL = "";

            URL = m_ServiceURL;

            HttpContext.Current.Session["DatabaseName"] = "MasterDB";

            string text;
            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    //List<Tuple<string, string>> nvc = GetSessionValues();

                    //MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    //System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    //OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.PrintAdmitLog(RollNo, AppID);

                }
            }

            return text;

        }
        */
    }
}
