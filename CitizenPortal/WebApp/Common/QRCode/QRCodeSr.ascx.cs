using QRCoder;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Common.QRCode
{
    public partial class QRCodeSr : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HdnImageBytes.Value = Guid.NewGuid().ToString();
            }
        }

        public void Crop(Bitmap Image)
        {
            //using (MemoryStream ms = new MemoryStream())
            //{
            //    Image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            //    Session[HdnImageBytes.Value] = ms.GetBuffer();
            //    imgBarCode.ImageUrl = "http://localhost/Portal/QRCode/QrCodeImageHandler.ashx?Img=" + HdnImageBytes.Value + "&rnd=" + DateTime.Now.ToString();
            //    ms.Flush();
            //}
        }

        public void GenerateQRCodeService(string ServiceID, string AppID)
        {
            CitizenPortalLib.BLL.PaymentReceiptBLL m_PaymentReceiptBLL = new CitizenPortalLib.BLL.PaymentReceiptBLL();
            System.Data.DataSet dt = m_PaymentReceiptBLL.GetPaymentDetail(ServiceID, AppID);
            string CSCID = "";

            if (dt != null && dt.Tables[0].Rows.Count > 0)
            {
                System.Data.DataTable AppDetails = dt.Tables[0];

                GenerateQRCode("Trn ID:" + AppDetails.Rows[0]["TrnID"].ToString() + " \nService:" + AppDetails.Rows[0]["ServiceName"].ToString() + " \nFee:" +
                        AppDetails.Rows[0]["Total"].ToString() +
                        "\nPaymentDate:" + String.Format("{0:dd-MMM-yyyy, HH:mm tt}", Convert.ToDateTime(AppDetails.Rows[0]["TransDate"])) +
                        (CSCID == "" ? "" : "\nCSCID:" + CSCID));
            }
        }

        public void GenerateQRCodePayment(string ServiceID, string AppID)
        {
            CitizenPortalLib.BLL.PaymentReceiptBLL m_PaymentReceiptBLL = new CitizenPortalLib.BLL.PaymentReceiptBLL();
            System.Data.DataSet dt = m_PaymentReceiptBLL.GetPaymentDetail(ServiceID, AppID);
            string CSCID = "";

            if (dt != null && dt.Tables[0].Rows.Count > 0)
            {
                System.Data.DataTable AppDetails = dt.Tables[0];

                GenerateQRCode("Trn ID:" + AppDetails.Rows[0]["TrnID"].ToString() + " \nService:" + AppDetails.Rows[0]["ServiceName"].ToString() + " \nFee:" +
                        AppDetails.Rows[0]["Total"].ToString() +
                        "\nPaymentDate:" + String.Format("{0:dd-MMM-yyyy, HH:mm tt}", Convert.ToDateTime(AppDetails.Rows[0]["TransDate"])) +
                        (CSCID == "" ? "" : "\nCSCID:" + CSCID));
            }
        }

        public void GenerateQRCodeApplication(string ServiceID, string AppID)
        {
            CitizenPortalLib.BLL.PaymentReceiptBLL m_PaymentReceiptBLL = new CitizenPortalLib.BLL.PaymentReceiptBLL();
            System.Data.DataSet dt = m_PaymentReceiptBLL.GetApplicationDetail(ServiceID, AppID);
            string CSCID = "";

            if (dt != null && dt.Tables[0].Rows.Count > 0)
            {
                System.Data.DataTable AppDetails = dt.Tables[0];

                GenerateQRCode("Reference ID:" + AppDetails.Rows[0]["AppID"].ToString() + " \nService:" + AppDetails.Rows[0]["SvcName"].ToString() + " \nApplied On:" +
                         String.Format("{0:dd-MMM-yyyy, HH:mm tt}", Convert.ToDateTime(AppDetails.Rows[0]["CreatedOn"])) + " \nApplied By:" + AppDetails.Rows[0]["AppName"].ToString() +
                        (CSCID == "" ? "" : "\nCSCID:" + CSCID));
            }
        }

        public void GenerateQRCode(string Content)
        {
            //string data = string.Empty;
            //string url = string.Empty;
            //if (string.IsNullOrEmpty(Content))
            //{
            //    MessageBox.Show("Data must not be empty.");
            //    return;
            //}
            //QRCodeEncoder qrCodeEncoder = new QRCodeEncoder();
            //qrCodeEncoder.QRCodeEncodeMode = QRCodeEncoder.ENCODE_MODE.ALPHA_NUMERIC;
            //int scale = Convert.ToInt16("4");
            //qrCodeEncoder.QRCodeScale = scale;
            //int version = Convert.ToInt16("3");
            //qrCodeEncoder.QRCodeVersion = version;
            //qrCodeEncoder.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.M;
            //data = Content;
            //Bitmap image = qrCodeEncoder.Encode(data);
            //Crop(image);
            if (Content.Length <= 2254)
            {
                QRCodeGenerator qrGenerator = new QRCodeGenerator();
                QRCodeGenerator.QRCode qrCode = qrGenerator.CreateQrCode(Content, QRCodeGenerator.ECCLevel.M);
                System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();
                imgBarCode.Height = 50;
                imgBarCode.Width = 50;
                using (Bitmap bitMap = qrCode.GetGraphic(20))
                {
                    using (MemoryStream ms = new MemoryStream())
                    {
                        bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                        byte[] byteImage = ms.ToArray();
                        imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
                    }
                    plBarCode.Controls.Add(imgBarCode);
                }
            }
        }
        public void GenerateQRCode(string Service, string AppNo, string Trans_id, string Trans_Date, string AmtPayable, string ChannelId)
        {
            string data = string.Empty;
            string url = string.Empty;
            StringBuilder Content = new StringBuilder();

            Content.Append("SERVICE NAME: " + Service + " ");
            Content.Append("APP NO: " + AppNo + " ");
            Content.Append("PAY ID: " + Trans_id + " ");
            Content.Append("PAY DATE: " + Trans_Date + " ");
            Content.Append("PAY AMT: " + AmtPayable + " ");
            Content.Append("CHANNEL ID: " + ChannelId + "");
            if (string.IsNullOrEmpty(Content.ToString()))
            {
                //MessageBox.Show("Data must not be empty.");
                return;
            }
            if (Content.Length > 500)
            {
                //MessageBox.Show("max. characters");
                return;
            }
            //QRCodeEncoder qrCodeEncoder = new QRCodeEncoder();
            //qrCodeEncoder.QRCodeEncodeMode = QRCodeEncoder.ENCODE_MODE.ALPHA_NUMERIC;
            //int scale = Convert.ToInt16("4");
            //qrCodeEncoder.QRCodeScale = scale;
            //int version = Convert.ToInt16("7");
            //qrCodeEncoder.QRCodeVersion = version;
            //qrCodeEncoder.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.M;
            //data = Content.ToString().ToUpper();
            //Bitmap image =qrCodeEncoder.Encode(data);
            //Crop(image);

            if (Content.Length <= 500)
            {
                QRCodeGenerator qrGenerator = new QRCodeGenerator();
                QRCodeGenerator.QRCode qrCode = qrGenerator.CreateQrCode(Content.ToString(), QRCodeGenerator.ECCLevel.M);
                System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();
                imgBarCode.Height = 90;
                imgBarCode.Width = 90;
                using (Bitmap bitMap = qrCode.GetGraphic(20))
                {
                    using (MemoryStream ms = new MemoryStream())
                    {
                        bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                        byte[] byteImage = ms.ToArray();
                        imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
                    }
                    plBarCode.Controls.Add(imgBarCode);
                }
            }
            else
            {
                //MessageBox.Show("max. characters");
                return;
            }
        }
    }
}