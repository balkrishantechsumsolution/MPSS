using CitizenPortalLib.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitizenPortalLib.BLL
{
   public  class CitizenDashboardBLL: BLLBase
    {
        //private CitizenDashboradDLL mCitizenDashboradDLL;
        public CitizenDashboardBLL()
        {
            CitizenDashboradDAL mCitizenDashboradDLL = new CitizenDashboradDAL();
            mCitizenDashboradDLL.CurrentCulture = "1";
        }
        public CitizenDashboardBLL(string CurrentCulture)
        {
            mCitizenDashboradDLL = new CitizenDashboradDAL();
            mCitizenDashboradDLL.CurrentCulture = CurrentCulture;
        }

        CitizenDashboradDAL mCitizenDashboradDLL = new CitizenDashboradDAL();
        public DataTable GetCitizenDashboardGrid(string CItiZenUser, string ProfileID, string KeyField)
        {
            DataTable CITIzenid = null;

            CITIzenid = mCitizenDashboradDLL.GetCitizenDashboardGrid(CItiZenUser, ProfileID, KeyField);

            return CITIzenid;
        }

        public DataTable ShowCitizenDashboardGrid(string CItiZenUser)
        {
            DataTable CITIzenid = null;

            CITIzenid = mCitizenDashboradDLL.ShowCitizenDashboardGrid(CItiZenUser);

            return CITIzenid;
        }

        public DataTable GetCitizenMenu(string UserID, string ProfileID, string KeyField)
        {
            DataTable CITIzenid = null;
            CITIzenid = mCitizenDashboradDLL.GetCitizenMenu(UserID, ProfileID, KeyField);
            return CITIzenid;
        }
        public DataTable GetCitiZenDashboardGridForDocumentUpload(string CItiZenUser, string ProfileID, string KeyField)
        {
            DataTable CITIzenid = null;

            CITIzenid = mCitizenDashboradDLL.GetCitiZenDashboardGridForDocumentUpload(CItiZenUser, ProfileID, KeyField);

            return CITIzenid;
        }

        public DataTable GetActiveServices(string CItiZenUser, string ProfileID, string KeyField)
        {
            DataTable CITIzenid = null;

            CITIzenid = mCitizenDashboradDLL.GetActiveServices(CItiZenUser, ProfileID, KeyField);

            return CITIzenid;
        }
    }
}
