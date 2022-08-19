using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CitizenPortal.WebApp.Common.QRCode
{
    /// <summary>
    /// Summary description for QrCodeImageHandler
    /// </summary>
    public class QrCodeImageHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string Img = context.Request.QueryString["Img"] as string;
            if (Img == null)
            {
                return;
            }
            //Checking whether the imagebytes session variable have anything else not doing anything
            byte[] Image = context.Session[Img] as byte[];
            if (Image == null)
            {
                return;
            }
            else
            {
                context.Response.ContentType = "image/JPEG";
                context.Response.BinaryWrite(Image);
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