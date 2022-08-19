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
    internal class RatingFeedBackDAL: DALBase
    {
        Database m_DataBase;
        internal DataTable InsertRatingFeedBack(RatingFeedBack_DT objRatingFeedBack_DT, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            try
            {
                m_DataBase = Factory.Create(this.ConnectionString);

                cmdInsert = qb.GetInsertCommandV3(objRatingFeedBack_DT, "InsertRatingFeedBackSP", aFields);


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
