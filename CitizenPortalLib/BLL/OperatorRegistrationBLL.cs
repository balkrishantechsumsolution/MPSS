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
    public class OperatorRegistrationBLL : BLLBase
    {
        private OperatorRegistrationDAL m_OperatorRegistrationDAL;

        public OperatorRegistrationBLL()
        {
            m_OperatorRegistrationDAL = new OperatorRegistrationDAL();
        }
        
        public void Insert(OperatorRegistration_DT objOperatorRegistration_DT, string[] AFields)
        {
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                m_OperatorRegistrationDAL.Insert(objOperatorRegistration_DT, AFields);
                scope.Complete();                
            }

        }

        public int ValidateOperator(string OperatorID, string KIOSKID)
        {
            return m_OperatorRegistrationDAL.ValidateOperator(OperatorID, KIOSKID);
        }


        public string GetDistrictCode(string KioskID)
        {
            return m_OperatorRegistrationDAL.GetDistrictCode(KioskID);
        }

        public void UpdateOperator(string RowId, string Password, string Status)
        {
            m_OperatorRegistrationDAL.UpdateOperator(RowId, Password, Status);
        }
    }
}
