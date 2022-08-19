using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CitizenPortalLib.DataStructs;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace CitizenPortalLib.DAL
{
   internal class ServiceFeedBackDAL: DALBase
    {
        Database m_DataBase;
        internal DataTable InsertServiceFeedBack(ServiceFeedBack_DT objServiceFeedBack_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            try
            {
                m_DataBase = Factory.Create(this.ConnectionString);

                cmdInsert = qb.GetInsertCommandV3(objServiceFeedBack_DT, "InsertServiceFeedBackSP", aFields);

             
                Reader = m_DataBase.ExecuteReader(cmdInsert);
                if (Reader != null)
                    oDataTable.Load(Reader);

               
            } 

            catch (Exception ex)
            {

                throw ex;
            }
            return oDataTable;
        }
    }

}
