using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class SupervisorDAL : DALBase
    {
        Database m_DataBase;

        public SupervisorDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public SupervisorDAL()
            : base()
        {

        }

        static string TableName = "DC_RegistrationDetails";

        static string TablemstUser = "mstUsers";

        internal void Insert(DataStructs.KIOSKUsers_DT objKIOSKUsers_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objKIOSKUsers_DT, TablemstUser, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal string GetUNQ(string KioskID)
        {            
            string Query = "";
            string t_UNQ = "";

            Query = @"Select MAX(Cast(UNQ As int))+1 As UNQ from mstUsers";
            t_UNQ = ExecuteCommand(Query).Rows[0]["UNQ"].ToString();

            return t_UNQ;            
        }

        internal void Update(string RowID, string KioskStatus, string SupervisorComment, string KioskID)
        {
            int ResultRow;
            string Query = "";

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            Query = "Update " + TableName + " Set ApprovalStatus = '" + KioskStatus + "', SupervisorComment = '" + SupervisorComment + "' Where RowID = " + RowID;

            ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);

            Query = "Update " + TablemstUser + " Set ModifiedBy = 'Supervisor', ModifiedOn = GetDate() Where KioskID = '" + KioskID + "'";

            ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
        }

        internal string GetMaxID()
        {
            string Query = @"Select MAX(Cast(UNQ As Int))+1 As UNQ from mstUsers";
            return ExecuteCommand(Query).Rows[0]["UNQ"].ToString();
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
                String SQLCommand = @"select 
                                        Sum (case When ApprovalStatus = 'A' Then 1 Else 0 End) As  'Approved',
                                        Sum (case when ApprovalStatus = 'R' Then 1 Else 0 End) as  'Rejected',
                                        Sum (case when ApprovalStatus IS NULL Then 1 Else 0 End) as 'Pending'
                                        from DC_RegistrationDetails";
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
