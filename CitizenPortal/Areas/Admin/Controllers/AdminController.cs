using CitizenPortal.Controllers;
using CitizenPortal.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CitizenPortal.Areas.Admin.Controllers
{
    [CustomAuthorize(Roles = "Admin")]
    public class AdminController : BaseController
    {
        // GET: Admin/Admin
        public ActionResult Index()
        {
            return View();
        }
    }
}