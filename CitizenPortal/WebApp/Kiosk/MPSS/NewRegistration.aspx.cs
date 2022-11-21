using CitizenPortalLib.DataStructs;
using iTextSharp.text.pdf;
using Newtonsoft.Json;
using SqlHelper;
using sun.net.www.content.text;
using sun.security.jca;
using sun.swing;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class NewRegistration : System.Web.UI.Page
    {
        static data sqlhelper = new data();
        protected void Page_Load(object sender, EventArgs e)
        {

          
        }


    
       

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            string fileSTR = "images\\";
            strFolder = Server.MapPath("./")+ fileSTR;
            // Get the name of the file that is posted.
            strFileName = oFile.PostedFile.FileName;
            
            strFileName = Path.GetFileName(strFileName);
            if (oFile.Value != "")
            {
                
               

                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;
                string strf = Guid.NewGuid().ToString();

                string destFileName = Path.Combine(strFolder, strf + ".jpg");


              
                if (File.Exists(destFileName))
                {
                    lblUploadResult.Text = strFileName + " already exists on the server!";
                }
                else
                {
                    oFile.PostedFile.SaveAs(strFilePath);

                    File.Copy(strFilePath, destFileName);

                    string imgPath = "~/images/" + strf + ".jpg";

                    byte[] imageArray = System.IO.File.ReadAllBytes(destFileName);
                    string base64ImageRepresentation = Convert.ToBase64String(imageArray);

                   

                    var val = $"data: image/png; base64,{base64ImageRepresentation}";
                    ImageTC.Attributes.Add("src", val);
                    hdnTC.Value = val;
                    ImageTC.Width = Unit.Pixel(100);
                    ImageTC.Height = Unit.Pixel(50);
                    ImageTC.DataBind();

                    lblUploadResult.Text = strFileName + " has been successfully uploaded.";
                }
            }
            else
            {
                lblUploadResult.Text = "Click 'Browse' to select the file to upload.";
            }
            // Display the result of the upload.
            frmConfirmation.Visible = true;
        }

        protected void btnPhoto_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            string fileSTR = "images\\";
            strFolder = Server.MapPath("./") + fileSTR;
            // Get the name of the file that is posted.
            strFileName = File1.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (File1.Value != "")
            {
                // Create the directory if it does not exist.
                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;
                string strf = Guid.NewGuid().ToString();

                string destFileName = Path.Combine(strFolder, strf + ".jpg");


               
                if (File.Exists(destFileName))
                {
                    lblUploadResultPhoto.Text = strFileName + " already exists on the server!";
                }
                else
                {
                    File1.PostedFile.SaveAs(strFilePath);
                    File.Copy(strFilePath, destFileName);
                    string imgPath = "~/images/" + strf + ".jpg";

                    byte[] imageArray = System.IO.File.ReadAllBytes(destFileName);
                    string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                    var val = $"data: image/png; base64,{base64ImageRepresentation}";
                    hdnImage.Value = val;
                    myImg.Attributes.Add("src", val);
                    myImg.Width = Unit.Pixel(200);
                    myImg.Height = Unit.Pixel(150);
                    myImg.DataBind();

                    lblUploadResultPhoto.Text = strFileName + " has been successfully uploaded.";
                }
            }
            else
            {
                lblUploadResultPhoto.Text = "Click 'Browse' to select the file to upload.";
            }
            // Display the result of the upload.
            frmConfirmationPhoto.Visible = true;

        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            divSTUDENT.Visible = true;

        }

        protected void btnSubMain_Click(object sender, EventArgs e)
        {
            try
            {

                string[] replaceThese = { "data:image/png;base64,", "data:image/jpeg;base64,", "data:image/jpg;base64," };
               

                var chkrbnpass = false;

                if (rbnpass1.Checked)
                {
                    chkrbnpass = true;
                }
                else
                {
                    chkrbnpass = false;
                }


                var chkGender = "Male";

                if (rbnGender1.Checked)
                {
                    chkGender = "Male";
                }
                else
                {
                    chkGender = "Female";
                }


                var chkNative = false;

                if (rbnNative1.Checked)
                {
                    chkNative = true;
                }
                else
                {
                    chkNative = false;
                }

                Studentdata_DT t_ObjDT = new Studentdata_DT();
                t_ObjDT.StudentName = txtFullName.Text.Trim();

                t_ObjDT.IsPassOtherBoard = chkrbnpass;
                t_ObjDT.IsMPNative = chkNative;
                t_ObjDT.FatherName = txtFatherName.Text.Trim();
                t_ObjDT.MotherName = txtMotherName.Text.Trim();
                t_ObjDT.Birthdate = txtBirthdate.Text.Trim();
                t_ObjDT.Gender = chkGender.Trim();
                t_ObjDT.Class = ddlClass.SelectedValue;
                t_ObjDT.School = ddlSchool.SelectedValue;
                t_ObjDT.Img = hdnImage.Value;
                t_ObjDT.ImgTC = hdnTC.Value;

                t_ObjDT.City = txtCity.Text.Trim();
                t_ObjDT.Block = txtBlock.Text.Trim();
                t_ObjDT.District = txtDistrict.Text.Trim();
                t_ObjDT.Colony = txtColony.Text.Trim();
                t_ObjDT.HouseNo = txtHouse.Text.Trim();
                t_ObjDT.pincode = txtPinCode.Text.Trim();

                long defaultLongVal = 0;
                long.TryParse(txtSamagraNo.Text.Trim(), out defaultLongVal);


                t_ObjDT.SamagraNo = defaultLongVal;

                long defaultIntVal = 0;
                long.TryParse(txtMobie.Text.Trim(), out defaultIntVal);
                t_ObjDT.MobieNo = defaultIntVal;




                if (t_ObjDT.Birthdate != "")
                {
                    //t_ObjDT.TBirthdate = DateTime.ParseExact(t_ObjDT.Birthdate, "dd/MM/yyyy HH:mm:ss", CultureInfo.InvariantCulture);
                    t_ObjDT.TBirthdate = DateTime.ParseExact(t_ObjDT.Birthdate, "dd/MM/yyyy", null);
                }
                SqlParameter[] parameter = {
                    new SqlParameter("@StudentName", t_ObjDT.StudentName),
                        new SqlParameter("@StudentID", t_ObjDT.StudentID),
                        new SqlParameter("@Birthdate", t_ObjDT.Birthdate),
                        new SqlParameter("@Gender", t_ObjDT.Gender),
                        new SqlParameter("@Class", t_ObjDT.Class),
                        new SqlParameter("@Section", t_ObjDT.Section),
                        new SqlParameter("@Subject", t_ObjDT.Subject),
                        new SqlParameter("@School", t_ObjDT.School),
                        new SqlParameter("@FatherName", t_ObjDT.FatherName),
                        new SqlParameter("@MotherName", t_ObjDT.MotherName),
                        new SqlParameter("@Category", t_ObjDT.Category),
                        new SqlParameter("@SubCaste", t_ObjDT.SubCaste),
                        new SqlParameter("@Regilion", t_ObjDT.Regilion),
                        new SqlParameter("@IsMPNative", t_ObjDT.IsMPNative),
                        new SqlParameter("@Block", t_ObjDT.Block),
                         new SqlParameter("@City", t_ObjDT.City),
                        new SqlParameter("@District", t_ObjDT.District),
                        new SqlParameter("@Colony", t_ObjDT.Colony),
                        new SqlParameter("@HouseNo", t_ObjDT.HouseNo),
                        new SqlParameter("@pincode", t_ObjDT.pincode),
                        new SqlParameter("@MobieNo", t_ObjDT.MobieNo),
                        new SqlParameter("@SamagraNo", t_ObjDT.SamagraNo),
                        new SqlParameter("@Img", t_ObjDT.Img),
                        new SqlParameter("@ImgTC", t_ObjDT.ImgTC),
                        new SqlParameter("@IsDeclare", t_ObjDT.IsDeclare),
                          new SqlParameter("@IsPassOtherBoard", t_ObjDT.IsPassOtherBoard)
            };


                DataTable dt = sqlhelper.ExecuteDataTable("InsertStudentDetailsSP", parameter);
                var m_AppID = dt.Rows[0][0].ToString();
                var m_ServiceID = "1465";

                //string newWin = "window.open(\"AcknowledgementEnroll.aspx?AppID=" + m_AppID + "&SvcID=1465\", \"_blank\", \"WIDTH=1080,HEIGHT=790,scrollbars=no, menubar=no,resizable=yes,directories=no,location=no\");";              

                //Page.ClientScript.RegisterStartupScript(this.GetType(), "pop", "alert('Profile Updated Successfully.');"+ newWin, true);


                Response.Redirect("/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID);
            }

            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);



            }
        }

    }
}
