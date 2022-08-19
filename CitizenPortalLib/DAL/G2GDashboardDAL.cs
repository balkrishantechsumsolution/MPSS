using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Common;
using CitizenPortalLib.DataStructs;

namespace CitizenPortalLib.DAL
{
    public class G2GDashboardDAL: DALBase
    {
        Database m_DataBase;
        int m_TimeOut = 12000;

        public G2GDashboardDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public G2GDashboardDAL()
            : base()
        {           
            m_DataBase = Factory.Create(this.ConnectionString);
        }

        internal DataTable GetG2GDashboard(string G2GUser, int Department)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetG2GDashboardInfoSP");
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
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

        internal DataSet GetMainMenu(string userID)
        {
            DataSet oDataSet = new DataSet();
            m_DataBase = Factory.Create(this.ConnectionString);

            DbCommand selectCommand;
            selectCommand = m_DataBase.GetStoredProcCommand("GetMainMenuSP");
            m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, userID);
            oDataSet = m_DataBase.ExecuteDataSet(selectCommand);
            return oDataSet;
        }

        internal DataSet GetBulkBatchDetails(string m_ServiceID, string m_AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetBulkBatchDetailsSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, m_ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, m_AppID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "CollegeDetails", "StudentDetails", "PaymentDetails","AmountDetails" });
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

        internal DataTable GetTransactionOUATDetail(string G2GUser, int Department, string Service, string District, string Status, string DateFrom, string DateTo, string Flag, string Semester, string ExamYear)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetTransactionOUATSP");
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, Service);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, District);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, DateFrom);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, DateTo);
                m_DataBase.AddInParameter(selectCommand, "@Flag", DbType.AnsiString, Flag);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);

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

        internal DataTable GetTransactionOUAT(string G2GUser, int Department, string Service, string District, string Status, string DateFrom, string DateTo, string Flag, string Semester, string ExamYear)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetTransactionOUATSP");
                selectCommand.CommandTimeout = 300;
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, Service);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, District);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, DateFrom);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, DateTo);
                m_DataBase.AddInParameter(selectCommand, "@Flag", DbType.AnsiString, Flag);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);
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

        internal DataTable GetG2GDashboard_SSEPD(string G2GUser, int Department, string service, string DistrictCode, string FromDate, string ToDate, string Status, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetG2GDashboard_SSEPDSP");
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, service);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
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

        internal DataTable GetG2GDashboard_DSSO(string G2GUser, int Department, string service, string DistrictCode, string FromDate, string ToDate, string Status, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetG2GDashboard_DSSOSP");
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, service);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
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
        internal DataTable GetG2GReport_DSSO(string G2GUser, string service, string DistrictCode, string BlockCode, string FromDate, string ToDate,string Status)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("Report_GetDSSOSP");
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, service);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@BlockCode", DbType.AnsiString, BlockCode);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
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

        internal DataTable InsertDTEManualData(DTEManualData_DT DTEManualData_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(DTEManualData_DT, "DTE_InsertManualDataSp", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable InsertITIManualData(ITIManualData_DT ITIManualData_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(ITIManualData_DT, "ITI_InsertManualDataSp", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;

        }

        
        internal DataTable GetDTEG2GDashboardDetails(string G2GUser, int Department, string Service, string FromDate, string ToDate, string District, string Status, string Branch, string College,string RollNo, string ExamType, string t_Year, string Semester, string Paper)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("G2G_GetDTEDataDetailsSP");
                selectCommand.CommandTimeout = 8 * 60;
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, Service);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, District);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, Branch);
                m_DataBase.AddInParameter(selectCommand, "@College", DbType.AnsiString, College);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@Session", DbType.AnsiString, t_Year);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@Paper", DbType.AnsiString, Paper);

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

       
        internal DataTable GetDTEG2GITIDashboardDetails(string G2GUser, int Department, string Service, string FromDate, string ToDate, string District, string Status)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("G2G_GetDTEITIDataDetailsSP");
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, Service);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, District);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
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

        internal DataTable GetOUATAdmissionDetails(string G2GUser, int Department, string Category, string DistrictCode, string FromDate, string ToDate, string Status, string AppID, string RollNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("OUAT_GetUGAdmissionDataSP");
                selectCommand.CommandTimeout = m_TimeOut;

                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@Category", DbType.AnsiString, Category);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
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
        
        internal DataTable GetSeniorCitizenG2GData(string G2GUser, int Department, string Category, string DistrictCode, string FromDate, string ToDate, string Status, string AppID, string RollNo,string PoliceStation)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("G2G_GetSeniorCitizenDataTestSP");//G2G_GetSeniorCitizenDataSP
                selectCommand.CommandTimeout = m_TimeOut;

                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@Category", DbType.AnsiString, Category);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@PoliceStation", DbType.AnsiString, PoliceStation);
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
        internal DataTable GetSeniorCitizenG2GDispatch(string G2GUser, int Department, string Category, string DistrictCode, string FromDate, string ToDate, string Status, string AppID, string RollNo, string PoliceStation)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("G2G_GetSeniorCitizenDispatchSP");//G2G_GetSeniorCitizenDataSP
                selectCommand.CommandTimeout = m_TimeOut;

                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@Category", DbType.AnsiString, Category);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@PoliceStation", DbType.AnsiString, PoliceStation);
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

        internal DataTable GetITIG2GDashboard(string G2GUser, int Department, string Service, string District, string Status,string FromDate,string ToDate)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("G2G_GetITIDataSP");
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, Service);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, District);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
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


        internal DataTable GetDTEG2GDashboard(string G2GUser, int Department, string Service, string District, string Status, string DateFrom, string DateTo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("G2G_GetDTEDataSP");
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, Service);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, District);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, DateFrom);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, DateTo);
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

        internal DataTable GetSUG2GDashboard(string G2GUser, int Department, string Service, string CollegeCode, string Status, string DateFrom, string DateTo, string AppID, string RegNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("G2G_GetSUDataSP");
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, Service);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, DateFrom);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, DateTo);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@RegNo", DbType.AnsiString, RegNo);
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

        internal DataTable GetOISFG2GData_District(string G2GUser, int Department, string Category, string DistrictCode, string FromDate, string ToDate)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("G2G_GetOSIFData_DistrictSP");
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@Category", DbType.AnsiString, Category);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);

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

        internal DataTable GetOISFG2GData(string G2GUser, int Department)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("G2G_GetOSIFDataSP");
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
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

        internal DataTable GetOISFG2GData(string G2GUser, int Department, string Category, string DistrictCode, string FromDate, string ToDate, string Status, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("G2G_GetOSIFDataSPTemp");
                selectCommand.CommandTimeout = m_TimeOut;

                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@Category", DbType.AnsiString, Category);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
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

        internal DataSet GetG2GPendingForSelectedService(string G2GUser, int Department, string SelectedOption, string SelectedServiceID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("G2G_GetPendingServicesSelectedSP");
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@SelectedOption", DbType.AnsiString, SelectedOption);
                m_DataBase.AddInParameter(selectCommand, "@SelectedServiceID", DbType.AnsiString, SelectedServiceID);
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

        internal DataTable ProcessHabishaBrataApplications(string RowID, string CreatedBy, string ActionType, string Remarks)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("G2G_ProcessHabishaBrataApplicationsSP");
                m_DataBase.AddInParameter(selectCommand, "@RowID", DbType.AnsiString, RowID);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@Action", DbType.AnsiString, ActionType);
                m_DataBase.AddInParameter(selectCommand, "@Remarks", DbType.AnsiString, Remarks);
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

        internal DataTable GetHabishaBrataList(string G2GUser, int Department)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("G2G_GetHabishaBrataDataSP");
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
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

        internal DataSet GetPendingServices(string G2GUser, int Department)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("G2G_GetPendingServicesSP");
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
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

        internal DataTable ProcessApplications(string RowID, string CreatedBy, string Action)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("G2G_ProcessApplicationsSP");
                m_DataBase.AddInParameter(selectCommand, "@RowID", DbType.AnsiString, RowID);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@Action", DbType.AnsiString, Action);
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

        internal DataTable GetG2GPendingForAcceptance(string G2GUser, int Department)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetG2GPendingForAcceptanceSP");
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
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

        internal DataTable GetG2GDashboard(string ServiceID, string AppID, string G2GUser)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetG2GDashboardInfoSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
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

        internal DataTable GetOUATG2GData(string G2GUser, int Department, string Category, string DistrictCode, string FromDate, string ToDate, string Status, string AppID, string RollNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("G2G_GetOUATDataSP");
                selectCommand.CommandTimeout = m_TimeOut;

                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@Category", DbType.AnsiString, Category);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
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

        internal DataTable GetSUStudentHistory(string G2GUser, int Department, string FromDate, string ToDate, string RollNo, string RegNo, string CollegeCode, string Branch, string Program, string Session, string SubProgram, string Course)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentDetailsSP");
                selectCommand.CommandTimeout = 15 * 60;
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@RegNo", DbType.AnsiString, RegNo);

                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@BranchName", DbType.AnsiString, Branch);
                m_DataBase.AddInParameter(selectCommand, "@Program", DbType.AnsiString, Program);
                m_DataBase.AddInParameter(selectCommand, "@Session", DbType.AnsiString, Session);
                m_DataBase.AddInParameter(selectCommand, "@SubProgram", DbType.AnsiString, SubProgram);
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, Course);
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

        internal DataTable GetStudentData_BulkPayment(string College, string ExamType, string BranchName, string paymentStatus,string RollNo, string Semester)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentData_BulkPaymentSP");                
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, College);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@BranchName", DbType.AnsiString, BranchName);
                m_DataBase.AddInParameter(selectCommand, "@paymentStatus", DbType.AnsiString, paymentStatus);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
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

        internal DataTable GenerateBatch_BulkPay(string Data, string Remarks, string SvcID, string CreatedBy, string BranchName, string ExamType, string Semester, string ExamYear)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GenerateBatch_BulkPaySP");
                m_DataBase.AddInParameter(selectCommand, "@Data", DbType.AnsiString, Data);
                m_DataBase.AddInParameter(selectCommand, "@Remarks", DbType.AnsiString, Remarks);
                m_DataBase.AddInParameter(selectCommand, "@ServiceId", DbType.AnsiString, SvcID);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@BranchName", DbType.AnsiString, BranchName);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);
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

        internal DataTable GetPGG2GData(string G2GUser, int Department, string Category, string DistrictCode, string FromDate, string ToDate, string Status, string AppID, string CourseType,string DepartmentId,string Program)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("G2G_GetPGDataSP");
                selectCommand.CommandTimeout = m_TimeOut;

                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@Category", DbType.AnsiString, Category);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@CourseType", DbType.AnsiString, CourseType);
                m_DataBase.AddInParameter(selectCommand, "@DepartmentId", DbType.AnsiString, DepartmentId);
                m_DataBase.AddInParameter(selectCommand, "@ProgramId", DbType.AnsiString, Program);
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

        internal DataTable GetMissingPaperStudentData_BulkPayment(string College, string ExamType, string BranchName, string paymentStatus, string RollNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetMissingPaper_StudentData_BulkPaymentSP");
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, College);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@BranchName", DbType.AnsiString, BranchName);
                m_DataBase.AddInParameter(selectCommand, "@paymentStatus", DbType.AnsiString, paymentStatus);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
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

        internal DataTable GeneratePendingPaperBatch_BulkPay(string Data, string Remarks, string SvcID, string CreatedBy, string BranchName, string ExamType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GenerateBatch_MissingPaperBulkPaySP");
                m_DataBase.AddInParameter(selectCommand, "@Data", DbType.AnsiString, Data);
                m_DataBase.AddInParameter(selectCommand, "@Remarks", DbType.AnsiString, Remarks);
                m_DataBase.AddInParameter(selectCommand, "@ServiceId", DbType.AnsiString, SvcID);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@BranchName", DbType.AnsiString, BranchName);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
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


        internal DataSet GetStudentPaperDetails(string College, string ExamType, string Course, string Program, string t_Year, string Semester, string PaperCode, string RollNo)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentPaperDetailSP");
                selectCommand.CommandTimeout = m_TimeOut;
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, College);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, Course);
                m_DataBase.AddInParameter(selectCommand, "@ProgramCode", DbType.AnsiString, Program);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, t_Year);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, PaperCode);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
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

        internal DataTable GetPaymentSummary(string G2GUser, int Department, string DateFrom, string DateTo, string Flag, string Semester, string ExamYear, string College)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetPaymentSummarySP");
                selectCommand.CommandTimeout = 300;
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, DateFrom);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, DateTo);
                m_DataBase.AddInParameter(selectCommand, "@Flag", DbType.AnsiString, Flag);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);
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

        internal DataTable GetConfigDetail()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetConfigDetailSP");
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


        internal DataTable GetEditSubjectDetails(string College, string ExamType, string Branch, string t_Year, string Semester, string SubjectType, string RollNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetEditSubjectDetailsSP");
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, College);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@BranchName", DbType.AnsiString, Branch);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@Session", DbType.AnsiString, t_Year);
                m_DataBase.AddInParameter(selectCommand, "@SubjectType", DbType.AnsiString, SubjectType);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
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
        
        internal DataTable GetEditSubjectList(string subType, string semester, string branchCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetEditSubjectListSP");
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, semester);
                m_DataBase.AddInParameter(selectCommand, "@SubjectType", DbType.AnsiString, subType);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, branchCode);

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

        internal DataTable UnivReportDetails(string G2GUser, int Department, string Service, string FromDate, string ToDate, string Branch, string College, string ExamType, string t_Year, string Semester, string SubProgram, string Course, string RollNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("UnivReportDetailsSP");
                selectCommand.CommandTimeout = 15 * 60;
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, Service);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, Branch);
                m_DataBase.AddInParameter(selectCommand, "@College", DbType.AnsiString, College);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@Session", DbType.AnsiString, t_Year);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@SubProgram", DbType.AnsiString, SubProgram);
                m_DataBase.AddInParameter(selectCommand, "@Course", DbType.AnsiString, Course);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
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

        internal DataTable UpdateUnivRegNo(UnivRegistration_DT t_UnivRegistration_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(t_UnivRegistration_DT, "UpdateUnivRegNoSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }
                
        internal DataTable GetStudentRegNoDetails(string College, string Branch, string t_Year, string RollNo, string RegdNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentRegNoDetailsSP");
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, College);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, Branch);
                m_DataBase.AddInParameter(selectCommand, "@Session", DbType.AnsiString, t_Year);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@RegNo", DbType.AnsiString, RegdNo);
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

        internal DataTable UpdateUnivRegNo(string college, string branch, string examType, string session, string semester, string paper, string uID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("InternalMarkSubmittedSp");
                m_DataBase.AddInParameter(selectCommand, "@College", DbType.AnsiString, college);
                m_DataBase.AddInParameter(selectCommand, "@Branch", DbType.AnsiString, branch);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, examType);
                m_DataBase.AddInParameter(selectCommand, "@Session", DbType.AnsiString, session);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, semester);
                m_DataBase.AddInParameter(selectCommand, "@Paper", DbType.AnsiString, paper);
                m_DataBase.AddInParameter(selectCommand, "@UID", DbType.AnsiString, uID);
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

        internal DataSet InternalMarksSummary(string mCollege, string mBranch, string mSemester, string mPaper, string mYear, string mType)
        {
            DataSet oDataSet = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;                
                selectCommand = m_DataBase.GetStoredProcCommand("GetInternalMarksSummarySP");
                selectCommand.CommandTimeout = m_TimeOut;
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, mCollege);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, mBranch);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, mType);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, mYear);
                m_DataBase.AddInParameter(selectCommand, "@PaperCode", DbType.AnsiString, mPaper);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, mSemester);
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

        internal DataTable GetSemesterFeeDetails(string Semester, string Branch, string ExamType, string ExamYear, string ActionType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetSemesterFeeDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@Branch", DbType.AnsiString, Branch);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);
                m_DataBase.AddInParameter(selectCommand, "@ActionType", DbType.AnsiString, ActionType);
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

        internal DataTable GetMaterData(string Semester, string Branch, string Year, string ActionType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetMaterDataSP");
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@Branch", DbType.AnsiString, Branch);
                m_DataBase.AddInParameter(selectCommand, "@Year", DbType.AnsiString, Year);
                m_DataBase.AddInParameter(selectCommand, "@ActionType", DbType.AnsiString, ActionType);
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

        internal DataTable GetStudentData_ImprovementExam(string College, string ExamType, string BranchName, string paymentStatus, string RollNo, string Semester)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentData_ImprovementExamSP");
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, College);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@BranchName", DbType.AnsiString, BranchName);
                m_DataBase.AddInParameter(selectCommand, "@paymentStatus", DbType.AnsiString, paymentStatus);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
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

        internal DataTable GenerateBatch_BulkPayImprovement(string Data, string Remarks, string SvcID, string CreatedBy, string BranchName, string ExamType, string Semester, string ExamYear, string PaperData)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GenerateBatch_BulkPayImprovementSP");
                m_DataBase.AddInParameter(selectCommand, "@Data", DbType.AnsiString, Data);
                m_DataBase.AddInParameter(selectCommand, "@Remarks", DbType.AnsiString, Remarks);
                m_DataBase.AddInParameter(selectCommand, "@ServiceId", DbType.AnsiString, SvcID);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@BranchName", DbType.AnsiString, BranchName);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);
                m_DataBase.AddInParameter(selectCommand, "@PaperData", DbType.AnsiString, PaperData);
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

        internal DataTable GetChartData(string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, string HonsCode, int ReportType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetChartDataSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@AdmissionYear", DbType.AnsiString, AdmissionYear);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, BranchCode);
                m_DataBase.AddInParameter(selectCommand, "@HonsCode", DbType.AnsiString, HonsCode);
                m_DataBase.AddInParameter(selectCommand, "@ReportType", DbType.AnsiString, ReportType);
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
        internal DataSet GetActivity(string userID, string Semester, string Activity, string ExamYear, string ActionType)
        {
            DataSet oDataSet = new DataSet();
            m_DataBase = Factory.Create(this.ConnectionString);

            DbCommand selectCommand;
            selectCommand = m_DataBase.GetStoredProcCommand("GetActivitySP");
            m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, userID);
            m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
            m_DataBase.AddInParameter(selectCommand, "@Activity", DbType.AnsiString, Activity);
            m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);
            m_DataBase.AddInParameter(selectCommand, "@ActionType", DbType.AnsiString, ActionType);
            oDataSet = m_DataBase.ExecuteDataSet(selectCommand);
            return oDataSet;
        }

        internal DataSet GetZoneConfiguration(string userID, string Semester, string ZoneID, string ExamYear, string ActionType, string BranchCode)
        {
            DataSet oDataSet = new DataSet();
            m_DataBase = Factory.Create(this.ConnectionString);

            DbCommand selectCommand;
            selectCommand = m_DataBase.GetStoredProcCommand("GetZoneConfigurationSP");
            m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, userID);
            m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
            m_DataBase.AddInParameter(selectCommand, "@ZoneID", DbType.AnsiString, ZoneID);
            m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);
            m_DataBase.AddInParameter(selectCommand, "@ActionType", DbType.AnsiString, ActionType);
            m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, BranchCode);
            oDataSet = m_DataBase.ExecuteDataSet(selectCommand);
            return oDataSet;
        }

        internal DataSet GetApplicationCount(string userID)
        {
            DataSet oDataSet = new DataSet();
            m_DataBase = Factory.Create(this.ConnectionString);

            DbCommand selectCommand;
            selectCommand = m_DataBase.GetStoredProcCommand("GetApplicationCountSP");
            m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, userID);
            oDataSet = m_DataBase.ExecuteDataSet(selectCommand);
            return oDataSet;
        }

        internal DataTable GetDrillSemFee(string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, int ReportType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                
                selectCommand = m_DataBase.GetStoredProcCommand("GetDrillSemFeeSP");
                selectCommand.CommandTimeout = 10000;
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@AdmissionYear", DbType.AnsiString, AdmissionYear);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, BranchCode);
                m_DataBase.AddInParameter(selectCommand, "@ReportType", DbType.AnsiString, ReportType);
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

        internal DataTable GetSemFeeCount(string LoginID, int ExamYear, string CollegeCode, string Semester, string BranchCode, string ExamType, int ReportType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetSemFeeSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, BranchCode);
                m_DataBase.AddInParameter(selectCommand, "@ReportType", DbType.AnsiString, ReportType);
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


        internal DataTable GetStudentChart(string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, string HonsCode, int ReportType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentChartSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@AdmissionYear", DbType.AnsiString, AdmissionYear);
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, BranchCode);
                m_DataBase.AddInParameter(selectCommand, "@HonsCode", DbType.AnsiString, HonsCode);
                m_DataBase.AddInParameter(selectCommand, "@ReportType", DbType.AnsiString, ReportType);
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

        internal DataTable GetStudentInternal(string LoginID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetInternalChartSP");
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

        internal DataTable GetPhDAdmninData(string LoginID, string Department, string FromDate, string ToDate, string Status, string AppID, string RollNo, 
            string Mobile, string ResearchCenter, string Discipline, string Specilization)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetPhDAdmninDataSP");//G2G_GetSeniorCitizenDataSP
                selectCommand.CommandTimeout = m_TimeOut;

                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);

                m_DataBase.AddInParameter(selectCommand, "@Mobile", DbType.AnsiString, Mobile);
                m_DataBase.AddInParameter(selectCommand, "@ResearchCenter", DbType.AnsiString, ResearchCenter);
                m_DataBase.AddInParameter(selectCommand, "@Discipline", DbType.AnsiString, Discipline);
                m_DataBase.AddInParameter(selectCommand, "@Specilization", DbType.AnsiString, Specilization);

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

        internal DataTable GetStudentExamData(string G2GUser, int Department, string FromDate, string ToDate, string RollNo, string RegNo, string CollegeCode, string Branch, string ProgramCode, string Session, string Semester, string SubProgram, string Course)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentExamDataSP");
                selectCommand.CommandTimeout = 15 * 60;
                m_DataBase.AddInParameter(selectCommand, "@G2GUser", DbType.AnsiString, G2GUser);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@RegNo", DbType.AnsiString, RegNo);

                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, CollegeCode);
                m_DataBase.AddInParameter(selectCommand, "@BranchName", DbType.AnsiString, Branch);
                m_DataBase.AddInParameter(selectCommand, "@ProgramCode", DbType.AnsiString, ProgramCode);
                m_DataBase.AddInParameter(selectCommand, "@Session", DbType.AnsiString, Session);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);

                m_DataBase.AddInParameter(selectCommand, "@SubProgram", DbType.AnsiString, SubProgram);
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, Course);
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

        internal DataTable GetStudentSemData(string College, string ExamType, string Program, string BranchName, string paymentStatus, string RollNo, string Semester)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentSemDataSP");
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, College);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@Program", DbType.AnsiString, Program);
                m_DataBase.AddInParameter(selectCommand, "@BranchName", DbType.AnsiString, BranchName);
                m_DataBase.AddInParameter(selectCommand, "@paymentStatus", DbType.AnsiString, paymentStatus);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
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

        internal DataSet RecommendedFacultyList(string Year, string Semester, string Department, string Course, string Program, string Subject)
        {
            DataSet oDataSet = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("RecommendedFacultyListSP");
                selectCommand.CommandTimeout = m_TimeOut;                
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, Year);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@DepartmentCode", DbType.AnsiString, Department);
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, Course);
                m_DataBase.AddInParameter(selectCommand, "@ProgramCode", DbType.AnsiString, Program);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, Subject);

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

        internal DataSet GetStudentPracticalPaper(string College, string ExamType, string Course, string Program, string t_Year, string Semester, string PaperCode, string RollNo)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetStudentPracticalPaperSP");
                selectCommand.CommandTimeout = m_TimeOut;
                m_DataBase.AddInParameter(selectCommand, "@CollegeCode", DbType.AnsiString, College);
                m_DataBase.AddInParameter(selectCommand, "@ExamType", DbType.AnsiString, ExamType);
                m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, Course);
                m_DataBase.AddInParameter(selectCommand, "@ProgramCode", DbType.AnsiString, Program);
                m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
                m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, t_Year);
                m_DataBase.AddInParameter(selectCommand, "@SubjectCode", DbType.AnsiString, PaperCode);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
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

        internal DataSet GetActivityCSVTU(string userID, string Semester, string Activity, string ExamYear, string ActionType, string CourseCode)
        {
            DataSet oDataSet = new DataSet();
            m_DataBase = Factory.Create(this.ConnectionString);

            DbCommand selectCommand;
            selectCommand = m_DataBase.GetStoredProcCommand("GetActivitySP");
            m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, userID);
            m_DataBase.AddInParameter(selectCommand, "@Semester", DbType.AnsiString, Semester);
            m_DataBase.AddInParameter(selectCommand, "@Activity", DbType.AnsiString, Activity);
            m_DataBase.AddInParameter(selectCommand, "@ExamYear", DbType.AnsiString, ExamYear);
            m_DataBase.AddInParameter(selectCommand, "@ActionType", DbType.AnsiString, ActionType);
            m_DataBase.AddInParameter(selectCommand, "@CourseCode", DbType.AnsiString, CourseCode);
            oDataSet = m_DataBase.ExecuteDataSet(selectCommand);
            return oDataSet;
        }

    }
}
