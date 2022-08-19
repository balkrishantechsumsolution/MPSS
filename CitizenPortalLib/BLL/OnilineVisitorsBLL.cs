using CitizenPortalLib.DAL;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace CitizenPortalLib.BLL
{
  
  public   class OnilineVisitorsBLL  
    {

 
        private VisitorsCountDAL objVisitorsCountDAL = new VisitorsCountDAL();

        public void AddOnlineVisitor()
        {
            objVisitorsCountDAL.AddOnlineVistor();

        }

        public String GetAllOnlineVisitors()
        {
            return objVisitorsCountDAL.GetAllOnlineVisiors2();

        }



    }
}
