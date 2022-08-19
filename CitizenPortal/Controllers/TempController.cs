using CitizenPortalLib.PortalViewModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CitizenPortal.Controllers
{
    public class TempController : Controller
    {
        DataClasses objData;

        public TempController()
        {
            objData = new DataClasses();
        }

        // GET: Temp
        public ActionResult Index()
        {
            return View();
        }

        // GET: Menu
        public ActionResult Menu()
        {
            List<MenuDataModel> objMenuData = null;
            CitizenPortalLib.BLL.MenuBLL menu = new CitizenPortalLib.BLL.MenuBLL();
            objMenuData = menu.GetAllMenus(new string[] { });
            foreach (MenuDataModel menuData in objMenuData)
            {
                if (!string.IsNullOrEmpty(menuData.HREF.Trim()))
                    menuData.HREF = "applicationUrl" + "/" + menuData.HREF + "/" + menuData.Controller + "/" + menuData.Action;
                else
                    menuData.HREF = "applicationUrl" + "/" + menuData.Controller + "/" + menuData.Action;
            }
            ViewBag.MenuData = objMenuData;
            return View();
        }

        [HttpPost]
        public ActionResult Upload(HttpPostedFileBase file)
        {
            try
            {
                if (file.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(file.FileName);
                    var path = Path.Combine(Server.MapPath("~/Uploads/"), fileName);
                    file.SaveAs(path);
                }
                ViewBag.Message = "Upload successful";
                return RedirectToAction("Index");
            }
            catch
            {
                ViewBag.Message = "Upload failed";
                return RedirectToAction("Uploads");
            }
        }

        public ActionResult Downloads()
        {
            var files = objData.GetFiles();
            return View(files);
        }

        public FileResult Download(string id)
        {
            int fid = Convert.ToInt32(id);
            var files = objData.GetFiles();
            string filename = (from f in files
                               where f.FileId == fid
                               select f.FilePath).First();
            string contentType = "application/pdf";
            //Parameters to file are
            //1. The File Path on the File Server
            //2. The connent type MIME type
            //3. The paraneter for the file save asked by the browser
            return File(filename, contentType, "Report.pdf");
        }

        public class DataClasses
        {
            public List<FileNames> GetFiles()
            {

                List<FileNames> lstFiles = new List<FileNames>();
                DirectoryInfo dirInfo = new DirectoryInfo(System.Web.Hosting.HostingEnvironment.MapPath("~/Uploads"));

                int i = 0;
                foreach (var item in dirInfo.GetFiles())
                {

                    lstFiles.Add(new FileNames() { FileId = i + 1, FileName = item.Name, FilePath = dirInfo.FullName + @"\" + item.Name });
                    i = i + 1;
                }

                return lstFiles;
            }
        }

        public class FileNames
        {
            public int FileId { get; set; }
            public string FileName { get; set; }
            public string FilePath { get; set; }
        }
    }
}