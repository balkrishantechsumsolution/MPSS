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
    internal class DocumentBriefcaseDAL:DALBase
    {
        Database m_DataBase;

        internal DataTable DeleteDocument(string ProfileID, string AppType, string ServiceID, string AppID, string DocumentID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);


            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("DeleteDocumentDetailsSP");
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, ProfileID);
                m_DataBase.AddInParameter(selectCommand, "@AppType", DbType.AnsiString, AppType);

                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);

                m_DataBase.AddInParameter(selectCommand, "@DocumentID", DbType.AnsiString, DocumentID);

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

        internal string GetProfileID(string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("Document_GetProfileIDSP");

                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);
                return oDataTable.Rows[0]["ProfileID"].ToString();
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable SaveG2GDocument(string ProfileID, string AppType, string ServiceID, string AppID, string DocumentID, string DocumentName, string DocumentPath
            , string CurrentStage, string CreatedBy, string CreatedOn, string CreatedByRole
            , string FileName1, string FilePath1, string FileName2, string FilePath2, string FileName3, string FilePath3, string FileName4, string FilePath4, string FileName5, string FilePath5
            , string Remarks1, string Remarks2, string Remarks3, string Remarks4, string Remarks5
            , string Date1, string Date2, string Date3, string Date4, string Date5)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("SaveG2GDocumentDetailsSP");
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, ProfileID);
                m_DataBase.AddInParameter(selectCommand, "@AppType", DbType.AnsiString, AppType);

                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);

                m_DataBase.AddInParameter(selectCommand, "@DocumentID", DbType.AnsiString, DocumentID);
                m_DataBase.AddInParameter(selectCommand, "@DocumentName", DbType.AnsiString, DocumentName);
                m_DataBase.AddInParameter(selectCommand, "@DocumentPath", DbType.AnsiString, DocumentPath);


                m_DataBase.AddInParameter(selectCommand, "@CurrentStage", DbType.AnsiString, CurrentStage);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CreatedBy);
                m_DataBase.AddInParameter(selectCommand, "@CreatedOn", DbType.AnsiString, CreatedOn);

                if (CreatedByRole == null || CreatedByRole == "")
                    m_DataBase.AddInParameter(selectCommand, "@CreatedByRole", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@CreatedByRole", DbType.AnsiString, CreatedByRole);

                if (FileName1 == null || FileName1 == "")
                    m_DataBase.AddInParameter(selectCommand, "@FileName1", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@FileName1", DbType.AnsiString, FileName1);

                if (FileName2 == null || FileName2 == "")
                    m_DataBase.AddInParameter(selectCommand, "@FileName2", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@FileName2", DbType.AnsiString, FileName2);

                if (FileName3 == null || FileName3 == "")
                    m_DataBase.AddInParameter(selectCommand, "@FileName3", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@FileName3", DbType.AnsiString, FileName3);

                if (FileName4 == null || FileName4 == "")
                    m_DataBase.AddInParameter(selectCommand, "@FileName4", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@FileName4", DbType.AnsiString, FileName4);

                if (FileName5 == null || FileName5 == "")
                    m_DataBase.AddInParameter(selectCommand, "@FileName5", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@FileName5", DbType.AnsiString, FileName5);

                if (FilePath1 == null || FilePath1 == "")
                    m_DataBase.AddInParameter(selectCommand, "@FilePath1", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@FilePath1", DbType.AnsiString, FilePath1);

                if (FilePath2 == null || FilePath2 == "")
                    m_DataBase.AddInParameter(selectCommand, "@FilePath2", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@FilePath2", DbType.AnsiString, FilePath2);

                if (FilePath3 == null || FilePath3 == "")
                    m_DataBase.AddInParameter(selectCommand, "@FilePath3", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@FilePath3", DbType.AnsiString, FilePath3);

                if (FilePath4 == null || FilePath4 == "")
                    m_DataBase.AddInParameter(selectCommand, "@FilePath4", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@FilePath4", DbType.AnsiString, FilePath4);

                if (FilePath5 == null || FilePath5 == "")
                    m_DataBase.AddInParameter(selectCommand, "@FilePath5", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@FilePath5", DbType.AnsiString, FilePath5);

                if (Remarks1 == null || Remarks1 == "")
                    m_DataBase.AddInParameter(selectCommand, "@Remarks1", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@Remarks1", DbType.AnsiString, Remarks1);

                if (Remarks2 == null || Remarks2 == "")
                    m_DataBase.AddInParameter(selectCommand, "@Remarks2", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@Remarks2", DbType.AnsiString, Remarks2);

                if (Remarks3 == null || Remarks3 == "")
                    m_DataBase.AddInParameter(selectCommand, "@Remarks3", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@Remarks3", DbType.AnsiString, Remarks3);

                if (Remarks4 == null || Remarks4 == "")
                    m_DataBase.AddInParameter(selectCommand, "@Remarks4", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@Remarks4", DbType.AnsiString, Remarks4);

                if (Remarks5 == null || Remarks5 == "")
                    m_DataBase.AddInParameter(selectCommand, "@Remarks5", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@Remarks5", DbType.AnsiString, Remarks5);

                if (Date1 == null || Convert.ToString(Date1) == "")
                    m_DataBase.AddInParameter(selectCommand, "@Date1", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@Date1", DbType.AnsiString, Date1);

                if (Date2 == null || Convert.ToString(Date2) == "")
                    m_DataBase.AddInParameter(selectCommand, "@Date2", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@Date2", DbType.AnsiString, Date2);

                if (Date3 == null || Convert.ToString(Date3) == "")
                    m_DataBase.AddInParameter(selectCommand, "@Date3", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@Date3", DbType.AnsiString, Date3);

                if (Date4 == null || Convert.ToString(Date4) == "")
                    m_DataBase.AddInParameter(selectCommand, "@Date4", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@Date4", DbType.AnsiString, Date4);

                if (Date5 == null || Convert.ToString(Date5) == "")
                    m_DataBase.AddInParameter(selectCommand, "@Date5", DbType.AnsiString, DBNull.Value);
                else
                    m_DataBase.AddInParameter(selectCommand, "@Date5", DbType.AnsiString, Date5);


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

        internal DataTable GetSavedDocumentDetailsCustom(string ProfileID, string AppType, string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetSavedDocumentDetailsCustomSP");
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, ProfileID);
                m_DataBase.AddInParameter(selectCommand, "@AppType", DbType.AnsiString, AppType);

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

        internal DataTable VerifyDocumentDetails(string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("VerifyDocumentDetailsSP");
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

        internal DataTable GetSavedDocumentDetailsByProfile(string ProfileID, string AppType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetSavedDocumentDetailsByProfileSP");
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, ProfileID);
                m_DataBase.AddInParameter(selectCommand, "@AppType", DbType.AnsiString, AppType);

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

        internal DataTable GetSavedDocumentDetailsG2G(string ProfileID, string AppType, string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetSavedDocumentDetailsG2GSP");
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, ProfileID);
                m_DataBase.AddInParameter(selectCommand, "@AppType", DbType.AnsiString, AppType);

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

        internal DataTable GetG2GSavedDocumentDetails(string ProfileID, string AppType, string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetG2GSavedDocumentDetailsSP");
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, ProfileID);
                m_DataBase.AddInParameter(selectCommand, "@AppType", DbType.AnsiString, AppType);

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

        internal DataTable SubmitDocumentDetails(string ProfileID, string AppType, string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("SubmitDocumentDetailsSP");
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, ProfileID);
                m_DataBase.AddInParameter(selectCommand, "@AppType", DbType.AnsiString, AppType);

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

        //internal DataTable Insert(SeniorCitizen_DT objSeniorCitizen_DT, string[] aFields)
        //{
        //    DbCommand cmdInsert;

        //    QueryBuilder qb = new QueryBuilder();

        //    m_DataBase = Factory.Create(this.ConnectionString);

        //    cmdInsert = qb.GetInsertCommandV3(objSeniorCitizen_DT, "InsertSeniorCitizenSP", aFields);

        //    DataTable oDataTable = new DataTable();
        //    IDataReader Reader = null;
        //    Reader = m_DataBase.ExecuteReader(cmdInsert);
        //    if (Reader != null)
        //        oDataTable.Load(Reader);

        //    return oDataTable;
        //}

        internal DataTable GetSavedDocumentDetails(string ProfileID, string AppType, string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetSavedDocumentDetailsSP");
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, ProfileID);
                m_DataBase.AddInParameter(selectCommand, "@AppType", DbType.AnsiString, AppType);

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

        internal DataTable GetSavedDocumentDetailsNew(string ProfileID, string AppType, string ServiceID, string AppID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetSavedDocumentDetailsSPNew");
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, ProfileID);
                m_DataBase.AddInParameter(selectCommand, "@AppType", DbType.AnsiString, AppType);

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

        internal DataTable SaveDocument(string ProfileID, string AppType, string ServiceID, string AppID, string DocumentID, string DocumentName, string DocumentPath)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("SaveDocumentDetailsSP");
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, ProfileID);
                m_DataBase.AddInParameter(selectCommand, "@AppType", DbType.AnsiString, AppType);

                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);

                m_DataBase.AddInParameter(selectCommand, "@DocumentID", DbType.AnsiString, DocumentID);
                m_DataBase.AddInParameter(selectCommand, "@DocumentName", DbType.AnsiString, DocumentName);
                m_DataBase.AddInParameter(selectCommand, "@DocumentPath", DbType.AnsiString, DocumentPath);


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

        internal DataTable saveSentBack(string ProfileID, string ServiceID, string AppID, string Remarks) 
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("InsertSentBackSP");
                m_DataBase.AddInParameter(selectCommand, "@ProfileID", DbType.AnsiString, ProfileID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                m_DataBase.AddInParameter(selectCommand, "@Remarks", DbType.AnsiString, Remarks);
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
        internal DataTable GetSavedDocumentDetailsById(string keyfield, string m_db)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetSavedDocumentDetailsById");
                m_DataBase.AddInParameter(selectCommand, "@keyfield", DbType.AnsiString, keyfield);
                m_DataBase.AddInParameter(selectCommand, "@m_db", DbType.AnsiString, m_db);

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

        internal DataTable GetApplictionRemark(string ServiceID, string AppID)
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
    }
}
