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
     public class DivisionalMarksheetBLL : BLLBase
    {
        private DivisionalMarksheetDAL m_DivisionalMarksheetDAL;
        public DivisionalMarksheetBLL()
        {
            m_DivisionalMarksheetDAL = new DivisionalMarksheetDAL();
        }

        public DataTable InsertDivisionalMarksheet(DivisionalMarksheet_DT objDivisionalMrksheet_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_DivisionalMarksheetDAL.InsertDivisionalMarksheet(objDivisionalMrksheet_DT, AFields);
            return t_AppDT;
        }
    }
}
