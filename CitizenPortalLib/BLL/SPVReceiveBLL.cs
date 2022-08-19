using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CitizenPortalLib.DAL;
using System.Transactions;
using CitizenPortalLib.DataStructs;

namespace CitizenPortalLib.BLL
{
    public class SPVReceiveBLL : BLLBase
    {
        private SPVReceiveDAL m_SPVReceiveDAL;

        public SPVReceiveBLL()
        {
            m_SPVReceiveDAL = new SPVReceiveDAL();
        }
        /*
        public void UpdateV2(string RowID, string KioskStatus, string TopUpApprovalComment, double DC_CLO_BAL, string MonthColumn, string KioskID, int Year, Transaction_DT objTransaction_DT, string[] AFields, string TransactionID)
        {
            string t_TransactionID = "";
            string t_SequenceNo = "";

            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                Year = CommonUtility.GetFinancialYear();

                t_SequenceNo = m_TopUpApprovalDAL.GetSequenceNo();
                TransactionID = TransactionID + t_SequenceNo;
                t_TransactionID = TransactionID;

                if (KioskStatus == "A")
                {
                    m_TopUpApprovalDAL.InsertIntoTransaction(objTransaction_DT, AFields);

                    m_TopUpApprovalDAL.UpdateSequenceNo(KioskID, objTransaction_DT.Service_ID, DC_CLO_BAL, TransactionID, t_SequenceNo);

                    //UpdateIntoLedger(DC_CLO_BAL, MonthColumn, KioskID, Year);
                }

                m_TopUpApprovalDAL.UpdateTopUp(RowID, KioskStatus, TopUpApprovalComment, TransactionID);

                scope.Complete();
            }
        }
        */

        public void ReverseTransaction(SPVReverseTransaction_DT objReverseTransaction_DT, string [] AReverseFields, 
            Transaction_DT objTransaction_DT, string[] AFields, string TransactionID, string PaymentFlag)
        {
            string t_SequenceNo = "";
            ConfirmPaymentBLL t_ConfirmPaymentBLL = new ConfirmPaymentBLL();
            string t_KioskID = "";
            int t_Year = CommonUtility.GetFinancialYear();

            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {

                /** Logic for Locking the Ledger Table **/

                //If the Payment is to be deducted as per configuration
                //if (PaymentFlag.ToUpper() == "S") //From SCA Account
                //{
                //    t_KioskID = objTransaction_DT.Channel_ID.Substring(0, 2);
                //}

                //m_SPVReceiveDAL.UpdateModifiedByInLedger(objTransaction_DT.CreatedBy, t_KioskID, t_Year);
                //m_SPVReceiveDAL.UpdateModifiedByIntrn_TransSequenceNo(objTransaction_DT.CreatedBy); //Logic stopped on 2013-12-16 as of no use in system

                /*************************/

                m_SPVReceiveDAL.InsertIntoTransaction(objTransaction_DT, AFields);

                //t_SequenceNo = t_ConfirmPaymentBLL.GetSequenceNo();
                //TransactionID = TransactionID + t_SequenceNo;
                //m_SPVReceiveDAL.UpdateSequenceNo(objTransaction_DT.Channel_ID, objTransaction_DT.AppID, TransactionID, t_SequenceNo);

                m_SPVReceiveDAL.Insert(objReverseTransaction_DT, AReverseFields);

                scope.Complete();
            }

            //t_TransactionID = m_ConfirmPaymentDAL.GetTransactionID(objConfirmPayment_DT.Service_ID, objConfirmPayment_DT.AppID);
        }

    }
}
