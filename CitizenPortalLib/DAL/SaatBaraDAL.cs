using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;
using System.Web;

namespace CitizenPortalLib.DAL
{
    public class SaatBaraDAL : DALBase
    {
        Database m_DataBase;

        public SaatBaraDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public SaatBaraDAL()
            : base()
        {

        }

        static string TableTrackStatus = "TrackStatus";
        static string AddressTableName = "trnAddress";
        static string SewaConnectionString = "Sewa";
        static string FrameConnectionString = "Frame";

        public DataTable GetSurveyNo(string SurveyNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select *                                         
                                        From mstSaatBara
                                        Where SurveyCode = @SurveyNo";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@SurveyNo", DbType.String, SurveyNo);
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

        internal DataTable GetDetail(string TransactionId)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select *                                         
                                        From SaatBaraDetail
                                        Where TransactionId = @TransactionId";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@TransactionId", DbType.String, TransactionId);
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

        internal DataTable GetSaat(string TransactionId)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select *                                         
                                        From Saat
                                        Where TransactionId = @TransactionId";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@TransactionId", DbType.String, TransactionId);
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

        internal DataTable GetBara(string TransactionId)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select *                                         
                                        From Bara
                                        Where TransactionId = @TransactionId";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@TransactionId", DbType.String, TransactionId);
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

        internal string InsertAddressV2(DataStructs.KioskAddressDetails_DT objKioskAddressDetails_DT, string[] AAddressFields, string ServiceId, string p_AppID)
        {
            string t_AppID = "";
            string t_SeqNo = "";
            string t_UNQ = "";

            string DistrictCode, SubDistrictCode, VillageCode;
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(SewaConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "";

                DistrictCode = objKioskAddressDetails_DT.District_Code;
                SubDistrictCode = objKioskAddressDetails_DT.Taluka_Code;
                VillageCode = objKioskAddressDetails_DT.Village_Code;
                t_UNQ = HttpContext.Current.Session["sUNQ"].ToString();

                t_AppID = p_AppID;

                selectCommand = null;
                selectCommand = m_DataBase.GetSqlStringCommand(@"Insert into trnAddress 
                                                                        (FullName, FullName_LL, District_Code, Taluka_Code, Village_Code, CreatedOn, CreatedBy, ParentKey, ChildKey, Village) Values
                                                                    (@FullName, @FullName_LL, @District_Code, @Taluka_Code, @Village_Code, GetDate(), @CreatedBy, @ParentKey, @ChildKey, @Village)");
                m_DataBase.AddInParameter(selectCommand, "@FullName", DbType.String, objKioskAddressDetails_DT.FullName);
                m_DataBase.AddInParameter(selectCommand, "@FullName_LL", DbType.String, objKioskAddressDetails_DT.FullName_LL);
                m_DataBase.AddInParameter(selectCommand, "@District_Code", DbType.String, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@Taluka_Code", DbType.String, SubDistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@Village_Code", DbType.String, VillageCode);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.String, t_UNQ);
                m_DataBase.AddInParameter(selectCommand, "@ParentKey", DbType.String, t_AppID);
                m_DataBase.AddInParameter(selectCommand, "@ChildKey", DbType.String, "Applicant Address");
                m_DataBase.AddInParameter(selectCommand, "@Village", DbType.String, objKioskAddressDetails_DT.Village);
                //DatabaseObject.AddInParameter(selectCommand, "@ChildKey", DbType.DateTime, objKioskAddressDetails_DT.CreatedOn);
                //DatabaseObject.AddInParameter(selectCommand, "@KeyField", DbType.String, objKioskRegistration_DT.KeyField);
                int count = (int)m_DataBase.ExecuteNonQuery(selectCommand);

                return t_AppID;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }

        }

        internal string InsertAddress(DataStructs.KioskAddressDetails_DT objKioskAddressDetails_DT, string[] AAddressFields, string ServiceId)
        {
            string t_AppID = "";
            string t_SeqNo = "";
            string t_UNQ = "";

            string DistrictCode, SubDistrictCode, VillageCode;
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select * from MahaSeva..MaxGen";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                t_SeqNo = oDataTable.Rows[0]["SeqNo"].ToString();
                DistrictCode = objKioskAddressDetails_DT.District_Code;
                SubDistrictCode = objKioskAddressDetails_DT.Taluka_Code;
                VillageCode = objKioskAddressDetails_DT.Village_Code;
                t_UNQ = HttpContext.Current.Session["sUNQ"].ToString();

                t_AppID = CommonUtility.GetFinancialYearCode() + DistrictCode + SubDistrictCode + ServiceId + t_SeqNo;

                selectCommand = null;
                selectCommand = DatabaseObject.GetSqlStringCommand(@"Insert into trnAddress 
                                                                        (FullName, FullName_LL, District_Code, Taluka_Code, Village_Code, CreatedOn, CreatedBy, ParentKey, ChildKey, Village) Values
                                                                    (@FullName, @FullName_LL, @District_Code, @Taluka_Code, @Village_Code, GetDate(), @CreatedBy, @ParentKey, @ChildKey, @Village)");
                DatabaseObject.AddInParameter(selectCommand, "@FullName", DbType.String, objKioskAddressDetails_DT.FullName);
                DatabaseObject.AddInParameter(selectCommand, "@FullName_LL", DbType.String, objKioskAddressDetails_DT.FullName_LL);
                DatabaseObject.AddInParameter(selectCommand, "@District_Code", DbType.String, DistrictCode);
                DatabaseObject.AddInParameter(selectCommand, "@Taluka_Code", DbType.String, SubDistrictCode);
                DatabaseObject.AddInParameter(selectCommand, "@Village_Code", DbType.String, VillageCode);
                DatabaseObject.AddInParameter(selectCommand, "@CreatedBy", DbType.String, t_UNQ);
                DatabaseObject.AddInParameter(selectCommand, "@ParentKey", DbType.String, t_AppID);
                DatabaseObject.AddInParameter(selectCommand, "@ChildKey", DbType.String, "Applicant Address");
                DatabaseObject.AddInParameter(selectCommand, "@Village", DbType.String, objKioskAddressDetails_DT.Village);
                //DatabaseObject.AddInParameter(selectCommand, "@ChildKey", DbType.DateTime, objKioskAddressDetails_DT.CreatedOn);
                //DatabaseObject.AddInParameter(selectCommand, "@KeyField", DbType.String, objKioskRegistration_DT.KeyField);
                int count = (int)DatabaseObject.ExecuteNonQuery(selectCommand);

                return t_AppID;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }

        }

        internal string GenerateAppSequenceNo()
        {
            string SequenceNo = null;
            DbCommand selectCommand;

            DataTable DT = new DataTable();

            SequenceNo = "";
            string t_TableName = "Trn_AppSequenceNo712";

            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(SewaConnectionString);//Sewa Connection String
            try
            {
                selectCommand = null;
                selectCommand = m_DataBase.GetSqlStringCommand("Update " + t_TableName + " SET ModifiedBy = '" + HttpContext.Current.Session["sUNQ"].ToString() + "', ModifiedOn = GetDate() Where ApplicationName = 'App712' ");
                int count = (int)m_DataBase.ExecuteNonQuery(selectCommand);

                selectCommand = m_DataBase.GetSqlStringCommand("Update " + t_TableName + " Set SequenceNo = SequenceNo + 1 Where ApplicationName = 'App712' ");
                count = (int)m_DataBase.ExecuteNonQuery(selectCommand);

                string SQLCommand = "Select SequenceNo From " + t_TableName + " Where ApplicationName = 'App712' ";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                SequenceNo = oDataTable.Rows[0]["SequenceNo"].ToString();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }


            SequenceNo = SequenceNo.PadLeft(9, '0');

            return SequenceNo;
        }

        internal string InsertTrackStatusV2(DataStructs.TrackStatus_DT objTrackStatus_DT, string[] AStatusFields, string DistrictCode, String SubDistrictCode, string ServiceID)
        {
            int ResultRow;
            DbCommand selectCommand;
            string t_AppID = "", t_SeqNo = "";

            t_SeqNo = GenerateAppSequenceNo();

            t_AppID = CommonUtility.GetFinancialYearCode() + DistrictCode + SubDistrictCode + ServiceID + t_SeqNo;
            m_DataBase = DatabaseFactory.CreateDatabase(SewaConnectionString);//Sewa Connection String

            selectCommand = m_DataBase.GetSqlStringCommand(@"Insert into TrackStatus 
                                                    (ServiceName, DistrictCode, VillageCode, TehsilCode, LangId, CertStatus, AppName, ApplicantId, ServiceID, 
                                                    CreatedBy, PayFlag, VLEID, CreatedOn) Values
                                                    (@ServiceName, @DistrictCode, @VillageCode, @TehsilCode, @LangId, @CertStatus, @AppName, @ApplicantId, @ServiceID, 
                                                    @CreatedBy, @PayFlag, @VLEID, GetDate())");
            m_DataBase.AddInParameter(selectCommand, "@ServiceName", DbType.String, objTrackStatus_DT.ServiceName);
            m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.String, objTrackStatus_DT.DistrictCode);
            m_DataBase.AddInParameter(selectCommand, "@TehsilCode", DbType.String, objTrackStatus_DT.TehsilCode);
            m_DataBase.AddInParameter(selectCommand, "@VillageCode", DbType.String, objTrackStatus_DT.VillageCode);
            m_DataBase.AddInParameter(selectCommand, "@LangId", DbType.String, objTrackStatus_DT.LangId);
            m_DataBase.AddInParameter(selectCommand, "@CertStatus", DbType.String, objTrackStatus_DT.CertStatus);
            m_DataBase.AddInParameter(selectCommand, "@AppName", DbType.String, objTrackStatus_DT.AppName);
            m_DataBase.AddInParameter(selectCommand, "@ApplicantId", DbType.String, t_AppID);
            m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.String, objTrackStatus_DT.CreatedBy);
            m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.String, objTrackStatus_DT.ServiceID);
            m_DataBase.AddInParameter(selectCommand, "@PayFlag", DbType.String, "N");
            m_DataBase.AddInParameter(selectCommand, "@VLEID", DbType.String, objTrackStatus_DT.VLEID);
            //DatabaseObject.AddInParameter(selectCommand, "@CreatedOn", DbType.String, objTrackStatus_DT.CreatedOn);
            //DatabaseObject.AddInParameter(selectCommand, "@KeyField", DbType.String, objKioskRegistration_DT.KeyField);

            ResultRow = m_DataBase.ExecuteNonQuery(selectCommand);

            return t_AppID;
        }

        internal void InsertTrackStatus(DataStructs.TrackStatus_DT objTrackStatus_DT, string[] AStatusFields, string t_AppID)
        {
            int ResultRow;
            DbCommand selectCommand;
            selectCommand = DatabaseObject.GetSqlStringCommand(@"Insert into TrackStatus 
                                                    (ServiceName, DistrictCode, VillageCode, TehsilCode, LangId, CertStatus, AppName, ApplicantId, ServiceID, 
                                                    CreatedBy, PayFlag, VLEID, CreatedOn) Values
                                                    (@ServiceName, @DistrictCode, @VillageCode, @TehsilCode, @LangId, @CertStatus, @AppName, @ApplicantId, @ServiceID, 
                                                    @CreatedBy, @PayFlag, @VLEID, GetDate())");
            DatabaseObject.AddInParameter(selectCommand, "@ServiceName", DbType.String, objTrackStatus_DT.ServiceName);
            DatabaseObject.AddInParameter(selectCommand, "@DistrictCode", DbType.String, objTrackStatus_DT.DistrictCode);
            DatabaseObject.AddInParameter(selectCommand, "@TehsilCode", DbType.String, objTrackStatus_DT.TehsilCode);
            DatabaseObject.AddInParameter(selectCommand, "@VillageCode", DbType.String, objTrackStatus_DT.VillageCode);
            DatabaseObject.AddInParameter(selectCommand, "@LangId", DbType.String, objTrackStatus_DT.LangId);
            DatabaseObject.AddInParameter(selectCommand, "@CertStatus", DbType.String, objTrackStatus_DT.CertStatus);
            DatabaseObject.AddInParameter(selectCommand, "@AppName", DbType.String, objTrackStatus_DT.AppName);
            DatabaseObject.AddInParameter(selectCommand, "@ApplicantId", DbType.String, t_AppID);
            DatabaseObject.AddInParameter(selectCommand, "@CreatedBy", DbType.String, objTrackStatus_DT.CreatedBy);
            DatabaseObject.AddInParameter(selectCommand, "@ServiceID", DbType.String, objTrackStatus_DT.ServiceID);
            DatabaseObject.AddInParameter(selectCommand, "@PayFlag", DbType.String, "N");
            DatabaseObject.AddInParameter(selectCommand, "@VLEID", DbType.String, objTrackStatus_DT.VLEID);
            //DatabaseObject.AddInParameter(selectCommand, "@CreatedOn", DbType.String, objTrackStatus_DT.CreatedOn);
            //DatabaseObject.AddInParameter(selectCommand, "@KeyField", DbType.String, objKioskRegistration_DT.KeyField);

            ResultRow = m_DataBase.ExecuteNonQuery(selectCommand);


        }


        internal DataTable GetKhatadar()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select *                                         
                                        From mstkhatadar";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);

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

        internal DataTable GetSurvey()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select *                                         
                                        From mstsurvey";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);

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

        internal void InsertSaatBara(DataStructs.SaatBara_DT objSaatBara_DT, string[] ASaatBaraFields, string p_AppID)
        {
            int ResultRow;
            DbCommand selectCommand;
            m_DataBase = DatabaseFactory.CreateDatabase(SewaConnectionString);//Sewa Connection String

            selectCommand = m_DataBase.GetSqlStringCommand(@"Insert into trnSaatBara 
                                                    (ApplicantID,ApplicantName,ApplicantnameLL,SurveyNo,SubSurveyNo,CreatedBy,CreatedOn, Year) Values
                                                    (@ApplicantID,@ApplicantName,@ApplicantnameLL,@SurveyNo,@SubSurveyNo,@CreatedBy,GetDate(), @Year)");


            m_DataBase.AddInParameter(selectCommand, "@ApplicantId", DbType.String, p_AppID);

            m_DataBase.AddInParameter(selectCommand, "@ApplicantName", DbType.String, objSaatBara_DT.ApplicantName);
            m_DataBase.AddInParameter(selectCommand, "@ApplicantnameLL", DbType.String, objSaatBara_DT.ApplicantNameLL);
            m_DataBase.AddInParameter(selectCommand, "@SurveyNo", DbType.String, objSaatBara_DT.SurveyNo);
            m_DataBase.AddInParameter(selectCommand, "@SubSurveyNo", DbType.String, objSaatBara_DT.SubSurveyNo);

            m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.String, objSaatBara_DT.CreatedBy);
            m_DataBase.AddInParameter(selectCommand, "@Year", DbType.String, objSaatBara_DT.Year);


            ResultRow = m_DataBase.ExecuteNonQuery(selectCommand);
        }
    }
}
