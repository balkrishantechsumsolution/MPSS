using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace CitizenPortal.Models
{
    [Table("PgAllResultVerifyApiTb")]
    public class PgAllResultVerifyApiTb
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int RowID { set; get; }
        public string Pgstatus { get; set; }
        public string ezpaytranid { get; set; }
        public string amount { get; set; }
        public string trandate { get; set; }
        public string pgreferenceno { get; set; }
        public string sdt { get; set; }

        public Boolean? IsProcess { set; get; } 
        public DateTime? ProcessDate { set; get; }
        public DateTime CreatedOn { set; get; }
        public string AppID { set; get; }
        public Boolean IsActive { set; get; }
    }
}