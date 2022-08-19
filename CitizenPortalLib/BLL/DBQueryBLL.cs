using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CitizenPortal.DBQueryFunctions.BLL;
using System.Data;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DAL;

namespace CitizenPortal.DBQueryFunctions.BLL
{
    public class DBQueryBLL : BLLBase
    {
        private DBQueryDAL m_DBQueryDAL;

        public DBQueryBLL()
        {
            m_DBQueryDAL = new DBQueryDAL();
        }

        public DataTable ExecuteCommand(string Query)
        {
            if (Query == "") return null;
            
            try
            {
                return m_DBQueryDAL.ExecuteCommand(Query);
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                throw ex;
            }
            
        }

        public DataTable ExecuteCommand(string CustomConnectionString, string Query)
        {
            if (Query == "") return null;

            return m_DBQueryDAL.ExecuteCommand(CustomConnectionString, Query);
        }

        public DataTable GetDBObjects(string DB)
        {
            return m_DBQueryDAL.GetDBObjects(DB);
        }

        public DataTable ExecuteCommandOnDB(string DBName, string SQLQuery)
        {
            return m_DBQueryDAL.ExecuteOnDB(DBName, SQLQuery);
        }
    }
}
