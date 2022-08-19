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
    public class BirthCertificateBLL: BLLBase
    {
        private BirthCertificateDAL m_BirthCertificateDAL;
        public BirthCertificateBLL()
        {
            m_BirthCertificateDAL = new BirthCertificateDAL();
        }

        public DataTable Insert(BirthCertificate_DT objBirthCertificate_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_BirthCertificateDAL.Insert(objBirthCertificate_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_BirthCertificateDAL.GetAppDetails(ServiceID, AppID);

            return t_AppDS;
        }

    }
}
