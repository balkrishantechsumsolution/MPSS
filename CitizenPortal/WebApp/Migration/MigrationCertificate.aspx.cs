using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Migration
{
    public partial class MigrationCertificate : System.Web.UI.Page
    {
        MigrationBLL m_MigrationBLLL = new MigrationBLL();
        MigrationCertificatetable2BLL m_MigrationCertificatetable2BLL = new MigrationCertificatetable2BLL();
        DuplicateMigrationCertificateBLL m_MigrationCertificateBLL = new DuplicateMigrationCertificateBLL();
        string m_AppID = "", m_ServiceID = "", RegNo = "";

        void Migrationsave(DataSet p_DS)
        {
            DataSet t_DS = p_DS;

            var Row = t_DS.Tables[0].Rows[0].ToString();

            if (t_DS.Tables[0].Rows[0]["status"].ToString() == "Wrong Input")
            {
                return;

            }
            else
            {

                string[] AFields = {

                "aadhaarNumber"
                , "ProfileID"
                ,"AppName"
                ,"InstituteName"
                ,"RegistrationNo"
                ,"ExamYMCode"
                , "StudentName"
                , "SINO"
                , "Year"
                , "Status"
                , "MonthCode"
                , "ExamYMName"
                , "BranchName"
                , "GrandTotalFullMark"
                , "GrandTotalMarkSecured"
                , "GrandTotalDivisionMark"
                , "GrandTotalDivision"
                , "ResponseString"
                ,"CreatedBy"
                ,"CreatedOn"
                ,"ModifiedOn"
                ,"ModifiedBy"
                ,"ClientIP"
                };

                // var Row = t_DS.Tables[0].Rows[0].ToString();
                DataRow[] table0 = new DataRow[t_DS.Tables[0].Rows.Count];
                for (int i = 0; i < table0.Length; i++)
                {
                    table0[i] = t_DS.Tables[0].Rows[i];
                }
                DataColumn[] table1 = new DataColumn[t_DS.Tables[1].Columns.Count];

                for (int i = 0; i < table1.Length; i++)
                {
                    table1[i] = t_DS.Tables[1].Columns[i];
                }

                NewMigrationCertificate_DT objMigrationCertificate_DT = new NewMigrationCertificate_DT();
                objMigrationCertificate_DT.aadhaarNumber = "";
                objMigrationCertificate_DT.ProfileID = "";
                objMigrationCertificate_DT.AppName = "";
                objMigrationCertificate_DT.ExamYMCode = "";
                objMigrationCertificate_DT.RegistrationNo = table0[0].ItemArray[0].ToString();
                objMigrationCertificate_DT.StudentName = table0[0].ItemArray[1].ToString();
                objMigrationCertificate_DT.SINO = table0[0].ItemArray[2].ToString();
                objMigrationCertificate_DT.Year = table0[0].ItemArray[3].ToString();
                objMigrationCertificate_DT.MonthCode = table0[0].ItemArray[4].ToString();
                objMigrationCertificate_DT.ExamYMName = table0[0].ItemArray[5].ToString();
                objMigrationCertificate_DT.BranchName = table0[0].ItemArray[6].ToString();
                objMigrationCertificate_DT.InstituteName = table0[0].ItemArray[7].ToString();
                objMigrationCertificate_DT.GrandTotalFullMark = table0[0].ItemArray[8].ToString();
                objMigrationCertificate_DT.GrandTotalMarkSecured = table0[0].ItemArray[9].ToString();
                objMigrationCertificate_DT.GrandTotalDivisionMark = table0[0].ItemArray[10].ToString();
                objMigrationCertificate_DT.GrandTotalDivision = table0[0].ItemArray[11].ToString();
                objMigrationCertificate_DT.ResponseString = table0[0].ItemArray[12].ToString();
                objMigrationCertificate_DT.Status = table0[0].ItemArray[1].ToString();
                objMigrationCertificate_DT.CreatedBy = "";
                objMigrationCertificate_DT.CreatedOn = System.DateTime.Now;
                objMigrationCertificate_DT.ModifiedOn = System.DateTime.Now;
                objMigrationCertificate_DT.ModifiedBy = "";
                objMigrationCertificate_DT.ClientIP = "";
                DataTable t_db = m_MigrationCertificateBLL.InsertMigrationCertificate(objMigrationCertificate_DT, AFields);

                //table2
                string[] AFields2 = {

                "aadhaarNumber"
                , "ProfileID"
                ,"AppName"
                , "SINO"
                ,"PCode"
                , "SubjectName"
                , "TotalFullMark"
                , "TotalMarkSecured"
                ,"CreatedBy"
                ,"CreatedOn"
                ,"ModifiedOn"
                ,"ModifiedBy"
                ,"ClientIP"
                };

                NewMigrationCertificateTable2_DT objNewMigrationCertificateTable2_DT = new NewMigrationCertificateTable2_DT();

                int tblcount = t_DS.Tables.Count - 2;// 8

                int m = 2;
                for (int j = 0; j < tblcount; j++)
                {

                    DataRow[] table2 = new DataRow[t_DS.Tables[m].Rows.Count];
                    for (int k = 0; k < table2.Length; k++)
                    {
                        table2[k] = t_DS.Tables[m].Rows[k];
                    }

                    for (int i = 0; i < table2.Length; i++)
                    {
                        objNewMigrationCertificateTable2_DT.aadhaarNumber = "";
                        objNewMigrationCertificateTable2_DT.ProfileID = "";
                        objNewMigrationCertificateTable2_DT.AppName = "";
                        objNewMigrationCertificateTable2_DT.SINO = table2[i].ItemArray[0].ToString();
                        objNewMigrationCertificateTable2_DT.PCode = table2[i].ItemArray[1].ToString();
                        objNewMigrationCertificateTable2_DT.SubjectName = table2[i].ItemArray[2].ToString();
                        objNewMigrationCertificateTable2_DT.TotalFullMark = table2[i].ItemArray[3].ToString();
                        objNewMigrationCertificateTable2_DT.TotalMarkSecured = table2[i].ItemArray[4].ToString();
                        objNewMigrationCertificateTable2_DT.CreatedBy = "";
                        objNewMigrationCertificateTable2_DT.CreatedOn = System.DateTime.Now;
                        objNewMigrationCertificateTable2_DT.ModifiedOn = System.DateTime.Now;
                        objNewMigrationCertificateTable2_DT.ModifiedBy = "";
                        objNewMigrationCertificateTable2_DT.ClientIP = "";
                        DataTable t_db2 = m_MigrationCertificatetable2BLL.InsertMigrationCertificatetb2(objNewMigrationCertificateTable2_DT, AFields2);
                    }
                    m++;
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {            
            if (Request.QueryString["AppID"] == null) return;
            //if (Request.QueryString["RegNo"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet ds = m_MigrationBLLL.GetMigrationCertificate(m_ServiceID, m_AppID, RegNo);
            DataTable dt = ds.Tables[0];
            DataTable dtResult = ds.Tables[1];
            //DataTable dtExamSession = ds.Tables[2];
            if (dtResult.Rows.Count == 0)
            {
            }
            if (dt.Rows.Count != 0)
            {
                lblAppDate.Text = dt.Rows[0]["AppDate"].ToString();
                lblDate.Text = DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
                lblRollNo.Text = dt.Rows[0]["RollNo"].ToString();
                lblSlNo.Text = dt.Rows[0]["SlNo"].ToString();
                lblReg.Text = dt.Rows[0]["EnrollmentNo"].ToString();
                lblName.Text = dt.Rows[0]["StudentName"].ToString();
                lblFather.Text = dt.Rows[0]["FatherName"].ToString();
                if (dtResult.Rows.Count > 0)
                {
                    lblInstitute.Text = dt.Rows[0]["CollegeName"].ToString();
                    lblBranch.Text = dtResult.Rows[0]["Course"].ToString();
                    if (dtResult.Rows[0]["PassingYear"].ToString() != "")
                    {
                        lblExamYear.Text = dtResult.Rows[0]["PassingYear"].ToString();
                    }
                    else { dtResult.Rows[0]["ExamSession"].ToString(); }

                    lblResult.Text = dtResult.Rows[0]["Result"].ToString();
                    lblSemester.Text = dtResult.Rows[0]["Semester"].ToString();
                }
                //lblSession.Text = l_dt.Rows[0]["Session"].ToString() + " - " + t_Year;
            }
            

            try
            {
                QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);
            }
            catch { }

        }
    

        private void CheckForManualData(string m_AppID)
        {
            DataTable l_dt = m_MigrationBLLL.GetManualDataMigration(m_AppID, m_ServiceID);

            if (l_dt.Rows.Count != 0)
            {
                lblSlNo.Text = l_dt.Rows[0]["RegistrationNumber"].ToString();
                lblReg.Text = l_dt.Rows[0]["RegistrationNumber"].ToString();
                lblName.Text = l_dt.Rows[0]["StudentName"].ToString();
                lblInstitute.Text = l_dt.Rows[0]["InstituteName"].ToString();
                lblBranch.Text = l_dt.Rows[0]["BranchName"].ToString();

            }
            else {
                string t_URL = "/WebApp/G2G/SU/DMASForm.aspx?SvcID=446&AppID=" + m_AppID;
                string m_Message = "No record found for Registration No : " + RegNo + ". Please check the and fill the necessary detail to issue Migration Certificate.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='" + t_URL + "';", true);
            }
        }
    }
}