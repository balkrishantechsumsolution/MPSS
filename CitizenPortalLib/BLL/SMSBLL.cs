using CitizenPortalLib.DAL;
using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitizenPortalLib.BLL
{
    public class SMSBLL: BLLBase
    {
        private SMSDAL m_SMSDAL;
        public SMSBLL()
        {
            m_SMSDAL = new SMSDAL();
        }

        public DataTable Insert(SMS_DT objSMS_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            m_SMSDAL.Insert(objSMS_DT, AFields);

            return t_AppDT;
        }
    }
}
