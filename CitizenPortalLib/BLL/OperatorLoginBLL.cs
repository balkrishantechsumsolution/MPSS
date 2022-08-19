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
    public class OperatorLoginBLL : BLLBase
    {
        private OperatorLoginDAL m_OperatorLoginDAL;

        public OperatorLoginBLL()
        {
            m_OperatorLoginDAL = new OperatorLoginDAL();
        }

        //public DataTable ValidateLogin(string LoginID, string Password)
        //{
        //    return m_OperatorLoginDAL.ValidateLogin(LoginID, Password);
        //}

        public DataTable ValidateOperator(string KIOSKID, string LoginID, string Password)
        {
            return m_OperatorLoginDAL.ValidateOperator(KIOSKID, LoginID, Password);
        }
    }
}
