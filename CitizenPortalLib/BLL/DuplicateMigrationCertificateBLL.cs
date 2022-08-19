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
    public class DuplicateMigrationCertificateBLL : BLLBase
    {
        private DuplicateMigrationCertificteDAL m_MigrationCertificateDAL;
        public DuplicateMigrationCertificateBLL()
        {
            m_MigrationCertificateDAL = new DuplicateMigrationCertificteDAL();
        }

        public DataTable InsertMigrationCertificate(NewMigrationCertificate_DT objMigrationCertificate_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_MigrationCertificateDAL.InsertMigrationCertificate(objMigrationCertificate_DT, AFields);
            return t_AppDT;
        }





    }
}
