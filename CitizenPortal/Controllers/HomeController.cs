using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CitizenPortal.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Index()
        {                        
            if (User != null)
            {
                string FullName = User.FirstName + " " + User.LastName;
            }
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}