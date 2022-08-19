using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    internal class ReversalDAL : DALBase
    {
        Database m_DataBase;

        public ReversalDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public ReversalDAL()
            : base()
        {
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
        }

        static string TransactionTableName = "DC_TransactionDetails";
        static string ReverseTransactionTableName = "ReverseTransaction";

        internal void InsertIntoTransaction(DataStructs.Transaction_DT objTransaction_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();            

            cmdInsert = qb.GetInsertCommand(objTransaction_DT, TransactionTableName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal void Insert(DataStructs.ReverseTransaction_DT objReverseTransaction_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();            

            cmdInsert = qb.GetInsertCommand(objReverseTransaction_DT, ReverseTransactionTableName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }
   

    }
}
