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
    internal class SPVRequestDAL:DALBase
    {
        Database m_DataBase;

        internal string InsertV3(SPVRequest_DT objSPVRequest_DT, string[] aFields)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            QueryBuilder qb = new QueryBuilder();
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                
                selectCommand = qb.GetInsertCommandV3(objSPVRequest_DT, "InsertSPVRequestSP", aFields);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable.Rows[0]["TransactionID"].ToString();
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal string InsertCSCBridgeRequest(CSCBridgeRequest_DT objCSCBridgeRequest_DT, string[] aFields)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            QueryBuilder qb = new QueryBuilder();
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;

                selectCommand = qb.GetInsertCommandV3(objCSCBridgeRequest_DT, "InsertCSCBridgeRequestSP", aFields);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable.Rows[0]["TransactionID"].ToString();
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal string InsertCSCBridgeResponseMessage(CSCBridgeResponseMessage_DT objCSCBridgeResponseMessage_DT, string[] aFields)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            QueryBuilder qb = new QueryBuilder();
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;

                selectCommand = qb.GetInsertCommandV3(objCSCBridgeResponseMessage_DT, "InsertCSCBridgeResponseMessageSP", aFields);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable.Rows[0]["Result"].ToString();
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetCSCBridgeRecon(string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetCSCBridgeReconSP");
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

        internal DataSet InsertCSCBridgeResponse(CSCBridgeResponse_DT objCSCBridgeResponse_DT, string[] aResponseFields)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            QueryBuilder qb = new QueryBuilder();
            m_DataBase = Factory.Create(this.ConnectionString);
            string t_Result = "";
            try
            {
                DbCommand selectCommand;

                selectCommand = qb.GetInsertCommandV3(objCSCBridgeResponse_DT, "InsertCSCBridgeResponseSP", aResponseFields);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "TransactionDetails", "Result"});


                //if (oDataTable != null)
                //{
                //    if (oDataTable.Tables[0].Rows.Count > 0)
                //    {
                //        if (oDataTable.Tables[0].Columns.Contains("TransactionID"))
                //        {
                //            t_Result = oDataTable.Tables[0].Rows[0]["TransactionID"].ToString();
                //        }
                //    }
                //    if (oDataTable.Tables[1].Rows.Count > 0)
                //    {
                //        if (oDataTable.Tables[1].Columns.Contains("Result"))
                //        {
                //            t_Result = oDataTable.Tables[1].Rows[0]["Result"].ToString();
                //        }
                //    }
                //}

                

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

        internal string InsertCSCBridgeRecon(CSCBridgeReconLog_DT objCSCBridgeRecon_DT, string[] aReconFields)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            QueryBuilder qb = new QueryBuilder();
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;

                selectCommand = qb.GetInsertCommandV3(objCSCBridgeRecon_DT, "InsertCSCBridgeReconSP", aReconFields);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable.Rows[0]["Result"].ToString();
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetAppDetails(string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetWalletAppDetailSP");
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
    }
}
