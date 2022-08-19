using System.Web.Mvc;

namespace CitizenPortal.Areas.Citizen
{
    public class CitizenAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Citizen";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Citizen_default",
                "Citizen/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "CitizenPortal.Areas.Citizen.Controllers" }
            );
        }
    }
}