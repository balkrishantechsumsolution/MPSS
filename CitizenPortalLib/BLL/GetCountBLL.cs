using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;
using CitizenPortalLib.DAL;




namespace CitizenPortalLib.BLL
{
   public class GetCountBLL:BLLBase
    {
        private GetcountDAL m_GetcountDAL;
        public GetCountBLL()
        {
            m_GetcountDAL = new GetcountDAL();
        }
        public DataTable Getcount()
        {
            DataTable t_CountDS = null;

            t_CountDS = m_GetcountDAL.GetCountnumber();

            return t_CountDS;
        }


    }
}
