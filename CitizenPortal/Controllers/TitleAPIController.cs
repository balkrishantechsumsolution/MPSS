using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CitizenPortal.Controllers
{
    public class TitleAPIController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public IHttpActionResult Get(int id)
        {
            //string result = "";

            //if(id == 101)
            //{
            //    result = "lblTitle:APPLICATION FOR SENIOR CITIZEN CERTIFICATE";
            //}

            Dictionary<string, string> resDictionary = new Dictionary<string, string>();
            if (id == 1001)
            {
                resDictionary.Add("lblTitle", "Pendency Report");
            }
            if (id == 002)
            {
                resDictionary.Add("lblTitle", "Document Attachment");
            }
            else if (id == 100)
            {
                resDictionary.Add("lblTitle", "Fetch Basic Information From UID / Profile");
            }
            else if(id == 101)
            {
                resDictionary.Add("lblTitle", "SENIOR CITIZEN CERTIFICATE");
            }
            else if (id == 102)
            {
                //resDictionary.Add("lblTitle", "NATIONAL FAMILY BENEFIT SCHEME");
                resDictionary.Add("lblTitle", "COMMON ONLINE APPLICATION FORM");
            }
            else if (id == 103)
            {
                //resDictionary.Add("lblTitle", "NATIONAL FAMILY BENEFIT SCHEME");
                resDictionary.Add("lblTitle", "BIRTH CERTIFICATE");
            }
            else if (id == 104)
            {
                //resDictionary.Add("lblTitle", "NATIONAL FAMILY BENEFIT SCHEME");
                resDictionary.Add("lblTitle", "Death CERTIFICATE");
            }
            else
            {
                CitizenPortalLib.BLL.KioskRegistrationBLL t_KioskRegistrationBLL = new CitizenPortalLib.BLL.KioskRegistrationBLL();
                System.Data.DataTable dt = t_KioskRegistrationBLL.GetServiceTitle(id);

                if (dt != null && dt.Rows.Count > 0)
                {
                    resDictionary.Add("lblTitle", dt.Rows[0]["SvcName"].ToString());
                }
            }
            return Ok(resDictionary);
            //return result;
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