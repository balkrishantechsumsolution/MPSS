using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.CBCS
{
    public partial class ExaminationCard : AdminBasePage
    {
        string m_AppID, m_ServiceID, m_Semester;
        AdmitCardBLL t_AdmitCardBLL = new AdmitCardBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet dt = t_AdmitCardBLL.GetExaminationCard(m_AppID);
            DataTable StudentDT = dt.Tables[0];
            DataTable dt_1SEM = dt.Tables[1];
            DataTable dt_2SEM = dt.Tables[2];
            DataTable dt_3SEM = dt.Tables[3];
            DataTable dt_4SEM = dt.Tables[4];
            DataTable dt_5SEM = dt.Tables[5];
            DataTable dt_6SEM = dt.Tables[6];
            DataTable dt_SEM = dt.Tables[7];
            DataTable dt_PAY = dt.Tables[8];
            if (StudentDT != null && StudentDT.Rows.Count > 0)
            {
                try
                {
                    ProfilePhoto.Src = StudentDT.Rows[0]["ApplicantImageStr"].ToString();
                    ProfileSignature.Src = StudentDT.Rows[0]["ImageSign"].ToString();

                    lblCanddidateName.Text = StudentDT.Rows[0]["Name"].ToString();
                    DateTime date = Convert.ToDateTime(StudentDT.Rows[0]["DOB"]);
                    DOBConverted.Text = date.ToString("dd-MM-yyyy");
                    DateTime AsOndate = Convert.ToDateTime(StudentDT.Rows[0]["CreatedOn"]);
                    lblGender.Text = StudentDT.Rows[0]["Gender"].ToString();
                    lblMobile.Text = StudentDT.Rows[0]["Mobile"].ToString();
                    lblCollegeName.Text = StudentDT.Rows[0]["CollegeName"].ToString();
                    FatherName.Text = StudentDT.Rows[0]["Father"].ToString();
                    lblBrnachName.Text = StudentDT.Rows[0]["Branch"].ToString();
                    lblRollNo.Text = StudentDT.Rows[0]["RollNo"].ToString();
                    lblRegistrationNo.Text = StudentDT.Rows[0]["RegNo"].ToString();
                    lblHeading.Text = StudentDT.Rows[0]["lblHeading"].ToString();
                    lblNote.Text = StudentDT.Rows[0]["lblNote"].ToString();
                    lblCategory.Text = StudentDT.Rows[0]["Category"].ToString();
                    if (dt_1SEM.Rows.Count > 1)
                    {
                        GridView1SEM.DataSource = dt_1SEM;
                        GridView1SEM.DataBind();
                        lblSEM1.Text = dt_SEM.Rows[0]["SEMLebel"].ToString();

                        lblSEMFee1.Text = dt_PAY.Rows[0]["SEMFee"].ToString();
                        //lblPayDate1.Text = dt_PAY.Rows[0]["PayDate1"].ToString();
                        //lblPGID1.Text = dt_PAY.Rows[0]["PGID1"].ToString();
                        //lblAppID1.Text = dt_PAY.Rows[0]["AppID1"].ToString();
                    }
                    if (dt_2SEM.Rows.Count > 1)
                    {
                        GridView2SEM.DataSource = dt_2SEM;
                        GridView2SEM.DataBind();
                        lblSEM2.Text = dt_SEM.Rows[1]["SEMLebel"].ToString();
                        lblSEMFee2.Text = dt_PAY.Rows[1]["SEMFee"].ToString();
                        //lblPayDate2.Text = dt_PAY.Rows[0]["PayDate2"].ToString();
                        //lblPGID2.Text = dt_PAY.Rows[0]["PGID2"].ToString();
                        //lblAppID2.Text = dt_PAY.Rows[0]["AppID2"].ToString();

                    }
                    if (dt_3SEM.Rows.Count > 1)
                    {
                        GridView3SEM.DataSource = dt_3SEM;
                        GridView3SEM.DataBind();
                        lblSEM3.Text = dt_SEM.Rows[2]["SEMLebel"].ToString();
                        lblSEMFee3.Text = dt_PAY.Rows[2]["SEMFee"].ToString();
                        //lblPayDate3.Text = dt_PAY.Rows[0]["PayDate3"].ToString();
                        //lblPGID3.Text = dt_PAY.Rows[0]["PGID3"].ToString();
                        //lblAppID3.Text = dt_PAY.Rows[0]["AppID3"].ToString();

                    }
                    if (dt_4SEM.Rows.Count > 1)
                    {
                        GridView4SEM.DataSource = dt_4SEM;
                        GridView4SEM.DataBind();
                        lblSEM4.Text = dt_SEM.Rows[3]["SEMLebel"].ToString();
                        lblSEMFee4.Text = dt_PAY.Rows[3]["SEMFee"].ToString();
                        //lblPayDate4.Text = dt_PAY.Rows[0]["PayDate4"].ToString();
                        //lblPGID4.Text = dt_PAY.Rows[0]["PGID4"].ToString();
                        //lblAppID4.Text = dt_PAY.Rows[0]["AppID4"].ToString();

                    }
                    if (dt_5SEM.Rows.Count > 1)
                    {
                        GridView5SEM.DataSource = dt_5SEM;
                        GridView5SEM.DataBind();
                        lblSEM5.Text = dt_SEM.Rows[4]["SEMLebel"].ToString();
                        lblSEMFee5.Text = dt_PAY.Rows[4]["SEMFee"].ToString();
                        //lblPayDate5.Text = dt_PAY.Rows[0]["PayDate5"].ToString();
                        //lblPGID5.Text = dt_PAY.Rows[0]["PGID5"].ToString();
                        //lblAppID5.Text = dt_PAY.Rows[0]["AppID5"].ToString();

                    }
                    if (dt_6SEM.Rows.Count > 1)
                    {
                        GridView6SEM.DataSource = dt_6SEM;
                        GridView6SEM.DataBind();
                        lblSEM6.Text = dt_SEM.Rows[5]["SEMLebel"].ToString();
                        lblSEMFee6.Text = dt_PAY.Rows[5]["SEMFee"].ToString();
                        //lblPayDate6.Text = dt_PAY.Rows[0]["PayDate6"].ToString();
                        //lblPGID6.Text = dt_PAY.Rows[0]["PGID6"].ToString();
                        //lblAppID6.Text = dt_PAY.Rows[0]["AppID6"].ToString();
                    }
                    
                    lblPrint.Text = "Printed On : " + DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");
                }
                catch (Exception ex)
                {

                }

                try
                {

                    QRCode.GenerateQRStudent(lblRollNo.Text);

                    //string strPreviousPage = "";
                    //if (Request.UrlReferrer != null)
                    //{
                    //    strPreviousPage = Request.UrlReferrer.Segments[Request.UrlReferrer.Segments.Length - 1];
                    //}
                    //if (strPreviousPage == "")
                    //{
                    //    Response.Redirect("~/customError.aspx");
                    //}

                }
                catch { }
            }
        }
    }
}