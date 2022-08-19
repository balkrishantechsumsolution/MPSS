using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using CitizenPortalLib.DAL;
using System.Data;
using CitizenPortalLib.DataStructs;
using System.Transactions;

namespace CitizenPortalLib.BLL
{
    public class TopupWalletBLL : BLLBase
    {
        private TopupWalletDAL m_TopupWalletDAL;

        public TopupWalletBLL()
        {
            m_TopupWalletDAL = new TopupWalletDAL();
        }

        string  GetDisSubDistCode(string KOISKID)
        {
            DataTable dt=m_TopupWalletDAL.GetDisSubDistCode(KOISKID);
            return String.Format("{0:000}", dt.Rows[0]["District_Code"]) + String.Format("{0:00000}", dt.Rows[0]["Taluka_code"]);
        }

        public DataTable GetCurrentBal(string KOISKID)
        {
            return m_TopupWalletDAL.GetCurrentBal(KOISKID);
        }

        public DataTable GetDC_RegistrationDetails(string KOISKID)
        {
            return m_TopupWalletDAL.GetDC_RegistrationDetails(KOISKID);
        }

        public DataTable GetWalletBal(string TrnID)
        {
            return m_TopupWalletDAL.GetWalletBal(TrnID);
        }

        string GetSequenceNo()
        {
            return m_TopupWalletDAL.GetSequenceNo();
        }

        public string GetTrnsSequenceNo()
        {
            return m_TopupWalletDAL.GetTrnsSequenceNo();
        }

        public string Insert(DataStructs.WalletBal_DT objWalletBal_DT, string[] AFields)
        {
            string PGTrnID = "";
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                string seq_No = String.Format("{0:00000000}", (Convert.ToInt64((Convert.ToString(GetSequenceNo())==""?"0":Convert.ToString(GetSequenceNo()))) + 1));
                string t_date = String.Format("{0:yyyyMMdd}", DateTime.Now);

                objWalletBal_DT.PGTrnID = objWalletBal_DT.ServiceID + t_date + seq_No;
                objWalletBal_DT.SequenceNo = seq_No;
                //objWalletBal_DT.AppID = GetDisSubDistCode(objWalletBal_DT.ChannelID) + objWalletBal_DT.ServiceID + String.Format("{0:00000000}", Convert.ToInt64(GetTrnsSequenceNo()));  // 012 - District Code , 34567 - Sub District (taluka) , 4 digit Service ID , 8 digit SeqNo

                m_TopupWalletDAL.Insert(objWalletBal_DT, AFields);
                scope.Complete();

                PGTrnID = objWalletBal_DT.PGTrnID;

            }
            return PGTrnID;
        }

        public void Insert(DataStructs.Transaction_DT objTransaction_DT, string[] ATransactionFields,
            DataStructs.LedgerTable_DT objLedgerTable_DT, string[] AFields, string[] AFieldsKey, 
            DataStructs.WalletBal_DT objWalletBal_DT, string[] AWalletBalFields, string[] AWalletBalKey)
        {
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                string seq_No = String.Format("{0:00000000}", (Convert.ToInt64((Convert.ToString(GetTrnsSequenceNo()) == "" ? "0" : Convert.ToString(GetTrnsSequenceNo()))) + 1));
                string t_date = String.Format("{0:yyyyMMdd}", DateTime.Now);

                objTransaction_DT.TrnID = objTransaction_DT.Service_ID + t_date + seq_No;
                objTransaction_DT.SequenceNo = seq_No;
                
                m_TopupWalletDAL.Insert(objTransaction_DT, ATransactionFields);
                Update(objLedgerTable_DT, AFields, AFieldsKey);

                objWalletBal_DT.TrnID = objTransaction_DT.TrnID;
                
                Update(objWalletBal_DT, AWalletBalFields, AWalletBalKey);

                scope.Complete();
            }            
        }

        void Update(DataStructs.LedgerTable_DT objLedgerTable_DT, string[] AFields, string[] AFieldsKey)
        {
            m_TopupWalletDAL.Update(objLedgerTable_DT, AFields, AFieldsKey);
        }

        public void Update(DataStructs.WalletBal_DT objWalletBal_DT, string[] AFields, string[] AFieldsKey)
        {
            m_TopupWalletDAL.Update(objWalletBal_DT, AFields, AFieldsKey);
        }
    }
}
