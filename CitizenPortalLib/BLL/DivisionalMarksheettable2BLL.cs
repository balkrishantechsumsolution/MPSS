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
    public class DivisionalMarksheettable2BLL : BLLBase
    {
        private DivisionalMarksheettable2DAL m_DivisionalMarksheettb2DAL;
        public DivisionalMarksheettable2BLL()
        {
            m_DivisionalMarksheettb2DAL = new DivisionalMarksheettable2DAL();
        }

        public DataTable InsertDivisionalMarksheetTb2(DivisionalMarksheetTable2_DT objDivisionalMrksheetTB2_DT, string[] AFields2)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_DivisionalMarksheettb2DAL.InsertDivisionalMarksheetTb2(objDivisionalMrksheetTB2_DT, AFields2);
            return t_AppDT;
        }
        
    }


}
