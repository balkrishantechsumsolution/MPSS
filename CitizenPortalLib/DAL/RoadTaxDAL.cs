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
    internal class RoadTaxDAL : DALBase
    {
        Database m_DataBase;

        //Inserting RoadTax Data In Table//
        internal DataTable InsertRoadTaxFormData(RoadTaxForm_DT objRoadTaxForm_DT, string[] aFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();
            m_DataBase = Factory.Create(this.ConnectionString);
            cmdInsert = qb.GetInsertCommandV3(objRoadTaxForm_DT, "InsertRoadTaxDataSP", aFields);
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);
            return oDataTable;
        }

        //Getting RoadTax Data For Acknowledgment//
        internal DataSet GetRoadTaxFormData(string ServiceID, string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetRoadTaxDataSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "RoadTaxAppDetails", "RoadTaxCalcDetails", "TransactionDetail", "TrackStatusDetail", "PaymentDetails", "RoadTaxFinalDetail" });
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


        internal DataSet GetRoadTaxFinalData(string ServiceID, string AppID)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetRoadTaxFinalDataSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, AppID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "RoadTaxAppDetails", "RoadTaxCalcDetails", "TransactionDetail", "TrackStatusDetail", "PaymentDetails" });
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

        internal DataTable InsertRoadTaxFinalData(RoadTaxFinal_DT objRoadTaxFinal_DT, string[] AFields)
        {
            DbCommand cmdInsert;
            QueryBuilder qb = new QueryBuilder();
            m_DataBase = Factory.Create(this.ConnectionString);
            cmdInsert = qb.GetInsertCommandV3(objRoadTaxFinal_DT, "InsertRoadTaxFinalDataSP", AFields);
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            Reader = m_DataBase.ExecuteReader(cmdInsert);
            if (Reader != null)
                oDataTable.Load(Reader);
            return oDataTable;
        }
    }
}