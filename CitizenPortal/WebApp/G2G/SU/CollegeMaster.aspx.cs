using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CitizenPortalLib;
using CitizenPortalLib.DataStructs;
using CitizenPortal.Services;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using System.IO;

namespace CitizenPortal.WebApp.G2G.SU
{
    public partial class CollegeMaster : AdminBasePage
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();

        string LoginID = "";
        int Department;
        string t_strFilename = "", RawPath = "";
        string t_Path = "", t_File = "";
        string StrKeyField = Guid.NewGuid().ToString();

        protected void Page_Load(object sender, EventArgs e)
        {


            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());

            if (!IsPostBack)
            {
                BindDistrict("21");
                btnSave.Visible = true;
                btnInsert.Visible = false;
            }
        }
        private void BindDistrict(string districtcode)
        {
            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL();
            System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetDistrictFromState(districtcode);

            ddlDistrict.DataTextField = "DistrictName";
            ddlDistrict.DataValueField = "DistrictCode";
            ddlDistrict.DataSource = dtDistrict;
            ddlDistrict.DataBind();

            ddlDistrict.Items.Insert(0, new ListItem("-Select-", "0"));
        }

        private void BindGrid()
        {
            DataTable dt = null;
            dt = m_AdmissionFormBLL.GetCollegeDetails();

            grdView.DataSource = dt;
            grdView.DataBind();

            divGrid.Visible = true;
        }

        protected void btnCollege_Click(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string[] AFields =
                {
                     "CollegeCode"
                    ,"CollegeName"
                    ,"MobileNo"
                    ,"PhoneNo"
                    ,"EmailID"
                    ,"District"
                    ,"DistrictCode"
                    ,"CollegeType"
                    ,"Address"
                    ,"CreatedBy"

                };

                SUCollege_DT t_SUCollege_DT = new SUCollege_DT();
                t_SUCollege_DT.CollegeCode = txtCollegeCode.Text.Trim();
                t_SUCollege_DT.CollegeName = txtCollege.Text.Trim();
                t_SUCollege_DT.MobileNo = txtMobile.Text.Trim();
                t_SUCollege_DT.PhoneNo = txtPhone.Text.Trim();
                t_SUCollege_DT.EmailID = txtEmail.Text.Trim();
                t_SUCollege_DT.District = ddlDistrict.SelectedItem.Text;
                t_SUCollege_DT.DistrictCode = ddlDistrict.SelectedValue;
                t_SUCollege_DT.CollegeType = ddlType.SelectedValue;
                t_SUCollege_DT.Address = txtAddress.Text.Trim();
                t_SUCollege_DT.CreatedBy = LoginID;

                System.Data.DataTable result = null;
                string UID = "";

                result = m_AdmissionFormBLL.InsertCollegeData(t_SUCollege_DT, AFields);

                if (result != null && result.Rows.Count > 0)
                {
                    if (result.Rows[0]["Result"].ToString() == "1")
                    {
                        string text;
                        string m_Mobile = result.Rows[0]["MobileNo"].ToString();
                        string m_SMSText = result.Rows[0]["SMSText"].ToString();
                        string m_EmailID = result.Rows[0]["EmailID"].ToString();
                        string m_Subject = result.Rows[0]["Subject"].ToString();
                        string m_MailText = result.Rows[0]["MailText"].ToString();

                        string CCMailID = result.Rows[0]["CCMailID"].ToString();
                        string BCCMailID = result.Rows[0]["BCCMailID"].ToString();

                        if (m_Mobile != null || m_Mobile != "")
                        {
                            CommonUtility.SendSMSSU(m_Mobile, m_SMSText);
                        }

                        if (m_EmailID != "" && m_Subject != "" && m_MailText != "")
                        {
                            CitizenPortalLib.CommonUtility.SendEmailWithAttachment("", "", "", m_EmailID, CCMailID, BCCMailID,
                                m_Subject, m_MailText, true, null);
                        }

                        string m_Message = "Record Saved Sucessfully!";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);
                    }

                    txtCollegeCode.Text = "";
                    txtCollege.Text = "";
                    txtMobile.Text = "";
                    txtPhone.Text = "";
                    txtEmail.Text = "";
                    ddlDistrict.SelectedValue = "0";
                    ddlType.SelectedValue = "0";
                    txtAddress.Text = "";
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string DestinationSP = "";
            int TotalRowsCount = 0;
            int t_UpdateCount = 0;
            bool t_ShowMsg = false;

            string[] AFields = null;
            System.Data.DataTable result = null;
            DataTable dt = new DataTable();
            CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
            SUCollege_DT t_SUCollege_DT = new SUCollege_DT();

            try
            {
                TotalRowsCount = grdView.Rows.Count;

                foreach (GridViewRow row in grdView.Rows)
                {

                    DestinationSP = "InsertCollegeMastertSP";
                    AFields = new string[] { "CollegeCode", "CollegeName", "MobileNo", "PhoneNo", "EmailID", "District", "DistrictCode", "CollegeType", "Address", "CreatedBy" };

                    t_SUCollege_DT.CollegeCode = row.Cells[5].Text;
                    t_SUCollege_DT.CollegeName = row.Cells[0].Text;
                    t_SUCollege_DT.MobileNo = row.Cells[9].Text;
                    t_SUCollege_DT.PhoneNo = row.Cells[10].Text;
                    t_SUCollege_DT.EmailID = row.Cells[11].Text;
                    t_SUCollege_DT.District = row.Cells[1].Text;
                    t_SUCollege_DT.DistrictCode = row.Cells[2].Text;
                    t_SUCollege_DT.CollegeType = row.Cells[3].Text;
                    //t_SUCollege_DT.IsActive = row.Cells[4].Text;
                    t_SUCollege_DT.Address = row.Cells[12].Text;
                    t_SUCollege_DT.Remarks = "";
                    t_SUCollege_DT.CreatedBy = Session["LoginID"].ToString();
                    t_SUCollege_DT.KeyField = StrKeyField;
                    t_SUCollege_DT.FileName = t_strFilename;
                    t_SUCollege_DT.FilePath = RawPath;
                    
                    result = m_AdmissionFormBLL.InsertCollegeMaster(t_SUCollege_DT, AFields, DestinationSP);

                    if (result != null && result.Rows.Count > 0)
                    {
                        if (result.Rows[0]["Result"].ToString() != "0")
                        {
                            string text;
                            string m_Mobile = result.Rows[0]["MobileNo"].ToString();
                            string m_SMSText = result.Rows[0]["SMSText"].ToString();
                            string m_EmailID = result.Rows[0]["EmailID"].ToString();
                            string m_Subject = result.Rows[0]["Subject"].ToString();
                            string m_MailText = result.Rows[0]["MailText"].ToString();

                            string CCMailID = result.Rows[0]["CCMailID"].ToString();
                            string BCCMailID = result.Rows[0]["BCCMailID"].ToString();

                            if (m_Mobile != null || m_Mobile != "")
                            {
                                CommonUtility.SendSMSSU(m_Mobile, m_SMSText);
                            }

                            if (m_EmailID != "" && m_Subject != "" && m_MailText != "")
                            {
                                CitizenPortalLib.CommonUtility.SendEmailWithAttachment("", "", "", m_EmailID, CCMailID, BCCMailID,
                                    m_Subject, m_MailText, true, null);
                            }

                            t_UpdateCount++;
                            t_ShowMsg = true;
                        }
                    }

                }

                if (t_UpdateCount > 0)
                {
                    ClientScript.RegisterClientScriptBlock(GetType(), "PageScript",
                      "alert(' Total  " + t_UpdateCount + "/" + TotalRowsCount + ", Colleges uploaded sucessfully.');window.location.href='" + Request.RawUrl + "';", true);
                }
            }

            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "PageScript", "alert('Exception raised : " + ex.ToString() + "';", true);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (FU1.HasFile)
            {
                ImportExcel();
            }
            else
            {
                var msg = "Please select Excel file with .xlsx extension.";
                FU1.BorderColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + msg + "');", true);
                return;
            }
        }

        protected void ImportExcel()
        {
            try
            {
                t_strFilename = FU1.PostedFile.FileName;

                if (Path.GetExtension(FU1.FileName) != ".xlsx")
                {
                    var msg = "Please select Excel file with .xlsx extension.";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + msg + "');", true);
                    return;
                }

                if (t_strFilename != "")
                {
                    t_strFilename = Path.GetFileNameWithoutExtension(t_strFilename) + "_" + StrKeyField +
                                     Path.GetExtension(t_strFilename);
                    RawPath = "~/Download/UploadExcel/" + ddlType.SelectedValue.ToString() + "/" + t_strFilename;
                    t_Path = Server.MapPath("~/Download/UploadExcel/") + ddlType.SelectedValue.ToString();

                    if (!Directory.Exists(t_Path))
                        Directory.CreateDirectory(t_Path);

                    if (Path.GetExtension(t_strFilename).ToUpper() == ".xlsx".ToUpper())

                        t_Path = t_Path + "\\";
                    t_File = t_Path + t_strFilename;
                    FU1.PostedFile.SaveAs(t_File);

                }

                //Open the Excel file in Read Mode using OpenXml.
                using (SpreadsheetDocument doc = DocumentFormat.OpenXml.Packaging.SpreadsheetDocument.Open(t_File, false))
                {
                    //Read the first Sheet from Excel file.
                    Sheet sheet = doc.WorkbookPart.Workbook.Sheets.GetFirstChild<Sheet>();

                    //Get the Worksheet instance.
                    Worksheet worksheet = (doc.WorkbookPart.GetPartById(sheet.Id.Value) as WorksheetPart).Worksheet;

                    //Fetch all the rows present in the Worksheet.
                    IEnumerable<Row> rows = worksheet.GetFirstChild<SheetData>().Descendants<Row>();

                    //Create a new DataTable.
                    DataTable dt = new DataTable();

                    //Loop through the Worksheet rows.
                    foreach (Row row in rows)
                    {
                        //Use the first row to add columns to DataTable.
                        if (row.RowIndex.Value == 1)
                        {
                            foreach (Cell cell in row.Descendants<Cell>())
                            {
                                dt.Columns.Add(GetValue(doc, cell));
                            }
                        }
                        else
                        {
                            //Add rows to DataTable.
                            dt.Rows.Add();
                            int i = 0;
                            foreach (Cell cell in row.Descendants<Cell>())
                            {
                                dt.Rows[dt.Rows.Count - 1][i] = GetValue(doc, cell);
                                i++;
                            }
                        }
                    }

                    //-----------CHANGE DATE FORMAT
                    //for (int i = 0; i < dt.Rows.Count; i++)
                    //{
                    //    if (dt.Rows[0][2].ToString() != "")
                    //    {
                    //        SanctionDate = Convert.ToDateTime(dt.Rows[i][2]).ToString("yyyy-MM-dd");
                    //        dt.Rows[i][2] = SanctionDate;
                    //    }
                    //}

                    //dt.Columns.Add("CreatedBy", typeof(string));
                    //dt.Columns.Add("CreatedOn", typeof(DateTime));
                    //dt.Columns.Add("KeyField", typeof(string));
                    //dt.Columns.Add("FileNames", typeof(string));
                    //dt.Columns.Add("FilePath", typeof(string));
                    //dt.Columns.Add("BatchNo", typeof(string));

                    //for (int i = 0; i < dt.Rows.Count; i++)
                    //{
                    //    dt.Rows[i]["CreatedBy"] = Session["LoginID"].ToString();
                    //    dt.Rows[i]["CreatedOn"] = DateTime.Now;
                    //    dt.Rows[i]["KeyField"] = StrKeyField;
                    //    dt.Rows[i]["FileNames"] = t_strFilename;
                    //    dt.Rows[i]["FilePath"] = RawPath;

                    //}

                    grdView.Columns.Clear();
                    grdView.DataSource = null;

                    grdView.DataSource = dt;
                    grdView.DataBind();
                    btnSave.Visible = false;
                    btnInsert.Visible = true;
                    divGrid.Visible = true;
                    divCollege.Visible = false;
                    divBtn.Visible = false;
                    

                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "PageScript", "alert('Exception raised : " + ex.ToString() + "';", true);
            }
        }

        private string GetValue(SpreadsheetDocument doc, Cell cell)
        {
            string value = "";
            if (cell.CellValue != null)
                value = cell.CellValue.InnerText;

            if (cell.DataType != null && cell.DataType.Value == CellValues.SharedString)
            {
                return doc.WorkbookPart.SharedStringTablePart.SharedStringTable.ChildElements.GetItem(int.Parse(value)).InnerText;
            }
            return value;
        }

    }
}
