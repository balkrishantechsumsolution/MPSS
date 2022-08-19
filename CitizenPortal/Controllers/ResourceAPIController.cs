using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Resources;
using System.Web.Http;

namespace CitizenPortal.Controllers
{
    public class ResourceAPIController : ApiController
    {
        //[HttpGet]
        //[Route("api/accessresources")]
        public IHttpActionResult GetResourceStringsFromResources()
        {
            CultureInfo culture = CultureInfo.CurrentUICulture;
            if (System.Web.HttpContext.Current.Session["CultureInfo"] != null)
            {
                culture = new CultureInfo(System.Web.HttpContext.Current.Session["CultureInfo"].ToString());
            }

            ResourceManager _resources = new ResourceManager("CitizenPortalLib.Resources.EmployeeInfo", typeof(CitizenPortalLib.Resources.EmployeeInfo).Assembly);     
            //1.   
            ResourceSet resources = _resources.GetResourceSet(culture, true, true);
            Dictionary<string, string> resDictionary = new Dictionary<string, string>();
            //2.
            foreach (DictionaryEntry resource in resources)
            {
                resDictionary.Add(resource.Key.ToString(), resource.Value.ToString());
            }
            //3.
            return Ok(resDictionary);
        }

    }
}
