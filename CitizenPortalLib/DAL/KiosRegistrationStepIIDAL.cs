using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;

namespace CitizenPortalLib.DAL
{
    class KiosRegistrationStepIIDAL: DALBase
    {
        Database m_DataBase;

        static string TableName = "DC_RegistrationDetails";

        internal void Update(DataStructs.KioskRegistrationStepII_DT objKioskRegistrationStepII_DT, string[] InfoFields, string[] KioskRegistrationStepIIKeyFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetUpdateCommand(objKioskRegistrationStepII_DT, TableName, InfoFields, KioskRegistrationStepIIKeyFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal string GetPaymentType(string KIOSKID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select PaymentFlag from SCA_RegistrationDetails Where SCAID = (Select Kiosktype from DC_RegistrationDetails Where KioskID =@KIOSKID)";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@KIOSKID", DbType.String, KIOSKID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable.Rows[0]["PaymentFlag"].ToString();
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }


        internal void GetDetails(string KeyField, ref string VillageCode, ref string DistrictCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select District_Code, Village_Code from TrnAddress Where ParentKey = @KeyField And ChildKey = 'Kiosk' ";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@KeyField", DbType.String, KeyField);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                if (oDataTable.Rows.Count > 0)
                {
                    DistrictCode = oDataTable.Rows[0]["District_Code"].ToString();
                    VillageCode = oDataTable.Rows[0]["Village_Code"].ToString();
                }
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
