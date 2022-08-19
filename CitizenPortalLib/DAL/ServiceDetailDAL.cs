using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class ServiceDetailDAL: DALBase
    {
        Database m_DataBase;

        public ServiceDetailDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public ServiceDetailDAL()
            : base()
        {           
            m_DataBase = Factory.Create(this.ConnectionString);
        }

        internal DataSet GetServiceDetail(string ServiceID, string FromDate, string ToDate)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("Report_GetServiceLapseDataSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.AnsiString, FromDate);
                m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.AnsiString, ToDate);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "ReportData", "ReportHeading", "ReportSummary", "ReportSummaryHeading" });
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

        internal DataTable GetActiveServices()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetActiveServicesSP");
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

        internal DataTable GetServices()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetServicesSP");
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
