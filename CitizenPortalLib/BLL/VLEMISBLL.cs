using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CitizenPortalLib.DAL;
using System.Data;
using CitizenPortalLib.DataStructs;
using System.Transactions;

namespace CitizenPortalLib.BLL
{
    public class VLEMISBLL : BLLBase
    {
        private VLEMISDAL m_VLEMISDAL;

        public VLEMISBLL()
        {
            m_VLEMISDAL = new VLEMISDAL();
        }

        public DataTable GetVLEMIS(string KioskID,string VLECode, string FromDate, string ToDate)
        {
            return m_VLEMISDAL.GetVLEMIS(KioskID, VLECode, FromDate, ToDate);
        }

        public DataTable GetTransaction(string KioskID, string VLECode, string FromDate, string ToDate, string ServiceID)
        {
            return m_VLEMISDAL.GetDetailVLEMIS(KioskID, VLECode, FromDate, ToDate, ServiceID);
        }

        public DataTable GetCount(string LoginId, bool IsKiosk, string KioskID, bool IsSCA, string SCAID, string VLECode)
        {
            return m_VLEMISDAL.GetCount(LoginId, IsKiosk, KioskID, IsSCA, SCAID, VLECode);
        }
    }
}
