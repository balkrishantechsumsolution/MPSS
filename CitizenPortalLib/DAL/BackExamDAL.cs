using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CitizenPortalLib.DataStructs;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace CitizenPortalLib.DAL
{
    class BackExamDAL : DALBase
    {
        Database m_DataBase;
        internal DataSet Get_BackStudentDtls(string RollNo, string m_BranchName)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("Get_BackStudentDtlsSP");
                m_DataBase.AddInParameter(selectCommand, "@RollNo", DbType.AnsiString, RollNo);
                m_DataBase.AddInParameter(selectCommand, "@BranchCode", DbType.AnsiString, m_BranchName);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentDetails", "BackPaperDetails","FeesDetails","AllPaper" });
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

        internal DataTable InsertBackExamFormDataByDEO(BackExamForm_DT objBackExamForm_DT, string[] aFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;

            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                cmdInsert = qb.GetInsertCommandV3(objBackExamForm_DT, "InsertBackExamFormByDEOSP", aFields);


                Reader = m_DataBase.ExecuteReader(cmdInsert);
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

        internal DataSet Get_GetStudentExamData(string m_ServiceID, string m_AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("Get_BackStudentExamDtlsSP");
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, m_AppID);
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, m_ServiceID);
                
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "StudentDetails", "PaperDtls", "TransactionDtls" });
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
