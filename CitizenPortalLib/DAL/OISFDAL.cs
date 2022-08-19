using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CitizenPortalLib.DataStructs;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace CitizenPortalLib.DAL
{
    internal class OISFDAL:DALBase
    {
        Database m_DataBase;
        int m_TimeOut = 120;

        internal DataTable InsertConstableData(OISFProfile_DT objOISF_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objOISF_DT, "InsertOISFProfileV2SP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable GetOISFWrittenResult()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetOISFWrittenResultSP");
                

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

        internal DataSet OSIFGetScoreSheet(string mAppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("OSIFGetScoreSheetSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, mAppID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails", "ScoreDetails"});
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

        internal DataSet OSIF_GetAdmitCard(string m_ServiceID, string m_AppID)
        {            
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("OSIFAdmitCardSP");
                m_DataBase.AddInParameter(selectCommand, "@SvcID", DbType.AnsiString, m_ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, m_AppID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails" });
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
    
        internal DataSet OSIFScrutinyData(string m_ServiceID, string LoginID, string DistrictCode, string Category, string FromDate, string ToDate)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("OSIF_ScrutinyDataSP");
                m_DataBase.AddInParameter(selectCommand, "@SvcID", DbType.AnsiString, m_ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@Category", DbType.AnsiString, Category);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                selectCommand.CommandTimeout = m_TimeOut;

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails"});
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

        internal DataTable GetOISFGradeSheet(string LoginID, string DOB, string AppID, string Mobile, string RollNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetOISFScoreSheetSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@DOB", DbType.AnsiString, DOB);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@Mobile", DbType.AnsiString, Mobile);
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
        
        internal DataTable GetOISFAppID(string LoginID, string DOB, string AppID, string Mobile, string RollNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetOISFAppIDSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@DOB", DbType.AnsiString, DOB);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@Mobile", DbType.AnsiString, Mobile);
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

        internal DataTable GetOISFFailedSMSReport()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetOISFFailedSMSReport");
                
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

        internal DataTable VerifyPayment(string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("OISF_VerifyPaymentSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
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

        internal DataTable InsertEPassLog(string rollNo, string appId)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("InsertEPassLogSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, rollNo);
                m_DataBase.AddInParameter(selectCommand, "@AppId", DbType.AnsiString, appId);

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

        internal DataSet ScrutinyApplication(string ServiceID, string RowID, string Action, string Reason, string Remarks, string LoginID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("OSIFScrutinyActionSp");
                m_DataBase.AddInParameter(selectCommand, "@SvcID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@RowID", DbType.AnsiString, RowID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, string.Empty);
                m_DataBase.AddInParameter(selectCommand, "@Action", DbType.AnsiString, Action);
                m_DataBase.AddInParameter(selectCommand, "@Reason", DbType.AnsiString, Reason);
                m_DataBase.AddInParameter(selectCommand, "@Remarks", DbType.AnsiString, Remarks);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, LoginID);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails" });
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

        internal DataSet GetOISFAppDetails(string ServiceID, string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetConstableDataSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails", "TransDetails", "TrackStatus", "EducationDetails" });
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
        //
        internal DataSet GetOISFAppDetailsBattalionOffLine(string ServiceID, string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetBattalionOfflineDataSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails", "TransDetails", "TrackStatus", "EducationDetails" });
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
        //

        internal DataTable InsertManualDetail(string battalionID, string draftNo, string formNo, string CreatedBy)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("InsertManualOISFSP");
                m_DataBase.AddInParameter(selectCommand, "@BattalionID", DbType.AnsiString, battalionID);
                m_DataBase.AddInParameter(selectCommand, "@DraftNo", DbType.AnsiString, draftNo);
                m_DataBase.AddInParameter(selectCommand, "@FormNo", DbType.AnsiString, formNo);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, formNo);

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

        internal DataSet SubmitPayment(string m_ServiceID, string m_AppID, string CreatedBy, string UserType, string SBIRefNo)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("OSIF_SubmitPaymentSP");
                m_DataBase.AddInParameter(selectCommand, "@SvcID", DbType.AnsiString, m_ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, m_AppID);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@UserType", DbType.AnsiString, UserType);
                m_DataBase.AddInParameter(selectCommand, "@SBIRefNo", DbType.AnsiString, SBIRefNo);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails" });
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

        internal DataSet OSIF_GetEPassData(string m_ServiceID, string m_AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("OSIF_GetEPassDataSP");
                m_DataBase.AddInParameter(selectCommand, "@SvcID", DbType.AnsiString, m_ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, m_AppID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails" });
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

        internal DataTable GetPoliceStation(string stateCode, string districtCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetPoliceStationSP");
                m_DataBase.AddInParameter(selectCommand, "@StateCode", DbType.AnsiString, stateCode);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, districtCode);
                
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

        internal DataTable GetRTOList(string districtCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetRTOListSP");
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, districtCode);
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

        internal DataTable GetEmploymentExchange(string districtCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetEmploymentExchangeSP");
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, districtCode);
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

        internal DataTable GetEducationBoard(string stateCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetEducationBoardSP");
                m_DataBase.AddInParameter(selectCommand, "@StateCode", DbType.AnsiString, stateCode);                
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

        internal DataSet OSIFGetGrievanceForm(string mAppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("OSIFGetGrievanceFormSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, mAppID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails", "ScoreDetails" });
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

        internal DataTable InsertGrievance(string AppID, string RollNo, string Mobile, string Subject, string Greivance)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("InsertOISFGrievanceSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@AppId", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@Mobile", DbType.AnsiString, Mobile);
                m_DataBase.AddInParameter(selectCommand, "@Subject", DbType.AnsiString, Subject);
                m_DataBase.AddInParameter(selectCommand, "@Grievance", DbType.AnsiString, Greivance);

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

        internal DataTable GetOISFGrievance(string LoginID, string DOB, string AppID, string Mobile, string RollNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetOISFGrievanceSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@DOB", DbType.AnsiString, DOB);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@Mobile", DbType.AnsiString, Mobile);
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

        internal DataTable GetOISFGrievanceReport(string DateFrom, string DateTo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetOISFGrievanceDataSP");
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

        internal DataTable GetQualifiedPETData(string AppID, string RollNo, string Mobile)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetQualifiedPETDataSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
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

        internal DataTable EAdmitCardLog(string rollNo, string appId)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("InsertAdmitCardSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, rollNo);
                m_DataBase.AddInParameter(selectCommand, "@AppId", DbType.AnsiString, appId);

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


        internal DataTable UploadCasteCertificate(string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("OISFVerifyUploadedSEBCSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
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

    }
}
