using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;

namespace CitizenPortalLib.DAL
{
    public class RecordTopUpDAL : DALBase
    {
        Database m_DataBase;

        public RecordTopUpDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public RecordTopUpDAL()
            : base()
        {

        }

        static string TableName = "DC_KioskTopUp";
        static string TableBank = "mstBank";

        internal void Insert(DataStructs.RecordTopUp_DT objRecordTopUp_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objRecordTopUp_DT, TableName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }


        internal bool ValidateReferenceNo(string ReferenceNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select COUNT(RowID) As Cnt From DC_KioskTopUp Where ReferenceNo = @ReferenceNo";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                DatabaseObject.AddInParameter(selectCommand, "@ReferenceNo", DbType.AnsiString, ReferenceNo);
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

        internal bool ValidateChequeNo(string ChequeNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select COUNT(RowID) As Cnt From DC_KioskTopUp Where Transaction_No = @ChequeNo";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                DatabaseObject.AddInParameter(selectCommand, "@ChequeNo", DbType.AnsiString, ChequeNo);
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

        internal DataTable GetBankName()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select Distinct BankName from mstBank where state = 'MAHARASHTRA'";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);                
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                return oDataTable;
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


        internal DataTable GetBankBranch(string Bank)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select * from mstBank where state = 'MAHARASHTRA' And BankName = @Bank";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                DatabaseObject.AddInParameter(selectCommand, "@Bank", DbType.AnsiString, Bank);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                return oDataTable;
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

        internal DataTable GetBankDetail(string Bank, string Branch)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select * from mstBank where state = 'MAHARASHTRA' And BankName = @Bank And Branch = @Branch";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                DatabaseObject.AddInParameter(selectCommand, "@Bank", DbType.AnsiString, Bank);
                DatabaseObject.AddInParameter(selectCommand, "@Branch", DbType.AnsiString, Branch);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                return oDataTable;
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


        internal DataTable GetMOLBank()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select * from mstBank where state = 'MAHARASHTRA' And MOLBank = 'Y'";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                return oDataTable;
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
    }
}
