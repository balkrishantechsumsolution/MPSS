using CitizenPortalLib.DataStructs;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitizenPortalLib.DAL
{
    internal class DivisionalMarksheetDAL : DALBase
    {
        Database m_DataBase;

        internal DataTable InsertDivisionalMarksheet(DivisionalMarksheet_DT objDivisionalMarksheet_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objDivisionalMarksheet_DT, "InsertLegacyDuplicateMarksheetSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }
    }
   }
