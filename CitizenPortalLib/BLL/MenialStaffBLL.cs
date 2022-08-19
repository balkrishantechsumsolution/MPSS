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
    public class MenialStaffBLL: BLLBase
    {
        private MenialStaffDAL m_MenialStaffDAL;
        public MenialStaffBLL()
        {
            m_MenialStaffDAL = new MenialStaffDAL();
        }

        public DataTable InsertMenialStaffData(MenialStaffProfile_DT objMenialStaff_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_MenialStaffDAL.InsertMenialStaffData(objMenialStaff_DT, AFields);
            return t_AppDT;
        }

        public DataTable GetBatallionList(string categoryCode)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MenialStaffDAL.GetBatallionList(categoryCode);
            return t_AppDS;
        }
    }
}
