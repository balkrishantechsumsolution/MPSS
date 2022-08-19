using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class KIOSKDetailsDAL : DALBase
    {
        Database m_DataBase;

        public KIOSKDetailsDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public KIOSKDetailsDAL()
            : base()
        {

        }

        static string TablemstUser = "mstUsers";     

        internal DataTable KIOSKDetail(string KIOSKID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select supervisorcomment, ApprovalStatus, FinancialStatus, Financercomment  from DC_RegistrationDetails where KioskID = @KIOSKID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@KIOSKID", DbType.String, KIOSKID); 
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


        internal double GetBalance(string KioskID, int Year)
        {
            double t_Balance = 0;
            DataTable oDataTable = new DataTable();
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            Year = CommonUtility.GetFinancialYear();

            try
            {
                String SQLCommand = @"Select dc_clo_bal As Balance From DC_Ledger Where Year = {0} And Channel_ID = '{1}'";
                SQLCommand = string.Format(SQLCommand, Year, KioskID);
                oDataTable = m_DataBase.ExecuteDataSet(CommandType.Text, SQLCommand).Tables[0];

                if (oDataTable.Rows.Count > 0)
                    t_Balance = Convert.ToDouble(oDataTable.Rows[0]["Balance"]);

                return t_Balance;
            }
            finally
            {

            }

        }

        internal void Update(string RowID, string Status, string Remark)
        {
            int ResultRow;
            string Query = "";

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            Query = "Update " + TablemstUser + " Set Active = '" + Status + "', Remark = '" + Remark + "' Where RowID = " + RowID;

            ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
        }


        internal DataTable KIOSKLogin(string LoginId)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select *  from User_Info where UserName = @LoginId";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@LoginId", DbType.String, LoginId);
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
