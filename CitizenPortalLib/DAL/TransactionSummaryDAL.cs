using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;
using System.Web;

namespace CitizenPortalLib.DAL
{
    public class TransactionSummaryDAL : DALBase
    {
        Database m_DataBase;

        public TransactionSummaryDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public TransactionSummaryDAL()
            : base()
        {

        }

        static string TableName = "mstServices";

        public DataTable GetServices()
        {
            string m_Role = string.Empty;
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                 if (HttpContext.Current.Session["sRole"] != null && HttpContext.Current.Session["sRole"].ToString() != "")
                 {
                     m_Role = HttpContext.Current.Session["sRole"].ToString();
                 }
                DbCommand selectCommand;
                //String SQLCommand = "Select SvcName, SvcID from mstServices where SvcID Is Not Null And IsNull(SvcName, '') <> '' And Client in ('114', '120') And SvcPaid = 1 And role like '%" + m_Role + "%' Order By SvcName";
                String SQLCommand = "Select * from G2CServices  where Client = '120' and svcPaid = '1' and Status <> 'Pending' and GRUP = '10001' order by SvcName";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
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

        public DataTable GetServicesAdmin()
        {
            string m_Role = string.Empty;
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select SvcName, SvcID from mstServices where SvcID Is Not Null And IsNull(SvcName, '') <> '' And Client in ('114', '120') And SvcPaid = 1 And role like '%CSCAdminS%' Order By SvcName";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
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
