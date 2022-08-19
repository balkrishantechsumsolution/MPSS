using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace CitizenPortalLib.DAL
{
    public class DALBase
    {
        protected string ConnectionString = "MasterDB";

        protected Database m_DatabaseObject;
        protected DatabaseProviderFactory _factory;

        public Database DatabaseObject
        {
            get { return m_DatabaseObject; }
            set { m_DatabaseObject = value; }
        }

        public DatabaseProviderFactory Factory
        {
            get { return _factory; }
            set { _factory = value; }
        }

        public  DALBase(Database DatabaseObj)
        {
            m_DatabaseObject = DatabaseObj;              
        }

        public DALBase()
        {
            //DatabaseFactory.SetDatabaseProviderFactory(new DatabaseProviderFactory());
            _factory= new DatabaseProviderFactory();
            DatabaseObject = _factory.Create(ConnectionString);
        }

        public System.Data.DataTable ExecuteCommand(string Query)
        {
            BLL.CommonBLL CommonBLL = new BLL.CommonBLL();
            return CommonBLL.ExecuteCommand(Query);
        }

        public System.Data.DataTable ExecuteCommand(string CustomConnectionString, string Query)
        {
            BLL.CommonBLL CommonBLL = new BLL.CommonBLL();
            return CommonBLL.ExecuteCommand(CustomConnectionString, Query);
        }
    }
}
