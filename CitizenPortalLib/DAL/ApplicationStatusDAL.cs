using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class ApplicationStatusDAL : DALBase
    {
        Database m_DataBase;

        static string m_MahaSevaConnectionString = "Sewa";

        public ApplicationStatusDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public ApplicationStatusDAL()
            : base()
        {

        }

        static string TableTrackStatus = "TrackStatusTb";

        internal DataSet TrackApplication(string appID)
        {
            //Stored Procedure to call : TrackApplicationStatusSp

            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("TrackApplicationSp");
                //selectCommand = m_DataBase.GetStoredProcCommand("TrackApplicationStatusSp");                
                m_DataBase.AddInParameter(selectCommand, "@AppID", DbType.AnsiString, appID);
                Reader = m_DataBase.ExecuteReader(selectCommand);
               
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails", "TransDetails", "WorkFlow" });
                //oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "AppDetails","WorkFlow","ApplicantDetail", "AddressDetails", "TransDetails" });
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

        /*
        internal DataTable GetApplicationsold(string OperatorID, string Status, string FromDate, string ToDate, string ServiceID, string ApplicationID, 
            bool IsKiosk, string KioskID,
            bool IsSCA, string SCAID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select ISNULL(C.GeneratedDocPath, B.CertifcatePath) As ReceiptURL, IsNull(C.GeneratedDocPath, B.CertificateURL) As CertificateURL, IsNull(A.AffidavitServiceID, A.ServiceID) As ServiceID, A.AppID, A.LangID, Case When C.GeneratedDocPath Is Null Then 1 Else 2 End As Type, Cast(A.CreatedOn As Date) As CreatedOn, A.ServiceName, A.ApplicantID As ApplicationID From TrackStatus (NoLock) A Left Join Mst_Track B On A.ServiceID = B.ServiceID And A.LangID = B.LangStatus Left Join Mst_GeneratedDocumented C On A.ServiceID = C.ServiceID And A.LangId = C.LangId And C.Priority = 1  ";

                if (IsSCA || IsKiosk)
                {
                    SQLCommand = SQLCommand + " Inner Join mstUsers D On A.CreatedBy = D.Unq ";
                }

                SQLCommand = SQLCommand + " Where A.PayFlag = @PayFlag And A.CertStatus = @CertStatus  ";

                if (IsSCA)
                {
                    SQLCommand = SQLCommand + " And Left(D.KioskID, 2) = @SCAID ";
                }
                else if (IsKiosk)
                {
                    SQLCommand = SQLCommand + " And D.KioskID = @KioskID ";
                }
                else
                {
                    SQLCommand = SQLCommand + " And A.CreatedBy = @CreatedBy ";
                }
                
                
                if(FromDate != "" && ToDate != "")
                {
                    SQLCommand = SQLCommand + " And Cast(A.CreatedOn As Date) Between @FromDate And @ToDate ";                
                }

                if(ServiceID != "")
                {
                    SQLCommand = SQLCommand + " And A.ServiceID = @ServiceID";
                }

                if (ApplicationID != "")
                {
                    SQLCommand = SQLCommand + " And A.ApplicantId = @ApplicationID";
                }

                SQLCommand = SQLCommand + " Order By A.AppID Desc ";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.String, OperatorID);
                m_DataBase.AddInParameter(selectCommand, "@CertStatus", DbType.String, Status);
                m_DataBase.AddInParameter(selectCommand, "@PayFlag", DbType.String, "Y");
                m_DataBase.AddInParameter(selectCommand, "@ApplicationID", DbType.String, ApplicationID);


                if (FromDate != "" && ToDate != "")
                {                    
                    m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.Date, FromDate);
                    m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.Date, ToDate);
                }

                if (ServiceID != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.String, ServiceID);
                }

                if (IsSCA)
                {
                    m_DataBase.AddInParameter(selectCommand, "@SCAID", DbType.String, SCAID);
                }
                else if (IsKiosk)
                {
                    m_DataBase.AddInParameter(selectCommand, "@KioskID", DbType.String, KioskID);
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
        */

        internal DataTable GetApplications(string OperatorID, string Status, string FromDate, string ToDate, string ServiceID,
            string ApplicationID, string District, string Taluka, string Village, bool IsKiosk, string KioskID,
            bool IsSCA, string SCAID, string VLECode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;

            DateTime t_FromDate, t_ToDate;

            t_FromDate = DateTime.Now.AddDays(-2);
            t_ToDate = DateTime.Now.AddDays(1);

            if (ServiceID == "2124")
            {
                return GetApplications2124(OperatorID, Status, FromDate, ToDate, ServiceID,
                    ApplicationID, District, Taluka, Village, IsKiosk, KioskID,
                    IsSCA, SCAID, VLECode);
            }

            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select ISNULL(C.GeneratedDocPath, B.CertifcatePath) As ReceiptURL, 
                                        IsNull(C.GeneratedDocPath, B.CertificateURL) As CertificateURL,                                         
                                        Case When IsNull(A.AffidavitServiceID, 0)= 0 Then A.ServiceID Else A.AffidavitServiceID End As ServiceID,
                                        A.AppID, A.LangID, 
                                        Case When C.GeneratedDocPath Is Null Then 1 Else 2 End As Type, 
                                        Cast(A.CreatedOn As Date) As CreatedOn, A.ServiceName, A.ApplicantID As ApplicationID, D1.DistrictName, E.SubDistrictName, F.VillageName,
                                        Case A.PayFlag When 'Y' Then 'Paid' When 'N' Then 'Unpaid' Else '' End  As Payment
                                        From TrackStatus (NoLock) A 
                                        Left Join Mst_Track B On A.ServiceID = B.ServiceID And A.LangID = B.LangStatus 
                                        Left Join Mst_GeneratedDocumented C On A.ServiceID = C.ServiceID And A.LangId = C.LangId And C.Priority = 1  
                                        Left Join MstDistrict D1 On A.DistrictCode = D1.DistrictCode And D1.LangId = 1  
                                        Left Join MstTaluka E On A.TehsilCode = E.SubdistrictCode And E.LangId = 1  
                                        Left Join MstVillage F On A.VillageCode = Cast(F.villagecode As varchar(20)) And F.LangId = 1";

                if (IsSCA || IsKiosk)
                {
                    SQLCommand = SQLCommand + " Inner Join mstUsers D On A.CreatedBy = D.Unq ";
                }

                //SQLCommand = SQLCommand + " Where A.PayFlag = @PayFlag And A.CertStatus = @CertStatus  ";

                if (IsSCA)
                {
                    SQLCommand = SQLCommand + " Where Left(D.KioskID, 2) = @SCAID ";
                }
                else if (IsKiosk)
                {
                    SQLCommand = SQLCommand + " Where  D.KioskID = @KioskID ";
                }
                else
                {
                    SQLCommand = SQLCommand + " Where A.CreatedBy = @CreatedBy ";
                }


                if (FromDate != "" && ToDate != "")
                {
                    SQLCommand = SQLCommand + " And A.CreatedOn > @FromDate And A.CreatedOn < DateAdd(dd, 1, @ToDate) ";
                }

                if (ServiceID != "")
                {
                    SQLCommand = SQLCommand + " And A.ServiceID = @ServiceID";
                }

                if (ApplicationID != "")
                {
                    SQLCommand = SQLCommand + " And A.ApplicantId = @ApplicationID";
                }

                if (Status == "All")
                {
                    //m_DataBase.AddInParameter(selectCommand, "@CertStatus", DbType.String, Status);
                    //m_DataBase.AddInParameter(selectCommand, "@PayFlag", DbType.String, "Y");
                }
                else
                {

                    SQLCommand = SQLCommand + " And A.PayFlag = @PayFlag And A.CertStatus = @CertStatus  ";
                }

                if (District != "")
                {
                    SQLCommand = SQLCommand + " And A.DistrictCode = @District";
                }

                if (Taluka != "")
                {
                    SQLCommand = SQLCommand + " And A.TehsilCode = @Taluka";
                }

                if (Village != "")
                {
                    SQLCommand = SQLCommand + " And A.VillageCode = @Village";
                }

                if (VLECode != "")
                {
                    SQLCommand = SQLCommand + " And A.VLEID = @VLEID ";
                }

                if (ApplicationID == "")
                {
                    //SQLCommand = SQLCommand + " And Cast(A.CreatedOn As Date) Between Cast(DATEADD(D, -2, GetDate()) As Date) And Cast(GETDATE() As Date) ";
                    SQLCommand = SQLCommand + " And A.CreatedOn > '" + t_FromDate.ToString("yyyy-MM-dd") + "' And A.CreatedOn < '" + Convert.ToDateTime(t_ToDate).AddDays(1).ToString("yyyy-MM-dd") + "' ";
                }

                //SQLCommand = SQLCommand + " Order By A.AppID Desc ";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, OperatorID);
                m_DataBase.AddInParameter(selectCommand, "@CertStatus", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@PayFlag", DbType.AnsiString, "Y");
                m_DataBase.AddInParameter(selectCommand, "@ApplicationID", DbType.AnsiString, ApplicationID);
                m_DataBase.AddInParameter(selectCommand, "@District", DbType.AnsiString, District);
                m_DataBase.AddInParameter(selectCommand, "@Taluka", DbType.AnsiString, Taluka);
                m_DataBase.AddInParameter(selectCommand, "@Village", DbType.AnsiString, Village);
                m_DataBase.AddInParameter(selectCommand, "@VLEID", DbType.AnsiString, VLECode);

                if (FromDate != "" && ToDate != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.Date, FromDate);
                    m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.Date, ToDate);
                }

                if (ServiceID != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                }

                if (IsSCA)
                {
                    m_DataBase.AddInParameter(selectCommand, "@SCAID", DbType.AnsiString, SCAID);
                }
                else if (IsKiosk)
                {
                    m_DataBase.AddInParameter(selectCommand, "@KioskID", DbType.AnsiString, KioskID);
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

        private DataTable GetApplications2124(string OperatorID, string Status, string FromDate, string ToDate, string ServiceID,
            string ApplicationID, string District, string Taluka, string Village, bool IsKiosk, string KioskID,
            bool IsSCA, string SCAID, string VLECode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;

            DateTime t_FromDate, t_ToDate;

            t_FromDate = DateTime.Now.AddDays(-2);
            t_ToDate = DateTime.Now.AddDays(1);

            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select ISNULL(C.GeneratedDocPath, B.CertifcatePath) As ReceiptURL, 
                                        IsNull(C.GeneratedDocPath, B.CertificateURL) As CertificateURL,                                         
                                        Case When IsNull(A.AffidavitServiceID, 0)= 0 Then A.ServiceID Else A.AffidavitServiceID End As ServiceID,
                                        A.AppID, A.LangID, 
                                        Case When C.GeneratedDocPath Is Null Then 1 Else 2 End As Type, 
                                        Cast(A.CreatedOn As Date) As CreatedOn, A.ServiceName, A.ApplicantID As ApplicationID, C1.ConsumerName,  '' As SubDistrictName, C1.ConsumerNo + '/' + Cast(C1.BillingUnit as Varchar(10)) As [ConsumerNo/BillingUnit],
                                        Case A.PayFlag When 'Y' Then 'Paid' When 'N' Then 'Unpaid' Else '' End  As Payment
                                        From TrackStatusTb (NoLock) A 
                                        Left Join Mst_Track B On A.ServiceID = B.ServiceID And A.LangID = B.LangStatus 
                                        Left Join Mst_GeneratedDocumented C On A.ServiceID = C.ServiceID And A.LangId = C.LangId And C.Priority = 1  
                                        Left Join Trn_ElectBillPay C1 On A.ApplicantID = C1.ApplicantID
                                        ";

                if (IsSCA || IsKiosk)
                {
                    SQLCommand = SQLCommand + " Inner Join mstUsers D On A.CreatedBy = D.Unq ";
                }

                //SQLCommand = SQLCommand + " Where A.PayFlag = @PayFlag And A.CertStatus = @CertStatus  ";

                if (IsSCA)
                {
                    SQLCommand = SQLCommand + " Where Left(D.KioskID, 2) = @SCAID ";
                }
                else if (IsKiosk)
                {
                    SQLCommand = SQLCommand + " Where  D.KioskID = @KioskID ";
                }
                else
                {
                    SQLCommand = SQLCommand + " Where A.CreatedBy = @CreatedBy ";
                }


                if (FromDate != "" && ToDate != "")
                {
                    SQLCommand = SQLCommand + " And A.CreatedOn > @FromDate And A.CreatedOn < @ToDate ";
                }

                if (ServiceID != "")
                {
                    SQLCommand = SQLCommand + " And A.ServiceID = @ServiceID";
                }

                if (ApplicationID != "")
                {
                    SQLCommand = SQLCommand + " And A.ApplicantId = @ApplicationID";
                }

                if (Status == "All")
                {
                    //m_DataBase.AddInParameter(selectCommand, "@CertStatus", DbType.String, Status);
                    //m_DataBase.AddInParameter(selectCommand, "@PayFlag", DbType.String, "Y");
                }
                else
                {

                    SQLCommand = SQLCommand + " And A.PayFlag = @PayFlag And A.CertStatus = @CertStatus  ";
                }

                if (VLECode != "")
                {
                    SQLCommand = SQLCommand + " And A.VLEID = @VLEID ";
                }

                if (ApplicationID == "")
                {
                    //SQLCommand = SQLCommand + " And Cast(A.CreatedOn As Date) Between Cast(DATEADD(D, -7, GetDate()) As Date) And Cast(GETDATE() As Date) ";
                    SQLCommand = SQLCommand + " And A.CreatedOn > '" + t_FromDate.ToString("yyyy-MM-dd") + "' And A.CreatedOn < '" + t_ToDate.ToString("yyyy-MM-dd") + "' ";
                }

                SQLCommand = SQLCommand + " Order By A.AppID Desc ";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, OperatorID);
                m_DataBase.AddInParameter(selectCommand, "@CertStatus", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@PayFlag", DbType.AnsiString, "Y");
                m_DataBase.AddInParameter(selectCommand, "@ApplicationID", DbType.AnsiString, ApplicationID);
                m_DataBase.AddInParameter(selectCommand, "@District", DbType.AnsiString, District);
                m_DataBase.AddInParameter(selectCommand, "@Taluka", DbType.AnsiString, Taluka);
                m_DataBase.AddInParameter(selectCommand, "@Village", DbType.AnsiString, Village);
                m_DataBase.AddInParameter(selectCommand, "@VLEID", DbType.AnsiString, VLECode);

                if (FromDate != "" && ToDate != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.Date, FromDate);
                    m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.Date, ToDate);
                }

                if (ServiceID != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                }

                if (IsSCA)
                {
                    m_DataBase.AddInParameter(selectCommand, "@SCAID", DbType.AnsiString, SCAID);
                }
                else if (IsKiosk)
                {
                    m_DataBase.AddInParameter(selectCommand, "@KioskID", DbType.AnsiString, KioskID);
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

        internal int UpdateDeliveryStatus(string Applications)
        {
            int ResultRow;
            string Query = "";

            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);

            Query = "Update " + TableTrackStatus + " Set CertStatus = 'Delivered' Where AppID In (" + Applications + ")";

            ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);

            Query = "Insert Into CertificateStatus (ApplicantID, CertStatus, UpdateOn, LoginID) Select ApplicantID, 'Delivered' As CertStatus, GetDate(), CreatedBy From " + TableTrackStatus + " Where AppID In (" +
                Applications + ")";

            ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);

            return ResultRow;
        }

        internal DataTable GetApplicationsPendingForPayment(string OperatorID, string FromDate, string ToDate, string ServiceID, string ApplicationID, string District, string Taluka, string Village,
            bool IsKiosk, string KioskID, bool IsSCA, string SCAID, string VLECode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;

            if (ServiceID == "2124")
            {
                return GetApplicationsPendingForPayment2124(OperatorID, FromDate, ToDate, ServiceID, ApplicationID, District, Taluka, Village,
                    IsKiosk, KioskID, IsSCA, SCAID, VLECode);
                //return null;
            }

            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select ISNULL(C.GeneratedDocPath, B.CertifcatePath) As ReceiptURL, IsNull(C.GeneratedDocPath, B.CertificateURL) As CertificateURL, 
                                        Case When IsNull(A.AffidavitServiceID, 0)= 0 Then A.ServiceID Else A.AffidavitServiceID End As ServiceID,                
                                        A.AppID, A.LangID, Cast(A.CreatedOn As Date) As CreatedOn, 
                                        F1.SvcName As ServiceName, A.ApplicantID As ApplicationID, D1.DistrictName, E.SubDistrictName, F.VillageName,
                                        Case A.PayFlag When 'Y' Then 'Paid' When 'N' Then 'Unpaid' Else '' End  As Payment, Case When IsNull(F1.DeactivatePendingForPayment, 0) = 1 Then 'Y' Else 'N' End As DeactivatePendingForPayment
                                        From TrackStatus (NoLock) A Left Join Mst_Track B On A.ServiceID = B.ServiceID And A.LangID = B.LangStatus 
                                        Left Join Mst_GeneratedDocumented C On A.ServiceID = C.ServiceID And A.LangId = C.LangId And C.Priority = 1  
                                        Left Join MstDistrict D1 On A.DistrictCode = D1.DistrictCode And D1.LangId = 1  
                                        Left Join MstTaluka E On A.TehsilCode = E.SubdistrictCode And E.LangId = 1  
                                        Left Join MstVillage F On A.VillageCode = Cast(F.villagecode As varchar(20)) And F.LangId = 1
                                        Inner Join MstServices F1 On A.ServiceID = F1.SvcID";

                if (IsSCA || IsKiosk)
                {
                    SQLCommand = SQLCommand + " Inner Join mstUsers D On A.CreatedBy = D.Unq ";
                }

                SQLCommand = SQLCommand + " Where A.PayFlag = @PayFlag And A.CertStatus = @CertStatus And A.ServiceID Not In (2124)  ";

                if (IsSCA)
                {
                    SQLCommand = SQLCommand + " And Left(D.KioskID, 2) = @SCAID ";
                }
                else if (IsKiosk)
                {
                    SQLCommand = SQLCommand + " And D.KioskID = @KioskID ";
                }
                else
                {
                    SQLCommand = SQLCommand + " And A.CreatedBy = @CreatedBy ";
                }

                if (FromDate != "" && ToDate != "")
                {
                    SQLCommand = SQLCommand + " And Cast(A.CreatedOn As Date) Between @FromDate And @ToDate ";
                }

                if (District != "")
                {
                    SQLCommand = SQLCommand + " And A.DistrictCode = @District";
                }

                if (Taluka != "")
                {
                    SQLCommand = SQLCommand + " And A.TehsilCode = @Taluka";
                }

                if (Village != "")
                {
                    SQLCommand = SQLCommand + " And A.VillageCode = @Village";
                }

                if (ApplicationID != "")
                {
                    SQLCommand = SQLCommand + " And A.ApplicantId like '%" + ApplicationID + "%'";
                }

                if (ServiceID != "")
                {
                    SQLCommand = SQLCommand + " And A.ServiceID = @ServiceID";
                }

                if (VLECode != "")
                {
                    SQLCommand = SQLCommand + " And A.VLEID = @VLEID ";
                }

                if (ApplicationID == "")
                {
                    SQLCommand = SQLCommand + " And Cast(A.CreatedOn As Date) Between Cast(DATEADD(D, -2, GetDate()) As Date) And Cast(GETDATE() As Date) ";
                }

                SQLCommand = SQLCommand + " Order By A.AppID Desc ";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, OperatorID);
                m_DataBase.AddInParameter(selectCommand, "@PayFlag", DbType.AnsiString, "N");
                m_DataBase.AddInParameter(selectCommand, "@CertStatus", DbType.AnsiString, "Pending");
                m_DataBase.AddInParameter(selectCommand, "@ApplicationID", DbType.AnsiString, ApplicationID);
                m_DataBase.AddInParameter(selectCommand, "@District", DbType.AnsiString, District);
                m_DataBase.AddInParameter(selectCommand, "@Taluka", DbType.AnsiString, Taluka);
                m_DataBase.AddInParameter(selectCommand, "@Village", DbType.AnsiString, Village);
                m_DataBase.AddInParameter(selectCommand, "@VLEID", DbType.AnsiString, VLECode);

                if (FromDate != "" && ToDate != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.Date, FromDate);
                    m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.Date, ToDate);
                }

                if (ServiceID != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                }

                if (IsSCA)
                {
                    m_DataBase.AddInParameter(selectCommand, "@SCAID", DbType.AnsiString, SCAID);
                }
                else if (IsKiosk)
                {
                    m_DataBase.AddInParameter(selectCommand, "@KioskID", DbType.AnsiString, KioskID);
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

        private DataTable GetApplicationsPendingForPayment2124(string OperatorID, string FromDate, string ToDate, string ServiceID, string ApplicationID, string District, string Taluka, string Village, bool IsKiosk, string KioskID, bool IsSCA, string SCAID, string VLECode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select ISNULL(C.GeneratedDocPath, B.CertifcatePath) As ReceiptURL, IsNull(C.GeneratedDocPath, B.CertificateURL) As CertificateURL, 
                                        Case When IsNull(A.AffidavitServiceID, 0)= 0 Then A.ServiceID Else A.AffidavitServiceID End As ServiceID,                
                                        A.AppID, A.LangID, Cast(A.CreatedOn As Date) As CreatedOn, 
                                        A.ServiceName, A.ApplicantID As ApplicationID, '' As DistrictName,  '' As SubDistrictName, C1.ConsumerNo + '/' + Cast(C1.BillingUnit As varchar(10)) As [ConsumerNo/BillingUnit],
                                        Case A.PayFlag When 'Y' Then 'Paid' When 'N' Then 'Unpaid' Else '' End  As Payment
                                        From TrackStatus (NoLock) A Left Join Mst_Track B On A.ServiceID = B.ServiceID And A.LangID = B.LangStatus 
                                        Left Join Mst_GeneratedDocumented C On A.ServiceID = C.ServiceID And A.LangId = C.LangId And C.Priority = 1  
                                        Left Join Trn_ElectBillPay C1 On A.ApplicantID = C1.ApplicantID
                                        ";

                if (IsSCA || IsKiosk)
                {
                    SQLCommand = SQLCommand + " Inner Join mstUsers D On A.CreatedBy = D.Unq ";
                }

                SQLCommand = SQLCommand + " Where A.PayFlag = @PayFlag And A.CertStatus = @CertStatus  ";

                if (IsSCA)
                {
                    SQLCommand = SQLCommand + " And Left(D.KioskID, 2) = @SCAID ";
                }
                else if (IsKiosk)
                {
                    SQLCommand = SQLCommand + " And D.KioskID = @KioskID ";
                }
                else
                {
                    SQLCommand = SQLCommand + " And A.CreatedBy = @CreatedBy ";
                }

                if (FromDate != "" && ToDate != "")
                {
                    SQLCommand = SQLCommand + " And Cast(A.CreatedOn As Date) Between @FromDate And @ToDate ";
                }

                if (ApplicationID != "")
                {
                    SQLCommand = SQLCommand + " And A.ApplicantId like '%" + ApplicationID + "%'";
                }

                if (ServiceID != "")
                {
                    SQLCommand = SQLCommand + " And A.ServiceID = @ServiceID";
                }

                if (VLECode != "")
                {
                    SQLCommand = SQLCommand + " And A.VLEID = @VLEID ";
                }

                if (ApplicationID == "")
                {
                    SQLCommand = SQLCommand + " And Cast(A.CreatedOn As Date) Between Cast(DATEADD(D, -7, GetDate()) As Date) And Cast(GETDATE() As Date) ";
                }

                SQLCommand = SQLCommand + " Order By A.AppID Desc ";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, OperatorID);
                m_DataBase.AddInParameter(selectCommand, "@PayFlag", DbType.AnsiString, "N");
                m_DataBase.AddInParameter(selectCommand, "@CertStatus", DbType.AnsiString, "Pending");
                m_DataBase.AddInParameter(selectCommand, "@ApplicationID", DbType.AnsiString, ApplicationID);
                m_DataBase.AddInParameter(selectCommand, "@District", DbType.AnsiString, District);
                m_DataBase.AddInParameter(selectCommand, "@Taluka", DbType.AnsiString, Taluka);
                m_DataBase.AddInParameter(selectCommand, "@Village", DbType.AnsiString, Village);
                m_DataBase.AddInParameter(selectCommand, "@VLEID", DbType.AnsiString, VLECode);

                if (FromDate != "" && ToDate != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.Date, FromDate);
                    m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.Date, ToDate);
                }

                if (ServiceID != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                }

                if (IsSCA)
                {
                    m_DataBase.AddInParameter(selectCommand, "@SCAID", DbType.AnsiString, SCAID);
                }
                else if (IsKiosk)
                {
                    m_DataBase.AddInParameter(selectCommand, "@KioskID", DbType.AnsiString, KioskID);
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

            DateTime t_FromDate, t_ToDate;

            t_FromDate = DateTime.Now.AddDays(-2);
            t_ToDate = DateTime.Now.AddDays(1);

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select 
                                        Sum(1) As 'All',
                                        Sum(Case When CertStatus = 'Intial' Then 1 Else 0 End) As 'Intial',
                                        Sum(Case When CertStatus = 'Pending' And PayFlag = 'N' And ServiceID Not In (2124) Then 1 Else 0 End) As 'PendingforPayment',
                                        Sum(Case When CertStatus = 'Pending' And PayFlag = 'Y' Then 1 Else 0 End) As 'Pending',
                                        Sum(Case When CertStatus = 'Approved' And PayFlag = 'Y' Then 1 Else 0 End) As 'Approved',
                                        Sum(Case When CertStatus = 'Delivered' And PayFlag = 'Y' Then 1 Else 0 End) As 'Delivered',
                                        Sum(Case When CertStatus = 'Rejected' And PayFlag = 'Y' Then 1 Else 0 End) As 'Rejected'
                                        From TrackStatus (NoLock) A ";
                if (IsSCA || IsKiosk)
                {
                    SQLCommand = SQLCommand + " Inner Join mstUsers D On A.CreatedBy = D.Unq ";
                }
                if (IsSCA)
                {
                    SQLCommand = SQLCommand + " Where Left(D.KioskID, 2) = @SCAID ";
                }
                else if (IsKiosk)
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

                //SQLCommand = SQLCommand + " And Cast(A.CreatedOn As Date) Between Cast(DATEADD(D, -2, GetDate()) As Date) And Cast(GETDATE() As Date) ";
                SQLCommand = SQLCommand + " And A.CreatedOn > '" + t_FromDate.ToString("yyyy-MM-dd") + "' And A.CreatedOn < '" + t_ToDate.ToString("yyyy-MM-dd") + "' ";

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

        /*******************************/

        internal DataTable GetApplicationsAdmin(string Status, string FromDate, string ToDate, string ServiceID,
            string ApplicationID, string District, string Taluka, string Village, bool IsKiosk, string KioskID,
            bool IsSCA, string SCAID, string Unq, string VLECode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;

            if (ServiceID == "2124")
            {
                return GetApplications2124Admin(Status, FromDate, ToDate, ServiceID,
                    ApplicationID, District, Taluka, Village, IsKiosk, KioskID,
                    IsSCA, SCAID, Unq, VLECode);
            }

            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select ISNULL(C.GeneratedDocPath, B.CertifcatePath) As ReceiptURL, 
                                        IsNull(C.GeneratedDocPath, B.CertificateURL) As CertificateURL,                                         
                                        Case When IsNull(A.AffidavitServiceID, 0)= 0 Then A.ServiceID Else A.AffidavitServiceID End As ServiceID,
                                        A.AppID, A.LangID, 
                                        Case When C.GeneratedDocPath Is Null Then 1 Else 2 End As Type, 
                                        Cast(A.CreatedOn As Date) As CreatedOn, A.ServiceName, A.ApplicantID As ApplicationID, D1.DistrictName, E.SubDistrictName, F.VillageName,
                                        Case A.PayFlag When 'Y' Then 'Paid' When 'N' Then 'Unpaid' Else '' End  As Payment, 
                                        Case A.IsIneDistrict When 'Y' Then 'Yes' When 'N' Then 'No' Else 'No' End  As IsIneDistrict 
                                        From TrackStatus (NoLock) A 
                                        Left Join Mst_Track B On A.ServiceID = B.ServiceID And A.LangID = B.LangStatus 
                                        Left Join Mst_GeneratedDocumented C On A.ServiceID = C.ServiceID And A.LangId = C.LangId And C.ToBeSigned = 1 
                                        Left Join MstDistrict D1 On A.DistrictCode = D1.DistrictCode And D1.LangId = 1  
                                        Left Join MstTaluka E On A.TehsilCode = E.SubdistrictCode And E.LangId = 1  
                                        Left Join MstVillage F On A.VillageCode = Cast(F.villagecode As varchar(20)) And F.LangId = 1 Where 1 = 1";
                /*
                if (IsSCA || IsKiosk)
                {
                    SQLCommand = SQLCommand + " Inner Join mstUsers D On A.CreatedBy = D.Unq ";
                }

                //SQLCommand = SQLCommand + " Where A.PayFlag = @PayFlag And A.CertStatus = @CertStatus  ";
                
                if (IsSCA)
                {
                    SQLCommand = SQLCommand + " Where Left(D.KioskID, 2) = @SCAID ";
                }
                else if (IsKiosk)
                {
                    SQLCommand = SQLCommand + " Where  D.KioskID = @KioskID ";
                }
                else
                {
                    SQLCommand = SQLCommand + " Where A.CreatedBy = @CreatedBy ";
                }
                */

                if (FromDate != "" && ToDate != "")
                {
                    SQLCommand = SQLCommand + " And Cast(A.CreatedOn As Date) Between @FromDate And @ToDate ";
                }

                if (ServiceID != "")
                {
                    SQLCommand = SQLCommand + " And A.ServiceID = @ServiceID";
                }

                if (ApplicationID != "")
                {
                    SQLCommand = SQLCommand + " And A.ApplicantId = @ApplicationID";
                }

                /*if (Status == "All")
                {
                    //m_DataBase.AddInParameter(selectCommand, "@CertStatus", DbType.String, Status);
                    //m_DataBase.AddInParameter(selectCommand, "@PayFlag", DbType.String, "Y");
                }
                else
                {

                    SQLCommand = SQLCommand + " And A.PayFlag = @PayFlag And A.CertStatus = @CertStatus  ";
                }
                 * */

                if (District != "")
                {
                    SQLCommand = SQLCommand + " And A.DistrictCode = @District";
                }

                if (Taluka != "")
                {
                    SQLCommand = SQLCommand + " And A.TehsilCode = @Taluka";
                }

                if (Village != "")
                {
                    SQLCommand = SQLCommand + " And A.VillageCode = @Village";
                }

                if (VLECode != "")
                {
                    SQLCommand = SQLCommand + " And A.VLEID = @VLEID ";
                }

                if (Unq != "")
                {
                    SQLCommand = SQLCommand + " And A.CreatedBy = @CreatedBy ";
                }
                /*if (ApplicationID == "")
                {
                    SQLCommand = SQLCommand + " And Cast(A.CreatedOn As Date) Between Cast(DATEADD(D, -2, GetDate()) As Date) And Cast(GETDATE() As Date) ";
                }
                */
                SQLCommand = SQLCommand + " Order By A.AppID Desc ";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                //m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, OperatorID);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, Unq);
                m_DataBase.AddInParameter(selectCommand, "@CertStatus", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@PayFlag", DbType.AnsiString, "Y");
                m_DataBase.AddInParameter(selectCommand, "@ApplicationID", DbType.AnsiString, ApplicationID);
                m_DataBase.AddInParameter(selectCommand, "@District", DbType.AnsiString, District);
                m_DataBase.AddInParameter(selectCommand, "@Taluka", DbType.AnsiString, Taluka);
                m_DataBase.AddInParameter(selectCommand, "@Village", DbType.AnsiString, Village);
                m_DataBase.AddInParameter(selectCommand, "@VLEID", DbType.AnsiString, VLECode);

                if (FromDate != "" && ToDate != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.Date, FromDate);
                    m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.Date, ToDate);
                }

                if (ServiceID != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                }

                if (IsSCA)
                {
                    m_DataBase.AddInParameter(selectCommand, "@SCAID", DbType.AnsiString, SCAID);
                }
                else if (IsKiosk)
                {
                    m_DataBase.AddInParameter(selectCommand, "@KioskID", DbType.AnsiString, KioskID);
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

        internal int UpdateDeliveryStatusAdmin(string Applications)
        {
            int ResultRow;
            string Query = "";

            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);

            Query = "Update " + TableTrackStatus + " Set CertStatus = 'Delivered' Where AppID In (" + Applications + ")";

            ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);

            Query = "Insert Into CertificateStatus (ApplicantID, CertStatus, UpdateOn, LoginID) Select ApplicantID, 'Delivered' As CertStatus, GetDate(), CreatedBy From " + TableTrackStatus + " Where AppID In (" +
                Applications + ")";

            ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);

            return ResultRow;
        }

        internal DataTable GetApplicationsPendingForPaymentAdmin(string OperatorID, string FromDate, string ToDate, string ServiceID, string ApplicationID, string District, string Taluka, string Village,
            bool IsKiosk, string KioskID, bool IsSCA, string SCAID, string VLECode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;

            if (ServiceID == "2124")
            {
                return GetApplicationsPendingForPayment2124(OperatorID, FromDate, ToDate, ServiceID, ApplicationID, District, Taluka, Village,
                    IsKiosk, KioskID, IsSCA, SCAID, VLECode);
                //return null;
            }

            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select ISNULL(C.GeneratedDocPath, B.CertifcatePath) As ReceiptURL, IsNull(C.GeneratedDocPath, B.CertificateURL) As CertificateURL, 
                                        Case When IsNull(A.AffidavitServiceID, 0)= 0 Then A.ServiceID Else A.AffidavitServiceID End As ServiceID,                
                                        A.AppID, A.LangID, Cast(A.CreatedOn As Date) As CreatedOn, 
                                        F1.SvcName As ServiceName, A.ApplicantID As ApplicationID, D1.DistrictName, E.SubDistrictName, F.VillageName,
                                        Case A.PayFlag When 'Y' Then 'Paid' When 'N' Then 'Unpaid' Else '' End  As Payment, Case When IsNull(F1.DeactivatePendingForPayment, 0) = 1 Then 'Y' Else 'N' End As DeactivatePendingForPayment
                                        From TrackStatus (NoLock) A Left Join Mst_Track B On A.ServiceID = B.ServiceID And A.LangID = B.LangStatus 
                                        Left Join Mst_GeneratedDocumented C On A.ServiceID = C.ServiceID And A.LangId = C.LangId And C.ToBeSigned = 1
                                        Left Join MstDistrict D1 On A.DistrictCode = D1.DistrictCode And D1.LangId = 1  
                                        Left Join MstTaluka E On A.TehsilCode = E.SubdistrictCode And E.LangId = 1  
                                        Left Join MstVillage F On A.VillageCode = Cast(F.villagecode As varchar(20)) And F.LangId = 1
                                        Inner Join MstServices F1 On A.ServiceID = F1.SvcID Where 1 = 1 ";
                /*
                if (IsSCA || IsKiosk)
                {
                    SQLCommand = SQLCommand + " Inner Join mstUsers D On A.CreatedBy = D.Unq ";
                }
                
                SQLCommand = SQLCommand + " Where A.PayFlag = @PayFlag And A.CertStatus = @CertStatus And A.ServiceID Not In (2124)  ";
                
                if (IsSCA)
                {
                    SQLCommand = SQLCommand + " And Left(D.KioskID, 2) = @SCAID ";
                }
                else if (IsKiosk)
                {
                    SQLCommand = SQLCommand + " And D.KioskID = @KioskID ";
                }
                else
                {
                    SQLCommand = SQLCommand + " And A.CreatedBy = @CreatedBy ";
                }
                */
                if (FromDate != "" && ToDate != "")
                {
                    SQLCommand = SQLCommand + " And Cast(A.CreatedOn As Date) Between @FromDate And @ToDate ";
                }

                if (District != "")
                {
                    SQLCommand = SQLCommand + " And A.DistrictCode = @District";
                }

                if (Taluka != "")
                {
                    SQLCommand = SQLCommand + " And A.TehsilCode = @Taluka";
                }

                if (Village != "")
                {
                    SQLCommand = SQLCommand + " And A.VillageCode = @Village";
                }

                if (ApplicationID != "")
                {
                    SQLCommand = SQLCommand + " And A.ApplicantId like '%" + ApplicationID + "%'";
                }

                if (ServiceID != "")
                {
                    SQLCommand = SQLCommand + " And A.ServiceID = @ServiceID";
                }

                if (VLECode != "")
                {
                    SQLCommand = SQLCommand + " And A.VLEID = @VLEID ";
                }

                if (ApplicationID == "")
                {
                    SQLCommand = SQLCommand + " And Cast(A.CreatedOn As Date) Between Cast(DATEADD(D, -2, GetDate()) As Date) And Cast(GETDATE() As Date) ";
                }

                SQLCommand = SQLCommand + " Order By A.AppID Desc ";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, OperatorID);
                m_DataBase.AddInParameter(selectCommand, "@PayFlag", DbType.AnsiString, "N");
                m_DataBase.AddInParameter(selectCommand, "@CertStatus", DbType.AnsiString, "Pending");
                m_DataBase.AddInParameter(selectCommand, "@ApplicationID", DbType.AnsiString, ApplicationID);
                m_DataBase.AddInParameter(selectCommand, "@District", DbType.AnsiString, District);
                m_DataBase.AddInParameter(selectCommand, "@Taluka", DbType.AnsiString, Taluka);
                m_DataBase.AddInParameter(selectCommand, "@Village", DbType.AnsiString, Village);
                m_DataBase.AddInParameter(selectCommand, "@VLEID", DbType.AnsiString, VLECode);

                if (FromDate != "" && ToDate != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.Date, FromDate);
                    m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.Date, ToDate);
                }

                if (ServiceID != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                }

                if (IsSCA)
                {
                    m_DataBase.AddInParameter(selectCommand, "@SCAID", DbType.AnsiString, SCAID);
                }
                else if (IsKiosk)
                {
                    m_DataBase.AddInParameter(selectCommand, "@KioskID", DbType.AnsiString, KioskID);
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

        public DataTable GetCountAdmin(string LoginId, bool IsKiosk, string KioskID, bool IsSCA, string SCAID, string VLECode)
        {
            string m_Role = string.Empty;
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select 
                                        Sum(1) As 'All',
                                        Sum(Case When CertStatus = 'Intial' Then 1 Else 0 End) As 'Intial',
                                        Sum(Case When CertStatus = 'Pending' And PayFlag = 'N' And ServiceID Not In (2124) Then 1 Else 0 End) As 'PendingforPayment',
                                        Sum(Case When CertStatus = 'Pending' And PayFlag = 'Y' Then 1 Else 0 End) As 'Pending',
                                        Sum(Case When CertStatus = 'Approved' And PayFlag = 'Y' Then 1 Else 0 End) As 'Approved',
                                        Sum(Case When CertStatus = 'Delivered' And PayFlag = 'Y' Then 1 Else 0 End) As 'Delivered',
                                        Sum(Case When CertStatus = 'Rejected' And PayFlag = 'Y' Then 1 Else 0 End) As 'Rejected'
                                        From TrackStatus (NoLock) A  Where 1=1 ";
                if (IsSCA || IsKiosk)
                {
                    SQLCommand = SQLCommand + " Inner Join mstUsers D On A.CreatedBy = D.Unq ";
                }
                /*
                if (IsSCA)
                {
                    SQLCommand = SQLCommand + " Where Left(D.KioskID, 2) = @SCAID ";
                }
                else if (IsKiosk)
                {
                    SQLCommand = SQLCommand + " Where  D.KioskID = @KioskID ";
                }
                else
                {
                    SQLCommand = SQLCommand + " Where A.CreatedBy = @LoginId ";
                }
                */
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

        private DataTable GetApplications2124Admin(string Status, string FromDate, string ToDate, string ServiceID,
            string ApplicationID, string District, string Taluka, string Village, bool IsKiosk, string KioskID,
            bool IsSCA, string SCAID, string Unq, string VLECode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select ISNULL(C.GeneratedDocPath, B.CertifcatePath) As ReceiptURL, 
                                        IsNull(C.GeneratedDocPath, B.CertificateURL) As CertificateURL,                                         
                                        Case When IsNull(A.AffidavitServiceID, 0)= 0 Then A.ServiceID Else A.AffidavitServiceID End As ServiceID,
                                        A.AppID, A.LangID, 
                                        Case When C.GeneratedDocPath Is Null Then 1 Else 2 End As Type, 
                                        Cast(A.CreatedOn As Date) As CreatedOn, A.ServiceName, A.ApplicantID As ApplicationID, C1.ConsumerName,  '' As SubDistrictName, C1.ConsumerNo + '/' + Cast(C1.BillingUnit as Varchar(10)) As [ConsumerNo/BillingUnit],
                                        Case A.PayFlag When 'Y' Then 'Paid' When 'N' Then 'Unpaid' Else '' End  As Payment
                                        From TrackStatus (NoLock) A 
                                        Left Join Mst_Track B On A.ServiceID = B.ServiceID And A.LangID = B.LangStatus 
                                        Left Join Mst_GeneratedDocumented C On A.ServiceID = C.ServiceID And A.LangId = C.LangId And C.ToBeSigned = 1 
                                        Left Join Trn_ElectBillPay C1 On A.ApplicantID = C1.ApplicantID Where 1 = 1 
                                        ";
                /*
                if (IsSCA || IsKiosk)
                {
                    SQLCommand = SQLCommand + " Inner Join mstUsers D On A.CreatedBy = D.Unq ";
                }

                //SQLCommand = SQLCommand + " Where A.PayFlag = @PayFlag And A.CertStatus = @CertStatus  ";
                
                if (IsSCA)
                {
                    SQLCommand = SQLCommand + " Where Left(D.KioskID, 2) = @SCAID ";
                }
                else if (IsKiosk)
                {
                    SQLCommand = SQLCommand + " Where  D.KioskID = @KioskID ";
                }
                else
                {
                    SQLCommand = SQLCommand + " Where A.CreatedBy = @CreatedBy ";
                }
                */

                if (FromDate != "" && ToDate != "")
                {
                    SQLCommand = SQLCommand + " And Cast(A.CreatedOn As Date) Between @FromDate And @ToDate ";
                }

                if (ServiceID != "")
                {
                    SQLCommand = SQLCommand + " And A.ServiceID = @ServiceID";
                }

                if (ApplicationID != "")
                {
                    SQLCommand = SQLCommand + " And A.ApplicantId = @ApplicationID";
                }

                if (Status == "All")
                {
                    //m_DataBase.AddInParameter(selectCommand, "@CertStatus", DbType.String, Status);
                    //m_DataBase.AddInParameter(selectCommand, "@PayFlag", DbType.String, "Y");
                }
                else
                {

                    SQLCommand = SQLCommand + " And A.PayFlag = @PayFlag And A.CertStatus = @CertStatus  ";
                }

                if (VLECode != "")
                {
                    SQLCommand = SQLCommand + " And A.VLEID = @VLEID ";
                }

                if (Unq != "")
                {
                    SQLCommand = SQLCommand + " And A.Createdby = @CreatedBy ";
                }

                if (ApplicationID == "")
                {
                    SQLCommand = SQLCommand + " And Cast(A.CreatedOn As Date) Between Cast(DATEADD(D, -7, GetDate()) As Date) And Cast(GETDATE() As Date) ";
                }

                SQLCommand = SQLCommand + " Order By A.AppID Desc ";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                //m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, OperatorID);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, Unq);
                m_DataBase.AddInParameter(selectCommand, "@CertStatus", DbType.AnsiString, Status);
                m_DataBase.AddInParameter(selectCommand, "@PayFlag", DbType.AnsiString, "Y");
                m_DataBase.AddInParameter(selectCommand, "@ApplicationID", DbType.AnsiString, ApplicationID);
                m_DataBase.AddInParameter(selectCommand, "@District", DbType.AnsiString, District);
                m_DataBase.AddInParameter(selectCommand, "@Taluka", DbType.AnsiString, Taluka);
                m_DataBase.AddInParameter(selectCommand, "@Village", DbType.AnsiString, Village);
                m_DataBase.AddInParameter(selectCommand, "@VLEID", DbType.AnsiString, VLECode);

                if (FromDate != "" && ToDate != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.Date, FromDate);
                    m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.Date, ToDate);
                }

                if (ServiceID != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, ServiceID);
                }

                if (IsSCA)
                {
                    m_DataBase.AddInParameter(selectCommand, "@SCAID", DbType.AnsiString, SCAID);
                }
                else if (IsKiosk)
                {
                    m_DataBase.AddInParameter(selectCommand, "@KioskID", DbType.AnsiString, KioskID);
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

        public DataTable GetVLEAdmin(string District, string Taluka, string VLECode)
        {
            string m_Role = string.Empty;
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select VLEName+ ' ('+ VLECode  +')' As VLE, VLECode, IsSCAVLE, Unq from ALLVLEDEtails Where DistrictCode = @DistrictCode and SubDistrictCode = @SubDistrictCode ";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);

                SQLCommand = SQLCommand + " Order By VLEName ";

                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, District);
                m_DataBase.AddInParameter(selectCommand, "@SubDistrictCode", DbType.AnsiString, Taluka);

                if (VLECode != "")
                {
                    SQLCommand = SQLCommand + " And VLECode = @VLECode";
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
    }
}
