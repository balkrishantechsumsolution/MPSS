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
 

   public class DuplicateSemesterMarksheettb2BLL : BLLBase
    {
        private DuplicateSemesterMarksheettb2DAL m_DuplicateSemesterMarksheettb2DAL;
        public DuplicateSemesterMarksheettb2BLL()
        {
            m_DuplicateSemesterMarksheettb2DAL = new DuplicateSemesterMarksheettb2DAL();
        }

        public DataTable InsertDuplicateSemesterMarksheetTb2(NewDuplicateSemesterMarksheetTb2_DT objNewDuplicateSemesterMarksheetTb2_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_DuplicateSemesterMarksheettb2DAL.InsertDuplicateSemesterMarksheetTb2(objNewDuplicateSemesterMarksheetTb2_DT, AFields);
            return t_AppDT;
        }
    }
}
