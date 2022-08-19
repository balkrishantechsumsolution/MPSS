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
    internal class MigrationCertificatetable2DAL: DALBase
    {
        Database m_DataBase;
        internal DataTable InsertMigrationCertificatetb2(NewMigrationCertificateTable2_DT objMigrationCertificatetb2_DT, string[] AFields2)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objMigrationCertificatetb2_DT, "InsertLegacyMigrationCertificatetable2SP", AFields2);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }


    }

}
