using CitizenPortalLib.DataStructs;
using iTextSharp.text.pdf;
using Newtonsoft.Json;
using SqlHelper;
using sun.security.jca;
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
    public partial class ScholarShip : System.Web.UI.Page
    {
        static data sqlhelper = new data();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["LoginID"].ToString() == null) return;

            if (!IsPostBack)
            {
                BindDropDown();
                BindClassDropDown();
                BindSectionDropDown();
                BindGenderDropDown();
                BindCasteDropDown();
                //BindStatusDropDown();
                BindCuurentClassDropDown();
                BindPreviousClassDropDown();
                BindCuurentSchoolNameDropDown();
            }
        }


        public void BindCasteDropDown()
        {
            DataTable dt = new DataTable();
            dt = sqlhelper.ExecuteDataTable("GetCasteSP");

            if (dt.Rows.Count > 0)
            {
                ddlCaste.DataTextField = dt.Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
                ddlCaste.DataValueField = dt.Columns["ID"].ToString();
                // to retrive specific  textfield name   
                ddlCaste.DataSource = dt;      //assigning datasource to the dropdownlist  
                ddlCaste.DataBind();

            }
            ddlCaste.Items.Insert(0, new ListItem("Please select", ""));

        }

        public void BindCuurentSchoolNameDropDown()
        {
            DataTable dt = new DataTable();
            dt = sqlhelper.ExecuteDataTable("GetCuurentSchoolNameSP");

            if (dt.Rows.Count > 0)
            {
                ddlCuurentSchoolName.DataTextField = dt.Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
                ddlCuurentSchoolName.DataValueField = dt.Columns["ID"].ToString();
                // to retrive specific  textfield name   
                ddlCuurentSchoolName.DataSource = dt;      //assigning datasource to the dropdownlist  
                ddlCuurentSchoolName.DataBind();

            }
            ddlCuurentSchoolName.Items.Insert(0, new ListItem("Please select", ""));

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

        public void BindCuurentClassDropDown()
        {
            DataTable dt = new DataTable();

            dt = sqlhelper.ExecuteDataTable("CuurentClassSP");

            if (dt.Rows.Count > 0)
            {
                ddlCuurentClass.DataTextField = dt.Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
                ddlCuurentClass.DataValueField = dt.Columns["ID"].ToString();
                // to retrive specific  textfield name   
                ddlCuurentClass.DataSource = dt;      //assigning datasource to the dropdownlist  
                ddlCuurentClass.DataBind();

            }
            ddlCuurentClass.Items.Insert(0, new ListItem("Please select", ""));

        }

        public void BindPreviousClassDropDown()
        {
            DataTable dt = new DataTable();

            dt = sqlhelper.ExecuteDataTable("PreviousClassSP");

            if (dt.Rows.Count > 0)
            {
                ddlPreviousClass.DataTextField = dt.Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
                ddlPreviousClass.DataValueField = dt.Columns["ID"].ToString();
                // to retrive specific  textfield name   
                ddlPreviousClass.DataSource = dt;      //assigning datasource to the dropdownlist  
                ddlPreviousClass.DataBind();

            }
            ddlPreviousClass.Items.Insert(0, new ListItem("Please select", ""));

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

        //public void BindStatusDropDown()
        //{
        //    DataTable dt = new DataTable();

        //    dt = sqlhelper.ExecuteDataTable("GetStatusSP");

        //    if (dt.Rows.Count > 0)
        //    {
        //        ddlStatus.DataTextField = dt.Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
        //        ddlStatus.DataValueField = dt.Columns["ID"].ToString();
        //        // to retrive specific  textfield name   
        //        ddlStatus.DataSource = dt;      //assigning datasource to the dropdownlist  
        //        ddlStatus.DataBind();

        //    }
        //    ddlStatus.Items.Insert(0, new ListItem("Please select", ""));

        //}

        public void BindDropDown()
        {
            //DataTable dt = new DataTable();

            ////Add Default Item in the DropDownList


            //dt = sqlhelper.ExecuteDataTable("GetStudents");

            //if (dt.Rows.Count > 0)
            //{
            //    ddlStudenID.DataTextField = dt.Columns["StudentName"].ToString(); // text field name of table dispalyed in dropdown       
            //    ddlStudenID.DataValueField = dt.Columns["StudentID"].ToString();
            //    // to retrive specific  textfield name   
            //    ddlStudenID.DataSource = dt;      //assigning datasource to the dropdownlist  
            //    ddlStudenID.DataBind();

            //}
            //ddlStudenID.Items.Insert(0, new ListItem("Please select", ""));

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            try
            {

                if (hdnImage.Value == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Image could not be attached.');", true);
                    return;
                }

                if (hdnTC.Value == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Transfer Certificate could not be attached.');", true);
                    return;
                }

                if (hdnCheque.Value == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Copy of Cheque could not be attached.');", true);
                    return;
                }
                if (hdnPassbook.Value == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Copy of Passbook could not be attached.');", true);
                    return;
                }

                var chkrbnpass = false;

                if (rbnpass1.Checked)
                {
                    chkrbnpass = true;
                }
                else
                {
                    chkrbnpass = false;
                }

                var chk1 = false;

                if (RadioButton29.Checked)
                {
                    chk1 = true;
                    //IsParentIcomeTaxPayer
                }
                else
                {
                    chk1 = false;
                }

                var chk2 = false;

                if (RadioButton27.Checked)
                {
                    chk2 = true;
                    //IsAnyHaveScholarShip
                }
                else
                {
                    chk2 = false;
                }

                var chk3 = false;

                if (RadioButton25.Checked)
                {
                    chk3 = true;
                    //IsHosteller
                }
                else
                {
                    chk3 = false;
                }

                var chk4 = false;

                if (IsFamilyBPLY.Checked)
                {
                    chk4 = true;
                    //IsFamilyBPL
                }
                else
                {
                    chk4 = false;
                }

                var chk5 = false;

                if (RadioButton1.Checked)
                {
                    chk5 = true;
                    //IsDisadvantagedgroup
                }
                else
                {
                    chk5 = false;
                }

                var chk6 = false;

                if (RadioButton3.Checked)
                {
                    chk6 = true;
                    //IsRTE
                }
                else
                {
                    chk6 = false;
                }

                var chk7 = false;

                if (RadioButton5.Checked)
                {
                    chk7 = true;
                    //IsClsFirstEnrollStatus
                }
                else
                {
                    chk7 = false;
                }

                var chk8 = false;

                if (RadioButton7.Checked)
                {
                    chk8 = true;
                    //IsDGSCaste
                }
                else
                {
                    chk8 = false;
                }

                var chk9 = false;

                if (RadioButton9.Checked)
                {
                    chk9 = true;
                    //IsFreeTextbooks
                }
                else
                {
                    chk9 = false;
                }

                var chk10 = false;

                if (RadioButton11.Checked)
                {
                    chk10 = true;
                    //IsFreeTransport
                }
                else
                {
                    chk10 = false;
                }

                var chk11 = false;

                if (RadioButton13.Checked)
                {
                    chk11 = true;
                    //IsFreeEscortDis
                }
                else
                {
                    chk11 = false;
                }

                var chk12 = false;

                if (RadioButton15.Checked)
                {
                    chk12 = true;
                    //FreeBicycle
                }
                else
                {
                    chk12 = false;
                }


                var chk13 = false;

                if (RadioButton17.Checked)
                {
                    chk13 = true;
                    //IsResidingHostel
                }
                else
                {
                    chk13 = false;
                }

                var chk14 = false;

                if (RadioButton19.Checked)
                {
                    chk14 = true;
                    //IsRecSpecialTraining
                }
                else
                {
                    chk14 = false;
                }

                var chk15 = false;

                if (RadioButton21.Checked)
                {
                    chk15 = true;
                    //Ishomeless
                }
                else
                {
                    chk15 = false;
                }

                var chk16 = false;

                if (RadioButton23.Checked)
                {
                    chk16 = true;
                    //IsRegVocationalPrg
                }
                else
                {
                    chk16 = false;
                }


                var chkIsMPOrigin = false;

                if (IsMPOriginY.Checked)
                {
                    chkIsMPOrigin = true;
                    //IsRegVocationalPrg
                }
                else
                {
                    chkIsMPOrigin = false;
                }


                Scholardata_DT t_ObjDT = new Scholardata_DT();

                t_ObjDT.IsPassOtherBoard = chkrbnpass;

                t_ObjDT.StudentName = txtStudentName.Text.Trim();
                t_ObjDT.NameInHindi = txtStudentHindiName.Text.Trim();
                t_ObjDT.StudentID = 0;

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
                t_ObjDT.Caste = ddlCaste.SelectedValue.Trim();
                t_ObjDT.SubCaste = txtSubCaste.Text.Trim();
                t_ObjDT.CasteCertNo = txtDigitalCasteNo.Text.Trim();
                t_ObjDT.Regilion = ddlReligion.SelectedValue;
                t_ObjDT.IsMPOrigin = chkIsMPOrigin;

                //chk1 = true;
                ////IsParentIcomeTaxPayer
                //chk2 = true;
                ////IsAnyHaveScholarShip
                //chk3 = true;
                ////IsHosteller
                //chk4 = true;
                ////IsFamilyBPL
                //chk5 = true;
                ////IsDisadvantagedgroup
                //chk6 = true;
                ////IsRTE

                //chk7 = true;
                ////IsClsFirstEnrollStatus

                //chk8 = true;
                ////IsDGSCaste

                //chk9 = true;
                ////IsFreeTextbooks

                //chk10 = true;
                ////IsFreeTransport

                //chk11 = true;
                ////IsFreeEscortDis

                //chk12 = true;
                ////FreeBicycle

                //chk13 = true;
                ////IsResidingHostel

                //chk14 = true;
                ////IsRecSpecialTraining

                //chk15 = true;
                ////Ishomeless

                //chk16 = true;
                ////IsRegVocationalPrg


                t_ObjDT.IsParentIcomeTaxPayer = chk1;
                t_ObjDT.IsAnyHaveScholarShip = chk2;
                t_ObjDT.ExamBoardName = txtExamBoardName.Text.Trim();
                decimal defaultDecimalVal = 0;
                decimal.TryParse(txtMonthlyFee.Text.Trim(), out defaultDecimalVal);
                t_ObjDT.MonthlyFee = defaultDecimalVal;
                t_ObjDT.IsHosteller = chk3;
                t_ObjDT.DateAdmisCurrSch = txtDateAdmisCurrSch.Text.Trim();
                t_ObjDT.DateAdmisCurrClass = txtDateAdmisCurrClass.Text.Trim();
                t_ObjDT.IsDGSCaste = chk8;
                t_ObjDT.NoOfSibling = int.Parse(txtNoOfSibling.Text.Trim());
                t_ObjDT.AdmissionNo = txtAdmissionNo.Text.Trim();
                t_ObjDT.IsFamilyBPL = chk4;
                t_ObjDT.IsDisadvantagedgroup = chk5;
                t_ObjDT.IsRTE = chk6;
                t_ObjDT.CurrentCls = txtCurrentCls.Text.Trim();
                t_ObjDT.LastCls = txtLastCls.Text.Trim();
                t_ObjDT.IsClsFirstEnrollStatus = chk7;
                int defaultIntVal = 0;
                int.TryParse(txtPreAttDays.Text.Trim(), out defaultIntVal);
                t_ObjDT.PreAttDays = defaultIntVal;
                t_ObjDT.Mediums = ddlMedium.SelectedValue.Trim();
                t_ObjDT.Disability = ddlDisAbility.SelectedItem.Value;
                t_ObjDT.DisAbilityType = ddlDisAbilityType.SelectedValue.Trim();



                t_ObjDT.EquipDisability = txtEquipDisability.Text.Trim();
                t_ObjDT.FreeUniform = txtFreeUniform.Text.Trim();
                t_ObjDT.IsFreeTextbooks = chk9;
                t_ObjDT.IsFreeTransport = chk10;
                t_ObjDT.IsFreeEscortDis = chk11;
                t_ObjDT.FreeBicycle = chk12;
                t_ObjDT.IsResidingHostel = chk13;
                t_ObjDT.IsRecSpecialTraining = chk14;
                t_ObjDT.Ishomeless = chk15;
                t_ObjDT.YrLastExam = txtYrLastExam.Text.Trim();
                t_ObjDT.LastAnnualResult = txtLastAnnualResult.Text.Trim();
                t_ObjDT.PassPercentage = txtPassPercentage.Text.Trim();
                t_ObjDT.LastClsInt = txtLastClsInt.Text.Trim();
                t_ObjDT.StudentStatus = ddlStatus.SelectedValue.Trim();
                t_ObjDT.CodeFacultySt = txtCodeFacultySt.Text.Trim();
                t_ObjDT.IsRegVocationalPrg = chk16;
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

                long defaultLongVal = 0;
                long.TryParse(txtPrincipalMoNo.Text.Trim(), out defaultLongVal);
                t_ObjDT.PrincipalMoNo = defaultLongVal;

                t_ObjDT.PrincipalBankIFSC = txtPrincipalBankIFSC.Text.Trim();
                t_ObjDT.PrincipalConfirmBankNo = txtPrincipalConfirmBankNo.Text.Trim();
                t_ObjDT.PrincipalBankNo = txtPrincipalBankNo.Text.Trim();
                t_ObjDT.ScBankName = txtScBankName.Text.Trim();
                t_ObjDT.ScActive = txtScActive.Text.Trim();

                long defaultUserLongVal = 0;
                long.TryParse(txtUserMoNo.Text.Trim(), out defaultUserLongVal);
                t_ObjDT.UserMoNo = defaultUserLongVal;

                t_ObjDT.StudentBankName = txtStudentBankName.Text.Trim();
                t_ObjDT.SchoolEntryCls = txtSchoolEntryCls.Text.Trim();
                t_ObjDT.DiceCode = txtDiceCode.Text.Trim();
                t_ObjDT.StudyCls = ddlCuurentClass.SelectedValue.Trim();
                t_ObjDT.PrestudyCls = ddlPreviousClass.SelectedValue.Trim();
                t_ObjDT.AllSubject = ddlAllSubject.SelectedValue.Trim();
                t_ObjDT.PreAllSubject = ddlPreAllSubject.SelectedValue.Trim();
                t_ObjDT.Detached = txtDetached.Text.Trim();
                t_ObjDT.DetachedPer = txtDetachedPer.Text.Trim();
                t_ObjDT.DetachedPerEqp = txtDetachedPerEqp.Text.Trim();
                t_ObjDT.DetachedPerEscort = txtDetachedPerEscort.Text.Trim();

                t_ObjDT.HostelName = txtHostelName.Text.Trim();
                t_ObjDT.SambathaCode = txtSambathaCode.Text.Trim();
                t_ObjDT.CuurentSchoolName = ddlCuurentSchoolName.SelectedValue.Trim();


                long defaultSamagraIDLongVal = 0;
                long.TryParse(txtSamagraID.Text.Trim(), out defaultSamagraIDLongVal);
                t_ObjDT.SamagraID = defaultSamagraIDLongVal;


                long defaultFamilySamagraIDLongVal = 0;
                long.TryParse(txtSamagraID.Text.Trim(), out defaultFamilySamagraIDLongVal);
                t_ObjDT.FamilySamagraID = defaultFamilySamagraIDLongVal;

                long defaultAadharLongVal = 0;
                long.TryParse(txtAadhar.Text.Trim(), out defaultAadharLongVal);
                t_ObjDT.Aadhar = defaultFamilySamagraIDLongVal;



                t_ObjDT.Img = hdnImage.Value;
                t_ObjDT.ImgTC = hdnTC.Value;

                t_ObjDT.ImgPath = hdnImagePath.Value;
                t_ObjDT.ImgTCPath = hdnTCPath.Value;


                t_ObjDT.Cheque = hdnCheque.Value;
                t_ObjDT.ChequePath = hdnChequePath.Value;

                t_ObjDT.Passbook = hdnPassbook.Value;
                t_ObjDT.PassbookPath = hdnPassbookPath.Value;



                t_ObjDT.City = txtCity.Text.Trim();
                t_ObjDT.Block = txtBlock.Text.Trim();
                t_ObjDT.District = txtDistrict.Text.Trim();
                t_ObjDT.Colony = txtColony.Text.Trim();
                t_ObjDT.HouseNo = txtHouse.Text.Trim();
                t_ObjDT.pincode = txtPinCode.Text.Trim();

                t_ObjDT.UserID = Session["LoginID"].ToString();


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
                        new SqlParameter("@DateAdmisCurrSch", t_ObjDT.TDateAdmisCurrSch ),
                        new SqlParameter("@DateAdmisCurrClass", t_ObjDT.TDateAdmisCurrClass),
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
                        new SqlParameter("@LadliLaxmiNo", t_ObjDT.LadliLaxmiNo),
                        new SqlParameter("@PrincipalMoNo", t_ObjDT.PrincipalMoNo),
                        new SqlParameter("@PrincipalBankIFSC", t_ObjDT.PrincipalBankIFSC),
                        new SqlParameter("@PrincipalConfirmBankNo", t_ObjDT.PrincipalConfirmBankNo),
                        new SqlParameter("@PrincipalBankNo", t_ObjDT.PrincipalBankNo),
                        new SqlParameter("@ScBankName", t_ObjDT.ScBankName),
                        new SqlParameter("@ScActive", t_ObjDT.ScActive),
                        new SqlParameter("@UserMoNo", t_ObjDT.UserMoNo),
                        new SqlParameter("@StudentBankName", t_ObjDT.StudentBankName),
                        new SqlParameter("@SchoolEntryCls", t_ObjDT.SchoolEntryCls),
                        new SqlParameter("@DiceCode", t_ObjDT.DiceCode),
                        new SqlParameter("@StudyCls", t_ObjDT.StudyCls),
                        new SqlParameter("@PrestudyCls", t_ObjDT.PrestudyCls),
                        new SqlParameter("@AllSubject", t_ObjDT.AllSubject),
                        new SqlParameter("@PreAllSubject", t_ObjDT.PreAllSubject),
                        new SqlParameter("@Detached", t_ObjDT.Detached),
                        new SqlParameter("@DetachedPer", t_ObjDT.DetachedPer),
                        new SqlParameter("@DetachedPerEqp", t_ObjDT.DetachedPerEqp),
                        new SqlParameter("@DetachedPerEscort", t_ObjDT.DetachedPerEscort),
                         new SqlParameter("@SamagraID", t_ObjDT.SamagraID),
                        new SqlParameter("@FamilySamagraID", t_ObjDT.FamilySamagraID),
                        new SqlParameter("@Aadhar", t_ObjDT.Aadhar),
                        new SqlParameter("@Img", t_ObjDT.Img),
                        new SqlParameter("@ImgTC", t_ObjDT.ImgTC),
                        new SqlParameter("@ImgPath", t_ObjDT.ImgPath),
                        new SqlParameter("@ImgTCPath", t_ObjDT.ImgTCPath),
                        new SqlParameter("@NameInHindi", t_ObjDT.NameInHindi),
                         new SqlParameter("@Block", t_ObjDT.Block),
                         new SqlParameter("@City", t_ObjDT.City),
                        new SqlParameter("@District", t_ObjDT.District),
                        new SqlParameter("@Colony", t_ObjDT.Colony),
                        new SqlParameter("@HouseNo", t_ObjDT.HouseNo),
                        new SqlParameter("@pincode", t_ObjDT.pincode),
                        new SqlParameter("@DisAbilityType", t_ObjDT.DisAbilityType),
                        new SqlParameter("@HostelName", t_ObjDT.HostelName),
                        new SqlParameter("@SambathaCode", t_ObjDT.SambathaCode),
                        new SqlParameter("@CuurentSchoolName", t_ObjDT.CuurentSchoolName),
                        new SqlParameter("@IsPassOtherBoard", t_ObjDT.IsPassOtherBoard),
                        new SqlParameter("@Cheque", t_ObjDT.Cheque),
                        new SqlParameter("@ChequePath", t_ObjDT.ChequePath),
                        new SqlParameter("@Passbook", t_ObjDT.Passbook),
                        new SqlParameter("@PassbookPath", t_ObjDT.PassbookPath),
                        new SqlParameter("@UserID", t_ObjDT.UserID),

            };



                //DataTable dtAll = sqlhelper.ExecuteDataTable("InsertScholarShipDetailsSP", parameter);
                DataSet result = sqlhelper.ExecuteDataTableNon("InsertScholarShipDetailsSP", parameter);
                DataTable dt = result.Tables[0];

                var m_AppID = dt.Rows[0]["AppID"].ToString();
                var m_ServiceID = "1466";
                string newWin = "window.open(\"Acknowledgement.aspx?AppID=" + m_AppID + "&SvcID=1466\", \"_blank\", \"WIDTH=1080,HEIGHT=790,scrollbars=no, menubar=no,resizable=yes,directories=no,location=no\");";

                //ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message",
                //       "newWin", true);




                Page.ClientScript.RegisterStartupScript(this.GetType(), "pop", "alert('Profile Updated Successfully.');" + newWin, true);



                //Response.Redirect("/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID);
            }

            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);



            }
        }
        protected void ddlStudenID_SelectedIndexChanged(object sender, EventArgs e)
        {
            //DataTable dtApp = new DataTable();


            //SqlParameter[] param = {
            //     new SqlParameter("@StudentID",ddlStudenID.SelectedValue) };

            //dtApp = sqlhelper.ExecuteDataTable("GetStudentByID", param);

            //if (dtApp.Rows.Count > 0)
            //{

            //    txtStudentName.Text = dtApp.Rows[0]["StudentName"].ToString();
            //    var strDate = DateTime.ParseExact(dtApp.Rows[0]["Birthdate"].ToString(), "dd/MM/yyyy HH:mm:ss", null);
            //    txtBirthdate.Text = strDate.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture); 
            //    ddlGender.SelectedValue = dtApp.Rows[0]["Gender"].ToString();
            //    txtFatherName.Text = dtApp.Rows[0]["FatherName"].ToString();
            //    txtMotherName.Text = dtApp.Rows[0]["MotherName"].ToString();
            //    IsMPOrigin.Checked= bool.Parse(dtApp.Rows[0]["IsMPNative"].ToString());
            //}
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            string fileSTR = "imagesTC\\";
            strFolder = Server.MapPath("./") + fileSTR;
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

                    string imgPath = "~/imagesTC/" + strf + ".jpg";

                    byte[] imageArray = System.IO.File.ReadAllBytes(destFileName);
                    string base64ImageRepresentation = Convert.ToBase64String(imageArray);



                    var val = $"data: image/png; base64,{base64ImageRepresentation}";
                    ImageTC.Attributes.Add("src", val);
                    hdnTC.Value = val;
                    hdnTCPath.Value = destFileName;
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
            string fileSTR = "imagesPhoto\\";
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
                    string imgPath = "~/imagesPhoto/" + strf + ".jpg";

                    byte[] imageArray = System.IO.File.ReadAllBytes(destFileName);
                    string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                    var val = $"data: image/png; base64,{base64ImageRepresentation}";
                    hdnImage.Value = val;
                    hdnImagePath.Value = destFileName;
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

        protected void btnCheque_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            string fileSTR = "imagesCheque\\";
            strFolder = Server.MapPath("./") + fileSTR;
            // Get the name of the file that is posted.
            strFileName = Chequeupload.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (Chequeupload.Value != "")
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
                    lblResultCheque.Text = strFileName + " already exists on the server!";
                }
                else
                {
                    Chequeupload.PostedFile.SaveAs(strFilePath);
                    File.Copy(strFilePath, destFileName);
                    string imgPath = "~/imagesCheque/" + strf + ".jpg";

                    byte[] imageArray = System.IO.File.ReadAllBytes(destFileName);
                    string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                    var val = $"data: image/png; base64,{base64ImageRepresentation}";
                    hdnCheque.Value = val;
                    hdnChequePath.Value = destFileName;
                    imgCheque.Attributes.Add("src", val);
                    imgCheque.Width = Unit.Pixel(200);
                    imgCheque.Height = Unit.Pixel(150);
                    imgCheque.DataBind();

                    lblResultCheque.Text = strFileName + " has been successfully uploaded.";
                }
            }
            else
            {
                lblResultCheque.Text = "Click 'Browse' to select the file to upload.";
            }


        }

        protected void btnPassbook_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            string fileSTR = "imagesPassbook\\";
            strFolder = Server.MapPath("./") + fileSTR;
            // Get the name of the file that is posted.
            strFileName = Passbookupload.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (Passbookupload.Value != "")
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
                    lblResultPassbook.Text = strFileName + " already exists on the server!";
                }
                else
                {
                    Passbookupload.PostedFile.SaveAs(strFilePath);
                    File.Copy(strFilePath, destFileName);
                    string imgPath = "~/imagesPassbook/" + strf + ".jpg";

                    byte[] imageArray = System.IO.File.ReadAllBytes(destFileName);
                    string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                    var val = $"data: image/png; base64,{base64ImageRepresentation}";
                    hdnPassbook.Value = val;
                    hdnPassbookPath.Value = destFileName;
                    imgPassbook.Attributes.Add("src", val);
                    imgPassbook.Width = Unit.Pixel(200);
                    imgPassbook.Height = Unit.Pixel(150);
                    imgPassbook.DataBind();

                    lblResultPassbook.Text = strFileName + " has been successfully uploaded.";
                }
            }
            else
            {
                lblResultPassbook.Text = "Click 'Browse' to select the file to upload.";
            }


        }
    }
}
