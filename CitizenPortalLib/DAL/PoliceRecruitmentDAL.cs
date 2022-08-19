using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class PoliceRecruitmentDAL : DALBase
    {
        Database m_DataBase;

        public PoliceRecruitmentDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public PoliceRecruitmentDAL()
            : base()
        {

        }

        static string DeleteTable = "mstsigningauthority";
        static string TableName = "DC_RegistrationDetails";
        static string AddressDBName = "MahaAddress";
        //static string AddressTableName = AddressDBName + ".dbo.trnAddress";
        static string AddressTableName = "trnAddress";
        static string UserTableName = "mstUsers";
        static string m_AddressConnectionString = "Address";
        static int m_LangId = 1;
        
        internal void Insert(DataStructs.KioskRegistration_DT objKioskRegistration_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objKioskRegistration_DT, TableName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal void InsertAddress(DataStructs.KioskAddressDetails_DT objKioskAddressDetails_DT, string[] AAddressFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objKioskAddressDetails_DT, AddressTableName, AAddressFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal string GenerateID(string SCAID, string DistrictCode, string SubDistrictCode, string VillageCode)
        {
            string t_KioskID = "";
            string t_SeqNo = "";
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select SeqNo From GetSequenceNo";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                t_SeqNo = oDataTable.Rows[0]["SeqNo"].ToString();
                t_KioskID = SCAID + DistrictCode + SubDistrictCode + VillageCode + t_SeqNo;
                return t_KioskID;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }

        }

        internal DataTable GetSCA()
        {
            string Query = "Select SCAID, CompanyName, PaymentFlag From SCA_RegistrationDetails";
            return ExecuteCommand(Query);
        }

        internal int ValidateKioskId(string KioskId)
        {
             DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select count(KIOSKId) As KIOSKCount from PoliceRecruitment Where KIOSKId = @KioskId";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@KioskId", DbType.String, KioskId);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                int t_Count = Convert.ToInt32(oDataTable.Rows[0]["KIOSKCount"].ToString());

                return t_Count;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }            
        }

        internal string GetPaymentFlag(string SCAID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select PaymentFlag from SCA_RegistrationDetails Where SCAID = @SCAID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@SCAID", DbType.String, SCAID);                
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
       
        internal void InsertUser(DataStructs.KIOSKUsers_DT objKIOSKUsers_DT, string[] AKioskUsersFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objKIOSKUsers_DT, UserTableName, AKioskUsersFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal void InsertKiosk(DataStructs.KioskRegistration_DT objKioskRegistration_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objKioskRegistration_DT, TableName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal void UpdatemstUsers(string t_KioskID, string t_UNQ)
        {
            int ResultRow;
            string Query = "";

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            Query = "Update " + UserTableName + " Set UNQ = '" + t_UNQ + "' Where KioskID = '" + t_KioskID+"'";

            ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);

        }



        internal DataTable GetVLEDetail(string LoginId, string OMTID)
        {
            string Query = @"Select B.KioskID, B.FullName, B.FullName_LL, D.Districtname, C.Villagename, A.kiosk_mobile_no, A.kiosk_email_id, A.OMTID from 
                                DC_RegistrationDetails A
                                Inner Join mstusers B on A.KioskID = B.KioskID
                                Inner Join MahaAddress..mstVillage C On B.VillageCode = C.Villagecode and C.langid=1
                                Inner Join MahaAddress..mstDistrict D on B.Dist = D.Districtcode and D.Langid = 1
                                where B.KioskID ='" + LoginId + "' and B.UserType = 'KIOSK'";

            Query = "Select KioskID, FullName, FullName_LL, Districtname, Villagename, kiosk_mobile_no, kiosk_email_id, OMTID from GetDetailsForPolice Where KioskID = '" +
                LoginId + "' And OMTID = '" + OMTID + "'";

            return ExecuteCommand(Query);
        }



        internal void Insert(DataStructs.PoliceRecruitment_DT objPoliceRecruitment_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objPoliceRecruitment_DT, "PoliceRecruitment", AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }
    }
}
