using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class QuickKIOSKDAL : DALBase
    {
        Database m_DataBase;

        public QuickKIOSKDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public QuickKIOSKDAL()
            : base()
        {

        }

        static string TablemstUser = "mstGSKID";
        static string TableName = "DC_RegistrationDetails";
        static string AddressDBName = "MahaAddress";        
        static string AddressTableName = "trnAddress";
        static string m_AddressConnectionString = "Address";
        static int m_LangId = 1;


        internal DataTable KIOSKGSKID(string GSKID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select *  from mstGSKID where PISID = @PISID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@PISID", DbType.String, GSKID); 
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


        internal void UpdateKIOSK(DataStructs.KioskRegistration_DT objKioskRegistration_DT, string[] AFields, string[] KIOSKID)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetUpdateCommand(objKioskRegistration_DT, TableName, AFields, KIOSKID);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal void UpdateAddress(DataStructs.KioskAddressDetails_DT objKioskAddressDetails_DT, string[] KeyField, string[] AAddressFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetUpdateCommand(objKioskAddressDetails_DT, AddressTableName, AAddressFields, KeyField);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }
    }
}
