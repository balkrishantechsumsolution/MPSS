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
    public class FinancialApprovalBLL : BLLBase
    {
        private FinancialApprovalDAL m_FinancialApprovalDAL;

        public FinancialApprovalBLL()
        {
            m_FinancialApprovalDAL = new FinancialApprovalDAL();
        }

        private void InsertIntoLedger(LedgerTable_DT objKIOSKFin_DT, string[] AFields)
        {
            m_FinancialApprovalDAL.Insert(objKIOSKFin_DT, AFields);
        }

        public void Update(string RowID, string KioskStatus, string FinancialApprovalComment, LedgerTable_DT objKioskFinance_DT, string[] FinanceFields)
        {
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                m_FinancialApprovalDAL.Update(RowID, KioskStatus, FinancialApprovalComment);
                InsertIntoLedger(objKioskFinance_DT, FinanceFields);
                scope.Complete();
            }
        }

        public DataTable GetCount()
        {
            return m_FinancialApprovalDAL.GetCount();
        }

    }
}
