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
    public class BasicDetailsBLL : BLLBase
    {
        private BasicDetailsDAL m_BasicDetailsDAL;
        public BasicDetailsBLL()
        {
            m_BasicDetailsDAL = new BasicDetailsDAL();
        }

        public DataTable Insert(BasicDetails_DT objBasicDetails_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_BasicDetailsDAL.Insert(objBasicDetails_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_BasicDetailsDAL.GetAppDetails(ServiceID, AppID);

            return t_AppDS;
        }

        public DataSet GetDeclaration( string UID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_BasicDetailsDAL.GetDeclaration(UID);

            return t_AppDS;
        }


        public DataSet GetUIDKeyField(string UID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_BasicDetailsDAL.GetUIDKeyField(UID);

            return t_AppDS;
        }
        public DataSet CheckLocalAadhaar(string UID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_BasicDetailsDAL.CheckLocalAadhaar(UID);
            return t_AppDS;
        }
    }
}
