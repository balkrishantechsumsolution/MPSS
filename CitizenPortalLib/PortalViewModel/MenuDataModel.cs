using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace CitizenPortalLib.PortalViewModel
{
    public class MenuDataModel : BaseModel, IComparable
    {
        public int MenuId { get; set; }

        [Required(ErrorMessage = "Required")]
        public string MenuHeading { get; set; }

        [Required(ErrorMessage = "Required")]
        public string HREF { get; set; }

        public int? MenuOrder { get; set; }

        public int? PARENTID { get; set; }
        public int Isvisible { get; set; }

        public string Area { get; set; }
        public string Controller { get; set; }
        public string Action { get; set; }
        public ICollection<MenuDataModel> ChildLocations { get; set; }

        public MenuDataModel()
        {
            ChildLocations = new HashSet<MenuDataModel>();
        }

        public int CompareTo(int obj)
        {
            return this.MenuId.CompareTo(obj);
        }

        public int CompareTo(object obj)
        {
            throw new NotImplementedException();
        }

    }

    public class RoleMenuMappingDataModel : BaseModel, System.Collections.IEnumerable
    {
        public int? RoleMenuId { get; set; }
        [Required(ErrorMessage = "Required")]
        public string RoleId { get; set; }
        public IList<MenuDataModel> MenuData { get; set; }
        public string MenuIds { get; set; }

        [Required(ErrorMessage = "Required")]
        public int SurveyId { get; set; }

        public System.Collections.IEnumerator GetEnumerator()
        {
            foreach (object o in MenuData)
            {
                if (o == null)
                {
                    break;
                }
                yield return o;
            }
        }
    }
}
