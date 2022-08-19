using CitizenPortal.Security;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Filters;

namespace CitizenPortal.Controllers
{
    public class BaseController : Controller
    {
        // GET: Base
        protected virtual new CustomPrincipal User
        {
            get { return HttpContext.User as CustomPrincipal; }
        }

        protected override IAsyncResult BeginExecuteCore(AsyncCallback callback, object state)
        {
            string lang = Session["lang"] as string;
            if (lang == null)
            {
                lang = "en-GB";
                var cult = new CultureInfo(lang);
                System.Threading.Thread.CurrentThread.CurrentUICulture = cult;
                System.Threading.Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(cult.Name);
            }
            return base.BeginExecuteCore(callback, state);
        }

        /// <summary>Helper method for getting the result of rendering an action as a string</summary>
        /// <remarks>
        /// From: http://stackoverflow.com/questions/4344533/asp-net-mvc-razor-how-to-render-a-razor-partial-views-html-inside-the-controlle
        /// 
        /// This returns the view as a "partial" so no Master page is used.
        /// </remarks>
        public string RenderPartialViewToString(string view, object model)
        {
            if (string.IsNullOrEmpty(view))
                view = ControllerContext.RouteData.GetRequiredString("action");

            ViewData.Model = model;
            var viewResult = ViewEngines.Engines.FindPartialView(ControllerContext, view);

            if (viewResult.View == null)
#if DEBUG
                throw new Exception(string.Format("View not found: {0}", view));
#else
                return string.Empty;
#endif

            using (var writer = new StringWriter())
            {
                var viewContext = new ViewContext(ControllerContext, viewResult.View, ViewData, TempData, writer);
                viewResult.View.Render(viewContext, writer);
                return writer.GetStringBuilder().ToString();
            }
        }

        protected override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            if (filterContext.Result is ViewResult)
            {
                if (filterContext.Controller.TempData.ContainsKey("Error"))
                {
                    var modelState = filterContext.Controller.TempData["Error"] as ModelState;
                    filterContext.Controller.ViewData.ModelState.Merge(new ModelStateDictionary() { new KeyValuePair<string, ModelState>("Error", modelState) });
                    filterContext.Controller.TempData.Remove("Error");
                }
            }
            if ((filterContext.Result is RedirectResult) || (filterContext.Result is RedirectToRouteResult))
            {
                if (filterContext.Controller.ViewData.ModelState.ContainsKey("Error"))
                {
                    filterContext.Controller.TempData["Error"] = filterContext.Controller.ViewData.ModelState["Error"];
                }
            }

            base.OnActionExecuted(filterContext);
        }

        protected override void OnAuthentication(AuthenticationContext filterContext)
        {
            base.OnAuthentication(filterContext);
        }

        protected override void OnAuthenticationChallenge(AuthenticationChallengeContext filterContext)
        {
            base.OnAuthenticationChallenge(filterContext);

        }
    }
}