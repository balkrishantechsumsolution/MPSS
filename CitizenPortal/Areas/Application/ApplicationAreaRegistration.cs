﻿using System.Web.Mvc;

namespace CitizenPortal.Areas.Application
{
    public class ApplicationAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Application";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Application_default",
                "Application/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "CitizenPortal.Areas.Application.Controllers" }
            );
        }
    }
}