using CitizenPortalLib.DataStructs;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class KioskRegistrationDAL : DALBase
    {
        public string CurrentCulture { get; set; }

        private Database m_DataBase;

        public KioskRegistrationDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {
        }

        public KioskRegistrationDAL()
            : base()
        {
        }

        internal DataTable GetSIRBApplicantList(string BirthDate, string AppID, string Mobile, string FName)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetRecruitmentRecordDataSpTemp");
                //m_DataBase.AddInParameter(selectCommand, "@DOB", DbType.AnsiString, BirthDate);
                //m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                //m_DataBase.AddInParameter(selectCommand, "@Mobile", DbType.AnsiString, Mobile);
                //m_DataBase.AddInParameter(selectCommand, "@FName", DbType.AnsiString, FName);

                if (FName == "")
                    m_DataBase.AddInParameter(selectCommand, "@FName", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@FName", DbType.AnsiString, FName);

                if (BirthDate == "")
                    m_DataBase.AddInParameter(selectCommand, "@DOB", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@DOB", DbType.AnsiString, BirthDate);
                if (AppID == "")
                    m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                if (Mobile == "")
                    m_DataBase.AddInParameter(selectCommand, "@Mobile", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@Mobile", DbType.AnsiString, Mobile);

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

        private static string TableName = "RegistrationDetailsTb";
        private static string AddressDBName = "TransactionDB";

        //static string AddressTableName = AddressDBName + ".dbo.trnAddress";
        private static string AddressTableName = "AddressTb";

        private static string m_AddressConnectionString = "MasterDB";
        private static string m_LangId = "1";

        internal DataTable GetDUList()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetDUListSP");
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

        internal DataSet GetAppStatusWithURL(string ServiceID, string AppID, string UserType)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetAppStatusWithURLSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@UserType", DbType.AnsiString, UserType);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppStatus" });
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

        //if(HttpContext.Current.Session["CurrentCulture"].tos! = null && Session["CurrentCulture"] == "mr-IN")

        internal string GetLangID()
        {
            //if (HttpContext.Current != null && HttpContext.Current.Session["CurrentCulture"] != null &&
            //    (HttpContext.Current.Session["CurrentCulture"].ToString() == "mr-IN" || HttpContext.Current.Session["CurrentCulture"].ToString() == "hi-IN"))
            //    m_LangId = "2";
            //else
            //    m_LangId = "1";

            m_LangId = CurrentCulture.ToString();

            return m_LangId;
        }

        internal DataTable GetDivision()
        {
            //m_LangId = HttpContext.Current.Session["Session_Name"].ToString();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(m_AddressConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "SELECT [Division], [Divisioncode] FROM [mstDivision] Where LangId = " + m_LangId + " ORDER BY Division";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
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

        internal DataTable GetState()
        {
            m_LangId = GetLangID();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(m_AddressConnectionString);
            //try
            //{
            //    DbCommand selectCommand;
            //    String SQLCommand = "SELECT [StateName], [StateCode] FROM [mstState] Where LangId = " + m_LangId + " ORDER BY Statename";
            //    selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
            //    Reader = m_DataBase.ExecuteReader(selectCommand);
            //    if (Reader != null)
            //        oDataTable.Load(Reader);
            //    return oDataTable;
            //}
            //finally
            //{
            //    if (Reader != null)
            //    {
            //        Reader.Close();
            //    }
            //}
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetState_OUATSP");
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

        public DataTable GetDistrict()
        {
            m_LangId = GetLangID();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(m_AddressConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "SELECT [Districtname], [Districtcode] FROM [mstDistrict] Where LangId = " + m_LangId + " ORDER BY Districtname";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
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

        internal DataTable GetServiceTitle(int SvcID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetServiceTitleSP");
                m_DataBase.AddInParameter(selectCommand, "@SvcID", DbType.AnsiString, SvcID);
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

        internal DataTable GetServiceName(string SvcName)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetServiceNameSP");
                m_DataBase.AddInParameter(selectCommand, "@SvcName", DbType.AnsiString, SvcName);
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

        internal DataTable GetKioskDashboardGrid(string KioskUser)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetKioskDashboardGridSP");
                m_DataBase.AddInParameter(selectCommand, "@KioskUser", DbType.AnsiString, KioskUser);
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

        internal string InsertV2_old(KioskRegistrationV2_DT objKioskRegistration_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objKioskRegistration_DT, "InsertKioskDataSP", AFields);
            m_DataBase.AddOutParameter(cmdInsert, "outKioskID", DbType.String, 36);

            //ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return cmdInsert.Parameters["@outKioskID"].Value.ToString();
        }

        internal DataTable InsertV2(KioskRegistrationV2_DT objKioskRegistration_DT, string[] AFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(objKioskRegistration_DT, "InsertKioskDataSP", AFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        public DataTable GetDistrictFromState(string StateCode)
        {
            m_LangId = GetLangID();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(m_AddressConnectionString);
            
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetDistrictSP");
                m_DataBase.AddInParameter(selectCommand, "@StateCode", DbType.AnsiString, StateCode);
                m_DataBase.AddInParameter(selectCommand, "@LangID", DbType.AnsiString, 1);
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

        internal DataTable GetBlock(string DistrictCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetBlockSP");
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@LangID", DbType.AnsiString, 1);
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

        internal DataTable GetSubDistrict(string DistrictCode)
        {
            m_LangId = GetLangID();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(m_AddressConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "SELECT [Subdistrictcode], [Subdistrictname],[Districtcode] FROM [mstTaluka] WHERE Districtcode = @DistrictCode And LangId = @LangID ORDER BY Subdistrictname";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@LangID", DbType.AnsiString, m_LangId);
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

        internal DataTable GetSubDivision(string DistrictCode)
        {
            m_LangId = GetLangID();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(m_AddressConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "SELECT * FROM [mstSubDivision] WHERE Districtcode = @DistrictCode And LangId = @LangID ORDER BY SubDivisionName";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@LangID", DbType.AnsiString, m_LangId);
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

        internal DataTable GetPanchayat(string SubDistrictCode)
        {
            m_LangId = GetLangID();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(m_AddressConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "SELECT GramPanchayat, GramPanchayatcode, Subdistrictcode FROM mstPanchayat where Subdistrictcode = @SubDistrictCode And LangID = @LangID ORDER BY GramPanchayat";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@SubDistrictCode", DbType.AnsiString, SubDistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@langID", DbType.AnsiString, m_LangId);
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

        internal DataTable GetVillage(string PanchayatCode)
        {
            m_LangId = GetLangID();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(m_AddressConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "SELECT Distinct Villagecode, GramPanchayatcode, Villagename, Subdistrictcode, Pincode FROM mstVillage where GramPanchayatCode = @GramPanchayatCode and LangId = @LangID ORDER BY Villagename";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@GramPanchayatCode", DbType.AnsiString, PanchayatCode);
                m_DataBase.AddInParameter(selectCommand, "@LangID", DbType.AnsiString, m_LangId);
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

        internal string GenerateID(DataStructs.KioskRegistration_DT objKioskRegistration_DT, string SCAID, string DistrictCode, string SubDistrictCode, string VillageCode)
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

                selectCommand = null;
                selectCommand = DatabaseObject.GetSqlStringCommand("UPDATE " + TableName + " SET KioskID=@KioskID, SeqNo=@SeqNo WHERE KeyField=@KeyField");
                DatabaseObject.AddInParameter(selectCommand, "@KioskID", DbType.AnsiString, t_KioskID);
                DatabaseObject.AddInParameter(selectCommand, "@SeqNo", DbType.AnsiString, t_SeqNo);
                DatabaseObject.AddInParameter(selectCommand, "@KeyField", DbType.AnsiString, objKioskRegistration_DT.KeyField);
                int count = (int)DatabaseObject.ExecuteNonQuery(selectCommand);

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

        internal DataTable GetState_OUAT()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetState_OUATSP");
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

        internal DataTable GetBankName()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetBankNameSP");
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

        
        internal DataTable GetDistrict_OUAT(string StateCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetDistrict_OUATSP");
                m_DataBase.AddInParameter(selectCommand, "@StateCode", DbType.AnsiString, StateCode);
                m_DataBase.AddInParameter(selectCommand, "@LangID", DbType.AnsiString, 1);
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

        internal DataTable GetSeniorCitizenOdishaDist(string StateCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetSrCitizenOdishaDistrictSP");
                m_DataBase.AddInParameter(selectCommand, "@StateCode", DbType.AnsiString, StateCode);
                m_DataBase.AddInParameter(selectCommand, "@LangID", DbType.AnsiString, 1);
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

        internal DataTable GetBlock_OUAT(string DistrictCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetBlock_OUATSP");
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@LangID", DbType.AnsiString, 1);
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

        internal DataTable GetPanchayat_OUAT(string SubDistrictCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetPanchayat_OUATSP");
                m_DataBase.AddInParameter(selectCommand, "@SubDistrictCode", DbType.AnsiString, SubDistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@LangID", DbType.AnsiString, 1);
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

        internal DataTable GetSCA()
        {
            string Query = "Select SCAID, CompanyName, PaymentFlag From SCA_RegistrationDetails Where ShowSCA = 'Y'"; // Logic to show specific SCA
            /* 2013-02-13 Query Altered to remove those SCAs where the payment mode is S i.e. SCA
            string Query = "Select SCAID, CompanyName, PaymentFlag From SCA_RegistrationDetails Where IsNull(DisplayInDropDown, 'N') = 'Y' ";
            */
            return ExecuteCommand(Query);
        }

        internal DataTable LoggedSCA(string SCAID)
        {
            string Query = "Select SCAID, CompanyName, PaymentFlag From SCA_RegistrationDetails Where SCAID = '" + SCAID + "'"; // Logic to show List of Logged SCA
            return ExecuteCommand(Query);
        }

        internal DataTable GetAllSCA()
        {
            string Query = "Select SCAID, CompanyName, PaymentFlag From vW_SCA_RegistrationDetails";

            return ExecuteCommand(Query);
        }

        internal DataTable GetResidenceProof()
        {
            string Query = "Select KeyField, TypeOfProof From ResidenceProof";
            return ExecuteCommand(Query);
        }

        internal DataTable GetPanchayatFromSubDistrict(string SubDistrict)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetPanchayatFromSubDistrictSP");
                m_DataBase.AddInParameter(selectCommand, "@SubDistrictCode", DbType.AnsiString, SubDistrict);
                m_DataBase.AddInParameter(selectCommand, "@LangID", DbType.AnsiString, 1);
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

        internal DataTable GetCSCCenterList()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCSCDataSP");
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

        internal DataTable GetCSCCenterList(string DistrictCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCSCDataSP");
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
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

        internal DataTable GetVillageFromSubDistrict(string SubDistrict)
        {
            m_LangId = GetLangID();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(m_AddressConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "SELECT Distinct Villagecode, GramPanchayatcode, Villagename, Subdistrictcode, Pincode FROM mstVillage where SubDistrictCode = @SubDistrict and LangId = @LangID ORDER BY Villagename";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@SubDistrict", DbType.AnsiString, SubDistrict);
                m_DataBase.AddInParameter(selectCommand, "@LangID", DbType.AnsiString, m_LangId);
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

        internal string GetPinNoForVillage(string Village)
        {
            m_LangId = GetLangID();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(m_AddressConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "SELECT Pincode FROM mstVillage where VillageCode = @Village";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@Village", DbType.AnsiString, Village);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable.Rows[0]["PinCode"].ToString();
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetKioskDetails(string RowID)
        {
            //string Query = "Select * From " + TableName + " Where RowID = " + RowID;
            string Query = @"Select A.kioskID, B.CompanyName As KioskType, A.Kiosk_Name, A.Kiosk_EMail_ID, A.kiosk_phone_no, A.kiosk_mobile_no, A.kiosk_fax_no, A.kiosk_tin_no, A.owner_first_name,
                            A.owner_middle_name, A.owner_last_name, A.owner_father_name, A.owner_phone_no, A.owner_Pan_no, C.TypeOfProof As owner_resi_proof, A.owner_resi_proof_no, A.police_reg_no, A.tin_sh_reg_no,
                            A.no_of_comps, A.comps_desc, A.no_of_scanner, A.scanner_desc, A.no_of_printer, A.printer_desc, A.no_of_camera, A.camera_desc, A.back_up_power, A.power_cut,
                            A.any_othr_business, A.comfort_level, A.internet_conn_type, A.loc_colleges, A.loc_hostels, A.loc_schools, A.loc_pvt_offices, A.loc_govt_offices, A.loc_others,
                            A.avg_students, A.avg_general, A.OMTID, A.ImageName,A.KIOSKImage
                            From " + TableName + @" A
                            Inner Join SCA_RegistrationDetails B On A.KioskType = B.SCAID
                            Left Join ResidenceProof C On A.owner_resi_proof = C.KeyField
                            Where A.RowID = " + RowID;
            return ExecuteCommand(Query);
        }

        internal DataTable GetKioskDetailsFromKioskID(string KioskID)
        {
            //string Query = "Select * From " + TableName + " Where RowID = " + RowID;
            string Query = @"Select A.kioskID, B.CompanyName As KioskType, A.Kiosk_Name, A.Kiosk_EMail_ID, A.kiosk_phone_no, A.kiosk_mobile_no, A.kiosk_fax_no, A.kiosk_tin_no, A.owner_first_name,
                            A.owner_middle_name, A.owner_last_name, A.owner_father_name, A.owner_phone_no, A.owner_Pan_no, C.TypeOfProof As owner_resi_proof, A.owner_resi_proof_no, A.police_reg_no, A.tin_sh_reg_no,
                            A.no_of_comps, A.comps_desc, A.no_of_scanner, A.scanner_desc, A.no_of_printer, A.printer_desc, A.no_of_camera, A.camera_desc, A.back_up_power, A.power_cut,
                            A.any_othr_business, A.comfort_level, A.internet_conn_type, A.loc_colleges, A.loc_hostels, A.loc_schools, A.loc_pvt_offices, A.loc_govt_offices, A.loc_others,
                            A.avg_students, A.avg_general, A.OMTID, A.ImageName,A.ApprovalStatus, A.FinancialStatus, A.KeyField
                            From " + TableName + @" A
                            Inner Join SCA_RegistrationDetails B On A.KioskType = B.SCAID
                            Left Join ResidenceProof C On A.owner_resi_proof = C.KeyField
                            Where A.KioskID = '" + KioskID + "'";
            return ExecuteCommand(Query);
        }

        internal DataTable GetKioskAddressDetails(string RowID)
        {
            /*
            string Query = "Select A.AddrCareOf, A.AddrBuilding, A.AddrStreet, A.AddrLandmark, A.AddrLocality, A.Village_Code, A.Village, A.District_Code, A.District, A.PinCode, A.ChildKey, A.Taluka_Code, A.Taluka, A.Panchayat_Code, A.Panchayat From " +
                AddressTableName + " A Inner Join " + TableName + " B On A.ParentKey = B.KeyField Where B.RowID = " + RowID;
            */
            string Query = @"Select
                            A.AddrCareOf, A.AddrBuilding, A.AddrStreet, A.AddrLandmark, A.AddrLocality, A.Village_Code,
                            Case When IsNull(A.Village, '') = '' Then F.Villagename Else A.Village End As Village,
                            A.District_Code, IsNull(A.District, C.DistrictName) As District, A.PinCode, A.ChildKey,
                            A.Taluka_Code, IsNull(A.Taluka, D.SubDistrictname) As Taluka, A.Panchayat_Code, IsNull(A.Panchayat, E.Grampanchayat) As Panchayat
                            From " + AddressTableName + @" A
                            Inner Join " + TableName + @" B On A.ParentKey = B.KeyField
                            Left Join MahaAddress.Dbo.mstDistrict C On A.District_Code = C.Districtcode And C.Langid = 1
                            Left Join MahaAddress.Dbo.mstTaluka D On A.Taluka_Code = D.SubDistrictcode
                            Left Join MahaAddress.Dbo.mstPanchayat E On A.Taluka_Code = E.SubDistrictcode And A.Panchayat_Code = E.Grampanchayatcode
                            Left Join MahaAddress.Dbo.mstVillage F On A.Village_Code = F.Villagecode And F.Langid = 1
                            Where B.RowID = " + RowID;

            return ExecuteCommand(Query);
        }

        internal DataTable GetQuickKioskAddress(string KIOSKID)
        {
            /*
            string Query = "Select A.AddrCareOf, A.AddrBuilding, A.AddrStreet, A.AddrLandmark, A.AddrLocality, A.Village_Code, A.Village, A.District_Code, A.District, A.PinCode, A.ChildKey, A.Taluka_Code, A.Taluka, A.Panchayat_Code, A.Panchayat From " +
                AddressTableName + " A Inner Join " + TableName + " B On A.ParentKey = B.KeyField Where B.RowID = " + RowID;
            */
            string Query = @"Select
                            A.AddrCareOf, A.AddrBuilding, A.AddrStreet, A.AddrLandmark, A.AddrLocality, A.Village_Code,
                            Case When IsNull(A.Village, '') = '' Then F.Villagename Else A.Village End As Village,
                            A.District_Code, IsNull(A.District, C.DistrictName) As District, A.PinCode, A.ChildKey,
                            A.Taluka_Code, IsNull(A.Taluka, D.SubDistrictname) As Taluka, A.Panchayat_Code, IsNull(A.Panchayat, E.Grampanchayat) As Panchayat
                            From " + AddressTableName + @" A
                            Inner Join " + TableName + @" B On A.ParentKey = B.KeyField
                            Left Join MahaAddress.Dbo.mstDistrict C On A.District_Code = C.Districtcode And C.Langid = 1
                            Left Join MahaAddress.Dbo.mstTaluka D On A.Taluka_Code = D.SubDistrictcode And D.Langid = 1
                            Left Join MahaAddress.Dbo.mstPanchayat E On A.Taluka_Code = E.SubDistrictcode And A.Panchayat_Code = E.Grampanchayatcode
                            Left Join MahaAddress.Dbo.mstVillage F On A.Village_Code = F.Villagecode And F.Langid = 1
                            Where B.KioskID = '" + KIOSKID + "'";

            return ExecuteCommand(Query);
        }

        internal int ValidateEmail(string EmailID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select count(loginID) As EmailCount from mstUsers where LoginID = @kiosk_email_id";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@kiosk_email_id", DbType.AnsiString, EmailID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                int t_Count = Convert.ToInt32(oDataTable.Rows[0]["EmailCount"].ToString());

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

        internal int ValidateEmail_Old(string EmailID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select count(kiosk_email_id) As EmailCount from DC_RegistrationDetails where kiosk_email_id = @kiosk_email_id And IsNull(VerificationText, '') <> ''";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@kiosk_email_id", DbType.AnsiString, EmailID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                int t_Count = Convert.ToInt32(oDataTable.Rows[0]["EmailCount"].ToString());

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

        internal string GetPaymentFlag(string KioskID, string OperatorID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "SELECT PaymentFlag FROM mstUsers where KioskID = @KioskID And Unq = @OperatorID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@KioskID", DbType.AnsiString, KioskID);
                m_DataBase.AddInParameter(selectCommand, "@OperatorID", DbType.AnsiString, OperatorID);
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

        internal string GetVillageCode(string KioskID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select B.Village_Code From DC_RegistrationDetails A Inner Join trnAddress (NoLock) B On A.KeyField = B.ParentKey And B.Childkey = 'Kiosk' Where A.KioskID = @KioskID";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@KioskID", DbType.AnsiString, KioskID);
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

        internal DataTable GetKIOSKDistrict()
        {
            m_LangId = GetLangID();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(m_AddressConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "SELECT [Districtname], [Districtcode] FROM [mstDistrict] Where LangId = " + m_LangId + "  And Statecode = 27 ORDER BY Districtname";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
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

        internal string GetKioskName(string KioskID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            string t_Name = "";
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "SELECT Kiosk_name FROM " + TableName + " Where KioskID = '" + KioskID + "'";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                if (oDataTable.Rows.Count > 0)
                    t_Name = oDataTable.Rows[0]["Kiosk_Name"].ToString();

                return t_Name;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetDistrict(string p_LangID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(m_AddressConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "SELECT [Districtname], [Districtcode] FROM [mstDistrict] Where LangId = " + p_LangID + " ORDER BY Districtname";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
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

        internal DataTable GetSubDistrict(string p_LangID, string DistrictCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(m_AddressConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "SELECT [Subdistrictcode], [Subdistrictname],[Districtcode] FROM [mstTaluka] WHERE Districtcode = @DistrictCode And LangId = @LangID ORDER BY Subdistrictname";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@LangID", DbType.AnsiString, p_LangID);
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

        internal DataTable GetVillageFromSubDistrict(string p_LangID, string SubDistrict)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(m_AddressConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "SELECT Distinct Villagecode, GramPanchayatcode, Villagename, Subdistrictcode, Pincode FROM mstVillage where SubDistrictCode = @SubDistrict and LangId = @LangID ORDER BY Villagename";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@SubDistrict", DbType.AnsiString, SubDistrict);
                m_DataBase.AddInParameter(selectCommand, "@LangID", DbType.AnsiString, p_LangID);
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

        internal DataTable GetKIOSKDistrict(string p_LangID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(m_AddressConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "SELECT [Districtname], [Districtcode] FROM [mstDistrict] Where LangId = " + p_LangID + "  And Statecode = 27 ORDER BY Districtname";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
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

        internal DataTable GetPanchayat(string p_LangID, string SubDistrictCode)
        {
            m_LangId = p_LangID;

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(m_AddressConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "SELECT GramPanchayat, GramPanchayatcode, Subdistrictcode FROM mstPanchayat where Subdistrictcode = @SubDistrictCode And LangID = @LangID ORDER BY GramPanchayat";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@SubDistrictCode", DbType.AnsiString, SubDistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@langID", DbType.AnsiString, m_LangId);
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

        internal DataTable GetVillage(string p_LangID, string PanchayatCode)
        {
            m_LangId = GetLangID();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(m_AddressConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "SELECT Distinct Villagecode, GramPanchayatcode, Villagename, Subdistrictcode, Pincode FROM mstVillage where GramPanchayatCode = @GramPanchayatCode and LangId = @LangID ORDER BY Villagename";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@GramPanchayatCode", DbType.AnsiString, PanchayatCode);
                m_DataBase.AddInParameter(selectCommand, "@LangID", DbType.AnsiString, m_LangId);
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

        internal DataTable GetReportList(string ReportId, string ReportSpName)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand(ReportSpName);
                //m_DataBase.AddInParameter(selectCommand, "@ReportId", DbType.AnsiString, ReportId);
                //m_DataBase.AddInParameter(selectCommand, "@ReportSpName", DbType.AnsiString, ReportSpName);
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

        internal DataTable GetReportSpName(string ReportId)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetGenericReportSP");
                m_DataBase.AddInParameter(selectCommand, "@ReportId", DbType.AnsiString, ReportId);
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