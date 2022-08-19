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
 

    internal class DuplicateSemesterMarksheettb2DAL : DALBase
    {

        Database m_DataBase;

        internal DataTable InsertDuplicateSemesterMarksheetTb2(NewDuplicateSemesterMarksheetTb2_DT objNewDuplicateSemesterMarksheetTb2_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objNewDuplicateSemesterMarksheetTb2_DT, "InsertLegacyDuplicateSemesterMarksheettable2SP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }
    }





}
