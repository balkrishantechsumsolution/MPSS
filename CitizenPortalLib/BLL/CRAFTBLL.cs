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
    public class CRAFTBLL:BLLBase
    {
        private CRAFTDAL m_CRAFTDAL;
        public CRAFTBLL()
        {
            m_CRAFTDAL = new CRAFTDAL();
        }

        //Inserting CRAFT Data In Table//
        public DataTable InsertCRAFT(CRAFT_DT objCRAFT_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_CRAFTDAL.Insert(objCRAFT_DT, AFields);

            return t_AppDT;
        }


        //Getting Data For CRAFT Acknowledgment//
        public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_CRAFTDAL.GetAppDetails(ServiceID, AppID);
            return t_AppDS;
        }
    }
}
