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
    public class PoliceRecruitmentBLL : BLLBase
    {
        private PoliceRecruitmentDAL m_PoliceRecruitmentDAL;
        private SupervisorBLL objSupervisorBLL;
        private KioskRegistrationDAL m_KioskRegistrationDAL;

        public PoliceRecruitmentBLL()
        {
            m_PoliceRecruitmentDAL = new PoliceRecruitmentDAL();
            objSupervisorBLL = new SupervisorBLL();
            m_KioskRegistrationDAL = new KioskRegistrationDAL();
        }

        public string Insert(PoliceRecruitment_DT objPoliceRecruitment_DT, string[] AFields)
        {            
            string t_KioskID = "";
         
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                m_PoliceRecruitmentDAL.Insert(objPoliceRecruitment_DT, AFields);                
                scope.Complete();

            }

            return t_KioskID;
        }

        private void InsertUser(KIOSKUsers_DT objKIOSKUsers_DT, string[] AKioskUsersFields)
        {
            m_PoliceRecruitmentDAL.InsertUser(objKIOSKUsers_DT, AKioskUsersFields);
        }

        private void InsertAddress(KioskAddressDetails_DT objKioskAddressDetails_DT, string[] AAddressFields)
        {
            m_PoliceRecruitmentDAL.InsertAddress(objKioskAddressDetails_DT, AAddressFields);
        }

        private void InsertKiosk(KioskRegistration_DT objKioskRegistration_DT, string[] AFields)
        {
            m_PoliceRecruitmentDAL.InsertKiosk(objKioskRegistration_DT, AFields);
        }

        private void GenerateKioskId(string SCAID, string DistrictCode, string SubDistrictCode, string VillageCode)
        {
            m_PoliceRecruitmentDAL.GenerateID(SCAID, DistrictCode, SubDistrictCode, VillageCode);
        }

        private void AddAddress(KioskAddressDetails_DT KioskAddressDetails, string[] AFields)
        {
            m_PoliceRecruitmentDAL.InsertAddress(KioskAddressDetails, AFields);
        }

        public DataTable GetSCA()
        {
            return m_PoliceRecruitmentDAL.GetSCA();
        }

        bool CheckNullOrEmpty(object value)
        {
            return value == DBNull.Value || string.IsNullOrEmpty(value.ToString());
        }

        public int ValidateKioskId(string KioskId)
        {
            return m_PoliceRecruitmentDAL.ValidateKioskId(KioskId);
        }

        public string GetPaymentFlag(string SCAID)
        {
            return m_PoliceRecruitmentDAL.GetPaymentFlag(SCAID);
        }

        public DataTable GetVLEDetail(string KioskId, string OMTID)
        {
            return m_PoliceRecruitmentDAL.GetVLEDetail(KioskId, OMTID);
        }
    }
}
