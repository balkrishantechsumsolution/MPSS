using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;

namespace CitizenPortalLib
{
    public class Security
    {
        /// <summary>
        /// method to encrypt information to be appended in querystring or set in cookie
        /// </summary>
        /// <param name="Value">input to be encrypted</param>
        /// <returns>encrypted value</returns>
        public static string EncryptString3(string Value) 
        {
            
            if (string.IsNullOrEmpty(Value))
                Value = "12345-";
            else
                Value = "12345-" + Value;
            return HttpUtility.UrlEncode(Value);
        }

        /// <summary>
        /// method to encrypt information to be appended in querystring or set in cookie
        /// </summary>
        /// <param name="Value">input to be encrypted</param>
        /// <returns>encrypted value</returns>
        public static string EncryptString(string Value)
        {

            // Generate random number between 1 and 8
            int offset = 1;

            Random rnd = new Random(unchecked((int)(DateTime.Now.Ticks)));

            offset = rnd.Next(1, 8);
            
            // Prefix the string with a string containing 5 instances of the number

            StringBuilder prefix = new StringBuilder( offset.ToString());

            for (int i = 1; i < 5; i++) prefix.Append(offset.ToString());

            prefix.Append("-");
            if (!string.IsNullOrEmpty(Value))
                prefix.Append(Value);

            string finalString = prefix.ToString();

            //get unicode bytes of the string

            byte[] aBytes = System.Text.Encoding.Unicode.GetBytes(finalString);

            //rotate left each byte offset times
            for (int i = 0; i < aBytes.Length; i++)
            {
                for (int iRot = 1; iRot < offset; iRot++)
                    aBytes[i] = RotateLeft(aBytes[i]);

            }



          //Get Base64 string

           string b64String = Convert.ToBase64String(aBytes);

              

            //prefix the offset

           b64String = offset.ToString() + b64String;

            // URL Encode the string and return

           return HttpUtility.UrlEncode(b64String);

        }

        /// <summary>
        /// method to decrypt the information from query string or in cookie
        /// </summary>
        /// <param name="Value">input as string</param>
        /// <returns>decrypted output</returns>
        public static string DecryptString3(string Value)
        {
            //HttpUtility httpUtil = new HttpUtility();
            Value = HttpUtility.UrlDecode(Value);
            //Value = base64Decode(Value);
            if (Value.Length > 6)
                Value = Value.Substring(6);
            else
                Value = "";
            return Value;
        }

        public static byte RotateLeft(byte val) 
        { 
            byte lowbit = (byte)((val & 0x80) != 0 ? 0x1 : 0x0); 
            val <<= 1; val |= lowbit; 
            return val; 
        }    
        
        
        
        public static byte RotateRight(byte val)
        { 
            byte highbit = (byte)((val & 0x1) != 0 ? 0x80 : 0x0); 
            val >>= 1; val |= highbit; 
            return val; 
        }



        /// <summary>
        /// method to decrypt the information from query string or in cookie
        /// </summary>
        /// <param name="Value">input as string</param>
        /// <returns>decrypted output</returns>
        public static string DecryptString(string Value)
        {
            //url decode string

            string urlDecoded = HttpUtility.UrlDecode(Value);


            //extract the 1st offset byte
            //Changed on 07-Sept-2010 by Dhawal: Error being logged in due to length of string
            int offset =  int.Parse(urlDecoded.Length > 0 ? urlDecoded.Substring(0, 1): "0");

            urlDecoded = urlDecoded.Substring(1);

            //base64 decode the rest of the string get the byte array

            byte[] aBytes = Convert.FromBase64String(urlDecoded);



            //rotate right each member offset times
            //rotate left each byte offset times
            for (int i = 0; i < aBytes.Length; i++)
            {
                for (int iRot = 1; iRot < offset; iRot++)
                    aBytes[i] = RotateRight(aBytes[i]);

            }

            //unicode decode the bytes

            string finalstring = System.Text.Encoding.Unicode.GetString(aBytes);
            //drop the first six characters


            if (finalstring.Length == 6) //this was an empty string
                return "";

            else
                return finalstring.Substring(6);
            //return what remains blank string if necessary


;
        }

    }
}
