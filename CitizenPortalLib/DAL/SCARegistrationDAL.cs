using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class SCARegistrationDAL : DALBase
    {
        Database m_DataBase;

        public SCARegistrationDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public SCARegistrationDAL()
            : base()
        {

        }

        static string TableName = "SCA_RegistrationDetails";
        static string ContactTableName = "trnAddress";
        static string m_AddressConnectionString = "Address";
        static string TablemstUser = "mstUsers";
        static string TablemstLedger = "DC_Ledger";

        internal void Insert(DataStructs.SCARegistration_DT objSCARegistration_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objSCARegistration_DT, TableName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal void InsertContactDetails(DataStructs.SCAContactPerson_DT objContactPerson_DT, string[] AContactFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objContactPerson_DT, ContactTableName, AContactFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal string GenerateID(DataStructs.SCARegistration_DT objSCARegistration_DT, DataStructs.SCAUsers_DT objSCAUsers_DT)
        {
            string t_SCAID = "";
            string t_SeqNo = "";
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select SeqNo From GetSCAID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                t_SeqNo = oDataTable.Rows[0]["SeqNo"].ToString();
                t_SCAID = t_SeqNo;

                selectCommand = null;
                selectCommand = DatabaseObject.GetSqlStringCommand("UPDATE " + TableName + " SET SCAID=@SCAID WHERE KeyField=@KeyField");
                DatabaseObject.AddInParameter(selectCommand, "@SCAID", DbType.String, t_SCAID);
                DatabaseObject.AddInParameter(selectCommand, "@KeyField", DbType.String, objSCARegistration_DT.KeyField);
                
                int count = (int)DatabaseObject.ExecuteNonQuery(selectCommand);

                selectCommand = DatabaseObject.GetSqlStringCommand("UPDATE " + TablemstUser + " SET KioskID=@SCAID WHERE UNQ=@UNQ");
                DatabaseObject.AddInParameter(selectCommand, "@SCAID", DbType.String, t_SCAID);
                DatabaseObject.AddInParameter(selectCommand, "@UNQ", DbType.String, objSCAUsers_DT.UNQ);
                count = (int)DatabaseObject.ExecuteNonQuery(selectCommand);

                return t_SCAID;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }

        }


        internal bool ValidateSCA(string CompanyName)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select COUNT(RowID) As Cnt From SCA_RegistrationDetails Where CompanyName = @CompanyName";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                DatabaseObject.AddInParameter(selectCommand, "@CompanyName", DbType.String, CompanyName);                
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                return Convert.ToInt32(oDataTable.Rows[0]["Cnt"].ToString()) > 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal void InsertUsersDetails(DataStructs.SCAUsers_DT objSCAKUsers_DT, string[] AUsersFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objSCAKUsers_DT, TablemstUser, AUsersFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal void InsertIntoLedger(DataStructs.LedgerTable_DT objSCAFin_DT, string[] ALedgerFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objSCAFin_DT, TablemstLedger, ALedgerFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }
    }
}
