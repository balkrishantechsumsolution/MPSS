/*Simple AES Encryption - Decryption Class
Copyright (C) 2012  George Karpouzas
 
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
 
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
 
You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using System.Reflection;
using com.paygate.ag.common.utils;
using System.Configuration;

namespace Encryption.AES
{
    public class MyCryptoClass
   {
        string privateKey = ConfigurationManager.AppSettings["MEKey"].ToString();//"n2B808GWxEls3oFzOz6wfxgEpSfPaQunLCU54vDJty4=";
        public string encrypt(string plainText)
        {
           string va = string.Empty;
           string encryptText =  PayGateCryptoUtils.encrypt(plainText,privateKey);
           return encryptText;
        }
        public string decrypt(string encryptText)
        {
            string va = string.Empty;
            string decryptText = PayGateCryptoUtils.decrypt(encryptText, privateKey);
            return decryptText;
        }
   }
}