﻿using QRCoder;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.BLL;

namespace CitizenPortal.WebApp.Common.QRCode
{
    public partial class QRCode : System.Web.UI.UserControl
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

        public void GenerateQRCodeDetails(string ServiceID, string RollNo)
        {
            CitizenPortalLib.BLL.PaymentReceiptBLL m_PaymentReceiptBLL = new CitizenPortalLib.BLL.PaymentReceiptBLL();
            System.Data.DataSet dt = m_PaymentReceiptBLL.GetStudentDetail(ServiceID, RollNo);
            string CSCID = "";

            if (dt != null && dt.Tables[0].Rows.Count > 0)
            {
                System.Data.DataTable AppDetails = dt.Tables[0];

                GenerateQRCode("Student:" + AppDetails.Rows[0]["StudentName"].ToString() + "Roll No.:" + AppDetails.Rows[0]["RollNo"].ToString() + " \nService:" + AppDetails.Rows[0]["SvcName"].ToString() + " \nBranch:" +
                         AppDetails.Rows[0]["Branch"].ToString() + " \nCollege:" + AppDetails.Rows[0]["CollegeName"].ToString() +
                        (CSCID == "" ? "" : "\nCSCID:" + CSCID));
            }
        }
        public void GenerateQRStudent(string RollNo)
        {
            AdmitCardBLL m_AdmitCardBLL = new AdmitCardBLL();
            System.Data.DataSet dt = m_AdmitCardBLL.GetQRStudentDetail(RollNo);
            string CSCID = "";

            if (dt != null && dt.Tables[0].Rows.Count > 0)
            {
                System.Data.DataTable AppDetails = dt.Tables[0];

                GenerateQRCode(AppDetails.Rows[0]["StudentDetail"].ToString());
            }
        }

        public void GenerateQRCodeDegree(string ServiceID, string AppID, string QRText)
        {
            //CitizenPortalLib.BLL.PaymentReceiptBLL m_PaymentReceiptBLL = new CitizenPortalLib.BLL.PaymentReceiptBLL();
            //System.Data.DataSet dt = m_PaymentReceiptBLL.GenerateQRCodeDegree(ServiceID, AppID);
            //string CSCID = "";

            //if (dt != null && dt.Tables[0].Rows.Count > 0)
            //{
            //    System.Data.DataTable AppDetails = dt.Tables[0];

            //    GenerateQRCode(AppDetails.Rows[0][0].ToString().Replace("|","\n"));
            //}
            GenerateQRCode(QRText);
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
            if (Content.Length <= 9254)
            {
                QRCodeGenerator qrGenerator = new QRCodeGenerator();
                QRCodeGenerator.QRCode qrCode = qrGenerator.CreateQrCode(Content, QRCodeGenerator.ECCLevel.M);
                System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();
                imgBarCode.Height = 110;
                imgBarCode.Width = 110;
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

        public void GenerateQRCodeMarksheet(string RollNo, string Semester, string Examtype, string ExamYear)
        {
            string SubjectDetails = "";
            CitizenPortalLib.BLL.StudentResultBLL m_studentmarksheet = new CitizenPortalLib.BLL.StudentResultBLL();
            System.Data.DataSet dt = m_studentmarksheet.GetQRCode(RollNo, Semester, Examtype, ExamYear);
            System.Data.DataTable MarkDetails = null;
            if (dt != null && dt.Tables[0].Rows.Count > 0)
            {
                System.Data.DataTable AppDetails = dt.Tables[0];

                if (dt != null && dt.Tables[1].Rows.Count > 0)
                {
                    MarkDetails = dt.Tables[1];
                    for (int i = 0; i < MarkDetails.Rows.Count; i++)
                    {
                        if (i == 0)
                        {
                            SubjectDetails = MarkDetails.Rows[i][0].ToString();
                        }
                        else
                            SubjectDetails = SubjectDetails + "\n" + MarkDetails.Rows[i][0].ToString();
                    }
                    
                }
                    GenerateQRCode("Enrollment NO:" + AppDetails.Rows[0]["EnrollmentNo"].ToString() + "\nRoll No.:" + AppDetails.Rows[0]["RollNo"].ToString() + "\nName:" + AppDetails.Rows[0]["Name"].ToString() + " \nFather's Name:" 
                         + AppDetails.Rows[0]["Father"].ToString() + " \nInstitute Name:" + AppDetails.Rows[0]["CollegeName"].ToString().Replace("&","and")
                                                                   + " \nExam Name:" + AppDetails.Rows[0]["ProgramName"].ToString()
                         + "\n" + SubjectDetails
                         + " \nSemester:" + AppDetails.Rows[0]["Semester"].ToString() + "\nResult:" + AppDetails.Rows[0]["lettergrade"].ToString() + "\nDate:" + AppDetails.Rows[0]["ResultDate"].ToString());
            }
        }
    }
}