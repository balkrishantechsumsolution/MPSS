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

namespace CitizenPortal.WebApp.Common
{
    public partial class HTMLToPDF : System.Web.UI.Page
    {
        MemoryStream memoryStream = new MemoryStream();
        TextReader xmlString;
        Document pdfDoc;
        SeniorCitizenBLL m_SeniorCitizenBLL = new SeniorCitizenBLL();
        string m_AppID, m_ServiceID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet dt = m_SeniorCitizenBLL.GetAppDetails(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtAddress = dt.Tables[1];


            lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
            Label1.Text = dtApp.Rows[0]["UIDNo"].ToString(); //UID No
            lblappdate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"]).ToString("dd/MM/yyyy");
            lblfullname_LL.Text = dtApp.Rows[0]["FullName"].ToString();
            if (dtApp.Rows[0]["Gender"].ToString() == "M")
            {
                lblmale.Text = "M";
            }
            else
            {
                lblfemale.Text = "F";
            }
            lbldate.Text = dtApp.Rows[0]["DOB_Date"].ToString();
            lblmonth.Text = dtApp.Rows[0]["DOB_Month"].ToString();
            lblyear.Text = dtApp.Rows[0]["DOB_Year"].ToString();
            lbl_bloodgroup.Text = dtApp.Rows[0]["BloodGroup"].ToString();

            lblapplicant_address.Text = dtAddress.Rows[0]["FullAddress"].ToString();
            lblapp_dist.Text = dtAddress.Rows[0]["DistrictName"].ToString();
            lblapp_tehsil.Text = dtAddress.Rows[0]["SubDistrictName"].ToString();
            lblpin_app.Text = dtAddress.Rows[0]["Pincode"].ToString();

            lblvillage.Text = dtAddress.Rows[0]["VillageName"].ToString();
            lbltaluka.Text = dtAddress.Rows[0]["SubDistrictName"].ToString();
            lbldist.Text = dtAddress.Rows[0]["DistrictName"].ToString();
            lblpin.Text = dtAddress.Rows[0]["Pincode"].ToString();

            lblMobile.Text = dtApp.Rows[0]["MobileNo"].ToString();
            lblemail.Text = dtApp.Rows[0]["EmailID"].ToString();
            lblemergencyname.Text = dtApp.Rows[0]["EmergencyName"].ToString();
            lblemergencymob.Text = dtApp.Rows[0]["EmergencyMobileNo"].ToString();

            if (Request.QueryString["GenPDF"] != null && Request.QueryString["GenPDF"].ToString() == "Y")
            {
                HtmltoPDF(m_AppID, "");
                Response.Redirect("../DigitalSignature/DigiSignApp.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID, false);
            }

        }

        private void HtmltoPDF(string AppID, string ProfileID)
        {
            try
            {
                string quicklinkPath = string.Empty;
                string PdfPath;
                //string filename = "AppForm" + System.DateTime.Now.ToString("ddMMyyhhmmss") + ".pdf";
                string filename = "AppForm.pdf";
                quicklinkPath = "/Uploads/" + AppID + "/" + filename;
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
                htmlContent.RenderControl(hw);
               
                /////////////////////////////////


                StringReader sr = new StringReader(sw.ToString());
                pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 40f);

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

        private iTextSharp.text.Image QRCodeImage(String LicDiv)
        {

            iTextSharp.text.Image QRCodeImage = null;
            try
            {
                int FirstIndex = LicDiv.IndexOf(@"data:image/png;base64,") + 21;
                if (FirstIndex == 20)
                {
                    throw new Exception(string.Empty);
                }
                string RemainingText = LicDiv.Substring(FirstIndex + 1, LicDiv.Length - FirstIndex - 1);
                int LastIndex = RemainingText.IndexOf("\"");
                string ImageSourceText = LicDiv.Substring(FirstIndex + 1, LastIndex);
                QRCodeImage = iTextSharp.text.Image.GetInstance(Convert.FromBase64String(ImageSourceText));
                QRCodeImage.ScaleToFit(80f, 80f);

            }
            catch { }

            return QRCodeImage;

        }


    }
}