using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CitizenPortalLib.PortalViewModel
{
    public class BaseModel
    {
        public int CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedClientIP { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public string ModifiedClientIP { get; set; }
    }
}
