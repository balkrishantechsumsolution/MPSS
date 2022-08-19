using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class CommmissionCreditDAL : DALBase
    {
        Database m_DataBase;

        public CommmissionCreditDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public CommmissionCreditDAL()
            : base()
        {

        }

        static string TableName = "DC_KioskTopUp";

        static string TableLedgerName = "DC_Ledger";

        static string TransactionTableName = "DC_TransactionDetails";

        static string TableCommissionCredited = "CommissionCredited";


        public DataTable GetCommissionData(string Where)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select A.OMTID, A.KioskID, B.Year, B.Month, B.Commission 
                                        From DC_RegistrationDetails A
                                        Inner Join 
                                        (
                                        Select Channel_ID, Year(Trans_Date) As Year, Month(Trans_Date) As Month, SUM(VLE) As Commission
                                        From DC_TransactionDetails A
                                        Where A.Trans_Type = 'DR' And A.channel_id Like '13%'
                                        Group By Channel_ID, Year(Trans_Date), Month(Trans_Date)
                                        ) B On A.KioskID = B.Channel_ID
                                        Left Join CommissionCredited C On A.KioskID = C.KioskID And B.Year = C.CreditedYear And B.Month = C.CreditedMonth
                                        Where C.KioskID Is Null";
                if (Where != "")
                    SQLCommand = SQLCommand + Where;

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

        internal void InsertCommission(DataStructs.CommissionCredited_DT objCommissionCredited_DT, string[] AFields)
        {
            //Insert Into CommissionCredited (SeqNo,KeyField,KioskId,LastTransactionDate,CreditedYear,CreditedMonth,AmountCredited,CreatedOn,CreatedBy,Remarks)
            //Values(@SeqNo,@KeyField,@KioskId,@LastTransactionDate,@CreditedYear,@CreditedMonth,@AmountCredited,@CreatedOn,@CreatedBy,@Remarks)
            
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objCommissionCredited_DT, TableCommissionCredited, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal string GetTopUpRowId(string ReferenceNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select RowID From DC_KioskTopUp Where ReferenceNo = @ReferenceNo";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                DatabaseObject.AddInParameter(selectCommand, "@ReferenceNo", DbType.String, ReferenceNo);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                return oDataTable.Rows[0][0].ToString();
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
