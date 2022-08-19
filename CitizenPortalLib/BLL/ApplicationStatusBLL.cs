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
    public class ApplicationStatusBLL : BLLBase
    {
        private ApplicationStatusDAL m_ApplicationStatusDAL;

        public ApplicationStatusBLL()
        {
            m_ApplicationStatusDAL = new ApplicationStatusDAL();
        }

        public DataTable GetApplications(string OperatorID, string Status, string FromDate, string ToDate, string ServiceID, string ApplicationID, string District, string Taluka, string Village,
            bool IsKiosk, string KioskID, bool IsSCA, string SCAID, string VLECode)
        {
            return m_ApplicationStatusDAL.GetApplications(OperatorID, Status, FromDate, ToDate, ServiceID, ApplicationID, District, Taluka, Village,
                IsKiosk, KioskID, IsSCA, SCAID, VLECode);
        }

        public DataTable GetApplicationsPendingForPayment(string OperatorID, string FromDate, string ToDate, string ServiceID, string ApplicationID, string District, string Taluka, string Village,
            bool IsKiosk, string KioskID, bool IsSCA, string SCAID, string VLECode)
        {
            return m_ApplicationStatusDAL.GetApplicationsPendingForPayment(OperatorID, FromDate, ToDate, ServiceID, ApplicationID, District, Taluka, Village,
                IsKiosk, KioskID, IsSCA, SCAID, VLECode);
        }

        public int UpdateDeliveryStatus(string Applications)
        {
            int t_Status = -1;
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                t_Status = m_ApplicationStatusDAL.UpdateDeliveryStatus(Applications);
                scope.Complete();
            }
            return t_Status;
        }

        public DataTable GetCount(string LoginId, bool IsKiosk, string KioskID, bool IsSCA, string SCAID, string VLECode)
        {
            return m_ApplicationStatusDAL.GetCount(LoginId, IsKiosk, KioskID, IsSCA, SCAID, VLECode);
        }

        /***************************/

        public DataTable GetApplicationsAdmin(string Status, string FromDate, string ToDate, string ServiceID, string ApplicationID, string District, string Taluka, string Village,
            bool IsKiosk, string KioskID, bool IsSCA, string SCAID, string Unq, string VLECode)
        {
            return m_ApplicationStatusDAL.GetApplicationsAdmin(Status, FromDate, ToDate, ServiceID, ApplicationID, District, Taluka, Village,
                IsKiosk, KioskID, IsSCA, SCAID, Unq, VLECode);
        }

        public DataTable GetApplicationsPendingForPaymentAdmin(string OperatorID, string FromDate, string ToDate, string ServiceID, string ApplicationID, string District, string Taluka, string Village,
            bool IsKiosk, string KioskID, bool IsSCA, string SCAID, string VLECode)
        {
            return m_ApplicationStatusDAL.GetApplicationsPendingForPaymentAdmin(OperatorID, FromDate, ToDate, ServiceID, ApplicationID, District, Taluka, Village,
                IsKiosk, KioskID, IsSCA, SCAID, VLECode);
        }

        public int UpdateDeliveryStatusAdmin(string Applications)
        {
            int t_Status = -1;
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                t_Status = m_ApplicationStatusDAL.UpdateDeliveryStatusAdmin(Applications);
                scope.Complete();
            }
            return t_Status;
        }

        public DataTable GetCountAdmin(string LoginId, bool IsKiosk, string KioskID, bool IsSCA, string SCAID, string VLECode)
        {
            return m_ApplicationStatusDAL.GetCountAdmin(LoginId, IsKiosk, KioskID, IsSCA, SCAID, VLECode);
        }

        public DataTable GetVLEAdmin(string District, string Taluka, string VLEID)
        {
            return m_ApplicationStatusDAL.GetVLEAdmin(District, Taluka, VLEID);
        }

        #region New Logic
        public DataSet TrackApplication(string AppID)
        {
            return m_ApplicationStatusDAL.TrackApplication(AppID);
        }
        #endregion

    }
}
