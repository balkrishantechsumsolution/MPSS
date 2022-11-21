<%@ WebHandler Language="C#" Class="ImageHandler" %>

using System;
using System.Web;
using System.IO;
using System.Drawing.Drawing2D;
using SD = System.Drawing;
using System.Drawing;

public class ImageHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) 
    {
        string id = context.Request.QueryString["id"] as string;
        if (id == null)
        {
            return;
        }
        
        
        //Checking whether the imagebytes variable have anything else not doing anything

        byte[] Image = context.Session[id] as byte[];

        if (Image == null)
        {
            return;
        }

        using (MemoryStream mem = new MemoryStream(Image))
        {
            using (System.Drawing.Image OriginalImage = System.Drawing.Image.FromStream(mem))
            {
                int[] heightWidthRequiredDimensions;
                heightWidthRequiredDimensions = WorkDimensions(OriginalImage.Height, OriginalImage.Width, 350, 350);
                using (SD.Bitmap bmp = new SD.Bitmap(heightWidthRequiredDimensions[1], heightWidthRequiredDimensions[0]))
                {
                    const float resolution = 100;
                    bmp.SetResolution(resolution, resolution);
                    using (SD.Graphics Graphic = SD.Graphics.FromImage((Image)bmp))
                    {
                        Graphic.SmoothingMode = SmoothingMode.AntiAlias;
                        Graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        Graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        Graphic.DrawImage(OriginalImage, 0, 0, bmp.Width, bmp.Height);

                        MemoryStream mst = new MemoryStream();
                        bmp.Save(mst, OriginalImage.RawFormat);
                        byte[] buffer = mst.ToArray();
                        context.Response.ContentType = "image/JPEG";
                        context.Response.BinaryWrite(buffer);
                        context.Session[id] = buffer;
                                             
                    }
                }
            }
        }
    }

    private byte[] GetBytesfromString(string p)
    {
        return Convert.FromBase64String(p);
    }
    
    private static int[] WorkDimensions(int originalHeight, int originalWidth, int requiredHeight, int requiredWidth )
  {
   int imgHeight = 0;
   int imgWidth = 0;

   imgWidth = requiredHeight;
   imgHeight = requiredWidth;


   int requiredHeightLocal = originalHeight;
   int requiredWidthLocal = originalWidth;
   double ratio = 0;
   if ( originalHeight > imgHeight )
   {
       ratio = double.Parse( ( (double) imgHeight / (double) originalHeight ).ToString() );
       requiredHeightLocal = imgHeight;
       requiredWidthLocal = (int) ( (decimal) originalWidth * (decimal) ratio );
   }
   if ( requiredWidthLocal >= imgWidth )
   {
       ratio = double.Parse( ( (double) imgWidth / (double) originalWidth ).ToString() );
       requiredWidthLocal = imgWidth;
       requiredHeightLocal = (int) ( (double) originalHeight * (double) ratio );
   }

   int[] heightWidthDimensionArr = { requiredHeightLocal, requiredWidthLocal };

   return heightWidthDimensionArr;
}
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}