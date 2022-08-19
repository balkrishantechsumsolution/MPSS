using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CitizenPortalLib.BLL;
using System.Web.UI.HtmlControls;
using System.Text;
using CitizenPortalLib;
using CitizenPortalLib.DataStructs;
using System.Configuration;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;

namespace CitizenPortal.WebApp.G2G.SU
{
    public partial class UploadExcel : AdminBasePage
    {
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        List<string> Checked = new List<string>();
        string m_Message = "";
        string t_strFilename = "", RawPath = "";
        string t_Path = "", t_File = "";
        string StrKeyField = Guid.NewGuid().ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["UserType"].ToString() != "Admin")  {
            //    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid User!!", "alert('"+Session["LoginID"].ToString() +"' is not a valid user to use this page.');", true);
            //    return;
            //}
            if (!IsPostBack)
            {
                divDetails.Visible = false;
            }

            ViewState["GUID"] = "";

            if (ViewState["GUID"] != null && ViewState["GUID"].ToString() != "")
            {
                LoadGridData();
            }

        }

        public void LoadGridData()
        {
            string LoginID = "";
            int Department;
            string Type = "";
            string Branch = "";
            string t_Year = "";
            string Semester = "";
            string p_ActionType = "";

            LoginID = Convert.ToString(Session["LoginID"]);
            Department = Convert.ToInt32(Session["Department"].ToString());

            if (ddlBranch.SelectedIndex != 0)
            {
                Branch = ddlBranch.SelectedValue;
            }

            if (ddlType.SelectedIndex != 0)
            {
                Type = ddlType.SelectedValue;
            }

            //if (ddlExamType.SelectedIndex != 0)
            //{
            //    ExamType = ddlExamType.SelectedValue;
            //}
            if (ddlSession.SelectedIndex != 0)
            {
                t_Year = ddlSession.SelectedValue;
            }

            if (ddlSemester.SelectedIndex != 0)
            {
                Semester = ddlSemester.SelectedValue;
            }


            DataTable ds = null;
            ds = m_G2GDashboardBLL.GetMaterData(Semester, Branch, t_Year, Type);

            if (ds.Rows.Count > 0)
            {
                gvDetail.DataSource = ds;
                divDetails.Visible = true;
            }
            else
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                gvDetail.DataSource = null;
                gvDetail.DataBind();
                divDetails.Visible = false;
            }
            gvDetail.DataBind();
        }

        protected void gvDetail_PreRender(object sender, EventArgs e)
        {
            if (gvDetail.Rows.Count > 0)
            {
                gvDetail.UseAccessibleHeader = true;
                gvDetail.HeaderRow.TableSection = TableRowSection.TableHeader;
                gvDetail.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }

        protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadGridData();
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

                    gvDetail.Columns.Clear();
                    gvDetail.DataSource = null;

                    gvDetail.DataSource = dt;
                    gvDetail.DataBind();

                    btnInsert.Visible = true;
                    /*
                    // take note of SqlBulkCopyOptions.KeepIdentity , you may or may not want to use this for your situation.  
                    string connection = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(connection))
                    {
                        using (var bulkCopy = new SqlBulkCopy(connection, SqlBulkCopyOptions.KeepIdentity))
                        {
                            bulkCopy.DestinationTableName = DestinationTableName;// "DTE_DB.dbo.DTEBankOfficerExcelDataTB";
                            TotalRowsCount = dt.Rows.Count;
                            // my DataTable column names match my SQL Column names, so I simply made this loop. However if your column names don't match, just pass in which datatable name matches the SQL column name in Column Mappings
                            foreach (DataColumn col in dt.Columns)
                            {
                                bulkCopy.ColumnMappings.Add(col.ColumnName, col.ColumnName);
                            }
                            //bulkCopy.BulkCopyTimeout = 600;
                            con.Open();
                            bulkCopy.WriteToServer(dt);
                            con.Close();
                        }
                    }

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        ClientScript.RegisterClientScriptBlock(GetType(), "PageScript",
                            "alert(' " + ddlType.SelectedItem.Text + " Total " + TotalRowsCount + " record uploaded sucessfully.');window.location.href='" + Request.RawUrl + "';", true);
                    }*/
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "PageScript", "alert('Exception raised : " + ex.ToString() +"';", true);
            }
        }

        protected void btn_Reset_Click(object sender, EventArgs e)
        {
            ViewState["GUID"] = "";
            gvDetail.Columns.Clear();
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

        protected void btnInsert_Click_old(object sender, EventArgs e)
        {
            string DestinationTableName = "";
            int TotalRowsCount = 0;
            string[] arrCols1 = null;
            DataTable dt = new DataTable();

            if (ddlType.SelectedValue == "College")
            { DestinationTableName = "Sambalpur_DB.dbo.CollegeMasterTB"; }
            else if (ddlType.SelectedValue == "Subject")
            { DestinationTableName = "SU_SubjectMaster"; }
            else if (ddlType.SelectedValue == "Paper")
            { DestinationTableName = "PaperMasterTB"; }
            else if (ddlType.SelectedValue == "Result")
            { DestinationTableName = "UniversityResultTB";
                arrCols1 = new string[] { "TransactionDate", "AppID", "PG_App_ID", "RollNo", "Total", "Dept", "PortalFee", "LateFeesAmount", "OtherCharges", "Exam_Type", "Semester", "ExamYear", "TransferDate", "Remarks", "CreatedOn", "CreatedBy", "KeyField", "FileName", "FilePath" };}
            else if (ddlType.SelectedValue == "Refund")
            { DestinationTableName = "Sambalpur_DB.dbo.SemesterFeeRefundTB";
                arrCols1 = new string[] { "TransactionDate", "service_id", "Semester", "AppID", "PG_App_ID", "RollNo", "Countif", "Total", "Dept", "PortalFee", "LateFeesAmount", "OtherCharges", "ExamType", "ExamYear", "Remarks", "TransferDate", "CreatedOn", "CreatedBy", "KeyField", "FileName", "FilePath" };}


            for (int i = 0; i < arrCols1.Length; i++)
            { dt.Columns.Add(arrCols1[i]); }

            foreach (GridViewRow row in gvDetail.Rows)
            {
                DataRow dr = dt.NewRow();
                
                for (int j = 0; j < arrCols1.Length; j++)
                {
                    dr[j] = row.Cells[j].Text;
                }

                dt.Rows.Add(dr);
            }
            dt.Columns.Add("CreatedBy", typeof(string));
            dt.Columns.Add("CreatedOn", typeof(DateTime));
            dt.Columns.Add("KeyField", typeof(string));
            dt.Columns.Add("FileNames", typeof(string));
            dt.Columns.Add("FilePath", typeof(string));
            dt.Columns.Add("BatchNo", typeof(string));
            
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dt.Rows[i]["CreatedBy"] = Session["LoginID"].ToString();
                dt.Rows[i]["CreatedOn"] = DateTime.Now;
                dt.Rows[i]["KeyField"] = StrKeyField;
                dt.Rows[i]["FileNames"] = t_strFilename;
                dt.Rows[i]["FilePath"] = RawPath;

            }

            try
            {
                // take note of SqlBulkCopyOptions.KeepIdentity , you may or may not want to use this for your situation.  
                string connection = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connection))
                {
                    using (var bulkCopy = new SqlBulkCopy(connection, SqlBulkCopyOptions.KeepIdentity))
                    {
                        bulkCopy.DestinationTableName = DestinationTableName;// "DTE_DB.dbo.DTEBankOfficerExcelDataTB";
                        TotalRowsCount = dt.Rows.Count;
                        // my DataTable column names match my SQL Column names, so I simply made this loop. However if your column names don't match, just pass in which datatable name matches the SQL column name in Column Mappings
                        foreach (DataColumn col in dt.Columns)
                        {
                            bulkCopy.ColumnMappings.Add(col.ColumnName, col.ColumnName);
                        }
                        //bulkCopy.BulkCopyTimeout = 600;
                        con.Open();
                        bulkCopy.WriteToServer(dt);
                        con.Close();
                    }
                }

                if (dt != null && dt.Rows.Count > 0)
                {
                    ClientScript.RegisterClientScriptBlock(GetType(), "PageScript",
                      "alert(' " + ddlType.SelectedItem.Text + " Total " + TotalRowsCount + " record uploaded sucessfully.');window.location.href='" + Request.RawUrl + "';", true);
                }
            }

            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "PageScript", "alert('Exception raised : " + ex.ToString() + "';", true);
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
            ExcelUpload_DT t_ExcelUpload_DT = new ExcelUpload_DT();

            try
            {
                TotalRowsCount = gvDetail.Rows.Count;

                foreach (GridViewRow row in gvDetail.Rows)
                {

                    if (ddlType.SelectedValue == "Subject")
                    { DestinationSP = "InsertSubjectMasterSP";
                        AFields = new string[] { "SubjectCode", "SubjectName", "Code", "SubjectType","Program","Course","CourseType","SelectionType","IsActive","BranchCode", "for1SEM", "for2SEM", "for3SEM", "for4SEM", "for5SEM", "for6SEM" };

                        t_ExcelUpload_DT.SubjectCode = row.Cells[0].Text;
                        t_ExcelUpload_DT.SubjectName = row.Cells[1].Text;
                        t_ExcelUpload_DT.Code = row.Cells[2].Text;
                        t_ExcelUpload_DT.SubjectType = row.Cells[3].Text;
                        t_ExcelUpload_DT.Program = row.Cells[4].Text;
                        t_ExcelUpload_DT.Course = row.Cells[5].Text;
                        t_ExcelUpload_DT.CourseType = row.Cells[6].Text;
                        t_ExcelUpload_DT.SelectionType = row.Cells[7].Text;
                        t_ExcelUpload_DT.IsActive = row.Cells[8].Text;
                        t_ExcelUpload_DT.BranchCode = row.Cells[9].Text;
                        t_ExcelUpload_DT.for1SEM = row.Cells[10].Text;
                        t_ExcelUpload_DT.for2SEM = row.Cells[11].Text;
                        t_ExcelUpload_DT.for3SEM = row.Cells[12].Text;
                        t_ExcelUpload_DT.for4SEM = row.Cells[13].Text;
                        t_ExcelUpload_DT.for5SEM = row.Cells[14].Text;
                        t_ExcelUpload_DT.for6SEM = row.Cells[15].Text;
                        //t_ExcelUpload_DT.Remarks = row.Cells[38].Text;
                        t_ExcelUpload_DT.CreatedOn = DateTime.Now;
                        t_ExcelUpload_DT.CreatedBy = Session["LoginID"].ToString();
                        t_ExcelUpload_DT.KeyField = StrKeyField;
                        t_ExcelUpload_DT.FileName = t_strFilename;
                        t_ExcelUpload_DT.FilePath = RawPath;
                    }
                    else if (ddlType.SelectedValue == "Paper")
                    { DestinationSP = "PaperMasterTB"; }
                    else if (ddlType.SelectedValue == "Result")
                    {
                        DestinationSP = "InsertUniversityResultSP";
                        AFields = new string[] { "RollNo","FUNAME","HONS","GE","P1","P2","P3","P4","P5","G1","G2","G3","G4","G5","SGPA","RESULT","A1","A2","A3","A4","A5","A1I","A2I","A3I","A4I","A5I"
                        ,"Branch","Semester","PaperCount","ExamYear","AdmissionYear","IsEligible","CreatedOn","CreatedBy","FileName","FilePath","Remarks","KeyField" };

                        t_ExcelUpload_DT.RollNo = row.Cells[0].Text;
                        t_ExcelUpload_DT.FUNAME = row.Cells[1].Text;
                        t_ExcelUpload_DT.HONS = row.Cells[2].Text;
                        t_ExcelUpload_DT.GE = row.Cells[3].Text;
                        t_ExcelUpload_DT.P1 = row.Cells[4].Text;
                        t_ExcelUpload_DT.P2 = row.Cells[5].Text;
                        t_ExcelUpload_DT.P3 = row.Cells[6].Text;
                        t_ExcelUpload_DT.P4 = row.Cells[7].Text;
                        t_ExcelUpload_DT.P5 = row.Cells[8].Text;
                        t_ExcelUpload_DT.G1 = row.Cells[9].Text;
                        t_ExcelUpload_DT.G2 = row.Cells[10].Text;
                        t_ExcelUpload_DT.G3 = row.Cells[11].Text;
                        t_ExcelUpload_DT.G4 = row.Cells[12].Text;
                        t_ExcelUpload_DT.G5 = row.Cells[13].Text;
                        t_ExcelUpload_DT.SGPA = row.Cells[14].Text;
                        t_ExcelUpload_DT.RESULT = row.Cells[15].Text;
                        t_ExcelUpload_DT.A1 = row.Cells[16].Text;
                        t_ExcelUpload_DT.A2 = row.Cells[17].Text;
                        t_ExcelUpload_DT.A3 = row.Cells[18].Text;
                        t_ExcelUpload_DT.A4 = row.Cells[19].Text;
                        t_ExcelUpload_DT.A5 = row.Cells[20].Text;
                        t_ExcelUpload_DT.A1I = row.Cells[21].Text;
                        t_ExcelUpload_DT.A2I = row.Cells[22].Text;
                        t_ExcelUpload_DT.A3I = row.Cells[23].Text;
                        t_ExcelUpload_DT.A4I = row.Cells[24].Text;
                        t_ExcelUpload_DT.A5I = row.Cells[25].Text;
                        t_ExcelUpload_DT.Branch = row.Cells[26].Text;
                        t_ExcelUpload_DT.Semester = row.Cells[27].Text;
                        t_ExcelUpload_DT.PaperCount = row.Cells[28].Text;
                        t_ExcelUpload_DT.ExamYear = row.Cells[29].Text;
                        t_ExcelUpload_DT.AdmissionYear = row.Cells[30].Text;
                        t_ExcelUpload_DT.IsEligible = row.Cells[31].Text;
                        //t_ExcelUpload_DT.Remarks = row.Cells[38].Text;
                        t_ExcelUpload_DT.CreatedOn = DateTime.Now;
                        t_ExcelUpload_DT.CreatedBy = Session["LoginID"].ToString();
                        t_ExcelUpload_DT.KeyField = StrKeyField;
                        t_ExcelUpload_DT.FileName = t_strFilename;
                        t_ExcelUpload_DT.FilePath = RawPath;
                    }
                    else if (ddlType.SelectedValue == "Refund")
                    {
                        DestinationSP = "InternalSemesterFeeRefundSP";
                        AFields = new string[] { "TransactionDate", "service_id", "Semester", "AppID", "PG_App_ID", "RollNo", "Countif", "Total", "Dept", "PortalFee", "LateFeesAmount", "OtherCharges", "ExamType", "ExamYear", "Remarks", "TransferDate", "CreatedOn", "CreatedBy", "KeyField", "FileName", "FilePath" };
                        

                        t_ExcelUpload_DT.TransactionDate = row.Cells[0].Text;
                        t_ExcelUpload_DT.service_id = row.Cells[1].Text;
                        t_ExcelUpload_DT.Semester = row.Cells[2].Text;
                        t_ExcelUpload_DT.AppID = row.Cells[3].Text;
                        t_ExcelUpload_DT.PG_App_ID = row.Cells[4].Text;
                        t_ExcelUpload_DT.RollNo = row.Cells[5].Text;
                        t_ExcelUpload_DT.Countif = row.Cells[6].Text;
                        t_ExcelUpload_DT.Total = row.Cells[7].Text;
                        t_ExcelUpload_DT.Dept = row.Cells[8].Text;
                        t_ExcelUpload_DT.PortalFee = row.Cells[9].Text;
                        t_ExcelUpload_DT.LateFeesAmount = row.Cells[10].Text;
                        t_ExcelUpload_DT.OtherCharges = row.Cells[11].Text;
                        t_ExcelUpload_DT.ExamType = row.Cells[12].Text;
                        t_ExcelUpload_DT.ExamYear = row.Cells[13].Text;
                        t_ExcelUpload_DT.TransferDate = row.Cells[14].Text;
                        t_ExcelUpload_DT.Remarks = row.Cells[15].Text;
                        t_ExcelUpload_DT.CreatedOn = DateTime.Now;
                        t_ExcelUpload_DT.CreatedBy = Session["LoginID"].ToString();
                        t_ExcelUpload_DT.KeyField = StrKeyField;
                        t_ExcelUpload_DT.FileName = t_strFilename;
                        t_ExcelUpload_DT.FilePath = RawPath;

                        
                    }

                    result = m_AdmissionFormBLL.SemesterFeeRefund(t_ExcelUpload_DT, AFields, DestinationSP);

                    if (result != null && result.Rows.Count > 0)
                    {
                        if (result.Rows[0]["Result"].ToString() != "0")
                        {
                            t_UpdateCount++;
                            t_ShowMsg = true;
                        }
                    }                   

                }
                
                if (t_UpdateCount > 0)
                {
                    btnInsert.Visible = false;
                    ClientScript.RegisterClientScriptBlock(GetType(), "PageScript",
                      "alert(' " + ddlType.SelectedItem.Text + " Total "+ t_UpdateCount +"/"+ TotalRowsCount + " record uploaded sucessfully.');window.location.href='" + Request.RawUrl + "';", true);
                }
            }

            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "PageScript", "alert('Exception raised : " + ex.ToString() + "';", true);
            }
        }
    }

}