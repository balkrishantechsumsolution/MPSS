using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class CitizenLoginDAL : DALBase
    {
        Database m_DataBase;

        public CitizenLoginDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public CitizenLoginDAL()
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
                String SQLCommand = "SELECT 'Mahaonline' As KioskID, A.UserType,A.FullName As KioskName from mstUsers A where UserType = 'citizen' And Active = '1' And LoginID = @LoginID And Password = @Password";
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

        internal string GetVillageCode(string LoginID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select B.Village_Code From Citizen_RegistrationDetails A Inner Join trnAddress B On A.KeyField = B.ParentKey And B.Childkey = 'Citizen' Where A.EmailID = @LoginID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.String, LoginID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable.Rows[0]["Village_Code"].ToString();
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
