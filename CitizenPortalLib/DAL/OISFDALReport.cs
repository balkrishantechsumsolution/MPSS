using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CitizenPortalLib.DataStructs;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;

namespace CitizenPortalLib.DAL
{
    public class OISFDALReport : DALBase
    {
        Database m_DataBase;
        public DataSet GetOISFAppDetails(string Option,string Param0, string Param1, string Param2, string Param3, string Param4, string Param5, string Param6, string Param7, string Param8, string Param9)
        {
            DataSet oDataTable = new DataSet();
            DataSet ds = null;
          
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetOISF_Report");
                m_DataBase.AddInParameter(selectCommand, "@Option", DbType.AnsiString, Option);

                m_DataBase.AddInParameter(selectCommand, "@Param0", DbType.AnsiString, Param0);
                m_DataBase.AddInParameter(selectCommand, "@Param1", DbType.AnsiString, Param1);
                m_DataBase.AddInParameter(selectCommand, "@Param2", DbType.AnsiString, Param2);
                m_DataBase.AddInParameter(selectCommand, "@Param3", DbType.AnsiString, Param3);
                m_DataBase.AddInParameter(selectCommand, "@Param4", DbType.AnsiString, Param4);
                m_DataBase.AddInParameter(selectCommand, "@Param5", DbType.AnsiString, Param5);
                m_DataBase.AddInParameter(selectCommand, "@Param6", DbType.AnsiString, Param6);
                m_DataBase.AddInParameter(selectCommand, "@Param7", DbType.AnsiString, Param7);
                m_DataBase.AddInParameter(selectCommand, "@Param8", DbType.AnsiString, Param8);
                m_DataBase.AddInParameter(selectCommand, "@Param9", DbType.AnsiString, Param9);
                ds = m_DataBase.ExecuteDataSet(selectCommand);
               
                return ds;
            }
            finally
            {
               
            }
        }

        public DataSet GetOISFEventDetails(string CenterID, string BatchID)
        {
            DataSet oDataTable = new DataSet();
            DataSet ds = null;

            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetOISFEventDetailsSP");
                m_DataBase.AddInParameter(selectCommand, "@CenterID", DbType.AnsiString, CenterID);
                m_DataBase.AddInParameter(selectCommand, "@BatchID", DbType.AnsiString, BatchID);
                ds = m_DataBase.ExecuteDataSet(selectCommand);

                return ds;
            }
            finally
            {

            }
        }

        public DataSet GetOISFAppDetailsV2(string Option, string Param0, string Param1, string Param2, string Param3, string Param4, string Param5, string Param6, string Param7, string Param8, string Param9)
        {
            DataSet oDataTable = new DataSet();
            DataSet ds = null;

            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetOISF_ReportV2");
                m_DataBase.AddInParameter(selectCommand, "@Option", DbType.AnsiString, Option);

                m_DataBase.AddInParameter(selectCommand, "@Param0", DbType.AnsiString, Param0);
                m_DataBase.AddInParameter(selectCommand, "@Param1", DbType.AnsiString, Param1);
                m_DataBase.AddInParameter(selectCommand, "@Param2", DbType.AnsiString, Param2);
                m_DataBase.AddInParameter(selectCommand, "@Param3", DbType.AnsiString, Param3);
                m_DataBase.AddInParameter(selectCommand, "@Param4", DbType.AnsiString, Param4);
                m_DataBase.AddInParameter(selectCommand, "@Param5", DbType.AnsiString, Param5);
                m_DataBase.AddInParameter(selectCommand, "@Param6", DbType.AnsiString, Param6);
                m_DataBase.AddInParameter(selectCommand, "@Param7", DbType.AnsiString, Param7);
                m_DataBase.AddInParameter(selectCommand, "@Param8", DbType.AnsiString, Param8);
                m_DataBase.AddInParameter(selectCommand, "@Param9", DbType.AnsiString, Param9);
                ds = m_DataBase.ExecuteDataSet(selectCommand);

                return ds;
            }
            finally
            {

            }
        }

        public bool UpdateOISFAppDetails(string Option, string Param0, string Param1, string Param2, string Param3, string Param4, string Param5, string Param6, string Param7, string Param8, string Param9)
        {
            int i = 0;

            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetOISF_Report");
                m_DataBase.AddInParameter(selectCommand, "@Option", DbType.AnsiString, Option);

                m_DataBase.AddInParameter(selectCommand, "@Param0", DbType.AnsiString, Param0);
                m_DataBase.AddInParameter(selectCommand, "@Param1", DbType.AnsiString, Param1);
                m_DataBase.AddInParameter(selectCommand, "@Param2", DbType.AnsiString, Param2);
                m_DataBase.AddInParameter(selectCommand, "@Param3", DbType.AnsiString, Param3);
                m_DataBase.AddInParameter(selectCommand, "@Param4", DbType.AnsiString, Param4);
                m_DataBase.AddInParameter(selectCommand, "@Param5", DbType.AnsiString, Param5);
                m_DataBase.AddInParameter(selectCommand, "@Param6", DbType.AnsiString, Param6);
                m_DataBase.AddInParameter(selectCommand, "@Param7", DbType.AnsiString, Param7);
                m_DataBase.AddInParameter(selectCommand, "@Param8", DbType.AnsiString, Param8);
                m_DataBase.AddInParameter(selectCommand, "@Param9", DbType.AnsiString, Param9);

                i = m_DataBase.ExecuteNonQuery(selectCommand);


            }
            finally
            {

            }
            if (i > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool UpdateOISFAppDetails(string Option, string Param0, string Param1, string Param2, string Param3, string Param4, string Param5, string Param6, string Param7, string Param8, string Param9, string Param10, string Param11, string Param12, string Param13, string Param14)
        {
            int i = 0;

            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetOISF_Report");
                m_DataBase.AddInParameter(selectCommand, "@Option", DbType.AnsiString, Option);

                m_DataBase.AddInParameter(selectCommand, "@Param0", DbType.AnsiString, Param0);
                m_DataBase.AddInParameter(selectCommand, "@Param1", DbType.AnsiString, Param1);
                m_DataBase.AddInParameter(selectCommand, "@Param2", DbType.AnsiString, Param2);
                m_DataBase.AddInParameter(selectCommand, "@Param3", DbType.AnsiString, Param3);
                m_DataBase.AddInParameter(selectCommand, "@Param4", DbType.AnsiString, Param4);
                m_DataBase.AddInParameter(selectCommand, "@Param5", DbType.AnsiString, Param5);
                m_DataBase.AddInParameter(selectCommand, "@Param6", DbType.AnsiString, Param6);
                m_DataBase.AddInParameter(selectCommand, "@Param7", DbType.AnsiString, Param7);
                m_DataBase.AddInParameter(selectCommand, "@Param8", DbType.AnsiString, Param8);
                m_DataBase.AddInParameter(selectCommand, "@Param9", DbType.AnsiString, Param9);
                m_DataBase.AddInParameter(selectCommand, "@Param10", DbType.AnsiString, Param10);
                m_DataBase.AddInParameter(selectCommand, "@Param11", DbType.AnsiString, Param11);
                m_DataBase.AddInParameter(selectCommand, "@Param12", DbType.AnsiString, Param12);
                m_DataBase.AddInParameter(selectCommand, "@Param13", DbType.AnsiString, Param13);
                m_DataBase.AddInParameter(selectCommand, "@Param14", DbType.AnsiString, Param14);

                i = m_DataBase.ExecuteNonQuery(selectCommand);


            }
            finally
            {

            }
            if (i > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public DataSet GetOISFScoreReport(string CenterID, string EventID,string BatchDay)
        {
            DataSet oDataTable = new DataSet();
            DataSet ds = null;

            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetOISFScoreReportSP");
                m_DataBase.AddInParameter(selectCommand, "@CenterID", DbType.AnsiString, CenterID);
                m_DataBase.AddInParameter(selectCommand, "@EventID", DbType.AnsiString, EventID);
                m_DataBase.AddInParameter(selectCommand, "@BatchDay", DbType.AnsiString, BatchDay);
                ds = m_DataBase.ExecuteDataSet(selectCommand);

                return ds;
            }
            finally
            {

            }
        }

    }
}
