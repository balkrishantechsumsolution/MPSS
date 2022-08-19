using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class AdminLoginDAL : DALBase
    {
        Database m_DataBase;

        public AdminLoginDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public AdminLoginDAL()
            : base()
        {

        }

        static string TablemstUser = "mstUsers";     

        internal DataTable ValidateLogin(string LoginID, string Password)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "SELECT A.LoginID, A.UserType,A.FullName As AdminName from mstUsers A where UserType = 'Admin' And Active = '1' And LoginID = @LoginID And Password = @Password";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.String, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@Password", DbType.String, Password);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }        

    }
}
