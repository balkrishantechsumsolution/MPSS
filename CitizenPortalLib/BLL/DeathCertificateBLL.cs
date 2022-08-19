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
    public class DeathCertificateBLL : BLLBase
    {
        private DeathCertificateDAL m_DeathCertificateDAL;
        public DeathCertificateBLL()
        {
            m_DeathCertificateDAL = new DeathCertificateDAL();
        }

        public DataTable Insert(DeathCertificate_DT objDeathCertificate_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_DeathCertificateDAL.Insert(objDeathCertificate_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_DeathCertificateDAL.GetAppDetails(ServiceID, AppID);

            return t_AppDS;
        }

    }
}
