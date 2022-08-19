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
    public class TopUpApprovalBLL : BLLBase
    {
        private TopUpApprovalDAL m_TopUpApprovalDAL;        

        public TopUpApprovalBLL()
        {
            m_TopUpApprovalDAL = new TopUpApprovalDAL();
        }

        private void UpdateIntoTopUp(string RowID, string KioskStatus, string TopUpApprovalComment, string TransactionID)
        {
            m_TopUpApprovalDAL.UpdateTopUp(RowID, KioskStatus, TopUpApprovalComment, TransactionID);
        }

        private void UpdateIntoLedger(double DC_CLO_BAL, string MonthColumn, string KioskID, int Year)
        {
            m_TopUpApprovalDAL.UpdateIntoLedger(DC_CLO_BAL, MonthColumn, KioskID, Year);
        }

        public void UpdateV2(string RowID, string KioskStatus, string TopUpApprovalComment, double DC_CLO_BAL, string MonthColumn, string KioskID, int Year, Transaction_DT objTransaction_DT, string[] AFields, string TransactionID)
        {
            string t_TransactionID = "";
            string t_SequenceNo = "";
            ConfirmPaymentBLL t_ConfirmPaymentBLL = new ConfirmPaymentBLL();

            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                Year = CommonUtility.GetFinancialYear();

                //t_SequenceNo = m_TopUpApprovalDAL.GetSequenceNo();
                t_SequenceNo = t_ConfirmPaymentBLL.GetSequenceNo();
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

        /*
        public void Update(string RowID, string KioskStatus, string TopUpApprovalComment, double DC_CLO_BAL, string MonthColumn, string KioskID, int Year, Transaction_DT objTransaction_DT, string[] AFields, string TransactionID)
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
                    UpdateIntoLedger(DC_CLO_BAL, MonthColumn, KioskID, Year);                    
                }
                
                m_TopUpApprovalDAL.UpdateTopUp(RowID, KioskStatus, TopUpApprovalComment, TransactionID);

                scope.Complete();
            }
        }
        */
        private void InsertIntoTransaction(Transaction_DT objTransaction_DT, string[] AFields)
        {
            m_TopUpApprovalDAL.InsertIntoTransaction(objTransaction_DT, AFields);
        }

        public DataTable GetCount()
        {
            return m_TopUpApprovalDAL.GetCount();
        }
               
    }
}
