using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CitizenPortalLib.DAL;
using System.Data;
using CitizenPortalLib.DataStructs;
using System.Transactions;
using CitizenPortalLib.PortalViewModel;

namespace CitizenPortalLib.BLL
{
    public class LoginBLL : BLLBase
    {
        private LoginDAL m_LoginDAL;

        public LoginBLL()
        {
            m_LoginDAL = new LoginDAL();
        }

        public DataTable ValidateLogin(string LoginID, string Password)
        {
            return m_LoginDAL.ValidateLogin(LoginID, Password);
        }


        public DataTable GetVillageCode(string KIOSKID, string UserType)
        {
            return m_LoginDAL.GetVillageCode(KIOSKID, UserType);
        }

        /// <summary>
        ///  This method is used to authenticate the user in the application.
        /// </summary>
        /// <param name="strLoginUser">user ID</param>
        /// <param name="strPassword">Password </param>
        /// <param name="strSaltKy">Salt key value</param>
        /// <returns>Ture or false return</returns>
        public int AuthenticateUser(string strLoginUser, string strPassword, string strSaltKy, string UserType)
        {
            int successfullyLogin = 0;
            LoginModel objLogin = new LoginModel();
            string dbPassword = m_LoginDAL.GetPasswordByLoginID(strLoginUser, UserType);
            if (String.IsNullOrEmpty(dbPassword))
            { successfullyLogin = 1; return successfullyLogin; }

            //bool firstLevel = CheckUserCredentials(strLoginUser, strPassword, strSaltKy, dbPassword);
            //if (firstLevel)
            //{

            //    objLogin.SaltKeyValue = strSaltKy;
            //    System.Web.HttpContext.Current.Session["UserSession"] = objLogin;
            //    successfullyLogin = 1;
            //}
            //else
            //{
            //    successfullyLogin = 0;
            //}

            //var storedpassword = dbPassword;
            //// Comparing Password With Seed
            //if (ReturnHash(storedpassword, strSaltKy) == strPassword)
            //{
            //    successfullyLogin = 0;
            //}
            //else
            //{
            //    successfullyLogin = 1;
            //}


            string pwd1 = dbPassword;
            //use same process as on .aspx page.
            string pwd2 = getMd5Hash(pwd1);//convert plain password into md5
            string pwd3 = getMd5Hash(strSaltKy);//convert Rndno into md5
            pwd2 = getMd5Hash(pwd2 + pwd3);//now convert both value into md5 again
            if (strPassword == pwd2)//match both md5 value is same
            {
                //Code after password authenticate
                successfullyLogin = 0;
            }
            else
            {
                //password authenticate fail
                successfullyLogin = 1;
            }
            //string pwd1 = "";

            //if (IsValidMD5(dbPassword))
            //{
            //    pwd1 = dbPassword;                
            //}
            //else
            //{
            //    pwd1 = getMd5Hash(dbPassword);
            //}

            //string pwd3 = strSaltKy;//convert Rndno into md5
            //string pwd2 = getMd5Hash(pwd3 + pwd1.ToUpper());//now convert both value into md5 again

            //if (strPassword.ToUpper() == pwd2.ToUpper())//match both md5 value is same
            //{
            //    //Code after password authenticate
            //    successfullyLogin = 0;
            //}
            //else
            //{
            //    //password authenticate fail
            //    successfullyLogin = 1;
            //}

            return successfullyLogin;
        }

        public string getMd5Hash(string input)
        {
            string rurl = "", LoginKey = "";
            if (input == "")
            {
                return "false";
            }
            System.Security.Cryptography.MD5 md5Hasher = System.Security.Cryptography.MD5.Create();
            byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }
        public  bool IsValidMD5(string md5)
        {
            if (md5 == null || md5.Length != 32) return false;
            foreach (var x in md5)
            {
                if ((x < '0' || x > '9') && (x < 'a' || x > 'f') && (x < 'A' || x > 'F'))
                {
                    return false;
                }
            }
            return true;
        }
        public string ReturnHash(string strPassword, string token)
        {
            string strHash = null;
            string RandomNo = token;
#pragma warning disable 618
            return strHash = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile((RandomNo + strPassword), "MD5");
#pragma warning restore 618
        }

        /// <summary>
        /// Internally called in the method of Authentication process, to check the user password.
        /// </summary>
        /// <param name="strLoginUser">User ID</param>
        /// <param name="strPassword">Password</param>
        /// <param name="strSaltKy">salt key value</param>
        /// <param name="loginEntry">entity object of login view class</param>
        /// <returns>true or false return</returns>
        private bool CheckUserCredentials(string strLoginUser, string strPassword, string strSaltKy, string dbPwd)
        {
            bool bMatchValue = false;
            /*
            string Strpwdhash = "";

            if (!string.IsNullOrEmpty(dbPwd))
                Strpwdhash = dbPwd;

            string lStrDBPwd = CommonFunction.GetMD5Hash(CommonFunction.core_hmac_md5(Strpwdhash, strSaltKy));
            string lStrUIPwd = strPassword;
            if (lStrDBPwd == lStrUIPwd)
            {
                bMatchValue = true;
            }
    */
            byte[] PasswordHash;
            using (System.Security.Cryptography.SHA512Managed sha = new System.Security.Cryptography.SHA512Managed())
            {
                if (dbPwd != "")
                {
                    byte[] dataToHashNewPwd = Encoding.UTF8.GetBytes(dbPwd);
                    PasswordHash = sha.ComputeHash(dataToHashNewPwd);
                }
                else
                {
                    PasswordHash = null;
                }
            }

            //da = new System.Data.SqlClient.SqlDataAdapter("ValidateUserMD5", sqlconn);
            //da.SelectCommand.CommandType = CommandType.StoredProcedure;

            //da.SelectCommand.Parameters.Add("@strUserName", SqlDbType.VarChar, 100);
            //da.SelectCommand.Parameters["@strUserName"].Value = txtUserName.Value;

            //if (PasswordHash != null)
            //{
            //    da.SelectCommand.Parameters.Add("@strPassword", SqlDbType.Binary, 64);
            //    da.SelectCommand.Parameters["@strPassword"].Value = PasswordHash;

            //}

            string strHash = null;
            //string RandomNo = Session["RandomNo"].ToString();
            string RandomNo = strSaltKy + dbPwd;
            strHash = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(RandomNo, "MD5");

            string lStrDBPwd = strHash;
            string lStrUIPwd = strPassword;
            if (lStrDBPwd == lStrUIPwd)
            {
                bMatchValue = true;
            }
            return bMatchValue;
        }

        public DataSet GetUserData(string LoginID, string UserType)
        {
            return m_LoginDAL.GetUserData(LoginID, UserType);
        }

        public DataTable GetKioskDetail(string LoginID)
        {
            return m_LoginDAL.GetKioskDetail(LoginID);
        }

        public DataTable GetG2GDetail(string LoginID)
        {
            return m_LoginDAL.GetG2GDetail(LoginID);
        }

        public DataTable GetCitizenDetail(string LoginID)
        {
            return m_LoginDAL.GetCitizenDetail(LoginID);
        }

        public DataTable ValidateLoginDetail(string LoginID, string CurrentPassword, int Flag)
        {
            return m_LoginDAL.ValidateLoginDetail(LoginID, CurrentPassword,Flag);
        }

        public DataTable GetChangePasswordDetail(string LoginID,string CurrentPassword, string NewPassword, string UserType,int Flag)
        {
            return m_LoginDAL.GetChangePasswordDetail(LoginID, CurrentPassword, NewPassword, UserType, Flag);
        }
        public DataTable GetChangePasswordDetailEncrypt(string LoginID, string CurrentPassword, string NewPassword, string UserType, string NewEncPassword, int Flag)
        {
            return m_LoginDAL.GetChangePasswordDetailEncrypt(LoginID, CurrentPassword, NewPassword, NewEncPassword, UserType, Flag);
        }
        public DataTable GetPassword(string ProfileID, string strCheckOldPassword, string strNewPassword, string UserType)
        {
            return m_LoginDAL.GetPassword(ProfileID, strCheckOldPassword, strNewPassword,UserType);
        }
        public DataSet UserSaltKeyAndPass(string strLoginUser, int Flag)
        {
            DataSet oDataSet = new DataSet();
            oDataSet = m_LoginDAL.UserSaltKeyAndPass(strLoginUser, Flag);

            return oDataSet;
        }
        public string AuthenticateUserEncryptPass(string strLoginUser, string UserType)
        {
            string successfullyLogin = "0";
            LoginModel objLogin = new LoginModel();
            string dbPassword = m_LoginDAL.GetEncryptPasswordByLoginID(strLoginUser, UserType);
            if (String.IsNullOrEmpty(dbPassword))
            { successfullyLogin = "0"; return successfullyLogin; }
            else
            {
                return dbPassword;
            }
        }
        public DataTable GetChangePasswordDetail(string LoginID, string CurrentPassword, string NewPassword, string UserType, int Flag, string SaltKey)
        {
            return m_LoginDAL.GetChangePasswordDetail(LoginID, CurrentPassword, NewPassword, UserType, Flag, SaltKey);
        }
        public DataTable AuditTrialStatus(string IPAddress, string CreatedBy, string UserID, string Status, string module)
        {
            return m_LoginDAL.AuditTrialStatus(IPAddress, CreatedBy, UserID, Status, module);
        }

        public DataSet UserSaltKeyAndPassCSVTU(string strLoginUser, int Flag)
        {
            DataSet oDataSet = new DataSet();
            oDataSet = m_LoginDAL.UserSaltKeyAndPassCSVTU(strLoginUser, Flag);

            return oDataSet;
        }

        public DataTable GetCitizenDetailCSVTU(string LoginID)
        {
            return m_LoginDAL.GetCitizenDetailCSVTU(LoginID);
        }
    }
}
