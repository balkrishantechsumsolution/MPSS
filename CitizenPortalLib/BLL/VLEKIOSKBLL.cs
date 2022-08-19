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
    public class VLEKIOSKBLL : BLLBase
    {
        private VLEKIOSKDAL m_VLEKIOSKDAL;
        private SupervisorBLL objSupervisorBLL;
        private KioskRegistrationDAL m_KioskRegistrationDAL;

        public VLEKIOSKBLL()
        {
            m_VLEKIOSKDAL = new VLEKIOSKDAL();
            objSupervisorBLL = new SupervisorBLL();
            m_KioskRegistrationDAL = new KioskRegistrationDAL();
        }
                
        public string Insert(KioskRegistration_DT objKioskRegistration_DT, string[] AFields, KioskAddressDetails_DT objKioskAddressDetails_DT, string[] AAddressFields, KIOSKUsers_DT objKIOSKUsers_DT, string[] AKioskUsersFields)
        {
            string t_UNQ="";
            string t_KioskID = "";
            string SCAID = "", DistrictCode = "", SubDistrictCode = "", VillageCode = "";
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                //Logic for Inserting Address Details
                InsertKiosk(objKioskRegistration_DT, AFields);
                InsertAddress(objKioskAddressDetails_DT, AAddressFields);
                
                SCAID = objKioskRegistration_DT.KioskType;
                DistrictCode = objKioskAddressDetails_DT.District_Code.ToString();
                SubDistrictCode = objKioskAddressDetails_DT.Taluka_Code.ToString();
                VillageCode = objKioskAddressDetails_DT.Village_Code.ToString();

                t_KioskID = m_KioskRegistrationDAL.GenerateID(objKioskRegistration_DT, SCAID, DistrictCode, SubDistrictCode, VillageCode);

                objKIOSKUsers_DT.KioskID = t_KioskID;
                InsertUser(objKIOSKUsers_DT, AKioskUsersFields);
                t_UNQ = objSupervisorBLL.GetMaxID();
                m_VLEKIOSKDAL.UpdatemstUsers(t_KioskID, t_UNQ);
                scope.Complete();

            }

            return t_KioskID;
        }

        private void InsertUser(KIOSKUsers_DT objKIOSKUsers_DT, string[] AKioskUsersFields)
        {
            m_VLEKIOSKDAL.InsertUser(objKIOSKUsers_DT, AKioskUsersFields);
        }

        private void InsertAddress(KioskAddressDetails_DT objKioskAddressDetails_DT, string[] AAddressFields)
        {
            m_VLEKIOSKDAL.InsertAddress(objKioskAddressDetails_DT, AAddressFields);
        }

        private void InsertKiosk(KioskRegistration_DT objKioskRegistration_DT, string[] AFields)
        {
            m_VLEKIOSKDAL.InsertKiosk(objKioskRegistration_DT, AFields);
        }

        private void GenerateKioskId(string SCAID, string DistrictCode, string SubDistrictCode, string VillageCode)
        {
            m_VLEKIOSKDAL.GenerateID(SCAID, DistrictCode, SubDistrictCode, VillageCode);
        }

        private void AddAddress(KioskAddressDetails_DT KioskAddressDetails, string[] AFields)
        {
            m_VLEKIOSKDAL.InsertAddress(KioskAddressDetails, AFields);
        }

        public DataTable GetSCA()
        {
            return m_VLEKIOSKDAL.GetSCA();
        }

        bool CheckNullOrEmpty(object value)
        {
            return value == DBNull.Value || string.IsNullOrEmpty(value.ToString());
        }
                
        public int ValidateEmail(string EmailID)
        {
            return m_VLEKIOSKDAL.ValidateEmail(EmailID);
        }

        public string GetPaymentFlag(string SCAID)
        {
            return m_VLEKIOSKDAL.GetPaymentFlag(SCAID);
        }               

    }
}
