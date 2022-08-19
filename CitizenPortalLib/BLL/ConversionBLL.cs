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
    public class ConversionBLL: BLLBase
    {
        private ConversionDAL m_ConversionDAL;
        public ConversionBLL()
        {
            m_ConversionDAL = new ConversionDAL();
        }

        public DataTable InsertConversion(Conversion_DT objConversion_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_ConversionDAL.InsertConversion(objConversion_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetConversion(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_ConversionDAL.GetConversion(ServiceID, AppID);

            return t_AppDS;
        }

        public DataTable InsertMutation(Mutation_DT objMutation_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_ConversionDAL.InsertMutation(objMutation_DT, AFields);
            return t_AppDT;
        }

         public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_ConversionDAL.GetAppDetails(ServiceID, AppID);
            return t_AppDS;
        }

    }
}
