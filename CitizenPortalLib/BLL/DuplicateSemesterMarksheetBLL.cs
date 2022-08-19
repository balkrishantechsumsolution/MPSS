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
    public class DuplicateSemesterMarksheetBLL : BLLBase
    {
        private DuplicateSemesterMarksheetDAL m_DuplicateSemesterMarksheetDAL;
        public DuplicateSemesterMarksheetBLL()
        {
            m_DuplicateSemesterMarksheetDAL = new DuplicateSemesterMarksheetDAL();
        }
        public DataTable InsertDuplicateSemesterMarksheet(NewDuplicateSemesterMarksheet_DT objNewDuplicateSemesterMarksheet_DT, string[] AFields2)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_DuplicateSemesterMarksheetDAL.InsertDuplicateSemesterMarksheet(objNewDuplicateSemesterMarksheet_DT, AFields2);
            return t_AppDT;

        }

    }
  
}
