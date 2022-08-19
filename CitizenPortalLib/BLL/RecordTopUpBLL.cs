using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CitizenPortalLib.DAL;
using CitizenPortalLib.DataStructs;
using System.Transactions;
using System.Data;

namespace CitizenPortalLib.BLL
{
    public class RecordTopUpBLL : BLLBase
    {
        private RecordTopUpDAL m_RecordTopUpDAL;

        public RecordTopUpBLL()
        {
            m_RecordTopUpDAL = new RecordTopUpDAL();
        }

        public void Insert(RecordTopUp_DT TopDetails, string[] AFields)
        {
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                m_RecordTopUpDAL.Insert(TopDetails, AFields);
                scope.Complete();
            }            
        }

        public bool ValidateReferenceNo(string ReferenceNo)
        {
            return m_RecordTopUpDAL.ValidateReferenceNo(ReferenceNo);             
        }

        public bool ValidateChequeNo(string ChequeNo)
        {
            return m_RecordTopUpDAL.ValidateChequeNo(ChequeNo);
        }

        public DataTable GetBankName()
        {
            return m_RecordTopUpDAL.GetBankName();
        }

        public DataTable GetBankBranch(string Bank)
        {
            return m_RecordTopUpDAL.GetBankBranch(Bank);
        }

        public DataTable GetBankDetail(string Bank, string Branch)
        {
            return m_RecordTopUpDAL.GetBankDetail(Bank, Branch);
        }

        public DataTable GetMOLBank()
        {
            return m_RecordTopUpDAL.GetMOLBank();
        }
    }
}
