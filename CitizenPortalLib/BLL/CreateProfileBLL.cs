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
    public class CreateProfileBLL : BLLBase
    {
        private CreateProfileDAL m_CreateProfileDAL;
        public CreateProfileBLL()
        {
            m_CreateProfileDAL = new CreateProfileDAL();
        }

        public DataTable InsertCreateProfile(CreateProfile_DT objCreateProfile_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_CreateProfileDAL.InsertCreateProfile(objCreateProfile_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_CreateProfileDAL.GetAppDetails(ServiceID, AppID);

            return t_AppDS;
        }

        public DataSet GetDeclaration( string UID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_CreateProfileDAL.GetDeclaration(UID);

            return t_AppDS;
        }

        public DataSet GetCreateProfileData(string data)
        {
            DataSet t_AppDT = null;

            t_AppDT = m_CreateProfileDAL.GetCreateProfileData(data);

            return t_AppDT;
        }
    }
}
