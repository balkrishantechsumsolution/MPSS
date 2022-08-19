using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CitizenPortalLib.DAL;
using System.Transactions;
using CitizenPortalLib.DataStructs;

namespace CitizenPortalLib.BLL
{
    public class ReversalBLL: BLLBase
    {
        private ReversalDAL m_ReversalDAL;

        public ReversalBLL()
        {
            m_ReversalDAL = new ReversalDAL();
        }

        public void ReverseTransaction(ReverseTransaction_DT objReverseTransaction_DT, string[] AReverseFields,
            Transaction_DT objTransaction_DT, string[] AFields, string TransactionID, string PaymentFlag)
        {            
            ConfirmPaymentBLL t_ConfirmPaymentBLL = new ConfirmPaymentBLL();            
            int t_Year = CommonUtility.GetFinancialYear();

            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {                
                m_ReversalDAL.InsertIntoTransaction(objTransaction_DT, AFields);

                m_ReversalDAL.Insert(objReverseTransaction_DT, AReverseFields);

                scope.Complete();
            }            
        }

    }
}
