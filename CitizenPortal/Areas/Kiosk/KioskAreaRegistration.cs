using System.Web.Mvc;

namespace CitizenPortal.Areas.Kiosk
{
    public class KioskAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Kiosk";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Kiosk_default",
                "Kiosk/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "CitizenPortal.Areas.Kiosk.Controllers" }
            );
        }
    }
}