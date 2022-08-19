using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CitizenPortal.Controllers
{
    public class WalletAPIController : ApiController
    {
        // GET api/<controller>
        public IHttpActionResult Get()
        {
            string t_Balance = "0";

            if (System.Web.HttpContext.Current.Session["LoginID"] == null)
                return null;

            if (System.Web.HttpContext.Current.Session["UserType"] != null && System.Web.HttpContext.Current.Session["UserType"].ToString() == "KIOSK")
            {
                string t_LoginID = "";
                LoginBLL login = new LoginBLL();
                DataTable t_DT = null;

                t_LoginID = System.Web.HttpContext.Current.Session["LoginID"].ToString();
                t_DT = login.GetKioskDetail(t_LoginID);

                t_Balance = t_DT.Rows[0]["Balance"].ToString();

            }

            Dictionary<string, string> resDictionary = new Dictionary<string, string>();
            resDictionary.Add("lblBalance", t_Balance);

            return Ok(resDictionary);
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public void Post([FromBody]string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}