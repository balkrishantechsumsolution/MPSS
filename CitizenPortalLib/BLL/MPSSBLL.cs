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
    public class MPSSBLL: BLLBase
    {
        private MPSSDAL m_MPSSDAL;
        public MPSSBLL()
        {
            m_MPSSDAL = new MPSSDAL();
        }

        public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_MPSSDAL.GetAppDetails(ServiceID, AppID);

            return t_AppDS;
        }

        public DataTable UpdateSchoolProfile(SchoolDetail_DT t_SUCollege_DT, string[] aFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_MPSSDAL.UpdateSchoolProfile(t_SUCollege_DT, aFields);
            return t_AppDT;
        }
    }
}
