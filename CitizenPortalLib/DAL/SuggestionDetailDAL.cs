using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class SuggestionDetailDAL : DALBase
    {
        Database m_DataBase;

        public SuggestionDetailDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public SuggestionDetailDAL()
            : base()
        {

        }

        static string TableSugestion = "SuggestionDetail";     

        internal DataTable UserDetail(string UserId)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select * from mstUsers where UNQ = @UserId";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@UserId", DbType.String, UserId); 
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


        internal void Insert(DataStructs.SuggestionDetail_DT objSuggestionDetail_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objSuggestionDetail_DT, TableSugestion, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }
    }
}
