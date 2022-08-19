using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CitizenPortalLib.DAL;
using CitizenPortalLib.DataStructs;
using System.Data;

namespace CitizenPortalLib.BLL
{
   public class UGMarksEntryBLL : BLLBase
    {
        
        private UGMarksEntryDAL m_UGMarksEntryDAL;
        public UGMarksEntryBLL()
        {
            m_UGMarksEntryDAL = new UGMarksEntryDAL();
        }
        public DataTable InsertUGMarksEntry(UGMarksEntry_DT data, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_UGMarksEntryDAL.InsertUGMarksEntry(data, AFields);
            return t_AppDT;
        }

        public DataTable InsertOUATUGEducation(OUATUGEducation_DT data, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_UGMarksEntryDAL.InsertOUATUGEducation(data, AFields);
            return t_AppDT;
        }
    }
}
