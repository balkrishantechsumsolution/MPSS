using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing.Drawing2D;
using SD = System.Drawing;


public partial class CropImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["ClientCrop"] = null;
            HdnImageBytes.Value = Guid.NewGuid().ToString();
        }
    }
    protected void btnPreview_Click(object sender, EventArgs e)
    {
        try
        {
            validation();
            double fileSize = (PhotoUpload.PostedFile.ContentLength / 1024) / 1024.0;
            if (fileSize > 0.200)
            {
               // MessageBox.Show("Maximum size of 200 kB allowed");
                return;

            }
            else
            {
                Session["FileUpload1-" + HdnImageBytes.Value] = PhotoUpload;
                Session[HdnImageBytes.Value] = PhotoUpload.FileBytes;
                ImgCrop.ImageUrl = "/ClientSideCrop/ImageHandler.ashx?id=" + HdnImageBytes.Value + "&rnd=" + DateTime.Now.ToString();
                Page.ClientScript.RegisterStartupScript(GetType(), "HideConfirmBox", "javascript:CropImage();", true);
            }

        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.Visible = true;

        }
    }
    protected void btnCrop_Click(object sender, EventArgs e)
    {
        try
        {
            if (Session["FileUpload1-" + HdnImageBytes.Value] != null)
            {
                byte[] image = Session[HdnImageBytes.Value] as byte[];
                if (image != null)
                {
                    PhotoUpload = (FileUpload)Session["FileUpload1-" + HdnImageBytes.Value];
                    int w = Convert.ToInt32(W.Value);
                    int h = Convert.ToInt32(H.Value);
                    int x = Convert.ToInt32(X.Value);
                    int y = Convert.ToInt32(Y.Value);
                    DateTime dt = DateTime.Now;
                    byte[] CropImage = Crop(image, w, h, x, y);
                    Session[HdnImageBytes.Value] = CropImage;
                    ImgCrop.ImageUrl = "/Quick Links/Crop/NotFound.jpg";
                    Session["ClientCrop"] = Session[HdnImageBytes.Value];
                    Session.Remove(HdnImageBytes.Value);
                    Session.Remove("FileUpload1-" + HdnImageBytes.Value);
                }

                Page.ClientScript.RegisterStartupScript(GetType(), "HideConfirmBox", "javascript:Hide ();", true);
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.Visible = true;

        }
    }
    static byte[] Crop(byte[] Image, int Width, int Height, int X, int Y)
    {
        try
        {
            using (MemoryStream MStream = new MemoryStream(Image))
            {
                using (System.Drawing.Image OriginalImage = System.Drawing.Image.FromStream(MStream))
                {
                    using (SD.Bitmap bmp = new SD.Bitmap(Width, Height))
                    {
                        bmp.SetResolution(OriginalImage.HorizontalResolution, OriginalImage.VerticalResolution);
                        using (SD.Graphics Graphic = SD.Graphics.FromImage(bmp))
                        {
                            Graphic.SmoothingMode = SmoothingMode.AntiAlias;
                            Graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
                            Graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;
                            Graphic.DrawImage(OriginalImage, new SD.Rectangle(0, 0, Width, Height), X, Y, Width, Height, SD.GraphicsUnit.Pixel);
                            using (MemoryStream ms = new MemoryStream())
                            {
                                bmp.Save(ms, OriginalImage.RawFormat);
                                return ms.GetBuffer();
                            }
                        }
                    }
                }
            }
        }
        catch (Exception Ex)
        {
            throw (Ex);
        }


    }
    public void validation()
    {

        if (!PhotoUpload.HasFile)
        {
            throw new Exception("Please upload the Photo");
        }
        //if (!CommanFunctions.ValidateFile(PhotoUpload))
        //{
        //    throw new Exception("Kindly Upload Photo in JPEG, JPG, GIF, or PNG Format Only");
        //}
        string Filename = PhotoUpload.FileName.ToString();
        string FileExtension = Filename.Substring((Filename.IndexOf(".") + 1), ((Filename.Length) - (Filename.IndexOf(".") + 1)));
        if (FileExtension.ToUpper() == "JPG" || FileExtension.ToUpper() == "JPEG" || FileExtension.ToUpper() == "GIF" || FileExtension.ToUpper() == "PNG")
        {

        }
        else
        {
            throw new Exception("Kindly Upload Photo in JPEG, JPG, GIF, or PNG Format Only");
        }


    }
}
