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
    public class KioskRegistrationStepIIBLL : BLLBase
    {
        private KiosRegistrationStepIIDAL m_KioskRegistrationStepIIDAL;

        SupervisorBLL m_SupervisorBLL = new SupervisorBLL();

        public KioskRegistrationStepIIBLL()
        {
            m_KioskRegistrationStepIIDAL = new KiosRegistrationStepIIDAL();
        }

        public void Update(KioskRegistrationStepII_DT objKioskRegistrationStepII_DT, string[] AFields, string[] KioskRegistrationStepIIKeyFields, 
            KIOSKUsers_DT objKIOSKUsers_DT, string [] AKioskUsersFields)
        {
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                m_KioskRegistrationStepIIDAL.Update(objKioskRegistrationStepII_DT, AFields, KioskRegistrationStepIIKeyFields);
                m_SupervisorBLL.Insert(objKIOSKUsers_DT, AKioskUsersFields);
                scope.Complete();
            }

        }

        public string GetPaymentType(string KIOSKID)
        {
            return m_KioskRegistrationStepIIDAL.GetPaymentType(KIOSKID);
        }
        
        public void GetDetails(string KeyField, ref string VillageCode, ref string DistrictCode)
        {
            m_KioskRegistrationStepIIDAL.GetDetails(KeyField, ref VillageCode, ref DistrictCode);
        }
    }
}
