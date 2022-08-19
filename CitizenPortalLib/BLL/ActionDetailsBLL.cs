using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CitizenPortalLib.DAL;
using CitizenPortalLib.DataStructs;
using System.Data;

namespace CitizenPortalLib.BLL
{
    
    public class ActionDetailsBLL:BLLBase
    {
        private ActionDetailsDLL actionDetailsDLL = new ActionDetailsDLL();
        public DataTable GetActionHistoryData(string ServiceID, string AppID)
        {
            DataTable dtGet = new DataTable();
            dtGet = actionDetailsDLL.getActionHistoryData(ServiceID, AppID);
            return dtGet;
        }

        public DataTable GetActionDetails(string AppID)
        {
            DataTable dtGet = new DataTable();
            dtGet = actionDetailsDLL.getActionDetails(AppID);
            return dtGet;
        }
    }
}
