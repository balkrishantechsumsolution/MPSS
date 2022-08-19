using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CitizenPortalLib.DataStructs;

namespace CitizenPortalLib.DAL
{
    public class WorkFlowDAL: DALBase
    {
        Database m_DataBase;
        public WorkFlowDAL(Database DatabaseObj)
            : base(DatabaseObj) 
        {

        }

        public WorkFlowDAL()
            : base()        
        {

        }

        internal DataTable GetActions(string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetWorkFlowActionsV2SP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);

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

        internal DataTable GetProfileID(string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetProfileForWorkFlowSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);

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

        internal int CheckFileUpload(string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CheckDeptFileUploadSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable.Rows.Count > 0 ? Convert.ToInt32(oDataTable.Rows[0]["Result"].ToString()) : 0;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable InsertDeptProfile(DeptProfile_DT data, string[] aFields)
        {
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = Factory.Create(this.ConnectionString);

            cmdInsert = qb.GetInsertCommandV3(data, "InsertDeptProfileSP", aFields);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);

            return oDataTable;
        }

        internal DataTable GetAcceptanceActions(string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetWorkFlowActionsAcceptanceSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);

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

        internal DataTable AcceptAppInWorkFlow(string ServiceID, string AppID, string StageID, string ActionID, string Remarks, string CreatedBy, string ClientIP)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("AcceptAppInWorkFlowSp");

                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@ChildServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@CurrentStage", DbType.AnsiString, StageID);
                m_DataBase.AddInParameter(selectCommand, "@CurrentAction", DbType.AnsiString, ActionID);
                m_DataBase.AddInParameter(selectCommand, "@Remarks", DbType.AnsiString, Remarks);
                m_DataBase.AddInParameter(selectCommand, "@AppliedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@AssignedTo", DbType.AnsiString, "");


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

        internal DataTable GetAppDetail(string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetAppDetailSp");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@ChildServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);

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

        internal DataTable GetAppRemarks(string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetActionHistorySp");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);

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

        internal DataTable SendAppInWorkFlow(string ServiceID, string AppID, string StageID, string ActionID, string Remarks, string CreatedBy, string ClientIP)
        {
            //int ResultRow;
            //DbCommand cmdInsert;

            //QueryBuilder qb = new QueryBuilder();

            //m_DataBase = Factory.Create(this.ConnectionString);
            //cmdInsert = m_DataBase.GetStoredProcCommand("SendAppInWorkFlowSp");

            //m_DataBase.AddInParameter(cmdInsert, "@AppID", DbType.AnsiString, AppID);
            //m_DataBase.AddInParameter(cmdInsert, "@ChildServiceID", DbType.AnsiString, ServiceID);
            //m_DataBase.AddInParameter(cmdInsert, "@CurrentStage", DbType.AnsiString, StageID);
            //m_DataBase.AddInParameter(cmdInsert, "@CurrentAction", DbType.AnsiString, ActionID);
            //m_DataBase.AddInParameter(cmdInsert, "@Remarks", DbType.AnsiString, Remarks);
            //m_DataBase.AddInParameter(cmdInsert, "@AppliedBy", DbType.AnsiString, CreatedBy);
            //m_DataBase.AddInParameter(cmdInsert, "@AssignedTo", DbType.AnsiString, "");

            //ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);

            //return ResultRow;



            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("SendAppInWorkFlowSp");

                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@ChildServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@CurrentStage", DbType.AnsiString, StageID);
                m_DataBase.AddInParameter(selectCommand, "@CurrentAction", DbType.AnsiString, ActionID);
                m_DataBase.AddInParameter(selectCommand, "@Remarks", DbType.AnsiString, Remarks);
                m_DataBase.AddInParameter(selectCommand, "@AppliedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@AssignedTo", DbType.AnsiString, "");


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
        
        internal DataTable GetSeniorCitizenSMS(string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GETSeniorCitizenSMS");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);

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

        internal DataTable GenerateSeniorCitizenIDCardNo(string AppID,string Flag)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GenerateSeniorCitizenIDCardNoSP");
                m_DataBase.AddInParameter(selectCommand, "@Flag", DbType.AnsiString, Flag);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);

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

        internal DataTable CheckProfile(string LoginID, int Department)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CheckProfileSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);

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

        internal DataTable EditProfile(string LoginID, int Department)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("EditProfileSP");
                m_DataBase.AddInParameter(selectCommand, "@LoginID", DbType.AnsiString, LoginID);
                m_DataBase.AddInParameter(selectCommand, "@Department", DbType.AnsiString, Department);

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

        internal DataTable PhDAdminAction(string ServiceID, string AppID, string ActionID, string Remarks, string CreatedBy, string ClientIP)
        {
            
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("PhDAdminActionSP");

                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@ChildServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@CurrentAction", DbType.AnsiString, ActionID);
                m_DataBase.AddInParameter(selectCommand, "@Remarks", DbType.AnsiString, Remarks);
                m_DataBase.AddInParameter(selectCommand, "@AppliedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@ClientIP", DbType.AnsiString, ClientIP);


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

        internal DataTable AdminAction(string ServiceID, string AppID, string ActionID, string Remarks, string CreatedBy, string ClientIP)
        {

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("AdminActionSP");

                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@ChildServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@CurrentAction", DbType.AnsiString, ActionID);
                m_DataBase.AddInParameter(selectCommand, "@Remarks", DbType.AnsiString, Remarks);
                m_DataBase.AddInParameter(selectCommand, "@AppliedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@ClientIP", DbType.AnsiString, ClientIP);


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

        internal DataTable CBAAdminAction(string ServiceID, string AppID, string ActionID, string Remarks, string CreatedBy, string ClientIP)
        {

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("CBAAdminActionSP");

                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@ChildServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@CurrentAction", DbType.AnsiString, ActionID);
                m_DataBase.AddInParameter(selectCommand, "@Remarks", DbType.AnsiString, Remarks);
                m_DataBase.AddInParameter(selectCommand, "@AppliedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@ClientIP", DbType.AnsiString, ClientIP);


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
