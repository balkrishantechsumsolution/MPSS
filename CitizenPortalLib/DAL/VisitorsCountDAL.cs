using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
  public   class VisitorsCountDAL: DALBase
    {

        Database m_DataBase;

        public VisitorsCountDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public VisitorsCountDAL()
            : base()
        {

        }




        /// <summary>
        /// Created By: Manoj dhyani
        /// Created Date : 07 Jan 2016
        /// Created For : Add online visitors to the database
        /// </summary>
        #region Add online Visitor in database
        public void AddOnlineVistor() 
        {
            object objTotal = "";
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {

                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("TotalVisitorsSP");

                //m_DataBase.AddInParameter(selectCommand, "@flag", DbType.String, "GetTotalVisitors");
                 m_DataBase.ExecuteNonQuery(selectCommand);

              
            }
            finally
            {

            }

        }
        #endregion end region online Visitor in database   

 



        /// <summary>
        /// Created By: Manoj dhyani
        /// Created Date : 07 Jan 2016
        /// Created For :
        /// </summary>
        internal string GetAllOnlineVisiors2( )
        {
          
            object objTotal = "";
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
               
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("TotalVisitorsSP");
                
                m_DataBase.AddInParameter(selectCommand, "@flag", DbType.String, "GetTotalVisitors");
                objTotal = m_DataBase.ExecuteScalar ( selectCommand);
                
                if (Convert.ToString(objTotal) != "")
                {
                    objTotal.ToString ();
                }

                return objTotal.ToString();
            }
            finally
            {
               
            }
        }











    }
}
