using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class KIOSKLoginDAL : DALBase
    {
        Database m_DataBase;

        public KIOSKLoginDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public KIOSKLoginDAL()
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
                //String SQLCommand = "SELECT A.KioskID,A.UserType,A.FullName As KioskName, C.Village_Code, A.PaymentFlag FROM mstUsers A Inner Join DC_RegistrationDetails B On A.KioskID = B.KioskID Inner Join TrnAddress C On B.KeyField = C.ParentKey And C.ChildKey = 'KIOSK' where A.Active = '1' And A.LoginID = @LoginID And A.Password = @Password And A.UserType = 'KIOSK'";
                String SQLCommand = "SELECT A.KioskID,A.UserType,A.FullName As KioskName, A.PaymentFlag FROM mstUsers A where A.Active = '1' And A.LoginID = @LoginID And A.Password = @Password";
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
