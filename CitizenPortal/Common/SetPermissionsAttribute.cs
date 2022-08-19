using CitizenPortal.DAL;
using CitizenPortal.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace CitizenPortal.Common
{
    /// <summary>
    /// Custom authorization attribute for setting per-method accessibility 
    /// </summary>
    [AttributeUsage(AttributeTargets.Method, AllowMultiple = false, Inherited = true)]
    public class SetPermissionsAttribute : AuthorizeAttribute
    {
        /// <summary>
        /// The name of each action that must be permissible for this method, separated by a comma.
        /// </summary>
        public string Permissions { get; set; }

        protected virtual CustomPrincipal CurrentUser
        {
            get { return HttpContext.Current.User as CustomPrincipal; }
        }

        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            //SalesDBContext db = new SalesDBContext();
            //UserManager<ApplicationUser> userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            //ApplicationDbContext dbu = new ApplicationDbContext();
            
            //TODO: Logic to be set dynamically to fetch the Roles based on UserID
            //CurrentUser.UserId

            bool isUserAuthorized = base.AuthorizeCore(httpContext);

            string[] permissions = Permissions.Split(',').ToArray();
            IEnumerable<string> perms = null;
            //IEnumerable<string> perms = permissions.Intersect(db.Permissions.Select(p => p.ActionName));
            List <Role> roles = new List<Role>();

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
    }
}
