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
    public class CitizenRegistrationBLL : BLLBase
    {
        private CitizenRegistrationDAL m_CitizenRegistrationDAL;

        public CitizenRegistrationBLL()
        {
            m_CitizenRegistrationDAL = new CitizenRegistrationDAL();
        }
        
        public void Insert(CitizenRegistration_DT objCitizenRegistration_DT, string[] AFields, CitizenAddress_DT ListAddressDetails, string[] AContactFields, 
            CitizenUsers_DT objCitizenUser, string[] AUserFields)
        {
            string t_CitizenID = "";
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                m_CitizenRegistrationDAL.Insert(objCitizenRegistration_DT, AFields);

                //Logic for Inserting Contact Details                                                                                              
                AddCitizenAddress(ListAddressDetails, AContactFields);

                t_CitizenID = m_CitizenRegistrationDAL.GenerateID(objCitizenRegistration_DT);
                AddCitizen(objCitizenUser, AUserFields);

                scope.Complete();
            }

        }

        public DataSet GetUserDetails(string m_UserID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_CitizenRegistrationDAL.GetUserDetail(m_UserID);

            return t_AppDS;
        }

        public int CitizenShortRegistration(CitizenRegistration_DT objCitizenRegistration_DT, string[] AFields)
        {
            int strResult = 1;
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                strResult =  m_CitizenRegistrationDAL.CitizenShortRegistration(objCitizenRegistration_DT);
                scope.Complete();
            }
            return strResult;
        }

        public int CheckUserID(string userID)
        {
            int strResult = 1;
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                strResult = m_CitizenRegistrationDAL.checkUserID(userID);
                scope.Complete();
            }

            return strResult;
        }

        private void AddCitizenAddress(CitizenAddress_DT ContactDetails, string[] AFields)
        {
            m_CitizenRegistrationDAL.InsertAddress(ContactDetails, AFields);   
        }

        private void AddCitizen(CitizenUsers_DT UserDetails, string[] AFields)
        {
            m_CitizenRegistrationDAL.InsertCitizen(UserDetails, AFields);
        }


        public int ValidateEmail(string EmailID)
        {
            return m_CitizenRegistrationDAL.ValidateEmail(EmailID);
        }

        public void QuickAccess(CitizenRegistration_DT objCitizenRegistration_DT, string[] AFields, CitizenUsers_DT objCitizenUser, string[] AUserFields)
        {
            string t_CitizenID = "";
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                m_CitizenRegistrationDAL.Insert(objCitizenRegistration_DT, AFields);

                //Logic for Inserting Contact Details                                                                                              
                
                t_CitizenID = m_CitizenRegistrationDAL.GenerateID(objCitizenRegistration_DT);
                AddCitizen(objCitizenUser, AUserFields);

                scope.Complete();
            }

        }

        public DataTable GetCitizenDetail(string EmailID)
        {
            return m_CitizenRegistrationDAL.GetCitizenDetail(EmailID);
        }

        public DataTable GetUserDetail(string EmailID, string RegType)
        {
            return m_CitizenRegistrationDAL.GetUserDetail(EmailID, RegType);
        }

        public void UpdateCitizen(CitizenRegistration_DT objCitizenRegistration_DT, string[] AFields, string[] ACitizen, CitizenAddress_DT ListAddressDetails, string[] AContactFields,
            CitizenUsers_DT objCitizenUser, string[] AUsersUpdateFields, string[] AUser)
        {
            string t_CitizenID = "";
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                m_CitizenRegistrationDAL.UpdateCitizen(objCitizenRegistration_DT, AFields, ACitizen);

                //Logic for Inserting Contact Details                                                                                              
                AddCitizenAddress(ListAddressDetails, AContactFields);

                m_CitizenRegistrationDAL.UpdateUser(objCitizenUser, AUsersUpdateFields, AUser);
                //AddCitizen(objCitizenUser, AUserFields);

                scope.Complete();
            }
        }

        public DataTable InsertLoginDetail(LoginDetail_DT objLoginDetail_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_CitizenRegistrationDAL.InsertLoginDetail(objLoginDetail_DT, AFields);
            return t_AppDT;
        }

        public DataTable CheckLoginAvability(string userId)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_CitizenRegistrationDAL.CheckLoginAvability(userId);
            return t_AppDT;
        }

        public DataSet GetUIDDetail(string UID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_CitizenRegistrationDAL.GetUIDDetail(UID);
            return t_AppDS;
        }

        public DataTable CheckMobileNo(string MobileNo)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_CitizenRegistrationDAL.CheckMobileNo(MobileNo);
            return t_AppDT;
        }

        public DataSet GetG2GUserDetails(string m_UserID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_CitizenRegistrationDAL.GetG2GUserDetail(m_UserID);

            return t_AppDS;
        }
    }
}
