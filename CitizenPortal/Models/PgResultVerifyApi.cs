using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace CitizenPortal.Models
{
  
    [Table("PgResultVerifyApi")]
    public class PgResultVerifyApi
    {
       
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int RowID { set; get; }
        public string status { get; set; }
        public string ezpaytranid { get; set; }
        public string amount { get; set; }
        public string trandate { get; set; }
        public string pgreferenceno { get; set; }
        public string sdt { get; set; }
       
        public DateTime CreatedOn { set; get;}
        public string AppID { set; get; }
        public Boolean IsActive { set; get; }
        public Boolean? IsProcess { set; get; }
        public DateTime? ProcessDate { set; get; }
    }
}