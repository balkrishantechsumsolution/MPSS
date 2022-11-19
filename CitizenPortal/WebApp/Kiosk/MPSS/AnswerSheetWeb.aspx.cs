using DocumentFormat.OpenXml.Packaging;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Mvc;
using com.sun.security.ntlm;
using iTextSharp.text.pdf.parser;
using System.Drawing.Imaging;
using System.Drawing;
using Rectangle = iTextSharp.text.Rectangle;
using sun.java2d.cmm;
using Path = System.IO.Path;
using System.Web.Services;

namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class AnswerSheetWeb : System.Web.UI.Page
    {
        private string fontPath;

        protected void Page_Load(object sender, EventArgs e)
        {
            //GenrateCanvas();
          

        }
        //public  void GenrateCanvas()
        //{
        //    string filename = "R100H320620200070_9.pdf";
        //    var quicklinkPath = "/WebApp/Kiosk/AnswerSheetImg/" + filename;
        //    var path = HttpContext.Current.Server.MapPath("~/" + quicklinkPath);

        //    string strDirectoryName = Path.GetDirectoryName(path);

        //    if (!Directory.Exists(strDirectoryName))
        //    {
        //        Directory.CreateDirectory(strDirectoryName);
        //    }


        //    imgASP.Attributes.Add("src", path);
        //}

        [WebMethod()]
        public static void SaveImage(string imageData)
        {

            Random rnd = new Random();
            String Filename = HttpContext.Current.Server.MapPath("Shanuimg" + rnd.Next(12, 2000).ToString() + ".png");
            string Pic_Path = Filename;//HttpContext.Current.Server.MapPath("ShanuHTML5DRAWimg.png");    
            using (FileStream fs = new FileStream(Pic_Path, FileMode.Create))
            {
                using (BinaryWriter bw = new BinaryWriter(fs))
                {
                    byte[] data = Convert.FromBase64String(imageData);
                    bw.Write(data);
                    bw.Close();
                }
            }
        }

    }
}