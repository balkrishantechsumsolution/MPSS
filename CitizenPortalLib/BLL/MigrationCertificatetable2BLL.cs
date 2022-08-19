using CitizenPortalLib.DAL;
using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitizenPortalLib.BLL
{
    public class MigrationCertificatetable2BLL : BLLBase
    {
        private MigrationCertificatetable2DAL m_MigrationCertificatetable2DAL;
        public MigrationCertificatetable2BLL()
        {
            m_MigrationCertificatetable2DAL = new MigrationCertificatetable2DAL();
        }
        public DataTable InsertMigrationCertificatetb2(NewMigrationCertificateTable2_DT objDivisionalMrksheet_DT, string[] AFields2)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_MigrationCertificatetable2DAL.InsertMigrationCertificatetb2(objDivisionalMrksheet_DT, AFields2);
            return t_AppDT;
        }


    }
}
