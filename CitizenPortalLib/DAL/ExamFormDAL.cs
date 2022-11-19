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
    internal class ExamFormDAL : DALBase
    {
        Database m_DataBase;
        int m_TimeOut = 20000;
        internal DataTable GetBranchList()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetBranchListSP");
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
        internal DataTable SearchStudentExamFormSP(string ExamFormNo, string Name, string MobileNo, DateTime DOB, string Branch)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("SearchStudentExamFormSP");
                m_DataBase.AddInParameter(selectCommand, "@ExamFormNo", DbType.AnsiString, ExamFormNo);
                m_DataBase.AddInParameter(selectCommand, "@Name", DbType.AnsiString, Name);
                m_DataBase.AddInParameter(selectCommand, "@MobileNo", DbType.AnsiString, MobileNo);
                m_DataBase.AddInParameter(selectCommand, "@DOB", DbType.DateTime, DOB);
                m_DataBase.AddInParameter(selectCommand, "@Branch", DbType.AnsiString, Branch);
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

        internal DataSet GetStudentRTRRVDetail(string RollNo, string ProfileID, string v)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentRTRRVDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, ProfileID);
                // m_DataBase.AddInParameter(selectCommand, "@SubjectType", DbType.AnsiString, SubjectType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "ApplicationTB", "DateConfigurationTB" });
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

        internal DataTable GetStudentData(string ExamFormNo, string Branch)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentDataBasedOnExamFormNoSP");
                m_DataBase.AddInParameter(selectCommand, "@ExamFormNo", DbType.AnsiString, ExamFormNo);
                m_DataBase.AddInParameter(selectCommand, "@Branch", DbType.AnsiString, Branch);
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

        internal DataSet GetRTRRVSubject(string RollNo, string Semester, string ExamYear, string AppType)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetRTRRVSubjectSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);
                m_DataBase.AddInParameter(selectCommand, "@AppType", DbType.AnsiString, AppType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "RTRRVSubjectTB","PaymentDetailTB" });
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

        internal DataTable GetRTRRVSemester(string rollNo, string regdNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetRTRRVSemesterSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, rollNo);
                m_DataBase.AddInParameter(selectCommand, "@RegdNo", DbType.AnsiString, regdNo);
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

        internal DataSet GetStudentDetails(string ExamFormNo, string Branch)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentDataBasedOnExamFormNoSP");
                m_DataBase.AddInParameter(selectCommand, "@ExamFormNo", DbType.AnsiString, ExamFormNo);
                m_DataBase.AddInParameter(selectCommand, "@Branch", DbType.AnsiString, Branch);
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

        internal DataTable InsertExamFormFormData(ExamFormData_DT objExamFormForm_DT, string[] aFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objExamFormForm_DT, "InsertExamFormDataSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataSet GetStudentExamFormData(string ServiceID, string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetExamFormFormDataSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentDataTb", "LastCourseTb", "AdmissionTb", "DOBTb", "DocumentTb", "TransactionTb", "ActionHistory" });
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

        internal DataSet ValidateExamFormAge(string CourseCode, string ProgramCode, string Category, string Gender, string Age, string Domicile)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("ValidateExamFormAgeSP");
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, CourseCode);
                m_DataBase.AddInParameter(selectCommand, "@ProgramCode", DbType.AnsiString, ProgramCode);
                m_DataBase.AddInParameter(selectCommand, "@Category", DbType.AnsiString, Category);
                m_DataBase.AddInParameter(selectCommand, "@Gender", DbType.AnsiString, Gender);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, Age);
                m_DataBase.AddInParameter(selectCommand, "@Domicile", DbType.AnsiString, Domicile);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AgeTB" });
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

        internal DataSet GetStudentSemesterExamDetail(string RollNo, string ExamYear, string KeyField, string Semester)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentSemesterExamDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);
                m_DataBase.AddInParameter(selectCommand, "@KeyField", DbType.AnsiString, KeyField);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentDetail","SubjectDetailRegular", "SubjectDetailBacklog", "SubjectDetailAGBacklog", "PaymentDetail" });
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

        internal DataTable GenerateBatchSemesterPay(string Data, string ServiceID, string CreatedBy, string RollNo, string ExamType, string Semester, string ExamYear, string PayableAmount, string Mobile, string EmailID, string DOB)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("InsertSemesterDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@Data", DbType.AnsiString, Data);
                m_DataBase.AddInParameter(selectCommand, "@ServiceId", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);
                m_DataBase.AddInParameter(selectCommand, "@Amount", DbType.AnsiString, PayableAmount);
                m_DataBase.AddInParameter(selectCommand, "@EmailID", DbType.AnsiString, EmailID);
                m_DataBase.AddInParameter(selectCommand, "@Mobile", DbType.AnsiString, Mobile);
                m_DataBase.AddInParameter(selectCommand, "@DOB", DbType.AnsiString, DOB);
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

        internal DataSet CalculateExamFees(string RollNo, string ExamType, string SubjectCount)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CalculateExamFeesSP");
                m_DataBase.AddInParameter(selectCommand, "@SubjectCount", DbType.AnsiString, SubjectCount);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "ExamFees" });
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

        internal DataSet GetStudentExamDetail(string ServiceID, string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentSemesterExamSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentDetail", "SubjectDetailRegular", "SubjectDetailBacklog", "SubjectDetailAGBacklog", "PaymentDetail" });
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

        internal DataSet GetStudentAdmitCard(string RollNo, string ExamSession, string Semester)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentAdmitCardSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@ExamSession", DbType.AnsiString, ExamSession);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentDetail", "SubjectDetailRegular", "SubjectDetailBacklog", "SubjectDetailAGBacklog" });
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

        internal DataTable GenerateRTRVBatchSemesterPay(string Data, string ServiceID, string CreatedBy, string RollNo, string ExamType, string Semester, string ExamYear, string PayableAmount, string Mobile, string EmailID, string DOB, string AppType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("InsertRTRVSemesterDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@Data", DbType.AnsiString, Data);
                m_DataBase.AddInParameter(selectCommand, "@ServiceId", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);
                m_DataBase.AddInParameter(selectCommand, "@Amount", DbType.AnsiString, PayableAmount);
                m_DataBase.AddInParameter(selectCommand, "@EmailID", DbType.AnsiString, EmailID);
                m_DataBase.AddInParameter(selectCommand, "@Mobile", DbType.AnsiString, Mobile);
                m_DataBase.AddInParameter(selectCommand, "@DOB", DbType.AnsiString, DOB);
                m_DataBase.AddInParameter(selectCommand, "@AppType", DbType.AnsiString, AppType);
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

        internal DataSet GetRTRVStudentDetail(string ServiceID, string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetRTRVStudentDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentDetail", "SubjectDetailRegular", "PaymentDetail" });
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

        internal DataSet GetStudentExamData(string Semester, string Session, string ExamType, string RollNo, string Enrollment, string Schema, string LoginID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentExamDataSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, Session);
                m_DataBase.AddInParameter(selectCommand, "@enrollmentNo", DbType.AnsiString, Session);
                m_DataBase.AddInParameter(selectCommand, "@Schema", DbType.AnsiString, Schema);
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentDetailTB", "SubjectDetailTB", "PaymentDetailTB", "FormFillupDateTB" });
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

        internal DataTable GenerateStudentExamData(string Data, string ServiceID, string CreatedBy, string RollNo, string ExamType, string Semester, string ExamYear, string PayableAmount, string Mobile, string EmailID, string DOB, string AppType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("InsertSemesterDataSP");
                selectCommand.CommandTimeout = m_TimeOut;
                m_DataBase.AddInParameter(selectCommand, "@Data", DbType.AnsiString, Data);
                m_DataBase.AddInParameter(selectCommand, "@ServiceId", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);
                m_DataBase.AddInParameter(selectCommand, "@Amount", DbType.AnsiString, PayableAmount);
                m_DataBase.AddInParameter(selectCommand, "@EmailID", DbType.AnsiString, EmailID);
                m_DataBase.AddInParameter(selectCommand, "@Mobile", DbType.AnsiString, Mobile);
                m_DataBase.AddInParameter(selectCommand, "@DOB", DbType.AnsiString, DOB);
                m_DataBase.AddInParameter(selectCommand, "@AppType", DbType.AnsiString, AppType);
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

    }
}
