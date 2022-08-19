/*
 * Author Name              : $Author: Senjuti $
 * Created Date             : $Date: 13-11-14 3:55p $
 * Description              : 
 * File Name                : $Workfile: CommonFunction.cs $
 * Modified By              : $Author: Senjuti $
 * Modified Date            : $Modtime: 13-11-14 3:13p $
 * Revision No.             : $Revision: 38 $ 
 */
using System;
using System.Collections.Generic;
using System.Web;
using System.Text;
using System.Linq;
using System.Configuration;
using System.IO;
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.Web.SessionState;
//using System.Web.Mvc;
//using System.Xml.Serialization;
using System.Xml;
using CitizenPortalLib.DataStructs;

/// <summary>
/// Summary description for CommonFunction
/// </summary>
namespace CitizenPortalLib
{
    public static class CommonFunction
    {


        public static string GetClientIPAddress()
        {
            return HttpContext.Current.Request.UserHostAddress;
        }

        public static string GenerateNewRandomString()
        {
            string strRandom = "";
            string[] strArray = new string[36];
            strArray = new string[] { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" };
            Random autoRand = new Random();
            int x;

            for (x = 0; x < 6; x++)
            {
                int i = Convert.ToInt32(autoRand.Next(0, 36));
                strRandom += strArray[i].ToString();
            }
            return strRandom;
        }

        public static string core_hmac_md5(string key, string data)
        {
            string strKey = "";
            if (key.Length > data.Length)
            {
                int m = 0;
                for (int n = 0; n < key.Length; n++)
                {
                    strKey += key[n];
                    if (m < data.Length) strKey += data[m];
                    m++;
                }
            }
            else
            {
                int o = 0;
                for (int p = 0; p < data.Length; p++)
                {
                    if (o < key.Length) strKey += key[o];
                    strKey += data[p];
                    o++;
                }
            }
            return strKey;
        }

        public static string GetMD5Hash(string input)
        {
            System.Security.Cryptography.MD5CryptoServiceProvider oMD5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] data = oMD5.ComputeHash(System.Text.Encoding.Default.GetBytes(input));
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sb.Append(data[i].ToString("x2"));
            }
            return sb.ToString();
        }

        public static string RandomString(int size)
        {
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char ch;
            for (int i = 0; i < size; i++)
            {
                ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }
            return builder.ToString();
        }

        public static void AntiSessionFixation_OnInit()
        {
            string strvalue = RandomString(32);
            HttpContext.Current.Response.Cookies.Add(new HttpCookie("ASPFIXATION_ASI", strvalue));
            HttpContext.Current.Session.Add("ASPFIXATIONSESSION", strvalue);
            HttpContext.Current.Session.Add("ASPFIXATION", HttpContext.Current.Request.ServerVariables["remote_addr"]);
        }

        public static bool AntiSessionFixation()
        {
            string cookie_value = string.Empty, session_value = string.Empty
                    , session_cookie = string.Empty, cookie_session = string.Empty;
            cookie_value = HttpContext.Current.Request.ServerVariables["remote_addr"].ToString();
            session_value = HttpContext.Current.Session["ASPFIXATION"].ToString();
            session_cookie = HttpContext.Current.Session["ASPFIXATIONSESSION"].ToString();
            cookie_session = HttpContext.Current.Request.Cookies["ASPFIXATION_ASI"].Value.ToString();
            if (!((cookie_value == session_value) && (session_cookie == cookie_session)))
            {
                return false;
            }
            return true;
        }

        public static string ReadConfigKey(string keyName)
        {
            return ConfigurationManager.AppSettings[keyName].ToString();
        }

        public static List<KeyValuePair<string, string>> FillCulture()
        {
            List<KeyValuePair<string, string>> liCulture = new List<KeyValuePair<string, string>>();
            liCulture.Add(new KeyValuePair<string, string>("en-US", "English"));
            liCulture.Add(new KeyValuePair<string, string>("bn-BD", "Bengali"));
            return liCulture;
        }

        //Login Not Required List
        public static List<Tuple<string, string>> ControllerActionList()
        {
            List<Tuple<string, string>> liControllerList = new List<Tuple<string, string>>();
            liControllerList.Add(Tuple.Create("user", "activate"));
            liControllerList.Add(Tuple.Create("user", "activateaccountsave"));
            liControllerList.Add(Tuple.Create("user", "actpasswordupdate"));
            liControllerList.Add(Tuple.Create("user", "btnpasswordupdate"));
            return liControllerList;
        }

        public static string Encode(string encodeMe)
        {
            byte[] encoded = System.Text.Encoding.UTF8.GetBytes(encodeMe);
            return Convert.ToBase64String(encoded);
        }

        public static string Decode(string decodeMe)
        {
            byte[] encoded = Convert.FromBase64String(decodeMe);
            return System.Text.Encoding.UTF8.GetString(encoded);
        }

        #region COMMON METHODS
        public static Boolean CheckAlphaNumeric(string strCheck)
        {
            Regex regx = new Regex(@"^[a-zA-Z0-9\s,]*$");
            return regx.IsMatch(strCheck);
        }
        #endregion

        //public static void AuditLog()
        //{
        //    string configCheck = ConfigurationManager.AppSettings["IsAuditTrailIsRequested"];
        //    int userId = 0; string loginId = string.Empty;
        //    string description = string.Empty;
        //    string controllerName = HttpContext.Current.Request.RequestContext.RouteData.Values["controller"].ToString();
        //    string actionName = HttpContext.Current.Request.RequestContext.RouteData.Values["action"].ToString();

        //    if (HttpContext.Current.Session["UserSession"] != null)
        //    {
        //        userId = ((LoginModel)(HttpContext.Current.Session["UserSession"])).UserId;
        //        loginId = ((LoginModel)(HttpContext.Current.Session["UserSession"])).LoginId;
        //        description = controllerName + "-" + actionName;
        //    }
        //    else
        //    {
        //        loginId = "InvalidLogin";
        //        description = "Unauthorize";
        //    }

        //    AuditLog objAuditLog = new AuditLog()
        //    {
        //        UserId = userId,
        //        LoginId = loginId.Trim(),
        //        IpAddress = GetClientIPAddress(),
        //        PageName = controllerName.Trim(),
        //        SessionId = "1",
        //        Description = description.Trim(),
        //        GroupBelong = "DoSPI",
        //        Type = "Audit"
        //    };

        //    LoginBal objLogin = new LoginBal();
        //    // Call Login Business Logic layer
        //    if (configCheck == "Y")
        //    {
        //        objLogin.AuditLog(objAuditLog);
        //    }
        //    else
        //    {
        //        if (controllerName.ToLower() == "login")
        //        {
        //            objLogin.AuditLog(objAuditLog);
        //        }
        //    }
        //}


        //#region GetMenuData
        //public static List<MenuDataModel> GetMenuData()
        //{
        //    string absUri = System.Web.HttpContext.Current.Request.Url.AbsoluteUri.ToString();
        //    string url = System.Web.HttpContext.Current.Request.Url.AbsolutePath.ToString();

        //    string applicationUrl = absUri.Substring(0, absUri.Length - url.Length + 1);
        //    List<MenuDataModel> objMenuData = null;
        //    HomeBAL objHome = new HomeBAL();
        //    int surveyId = 0;
        //    if (System.Web.HttpContext.Current.Session["UserSession"] != null)
        //    {
        //        LoginModel objLogin = (LoginModel)System.Web.HttpContext.Current.Session["UserSession"];
        //        if (System.Web.HttpContext.Current.Session["SurveyId"] == null)
        //        {
        //            if (objLogin.SurveyList.Count < 1)
        //            { surveyId = 0; }
        //            else
        //            { surveyId = objLogin.SurveyList[0].SurveyId; }
        //        }
        //        else
        //        {
        //            surveyId = System.Convert.ToInt32(System.Web.HttpContext.Current.Session["SurveyId"].ToString());

        //        }

        //        if (objLogin != null)
        //        {
        //            if (objLogin.UserId > 0)
        //            {
        //                objMenuData = objHome.GetMenuData(objLogin.UserId, surveyId);
        //                foreach (MenuDataModel menuData in objMenuData)
        //                {
        //                    if (!string.IsNullOrEmpty(menuData.HREF.Trim()))
        //                        menuData.HREF = applicationUrl + "/" + menuData.HREF + "/" + menuData.Controller + "/" + menuData.Action;
        //                    else
        //                        menuData.HREF = applicationUrl + "/" + menuData.Controller + "/" + menuData.Action;
        //                }
        //            }
        //        }
        //    }

        //    return objMenuData;
        //}
        //#endregion

        //    [Serializable()]
        //    public class Serialize
        //    {
        //        #region "-- Methods --"
        //        public string SerializeGenericList(dynamic document)
        //        {
        //            StringBuilder RetVal = new StringBuilder();
        //            XmlSerializer serializer;
        //            XmlWriterSettings settings = new XmlWriterSettings();
        //            try
        //            {
        //                serializer = new XmlSerializer(document.GetType());
        //                settings.OmitXmlDeclaration = true;
        //                using (XmlWriter stringWriter = XmlWriter.Create(RetVal, settings))
        //                {
        //                    serializer.Serialize(stringWriter, document);
        //                }
        //            }
        //            catch (Exception ex)
        //            {
        //            }
        //            return RetVal.ToString();
        //        }
        //        #endregion
        //    }    

        //}




        #region used for the login salt Key generation purpose class

        public static class SaltKeyHandler
        {

            public static void SaltKeyAdd(ref List<SaltKeyEntry> ObjSaltKey, string lStrSalt)
            {
                SaltKeyEntry tmpEnty = new SaltKeyEntry();
                try
                {
                    tmpEnty.UserHostAddress = HttpContext.Current.Request.UserHostAddress;
                    tmpEnty.SaltKeyValue = lStrSalt;
                    DateTime dt = new DateTime();
                    dt = DateTime.Now.AddMinutes(5);
                    tmpEnty.ExpireTime = dt;
                    ObjSaltKey.Add(tmpEnty);

                }
                catch (Exception er)
                {
                    ///errLabel.InnerText = "Please Refresh the page";
                    //Logger.Logerror(er);
                }
                finally
                {
                    /// Write the method how will delete the exipred salt key data.
                    SaltKeyRemoveExpire(ref ObjSaltKey);
                }
            }

            public static string SaltKeyGet(ref List<SaltKeyEntry> ObjSaltKey)
            {
                string hostip = HttpContext.Current.Request.UserHostAddress;
                SaltKeyEntry tmpSltky = new SaltKeyEntry();
                string rtnVal = "";
                try
                {
                    tmpSltky = ObjSaltKey.Find(delegate (SaltKeyEntry o) { return o.UserHostAddress == hostip.ToString(); });
                    if (tmpSltky != null)
                    {
                        rtnVal = tmpSltky.SaltKeyValue;
                    }
                }
                catch (Exception er)
                {
                    //Logger.Logerror(er);
                }
                finally
                {
                    tmpSltky = null;
                    hostip = null;
                    SaltKeyRemoveExpire(ref ObjSaltKey);
                }
                return rtnVal;


            }


            private static void SaltKeyRemoveExpire(ref List<SaltKeyEntry> ObjSaltKey)
            {
                //SaltKeyEntry tmpSltkyobj = new SaltKeyEntry();
                List<SaltKeyEntry> tmpSltkyobj;
                try
                {
                    tmpSltkyobj = ObjSaltKey.FindAll(delegate (SaltKeyEntry o)
                    { return o.ExpireTime >= DateTime.Now; });

                    if (tmpSltkyobj != null)
                    {
                        ObjSaltKey = tmpSltkyobj;
                    }
                }
                catch (Exception er)
                {
                    //Logger.Logerror(er);
                }
                finally
                {
                    tmpSltkyobj = null;
                }

            }

            public static void SaltKeyRemove(ref List<SaltKeyEntry> ObjSaltKey)
            {
                string strHostIp = HttpContext.Current.Request.UserHostAddress;
                //ObjSaltKey.Remove(new SaltKeyEntry  );
                List<SaltKeyEntry> tmpSltkyobj;
                try
                {
                    tmpSltkyobj = ObjSaltKey.FindAll(delegate (SaltKeyEntry o)
                    { return o.UserHostAddress != strHostIp; });

                    if (tmpSltkyobj != null)
                    {
                        ObjSaltKey = tmpSltkyobj;
                    }
                }
                catch (Exception er)
                {
                    //Logger.Logerror(er);
                }
                finally
                {
                    tmpSltkyobj = null;
                }

            }

            public static void updateCaptcha(ref List<SaltKeyEntry> ObjSaltKey, string captchString)
            {
                //SaltKeyEntry Newtmp12 = new SaltKeyEntry();
                string strHostIp = HttpContext.Current.Request.UserHostAddress;
                try
                {
                    foreach (SaltKeyEntry Newtmp in ObjSaltKey)
                    {
                        if (Newtmp.UserHostAddress == strHostIp)
                        {
                            //ListofItem.Remove(int.Parse(RowNumberId));
                            Newtmp.CaptchaValue = captchString;
                        }

                    }
                }
                catch (Exception)
                {
                    //Logger.Logerror(er);
                }
            }


            public static string GetCaptchValue(ref List<SaltKeyEntry> ObjSaltKey)
            {
                string hostip = HttpContext.Current.Request.UserHostAddress;
                SaltKeyEntry tmpSltky = new SaltKeyEntry();
                string rtnVal = "";
                try
                {
                    tmpSltky = ObjSaltKey.Find(delegate (SaltKeyEntry o) { return o.UserHostAddress == hostip.ToString(); });
                    if (tmpSltky != null)
                    {
                        rtnVal = tmpSltky.CaptchaValue;
                    }
                }
                catch (Exception er)
                {
                    //Logger.Logerror(er);
                }
                finally
                {
                    tmpSltky = null;
                    hostip = null;
                    SaltKeyRemoveExpire(ref ObjSaltKey);
                }
                return rtnVal;


            }

            public static string RandomString(int size)
            {
                StringBuilder builder = new StringBuilder();
                Random random = new Random();
                char ch;
                for (int i = 0; i < size; i++)
                {
                    ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                    builder.Append(ch);
                }
                return builder.ToString();
            }



        }

        #endregion


        public class Encryption
        {
            #region ENCRYPT QUERY STRING.

            /// <summary>
            /// IT IS USED TO ENCRYPTION QUERYSTRING DATA.
            /// </summary>
            /// <param name="strQueryString"></param>
            /// <returns></returns>

            public static string EncryptQueryString(string strQueryString)
            {
                return DESEncrypt(strQueryString);
            }

            #endregion

            #region DECRYPT QUERY STRING

            /// <summary>
            /// It is used to decryption query string data.
            /// </summary>
            /// <param name="strQueryString"></param>
            /// <returns></returns>

            public static string DecryptQueryString(string strQueryString)
            {
                return DESDecrypt(strQueryString.Replace(' ', '+'));
            }

            #endregion

            #region DES DECRYPT

            /// <summary>
            /// DES Decrypt
            /// </summary>
            /// <param name="stringToDecrypt"></param>
            /// <returns></returns>

            static string DESDecrypt(string stringToDecrypt)
            {
                byte[] key;
                byte[] iv;
                byte[] inputByteArray;
                try
                {
                    key = Convert2ByteArray("AQWSEDRF");
                    iv = Convert2ByteArray("HGFEDCBA");
                    int len = stringToDecrypt.Length; inputByteArray = FromUrlSafeBase64(stringToDecrypt);// Convert.FromBase64String(stringToDecrypt);
                    DESCryptoServiceProvider des = new DESCryptoServiceProvider();
                    MemoryStream ms = new MemoryStream();
                    CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(key, iv), CryptoStreamMode.Write);
                    cs.Write(inputByteArray, 0, inputByteArray.Length);
                    cs.FlushFinalBlock();
                    Encoding encoding = Encoding.UTF8; return encoding.GetString(ms.ToArray());
                }
                catch (System.Exception ex)
                {
                    throw ex;
                }
            }

            #endregion

            #region DES ENCRYPT

            /// <summary>
            /// DES Encrypt
            /// </summary>
            /// <param name="stringToEncrypt"></param>
            /// <returns></returns>

            static string DESEncrypt(string stringToEncrypt)
            {
                byte[] key;
                byte[] iv;
                byte[] inputByteArray;
                try
                {
                    key = Convert2ByteArray("AQWSEDRF");
                    iv = Convert2ByteArray("HGFEDCBA");
                    inputByteArray = Encoding.UTF8.GetBytes(stringToEncrypt);

                    DESCryptoServiceProvider des = new DESCryptoServiceProvider();
                    MemoryStream ms = new MemoryStream(); CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(key, iv), CryptoStreamMode.Write);
                    cs.Write(inputByteArray, 0, inputByteArray.Length);
                    cs.FlushFinalBlock();
                    return ToUrlSafeBase64(ms.ToArray());
                }
                catch (System.Exception ex)
                {
                    throw ex;
                }
            }

            #endregion

            /// <summary>
            /// For Removing Special character from Array
            /// </summary>
            /// <param name="bytes"></param>
            /// <returns></returns>
            private static string ToUrlSafeBase64(byte[] bytes)
            {
                return Convert.ToBase64String(bytes).Replace('+', '-').Replace('/', '_').Replace("=", "");
            }

            private static byte[] FromUrlSafeBase64(string s)
            {
                while (s.Length % 4 != 0)
                    s += "=";
                s = s.Replace('-', '+').Replace('_', '/');
                return Convert.FromBase64String(s);
            }

            #region CONVERT 2 BYTE ARRAY

            /// <summary>
            /// For converting to byte array
            /// </summary>
            /// <param name="strInput"></param>
            /// <returns></returns>

            static byte[] Convert2ByteArray(string strInput)
            {
                int intCounter; char[] arrChar;
                arrChar = strInput.ToCharArray();
                byte[] arrByte = new byte[arrChar.Length];
                for (intCounter = 0; intCounter <= arrByte.Length - 1; intCounter++)
                    arrByte[intCounter] = Convert.ToByte(arrChar[intCounter]);
                return arrByte;
            }

            #endregion

            #region CHECK URL

            /// <summary>
            /// For checking url
            /// </summary>
            /// <param name="url"></param>
            /// <returns></returns>

            public static Boolean CheckUrl(string url)
            {
                bool flag = true;
                HttpSessionState session = HttpContext.Current.Session;
                if (session["url"] == null)
                {
                    session["url"] = url;
                }

                if (session["url"].ToString() != url)
                {
                    flag = false;
                    session["url"] = null;
                }
                return flag;
            }

            #endregion
        }





    }

}
