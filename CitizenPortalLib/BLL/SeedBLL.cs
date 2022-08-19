using CitizenPortalLib.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitizenPortalLib.BLL
{
    public class SeedBLL: BLLBase
    {
        private SeedDAL m_SeedDAL;

        public SeedBLL()
        {
            m_SeedDAL = new SeedDAL();
        }

        //public DataTable ValidateLogin(string LoginID, string Password)
        //{
        //    return m_SeedDAL.ValidateLogin(LoginID, Password);
        //}
    }
}
