using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CitizenPortalLib.DataStructs;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace CitizenPortalLib.DAL
{
    internal class CitizenDashboradDAL : DALBase
    {
        public string CurrentCulture { get; set; }
        Database m_DataBase;

        public CitizenDashboradDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public CitizenDashboradDAL()
            : base()
        {


        }
        internal DataTable GetCitizenDashboardGrid(string CItiZenUser, string ProfileID, string KeyField)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCitiZenDashboardGridSP");
                m_DataBase.AddInParameter(selectCommand, "@UID", DbType.AnsiString, CItiZenUser);
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, ProfileID);
                m_DataBase.AddInParameter(selectCommand, "@KeyField", DbType.AnsiString, KeyField);
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

        internal DataTable GetCitizenMenu(string UserID, string ProfileID, string KeyField)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCitiZenMenuSP");
                m_DataBase.AddInParameter(selectCommand, "@UID", DbType.AnsiString, UserID);
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, ProfileID);
                m_DataBase.AddInParameter(selectCommand, "@KeyField", DbType.AnsiString, KeyField);
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

        internal DataTable ShowCitizenDashboardGrid(string CItiZenUser)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("ShowCitiZenDashboardGridSP");
                m_DataBase.AddInParameter(selectCommand, "@UID", DbType.AnsiString, CItiZenUser);
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







        //Database m_DataBase;

        //internal DataTable InsertCitizenDashborad(CitizenDashborad_DT objCitizenDashborad_DT, string[] aFields)
        //{
        //    DbCommand cmdInsert;

        //    QueryBuilder qb = new QueryBuilder();

        //    m_DataBase = Factory.Create(this.ConnectionString);

        //    cmdInsert = qb.GetInsertCommandV3(objCitizenDashborad_DT, "InsertCitizenDashboradSP", aFields);

        //    DataTable oDataTable = new DataTable();
        //    IDataReader Reader = null;
        //    Reader = m_DataBase.ExecuteReader(cmdInsert);
        //    if (Reader != null)
        //        oDataTable.Load(Reader);

        //    return oDataTable;
        //}


        //internal DataTable GetUserDetails(string UID)
        //{
        //    DataTable oDataTable = new DataTable();
        //    IDataReader Reader = null;
        //    m_DataBase = Factory.Create(this.ConnectionString);

        //    try
        //    {
        //        DbCommand selectCommand;
        //        selectCommand = m_DataBase.GetStoredProcCommand("GetUserDetailSP");                
        //        m_DataBase.AddInParameter(selectCommand, "@UserID", DbType.AnsiString, UID);
        //        Reader = m_DataBase.ExecuteReader(selectCommand);
        //        if (Reader != null)
        //            oDataTable.Load(Reader);
        //        return oDataTable;
        //    }
        //    finally
        //    {
        //        if (Reader != null)
        //        {
        //            Reader.Close();
        //        }
        //    }
        //}
        //internal DataTable GetSVIDdetail(string svID)
        //{
        //    DataTable oDataTable = new DataTable();
        //    IDataReader Reader = null;
        //    m_DataBase = Factory.Create(this.ConnectionString);

        //    try
        //    {
        //        DbCommand selectCommand;
        //        selectCommand = m_DataBase.GetStoredProcCommand("GETSVIDdeatail");
        //        m_DataBase.AddInParameter(selectCommand, "@svid", DbType.AnsiString, svID);
        //        Reader = m_DataBase.ExecuteReader(selectCommand);
        //        if (Reader != null)
        //            oDataTable.Load(Reader);
        //        return oDataTable;
        //    }
        //    finally
        //    {
        //        if (Reader != null)
        //        {
        //            Reader.Close();
        //        }
        //    }
        //}
        internal DataTable GetCitiZenDashboardGridForDocumentUpload(string CItiZenUser, string ProfileID, string KeyField)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCitiZenDashboardGridForDocumentUploadSP");
                m_DataBase.AddInParameter(selectCommand, "@UID", DbType.AnsiString, CItiZenUser);
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, ProfileID);
                m_DataBase.AddInParameter(selectCommand, "@KeyField", DbType.AnsiString, KeyField);
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

        internal DataTable GetActiveServices(string CItiZenUser, string ProfileID, string KeyField)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetActiveServicesSP");
                m_DataBase.AddInParameter(selectCommand, "@UID", DbType.AnsiString, CItiZenUser);
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, ProfileID);
                m_DataBase.AddInParameter(selectCommand, "@KeyField", DbType.AnsiString, KeyField);
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
