using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace CitizenPortalLib.DAL
{
    public class VLEUIDDAL : DALBase
    {
        Database m_DataBase;

        public VLEUIDDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public VLEUIDDAL()
            : base()
        {

        }
                
        static string TableName = "VLEDetails";
        static int m_LangId = 1;

        internal void InsertVLEUID(DataStructs.VLEDetails_DT objVLEDetails_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objVLEDetails_DT, TableName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }
        

        internal DataTable GetVLEID(string VLEID, string UID, string EID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select * from VLEUIDData Where [VLE Code] = @VLEID ";
                                
                if (UID != "")
                {
                    SQLCommand = SQLCommand + " And [UID Code] = @UID";
                }

                if (EID != "")
                {
                    SQLCommand = SQLCommand + " And [UID Code] = @EID";
                }
               

                SQLCommand = SQLCommand + " Order By A.AppID Desc ";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@VLEID", DbType.AnsiString, VLEID);
                m_DataBase.AddInParameter(selectCommand, "@UID", DbType.AnsiString, UID);
                m_DataBase.AddInParameter(selectCommand, "@EID", DbType.AnsiString, EID);
                                
                
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

        internal DataTable AllVLEList(string VLEID, string DistrictCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select * from AllVLEDetails Where [VLECode] = @VLEID";

                if (DistrictCode != "")
                {
                    SQLCommand = SQLCommand + " And DistrictCode = @DistrictCode";
                }

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@VLEID", DbType.AnsiString, VLEID);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);                


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

        internal DataTable UIDCount(string UID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select * from VLEDetails Where UID = @UID";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@UID", DbType.AnsiString, UID);
               
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

        internal void UpdateVLEInfoLog(DataStructs.VLEInformationLog_DT objVLEInformationLog_DT, string[] VLEFields)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;

                selectCommand = null;
                selectCommand = DatabaseObject.GetSqlStringCommand(@"Update VLEInformationLog 
                                                                     Set SCAID = @SCAID, KioskID =@KioskID, DistrictCode=@DistrictCode, SubDistrictCode = @SubDistrictCode, 
                                                                     PanchayatCode=@PanchayatCode, VillageCode=@VillageCode, Name=@Name, NameLL=@NameLL, CareOf=@CareOf, Building=@Building, 
                                                                     Street = @Street, Landmark=@Landmark, Locality=@Locality, PinCode=@PinCode, PanCard=@PanCard,ModifyOn=GetDate(), 
                                                                     DOB=@DOB,ModifyBy=@ModifyBy, VLEImage=@VLEImage, CenterImage=@CenterImage,Age = @Age, OMTID = @OMTID, Gender = @Gender
                                                                     Where UNQ = @UNQ and VLEID = @VLEID and Mobile = @Mobile and MobileOTP = @MobileOTP and 
                                                                     IsOTPVerified = 'Y' and EmailId = @EmailId and VerifyCode=@VerifyCode and IsCodeVerified= 'Y'");
                DatabaseObject.AddInParameter(selectCommand, "@SCAID", DbType.String, objVLEInformationLog_DT.SCAID);
                DatabaseObject.AddInParameter(selectCommand, "@KioskID", DbType.String, objVLEInformationLog_DT.KioskID);
                DatabaseObject.AddInParameter(selectCommand, "@DistrictCode", DbType.Int32, objVLEInformationLog_DT.DistrictCode);
                DatabaseObject.AddInParameter(selectCommand, "@SubDistrictCode", DbType.Int32, objVLEInformationLog_DT.SubDistrictCode);

                DatabaseObject.AddInParameter(selectCommand, "@PanchayatCode", DbType.Int32, objVLEInformationLog_DT.PanchayatCode);
                DatabaseObject.AddInParameter(selectCommand, "@VillageCode", DbType.Int32, objVLEInformationLog_DT.VillageCode);
                DatabaseObject.AddInParameter(selectCommand, "@Name", DbType.String, objVLEInformationLog_DT.Name);
                DatabaseObject.AddInParameter(selectCommand, "@NameLL", DbType.String, objVLEInformationLog_DT.NameLL);
                DatabaseObject.AddInParameter(selectCommand, "@CareOf", DbType.String, objVLEInformationLog_DT.CareOf);
                DatabaseObject.AddInParameter(selectCommand, "@Building", DbType.String, objVLEInformationLog_DT.Building);

                DatabaseObject.AddInParameter(selectCommand, "@Street", DbType.String, objVLEInformationLog_DT.Street);
                DatabaseObject.AddInParameter(selectCommand, "@Landmark", DbType.String, objVLEInformationLog_DT.Landmark);
                DatabaseObject.AddInParameter(selectCommand, "@Locality", DbType.String, objVLEInformationLog_DT.Locality);
                DatabaseObject.AddInParameter(selectCommand, "@PinCode", DbType.String, objVLEInformationLog_DT.PinCode);
                DatabaseObject.AddInParameter(selectCommand, "@PanCard", DbType.String, objVLEInformationLog_DT.PanCard);
                DatabaseObject.AddInParameter(selectCommand, "@ModifyBy", DbType.String, objVLEInformationLog_DT.ModifyBy);
                DatabaseObject.AddInParameter(selectCommand, "@DOB", DbType.DateTime, objVLEInformationLog_DT.DOB);
                DatabaseObject.AddInParameter(selectCommand, "@VLEImage", DbType.Binary, objVLEInformationLog_DT.VLEImage);
                DatabaseObject.AddInParameter(selectCommand, "@CenterImage", DbType.Binary, objVLEInformationLog_DT.CenterImage);
                DatabaseObject.AddInParameter(selectCommand, "@Age", DbType.Int32, objVLEInformationLog_DT.Age);
                DatabaseObject.AddInParameter(selectCommand, "@UNQ", DbType.String, objVLEInformationLog_DT.UNQ);
                DatabaseObject.AddInParameter(selectCommand, "@VLEID", DbType.String, objVLEInformationLog_DT.VLEID);
                DatabaseObject.AddInParameter(selectCommand, "@OMTID", DbType.String, objVLEInformationLog_DT.OMTID);

                DatabaseObject.AddInParameter(selectCommand, "@Mobile", DbType.String, objVLEInformationLog_DT.Mobile);
                DatabaseObject.AddInParameter(selectCommand, "@MobileOTP", DbType.String, objVLEInformationLog_DT.MobileOTP);
                DatabaseObject.AddInParameter(selectCommand, "@EmailId", DbType.String, objVLEInformationLog_DT.EmailId);
                DatabaseObject.AddInParameter(selectCommand, "@VerifyCode", DbType.String, objVLEInformationLog_DT.VerifyCode);
                DatabaseObject.AddInParameter(selectCommand, "@Gender", DbType.String, objVLEInformationLog_DT.Gender);

                int count = (int)DatabaseObject.ExecuteNonQuery(selectCommand);
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

        internal DataTable SkipVLEInfo(string SvcID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select Cast(StartDate As Date) As StartDate, Cast(StopDate As Date) As StopDate from MstServices where SvcID = @SvcID";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@SvcID", DbType.AnsiString, SvcID);

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
