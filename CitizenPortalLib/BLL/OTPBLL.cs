using CitizenPortalLib.DAL;
using CitizenPortalLib.DataStructs;
using System.Data;

namespace CitizenPortalLib.BLL
{
    public class OTPBLL : BLLBase
    {
        private OTPDAL m_OTPDAL;

        public OTPBLL()
        {
            m_OTPDAL = new OTPDAL();
        }

        public DataTable InsertOTP(OTP_DT objOTP_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OTPDAL.InsertOTP(objOTP_DT, AFields);
            return t_AppDT;
        }

        public DataTable GetUIDJSon(string UID)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OTPDAL.GetUIDJSon(UID);
            return t_AppDT;
        }

        public DataTable ValidateOTP(OTP_DT objOTP_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OTPDAL.ValidateOTP(objOTP_DT, AFields);
            return t_AppDT;
        }

        public void History(string profileid, string Newpassword, string mobile, string otp)
        {
            m_OTPDAL.History(profileid, Newpassword, mobile, otp);
        }

        public void ForgetPasswordHistory(string ProfileID, string newPassword, string Mobile, string Otp, string UType)
        {
            m_OTPDAL.ForgetPasswordHistory(ProfileID, newPassword, Mobile, Otp, UType);
        }

        public DataTable SendSMS(OTP_DT objOTP_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OTPDAL.SendSMSOnUserMobile(objOTP_DT, AFields);
            return t_AppDT;
        }


        public DataTable InsertMobileOTP(OTP_DT objOTP_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OTPDAL.InsertMobileOTP(objOTP_DT, AFields);
            return t_AppDT;
        }


        public DataTable InsertCitizenOTP(OTP_DT objOTP_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OTPDAL.InsertCitizenOTP(objOTP_DT, AFields);
            return t_AppDT;
        }

        public DataTable GetCitizenUIDJSon(string UID)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OTPDAL.GetCitizenUIDJSon(UID);
            return t_AppDT;
        }

        public DataTable ValidateCitizenOTP(OTP_DT objOTP_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OTPDAL.ValidateCitizenOTP(objOTP_DT, AFields);
            return t_AppDT;
        }

        public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_OTPDAL.GetAppDetails(ServiceID, AppID);
            return t_AppDS;
        }

        public DataTable GetCitizenProfile(string MobileNo)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OTPDAL.GetCitizenProfile(MobileNo);
            return t_AppDT;
        }

        public DataTable ValidateMobile(string MobileNo)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OTPDAL.ValidateMobile(MobileNo);
            return t_AppDT;
        }

        public DataTable ValidateOUATOTP(OTP_DT objOTP_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OTPDAL.ValidateOUATOTP(objOTP_DT, AFields);
            return t_AppDT;
        }

        public DataTable ValidateAgroOUATOTP(OTP_DT objOTP, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_OTPDAL.ValidateAgroOUATOTP(objOTP, AFields);
            return t_AppDT;
        }
    }
}