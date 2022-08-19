using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitizenPortal.Common
{
    public class GlobalValues
    {
        public static string AuthUrl
        {
            get { return ConfigurationManager.AppSettings["UID_AuthUrl"].ToString(); }
        }

        public static string RootUrl
        {
            get { return ConfigurationManager.AppSettings["UID_RootUrl"].ToString(); }
        }

        public static string KycUrl
        {
            get { return ConfigurationManager.AppSettings["UID_KycUrl"].ToString(); }
        }

        public static string JSVersion
        {
            get {

                if (ConfigurationManager.AppSettings["IsLive"] == null)
                {
                    return Guid.NewGuid().ToString();

                }
                else if (ConfigurationManager.AppSettings["IsLive"] != null && ConfigurationManager.AppSettings["IsLive"] == "Y")
                {
                    return Guid.NewGuid().ToString();
                }
                else
                {
                    return "1";
                }
            }
        }
    }
}
