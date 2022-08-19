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
    public class QuickKIOSKBLL : BLLBase
    {
        private QuickKIOSKDAL m_QuickKIOSKDAL;

        public QuickKIOSKBLL()
        {
            m_QuickKIOSKDAL = new QuickKIOSKDAL();
        }

        public DataTable KIOSKGSKID(string GSKID)
        {
            return m_QuickKIOSKDAL.KIOSKGSKID(GSKID);
        }

        public void Update(KioskRegistration_DT objKioskRegistration_DT, string[] AFields, string[] KIOSKID, KioskAddressDetails_DT objKioskAddressDetails_DT, string[] AAddressFields, string[] KeyField)
        {
            
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                m_QuickKIOSKDAL.UpdateKIOSK(objKioskRegistration_DT, AFields, KIOSKID);
                UpdateAddress(objKioskAddressDetails_DT, AAddressFields, KeyField);
                scope.Complete();
            }

        }

        private void UpdateAddress(KioskAddressDetails_DT AddressDetails_DT, string[] AAddressFields, string[] KeyField)
        {
            m_QuickKIOSKDAL.UpdateAddress(AddressDetails_DT, KeyField, AAddressFields);
        }

    }
}
