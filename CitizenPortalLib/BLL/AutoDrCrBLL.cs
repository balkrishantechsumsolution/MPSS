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
    public class AutoDrCrBLL :BLLBase
    {
        private AutoDrCrDAL m_AutoDrCrDAL;
        TopUpApprovalDAL m_TopUpApprovalDAL = new TopUpApprovalDAL();

        public AutoDrCrBLL()
        {
            m_AutoDrCrDAL = new AutoDrCrDAL();
        }


        public void AutoDrCr(string RowID, string TopUpApprovalComment, double DC_CLO_BAL, string MonthColumn, string KioskID, int Year, Transaction_DT objTransaction_DT, string[] AFields, string TransactionID, AutoDrCrLog_DT objAutoDrCrLog_DT, string[] AFieldLog)
        {

            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                objAutoDrCrLog_DT.Status = "Pending";
                m_AutoDrCrDAL.Insert(objAutoDrCrLog_DT, AFieldLog);
                m_AutoDrCrDAL.InsertIntoTransaction(objTransaction_DT, AFields);
                m_AutoDrCrDAL.Update(objAutoDrCrLog_DT.KIOSKId, objAutoDrCrLog_DT.ApplicationID);

                scope.Complete();
            }
            
        }
    }
}
