using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CitizenPortalLib.DAL;
using System.Data;
using CitizenPortalLib.DataStructs;
using System.Transactions;

namespace CitizenPortalLib.BLL
{
    public class CitizenLoginBLL : BLLBase
    {
        private CitizenLoginDAL m_CitizenLoginDAL;

        public CitizenLoginBLL()
        {
            m_CitizenLoginDAL = new CitizenLoginDAL();
        }

        public DataTable ValidateLogin(string LoginID, string Password)
        {
            return m_CitizenLoginDAL.ValidateLogin(LoginID, Password);
        }

        public string GetVillageCode(string LoginID)
        {
            return m_CitizenLoginDAL.GetVillageCode(LoginID);
        }
               
    }
}
