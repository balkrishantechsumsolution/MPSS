using CitizenPortalLib.BLL;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using Winnovative;
//using Winnovative.WnvHtmlConvert;

namespace CitizenPortal.WebApp.Kiosk.Forms
{
    public partial class SeniorCitizenCertificate : System.Web.UI.Page
    {
        MemoryStream memoryStream = new MemoryStream();
        TextReader xmlString;
        iTextSharp.text.Document pdfDoc;
        SeniorCitizenBLL m_SeniorCitizenBLL = new SeniorCitizenBLL();
        string m_AppID, m_ServiceID;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["CurrentCulture"] = "en-GB";
            string culture = "en-GB";
            culture = Session["CurrentCulture"].ToString();

            //HFServiceID.Value = "101";
            //ngServiceID.Value = "101";

            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            string t_URL = "", t_FileName = "";
            DataSet dt = m_SeniorCitizenBLL.GetAppDetails(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtAddress = dt.Tables[1];
            string t_SourcePDFFile = "";
            string t_DestPDFFile = "";            

            lblAge.Text = dtAddress.Rows[0]["Age"].ToString();
            lblBloodGrp.Text = dtApp.Rows[0]["BloodGroup"].ToString();
            lblDOB.Text = dtApp.Rows[0]["DOB_Year"].ToString();
            lblName.Text = dtApp.Rows[0]["BloodGroup"].ToString();
            //lblOutwardNo.Text = ;
            lblSal.Text = dtAddress.Rows[0]["Salutation"].ToString();

            t_SourcePDFFile = Server.MapPath("~/WebApp/Kiosk/Forms/") + "SeniorCitizen_MainFile.pdf";
            t_DestPDFFile = Server.MapPath("~/Uploads/") + m_AppID + "/AppForm.pdf";

            if(!Directory.Exists(Path.GetDirectoryName(t_DestPDFFile)))
            {
                Directory.CreateDirectory(Path.GetDirectoryName(t_DestPDFFile));
            }

            File.Copy(t_SourcePDFFile, t_DestPDFFile, true);

            //t_URL = "SeniorCitizenCertificate.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID + "&GenPDF=Y";
            //t_URL = "http://localhost:53056/WebApp/Kiosk/Forms/SeniorCitizenCertificate.aspx?SvcID=101&AppID=16505101000000000403";
            //t_FileName = m_AppID + "_" + DateTime.Now.ToString("yyyy-MM-ddhhmm") + ".pdf";

            if (Request.QueryString["GenPDF"] != null && Request.QueryString["GenPDF"].ToString() == "Y")
            {
                //ConvertURLToPDF(t_URL, m_AppID, t_FileName);
                //HtmltoPDF(m_AppID, "");
                Response.Redirect("../../Common/DigitalSignature/DigiSignApp.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID, false);                
            }

        }

        //private void ConvertURLToPDF(string p_URL, string AppID, string p_FileName)
        //{
        //    string urlToConvert = p_URL;

        //    // Create the PDF converter. Optionally you can specify the virtual browser 
        //    // width as parameter. 1024 pixels is default, 0 means autodetect
        //    PdfConverter pdfConverter = new PdfConverter();

        //    pdfConverter.WnvInternalFileName = Server.MapPath("~/bin/") + "wnvinternal.dat";
        //    // set the license key - required            
        //    pdfConverter.LicenseKey = "fvDh8eDx4fHg4P/h8eLg/+Dj/+jo6Og="; //Live Key            


        //    // set the converter options - optional
        //    pdfConverter.PdfDocumentOptions.PdfPageSize = PdfPageSize.A4;

        //    pdfConverter.PdfDocumentOptions.PdfCompressionLevel = PdfCompressionLevel.Normal;
        //    //pdfConverter.PdfDocumentOptions.PdfPageOrientation = PdfPageOrientation.Portrait;
        //    pdfConverter.PdfDocumentOptions.PdfPageOrientation = PdfPageOrientation.Portrait;
        //    // set if header and footer are shown in the PDF - optional - default is false 
        //    pdfConverter.PdfDocumentOptions.ShowHeader = false;
        //    pdfConverter.PdfDocumentOptions.ShowFooter = false;
        //    // set to generate a pdf with selectable text or a pdf with embedded image - optional - default is true
        //    //pdfConverter.PdfDocumentOptions.GenerateSelectablePdf = true;            
        //    // set if the HTML content is resized if necessary to fit the PDF page width - optional - default is true
        //    pdfConverter.PdfDocumentOptions.FitWidth = true;
        //    // 
        //    // set the embedded fonts option - optional - default is false
        //    pdfConverter.PdfDocumentOptions.EmbedFonts = true;
        //    // set the live HTTP links option - optional - default is true
        //    pdfConverter.PdfDocumentOptions.LiveUrlsEnabled = true;
        //    //pdfConverter.HtmlViewerHeight = 1222;
        //    //pdfConverter.HtmlViewerWidth = 892;

        //    //if (radioConvertToSelectablePDF.Checked)
        //    //{
        //    // set if the JavaScript is enabled during conversion to a PDF with selectable text 
        //    // - optional - default is false
        //    //pdfConverter.ScriptsEnabled = false;
        //    // set if the ActiveX controls (like Flash player) are enabled during conversion 
        //    // to a PDF with selectable text - optional - default is false
        //    //pdfConverter.ActiveXEnabled = false;
        //    // }
        //    pdfConverter.PdfDocumentOptions.JpegCompressionEnabled = true;
        //    pdfConverter.SavePdfFromUrlToFile(p_URL, Server.MapPath("~/Uploads/" + AppID + "/" + p_FileName));



        //}

        private void HtmltoPDF(string AppID, string ProfileID)
        {
            try
            {
                string quicklinkPath = string.Empty;
                string PdfPath;
                //string filename = "AppForm" + System.DateTime.Now.ToString("ddMMyyhhmmss") + ".pdf";
                string filename = "AppForm.pdf";
                quicklinkPath = "../../../Uploads/" + AppID + "/" + filename;
                PdfPath = Server.MapPath(quicklinkPath);

                string strDirectoryName = Path.GetDirectoryName(PdfPath);

                if (!Directory.Exists(strDirectoryName))
                {
                    Directory.CreateDirectory(strDirectoryName);
                }

                if (File.Exists(PdfPath))
                {
                    File.Delete(PdfPath);
                }

                iTextSharp.text.Font font5 = iTextSharp.text.FontFactory.GetFont(FontFactory.TIMES, 7);

                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                /////////////////////////////////
                Panel3.RenderControl(hw);

                /////////////////////////////////


                StringReader sr = new StringReader(sw.ToString());
                pdfDoc = new iTextSharp.text.Document(PageSize.A4, 10f, 10f, 10f, 40f);

                FileStream LicenseFile = new FileStream(PdfPath, FileMode.Create);
                PdfWriter writer = PdfWriter.GetInstance(pdfDoc, LicenseFile);

                //string ImageServerPath = Server.MapPath("/Quick Links") + @"\FDA\Images\LicBack.png";
                //iTextSharp.text.Image logo = iTextSharp.text.Image.GetInstance(ImageServerPath);
                //PDFFooter e = new PDFFooter(false)
                //{
                //    ImageHeader = logo
                //};
                //e.IsQRCodeRequired = true;
                //e.QRCodeImage = QRCodeImage(sw.ToString());
                //e.Footertext = " :: " + " " + AppID;
                //writer.PageEvent = e;

                pdfDoc.Open();

                xmlString = new StringReader(sw.ToString());
                byte[] byteArray = System.Text.Encoding.UTF8.GetBytes(sw.ToString());
                memoryStream = new MemoryStream(byteArray);
                XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, memoryStream, null, System.Text.Encoding.UTF8);

                writer.CloseStream = false;
                #region DISPOSE OBJECTS

                hw.Flush();
                hw.Close();
                hw.Dispose();
                sw.Flush();
                sw.Close();
                sw.Dispose();
                pdfDoc.Close();
                pdfDoc.Dispose();
                writer.Flush();
                writer.Close();
                writer.Dispose();
                LicenseFile.Flush();
                LicenseFile.Close();
                LicenseFile.Dispose();
                memoryStream.Flush();
                memoryStream.Close();
                memoryStream.Dispose();
                GC.Collect();
                #endregion
            }
            catch (Exception ex)
            {

                //divErr.InnerHtml = ex.Message;
                //divErr.Style.Add("display", "");
            }
        }
    }
}