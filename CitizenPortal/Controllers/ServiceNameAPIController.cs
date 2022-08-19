using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CitizenPortal.Controllers
{
    public class ServiceNameAPIController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public IHttpActionResult Get(int id)
        {
            Dictionary<string, string> resDictionary = new Dictionary<string, string>();

            CitizenPortalLib.BLL.ServicesBLL t_ServicesBLL = new CitizenPortalLib.BLL.ServicesBLL();
            System.Data.DataTable dt = t_ServicesBLL.GetServiceName(id);

            if (dt != null && dt.Rows.Count > 0)
            {
                resDictionary.Add("lblSvcName", dt.Rows[0]["SvcName"].ToString());
            }

            return Ok(resDictionary);

            //return "value";
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