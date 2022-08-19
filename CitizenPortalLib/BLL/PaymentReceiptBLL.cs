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
    public class PaymentReceiptBLL : BLLBase
    {
        private PaymentReceiptDAL m_PaymentReceiptDAL;

        public PaymentReceiptBLL()
        {
            m_PaymentReceiptDAL = new PaymentReceiptDAL();
        }
                      

        public int ValidateEmail(string EmailID)
        {
            return m_PaymentReceiptDAL.ValidateEmail(EmailID);
        }


        public DataTable GetTransDetail(string TrnID, string KIOSKID, string ServiceID)
        {
            return m_PaymentReceiptDAL.GetTransDetail(TrnID, KIOSKID, ServiceID);
        }

        public DataTable GetTransDetailV2(string AppId, string KIOSKID, string ServiceID)
        {
            return m_PaymentReceiptDAL.GetTransDetailV2(AppId, KIOSKID, ServiceID);
        }

        #region New Logic
        public DataSet GetPaymentDetail(string ServiceID, string AppId)
        {
            return m_PaymentReceiptDAL.GetPaymentDetail(ServiceID, AppId);
        }

        public DataSet GenerateQRCodeDegree(string ServiceID, string AppId)
        {
            return m_PaymentReceiptDAL.GenerateQRCodeDegree(ServiceID, AppId);
        }
        #endregion

        #region New Logic
        public DataSet GetApplicationDetail(string ServiceID, string AppId)
        {
            return m_PaymentReceiptDAL.GetApplicationDetail(ServiceID, AppId);
        }

        public DataSet GetStudentDetail(string ServiceID, string RollNo)
        {
            return m_PaymentReceiptDAL.GetStudentDetail(ServiceID, RollNo);
        }
        #endregion
    }
}
