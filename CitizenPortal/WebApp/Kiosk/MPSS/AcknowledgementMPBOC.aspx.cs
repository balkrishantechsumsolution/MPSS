using CitizenPortal.WebApp.Common.QRCode;
using CitizenPortalLib;
using CitizenPortalLib.BLL;
using java.lang;
using javax.security.auth;
using Org.BouncyCastle.Asn1.IsisMtt.X509;
using SqlHelper;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class AcknowledgementMPBOC : System.Web.UI.Page
    {

        string m_AppID, m_ServiceID;
        static data sqlhelper = new data();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] != null) { m_ServiceID = Request.QueryString["SvcID"].ToString(); }

            m_AppID = Request.QueryString["AppID"].ToString();


            DataTable dtApp = new DataTable();
            SqlParameter[] parameter = {
                 new SqlParameter("@AppID", m_AppID),
                 new SqlParameter("@ServiceID", m_ServiceID)
            };

            dtApp = sqlhelper.ExecuteDataTable("GetMPBOCStudentFormDataSP", parameter);


            if (dtApp.Rows.Count != 0)
            {
                if (dtApp.Rows[0]["StudentName"].ToString() != "")
                {
                    txtSamagraPortalNo.Text = dtApp.Rows[0]["RollNo"].ToString();
                    txtFamilyID.Text = dtApp.Rows[0]["SamagraFamilyID"].ToString();
                    txtUniqueCode.Text = dtApp.Rows[0]["UniqueCode"].ToString();
                    txtCardHolder.Text = dtApp.Rows[0]["CardHolderName"].ToString();

                    AppID.Text = m_AppID;
                    lblRollNo.Text = dtApp.Rows[0]["RollNo"].ToString();
                    lblEnrollmentNo.Text = dtApp.Rows[0]["StudentID"].ToString();
                    lblReg.Text = dtApp.Rows[0]["StudentID"].ToString();
                    FullName.Text = dtApp.Rows[0]["StudentName"].ToString();
                    gender.Text = dtApp.Rows[0]["Gender"].ToString();
                    FatherName.Text = dtApp.Rows[0]["FatherName"].ToString();
                    MotherName.Text = dtApp.Rows[0]["MotherName"].ToString();
                    DOBConverted.Text = dtApp.Rows[0]["Birthdate"].ToString();

                    Category.Text = dtApp.Rows[0]["Category"].ToString();
                    IsMPNative.Text = dtApp.Rows[0]["IsMPNative"].ToString();
                    MobileNo.Text = dtApp.Rows[0]["MobieNo"].ToString();
                    
                    School.Text = dtApp.Rows[0]["School"].ToString();

                    Class.Text = dtApp.Rows[0]["Class"].ToString();
                    lblAdmissionDate.Text = dtApp.Rows[0]["CreatedOn"].ToString();
                    
                    AdmissionDistrict.Text = dtApp.Rows[0]["DISTRICT"].ToString();
                    EntranceExamDist.Text = dtApp.Rows[0]["EntranceExamDistrict"].ToString();
                    StudentID.Text = dtApp.Rows[0]["StudentID"].ToString();
                    lblStudentID.Text = dtApp.Rows[0]["StudentID"].ToString();
                    SamagraNo.Text = dtApp.Rows[0]["SamagraNo"].ToString();
                    lblSamagra.Text = dtApp.Rows[0]["SamagraNo"].ToString();
                    
                    var val = dtApp.Rows[0]["Img"].ToString();

                    PAddressLine1.Text = dtApp.Rows[0]["HouseNo"].ToString();
                    PRoadStreetName.Text = dtApp.Rows[0]["Colony"].ToString();
                    PLandMark.Text = dtApp.Rows[0]["Colony"].ToString();
                    PLocality.Text = dtApp.Rows[0]["City"].ToString();
                    PddlDistrict.Text = dtApp.Rows[0]["AddressDISTRICT"].ToString();
                    PddlState.Text = dtApp.Rows[0]["StateName"].ToString();
                    PPinCode.Text = dtApp.Rows[0]["pincode"].ToString();

                    CAddressLine1.Text = dtApp.Rows[0]["HouseNo"].ToString();
                    CRoadStreetName.Text = dtApp.Rows[0]["Colony"].ToString();
                    CLandMark.Text = dtApp.Rows[0]["Colony"].ToString();
                    CLocality.Text = dtApp.Rows[0]["City"].ToString();
                    CddlDistrict.Text = dtApp.Rows[0]["AddressDISTRICT"].ToString();
                    CddlState.Text = dtApp.Rows[0]["StateName"].ToString();
                    CPinCode.Text = dtApp.Rows[0]["pincode"].ToString();


                    ProfilePhoto.Attributes.Add("src", val);

                    ProfilePhoto.DataBind();


                    var val1 = dtApp.Rows[0]["FileCaste"].ToString();
                    var val2 = dtApp.Rows[0]["File5MSh"].ToString();
                    var val3 = dtApp.Rows[0]["FileDisAbility"].ToString();
                    var val4 = dtApp.Rows[0]["FileNativeCert"].ToString();




                    if (val1 != "")
                    {
                        Label34.Text = "Yes";
                        tblCaste.Visible = true;
                        lblCasteDate.Text = dtApp.Rows[0]["CertIssueDate"].ToString();
                        lblCasteNo.Text = dtApp.Rows[0]["CastCertNo"].ToString();
                        lblCaste.Text = "Yes";
                    }
                    else
                    {
                        Label34.Text = "No";
                    }
                    if (val2 != "")
                    {
                        Label7.Text = "Yes";
                    }
                    else
                    {
                        Label7.Text = "No";
                    }
                    if (val3 != "")
                    {
                        Label33.Text = "Yes";
                    }
                    else
                    {
                        Label33.Text = "No";
                    }
                    if (val4 != "")
                    {
                        Label35.Text = "Yes";
                    }
                    else
                    {
                        Label35.Text = "No";
                    }

                    var iBoolHandi = dtApp.Rows[0]["DisAbility"].ToString();
                    if (iBoolHandi == "Y")
                    {
                        div1.Visible = true;

                        lblHani.Text = dtApp.Rows[0]["DisAbility"].ToString();
                        lblHaniCert.Text = dtApp.Rows[0]["DisAbilityNo"].ToString();
                        lblHaniType.Text = dtApp.Rows[0]["DisAbilityType"].ToString();
                    }

                    PreviousSchoolName.Text = dtApp.Rows[0]["PreviousSchoolName"].ToString();
                    lblSchoolType.Text = dtApp.Rows[0]["SchoolType"].ToString();
                    lblSchoolPreDist.Text = dtApp.Rows[0]["PreviousSchoolDistrict"].ToString();
                    lblSchoolClass.Text = dtApp.Rows[0]["ScClass"].ToString();
                    txtTotalMarks.Text = dtApp.Rows[0]["TotalMarks"].ToString();
                    txtMarksObtain.Text = dtApp.Rows[0]["MarksObtain"].ToString();
                    txtMarksPercentage.Text = dtApp.Rows[0]["MarksPercentage"].ToString();
                    txtGrade.Text = dtApp.Rows[0]["Grade"].ToString();
                    lblSchoolYear.Text = dtApp.Rows[0]["PassingYear"].ToString();

                    

                    Grade();

                }

                try
                {
                    //QRCode.GenerateQRCodeApplication(m_ServiceID, m_AppID);

                }

                catch
                {

                }
            }
        }
        public void Grade()
        {
            if (txtMarksPercentage.Text != "")
            {
                var rw = decimal.Parse(txtMarksPercentage.Text);
                var grade = "";

                if (rw >= 80.00M && rw <= 100M){grade = "A";}
                else if (rw >= 70.00M && rw <= 79.99M) { grade = "B"; }
                else if (rw >= 60.00M && rw <= 69.99M) { grade = "C"; }
                else if (rw >= 50.00M && rw <= 59.99M) { grade = "D"; }
                else if (rw >= 40.00M && rw <= 49.99M) { grade = "E"; }
                else if (rw >= 0.00M && rw <= 39.99M) { grade = "F"; }

                txtGrade.Text = grade;
            }
        }
        protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int i = 0;
                HtmlAnchor t_Anchor = null;
                if (e.Row.Cells[2].Text == "Attached")
                {
                    i = e.Row.Cells.Count - 1;
                    t_Anchor = new HtmlAnchor();
                    t_Anchor.ID = "ViewDoc_" + e.Row.RowIndex;
                    t_Anchor.InnerHtml = "View";
                    t_Anchor.Attributes.Add("onclick", "ViewDoc('" + m_AppID + "', '" + m_ServiceID + "','" + e.Row.Cells[3].Text + "')");
                    t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                    e.Row.Cells[i].Controls.Add(t_Anchor);
                    e.Row.Cells[i].Attributes.Add("Title", "View");
                    e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                    i++;
                }
                t_Anchor = null;
            }
        }
    }
}