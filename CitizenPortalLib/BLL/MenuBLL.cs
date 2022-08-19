using CitizenPortalLib.DAL;
using CitizenPortalLib.PortalViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace CitizenPortalLib.BLL
{
    public class MenuBLL : BLLBase
    {
        private MenuDAL m_MenuDAL;
   
        public MenuBLL()
        {
            m_MenuDAL = new MenuDAL();
        }

        public List<MenuDataModel> GetAllMenus(string[] RoleID)
        {
            List<MenuDataModel> lst = new List<MenuDataModel>();
            DataTable table = m_MenuDAL.GetMenus(string.Join(",", RoleID));

            for (int i = 0; i < table.Rows.Count; i++)            
            {
                MenuDataModel obj = new MenuDataModel();
                obj.MenuId = Convert.ToInt32(table.Rows[i]["MenuId"]);
                obj.MenuHeading = table.Rows[i]["MenuHeading"].ToString();
                obj.PARENTID = Convert.ToInt32(table.Rows[i]["Parentid"].ToString());
                obj.MenuOrder = Convert.ToInt32(table.Rows[i]["Level"].ToString());
                obj.HREF = "";
                lst.Add(obj);
            }

            ////RoleMenuMappingDataModel objRoleMap = new RoleMenuMappingDataModel()
            ////{
            ////    RoleId = string.Join(",", RoleID),
            ////    MenuData = lst
            ////};

            return lst;
        }

    }
}
