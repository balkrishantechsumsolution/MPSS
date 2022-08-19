using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.DMAS
{
    public partial class AnswerSheet : System.Web.UI.Page
    {
        DivisionalCertificateBLL m_DivisionalCertificateBLL = new DivisionalCertificateBLL();
        //svcid 372
        string m_AppID = "", m_ServiceID = "", RegNo = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            lblDate.Text = "Date : " + DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
            //lblPlace.Text = "Place : BHUBANESWAR";

            DataSet dt = m_DivisionalCertificateBLL.GetDivisionalCertificate(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];

            string t_ExamYear = "", t_Semester = "", t_FilePath = "", t_FileName = "", t_SessionCode = "", t_CourseCode = "", t_SubjectCode = "";
            if (dt.Tables[0].Rows.Count != 0)
            {
                lblAppID.Text = m_AppID;

                t_ExamYear = dt.Tables[0].Rows[0]["LeavingYear"].ToString();
                t_Semester = dt.Tables[0].Rows[0]["Semester"].ToString();
                RegNo = dt.Tables[0].Rows[0]["RegistrationNo"].ToString();

                t_SessionCode = dt.Tables[0].Rows[0]["SessionCode"].ToString();
                lblSubjectName.Text = dt.Tables[0].Rows[0]["SubjectName"].ToString();
                t_CourseCode = dt.Tables[0].Rows[0]["BranchCode"].ToString();
                t_SubjectCode = dt.Tables[0].Rows[0]["SubjectCode"].ToString();
                lblYear.Text = dt.Tables[0].Rows[0]["LeavingYear"].ToString();
                lblName.Text = dt.Tables[0].Rows[0]["StudentName"].ToString();
                lblBranch.Text = dt.Tables[0].Rows[0]["BranchName"].ToString();
                lblRegistration.Text = dt.Tables[0].Rows[0]["RegistrationNo"].ToString();
                lblSemester.Text = dt.Tables[0].Rows[0]["SemesterName"].ToString();
                lblSession.Text = dt.Tables[0].Rows[0]["Session"].ToString();
                lblInstitute.Text = dt.Tables[0].Rows[0]["InstituteName"].ToString();
                t_FilePath = dt.Tables[0].Rows[0]["FilePath"].ToString();

                /*
                 * ********* Need to check and impliment the logic ************ */
                if (dt.Tables[0].Rows[0]["FilePath"].ToString() == "")
                {
                    //t_FilePath = "http://admit.online-ap1.com/Webapipdf/api/Home/pdfapi?Registration=" +
                    //    lblRegistration.Text.Trim() + "&Subject_Code=" + t_SubjectCode + "&Semester_Code=" + t_Semester + "&Year=" + t_ExamYear;

                    //WebClient wb = new WebClient();
                    //wb.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.33 Safari/537.36");
                    //wb.DownloadFile(t_FilePath, Server.MapPath("~") + "\\"+ lblSemester.Text + ".pdf");


                    var request = (HttpWebRequest)WebRequest.Create("http://admit.online-ap1.com/Webapipdf/api/Home/PostPdfApi");

                    var postData = "Registration=" + lblRegistration.Text.Trim();
                    postData += "&Subject_Code=" + t_SubjectCode;
                    postData += "&Semester_Code=" + t_Semester;
                    postData += "&Year=" + t_ExamYear;

                    var data = Encoding.ASCII.GetBytes(postData);

                    request.Method = "POST";
                    request.ContentType = "application/x-www-form-urlencoded";
                    request.ContentLength = data.Length;

                    using (var stream = request.GetRequestStream())
                    {
                        stream.Write(data, 0, data.Length);
                    }

                    var response = (HttpWebResponse)request.GetResponse();

                    //var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();
                    Stream readStream = new StreamReader(response.GetResponseStream()).BaseStream;

                    //var fileStream = File.Create(t_FilePath + Server.MapPath("~") + "\\" + lblSemester.Text + ".pdf");
                    string saveTo = Server.MapPath("/PhotocopyDownload/") + m_AppID + ".pdf";
                    string openTo = "/PhotocopyDownload/" + m_AppID + ".pdf";
                    // create a write stream
                    FileStream writeStream = new FileStream(saveTo, FileMode.Create, FileAccess.Write);
                    // write to the stream
                    ReadWriteStream(readStream, writeStream);

                    lblDownload.Attributes.Add("onclick", "DownloadFile('" + openTo + "','')");
                    lblDownload.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");

                }
                else
                {
                    lblDownload.Attributes.Add("onclick", "DownloadFile('" + t_FilePath + "','')");
                    lblDownload.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                }



                //lblDownload.Attributes.Add("onclick", "DownloadFile('" + t_FilePath + "','')");
                //lblDownload.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");

                try { QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID); }
                catch { }




                /*
                DocumentVerification.StudentDetailsWS m_DocumentVerification = new DocumentVerification.StudentDetailsWS();

                DataTable t_Dt = m_DocumentVerification.AnswerSheet(RegNo, t_Semester, t_ExamYear + t_SessionCode, t_CourseCode, t_SubjectCode);


                if (t_Dt.Rows[0]["status"].ToString() != "Wrong Input")
                {

                    if (t_Dt.Rows.Count != 0)
                    {

                        lblName.Text = t_Dt.Rows[0]["StudentName"].ToString();
                        lblBranch.Text = t_Dt.Rows[0]["BranchName"].ToString();
                        
                        lblRegistration.Text = t_Dt.Rows[0]["RegistrationNumber"].ToString();
                        lblSemester.Text = t_Dt.Rows[0]["Semester"].ToString();
                        lblSession.Text = t_Dt.Rows[0]["Session"].ToString();
                        lblSubjectName.Text = t_Dt.Rows[0]["SubjectName"].ToString();
                        t_FileName = t_Dt.Rows[0]["Barcode"].ToString();

                        lblDownload.Attributes.Add("onclick", "DownloadFile('" + t_FilePath + "','')");
                        lblDownload.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                    }
                    else
                    {
                        string t_URL = "/WebApp/G2G/DTE/DMASForm.aspx?SvcID=371";
                        string m_Message = "No record found for Registration No : " + RegNo + ". Please check the and fill the necessary detail to issue Duplicate Diploma Certificate.";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='" + t_URL + "';", true);
                    }

                    try { QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID); }
                    catch { }
                }
                else
                {
                    string m_Message = "No record found for Registration No : " + RegNo + ".";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);

                }
                */

            }


        }


        // readStream is the stream you need to read
        // writeStream is the stream you want to write to
        private void ReadWriteStream(Stream readStream, Stream writeStream)
        {
            int Length = 256;
            Byte[] buffer = new Byte[Length];
            int bytesRead = readStream.Read(buffer, 0, Length);
            // write the required bytes
            while (bytesRead > 0)
            {
                writeStream.Write(buffer, 0, bytesRead);
                bytesRead = readStream.Read(buffer, 0, Length);
            }
            readStream.Close();
            writeStream.Close();
        }
    }
}