using CitizenPortalLib.DataStructs;
using Newtonsoft.Json;
using SqlHelper;
using sun.security.jca;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class ScholarShip : System.Web.UI.Page
    {
        static data sqlhelper = new data();
        protected void Page_Load(object sender, EventArgs e)
        {
            

          
            if (!IsPostBack)
            {
                BindDropDown();
                BindClassDropDown();
                BindSectionDropDown();
                BindGenderDropDown();
                BindStatusDropDown();
            }
        }

        public void BindClassDropDown()
        {
            DataTable dt = new DataTable();

            dt = sqlhelper.ExecuteDataTable("ClassSP");

            if (dt.Rows.Count > 0)
            {
                ddlClass.DataTextField = dt.Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
                ddlClass.DataValueField = dt.Columns["ID"].ToString();
                // to retrive specific  textfield name   
                ddlClass.DataSource = dt;      //assigning datasource to the dropdownlist  
                ddlClass.DataBind();

            }
            ddlClass.Items.Insert(0, new ListItem("Please select", ""));

        }

        public void BindSectionDropDown()
        {
            DataTable dt = new DataTable();

            dt = sqlhelper.ExecuteDataTable("GetSectionSP");

            if (dt.Rows.Count > 0)
            {
                ddlSection.DataTextField = dt.Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
                ddlSection.DataValueField = dt.Columns["ID"].ToString();
                // to retrive specific  textfield name   
                ddlSection.DataSource = dt;      //assigning datasource to the dropdownlist  
                ddlSection.DataBind();

            }
            ddlSection.Items.Insert(0, new ListItem("Please select", ""));

        }
        public void BindGenderDropDown()
        {
            DataTable dt = new DataTable();

            dt = sqlhelper.ExecuteDataTable("GetGenderSP");

            if (dt.Rows.Count > 0)
            {
                ddlGender.DataTextField = dt.Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
                ddlGender.DataValueField = dt.Columns["ID"].ToString();
                // to retrive specific  textfield name   
                ddlGender.DataSource = dt;      //assigning datasource to the dropdownlist  
                ddlGender.DataBind();

            }
            ddlGender.Items.Insert(0, new ListItem("Please select", ""));

        }

        public void BindStatusDropDown()
        {
            DataTable dt = new DataTable();

            dt = sqlhelper.ExecuteDataTable("GetStatusSP");

            if (dt.Rows.Count > 0)
            {
                ddlStatus.DataTextField = dt.Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
                ddlStatus.DataValueField = dt.Columns["ID"].ToString();
                // to retrive specific  textfield name   
                ddlStatus.DataSource = dt;      //assigning datasource to the dropdownlist  
                ddlStatus.DataBind();

            }
            ddlStatus.Items.Insert(0, new ListItem("Please select", ""));

        }

        public void BindDropDown()
        {
            DataTable dt = new DataTable();

            //Add Default Item in the DropDownList


            dt = sqlhelper.ExecuteDataTable("GetStudents");

            if (dt.Rows.Count > 0)
            {
                ddlStudenID.DataTextField = dt.Columns["StudentName"].ToString(); // text field name of table dispalyed in dropdown       
                ddlStudenID.DataValueField = dt.Columns["StudentID"].ToString();
                // to retrive specific  textfield name   
                ddlStudenID.DataSource = dt;      //assigning datasource to the dropdownlist  
                ddlStudenID.DataBind();

            }
            ddlStudenID.Items.Insert(0, new ListItem("Please select", ""));

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            try
            {



                Scholardata_DT t_ObjDT = new Scholardata_DT();

                t_ObjDT.StudentName = txtStudentName.Text.Trim();
                t_ObjDT.StudentID = long.Parse(ddlStudenID.SelectedValue);

                t_ObjDT.Birthdate = txtBirthdate.Text.Trim();
                t_ObjDT.Gender = ddlGender.SelectedValue.Trim();
                t_ObjDT.Class = ddlClass.SelectedValue.Trim();
                t_ObjDT.Section = ddlSection.SelectedValue.Trim();
                t_ObjDT.Subject = txtSubject.Text.Trim();
                t_ObjDT.School = txtSchool.Text.Trim();
                t_ObjDT.BankAccountNo = txtBankAccNo.Text.Trim();
                t_ObjDT.BankAccountIFSCCode = txtBankIFSCCode.Text.Trim();
                t_ObjDT.FatherName = txtFatherName.Text.Trim();
                t_ObjDT.FatherOcc = txtFatherOcc.Text.Trim();
                t_ObjDT.MotherName = txtMotherName.Text.Trim();
                t_ObjDT.MotherOcc = txtMotherOcc.Text.Trim();
                t_ObjDT.IsFatherDead = IsFatherDead.Checked;
                decimal FamiyIncomeVal = 0;
                decimal.TryParse(txtFamiyIncome.Text.Trim(), out FamiyIncomeVal);
                t_ObjDT.FamilyIncome = FamiyIncomeVal;
                t_ObjDT.Caste = txtCaste.Text.Trim();
                t_ObjDT.SubCaste = txtSubCaste.Text.Trim();
                t_ObjDT.CasteCertNo = txtDigitalCasteNo.Text.Trim();
                t_ObjDT.Regilion = ddlReligion.SelectedValue;
                t_ObjDT.IsMPOrigin = IsMPOrigin.Checked;
                t_ObjDT.IsParentIcomeTaxPayer = IsParentIcomeTaxPayer.Checked;
                t_ObjDT.IsAnyHaveScholarShip = IsAnyHaveScholarShip.Checked;
                t_ObjDT.ExamBoardName = txtExamBoardName.Text.Trim();
                decimal defaultDecimalVal = 0;
                decimal.TryParse(txtMonthlyFee.Text.Trim(), out defaultDecimalVal);
                t_ObjDT.MonthlyFee = defaultDecimalVal;
                t_ObjDT.IsHosteller = IsHosteller.Checked;
                t_ObjDT.DateAdmisCurrSch = txtDateAdmisCurrSch.Text.Trim();
                t_ObjDT.DateAdmisCurrClass = txtDateAdmisCurrClass.Text.Trim();
                t_ObjDT.IsDGSCaste = IsDGSCaste.Checked;
                t_ObjDT.NoOfSibling = int.Parse(txtNoOfSibling.Text.Trim());
                t_ObjDT.AdmissionNo = txtAdmissionNo.Text.Trim();
                t_ObjDT.IsFamilyBPL = IsFamilyBPL.Checked; ;
                t_ObjDT.IsDisadvantagedgroup = IsDisadvantagedgroup.Checked;
                t_ObjDT.IsRTE = IsRTE.Checked;
                t_ObjDT.CurrentCls = txtCurrentCls.Text.Trim();
                t_ObjDT.LastCls = txtLastCls.Text.Trim();
                t_ObjDT.IsClsFirstEnrollStatus = IsClsFirstEnrollStatus.Checked;
                int defaultIntVal = 0;
                int.TryParse(txtPreAttDays.Text.Trim(), out defaultIntVal);
                t_ObjDT.PreAttDays = defaultIntVal;
                t_ObjDT.Mediums = txtMediums.Text.Trim();
                t_ObjDT.Disability = txtDisability.Text.Trim();


                t_ObjDT.EquipDisability = txtEquipDisability.Text.Trim();
                t_ObjDT.FreeUniform = txtFreeUniform.Text.Trim();
                t_ObjDT.IsFreeTextbooks = IsFreeTextbooks.Checked;
                t_ObjDT.IsFreeTransport = IsFreeTransport.Checked;
                t_ObjDT.IsFreeEscortDis = IsFreeEscortDis.Checked;
                t_ObjDT.FreeBicycle = FreeBicycle.Checked;
                t_ObjDT.IsResidingHostel = IsResidingHostel.Checked;
                t_ObjDT.IsRecSpecialTraining = IsRecSpecialTraining.Checked;
                t_ObjDT.Ishomeless = Ishomeless.Checked;
                t_ObjDT.YrLastExam = txtYrLastExam.Text.Trim();
                t_ObjDT.LastAnnualResult = txtLastAnnualResult.Text.Trim();
                t_ObjDT.PassPercentage = txtPassPercentage.Text.Trim();
                t_ObjDT.LastClsInt = txtLastClsInt.Text.Trim();
                t_ObjDT.StudentStatus = ddlStatus.SelectedValue.Trim();
                t_ObjDT.CodeFacultySt = txtCodeFacultySt.Text.Trim();
                t_ObjDT.IsRegVocationalPrg = IsHosteller.Checked;
                t_ObjDT.CodeTradeVocationalPrg = txtCodeTradeVocationalPrg.Text.Trim();
                t_ObjDT.TypeJobRoleVocationalPrg = txtTypeJobRoleVocationalPrg.Text.Trim();
                t_ObjDT.LvlNSFQ = txtLvlNSFQ.Text.Trim();
                t_ObjDT.ObjVocationalPrg = txtObjVocationalPrg.Text.Trim();
                t_ObjDT.JobStaus = txtJobStaus.Text.Trim();
                decimal JobSalaryDecimalVal = 0;
                decimal.TryParse(txtJobSalary.Text.Trim(), out JobSalaryDecimalVal);
                t_ObjDT.JobSalary = JobSalaryDecimalVal;
                t_ObjDT.MobieNoParent = long.Parse(txtMobieNoParent.Text.Trim());
                t_ObjDT.LadliLaxmiNo = txtLadliLaxmiNo.Text.Trim();

                if (t_ObjDT.Birthdate != "")
                {
                    //t_ObjDT.TBirthdate = DateTime.ParseExact(t_ObjDT.Birthdate, "dd/MM/yyyy HH:mm:ss", CultureInfo.InvariantCulture);
                    t_ObjDT.TBirthdate = DateTime.ParseExact(t_ObjDT.Birthdate, "dd/MM/yyyy", null);
                }

                if (t_ObjDT.DateAdmisCurrSch != "")
                {
                    //t_ObjDT.TDateAdmisCurrSch = DateTime.ParseExact(t_ObjDT.DateAdmisCurrSch, "dd/MM/yyyy HH:mm:ss", CultureInfo.InvariantCulture);
                    t_ObjDT.TDateAdmisCurrSch = DateTime.ParseExact(t_ObjDT.DateAdmisCurrSch, "dd/MM/yyyy", null);
                }
                if (t_ObjDT.DateAdmisCurrClass != "")
                {
                    // t_ObjDT.TDateAdmisCurrClass = DateTime.ParseExact(t_ObjDT.DateAdmisCurrClass, "dd/MM/yyyy HH:mm:ss", CultureInfo.InvariantCulture);
                    t_ObjDT.TDateAdmisCurrClass = DateTime.ParseExact(t_ObjDT.DateAdmisCurrClass, "dd/MM/yyyy", null);
                }


                SqlParameter[] parameter = {
                 new SqlParameter("@StudentName", t_ObjDT.StudentName),
 new SqlParameter("@StudentID", t_ObjDT.StudentID),
 new SqlParameter("@Birthdate", t_ObjDT.TBirthdate),
 new SqlParameter("@Gender", t_ObjDT.Gender),
 new SqlParameter("@Class", t_ObjDT.Class ),
 new SqlParameter("@Section", t_ObjDT.Section),
 new SqlParameter("@Subject", t_ObjDT.Subject),
 new SqlParameter("@School", t_ObjDT.School),
 new SqlParameter("@BankAccountNo", t_ObjDT.BankAccountNo),
 new SqlParameter("@BankAccountIFSCCode", t_ObjDT.BankAccountIFSCCode),
 new SqlParameter("@FatherName", t_ObjDT.FatherName ),
 new SqlParameter("@FatherOcc", t_ObjDT.FatherOcc),
 new SqlParameter("@MotherName", t_ObjDT.MotherName ),
 new SqlParameter("@MotherOcc", t_ObjDT.MotherOcc),
 new SqlParameter("@IsFatherDead", t_ObjDT.IsFatherDead),
 new SqlParameter("@FamilyIncome", t_ObjDT.FamilyIncome),
 new SqlParameter("@Caste", t_ObjDT.Caste ),
 new SqlParameter("@SubCaste", t_ObjDT.SubCaste ),
 new SqlParameter("@CasteCertNo", t_ObjDT.CasteCertNo),
 new SqlParameter("@Regilion", t_ObjDT.Regilion ),
 new SqlParameter("@IsMPOrigin", t_ObjDT.IsMPOrigin ),
 new SqlParameter("@IsParentIcomeTaxPayer", t_ObjDT.IsParentIcomeTaxPayer  ),
 new SqlParameter("@IsAnyHaveScholarShip", t_ObjDT.IsAnyHaveScholarShip   ),
 new SqlParameter("@ExamBoardName", t_ObjDT.ExamBoardName),
 new SqlParameter("@MonthlyFee", t_ObjDT.MonthlyFee ),
 new SqlParameter("@IsHosteller", t_ObjDT.IsHosteller),
 new SqlParameter("@DateAdmisCurrSch", t_ObjDT.DateAdmisCurrSch ),
 new SqlParameter("@DateAdmisCurrClass", t_ObjDT.DateAdmisCurrClass),
 new SqlParameter("@IsDGSCaste", t_ObjDT.IsDGSCaste ),
 new SqlParameter("@NoOfSibling", t_ObjDT.NoOfSibling),
 new SqlParameter("@AdmissionNo", t_ObjDT.AdmissionNo),
 new SqlParameter("@IsFamilyBPL", t_ObjDT.IsFamilyBPL),
 new SqlParameter("@IsDisadvantagedgroup", t_ObjDT.IsDisadvantagedgroup   ),
 new SqlParameter("@IsRTE", t_ObjDT.IsRTE ),
 new SqlParameter("@CurrentCls", t_ObjDT.CurrentCls ),
 new SqlParameter("@LastCls", t_ObjDT.LastCls),
 new SqlParameter("@IsClsFirstEnrollStatus", t_ObjDT.IsClsFirstEnrollStatus ),
 new SqlParameter("@PreAttDays", t_ObjDT.PreAttDays ),
 new SqlParameter("@Mediums", t_ObjDT.Mediums),
 new SqlParameter("@Disability", t_ObjDT.Disability ),
 new SqlParameter("@EquipDisability", t_ObjDT.EquipDisability  ),
 new SqlParameter("@FreeUniform", t_ObjDT.FreeUniform),
 new SqlParameter("@IsFreeTextbooks", t_ObjDT.IsFreeTextbooks  ),
 new SqlParameter("@IsFreeTransport", t_ObjDT.IsFreeTransport  ),
 new SqlParameter("@IsFreeEscortDis", t_ObjDT.IsFreeEscortDis  ),
 new SqlParameter("@FreeBicycle", t_ObjDT.FreeBicycle),
 new SqlParameter("@IsResidingHostel", t_ObjDT.IsResidingHostel ),
 new SqlParameter("@IsRecSpecialTraining", t_ObjDT.IsRecSpecialTraining   ),
 new SqlParameter("@Ishomeless", t_ObjDT.Ishomeless ),
 new SqlParameter("@YrLastExam", t_ObjDT.YrLastExam ),
 new SqlParameter("@LastAnnualResult", t_ObjDT.LastAnnualResult ),
 new SqlParameter("@PassPercentage", t_ObjDT.PassPercentage   ),
 new SqlParameter("@LastClsInt", t_ObjDT.LastClsInt ),
 new SqlParameter("@StudentStatus", t_ObjDT.StudentStatus),
 new SqlParameter("@CodeFacultySt", t_ObjDT.CodeFacultySt),
 new SqlParameter("@IsRegVocationalPrg", t_ObjDT.IsRegVocationalPrg),
 new SqlParameter("@CodeTradeVocationalPrg", t_ObjDT.CodeTradeVocationalPrg ),
 new SqlParameter("@TypeJobRoleVocationalPrg", t_ObjDT.TypeJobRoleVocationalPrg),
 new SqlParameter("@LvlNSFQ", t_ObjDT.LvlNSFQ),
 new SqlParameter("@ObjVocationalPrg", t_ObjDT.ObjVocationalPrg ),
 new SqlParameter("@JobStaus", t_ObjDT.JobStaus ),
 new SqlParameter("@JobSalary", t_ObjDT.JobSalary),
 new SqlParameter("@MobieNoParent", t_ObjDT.MobieNoParent),
 new SqlParameter("@LadliLaxmiNo", t_ObjDT.LadliLaxmiNo)



            };

                //DataTable dtAll = sqlhelper.ExecuteDataTable("InsertScholarShipDetailsSP", parameter);
                int result = sqlhelper.ExecuteNonQuery("InsertScholarShipDetailsSP", parameter);
                

                var m_AppID = t_ObjDT.StudentID;
                var m_ServiceID = "1466";
                //string newWin = "window.open(\"Acknowledgement.aspx?AppID=" + m_AppID + "&SvcID=1466\", \"_blank\", \"WIDTH=1080,HEIGHT=790,scrollbars=no, menubar=no,resizable=yes,directories=no,location=no\");";

                ////ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message",
                ////       "newWin", true);




                //Page.ClientScript.RegisterStartupScript(this.GetType(), "pop", "alert('Profile Updated Successfully.');" + newWin, true);



                Response.Redirect("/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID);
            }

            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);



            }
        }
        protected void ddlStudenID_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dtApp = new DataTable();


            SqlParameter[] param = {
                 new SqlParameter("@StudentID",ddlStudenID.SelectedValue) };

            dtApp = sqlhelper.ExecuteDataTable("GetStudentByID", param);

            if (dtApp.Rows.Count > 0)
            {

                txtStudentName.Text = dtApp.Rows[0]["StudentName"].ToString();
                var strDate = DateTime.ParseExact(dtApp.Rows[0]["Birthdate"].ToString(), "dd/MM/yyyy HH:mm:ss", null);
                txtBirthdate.Text = strDate.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture); 
                ddlGender.SelectedValue = dtApp.Rows[0]["Gender"].ToString();
                txtFatherName.Text = dtApp.Rows[0]["FatherName"].ToString();
                txtMotherName.Text = dtApp.Rows[0]["MotherName"].ToString();
                IsMPOrigin.Checked= bool.Parse(dtApp.Rows[0]["IsMPNative"].ToString());
            }
        }
    }
}
