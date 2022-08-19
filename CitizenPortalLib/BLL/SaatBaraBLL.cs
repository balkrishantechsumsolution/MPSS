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
    public class SaatBaraBLL : BLLBase
    {
        private SaatBaraDAL m_SaatBaraDAL;

        public SaatBaraBLL()
        {
            m_SaatBaraDAL = new SaatBaraDAL();
        }

        public DataTable GetSurveyNo(string SurveyNo)
        {
            return m_SaatBaraDAL.GetSurveyNo(SurveyNo);
        }

        public DataTable GetDetail(string TransactionId)
        {
            return m_SaatBaraDAL.GetDetail(TransactionId);
        }

        public DataTable GetSaat(string TransactionId)
        {
            return m_SaatBaraDAL.GetSaat(TransactionId);
        }

        public DataTable GetBara(string TransactionId)
        {
            return m_SaatBaraDAL.GetBara(TransactionId);
        }

        public string InsertAddress(KioskAddressDetails_DT objKioskAddressDetails_DT, string[] AAddressFields, string ServiceId, TrackStatus_DT objTrackStatus_DT, string[] AStatusFields,
            SaatBara_DT objSaatBara_DT, string[] ASaatBaraFields)
        {
            string t_AppID = "";
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                t_AppID = m_SaatBaraDAL.InsertTrackStatusV2(objTrackStatus_DT, AStatusFields, objKioskAddressDetails_DT.District_Code, objKioskAddressDetails_DT.Taluka_Code, ServiceId);

                m_SaatBaraDAL.InsertAddressV2(objKioskAddressDetails_DT, AAddressFields, ServiceId, t_AppID);
                m_SaatBaraDAL.InsertSaatBara(objSaatBara_DT, ASaatBaraFields, t_AppID);

                scope.Complete();

            }

            return t_AppID;
        }

        public string InsertAddress_old(KioskAddressDetails_DT objKioskAddressDetails_DT, string[] AAddressFields, string ServiceId, TrackStatus_DT objTrackStatus_DT, string[] AStatusFields,
            SaatBara_DT objSaatBara_DT, string[] ASaatBaraFields)
        {
            string t_AppID = "";
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {

                t_AppID = m_SaatBaraDAL.InsertAddress(objKioskAddressDetails_DT, AAddressFields, ServiceId);
                m_SaatBaraDAL.InsertSaatBara(objSaatBara_DT, ASaatBaraFields, t_AppID);
                m_SaatBaraDAL.InsertTrackStatus(objTrackStatus_DT, AStatusFields, t_AppID);

                scope.Complete();

            }

            return t_AppID;
        }

        public DataTable GetKhatadar()
        {
            return m_SaatBaraDAL.GetKhatadar();
        }

        public DataTable GetSurvey()
        {
            return m_SaatBaraDAL.GetSurvey();
        }

        public string GenerateAppSequenceNo()
        {
            return m_SaatBaraDAL.GenerateAppSequenceNo();
        }
    }
}
