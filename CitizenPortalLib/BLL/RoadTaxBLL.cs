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
    public class RoadTaxBLL : BLLBase
    {
        private RoadTaxDAL m_RoadTaxDAL;
        public RoadTaxBLL()
        {
            m_RoadTaxDAL = new RoadTaxDAL();
        }

        //Inserting RoadTax Data In Table//
        public DataTable InsertRoadTaxFormData(RoadTaxForm_DT objRoadTaxForm_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_RoadTaxDAL.InsertRoadTaxFormData(objRoadTaxForm_DT, AFields);

            return t_AppDT;
        }


        //Getting Data For RoadTax Acknowledgment//
        public DataSet GetRoadTaxFormData(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_RoadTaxDAL.GetRoadTaxFormData(ServiceID, AppID);
            return t_AppDS;
        }


        public DataSet GetRoadTaxFinalData(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_RoadTaxDAL.GetRoadTaxFinalData(ServiceID, AppID);
            return t_AppDS;
        }

        public  DataTable InsertRoadTaxFinalData(RoadTaxFinal_DT objRoadTaxFinal_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_RoadTaxDAL.InsertRoadTaxFinalData(objRoadTaxFinal_DT, AFields);

            return t_AppDT;
        }
    }
}