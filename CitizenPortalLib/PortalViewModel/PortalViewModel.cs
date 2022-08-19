using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CitizenPortalLib.PortalViewModel
{
    public class PortalViewModel
    {
    }

    public class LoginModel
    {
        public int UserId { get; set; }
        public int Status { get; set; }
        public string LoginID { get; set; }
        public string Password { get; set; }
        public string captcha { get; set; }
        public string SaltKeyValue { get; set; }
        public string error_msg { get; set; }
        public string EmailId { get; set; }

        public int? RoleId { get; set; }
        public string RoleName { get; set; }

        public int? FactoryId { get; set; }
        public string FactoryName { get; set; }

        public int? DistrictId { get; set; }
        public string DistrictName { get; set; }

        public string UserType { get; set; }
    }
}
