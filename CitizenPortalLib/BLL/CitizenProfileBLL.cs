using CitizenPortalLib.DAL;
using CitizenPortalLib.DataStructs;
using System.Data;

namespace CitizenPortalLib.BLL
{
    public class CitizenProfileBLL : BLLBase
    {
        private CitizenProfileDAL m_CitizenProfileDAL;

        public CitizenProfileBLL()
        {
            m_CitizenProfileDAL = new CitizenProfileDAL();
        }

        public DataTable InsertCitizenProfile(CitizenProfile_DT objCitizenProfile_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_CitizenProfileDAL.InsertCitizenProfile(objCitizenProfile_DT, AFields);
            return t_AppDT;
        }

        public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_CitizenProfileDAL.GetAppDetails(ServiceID, AppID);
            return t_AppDS;
        }

        public DataSet GetDeclaration(string UID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_CitizenProfileDAL.GetDeclaration(UID);
            return t_AppDS;
        }

        public DataSet GetCitizenProfileData(string data)
        {
            DataSet t_AppDT = null;
            t_AppDT = m_CitizenProfileDAL.GetCitizenProfileData(data);
            return t_AppDT;
        }

        public DataTable InsertOISFProfileData(OISFProfile_DT objOISFProfile_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_CitizenProfileDAL.InsertOISFProfileData(objOISFProfile_DT, AFields);
            return t_AppDT;
        }

        //battalion implementation
        public DataTable InsertOISFProfileDataOffLine(OISFProfile_DT objOISFProfile_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_CitizenProfileDAL.InsertOISFProfileDataOffLine(objOISFProfile_DT, AFields);
            return t_AppDT;
        }

        public DataTable InsertOUATApp(OUATProfile_DT data, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_CitizenProfileDAL.InsertOUATApp(data, AFields);
            return t_AppDT;
        }

        public DataTable InsertOUATFormA(OUATFormA_DT data, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_CitizenProfileDAL.InsertOUATFormA(data, AFields);
            return t_AppDT;
        }

        public DataTable InsertOUATFormB(OUATFormA_DT data, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_CitizenProfileDAL.InsertOUATFormB(data, AFields);
            return t_AppDT;
        }

        public DataTable InsertOUATAgroFormA(OUATAgroFormA_DT data, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_CitizenProfileDAL.InsertOUATAgroFormA(data, AFields);
            return t_AppDT;
        }

        public DataTable InsertOUATAgroFormB(OUATAgroFormB_DT data, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_CitizenProfileDAL.InsertOUATAgroFormB(data, AFields);
            return t_AppDT;
        }
    }
}