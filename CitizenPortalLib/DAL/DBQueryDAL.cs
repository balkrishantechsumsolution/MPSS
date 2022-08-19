using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;

namespace CitizenPortalLib.DAL
{
    public class DBQueryDAL
    {
        protected string ConnectionString = "FrameDB";
        protected Database m_DatabaseObject;
        Database m_DataBase;

        public Database DatabaseObject
        {
            get { return m_DatabaseObject; }
            set { m_DatabaseObject = value; }
        }

        public  DBQueryDAL(Database DatabaseObj)
        {
            m_DatabaseObject = DatabaseObj;              
        }

        public DBQueryDAL()
        {
            DatabaseObject = DatabaseFactory.CreateDatabase("FrameDB");
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

        internal System.Data.DataTable GetDBObjects(string DB)
        {
            DataTable t_DT;

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            using (DbConnection connection = m_DataBase.CreateConnection())
            {
                connection.Open();
                connection.ChangeDatabase(DB);

                DataTable schema = connection.GetSchema("Tables");

                t_DT = new DataTable();
                DataRow t_Row = null;

                t_DT.Columns.Add("Object_Name", typeof(string));

                t_DT.AcceptChanges();

                foreach (DataRow row in schema.Rows)
                {
                    t_Row = t_DT.NewRow();
                    t_Row["Object_Name"] = row[2].ToString();
                    t_DT.Rows.Add(t_Row);
                }

                t_DT.AcceptChanges();
                schema = null;

                t_DT.DefaultView.Sort = "Object_Name ASC";

                return t_DT;
            }
        }

        internal DataTable ExecuteOnDB(string DBName, string SQLQuery)
        {
            DataSet t_DS = new DataSet();
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            using (IDbConnection connection = m_DataBase.CreateConnection())
            {
                connection.Open();
                connection.ChangeDatabase(DBName);

                using (IDbCommand selectCommand = connection.CreateCommand())
                {
                    String SQLCommand = SQLQuery;

                    try
                    {
                        IDbDataAdapter t_dataAdapter = new System.Data.SqlClient.SqlDataAdapter();

                        selectCommand.CommandText = SQLQuery;
                        selectCommand.Connection = connection;
                        t_dataAdapter.SelectCommand = selectCommand;
                        t_dataAdapter.Fill(t_DS);

                        t_dataAdapter = null;
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }

                    return t_DS.Tables[0];
                }
            }
        }
    }
}
