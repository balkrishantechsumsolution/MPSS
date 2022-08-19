using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace CitizenPortal.Models
{
    public class NotFoundModel : HandleErrorInfo
    {
        public NotFoundModel(Exception exception, string controllerName, string actionName)
        : base(exception, controllerName, actionName)
        {
        }
        public string RequestedUrl { get; set; }
        public string ReferrerUrl { get; set; }
    }
}
