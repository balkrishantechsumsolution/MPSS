using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Transactions;
using CitizenPortalLib.DAL;
using CitizenPortalLib.DataStructs;
using System.Data;

namespace CitizenPortalLib.BLL
{
    public class ConfirmPaymentBLL : BLLBase
    {
        private ConfirmPaymentDAL m_ConfirmPaymentDAL;

        public ConfirmPaymentBLL()
        {
            m_ConfirmPaymentDAL = new ConfirmPaymentDAL();
        }

        public DataTable GetBreakUp(string ServiceID)
        {
            return m_ConfirmPaymentDAL.GetPayBreakup(ServiceID);
        }

        public string InsertV2(Transaction_DT objConfirmPayment_DT, string[] AFields, string TransactionID, string PaymentFlag, string LoginID, string AppId)
        {
            string t_TransactionID = "";
            string t_SequenceNo = "";
            string t_KioskID = "";
            int t_Year = CommonUtility.GetFinancialYear();


            /**************/
            int retryCount = 3;
            bool success = false;
            while (retryCount > 0 && !success)
            {
                try
                {
                    // your sql here


                    /*Start of SQL Logic*/

                    using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
                    {
                        /** Logic for Locking the Ledger Table **/

                        //If the Payment is to be deducted as per configuration
                        //if (PaymentFlag.ToUpper() == "S") //From SCA Account
                        //{
                        //    t_KioskID = objConfirmPayment_DT.Channel_ID.Substring(0, 2);
                        //}

                        //m_ConfirmPaymentDAL.UpdateModifiedByInLedger(objConfirmPayment_DT.CreatedBy, t_KioskID, t_Year);
                        //m_ConfirmPaymentDAL.UpdateModifiedByIntrn_TransSequenceNo(objConfirmPayment_DT.CreatedBy); //Line Commented as on 2013-06-24 for removal of Locking of trn_TransSequenceNo

                        /*************************/


                        m_ConfirmPaymentDAL.Insert(objConfirmPayment_DT, AFields);

                        //t_SequenceNo = m_ConfirmPaymentDAL.GetSequenceNo();
                        //TransactionID = TransactionID + t_SequenceNo;
                        //t_TransactionID = TransactionID;
                        //m_ConfirmPaymentDAL.UpdateSequenceNo(objConfirmPayment_DT.Channel_ID, objConfirmPayment_DT.AppID, TransactionID, t_SequenceNo);


                        //To Update TrackStatus by Niraj
                        //m_ConfirmPaymentDAL.UpdateTrackStatus(LoginID, AppId);

                        if (objConfirmPayment_DT.IsInWorkFlow == "Y")
                        {
                            m_ConfirmPaymentDAL.ExecuteProcedure(objConfirmPayment_DT.Service_ID, objConfirmPayment_DT.AppID, t_TransactionID, 
                                objConfirmPayment_DT.OfficeID, objConfirmPayment_DT.eDistrictCreatedBy);
                        }

                        scope.Complete();
                    }

                    t_TransactionID = m_ConfirmPaymentDAL.GetTransactionID(objConfirmPayment_DT.Service_ID, objConfirmPayment_DT.AppID);

                    /*End of SQL Logic*/

                    success = true;
                }
                catch (System.Data.SqlClient.SqlException exception)
                {
                    if (exception.Number != 1205)
                    {
                        // a sql exception that is not a deadlock 
                        throw;
                    }
                    // Add delay here if you wish. 
                    retryCount--;
                    if (retryCount == 0) throw;
                }
            }

            /**************/            

            return t_TransactionID;
        }

        public DataTable VerifyApplication(string SvcID, string AppID)
        {
            return m_ConfirmPaymentDAL.VerifyApplication(SvcID, AppID);
        }
        public DataTable VerifyApplicationAndPayment(string SvcID, string AppID)
        {
            return m_ConfirmPaymentDAL.VerifyApplicationAndPayment(SvcID, AppID);
        }

        public DataTable GetServiceToPayAtCSC(string KioskID)
        {
            return m_ConfirmPaymentDAL.GetServiceToPayAtCSC(KioskID);
        }

        public bool VerifyRequestAlreadySentOrNot(string KioskID, string AppID, string CreatedBy, string VLEID)
        {
            return m_ConfirmPaymentDAL.VerifyRequestAlreadySentOrNot(KioskID, AppID, CreatedBy, VLEID);
        }

        
        //// Old Logic 
        //public string Insert(Transaction_DT objConfirmPayment_DT, string[] AFields, LedgerTable_DT objLedgerTable_DT, string[] LedgerFields, string[] LedgerKeyColumns,
        //    string TransactionID, string PaymentFlag, string LoginID, string AppId)
        //{
        //    string t_TransactionID = "";
        //    string t_SequenceNo = "";
        //    using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
        //    {
        //        m_ConfirmPaymentDAL.UpdateModifiedByIntrn_TransSequenceNo(objConfirmPayment_DT.CreatedBy);

        //        m_ConfirmPaymentDAL.Insert(objConfirmPayment_DT, AFields);

        //        t_SequenceNo = m_ConfirmPaymentDAL.GetSequenceNo();
        //        TransactionID = TransactionID + t_SequenceNo;
        //        t_TransactionID = TransactionID;
        //        m_ConfirmPaymentDAL.UpdateSequenceNo(objConfirmPayment_DT.Channel_ID, objConfirmPayment_DT.AppID, TransactionID, t_SequenceNo);

        //        //If the Payment is to be deducted as per configuration
        //        if (PaymentFlag.ToUpper() == "S") //From SCA Account
        //        {
        //            string t_SCAID = objLedgerTable_DT.Channel_ID.Substring(0, 2);
        //            int t_Year = CommonUtility.GetFinancialYear();

        //            int t_Count = LedgerFields.Length;
        //            t_Count = t_Count + 1;

        //            List<string> t_TempArray = new List<string>();

        //            t_TempArray.AddRange(LedgerFields);

        //            string[] t_TempFields = null;
        //            //t_TempFields = LedgerFields;
        //            //t_TempFields[t_Count - 1] = "Channel_ID";

        //            t_TempArray.Add("Channel_ID");

        //            t_TempFields = t_TempArray.ToArray();

        //            objLedgerTable_DT.Channel_ID = t_SCAID;

        //            /*
        //             * Check if the SCA Data is present in the Ledger table or not
        //             * if not present, then insert the data in the Ledger Table
        //             */
        //            if (!m_ConfirmPaymentDAL.IfSCALedgerPresent(t_SCAID, t_Year))
        //            {
        //                /* Note : Logic commented on 2012-05-18 as the SCA Account is created in the Ledger Table at the time of SCA Registration, 
        //                 * and hence we have to update the SCA Ledger Account
        //                objLedgerTable_DT.CreatedBy = objLedgerTable_DT.ModifiedBy;
        //                objLedgerTable_DT.CreatedOn = objLedgerTable_DT.ModifiedOn;
        //                objLedgerTable_DT.ModifiedBy = null;
        //                objLedgerTable_DT.ModifiedOn = (DateTime?)null;

        //                m_ConfirmPaymentDAL.InsertLedger(objLedgerTable_DT, t_TempFields);
        //                */
        //            }
        //            else
        //            {
        //                m_ConfirmPaymentDAL.UpdateLedger(objLedgerTable_DT, LedgerFields, LedgerKeyColumns);
        //            }
        //        }
        //        else
        //        {
        //            //From Kiosk Account
        //            m_ConfirmPaymentDAL.UpdateLedger(objLedgerTable_DT, LedgerFields, LedgerKeyColumns);
        //        }
        //        //To Update TrackStatus by Niraj
        //        m_ConfirmPaymentDAL.UpdateTrackStatus(LoginID, AppId);

        //        scope.Complete();
        //    }
        //    return t_TransactionID;
        //}

        public void InsertIntoPaymentConfirmation(DC_PaymentConfirmationDetails objDC_PaymentConfirmationDetails, string[] AFields)
        {
            m_ConfirmPaymentDAL.InsertIntoPaymentConfirmation(objDC_PaymentConfirmationDetails, AFields);
        }

        public void UpdateIntoPaymentConfirmation(DC_PaymentConfirmationDetails objDC_PaymentConfirmationDetails, string[] AFields, string[] AKeyFields)
        {
            m_ConfirmPaymentDAL.UpdateIntoPaymentConfirmation(objDC_PaymentConfirmationDetails, AFields, AKeyFields);
        }

        public void InsertIntoPaymentReversal(DC_PaymentReversalDetails objDC_PaymentReversalDetails, string[] AFields)
        {
            m_ConfirmPaymentDAL.InsertIntoPaymentReversal(objDC_PaymentReversalDetails, AFields);
        }

        public void GetLedgerDetail(string KioskID, int Year, out LedgerTable_DT objLedgerTablePrev_DT)
        {
            DataTable t_DT = m_ConfirmPaymentDAL.GetLedgerDetail(KioskID, Year);

            LedgerTable_DT objLedgerTable_DT = new LedgerTable_DT();

            objLedgerTable_DT.Channel_ID = t_DT.Rows[0]["Channel_ID"].ToString();
            objLedgerTable_DT.Year = Convert.ToInt32(t_DT.Rows[0]["Year"].ToString());
            objLedgerTable_DT.DC_OP_BAL = t_DT.Rows[0]["DC_OP_BAL"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["DC_OP_BAL"].ToString());
            objLedgerTable_DT.DC_CLO_BAL = t_DT.Rows[0]["DC_CLO_BAL"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["DC_CLO_BAL"].ToString());
            objLedgerTable_DT.YRLY_CRTOT = t_DT.Rows[0]["YRLY_CRTOT"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["YRLY_CRTOT"].ToString());
            objLedgerTable_DT.YRLY_DBTOT = t_DT.Rows[0]["YRLY_DBTOT"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["YRLY_DBTOT"].ToString());


            objLedgerTable_DT.apr_crtot = t_DT.Rows[0]["apr_crtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["apr_crtot"].ToString());
            objLedgerTable_DT.apr_dbtot = t_DT.Rows[0]["apr_dbtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["apr_dbtot"].ToString());

            objLedgerTable_DT.may_crtot = t_DT.Rows[0]["may_crtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["may_crtot"].ToString());
            objLedgerTable_DT.may_dbtot = t_DT.Rows[0]["may_dbtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["may_dbtot"].ToString());
            objLedgerTable_DT.jun_crtot = t_DT.Rows[0]["jun_crtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["jun_crtot"].ToString());
            objLedgerTable_DT.jun_dbtot = t_DT.Rows[0]["jun_dbtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["jun_dbtot"].ToString());
            objLedgerTable_DT.jul_crtot = t_DT.Rows[0]["jul_crtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["jul_crtot"].ToString());
            objLedgerTable_DT.jul_dbtot = t_DT.Rows[0]["jul_dbtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["jul_dbtot"].ToString());
            objLedgerTable_DT.aug_crtot = t_DT.Rows[0]["aug_crtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["aug_crtot"].ToString());
            objLedgerTable_DT.aug_dbtot = t_DT.Rows[0]["aug_dbtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["aug_dbtot"].ToString());
            objLedgerTable_DT.sep_crtot = t_DT.Rows[0]["sep_crtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["sep_crtot"].ToString());
            objLedgerTable_DT.sep_dbtot = t_DT.Rows[0]["sep_dbtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["sep_dbtot"].ToString());
            objLedgerTable_DT.oct_crtot = t_DT.Rows[0]["oct_crtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["oct_crtot"].ToString());
            objLedgerTable_DT.oct_dbtot = t_DT.Rows[0]["oct_dbtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["oct_dbtot"].ToString());
            objLedgerTable_DT.nov_crtot = t_DT.Rows[0]["nov_crtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["nov_crtot"].ToString());
            objLedgerTable_DT.nov_dbtot = t_DT.Rows[0]["nov_dbtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["nov_dbtot"].ToString());
            objLedgerTable_DT.dec_crtot = t_DT.Rows[0]["dec_crtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["dec_crtot"].ToString());
            objLedgerTable_DT.dec_dbtot = t_DT.Rows[0]["dec_dbtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["dec_dbtot"].ToString());
            objLedgerTable_DT.jan_crtot = t_DT.Rows[0]["jan_crtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["jan_crtot"].ToString());
            objLedgerTable_DT.jan_dbtot = t_DT.Rows[0]["jan_dbtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["jan_dbtot"].ToString());
            objLedgerTable_DT.feb_crtot = t_DT.Rows[0]["feb_crtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["feb_crtot"].ToString());
            objLedgerTable_DT.feb_dbtot = t_DT.Rows[0]["feb_dbtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["feb_dbtot"].ToString());
            objLedgerTable_DT.mar_crtot = t_DT.Rows[0]["mar_crtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["mar_crtot"].ToString());
            objLedgerTable_DT.mar_dbtot = t_DT.Rows[0]["mar_dbtot"] == DBNull.Value ? 0 : Convert.ToDouble(t_DT.Rows[0]["mar_dbtot"].ToString());

            objLedgerTablePrev_DT = objLedgerTable_DT;
        }

        public string GetSequenceNo()
        {
            return m_ConfirmPaymentDAL.GetSequenceNo();
        }

        public string GetServiceName(string ServiceID)
        {
            return m_ConfirmPaymentDAL.GetServiceName(ServiceID);
        }

        public int GetAppCount(string AppID)
        {
            return m_ConfirmPaymentDAL.GetAppCount(AppID);
        }

        //public void UpdateTrackStatus(string LoginID, string AppId)
        //{
        //    using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
        //    {
        //        m_ConfirmPaymentDAL.UpdateTrackStatus(LoginID, AppId);                
        //        scope.Complete();
        //    }
        //}

        public double GetSCAAmountToDeduct(int PayBreakUpID)
        {
            return m_ConfirmPaymentDAL.GetSCAAmountToDeduct(PayBreakUpID);
        }

        public double GetSCAAmountToDeductV2(string SCAID, string KioskID, string VLEID, int ServiceID, string AppID, int PayBreakUpID)
        {
            return m_ConfirmPaymentDAL.GetSCAAmountToDeductV2(SCAID, KioskID, VLEID, ServiceID, AppID, PayBreakUpID);
        }

        public string GetAppName(string AppID, out string EnglishName, out string MarathiName)
        {
            return m_ConfirmPaymentDAL.GetAppName(AppID, out EnglishName, out MarathiName);
        }

        public string GetAppNameV2(string ServiceID, string LangID, string AppID, out string EnglishName, out string MarathiName)
        {
            return m_ConfirmPaymentDAL.GetAppNameV2(ServiceID, LangID, AppID, out EnglishName, out MarathiName);
        }

        public bool VerifySCADeduction(string p_SCAID)
        {
            return m_ConfirmPaymentDAL.VerifySCADeduction(p_SCAID);
        }

        public string SendToEDistrict(string ServiceID, string KioskID, string VLEID, string UNQ, string ApplicationID)
        {
            return m_ConfirmPaymentDAL.SendToEDistrict(ServiceID, KioskID, VLEID, UNQ, ApplicationID);
        }

        public string GetVLELocation(string ServiceID, string KioskID, string VLEID, string UNQ)
        {
            return m_ConfirmPaymentDAL.GetVLELocation(ServiceID, KioskID, VLEID, UNQ);
        }

        public bool IsCustomAmount(string p_ServiceID)
        {
            return m_ConfirmPaymentDAL.IsCustomAmount(p_ServiceID);
        }

        public decimal GetCustomAmount(string p_ServiceID, string p_ApplicationID)
        {
            return m_ConfirmPaymentDAL.GetCustomAmount(p_ServiceID, p_ApplicationID);
        }

        public DataTable GetCustomBreakUp(string ServiceID, string SCAID, string KioskID, string VLEID)
        {
            return m_ConfirmPaymentDAL.GetCustomBreakUp(ServiceID, SCAID, KioskID, VLEID);
        }

        public DataTable GetCustomBreakUpForSCA(string SCAID)
        {
            return m_ConfirmPaymentDAL.GetCustomBreakUpForSCA(SCAID);
        }

        public int VerifyImages(string AppID, string ServiceID)
        {
            return m_ConfirmPaymentDAL.VerifyImages(AppID, ServiceID);
        }

        public int VerifyDocs(string AppID)
        {
            return m_ConfirmPaymentDAL.VerifyDocs(AppID);
        }

        #region New Logic

        public DataSet GetPaymentDetails(string ServiceID, string AppID, string UserType)
        {
            return m_ConfirmPaymentDAL.GetPaymentDetails(ServiceID, AppID, UserType);
        }

        public DataSet GetSPVPaymentDetails(string ServiceID, string AppID, string UserType)
        {
            return m_ConfirmPaymentDAL.GetSPVPaymentDetails(ServiceID, AppID, UserType);
        }


        public string InsertV3(Transaction_DT objTransaction_DT, string[] AFields)
        {
            string t_TransactionID = "";
            int t_Year = CommonUtility.GetFinancialYear();

            t_TransactionID = m_ConfirmPaymentDAL.InsertV3(objTransaction_DT, AFields);

            return t_TransactionID;
        }

        public string InsertSPVWalletTransaction(Transaction_DT objTransaction_DT, string[] AFields)
        {
            string t_TransactionID = "";
            int t_Year = CommonUtility.GetFinancialYear();

            t_TransactionID = m_ConfirmPaymentDAL.InsertSPVWalletTransaction(objTransaction_DT, AFields);

            return t_TransactionID;
        }

        public string PGAppInsert(PGAppRequest_DT ObjPGAppRequest_DT, string[] AFields)
        {
            string result = "";


            result = m_ConfirmPaymentDAL.InsertPGAppRequest(ObjPGAppRequest_DT, AFields);

            return result;
        }
        public string PGAppResponseInsert(PGAppResponse_DT ObjPGAppResponse_DT, string[] AFields)
        {
            string result = "";


            result = m_ConfirmPaymentDAL.InsertPGAppResponse(ObjPGAppResponse_DT, AFields);

            return result;
        }
        #endregion

        public DataTable GetPaymentSMSData(string AppID, string ServiceID)
        {
            return m_ConfirmPaymentDAL.GetPaymentSMSData(AppID,ServiceID);
        }

        public string InsertSafeXRequest(SafeXPayRequest_DT ObjPGAppRequest_DT, string[] AFields)
        {
            string result = "";
            result = m_ConfirmPaymentDAL.InsertSafeXRequest(ObjPGAppRequest_DT, AFields);

            return result;
        }

        public string InsertSafeXResponse(SafeXPayResponse_DT ObjPGAppResponse_DT, string[] AFields)
        {
            string result = "";
            result = m_ConfirmPaymentDAL.InsertSafeXResponse(ObjPGAppResponse_DT, AFields);

            return result;
        }

        public DataSet InsertSafeXWebhookResponse(string AppID, string OrderNo, string agRef, string pgRef, string txnDate, string Amount)
        {
            
            return  m_ConfirmPaymentDAL.InsertSafeXWebhookResponse(AppID, OrderNo, agRef, pgRef, txnDate, Amount);

            
        }

        public DataTable CheckSafexPayStatus(string AppID, string OrderNo, string agRef, string pgRef, string txnDate, string Amount)
        {

            return m_ConfirmPaymentDAL.CheckSafexPayStatus(AppID, OrderNo, agRef, pgRef, txnDate, Amount);


        }
    }
}
