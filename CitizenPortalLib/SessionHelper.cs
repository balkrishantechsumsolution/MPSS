using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CitizenPortalLib
{
    [Serializable]
    public class SessionHelper
    {
        // private constructor
        private SessionHelper() { }

        // Gets the current session.
        public static SessionHelper Current
        {
            get
            {
                SessionHelper session =
                  (SessionHelper)HttpContext.Current.Session["__SessionHelper__"];
                if (session == null)
                {
                    session = new SessionHelper();
                    HttpContext.Current.Session["__SessionHelper__"] = session;
                }
                return session;
            }
        }

        // **** add your session properties here, e.g like this:
        //public string Property1 { get; set; }
        //public DateTime MyDate { get; set; }
        //public int LoginId { get; set; }

        public string KioskID { get; set; }
        public string KioskName { get; set; }

        private string paymentFlag = "";
        public string PaymentFlag { get { return paymentFlag; } set { if (value == "") paymentFlag = "K"; else paymentFlag = value; } }

        public string OperatorID { get; set; }
        public string VillageCode { get; set; }

        public string AdminID { get; set; }
        public string AdminName { get; set; }

        public string UserType { get; set; }
        public string LoginID { get; set; }
        public string LoginName { get; set; }
    }
}