using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class VLEMISDAL : DALBase
    {
        Database m_DataBase;
        string m_ConnectionString = "Sewa2";

        public VLEMISDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public VLEMISDAL()
            : base()
        {

        }

        internal DataTable GetVLEMIS(string KioskID, string VLECode, string FromDate, string ToDate)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;

            DateTime t_FromDate, t_ToDate;

            t_FromDate = Convert.ToDateTime(FromDate);
            t_ToDate = Convert.ToDateTime(ToDate).AddDays(1);

            m_DataBase = DatabaseFactory.CreateDatabase(m_ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select SvcName As 'Service Name', COUNT(SvcName)As 'Transaction Count' , Sum(SCA) + Sum(VLE) As 'SCA + VLE',Sum(MOL) As MOL,Sum(SetuDist) As 'District Setu',
                                        Sum(SetuState) As 'State Setu',Sum(portal_serv_fee) As 'Portal Fee', Sum(misc_charges_01) As 'Service Tax',Sum(trans_amt) As 'Total',Sum(SCAAmount) As 'SCA Amount'
                                        From TransactionBase_BKP ";

                SQLCommand = SQLCommand + " Where 1 = 1 ";

                if (KioskID != "" && KioskID != null)
                {
                    SQLCommand = SQLCommand + " And KioskID = @KioskID ";
                }

                if (FromDate != "" && ToDate != "")
                {
                    //SQLCommand = SQLCommand + " And Cast(CreatedOn As Date) Between @FromDate And @ToDate ";
                    SQLCommand = SQLCommand + " And CreatedOn > @FromDate And CreatedOn < @ToDate ";
                }

                if (VLECode != "")
                {
                    SQLCommand = SQLCommand + " And VLEID = @VLEID ";
                }

                SQLCommand = SQLCommand + " GROUP BY SvcName, VLEID ";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);

                m_DataBase.AddInParameter(selectCommand, "@VLEID", DbType.AnsiString, VLECode);
                m_DataBase.AddInParameter(selectCommand, "@KioskID", DbType.AnsiString, KioskID);

                if (FromDate != "" && ToDate != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.Date, t_FromDate.ToString("yyyy-MM-dd"));
                    m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.Date, t_ToDate.ToString("yyyy-MM-dd"));
                }

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

        internal DataTable GetDetailVLEMIS(string KioskID, string VLECode, string FromDate, string ToDate, string ServiceID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;

            DateTime t_FromDate, t_ToDate;

            t_FromDate = Convert.ToDateTime(FromDate);
            t_ToDate = Convert.ToDateTime(ToDate).AddDays(1);

            m_DataBase = DatabaseFactory.CreateDatabase(m_ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select SvcName As 'Service Name', Trans_Date As 'Transaction Date', TrnID As 'Transaction Id', AppID As'Application Id', AppName As 'Application Name', Cast(SCA As Decimal(18,2)) + Cast(VLE as Decimal(18,2)) As 'SCA + VLE', MOL As MOL,SetuDist As 'District Setu',
                                        SetuState As 'State Setu',portal_serv_fee As 'Portal Fee', misc_charges_01 As 'Service Tax',trans_amt As 'Total',SCAAmount As 'SCA Amount'
                                        From TransactionBase_BKP  ";

                SQLCommand = SQLCommand + " Where 1 = 1 ";

                if (KioskID != "" && KioskID != null)
                {
                    SQLCommand = SQLCommand + " And KioskID = @KioskID ";
                }

                if (FromDate != "" && ToDate != "")
                {
                    SQLCommand = SQLCommand + " And CreatedOn > @FromDate And CreatedOn < @ToDate ";
                }

                if (ServiceID != "")
                {
                    SQLCommand = SQLCommand + " And Service_ID = @ServiceID";
                }

                if (VLECode != "")
                {
                    SQLCommand = SQLCommand + " And VLEID = @VLEID ";
                }

                //SQLCommand = SQLCommand + " GROUP BY SvcName, VLEID ";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);

                m_DataBase.AddInParameter(selectCommand, "@VLEID", DbType.AnsiString, VLECode);
                m_DataBase.AddInParameter(selectCommand, "@KioskID", DbType.AnsiString, KioskID);

                if (FromDate != "" && ToDate != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.Date, t_FromDate.ToString("yyyy-MM-dd"));
                    m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.Date, t_ToDate.ToString("yyyy-MM-dd"));
                }

                if (ServiceID != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                }

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

        public DataTable GetCount(string LoginId, bool IsKiosk, string KioskID, bool IsSCA, string SCAID, string VLECode)
        {
            string m_Role = string.Empty;
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(m_ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select 
                                        Sum(1) As 'All',
                                        Sum(Case When CertStatus = 'Intial' Then 1 Else 0 End) As 'Intial',
                                        Sum(Case When CertStatus = 'Pending' And PayFlag = 'N' Then 1 Else 0 End) As 'PendingforPayment',
                                        Sum(Case When CertStatus = 'Pending' And PayFlag = 'Y' Then 1 Else 0 End) As 'Pending',
                                        Sum(Case When CertStatus = 'Approved' And PayFlag = 'Y' Then 1 Else 0 End) As 'Approved',
                                        Sum(Case When CertStatus = 'Delivered' And PayFlag = 'Y' Then 1 Else 0 End) As 'Delivered',
                                        Sum(Case When CertStatus = 'Rejected' And PayFlag = 'Y' Then 1 Else 0 End) As 'Rejected'
                                        From TrackStatus (NoLock) A ";
                if (IsKiosk)
                {
                    SQLCommand = SQLCommand + " Where  D.KioskID = @KioskID ";
                }
                else
                {
                    SQLCommand = SQLCommand + " Where A.CreatedBy = @LoginId ";
                }

                if (VLECode != "")
                {
                    SQLCommand = SQLCommand + " And A.VLEID = @VLEID ";
                }

                SQLCommand = SQLCommand + " And Cast(A.CreatedOn As Date) Between Cast(DATEADD(D, -2, GetDate()) As Date) And Cast(GETDATE() As Date) ";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@LoginId", DbType.AnsiString, LoginId);
                if (IsSCA)
                {
                    m_DataBase.AddInParameter(selectCommand, "@SCAID", DbType.AnsiString, SCAID);
                }
                else if (IsKiosk)
                {
                    m_DataBase.AddInParameter(selectCommand, "@KioskID", DbType.AnsiString, KioskID);
                }
                m_DataBase.AddInParameter(selectCommand, "@VLEID", DbType.AnsiString, VLECode);


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
