using CitizenPortal.DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;


namespace CitizenPortal.Security
{
    public class CustomAuthorizeAttribute : AuthorizeAttribute
    {
        public string UsersConfigKey { get; set; }
        public string RolesConfigKey { get; set; }

        protected virtual CustomPrincipal CurrentUser
        {
            get { return HttpContext.Current.User as CustomPrincipal; }
        }

        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            if (filterContext.HttpContext.Request.IsAuthenticated)
            {
                var authorizedUsers = ConfigurationManager.AppSettings[UsersConfigKey];
                var authorizedRoles = ConfigurationManager.AppSettings[RolesConfigKey];

                Users = String.IsNullOrEmpty(Users) ? authorizedUsers : Users;
                Roles = String.IsNullOrEmpty(Roles) ? authorizedRoles : Roles;
                
                if (!String.IsNullOrEmpty(Roles))
                {
                    if (!CurrentUser.IsInRole(Roles))
                    {
                        filterContext.Result = new RedirectToRouteResult(new
                     RouteValueDictionary(new { controller = "Error", action = "AccessDenied" }));

                       // base.OnAuthorization(filterContext); //returns to login url
                    }
                }

                if (!String.IsNullOrEmpty(Users))
                {
                    if (!Users.Contains(CurrentUser.LoginID.ToString()))
                    {
                        filterContext.Result = new RedirectToRouteResult(new
                     RouteValueDictionary(new { controller = "Error", action = "AccessDenied" }));

                       // base.OnAuthorization(filterContext); //returns to login url
                    }
                }
            }
           
        }

        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            if (httpContext == null)
            {
                throw new ArgumentNullException("httpContext");
            }

            //SalesDBContext db = new SalesDBContext();
            //UserManager<ApplicationUser> userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            //ApplicationDbContext dbu = new ApplicationDbContext();

            //TODO: Logic to be set dynamically to fetch the Roles based on UserID
            //CurrentUser.UserId

            bool isUserAuthorized = base.AuthorizeCore(httpContext);

            //string[] permissions = Permissions.Split(',').ToArray();//To be checked
            IEnumerable<string> perms = null;
            //IEnumerable<string> perms = permissions.Intersect(db.Permissions.Select(p => p.ActionName));
            List<Role> roles = new List<Role>();

            if (perms.Count() > 0)
            {
                foreach (var item in perms)
                {
                    //var currentUserId = httpContext.User.Identity.GetUserId();
                    //var relatedPermisssionRole = dbu.Roles.Find(db.Permissions.Single(p => p.ActionName == item).RoleId).Name;
                    //if (userManager.IsInRole(currentUserId, relatedPermisssionRole))
                    //{
                    //    return true;
                    //}
                }
            }
            return false;
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            filterContext.Result = new HttpUnauthorizedResult();
            base.HandleUnauthorizedRequest(filterContext);
        }
    }
}