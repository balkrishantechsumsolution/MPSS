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
    public class KIOSKLoginBLL : BLLBase
    {
        private KIOSKLoginDAL m_KIOSKLoginDAL;

        public KIOSKLoginBLL()
        {
            m_KIOSKLoginDAL = new KIOSKLoginDAL();
        }

        public DataTable ValidateLogin(string LoginID, string Password)
        {
            return m_KIOSKLoginDAL.ValidateLogin(LoginID, Password);
        }
               
    }
}
