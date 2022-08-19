using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CitizenPortalLib.DataStructs;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;


namespace CitizenPortalLib.DAL
{
   internal class CBCSAdmissionFormDAL:DALBase
    {
        Database m_DataBase;
        internal DataTable InsertCBCSAdmissionFormData(CBCSAdmissionForm_DT objCBCSAdmissionForm_DT, string[] aFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objCBCSAdmissionForm_DT, "InsertCBCSAdmissionFormSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }
        internal DataTable InsertCBCSAdmissionFormDataByStudent(CBCSAdmissionForm_DT objCBCSAdmissionForm_DT, string[] aFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objCBCSAdmissionForm_DT, "InsertCBCSAdmissionByStudentSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable InsertAdmissionFormDataByDEO(CBCSAdmissionForm_DT objCBCSAdmissionForm_DT, string[] aFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objCBCSAdmissionForm_DT, "InsertAdmissionFormByDEOSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable GetCollegeProfile(string loginID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCollegeProfileSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, loginID);
                
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetCBCSCourseLists()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCBCSCourseList");
                //m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataSet GetCBCSCourseSubject(string CourseName,string SubjectType)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCBCSSubjectList");
                m_DataBase.AddInParameter(selectCommand, "@CourseName", DbType.AnsiString, CourseName);
                m_DataBase.AddInParameter(selectCommand, "@SubjectType", DbType.AnsiString, SubjectType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "SubjectTB" });
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable UpdateCollegeProfile(SUCollege_DT t_SUCollege_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                cmdInsert = qb.GetInsertCommandV3(t_SUCollege_DT, "UpdateCollegeProfileSP", aFields);

                Reader = m_DataBase.ExecuteReader(cmdInsert);
                if (Reader != null)
                    oDataTable.Load(Reader);

                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable InsertCollegeData(SUCollege_DT t_SUCollege_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                cmdInsert = qb.GetInsertCommandV3(t_SUCollege_DT, "CreateCollegeSP", aFields);

                Reader = m_DataBase.ExecuteReader(cmdInsert);
                if (Reader != null)
                    oDataTable.Load(Reader);

                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataSet GetRelationList()
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetRelationSp");
                //m_DataBase.AddInParameter(selectCommand, "@CourseName", DbType.AnsiString, CourseName);
                //m_DataBase.AddInParameter(selectCommand, "@SubjectType", DbType.AnsiString, SubjectType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "RelationTb" });
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable SubmitG2GAdmissionData(Admission_DT objAdmission_DT, string[] AFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objAdmission_DT, "G2G_PostAdmissionDataSP", AFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataSet GetApplicationDetails(string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetAdmissionDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
               // m_DataBase.AddInParameter(selectCommand, "@SubjectType", DbType.AnsiString, SubjectType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "ApplicationTB", "AgeTB" });
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        internal DataSet GetStudentAdmissionData(string ServiceID, string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentAdmissionFormDataSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentDataTb","LastCourseTb","AdmissionTb","DOBTb","DocumentTb","TransactionTb", "ActionHistory" });
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        internal DataTable GETSudentMasterForSearch(string AppID,string dob,string name,string mobile,string admissionno)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GETSudentMasterForSearchSp");
                m_DataBase.AddInParameter(selectCommand, "@applicationno", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@dob", DbType.AnsiString, dob);
                m_DataBase.AddInParameter(selectCommand, "@name", DbType.AnsiString, name);
                m_DataBase.AddInParameter(selectCommand, "@mobileno", DbType.AnsiString, mobile);
                m_DataBase.AddInParameter(selectCommand, "@admissionno", DbType.AnsiString, admissionno);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable InternalMarkData(InternalMark_DT t_InternalMark_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(t_InternalMark_DT, "InternalMarkInsertSP", aFields);
            cmdInsert.CommandTimeout = 12000;
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }
        
        internal DataTable InternalMarkSubmitted(string college, string branch, string examType, string session, string semester, string paper, string uID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("InternalMarkSubmittedSp");
                selectCommand.CommandTimeout = 12000;
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, college);
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, branch);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, examType);
                m_DataBase.AddInParameter(selectCommand, "@ExamSession", DbType.AnsiString, session);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, semester);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, paper);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, uID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable PracticalMarkSubmitted(string college, string branch, string examType, string session, string semester, string paper, string uID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("PracticalMarkSubmittedSp");
                selectCommand.CommandTimeout = 12000;
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, college);
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, branch);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, examType);
                m_DataBase.AddInParameter(selectCommand, "@ExamSession", DbType.AnsiString, session);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, semester);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, paper);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, uID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        internal DataTable GetPaperLists(string BranchCode, string Semester, string Year)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetPaperMasterSP");
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, BranchCode);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@Session", DbType.AnsiString, Year);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable SubmitAdmitData(Admission_DT objAdmission_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objAdmission_DT, "G2G_AdmitDataSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable Get_CollegeDetail(string UserID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("Get_CollegeDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, UserID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        internal DataTable Get_CollegeList()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCollegeMasterSUSP");
                //m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, UserID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        internal DataTable Get_RollNoList(string BranchCode,string SubjectCode,string CollegeCode,string AdmissionYear,string Condition)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GenrateRollNoSP");//GenrateRollNoSPTest
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, BranchCode);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, SubjectCode);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@AdmissionYear", DbType.AnsiString, AdmissionYear);
                m_DataBase.AddInParameter(selectCommand, "@Condition", DbType.AnsiString, Condition);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable Insert_RollNoList(string RollNoData, string LoginID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("InsertRollNoSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNoData", DbType.AnsiString, RollNoData);
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        //InsertRegNoSP
        internal DataTable Insert_RegNoList(string RegNoData, string LoginID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("InsertRegNoSP");
                m_DataBase.AddInParameter(selectCommand, "@RegNoData", DbType.AnsiString, RegNoData);
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataSet GetStudentHistoryData(string ServiceID, string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentHistoryDataSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentDataTb", "LastCourseTb", "AdmissionTb", "DOBTb", "DocumentTb", "TransactionTb", "PaperDetails" });
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetBulkData(string LoginID, string CollegeCode, string BranchCode, string ServiceCode, string Status, string FromDate, string ToDate, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetBulkDataSP");
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, BranchCode);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceCode);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, LoginID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        internal DataTable MobileValidation(string Mobile)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("StudentMobileValidateSP");
                m_DataBase.AddInParameter(selectCommand, "@Mobile", DbType.AnsiString, Mobile);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetFinanceData(string LoginID, string CollegeCode, string BranchCode, string ServiceCode, string Status, string FromDate, string ToDate, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetFinanceDataSP");
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, BranchCode);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceCode);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, LoginID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataSet GetEditApplicationDetails(string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetEditStudentDataSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                // m_DataBase.AddInParameter(selectCommand, "@SubjectType", DbType.AnsiString, SubjectType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "ApplicationTB","CourseTB","MarksTB" });
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        internal DataTable EditStudentDataDT(CBCSAdmissionForm_DT objCBCSAdmissionForm_DT, string[] aFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objCBCSAdmissionForm_DT, "EditStudentFormSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable Get_SUDepartmentList(string CollegeCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCollegeDepartmentMasterSP");
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        internal DataTable Get_SUSubjectList(string DepartmentCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCollegeSubjectMasterSP");
                m_DataBase.AddInParameter(selectCommand, "@DeptCode", DbType.AnsiString, DepartmentCode);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        public DataSet ValidateRegisteredMobile(string Mobile, string Type)
        {
            DataTable oDataTable = new DataTable();
            DataSet ds = null;

            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("ValidateRegisterdMobile");
                m_DataBase.AddInParameter(selectCommand, "@Mobile", DbType.AnsiString, Mobile);
                m_DataBase.AddInParameter(selectCommand, "@Type", DbType.AnsiString, Type);

                ds = m_DataBase.ExecuteDataSet(selectCommand);

                return ds;
            }
            finally
            {

            }
        }

        internal DataTable InsertPGAdmissionFormData(SUPGAdmission_DT objCBCSAdmissionForm_DT, string[] aFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objCBCSAdmissionForm_DT, "Insert_PGAdmissionDataSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }
        internal DataTable GetPGAppDetails(string SvcID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetPGAppDetailsSP");
                m_DataBase.AddInParameter(selectCommand, "@SvcID", DbType.AnsiString, SvcID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable Get_SUProgramList(string DepartmentCode, string CourseType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCollegeProgramMasterSP");
                m_DataBase.AddInParameter(selectCommand, "@DeptCode", DbType.AnsiString, DepartmentCode);
                m_DataBase.AddInParameter(selectCommand, "@CourseType", DbType.AnsiString, CourseType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable Get_SUEligibilityCriteria(string ProgramId)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetEligibilityCritereaSP");
                m_DataBase.AddInParameter(selectCommand, "@ProgramID", DbType.AnsiString, ProgramId);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable EditStudentData1617DT(CBCSAdmissionForm_DT objCBCSAdmissionForm_DT, string[] aFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objCBCSAdmissionForm_DT, "EditStudentForm16-17SP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }
        internal DataSet GetEditApplicationDetails_1617(string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetEditStudentData1617SP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                // m_DataBase.AddInParameter(selectCommand, "@SubjectType", DbType.AnsiString, SubjectType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "ApplicationTB", "CourseTB", "MarksTB" });
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetCollegeDetails()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCollegeDetailsSP");
                //m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, UserID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataSet GetEditStudentInfo(string RollNo)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetEditStudentInfoDataSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                // m_DataBase.AddInParameter(selectCommand, "@SubjectType", DbType.AnsiString, SubjectType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "ApplicationTB", "CourseTB", "MarksTB" });
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable UpdateStudentData(CBCSAdmissionForm_DT objCBCSAdmissionForm_DT, string[] aFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objCBCSAdmissionForm_DT, "UpdateStudentInfoDataSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable GetSubjectType(string BranchCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetSubjectType");
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, BranchCode);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable InsertSemesterFee(SemesterFee_DT t_SemesterFee_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(t_SemesterFee_DT, "InternalSemesterFeeSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }
        internal DataTable SemesterFeeRefund(ExcelUpload_DT t_ExcelUpload_DT, string[] aFields, string DestinationSP)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(t_ExcelUpload_DT, DestinationSP, aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable InsertCollegeMaster(SUCollege_DT t_SUCollege_DT, string[] aFields, string DestinationSP)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(t_SUCollege_DT, DestinationSP, aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        #region forTheoryMarks
        internal DataTable GetZoneCollegeList(string semester, string examYear, string m_LoginID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetZoneCollegeSP");
                m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, m_LoginID);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, examYear);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, semester);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetTheoryPaperLists(string branch, string semester, string examyear, string subjecttype, string loginID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetTheoryPaperMasterSP");
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, branch);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, semester);
                m_DataBase.AddInParameter(selectCommand, "@Session", DbType.AnsiString, examyear);
                m_DataBase.AddInParameter(selectCommand, "@Subject", DbType.AnsiString, subjecttype);
                m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, loginID);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataSet GetStudentTheoryPaperDetails(string College, string ExamType, string Branch, string t_Year, string Semester, string PaperCode, string RollNo, string SubjectType, string Range, string Examiner, string ZoneID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentTheoryPaperDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, College);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, Branch);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@Session", DbType.AnsiString, t_Year);
                m_DataBase.AddInParameter(selectCommand, "@PaperCode", DbType.AnsiString, PaperCode);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@SubjectType", DbType.AnsiString, SubjectType);
                m_DataBase.AddInParameter(selectCommand, "@Range", DbType.AnsiString, Range);
                m_DataBase.AddInParameter(selectCommand, "@ExaminerID", DbType.AnsiString, Examiner);
                m_DataBase.AddInParameter(selectCommand, "@ZoneID", DbType.AnsiString, ZoneID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "Table1", "Table2", "Table3", "Table4" });
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        
        internal DataTable GetZone(string LoginID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetZoneMasterSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetPaperSubjectType(string BranchCode, string Semester)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetPaperSubjectType");
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, BranchCode);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable InsertTheoryMarkData(TheoryMark_DT t_TheoryMark_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(t_TheoryMark_DT, "InsertTheoryMarkSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable TheoryMarkSubmitted(string college, string branch, string examType, string session, string semester, string paper, string uID, string CreatedBy, string ZoneID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("TheoryMarkSubmittedSp");
                m_DataBase.AddInParameter(selectCommand, "@College", DbType.AnsiString, college);
                m_DataBase.AddInParameter(selectCommand, "@Branch", DbType.AnsiString, branch);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, examType);
                m_DataBase.AddInParameter(selectCommand, "@Session", DbType.AnsiString, session);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, semester);
                m_DataBase.AddInParameter(selectCommand, "@Paper", DbType.AnsiString, paper);
                m_DataBase.AddInParameter(selectCommand, "@UID", DbType.AnsiString, uID);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@ZoneID", DbType.AnsiString, ZoneID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataSet TheoryMarksSummary(string mCollege, string mBranch, string mSemester, string mPaper, string mYear, string mType, string mCreatedBy, string mExaminerID)
        {
            DataSet oDataSet = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetTheoryMarksSummarySP");
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, mCollege);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, mBranch);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, mType);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, mYear);
                m_DataBase.AddInParameter(selectCommand, "@PaperCode", DbType.AnsiString, mPaper);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, mSemester);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, mCreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@ExaminerID", DbType.AnsiString, mExaminerID);
                Reader = m_DataBase.ExecuteReader(selectCommand);

                if (Reader != null)
                    oDataSet.Load(Reader, LoadOption.OverwriteChanges, new string[] { "Table1", "Table2", "Table3", "Table4" });
                return oDataSet;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        #endregion

        internal DataTable InsertNoticeDetail(NoticeData_DT objNoticeData_DT, string[] aFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objNoticeData_DT, "InsertNoticeDetailSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable GetNoticeDetail(string SearchText, string FromDate, string ToDate, string NoticeType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetNoticeDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@NoticeType", DbType.AnsiString, NoticeType);
                m_DataBase.AddInParameter(selectCommand, "@NoticeHeading", DbType.AnsiString, SearchText);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable InsertActivity(Activity_DT t_Activity_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(t_Activity_DT, "InternalActivitySP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable InsertZoneConfiguration(Zone_DT t_Zone_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(t_Zone_DT, "InternalZoneDetailSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable GetSupervisorTheoryPaperDetail(string College, string ExamType, string Branch, string t_Year, string Semester, string PaperCode, string RollNo, string SubjectType, string ExaminerID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetSupervisorTheoryPaperDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, College);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, Branch);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@Session", DbType.AnsiString, t_Year);
                m_DataBase.AddInParameter(selectCommand, "@PaperCode", DbType.AnsiString, PaperCode);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@SubjectType", DbType.AnsiString, SubjectType);
                m_DataBase.AddInParameter(selectCommand, "@ExaminerID", DbType.AnsiString, ExaminerID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable InsertSupervisorMarkData(TheoryMark_DT t_TheoryMark_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(t_TheoryMark_DT, "InsertSupervisorMarkSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataSet SupervisorMarksSummary(string mCollege, string mBranch, string mSemester, string mPaper, string mYear, string mType, string mCreatedBy)
        {
            DataSet oDataSet = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetSupervisorMarksSummarySP");
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, mCollege);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, mBranch);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, mType);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, mYear);
                m_DataBase.AddInParameter(selectCommand, "@PaperCode", DbType.AnsiString, mPaper);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, mSemester);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, mCreatedBy);
                Reader = m_DataBase.ExecuteReader(selectCommand);

                if (Reader != null)
                    oDataSet.Load(Reader, LoadOption.OverwriteChanges, new string[] { "Table1", "Table2", "Table3", "Table4" });
                return oDataSet;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }


        internal DataTable GetStudentTheoryReport(string College, string ExamType, string Branch, string t_Year, string Semester, string PaperCode, string RollNo, string SubjectType, string ZoneID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentTheoryReportSP");
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, College);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, Branch);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@Session", DbType.AnsiString, t_Year);
                m_DataBase.AddInParameter(selectCommand, "@PaperCode", DbType.AnsiString, PaperCode);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@SubjectType", DbType.AnsiString, SubjectType);
                m_DataBase.AddInParameter(selectCommand, "@ZoneID", DbType.AnsiString, ZoneID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetExaminer(string LoginID, string Branch, string t_Year, string Semester, string SubjectType, string SubjectCode, string PaperCode, string Examiner)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetExaminerSP");
                m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, Branch);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@Session", DbType.AnsiString, t_Year);
                m_DataBase.AddInParameter(selectCommand, "@SubjectType", DbType.AnsiString, SubjectType);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, SubjectCode);
                m_DataBase.AddInParameter(selectCommand, "@PaperCode", DbType.AnsiString, PaperCode);
                m_DataBase.AddInParameter(selectCommand, "@Examiner", DbType.AnsiString, Examiner);
                
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable InsertExaminer(Examiner_DT t_Examiner_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(t_Examiner_DT, "InsertExaminerSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable GetRollNoRange(string Branch, string t_Year, string Semester, string PaperCode, string College)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetRollNoRangeSP");
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, Branch);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, t_Year);
                m_DataBase.AddInParameter(selectCommand, "@PaperCode", DbType.AnsiString, PaperCode);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, College);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable AssignExaminerData(TheoryMark_DT t_TheoryMark_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(t_TheoryMark_DT, "AssigneExaminerSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataSet PrintMarkFile(string mBranch, string mSemester, string mPaper, string mYear, string mZoneID, string mExaminerID)
        {
            DataSet oDataSet = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetPrintMarkFileSP");
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, mBranch);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, mYear);
                m_DataBase.AddInParameter(selectCommand, "@PaperCode", DbType.AnsiString, mPaper);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, mSemester);
                m_DataBase.AddInParameter(selectCommand, "@ZoneID", DbType.AnsiString, mZoneID);
                m_DataBase.AddInParameter(selectCommand, "@ExaminerID", DbType.AnsiString, mExaminerID);
                Reader = m_DataBase.ExecuteReader(selectCommand);

                if (Reader != null)
                    oDataSet.Load(Reader, LoadOption.OverwriteChanges, new string[] { "Table1"});
                return oDataSet;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataSet PrintMarkFileRange(string mBranch, string mSemester, string mPaper, string mYear, string mZoneID, string mExaminerID, string mMarFileSetID, string mRollRange)
        {
            DataSet oDataSet = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetMarkFileDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, mBranch);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, mYear);
                m_DataBase.AddInParameter(selectCommand, "@PaperCode", DbType.AnsiString, mPaper);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, mSemester);
                m_DataBase.AddInParameter(selectCommand, "@ZoneID", DbType.AnsiString, mZoneID);
                m_DataBase.AddInParameter(selectCommand, "@ExaminerID", DbType.AnsiString, mExaminerID);
                m_DataBase.AddInParameter(selectCommand, "@RollNoRange", DbType.AnsiString, mRollRange);
                m_DataBase.AddInParameter(selectCommand, "@MarFileSetID", DbType.AnsiString, mMarFileSetID);
                Reader = m_DataBase.ExecuteReader(selectCommand);

                if (Reader != null)
                    oDataSet.Load(Reader, LoadOption.OverwriteChanges, new string[] { "Table1" });
                return oDataSet;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable InsertLateralMark(TheoryMark_DT t_TheoryMark_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(t_TheoryMark_DT, "InsertLateralMarkSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable GetTeachersSubject()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetTeachersSubjectSP");                
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetDesignation()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetTeachersDesignationSP");
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable InsertCollegeTeachers(CollegeTeachers_DT t_CollegeTeachers_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                cmdInsert = qb.GetInsertCommandV3(t_CollegeTeachers_DT, "InsertCollegeTeachersSP", aFields);

                Reader = m_DataBase.ExecuteReader(cmdInsert);
                if (Reader != null)
                    oDataTable.Load(Reader);

                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetCollegeTeacher(string loginID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCollegeTeacherSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, loginID);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable EditTeachersProfile(string ProfileID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("EditTeachersProfileSP");
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, ProfileID);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetBankName()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetBankNameSP");
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable InsertCollegeBankDetail(BankDetail_DT t_BankDetail_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                cmdInsert = qb.GetInsertCommandV3(t_BankDetail_DT, "InsertCollegeBankDetailSP", aFields);

                Reader = m_DataBase.ExecuteReader(cmdInsert);
                if (Reader != null)
                    oDataTable.Load(Reader);

                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataSet GetEditStudentPics(string RollNo)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetEditStudentPicsSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                // m_DataBase.AddInParameter(selectCommand, "@SubjectType", DbType.AnsiString, SubjectType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "ApplicationTB" });
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable UpdateStudentPics(EditStudentPics_DT objCBCSAdmissionForm_DT, string[] aFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objCBCSAdmissionForm_DT, "UpdateStudentPicsSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable CollegeAffiliation(string UserID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCollegeAffiliationSP");
                m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, UserID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable InserCollegeAffiliation(CollegeAffiiation_DT t_CollegeAffiiation_DT, string[] aFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(t_CollegeAffiiation_DT, "InsertCollegeAffiliationSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataSet GetStudentExamDetail(string RollNo, string Semester, string ExamYear)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentExamDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentDataTb", "ExamDataTB", "ResultDataTB", "FinalResultTB" });
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetProgramList()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetProgramListSP");
                //m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetSubProgramList(string ProgramCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetSubProgramListSP");
                m_DataBase.AddInParameter(selectCommand, "@ProgramCode", DbType.AnsiString, ProgramCode);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetCourseList(string ProgramCode, string SubProgramCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCourseMasteSP");
                m_DataBase.AddInParameter(selectCommand, "@ProgramCode", DbType.AnsiString, ProgramCode);
                m_DataBase.AddInParameter(selectCommand, "@SubProgramCode", DbType.AnsiString, SubProgramCode);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        internal DataTable GETDTEStudentSearch(string CourseName, string regNo, string dob, string name, string rollno, string father)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GETDTEStudentSearchSp");
                m_DataBase.AddInParameter(selectCommand, "@CourseName", DbType.AnsiString, CourseName);
                m_DataBase.AddInParameter(selectCommand, "@RegdNo", DbType.AnsiString, regNo);
                m_DataBase.AddInParameter(selectCommand, "@DOB", DbType.AnsiString, dob);
                m_DataBase.AddInParameter(selectCommand, "@Name", DbType.AnsiString, name);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, rollno);
                m_DataBase.AddInParameter(selectCommand, "@Father", DbType.AnsiString, father);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }


        internal DataTable GetTeachersSubject(string College, string SubProgram, string Course, string Semester, string Session)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetTeachersSubjectSP");
                m_DataBase.AddInParameter(selectCommand, "@College", DbType.AnsiString, College);
                m_DataBase.AddInParameter(selectCommand, "@SubProgram", DbType.AnsiString, SubProgram);
                m_DataBase.AddInParameter(selectCommand, "@Course", DbType.AnsiString, Course);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@Session", DbType.AnsiString, Session);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable InsertFacultyDetail(FacultyDetail_DT t_FacultyDetail_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                cmdInsert = qb.GetInsertCommandV3(t_FacultyDetail_DT, "InsertFacultyDetailSP", aFields);

                Reader = m_DataBase.ExecuteReader(cmdInsert);
                if (Reader != null)
                    oDataTable.Load(Reader);

                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetBulkApprovalData(string LoginID, string CollegeCode, string BranchCode, string ServiceCode, string Status, string FromDate, string ToDate, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetBulkApprovalDataSP");
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, BranchCode);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceCode);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, LoginID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetNominatedFaculty(string LoginID, string CollegeCode, string BranchCode, string ServiceCode, string Status, string FromDate, string ToDate, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetNominatedFacultySP");
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, BranchCode);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceCode);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, LoginID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable InsertNominatedFaculty(NominateFaculty_TB obj_DT, string[] AFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(obj_DT, "InsertNominatedFacultySP", AFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataSet GetFacultyData(string FacultyID, string ProfileID, string keyField)
        {
            DataSet oDataSet = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetFacultyDataSP");
                m_DataBase.AddInParameter(selectCommand, "@FacultyID", DbType.AnsiString, FacultyID);
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, ProfileID);
                m_DataBase.AddInParameter(selectCommand, "@keyField", DbType.AnsiString, keyField);
                Reader = m_DataBase.ExecuteReader(selectCommand);

                if (Reader != null)
                    oDataSet.Load(Reader, LoadOption.OverwriteChanges, new string[] { "Table1", "Table2" });
                return oDataSet;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetNominateFacultyData(string LoginID, string CollegeCode, string Department, string Program, string SubProgram, string Coures, string examSession
            , string Semester, string SubjectCode, string BranchCode, string ServiceCode, string FromDate, string ToDate, string Status, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetNominateFacultyDataSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString,  CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString,  Department);
                m_DataBase.AddInParameter(selectCommand, "@Program", DbType.AnsiString,  Program);
                m_DataBase.AddInParameter(selectCommand, "@SubProgram", DbType.AnsiString,  SubProgram);
                m_DataBase.AddInParameter(selectCommand, "@Coures", DbType.AnsiString,  Coures);
                m_DataBase.AddInParameter(selectCommand, "@examSession", DbType.AnsiString,  examSession);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString,  Semester);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString,  SubjectCode);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString,  BranchCode);
                m_DataBase.AddInParameter(selectCommand, "@ServiceCode", DbType.AnsiString,  ServiceCode);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString,  FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString,  ToDate);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString,  Status);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString,  AppID);
                
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetDepartment()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetDepartmentSP");
                //m_DataBase.AddInParameter(selectCommand, "@DepartmentCode", DbType.AnsiString, DepartmentCode);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        internal DataTable GetQualification(string QulaificationType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetQualificationSP");
                m_DataBase.AddInParameter(selectCommand, "@QulaificationType", DbType.AnsiString, QulaificationType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable InsertActivityCSVTU(ActivityCSVTU_DT t_Activity_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(t_Activity_DT, "InternalActivityCSVTUSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

    }
}
