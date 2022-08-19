using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;

namespace CitizenPortalLib.DAL
{
    public class MenuDAL: DALBase
    {
        Database m_DataBase;

        public MenuDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public MenuDAL()
            : base()
        {

        }

        internal DataTable GetMenus(string RoleID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("Login_GetMenusSP");
                m_DataBase.AddInParameter(selectCommand, "@RoleID", DbType.AnsiString, RoleID);
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
