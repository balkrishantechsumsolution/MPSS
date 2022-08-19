using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing.Drawing2D;
using SD = System.Drawing;
using System.Drawing;

public partial class ImageCrop : System.Web.UI.UserControl, ICallbackEventHandler
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            //Set the frame with the actula page containing the upload control
            this.frmImage.Attributes.Add("src", "/ClientSideCrop/CropImage.aspx" + "?ResponseId=" + this.ID);
            this.frmImage.Attributes.Add("title", this.ID);


            //Let us hook up the client callbacks
            string callBack = Page.ClientScript.GetCallbackEventReference(this, "arg", "ReceiveServerData", "context");
            //-- JS function definition
            string clientFunction = "function RequestServer(arg, context){ " + callBack + "; }";

            //-- Render the function definition if it is not rendered before.
            if (!Page.ClientScript.IsClientScriptBlockRegistered("RequestServer"))
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "RequestServer", clientFunction, true);
            }


            if (!IsPostBack)
            {
                Session.Remove("ClientCrop");
                imgSample.ImageUrl = string.Format("/Quick Links/Crop/NotFound.jpg?rnd={0}", DateTime.Now.ToString());
                hdntemp.Value = Guid.NewGuid().ToString();
            }

        }
        catch (Exception ex)
        {
            //
        }
    }
    public bool MoveToServiceFolder(string PathOfServiceFolder, string AppNo, bool Replace)
    {

        bool result = false;
        try
        {
            if (Session[hdntemp.Value] != null)
            {
                string check = (string)Session[hdntemp.Value].ToString();
                if (!String.IsNullOrEmpty(check))
                {
                    byte[] CropImage = Session[hdntemp.Value] as byte[];
                    string destinationFile = PathOfServiceFolder + AppNo + ".jpg";
                    using (MemoryStream ms = new MemoryStream(CropImage, 0, CropImage.Length))
                    {
                        ms.Write(CropImage, 0, CropImage.Length);
                        using (SD.Image CroppedImage = SD.Image.FromStream(ms, true))
                        {
                            if (!Directory.Exists(_MapPath(PathOfServiceFolder)))
                            {
                                Directory.CreateDirectory(_MapPath(PathOfServiceFolder));
                            }
                            string SaveTo = _MapPath(destinationFile);
                            CroppedImage.Save(SaveTo, System.Drawing.Imaging.ImageFormat.Jpeg);
                            if (File.Exists(_MapPath(destinationFile)) == false)
                            {
                                //  MessageBox.Show("Please Upload Image And Crop again!");
                                result = false;
                            }
                            else { result = true; }
                            Session.Remove(hdntemp.Value);
                        }
                        ms.Dispose();
                    }
                }
            }
            else
            {
                // MessageBox.Show("Please Upload Image And Crop!");
                return false;
            }

        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.Visible = true;
        }

        //Reset everything the brute force way
        Session.Remove("ClientCrop");
        Session.Remove(hdntemp.Value);
        if (string.IsNullOrEmpty(this.hdntemp.Value))
        {
            imgSample.ImageUrl = string.Format("/Quick Links/Crop/NotFound.jpg?rnd={0}", DateTime.Now.ToString());
        }
        return result;

    }

    public bool ReplacePhoto(string PathOfServiceFolder, string AppNo)
    {
        bool result = false;
        try
        {
            if (Session[hdntemp.Value] != null)
            {
                string check = (string)Session[hdntemp.Value].ToString();

                if (!String.IsNullOrEmpty(check))
                {
                    int i = 1;
                    byte[] CropImage = Session[hdntemp.Value] as byte[];
                    string sourceFile = _MapPath(PathOfServiceFolder + AppNo + ".jpg");
                    string input = PathOfServiceFolder.Remove(PathOfServiceFolder.Length - 1);
                    string[] ServiceFolder = input.Split('/');
                    int AppCount = ServiceFolder.Length - 1;
                    string Destination = _MapPath(PathOfServiceFolder.Replace(ServiceFolder[AppCount], ServiceFolder[AppCount] + "_ClusterBackup"));
                    string DestinationFile = string.Format(Destination + "{0}.jpg", AppNo);
                    PathOfServiceFolder = _MapPath(PathOfServiceFolder);
                    using (MemoryStream ms = new MemoryStream(CropImage, 0, CropImage.Length))
                    {
                        ms.Write(CropImage, 0, CropImage.Length);
                        using (SD.Image CroppedImage = SD.Image.FromStream(ms, true))
                        {
                            if (!Directory.Exists(Destination))
                            {
                                Directory.CreateDirectory(Destination);
                            }
                            if (!Directory.Exists(PathOfServiceFolder))
                            {
                                Directory.CreateDirectory(PathOfServiceFolder);
                            }
                            if (File.Exists(sourceFile))
                            {
                                if (File.Exists(DestinationFile))
                                {
                                    string MultipleFile = string.Format(Destination + "{0}.jpg", AppNo + "_" + 1);
                                    if (!File.Exists(MultipleFile))
                                    {
                                        File.Copy(sourceFile, MultipleFile, true);
                                    }
                                    else { throw new Exception("You can change images only two times."); }
                                }
                                else
                                {
                                    System.IO.File.Move(sourceFile, DestinationFile);
                                }
                                if (File.Exists(DestinationFile))
                                {
                                    File.Delete(sourceFile);
                                    CroppedImage.Save(sourceFile, System.Drawing.Imaging.ImageFormat.Jpeg);
                                }
                                if (File.Exists(sourceFile))
                                {
                                    // MessageBox.Show("Image save sucessfully");
                                    result = true;
                                }
                            }
                            if (!File.Exists(sourceFile))
                            {
                                throw new Exception("Image Not Found");
                            }
                        }
                        Session.Remove(hdntemp.Value);
                        ms.Dispose();
                    }
                }
            }
            else
            {
                // MessageBox.Show("Please Upload Image And Crop!");
                return false;
            }

        }
        catch (Exception ex)
        {
            //  MessageBox.Show(ex.Message);
            //Reset everything the brute force way
            Session.Remove("ClientCrop");
            Session.Remove(hdntemp.Value);
        }

        //Reset everything the brute force way
        Session.Remove("ClientCrop");
        Session.Remove(hdntemp.Value);
        if (string.IsNullOrEmpty(this.hdntemp.Value))
        {
            imgSample.ImageUrl = string.Format("/Quick Links/Crop/NotFound.jpg?rnd={0}", DateTime.Now.ToString());
        }
        return result;

    }
    //No elephanting idea why this is here
    public void RaiseCallbackEvent(string eventArgument)
    {

    }

    public string GetCallbackResult()
    {
        string ImgUrl = string.Empty;
        Session[hdntemp.Value] = Session["ClientCrop"] as byte[];
        if (Session[hdntemp.Value] == null || Session[hdntemp.Value] == "")
        {
            ImgUrl = string.Format("/Quick Links/Crop/NotFound.jpg?rnd=", DateTime.Now.ToString());
        }
        else
        {
            ImgUrl = "/ClientSideCrop/CropedImageHandler.ashx?Img=" + hdntemp.Value + "&rnd=" + DateTime.Now.ToString();
        }
        Session.Remove("ClientCrop");
        return ImgUrl;
    }
    public bool IsCroped()
    {
        bool result = true;
        try
        {
            if (Session[hdntemp.Value] == null)
            {
                result = false;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        return result;
    }
    private static string _MapPath(string url)
    {
        return Resources.Resource.lblQuickLinksDirectory + url.Replace("/", "\\").ToString();
    }
}
