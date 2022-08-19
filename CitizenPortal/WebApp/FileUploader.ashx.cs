using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace CitizenPortal.WebApp
{
    /// <summary>
    /// Summary description for FileUploader
    /// </summary>
    public class FileUploader : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            string KioskID = "", AppID = "";

            context.Response.ContentType = "text/plain";
            try
            {
                if (context.Request.Files.Count > 0)
                {
                    KioskID = context.Request.Form["KioskID"];
                    AppID = context.Request.Form["AppID"];

                    string path = context.Server.MapPath("~/uploads/");

                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }

                    path = Path.Combine(path, AppID);

                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }

                    HttpFileCollection files = context.Request.Files;
                    for (int i = 0; i < files.Count; i++)
                    {
                        HttpPostedFile file = files[i];
                        string fname;
                        if (HttpContext.Current.Request.Browser.Browser.ToUpper() == "IE" || HttpContext.Current.Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                        {
                            string[] testfiles = file.FileName.Split(new char[] { '\\' });
                            fname = testfiles[testfiles.Length - 1];
                        }
                        else
                        {
                            //fname = file.FileName;
                            fname = files.AllKeys[i];
                        }

                        fname = Path.Combine(path, fname);
                        file.SaveAs(fname);
                    }
                }
                context.Response.Write("File Uploaded Successfully!");

            }
            catch (Exception ex)
            {
                context.Response.Write(ex.Message + Environment.NewLine + ex.StackTrace);
            }
        }

        // Another block of code for uploading Files using Javascript and Generic Handler
        public void ProcessRequest_old(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            try
            {
                string dirFullPath = HttpContext.Current.Server.MapPath("~/Uploads/");
                string[] files;
                int numFiles;
                files = System.IO.Directory.GetFiles(dirFullPath);
                numFiles = files.Length;
                numFiles = numFiles + 1;
                string str_image = "";

                foreach (string s in context.Request.Files)
                {
                    HttpPostedFile file = context.Request.Files[s];
                    string fileName = file.FileName;
                    string fileExtension = file.ContentType;

                    if (!string.IsNullOrEmpty(fileName))
                    {
                        fileExtension = System.IO.Path.GetExtension(fileName);
                        str_image = "MyPHOTO_" + numFiles.ToString() + fileExtension;
                        string pathToSave_100 = HttpContext.Current.Server.MapPath("~/Uploads/") + str_image;
                        file.SaveAs(pathToSave_100);
                    }
                }
                //  database record update logic here  ()

                context.Response.Write(str_image);
            }
            catch (Exception ac)
            {

            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}