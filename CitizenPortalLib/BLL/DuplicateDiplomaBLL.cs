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
    public class DuplicateDiplomaBLL: BLLBase
    {
        private DuplicateDiplomaDAL m_DuplicateDiplomaDAL;
        public DuplicateDiplomaBLL()
        {
            m_DuplicateDiplomaDAL = new DuplicateDiplomaDAL();
        }

        public DataTable InsertDuplicateDiploma(DuplicateDiploma_DT objDuplicateDiploma_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_DuplicateDiplomaDAL.InsertDuplicateDiploma(objDuplicateDiploma_DT, AFields);
            return t_AppDT;
        }

        public DataSet GetDuplicateDiploma(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_DuplicateDiplomaDAL.GetDuplicateDiploma(ServiceID, AppID);
            return t_AppDS;
        }

        public DataSet GetStudentDetail(string RegNo)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_DuplicateDiplomaDAL.GetDiplomaDetail(RegNo);
            return t_AppDS;
        }

        public DataTable GetlegacyData(string m_AppID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_DuplicateDiplomaDAL.GetlegacyData(m_AppID);
            return t_AppDS;
        }
    }
}
