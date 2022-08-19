using CitizenPortalLib.DataStructs;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitizenPortalLib.DAL
{
    public class CharacterCertificateDAL : DALBase
    {
        Database m_DataBase;
        public CharacterCertificateDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }
        public CharacterCertificateDAL()
            : base()
        {

        }

        static string TablemstUser = "mstUsers";

        internal DataTable InsertData(CTTNSCharacter ObjSaleOfHouse_DT, string[] aFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();
            m_DataBase = Factory.Create(this.ConnectionString);
            cmdInsert = qb.GetInsertCommandV3(ObjSaleOfHouse_DT, "CCTNS_CharacterCertificate_INS", aFields);
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }


        internal DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCCTNSCharacterCertificateSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails", "TransDetails", "AtthmtDtl" });
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

        internal DataTable LocalAdhaarData(string UID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetUserDetailByProfileID");
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, UID);
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
