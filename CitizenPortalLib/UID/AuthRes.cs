using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace CitizenPortalLib.UID
{
    /// <summary>
    /// Summary description for AuthRes
    /// </summary>
    [XmlRoot("AuthRes")]
    public class AuthRes
    {
        [XmlElement("DeviceId")]
        public String deviceId { get; set; }

        [XmlElement("UID")]
        public String uid { get; set; }

        [XmlElement("SubAUAtransId")]
        public String subAUAtransId { get; set; }

        [XmlElement("Ret")]
        public String ret { get; set; }

        [XmlElement("ResponseMsg")]
        public String responseMsg { get; set; }

        [XmlElement("ResponseCode")]
        public String responseCode { get; set; }

        [XmlElement("ResponseTs")]
        public String responseTs { get; set; }

        [XmlElement("SubAUAcode")]
        public String subAUAcode { get; set; }

        //public Ranks ranks{ get; set; }

        [XmlElement("OtpErrorCode")]
        public String otpErrorCode { get; set; }

        [XmlElement("OtpRet")]
        public String otpRet { get; set; }

    }
}
