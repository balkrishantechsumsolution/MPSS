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
    public class CommmissionCreditBLL : BLLBase
    {
        private CommmissionCreditDAL m_CommmissionCreditDAL;
        private NationalParkDAL m_NationalParkDAL;
        RecordTopUpDAL m_RecordTopUpDAL = new RecordTopUpDAL();
        RecordTopUp_DT objRecordTopUp_DT = new RecordTopUp_DT();
        RecordTopUpBLL m_RecordTopUpBLL = new RecordTopUpBLL();

        TopUpApprovalBLL m_TopUpApprovalBLL = new TopUpApprovalBLL();
        Transaction_DT objTransaction_DT = new Transaction_DT();

        public CommmissionCreditBLL()
        {
            m_CommmissionCreditDAL = new CommmissionCreditDAL();
        }

        public DataTable GetCommissionData(string Month)
        {
            return m_CommmissionCreditDAL.GetCommissionData(Month);
        }


        public void InsertCommission(CommissionCredited_DT objCommissionCredited_DT, string[] AFields, RecordTopUp_DT objRecordTopUp_DT, string[] ATopups,
            string KioskStatus, string TopUpApprovalComment, double DC_CLO_BAL, string MonthColumn, string KioskID, int Year, Transaction_DT objTransaction_DT, string[] ATrans, string TransactionID)
        {
            m_NationalParkDAL = new NationalParkDAL();
            string t_SequenceNo = "";
            string t_ApplicationName = "CommissionCredit";
            string Prefix = "RCC";
            string t_RowId = "";
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                t_SequenceNo = m_NationalParkDAL.GetSequenceNo(t_ApplicationName, Prefix);
                objCommissionCredited_DT.SeqNo = t_SequenceNo;
                m_CommmissionCreditDAL.InsertCommission(objCommissionCredited_DT, AFields);
                objRecordTopUp_DT.ReferenceNo = t_SequenceNo;
                m_RecordTopUpDAL.Insert(objRecordTopUp_DT, ATopups);
                t_RowId = m_CommmissionCreditDAL.GetTopUpRowId(t_SequenceNo);
                m_TopUpApprovalBLL.UpdateV2(t_RowId, KioskStatus, TopUpApprovalComment, DC_CLO_BAL, MonthColumn, KioskID, Year, objTransaction_DT, ATrans, TransactionID);
                scope.Complete();
            }
        }
        
    }
}
