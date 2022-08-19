using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CitizenPortalLib.DAL;
using System.Data;

namespace CitizenPortalLib.BLL
{
    public class CommonBLL : BLLBase
    {
        private CommonDAL m_CommonDAL;

        public CommonBLL()
        {
            m_CommonDAL = new CommonDAL();
        }

        public DataTable ExecuteCommand(string Query)
        {
            if (Query == "") return null;
            
            try
            {
                return m_CommonDAL.ExecuteCommand(Query);
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                throw ex;
            }
            
        }

        public DataTable ExecuteCommand(string CustomConnectionString, string Query)
        {
            if (Query == "") return null;

            return m_CommonDAL.ExecuteCommand(CustomConnectionString, Query);
        }

        public DataTable GetDBObjects(string DB)
        {
            return m_CommonDAL.GetDBObjects(DB);
        }

        public DataTable ExecuteCommandOnDB(string DBName, string SQLQuery)
        {
            return m_CommonDAL.ExecuteOnDB(DBName, SQLQuery);
        }

        internal string InsertMailDetails(string ServiceID, string AppID, string ProfileID
            , string ToAddress, string CCAddress, string BCCAddress, string Subject, string Body, string IsBodyHtml)
        {
            return m_CommonDAL.InsertMailDetails(ServiceID, AppID, ProfileID
            , ToAddress, CCAddress, BCCAddress, Subject, Body, IsBodyHtml);
        }
        internal DataTable SaveUserRoleAccessPage(string UserID, string UserRole, string UserType, string PageURL, string CreatedBy)
        {
            DataTable dt = new DataTable();
            dt = m_CommonDAL.SaveUserRoleAccessPage(UserID, UserRole, UserType, PageURL, CreatedBy);
            return dt;
        }

        internal DataTable GetUserMenuAccess(string menuRole, string PageURL, string UserID, string UserType)
        {
            DataTable dt = new DataTable();
            dt = m_CommonDAL.GetUserMenuAccess(menuRole, PageURL, UserID, UserType);
            return dt;
        }
    }
}
