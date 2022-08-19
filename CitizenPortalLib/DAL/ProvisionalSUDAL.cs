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
    internal class ProvisionalSUDAL:DALBase
    {
        Database m_DataBase;

        internal DataTable InsertProvisionalSU(ProvisionalCertificate_DT objProvisionalSU_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objProvisionalSU_DT, "InsertProvisionalSUSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }
        
        internal DataSet GetProvisionalSU(string ServiceID, string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetProvisionalSUSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails", "TransDetails", "AttachmentDetails", "ActionHistory" });
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
              
        internal DataTable GetDTEAppDetails(string m_AppID, string m_ServiceID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetDTEAppDetailsSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, m_AppID);
                m_DataBase.AddInParameter(selectCommand, "@SvcID", DbType.AnsiString, m_ServiceID);
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
        
        internal DataTable GetManualDataProvisionalSU(string m_AppID, string m_ServiceID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetManualDataProvisionalSUSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, m_AppID);
                m_DataBase.AddInParameter(selectCommand, "@SvcID", DbType.AnsiString, m_ServiceID);
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
               
        internal DataSet GetProvisionalCertificateSU(string ServiceID, string AppID, string RegNo)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetProvisionalSUCertificateSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@RegNo", DbType.AnsiString, RegNo);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails", "ProvisionalSUDetails" });
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
