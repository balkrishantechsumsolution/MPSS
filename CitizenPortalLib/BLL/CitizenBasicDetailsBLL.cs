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
    public class CitizenBasicDetailsBLL : BLLBase
    {
        private CitizenBasicDetailsDAL m_CitizenBasicDetailsDAL;
        public CitizenBasicDetailsBLL()
        {
            m_CitizenBasicDetailsDAL = new CitizenBasicDetailsDAL();
        }

        public DataTable InsertCitizenBasicDetails(CitizenBasicDetails_DT objCitizenBasicDetails_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_CitizenBasicDetailsDAL.InsertCitizenBasicDetails(objCitizenBasicDetails_DT, AFields);

            return t_AppDT;
        }
       
        public DataTable GetUserDetails(string UID)
        {
            DataTable t_AppDS = null;

            t_AppDS = m_CitizenBasicDetailsDAL.GetUserDetails(UID);

            return t_AppDS;
        }

        public DataTable GetSVIDdetail(string svid, string langID)
        {
            DataTable t_AppDS = null;

            t_AppDS = m_CitizenBasicDetailsDAL.GetSVIDdetail(svid, langID);

            return t_AppDS;
        }
        public DataTable BindCategory()
        {
            DataTable t_AppDS = null;

            t_AppDS = m_CitizenBasicDetailsDAL.BindCategory();

            return t_AppDS;
        }
        public DataTable BindReligion()
        {
            DataTable t_AppDS = null;

            t_AppDS = m_CitizenBasicDetailsDAL.BindReligion();

            return t_AppDS;
        }
        public DataTable BindMaritalstatus()
        {
            DataTable t_AppDS = null;

            t_AppDS = m_CitizenBasicDetailsDAL.BindMaritalstatus();

            return t_AppDS;
        }
        
    }
}
