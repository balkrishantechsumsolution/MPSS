using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CitizenPortal.Models
{
    public class FogotModel
    {
        public string CaptchaText { set; get; }
        public string EmailID { set; get; }
        [Required(ErrorMessage = "Please enter your Profile ID"),]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
       public string ProfileID { set; get; } 
        public string OTP { get; set; }
    }
}