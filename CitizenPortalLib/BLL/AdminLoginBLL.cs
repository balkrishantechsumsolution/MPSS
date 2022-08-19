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
    public class AdminLoginBLL : BLLBase
    {
        private AdminLoginDAL m_AdminLoginDAL;

        public AdminLoginBLL()
        {
            m_AdminLoginDAL = new AdminLoginDAL();
        }

        public DataTable ValidateLogin(string LoginID, string Password)
        {
            return m_AdminLoginDAL.ValidateLogin(LoginID, Password);
        }

    }
}
