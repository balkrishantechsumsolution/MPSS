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
    public class SupervisorBLL : BLLBase
    {
        private SupervisorDAL m_SupervisorDAL;

        public SupervisorBLL()
        {
            m_SupervisorDAL = new SupervisorDAL();
        }

        public void Insert(KIOSKUsers_DT objKIOSKUser_DT, string[] AFields)
        {
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                string t_UNQ = m_SupervisorDAL.GetUNQ(objKIOSKUser_DT.KioskID);
                objKIOSKUser_DT.UNQ = t_UNQ;
                m_SupervisorDAL.Insert(objKIOSKUser_DT, AFields);                
                scope.Complete();                
            }

        }

        public void Update(string RowID, string KioskStatus, string SupervisorComment, string KioskID)
        {
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                m_SupervisorDAL.Update(RowID, KioskStatus, SupervisorComment, KioskID);
                scope.Complete();
            }
        }

        public string GetMaxID()
        {
            return m_SupervisorDAL.GetMaxID();
        }
        
        public DataTable GetCount()
        {
            return m_SupervisorDAL.GetCount();
        }
    }
}
