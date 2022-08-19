using CitizenPortalLib.DataStructs;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace CitizenPortalLib.DAL
{
    public class ResidenceDAL : DALBase
    {
        public string CurrentCulture { get; set; }
        private Database m_DataBase;
        DataTable datatable = null;
        public ResidenceDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {
        }
        public ResidenceDAL()
            : base()
        {
        }

        internal DataTable GetResidenceDist()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CCTNS_GetResidenceDis");
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
        internal DataTable GetResidenceSubDiv(int DistrictCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CCTNS_GetResidenceSubDiv");
                m_DataBase.AddInParameter(selectCommand, "@DistrictID", DbType.Int32, DistrictCode);
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
        internal DataTable GetResidenceTahsil(int DistrictCode, int SubDivisionCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CCTNS_GetResidenceTahsil");
                m_DataBase.AddInParameter(selectCommand, "@DistrictID", DbType.Int32, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@SubDivisionID", DbType.Int32, SubDivisionCode);
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
        internal DataTable GetResidenceBlock(int DistrictCode, int SubDivisionCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CCTNS_GetResidenceBlock");
                m_DataBase.AddInParameter(selectCommand, "@DistrictID", DbType.Int32, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@SubDivisionID", DbType.Int32, SubDivisionCode);
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
        internal DataTable GetResidenceRI(int DistrictCode, int SubDivisionCode, int TahsilCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CCTNS_GetResidenceRI");
                m_DataBase.AddInParameter(selectCommand, "@DistrictID", DbType.Int32, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@SubDivisionID", DbType.Int32, SubDivisionCode);
                m_DataBase.AddInParameter(selectCommand, "@TahsilID", DbType.Int32, TahsilCode);
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

        internal DataTable InstResidenceDtl(CCTNSResidence residence, string[] aFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();
            m_DataBase = Factory.Create(this.ConnectionString);
            cmdInsert = qb.GetInsertCommandV3(residence, "CCTNS_Residence_INS", aFields);
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }
        internal DataSet GettResidenceDtl(string ServiceID, string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CCTNS_Residence_GET");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "PlotDtl", "CertDtl", "AtthmtDtl", "ApiDtl" });
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
        internal DataTable LocalAdhaarData(string UID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CCTNS_ResiLocalAadharDtl_GET");
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, UID);
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


        internal DataTable LogResidenceEnrollRequest(string appID, string serviceID, string reqString, string ReqFileString, string createdBy)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CCTNS_ResidenceEnrollRequest_INS");
                m_DataBase.AddInParameter(selectCommand, "@APPID", DbType.AnsiString, appID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, serviceID);
                m_DataBase.AddInParameter(selectCommand, "@ReqString", DbType.AnsiString, reqString);
                m_DataBase.AddInParameter(selectCommand, "@ReqFileString", DbType.AnsiString, ReqFileString);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, createdBy);
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

        internal DataTable LogResidenceAPIRequest(string appID, string serviceID, string reqString, string ReqFileString, string createdBy)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CCTNS_ResidenceAPIRequest_INS");
                m_DataBase.AddInParameter(selectCommand, "@APPID", DbType.AnsiString, appID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, serviceID);
                m_DataBase.AddInParameter(selectCommand, "@ReqString", DbType.AnsiString, reqString);
                m_DataBase.AddInParameter(selectCommand, "@ReqFileString", DbType.AnsiString, ReqFileString);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, createdBy);
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

        //CCTNS_ResidenceEnrollRequest_GET
        internal DataTable ResidenceEnrollResponceGet(string appID, string serviceID, bool IsProcessed)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CCTNS_ResidenceEnrollResponce_GET");
                m_DataBase.AddInParameter(selectCommand, "@APPID", DbType.AnsiString, appID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, serviceID);
                m_DataBase.AddInParameter(selectCommand, "@IsProcessed", DbType.Boolean, IsProcessed);
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


        internal DataTable LogResidenceEnrollResponse(CitizenResult CR, string appID, string serviceID, string RespString)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CCTNS_ResidenceEnrollResponse_INS");
                m_DataBase.AddInParameter(selectCommand, "@UAI", DbType.AnsiString, CR.UAI);
                m_DataBase.AddInParameter(selectCommand, "@EID", DbType.AnsiString, CR.EID);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, CR.Status);
                m_DataBase.AddInParameter(selectCommand, "@Msg", DbType.AnsiString, CR.Msg);
                m_DataBase.AddInParameter(selectCommand, "@UAN", DbType.AnsiString, CR.UAN);
                m_DataBase.AddInParameter(selectCommand, "@ApplicationId", DbType.AnsiString, CR.ApplicationId);
                m_DataBase.AddInParameter(selectCommand, "@ApplicationStatus", DbType.AnsiString, CR.ApplicationStatus);
                m_DataBase.AddInParameter(selectCommand, "@DocumentURL", DbType.AnsiString, CR.DocumentURL);
                m_DataBase.AddInParameter(selectCommand, "@APPID", DbType.AnsiString, appID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, serviceID);
                m_DataBase.AddInParameter(selectCommand, "@RespString", DbType.AnsiString, RespString);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CR.CreatedBy);
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

        internal DataTable LogResidenceAPIResponse(CitizenResult CR, string appID, string serviceID, string RespString)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CCTNS_ResidenceAPIResponse_INS");
                m_DataBase.AddInParameter(selectCommand, "@UAI", DbType.AnsiString, CR.UAI);
                m_DataBase.AddInParameter(selectCommand, "@EID", DbType.AnsiString, CR.EID);
                m_DataBase.AddInParameter(selectCommand, "@Status", DbType.AnsiString, CR.Status);
                m_DataBase.AddInParameter(selectCommand, "@Msg", DbType.AnsiString, CR.Msg);
                m_DataBase.AddInParameter(selectCommand, "@UAN", DbType.AnsiString, CR.UAN);
                m_DataBase.AddInParameter(selectCommand, "@ApplicationId", DbType.AnsiString, CR.ApplicationId);
                m_DataBase.AddInParameter(selectCommand, "@ApplicationStatus", DbType.AnsiString, CR.ApplicationStatus);
                m_DataBase.AddInParameter(selectCommand, "@DocumentURL", DbType.AnsiString, CR.DocumentURL);
                m_DataBase.AddInParameter(selectCommand, "@APPID", DbType.AnsiString, appID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, serviceID);
                m_DataBase.AddInParameter(selectCommand, "@RespString", DbType.AnsiString, RespString);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CR.CreatedBy);
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



        internal DataTable ResidenceAPIResponceGet(string appID, string serviceID, bool IsProcessed)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CCTNS_ResidenceAPIResponce_GET");
                m_DataBase.AddInParameter(selectCommand, "@APPID", DbType.AnsiString, appID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, serviceID);
                m_DataBase.AddInParameter(selectCommand, "@IsProcessed", DbType.Boolean, IsProcessed);
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


        internal void ErrorLog(LogError error)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CCTNS_APIErrorLog_GET");
                m_DataBase.AddInParameter(selectCommand, "@Msg", DbType.AnsiString, error.Msg);
                m_DataBase.AddInParameter(selectCommand, "@HelpLink", DbType.AnsiString, error.HelpLink);
                m_DataBase.AddInParameter(selectCommand, "@InnerExp", DbType.AnsiString, error.InnerExp);
                m_DataBase.AddInParameter(selectCommand, "@Data", DbType.AnsiString, error.Data);
                m_DataBase.AddInParameter(selectCommand, "@Source", DbType.AnsiString, error.Source);
                m_DataBase.AddInParameter(selectCommand, "@StackTrace", DbType.AnsiString, error.StackTrace);
                m_DataBase.AddInParameter(selectCommand, "@TargetSite", DbType.AnsiString, error.TargetSite);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, error.ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, error.AppID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                //return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }



        //CCTNS_ResidenceEnrollResponse_JobData

        //internal DataTable ResidenceEnrollResponse_JobData()
        //{
        //    DataTable oDataTable = new DataTable();
        //    IDataReader Reader = null;
        //    m_DataBase = Factory.Create(this.ConnectionString);

        //    try
        //    {
        //        DbCommand selectCommand;
        //        selectCommand = m_DataBase.GetStoredProcCommand("CCTNS_ResidenceEnrollResponse_JobData");
        //        Reader = m_DataBase.ExecuteReader(selectCommand);
        //        if (Reader != null)
        //            oDataTable.Load(Reader);
        //        return oDataTable;
        //    }
        //    finally
        //    {
        //        if (Reader != null)
        //        {
        //            Reader.Close();
        //        }
        //    }
        //}

    }
}
