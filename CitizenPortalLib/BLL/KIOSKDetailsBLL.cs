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
    public class KIOSKDetailsBLL : BLLBase
    {
        private KIOSKDetailsDAL m_KIOSKDetailsDAL;

        public KIOSKDetailsBLL()
        {
            m_KIOSKDetailsDAL = new KIOSKDetailsDAL();
        }

        public DataTable KIOSKDetail(string KIOSKID)
        {
            return m_KIOSKDetailsDAL.KIOSKDetail(KIOSKID);
        }

        public double GetBalance(string KioskID, int Year)
        {
            return m_KIOSKDetailsDAL.GetBalance(KioskID, Year);
        }

        public void Update(string RowID, string Status, string Remarks)
        {
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                m_KIOSKDetailsDAL.Update(RowID, Status, Remarks);
                scope.Complete();
            }
        }

        public DataTable KIOSKLogin(string LoginId)
        {
            return m_KIOSKDetailsDAL.KIOSKLogin(LoginId);
        }


    }
}
