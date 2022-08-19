using CitizenPortal.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CitizenPortal.Areas.Citizen.Controllers
{
    public class HomeController : BaseController
    {
        // GET: Citizen/Home
        public ActionResult Index()
        {
            return View();
        }
    }
}