using CitizenPortalLib.DAL;
using CitizenPortalLib.DataStructs;
using System.Data;

namespace CitizenPortalLib.BLL
{
    public class FisheriesBLL : BLLBase
    {
        private FisheriesDAL m_FisheriesDAL;

        public FisheriesBLL()
        {
            m_FisheriesDAL = new FisheriesDAL();
        }

        public DataTable InsertFisheries(Fisheries_DT objFisheries_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_FisheriesDAL.Insert(objFisheries_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_FisheriesDAL.GetAppDetails(ServiceID, AppID);
            return t_AppDS;
        }
    }
}