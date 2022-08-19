using CitizenPortal.DAL;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CitizenPortal
{
    public class User
    {
        public string UserId { get; set; }

        [Required]
        public String LoginID { get; set; }

        [Required]
        public String Email { get; set; }

        [Required]
        public String Password { get; set; }

        public String FirstName { get; set; }
        public String LastName { get; set; }

        public Boolean IsActive { get; set; }
        public DateTime CreateDate { get; set; }

        public virtual ICollection<Role> Roles { get; set; }
    }
}