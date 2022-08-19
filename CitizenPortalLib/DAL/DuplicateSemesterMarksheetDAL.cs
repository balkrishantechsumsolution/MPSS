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

    internal class DuplicateSemesterMarksheetDAL : DALBase
    {
        Database m_DataBase;

        internal DataTable InsertDuplicateSemesterMarksheet(NewDuplicateSemesterMarksheet_DT objNewDuplicateSemesterMarksheet_DT, string[] aFields2)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objNewDuplicateSemesterMarksheet_DT, "InsertDuplicateDivisionalMarksheetSP", aFields2);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }
    }

}
