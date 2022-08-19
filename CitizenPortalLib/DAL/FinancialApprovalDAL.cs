using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class FinancialApprovalDAL : DALBase
    {
        Database m_DataBase;

        public FinancialApprovalDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public FinancialApprovalDAL()
            : base()
        {

        }

        static string TableName = "DC_RegistrationDetails";

        static string TableLedgerName = "DC_Ledger";

        internal void Insert(DataStructs.LedgerTable_DT objKIOSKFin_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objKIOSKFin_DT, TableLedgerName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal void Update(string RowID, string KioskStatus, string FinancialApprovalComment)
        {
            int ResultRow;
            string Query = "";

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            Query = "Update " + TableName + " Set FinancialStatus = '" + KioskStatus + "', Financercomment = '" + FinancialApprovalComment + "' Where RowID = " + RowID;

            ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
        }

        public DataTable GetCount()
        {
            string m_Role = string.Empty;
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select Sum(Case When FinancialStatus = 'A' Then 1 Else 0 End) As 'Approved',
                                        Sum(Case When FinancialStatus = 'R' Then 1 Else 0 End) As 'Rejected',
                                        Sum(Case When ApprovalStatus ='A' and FinancialStatus IS NULL Then 1 Else 0 End) As 'Pending'
                                        From DC_RegistrationDetails";
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
