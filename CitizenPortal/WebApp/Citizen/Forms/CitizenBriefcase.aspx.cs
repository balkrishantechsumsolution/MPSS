﻿using CitizenPortalLib;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.BLL;

namespace CitizenPortal.WebApp.Citizen.Forms
{
    public partial class CitizenBriefcase : BasePage
    {
        string AppID = string.Empty;
        string m_ServiceID = "";
        string m_AppID = "";
        string m_ProfileID = "";
        string m_DocumentPath = "/QuickLinks/{0}/DocUploads/";

        protected void Page_Load(object sender, EventArgs e)
        {
            //string t_AppID = "";
            string t_ProfileID = "";
            //if (Request.QueryString != null)
            //{
            //    m_ServiceID = Request.QueryString["SvcID"].ToString();
            //    m_AppID = Convert.ToString(Request.QueryString["AppID"]);

            //}

            btnHome.PostBackUrl = Session["HomePage"].ToString();
            //DocumentBriefcaseBLL t_DocumentBriefcaseBLL = new DocumentBriefcaseBLL();
            //t_ProfileID = t_DocumentBriefcaseBLL.GetProfileID(m_ServiceID, m_AppID);

            t_ProfileID = Request.QueryString["UID"].ToString();

            //if (Convert.ToInt16(Session.Count) != 0) {
            //    t_ProfileID = Session["UID"].ToString();
            //}
            //Session["MPPHSCL_ProfileID"].ToString();
            //string t_AppID = "16505101000000000615";// Convert.ToString(Request.QueryString["AppID"]);
            //t_AppID = t_AppID.Replace(@"\", "-");
            // AppID = PortalEncryption.DecryptPasswordNew(AppIIDEncrypted).Replace(' ','\\');

            m_ProfileID = t_ProfileID;


            if (!IsPostBack)
            {
                divErr.Style.Add("display", "none");
                DataTable dtDoc = null;
                //UtilitiesAction UtilitiesAction = new UtilitiesAction();
                //DataTable dtDoc = UtilitiesAction.GetSavedDocumentDetails(t_ProfileID);

                //DocumentBriefcaseBLL t_DocumentBriefcaseBLL = new DocumentBriefcaseBLL();
                //dtDoc = t_DocumentBriefcaseBLL.GetSavedDocumentDetails(t_ProfileID);

                //if (dtDoc.Rows.Count > 1)
                //{
                //    gvDoc.DataSource = dtDoc;
                //    gvDoc.DataBind();
                //    divErr.Style.Add("display", "none");
                //}
                //else
                //{
                //    divErr.Style.Add("display", "none");
                //}

                fnFillUploadedDocument();

            }

        }

        protected void lnkDelete(Object sender, CommandEventArgs e)
        {
            int iStID = Int32.Parse(e.CommandArgument.ToString());
            #region deleteuploadedfiles
            if (e.CommandName.Equals("delete"))
            {
                //GridView Row Index
                int rowIndex = int.Parse(e.CommandArgument.ToString().Trim());
                //FileUpload fu = (FileUpload)gvDoc.Rows[rowIndex].FindControl("fu");
                //Label lblSubCatID = (Label)gvDoc.Rows[rowIndex].FindControl("lblSubCatID");
                string lblSubCatID = "3"; //for testing
                //string path = "/Quick Links/FDA/Manufacture/DocUploads/" + _Profileid;

                string finenameSuffix = Convert.ToString(DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString());
                //string fileName = Path.GetFileName(fu.FileName);
                //string FullfileName = Path.GetFileName(fu.FileName + "_" + finenameSuffix);
                //string fileExt = Path.GetExtension(fu.FileName).ToLower();
                //string Error = ValidateFileSizeAndExtn(fu);
                //if (Error != string.Empty)
                //{
                //    throw new Exception("An error occured while deleting file. Please Try later");
                //}

                Label lblDocID = (Label)gvDoc.Rows[rowIndex].FindControl("lblDocID");

                //string Docname = _Profileid.ToString() + "_" + lblSubCatID.Text.Trim() + "_" + lblDocID.Text.Trim() + "_" + finenameSuffix.ToString() + fileExt.ToString();

                //if (!saveAttachment(fu, path, Docname))
                //{
                //    throw new Exception("An error occured while deleteting file. Please Try later");
                //}
                //lblDocID
                /*using (SqlConnection _conn = Connection.GetConnection(Databases.MPPHSCL))
                {
                    try
                    {
                        _conn.Open();
                        _conn.ChangeDatabase("MPPHSCL");
                        SqlCommand cmd = Functions.CreateCommand("DeleteDocumentSp", _conn, null);

                        #region Parameter Initialization
                        string _Profileid = Session["MPPHSCL_ProfileID"].ToString();
                        // For  testing
                        cmd.Parameters.AddWithValue("@ProfileID", _Profileid.ToString());
                        cmd.Parameters.AddWithValue("@DocID", lblDocID.Text.Trim());
                        //cmd.Parameters.AddWithValue("@DocName", Docname.ToString());
                        //cmd.Parameters.AddWithValue("@Path", path.ToString() + "/" + Docname.ToString());
                        cmd.Parameters.AddWithValue("@SubCatID", lblSubCatID);
                        cmd.Parameters.AddWithValue("@AppType", "New");
                        #endregion
                        UtilitiesDB.ExecuteQueryDatasetSp(cmd, "MPPHSCL");
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    finally
                    {
                        if (_conn != null)
                        {
                            _conn.Close();
                        }
                    }
                }
                */

                DocumentBriefcaseBLL t_DocumentBriefcaseBLL = new DocumentBriefcaseBLL();
                t_DocumentBriefcaseBLL.DeleteDocument(m_ProfileID, "", m_ServiceID, m_AppID, lblDocID.Text.Trim());


                //ddlProprietorship_SelectedIndexChanged(null, null);
                fnFillUploadedDocument();
                divErr.InnerHtml = "File Deleted Successfully !!";
                divErr.Attributes.Add("class", "success");
                divErr.Style.Add("display", "");
            }
            #endregion deleteuploadedfiles
        }

        protected void gvDoc_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    Label lblIsMandatory = (Label)e.Row.FindControl("IsMandatory");
            //    if ((lblIsMandatory.Text).ToUpper() == ("Y").ToUpper())
            //    {
            //        lblIsMandatory.Text = "*";
            //    }
            //    else
            //    {
            //        lblIsMandatory.Text = "";
            //    }
            //}
        }

        protected void gvDoc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            divErr.InnerHtml = "Please select file for upload";
            divErr.Style.Add("display", "none");
            try
            {
                if (e.CommandName.Equals("save"))
                {
                    //GridView Row Index
                    int rowIndex = int.Parse(e.CommandArgument.ToString().Trim());

                    FileUpload fu = (FileUpload)gvDoc.Rows[rowIndex].FindControl("fu");
                    //Label lblSubCatID = (Label)gvDoc.Rows[rowIndex].FindControl("lblSubCatID");
                    string _Profileid = m_ProfileID;
                    string lblSubCatID = "3";

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
                            throw new Exception(Error);
                        }
                        Label lblDocID = (Label)gvDoc.Rows[rowIndex].FindControl("lblDocID");
                        string Docname = _Profileid.ToString() + "_" + lblDocID.Text.Trim() + "_" + finenameSuffix.ToString() + fileExt.ToString();
                        if (!saveAttachment(fu, path, Docname))
                        {
                            throw new Exception("An error occured while uploading. Please Try later");
                        }
                        /*
                        using (SqlConnection _conn = Connection.GetConnection(Databases.MPPHSCL))
                        {
                            try
                            {
                                _conn.Open();
                                _conn.ChangeDatabase("MPPHSCL");
                                SqlCommand cmd = Functions.CreateCommand("InsertDocumentSp", _conn, null);

                                #region Parameter Initialization
                                //cmd.Parameters.AddWithValue("@ProfileID", Session["ProfileID"].ToString());
                                // For  testing
                                cmd.Parameters.AddWithValue("@ProfileID", _Profileid.ToString());
                                cmd.Parameters.AddWithValue("@DocID", lblDocID.Text.Trim());
                                cmd.Parameters.AddWithValue("@DocName", Docname.ToString());
                                cmd.Parameters.AddWithValue("@Path", path.ToString() + "/" + Docname.ToString());
                                cmd.Parameters.AddWithValue("@SubCatID", lblSubCatID);
                                cmd.Parameters.AddWithValue("@AppType", "New");
                                cmd.Parameters.AddWithValue("@AppID", AppID);
                                #endregion
                                UtilitiesDB.ExecuteQueryDatasetSp(cmd, "MPPHSCL");
                            }
                            catch (Exception ex)
                            {
                                throw new Exception(ex.Message);
                            }
                            finally
                            {
                                if (_conn != null)
                                {
                                    _conn.Close();
                                }
                            }
                        }
                        */

                        DocumentBriefcaseBLL t_DocumentBriefcaseBLL = new DocumentBriefcaseBLL();
                        t_DocumentBriefcaseBLL.SaveDocument(m_ProfileID, "", m_ServiceID, m_AppID,
                            lblDocID.Text.Trim(), Docname.ToString(), path.ToString() + "/" + Docname.ToString());


                        fnFillUploadedDocument();
                        divErr.InnerHtml = "File Uploaded Successfully !!";
                        divErr.Attributes.Add("class", "success");
                        divErr.Style.Add("display", "");
                        //gvDoc.Style.Add("dislpay", "block");
                    }
                    else
                    {
                        divErr.InnerHtml = "Please select file for upload";
                        divErr.Style.Add("display", "");
                        divErr.Attributes.Add("class", "error");
                        gvDoc.Style.Add("dislpay", "block");
                    }
                }
            }
            catch (Exception ex)
            {

                divErr.InnerHtml = ex.Message;
                divErr.Style.Add("display", "");
                divErr.Attributes.Add("class", "error");
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
        private string ValidateFileSizeAndExtn(FileUpload flUpl)
        {
            string FileExtension = string.Empty;
            if (!flUpl.HasFile)
            {
                return "Select a file to upload !";
            }
            else if (flUpl.FileBytes.Length > 204800)// 200KB = 204800, 1 MB = 1048576
            {
                return "File should not be greater than 200 KB !";
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
        #endregion

        private DataTable EncryptPath(DataTable Dt)
        {
            foreach (DataRow rw in Dt.Rows)
            {
                if (!String.IsNullOrEmpty(Convert.ToString(rw["Path"])))
                {
                    //rw["Path"] = "Downloader.aspx?DocID=" + PortalEncryption.EncryptPassword(rw["Path"].ToString());
                }
            }
            Dt.AcceptChanges();
            return Dt;
        }
        public void fnFillUploadedDocument()
        {

            DocumentBriefcaseBLL t_DocumentBriefcaseBLL = new DocumentBriefcaseBLL();
            DataTable dtDoc = t_DocumentBriefcaseBLL.GetSavedDocumentDetailsByProfile(m_ProfileID, "");

            if (dtDoc.Rows.Count != 0)
            {
                gvDoc.DataSource = dtDoc;
                gvDoc.DataBind();
            }
            else
            {
                divErr.InnerHtml = "File Uploaded Successfully !!";
                divErr.Attributes.Add("class", "success");
                divErr.Style.Add("display", "");
                divErr.InnerText = "No attachment is required for the service";
            }
        }
        /*
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            int Cnt = 0;
            for (int i = 0; i < gvDoc.Rows.Count; i++)
            {
                FileUpload fu = (FileUpload)gvDoc.Rows[i].FindControl("fu");
                //Label lblSubCatID = (Label)gvDoc.Rows[i].FindControl("lblSubCatID");
                string _Profileid = m_ProfileID;
                string lblSubCatID = "3";
                string AppID = m_AppID;
                if (fu.HasFile)
                {
                    string path = "/MPOQuickLinks/MPPHSCL/Registration/DocUploads/" + _Profileid + "/" + AppID;
                    //string path = pathnew + "/" + AppNo;
                    string finenameSuffix = Convert.ToString(DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString());
                    string fileName = Path.GetFileName(fu.FileName);
                    //string FullfileName = Path.GetFileName(fu.FileName + "_" + finenameSuffix);
                    string fileExt = Path.GetExtension(fu.FileName).ToLower();
                    string Error = ValidateFileSizeAndExtn(fu);
                    if (Error != string.Empty)
                    {
                        //throw new Exception("An error occured while uploading. Please Try later");
                        continue;
                    }

                    Label lblDocID = (Label)gvDoc.Rows[i].FindControl("lblDocID");

                    // string Docname = _Profileid.ToString() + "_" + lblSubCatID.Text.Trim() + "_" + lblDocID.Text.Trim() + "_" + finenameSuffix.ToString() + fileExt.ToString();
                    string Docname = _Profileid.ToString() + "_" + lblSubCatID + "_" + lblDocID.Text.Trim() + "_" + finenameSuffix.ToString() + fileExt.ToString();

                    if (!saveAttachment(fu, path, Docname))
                    {
                        //throw new Exception("An error occured while uploading. Please Try later");
                        continue;
                    }
                    using (SqlConnection _conn = Connection.GetConnection(Databases.MPPHSCL))
                    {
                        try
                        {
                            _conn.Open();
                            _conn.ChangeDatabase("MPPHSCL");
                            SqlCommand cmd = Functions.CreateCommand("InsertDocumentSp", _conn, null);

                            #region Parameter Initialization

                            cmd.Parameters.AddWithValue("@ProfileID", _Profileid.ToString());
                            cmd.Parameters.AddWithValue("@DocID", lblDocID.Text.Trim());
                            cmd.Parameters.AddWithValue("@DocName", Docname.ToString());
                            cmd.Parameters.AddWithValue("@Path", path.ToString() + "/" + Docname.ToString());
                            //cmd.Parameters.AddWithValue("@SubCatID", lblSubCatID.Text.Trim());
                            cmd.Parameters.AddWithValue("@SubCatID", lblSubCatID);
                            cmd.Parameters.AddWithValue("@AppType", "New");
                            cmd.Parameters.AddWithValue("@AppID", AppID);
                            #endregion
                            UtilitiesDB.ExecuteQueryDatasetSp(cmd, "MPPHSCL");
                            Cnt++;
                        }
                        catch (Exception ex)
                        {
                            //throw new Exception(ex.Message);                        
                        }
                        finally
                        {
                            if (_conn != null)
                            {
                                _conn.Close();
                            }
                        }
                    }
                }

                if (Cnt > 0)
                {
                    fnFillUploadedDocument();
                    divErr.InnerHtml = "File Uploaded Successfully !!";
                    divErr.Attributes.Add("class", "success");
                    divErr.Style.Add("display", "");
                }

            }

        }
        */
        protected void btnNext_Click(object sender, EventArgs e)
        {
            string AppID = m_AppID;
            string _Profileid = m_ProfileID;

            DocumentBriefcaseBLL t_DocumentBriefcaseBLL = new DocumentBriefcaseBLL();
            DataTable dtDoc = null;

            try
            {
                dtDoc = t_DocumentBriefcaseBLL.SubmitDocumentDetails(m_ProfileID, "", m_ServiceID, m_AppID);
                if (m_ServiceID == "386")
                {
                    string t_Script;
                    string m_Message = "Attachment uploaded for Complaint Registration of Reference ID : " + m_AppID + ". Thank You, From Lokaseba Adhikara -CAP, Odisha Govt.";
                    //Response.Redirect("/Default.aspx");
                    //t_Script = "alert('\"{0}\" {1}')";
                    //t_Script = string.Format(t_Script, "Complaint Registered Sucessfully!. ", m_Message.Replace("\r\n", ""));

                    //ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", t_Script, true);

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='/Default.aspx';", true);
                }
                else
                {
                    Response.Redirect("/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID);
                }
            }
            catch (Exception ex)
            {
                divErr.InnerHtml = ex.Message;
                divErr.Style.Add("display", "");
                divErr.Attributes.Add("class", "error");
            }

        }
    }
}