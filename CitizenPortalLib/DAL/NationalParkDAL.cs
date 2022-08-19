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
    public class NationalParkDAL : DALBase
    {
        Database m_DataBase;
        static string m_MahaSevaConnectionString = "Sewa";
        public NationalParkDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public NationalParkDAL()
            : base()
        {
            //this.NationalParkDAL(m_MahaSevaConnectionString);
            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);
            //NationalParkDAL(m_DataBase);
            base.DatabaseObject = m_DataBase;
        }

        static string TableTrackStatus = "TrackStatus";
        static string AddressTableName = "trnAddress";


        //TicketDetails
        //    IdentityProof
        //    Park_Amt_Details
        //    ParkResource
        public DataTable SlotDetail(string ResourceId)
        {            
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"select SlotId,SlotTime from mstTimeSlot where ResourceId=@ResourceId Order by RowId";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@ResourceId", DbType.String, ResourceId);
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

        internal DataTable AvailableSeats(string ResourceID, string Dated)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select * From ParkResource where ResourceId = @ResourceId and Dated = '" + Dated + "' Order by RowId";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@ResourceID", DbType.String, ResourceID);
                m_DataBase.AddInParameter(selectCommand, "@Dated", DbType.String, Dated);
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

        internal DataTable GetRate()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select * from Park_Amt_Details Order BY RowID";
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

//        internal DataTable GetTrainSeats(string ResourceID)
//        {
//            DataTable oDataTable = new DataTable();
//            IDataReader Reader = null;
//            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);
//            try
//            {
//                DbCommand selectCommand;
//                String SQLCommand = @"Select *                                         
//                                        From Bara
//                                        Where TransactionId = @TransactionId";
//                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
//                m_DataBase.AddInParameter(selectCommand, "@TransactionId", DbType.String, ResourceID);
//                Reader = m_DataBase.ExecuteReader(selectCommand);
//                if (Reader != null)
//                    oDataTable.Load(Reader);
//                return oDataTable;
//            }
//            finally
//            {
//                if (Reader != null)
//                {
//                    Reader.Close();
//                }
//            }
//        }

        internal string InsertTicketDatail(DataStructs.TicketDetails_DT objTicketDetails_DT, string[] AFields, string ServiceId, string TicketNo)
        {
            string t_AppID = "";
            string t_SeqNo = "";
            string t_UNQ = "";
            string t_SeqTable = "Trn_AppSequenceNo";
            string t_ApplicationName = "Services";

            string DistrictCode, SubDistrictCode, VillageCode;
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            
            try
            {
                DistrictCode = "000";
                SubDistrictCode = "0000";
                VillageCode = "000000";

                t_UNQ = HttpContext.Current.Session["sUNQ"].ToString();

                DbCommand selectCommand;

                String SQLCommand = "Update " + t_SeqTable + " SET ModifiedBy = @ModifiedBy, ModifiedOn = GetDate() Where ApplicationName = '" + t_ApplicationName + "' ";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                DatabaseObject.AddInParameter(selectCommand, "@ModifiedBY", DbType.String, t_UNQ);
                int count = (int)DatabaseObject.ExecuteNonQuery(selectCommand);

                SQLCommand = "Update " + t_SeqTable + " Set SequenceNo = SequenceNo + 1 Where ApplicationName = '" + t_ApplicationName + "' ";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                count = (int)DatabaseObject.ExecuteNonQuery(selectCommand);

                SQLCommand = "Select SequenceNo From " + t_SeqTable + "  Where ApplicationName = '" + t_ApplicationName + "' ";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                

                if (Reader != null)
                    oDataTable.Load(Reader);

                t_SeqNo = oDataTable.Rows[0]["SequenceNo"].ToString();                
                t_SeqNo = t_SeqNo.PadLeft(9, '0');

                t_AppID = CommonUtility.GetFinancialYearCode() + DistrictCode + SubDistrictCode + ServiceId + t_SeqNo;

                selectCommand = null;

                selectCommand = DatabaseObject.GetSqlStringCommand(@"Insert into TicketDetails (Applicant_FullName,ApplicantID,MainEntrance_NoOfAdult,MainEntrance_NoOfChild,MainEntrance_AdultAmt,
                                            MainEntrance_ChildAmt,MainEntrance_TotAmt,MiniTrain_TimeSlot,Boating_TwoSeaterTimeSlot, Boating_FourSeaterTimeSlot, Safari_TimeSlot,MiniTrain_NoOfAdult, MiniTrain_NoOfChild,MiniTrain_AdultAmt,MiniTrain_ChildAmt,
                                            MiniTrain_TotAmt,Boating_NoOf_TwoSeater,Boating_NoOf_FourSeater,Boating_TwoSeater_Amt,Boating_FourSeater_Amt,Boating_TotAmt, Safari_NoOfAdult, 
                                            Safari_NoOfChild,Safari_AdultAmt,Safari_ChildAmt,Safari_TotAmt,VehicleType,VehicleNo, Vahicle_Amt,VehicleNoOf,Vehicle2Type,Vehicle2No, Vahicle2Amt,Vehicle2NoOf,Vehicle4Type,Vehicle4No, Vahicle4Amt,Vehicle4NoOf,Grand_Tot,CreatedBy,CreatedOn,ExcursionDate,TicketNo,PaymentType,PortalFee,Total,PayFlag,StillCameraNo,StillCameraAmt,VedioCameraNo,VedioCameraAmt,PhotoAmt,Mobile) 
                                            values (@Applicant_FullName, @ApplicantID,@MainEntrance_NoOfAdult,@MainEntrance_NoOfChild,@MainEntrance_AdultAmt,@MainEntrance_ChildAmt, @MainEntrance_TotAmt, @MiniTrain_TimeSlot, @Boating_TwoSeaterTimeSlot, @Boating_FourSeaterTimeSlot, @Safari_TimeSlot,
                                            @MiniTrain_NoOfAdult,@MiniTrain_NoOfChild,@MiniTrain_AdultAmt,@MiniTrain_ChildAmt,@MiniTrain_TotAmt,@Boating_NoOf_TwoSeater,@Boating_NoOf_FourSeater,
                                            @Boating_TwoSeater_Amt,@Boating_FourSeater_Amt,@Boating_TotAmt,@Safari_NoOfAdult,@Safari_NoOfChild,@Safari_AdultAmt,@Safari_ChildAmt,@Safari_TotAmt,
                                            @VehicleType,@VehicleNo,@Vahicle_Amt,@VehicleNoOf,@Vehicle2Type,@Vehicle2No, @Vahicle2Amt,@Vehicle2NoOf,@Vehicle4Type,@Vehicle4No, @Vahicle4Amt,@Vehicle4NoOf,@Grand_Tot,@CreatedBy,GetDate(),@ExcursionDate, @TicketNo,@PaymentType,@PortalFee,@Total,@PayFlag,@StillCameraNo,@StillCameraAmt,@VedioCameraNo,@VedioCameraAmt,@PhotoAmt,@Mobile)");
                
                DatabaseObject.AddInParameter(selectCommand, "@Applicant_FullName", DbType.String, objTicketDetails_DT.Applicant_FullName);
                DatabaseObject.AddInParameter(selectCommand, "@ApplicantID", DbType.String, t_AppID);
                DatabaseObject.AddInParameter(selectCommand, "@MainEntrance_NoOfAdult", DbType.Int32, objTicketDetails_DT.MainEntrance_NoOfAdult);
                DatabaseObject.AddInParameter(selectCommand, "@MainEntrance_NoOfChild", DbType.Int32, objTicketDetails_DT.MainEntrance_NoOfChild);
                DatabaseObject.AddInParameter(selectCommand, "@MainEntrance_AdultAmt", DbType.Decimal, objTicketDetails_DT.MainEntrance_AdultAmt);
                DatabaseObject.AddInParameter(selectCommand, "@MainEntrance_ChildAmt", DbType.Decimal, objTicketDetails_DT.MainEntrance_ChildAmt);
                DatabaseObject.AddInParameter(selectCommand, "@MainEntrance_TotAmt", DbType.Decimal, objTicketDetails_DT.MainEntrance_TotAmt);

                DatabaseObject.AddInParameter(selectCommand, "@MiniTrain_NoOfAdult", DbType.Int32, objTicketDetails_DT.MiniTrain_NoOfAdult);
                DatabaseObject.AddInParameter(selectCommand, "@MiniTrain_NoOfChild", DbType.Int32, objTicketDetails_DT.MiniTrain_NoOfChild);
                DatabaseObject.AddInParameter(selectCommand, "@MiniTrain_AdultAmt", DbType.Decimal, objTicketDetails_DT.MiniTrain_AdultAmt);
                DatabaseObject.AddInParameter(selectCommand, "@MiniTrain_ChildAmt", DbType.Decimal, objTicketDetails_DT.MiniTrain_ChildAmt);
                DatabaseObject.AddInParameter(selectCommand, "@MiniTrain_TotAmt", DbType.Decimal, objTicketDetails_DT.MiniTrain_TotAmt);

                DatabaseObject.AddInParameter(selectCommand, "@MiniTrain_TimeSlot", DbType.String, objTicketDetails_DT.MiniTrain_TimeSlot);
                DatabaseObject.AddInParameter(selectCommand, "@Boating_TwoSeaterTimeSlot", DbType.String, objTicketDetails_DT.Boating_TwoSeaterTimeSlot);
                DatabaseObject.AddInParameter(selectCommand, "@Boating_FourSeaterTimeSlot", DbType.String, objTicketDetails_DT.Boating_FourSeaterTimeSlot);
                DatabaseObject.AddInParameter(selectCommand, "@Safari_TimeSlot", DbType.String, objTicketDetails_DT.Safari_TimeSlot);

                DatabaseObject.AddInParameter(selectCommand, "@Boating_NoOf_TwoSeater", DbType.Int32, objTicketDetails_DT.Boating_NoOf_TwoSeater);
                DatabaseObject.AddInParameter(selectCommand, "@Boating_TwoSeater_Amt", DbType.Decimal, objTicketDetails_DT.Boating_TwoSeater_Amt);
                DatabaseObject.AddInParameter(selectCommand, "@Boating_NoOf_FourSeater", DbType.Int32, objTicketDetails_DT.Boating_NoOf_FourSeater);
                DatabaseObject.AddInParameter(selectCommand, "@Boating_FourSeater_Amt", DbType.Decimal, objTicketDetails_DT.Boating_FourSeater_Amt);
                DatabaseObject.AddInParameter(selectCommand, "@Boating_TotAmt", DbType.Decimal, objTicketDetails_DT.Boating_TotAmt);

                DatabaseObject.AddInParameter(selectCommand, "@Safari_NoOfAdult", DbType.Int32, objTicketDetails_DT.Safari_NoOfAdult);
                DatabaseObject.AddInParameter(selectCommand, "@Safari_NoOfChild", DbType.Int32, objTicketDetails_DT.Safari_NoOfChild);
                DatabaseObject.AddInParameter(selectCommand, "@Safari_AdultAmt", DbType.Decimal, objTicketDetails_DT.Safari_AdultAmt);
                DatabaseObject.AddInParameter(selectCommand, "@Safari_ChildAmt", DbType.Decimal, objTicketDetails_DT.Safari_ChildAmt);
                DatabaseObject.AddInParameter(selectCommand, "@Safari_TotAmt", DbType.Decimal, objTicketDetails_DT.Safari_TotAmt);

                DatabaseObject.AddInParameter(selectCommand, "@VehicleType", DbType.String, objTicketDetails_DT.VehicleType);
                DatabaseObject.AddInParameter(selectCommand, "@VehicleNo", DbType.String, objTicketDetails_DT.VehicleNo);
                DatabaseObject.AddInParameter(selectCommand, "@Vahicle_Amt", DbType.Decimal, objTicketDetails_DT.Vahicle_Amt);
                DatabaseObject.AddInParameter(selectCommand, "@VehicleNoOf", DbType.String, objTicketDetails_DT.VehicleNoOf);

                DatabaseObject.AddInParameter(selectCommand, "@Vehicle2Type", DbType.String, objTicketDetails_DT.Vehicle2Type);
                DatabaseObject.AddInParameter(selectCommand, "@Vehicle2No", DbType.String, objTicketDetails_DT.Vehicle2No);
                DatabaseObject.AddInParameter(selectCommand, "@Vahicle2Amt", DbType.Decimal, objTicketDetails_DT.Vahicle2Amt);
                DatabaseObject.AddInParameter(selectCommand, "@Vehicle2NoOf", DbType.String, objTicketDetails_DT.Vehicle2NoOf);

                DatabaseObject.AddInParameter(selectCommand, "@Vehicle4Type", DbType.String, objTicketDetails_DT.Vehicle4Type);
                DatabaseObject.AddInParameter(selectCommand, "@Vehicle4No", DbType.String, objTicketDetails_DT.Vehicle4No);
                DatabaseObject.AddInParameter(selectCommand, "@Vahicle4Amt", DbType.Decimal, objTicketDetails_DT.Vahicle4Amt);
                DatabaseObject.AddInParameter(selectCommand, "@Vehicle4NoOf", DbType.String, objTicketDetails_DT.Vehicle4NoOf);

                DatabaseObject.AddInParameter(selectCommand, "@StillCameraAmt", DbType.Decimal, objTicketDetails_DT.StillCameraAmt);
                DatabaseObject.AddInParameter(selectCommand, "@StillCameraNo", DbType.Int32, objTicketDetails_DT.StillCameraNo);
                DatabaseObject.AddInParameter(selectCommand, "@VedioCameraNo", DbType.Int32, objTicketDetails_DT.VedioCameraNo);
                DatabaseObject.AddInParameter(selectCommand, "@VedioCameraAmt", DbType.Decimal, objTicketDetails_DT.VedioCameraAmt);
                DatabaseObject.AddInParameter(selectCommand, "@PhotoAmt", DbType.Decimal, objTicketDetails_DT.PhotoAmt);
	                        
                DatabaseObject.AddInParameter(selectCommand, "@Grand_Tot", DbType.Decimal, objTicketDetails_DT.Grand_Tot);

                DatabaseObject.AddInParameter(selectCommand, "@CreatedBy", DbType.String, t_UNQ);                
                DatabaseObject.AddInParameter(selectCommand, "@ExcursionDate", DbType.Date, objTicketDetails_DT.ExcursionDate);
                DatabaseObject.AddInParameter(selectCommand, "@TicketNo", DbType.String, TicketNo);
                
                DatabaseObject.AddInParameter(selectCommand, "@PaymentType", DbType.String, objTicketDetails_DT.PaymentType);
                DatabaseObject.AddInParameter(selectCommand, "@PortalFee", DbType.String, objTicketDetails_DT.PortalFee);
                DatabaseObject.AddInParameter(selectCommand, "@Total", DbType.String, objTicketDetails_DT.Total);
                DatabaseObject.AddInParameter(selectCommand, "@PayFlag", DbType.String, objTicketDetails_DT.PayFlag);
                DatabaseObject.AddInParameter(selectCommand, "@Mobile", DbType.String, objTicketDetails_DT.Mobile);
                count = (int)DatabaseObject.ExecuteNonQuery(selectCommand);

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

        internal void InsertTrackStatus(DataStructs.TrackStatus_DT objTrackStatus_DT, string[] AStatusFields, string t_AppID, string Amount)
        {
            int ResultRow;
            string t_UNQ = "";
            t_UNQ = HttpContext.Current.Session["sUNQ"].ToString();
            DbCommand selectCommand;
            selectCommand = DatabaseObject.GetSqlStringCommand(@"Insert into TrackStatus 
                                                    (ServiceName, LangId, CertStatus, AppName, ApplicantId, ServiceID, 
                                                    CreatedBy, PayFlag, VLEID, CreatedOn,Amount) Values
                                                    (@ServiceName, @LangId, @CertStatus, @AppName, @ApplicantId, @ServiceID, 
                                                    @CreatedBy, @PayFlag, @VLEID, GetDate(),@Amount)");
            DatabaseObject.AddInParameter(selectCommand, "@ServiceName", DbType.String, objTrackStatus_DT.ServiceName);
            DatabaseObject.AddInParameter(selectCommand, "@LangId", DbType.String, objTrackStatus_DT.LangId);
            DatabaseObject.AddInParameter(selectCommand, "@CertStatus", DbType.String, objTrackStatus_DT.CertStatus);
            DatabaseObject.AddInParameter(selectCommand, "@AppName", DbType.String, objTrackStatus_DT.AppName);
            DatabaseObject.AddInParameter(selectCommand, "@ApplicantId", DbType.String, t_AppID);
            DatabaseObject.AddInParameter(selectCommand, "@CreatedBy", DbType.String, objTrackStatus_DT.CreatedBy);
            DatabaseObject.AddInParameter(selectCommand, "@ServiceID", DbType.String, objTrackStatus_DT.ServiceID);
            DatabaseObject.AddInParameter(selectCommand, "@PayFlag", DbType.String, objTrackStatus_DT.PayFlag);
            DatabaseObject.AddInParameter(selectCommand, "@VLEID", DbType.String, objTrackStatus_DT.VLEID);
            DatabaseObject.AddInParameter(selectCommand, "@Amount", DbType.String, objTrackStatus_DT.Amount);        

            ResultRow = m_DataBase.ExecuteNonQuery(selectCommand);           
        }


        internal void UpdateTrackStatus(string AppID, string PaymentStatus)
        {
            int ResultRow;
            string Query = "";
            string t_UNQ = "";
            t_UNQ = HttpContext.Current.Session["sUNQ"].ToString();
            Query = "Update TrackStatus set ModifiedBy = '" + t_UNQ + "', PayFlag = '" + PaymentStatus + "', ModifiedOn = GetDate() Where ApplicantId = '" + AppID + "'";
            ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
        }
       
        internal void UpdateSeats(string ExcursionDate, string Train, string TwoBoat, string FourBoat, string Lion)
        {
            int ResultRow;
            string Query = "";

            string BookingDate;
            BookingDate = Convert.ToDateTime(ExcursionDate).ToString("yyyy-MM-dd");

            string t_Slotno ="";
            string[] t_Temp;
            string t_ResourceId ="";
            string t_SlotId ="";
            string t_TimeSlot ="";
            string t_Seats ="";
            string t_No ="";

            
            t_Slotno = Train;
            t_Temp = t_Slotno.Split('_');
            if (t_Slotno.Split('_').Count() == 5)
            {
                t_ResourceId = t_Temp[0];
                t_SlotId = t_Temp[1];
                t_TimeSlot = t_Temp[2];
                t_Seats = t_Temp[3];
                t_No = t_Temp[4];
                //Query = "Update ParkResource set " + t_SlotId + " = Case When " + t_SlotId + " = 0 Then 0 else " + t_SlotId + " - " + t_No + " End where Dated = '" + BookingDate + "' and ResourceId = 'SGNPTrain'";
                //Update ParkResource set Slots1 = Case When Slots1 >= 2 Then Slots1 - 2 else Slots1 END where Dated = '2013-01-17' and ResourceId = 'SGNP2Boat'
                Query = "Update ParkResource set " + t_SlotId + " = Case When " + t_SlotId + " >= " + t_No + " Then " + t_SlotId + " - " + t_No + " else " + t_SlotId + " End where Dated = '" + BookingDate + "' and ResourceId = 'SGNPTrain'";
                ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
            }

            t_Slotno = FourBoat;
            t_Temp = t_Slotno.Split('_');
            if (t_Slotno.Split('_').Count() == 5)
            {
                t_ResourceId = t_Temp[0];
                t_SlotId = t_Temp[1];
                t_TimeSlot = t_Temp[2];
                t_Seats = t_Temp[3];
                t_No = t_Temp[4];
                Query = "Update ParkResource set " + t_SlotId + " = Case When " + t_SlotId + " >= " + t_No + " Then " + t_SlotId + " - " + t_No + " else " + t_SlotId + " End where Dated = '" + BookingDate + "' and ResourceId = '" + t_ResourceId + "'";
                ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
            }

            t_Slotno = TwoBoat;
            t_Temp = t_Slotno.Split('_');
            if (t_Slotno.Split('_').Count() == 5)
            {
                t_ResourceId = t_Temp[0];
                t_SlotId = t_Temp[1];
                t_TimeSlot = t_Temp[2];
                t_Seats = t_Temp[3];
                t_No = t_Temp[4];
                Query = "Update ParkResource set " + t_SlotId + " = Case When " + t_SlotId + " >= " + t_No + " Then " + t_SlotId + " - " + t_No + " else " + t_SlotId + " End where Dated = '" + BookingDate + "' and ResourceId = '" + t_ResourceId + "'";
                ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
            }

            t_Slotno = Lion;
            t_Temp = t_Slotno.Split('_');
            if (t_Slotno.Split('_').Count() == 5)
            {
                t_ResourceId = t_Temp[0];
                t_SlotId = t_Temp[1];
                t_TimeSlot = t_Temp[2];
                t_Seats = t_Temp[3];
                t_No = t_Temp[4];

                Query = "Update ParkResource set " + t_SlotId + " = Case When " + t_SlotId + " >= " + t_No + " Then " + t_SlotId + " - " + t_No + " else " + t_SlotId + " End where Dated = '" + BookingDate + "' and ResourceId = '" + t_ResourceId + "'";
                ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
            }
        }

        internal void RollBackSeats(string ExcursionDate, string Train, string TwoBoat, string FourBoat, string Lion)
        {
            int ResultRow;
            string Query = "";

            string BookingDate;
            BookingDate = Convert.ToDateTime(ExcursionDate).ToString("yyyy-MM-dd");

            string t_Slotno = "";
            string[] t_Temp;
            string t_ResourceId = "";
            string t_SlotId = "";
            string t_TimeSlot = "";
            string t_Seats = "";
            string t_No = "";


            t_Slotno = Train;
            t_Temp = t_Slotno.Split('_');
            if (t_Slotno.Split('_').Count() == 2)
            {
                t_SlotId = t_Temp[0];
                t_Seats = t_Temp[1];
                if (t_SlotId != "0")
                {
                    Query = "Update ParkResource set " + t_SlotId + " = " + t_SlotId + " + " + t_Seats + " where Dated = '" + BookingDate + "' and ResourceId = 'SGNPTrain'";
                    ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
                }
            }

            t_Slotno = FourBoat;
            t_Temp = t_Slotno.Split('_');
            if (t_Slotno.Split('_').Count() == 2)
            {
                t_SlotId = t_Temp[0];
                t_Seats = t_Temp[1];
                if (t_SlotId != "0")
                {
                    Query = "Update ParkResource set " + t_SlotId + " = " + t_SlotId + " + " + t_Seats + " where Dated = '" + BookingDate + "' and ResourceId = '" + t_ResourceId + "'";
                    ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
                }
            }

            t_Slotno = TwoBoat;
            t_Temp = t_Slotno.Split('_');
            if (t_Slotno.Split('_').Count() == 2)
            {
                t_SlotId = t_Temp[0];
                t_Seats = t_Temp[1];
                if (t_SlotId != "0")
                {
                    Query = "Update ParkResource set " + t_SlotId + " = " + t_SlotId + " + " + t_Seats + " where Dated = '" + BookingDate + "' and ResourceId = '" + t_ResourceId + "'";
                    ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
                }
            }

            t_Slotno = Lion;
            t_Temp = t_Slotno.Split('_');
            if (t_Slotno.Split('_').Count() == 2)
            {
                t_SlotId = t_Temp[0];
                t_Seats = t_Temp[1];
                if (t_SlotId != "0")
                {
                    Query = "Update ParkResource set " + t_SlotId + " = " + t_SlotId + " + " + t_Seats + " where Dated = '" + BookingDate + "' and ResourceId = '" + t_ResourceId + "'";
                    ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
                }
            }
        }

        internal string GetSequenceNo(string ApplicationName, string Prefix)
        {
            string SequenceNo = "";
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            //m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select SequenceNo, Prefix From mstSequenceNo
                                        Where ApplicationName = @ApplicationName";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@ApplicationName", DbType.String, ApplicationName);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                if (oDataTable.Rows.Count == 0)
                {
                    string t_UNQ = "";
                    SequenceNo = "0000001";
                    t_UNQ = HttpContext.Current.Session["sUNQ"].ToString();
                    try
                    {
                        selectCommand = null;

                        selectCommand = DatabaseObject.GetSqlStringCommand(@"Insert into mstSequenceNo (SequenceNo, ApplicationName,Prefix,ModifiedBy) 
                                            values (@SequenceNo,@ApplicationName,@Prefix, @ModifiedBy)");

                        DatabaseObject.AddInParameter(selectCommand, "@SequenceNo", DbType.String, SequenceNo);
                        DatabaseObject.AddInParameter(selectCommand, "@ApplicationName", DbType.String, ApplicationName);
                        DatabaseObject.AddInParameter(selectCommand, "@Prefix", DbType.String, Prefix);
                        DatabaseObject.AddInParameter(selectCommand, "@ModifiedBy", DbType.String, t_UNQ);

                        int count = (int)DatabaseObject.ExecuteNonQuery(selectCommand);

                        int a = Convert.ToInt32(SequenceNo) + 1;
                        SequenceNo = Prefix + a.ToString().PadLeft(8, '0');

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
                else
                {
                    SequenceNo = oDataTable.Rows[0]["SequenceNo"].ToString();
                    int ResultRow;
                    string Query = "";
                    int a = Convert.ToInt32(SequenceNo) + 1;
                    string no = a.ToString().PadLeft(8, '0');
                    Query = "Update mstSequenceNo set SequenceNo = '" + no + "' where ApplicationName = '" + ApplicationName + "'";
                    ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);

                    SequenceNo = Prefix + a.ToString().PadLeft(8, '0');
                }                
                
                return SequenceNo;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal void PGTransaction(DataStructs.PGTransaction_DT objPGTransaction_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);

            cmdInsert = qb.GetInsertCommand(objPGTransaction_DT, "DC_TransactionDetails", AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }


        internal string CancelSeats(string ExcursionDate, string Train, string TwoBoat, string FourBoat, string Lion, string TicketNo)
        {
            int ResultRow;
            string Query = "";
            string t_CancelNo = "";
            string BookingDate;
            BookingDate = Convert.ToDateTime(ExcursionDate).ToString("yyyy-MM-dd");

            string t_Slotno = "";
            string[] t_Temp;
            string t_ResourceId = "";
            string t_SlotId = "";
            string t_TimeSlot = "";
            string t_Seats = "";
            string t_No = "";


            t_Slotno = Train;
            t_Temp = t_Slotno.Split('_');
            if (t_Slotno.Split('_').Count() == 5)
            {
                t_ResourceId = t_Temp[0];
                t_SlotId = t_Temp[1];
                t_TimeSlot = t_Temp[2];
                t_Seats = t_Temp[3];
                t_No = t_Temp[4];
                Query = "Update ParkResource set " + t_SlotId + " = " + t_Seats + " - " + t_No + " where Dated = '" + BookingDate + "' and ResourceId = 'SGNPTrain'";
                ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
            }

            t_Slotno = FourBoat;
            t_Temp = t_Slotno.Split('_');
            if (t_Slotno.Split('_').Count() == 5)
            {
                t_ResourceId = t_Temp[0];
                t_SlotId = t_Temp[1];
                t_TimeSlot = t_Temp[2];
                t_Seats = t_Temp[3];
                t_No = t_Temp[4];
                Query = "Update ParkResource set " + t_SlotId + " = " + t_Seats + " - " + t_No + " where Dated = '" + BookingDate + "' and ResourceId = '" + t_ResourceId + "'";
                ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
            }

            t_Slotno = TwoBoat;
            t_Temp = t_Slotno.Split('_');
            if (t_Slotno.Split('_').Count() == 5)
            {
                t_ResourceId = t_Temp[0];
                t_SlotId = t_Temp[1];
                t_TimeSlot = t_Temp[2];
                t_Seats = t_Temp[3];
                t_No = t_Temp[4];
                Query = "Update ParkResource set " + t_SlotId + " = " + t_Seats + " - " + t_No + " where Dated = '" + BookingDate + "' and ResourceId = '" + t_ResourceId + "'";
                ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
            }

            t_Slotno = Lion;
            t_Temp = t_Slotno.Split('_');
            if (t_Slotno.Split('_').Count() == 5)
            {
                t_ResourceId = t_Temp[0];
                t_SlotId = t_Temp[1];
                t_TimeSlot = t_Temp[2];
                t_Seats = t_Temp[3];
                t_No = t_Temp[4];

                Query = "Update ParkResource set " + t_SlotId + " = " + t_Seats + " - " + t_No + " where Dated = '" + BookingDate + "' and ResourceId = '" + t_ResourceId + "'";
                ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
            }

            return t_CancelNo;
        }

        internal DataTable VarifyAvalibality(string Dated, string Train, string Boat2, string Boat4, string Safari)
        {
            string m_Role = string.Empty;
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select ResourceId, " + Train + " from ParkResource Where ResourceId = 'SGNPTrain' And Dated = @Dated " +
                                        "Union All " +
                                        "Select ResourceId, " + Safari + " from ParkResource Where ResourceId = 'SGNPLion' And Dated = @Dated " +
                                        "Union All " +
                                        "Select ResourceId, " + Boat4 + " from ParkResource Where ResourceId = 'SGNP4Boat' And Dated = @Dated " +
                                        "Union All " +
                                        "Select ResourceId, " + Boat2 + " from ParkResource Where ResourceId = 'SGNP2Boat' And Dated = @Dated";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                m_DataBase.AddInParameter(selectCommand, "@Dated", DbType.String, Dated);
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

        internal DataTable GetPayBreakUp(string PayBreakUpId, string UserType)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select * from mstPayBreakup Where PayBreakupID = '" + PayBreakUpId + "' And UserType = '" + UserType + "'";
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

        internal void UpdateFlag(string AppId, string ServiceId, string Status, string PayeeName)
        {
            int ResultRow;
            string Query = "";
            Query = "Update TicketDetails set PayFlag = '" + Status + "', ModifiedOn = GetDate(), ModifiedBy = '" + PayeeName + "' Where ApplicantID = '" + AppId + "' ";
            ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);

            Query = "Update TrackStatus set PayFlag = '" + Status + "', ModifiedOn = GetDate(), ModifiedBy = '" + PayeeName + "' Where ApplicantID = '" + AppId + "' And ServiceId = " + ServiceId + " ";
            ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
        }

        internal DataTable GetSGNPDetailMIS(string PaymentType, string FromDate, string ToDate, string TicketNo)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;

            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select A.PaymentType As 'Payment Type', 
                                        A.TicketNo As 'Ticket No', A.ExcursionDate As 'Excursion Date',
                                        A.MainEntrance_NoOfAdult As 'Entrance Adult', A.MainEntrance_AdultAmt As 'Adult Amount',
                                        A.MainEntrance_NoOfChild As 'Entrance Child', A.MainEntrance_ChildAmt As 'Child Amount',
                                        (A.MainEntrance_NoOfAdult + A.MainEntrance_NoOfChild) As 'Entrance Count',
                                        (A.MainEntrance_ChildAmt + A.MainEntrance_AdultAmt) As 'Entrance Amount',

                                        D.SlotTime As 'Mini Train Time', 
                                        A.MiniTrain_NoOfAdult As 'Mini Train Adult', A.MiniTrain_AdultAmt As 'Mini Train Adult Amount',
                                        A.MiniTrain_NoOfChild As 'Mini Train Child', A.MiniTrain_ChildAmt As 'Mini Train Child Amount',
                                        (A.MiniTrain_NoOfAdult + A.MiniTrain_NoOfChild) As 'Mini Train Count',
                                        (A.MiniTrain_AdultAmt + A.MiniTrain_ChildAmt) As 'Mini Trani Amount',

                                        B.SlotTime As 'Two Seater Time',
                                        A.Boating_NoOf_TwoSeater As 'Two Seater Boat', A.Boating_TwoSeater_Amt As 'Two Seater Boat Amount',

                                        C.SlotTime As 'Four Seater Boat Time',
                                        A.Boating_NoOf_FourSeater As 'Four Seater Boat', A.Boating_FourSeater_Amt As 'Four Seater Boat Amount',

                                        (A.Boating_NoOf_TwoSeater + A.Boating_NoOf_FourSeater) As 'Boat Count',
                                        (A.Boating_TwoSeater_Amt + A.Boating_FourSeater_Amt) As 'Boat Amount',

                                        E.SlotTime as 'Safari Time', 
                                        A.Safari_NoOfAdult As 'Safari Adult Count', A.Safari_AdultAmt As 'Safari Adult Amount',
                                        A.Safari_NoOfChild As 'Safari Child Count', A.Safari_ChildAmt As 'Safari Child Amount',
                                        (A.Safari_NoOfAdult + A.Safari_NoOfChild) As 'Safari Count', 
                                        (A.Safari_AdultAmt + A.Safari_ChildAmt) As 'Safari Amount',

                                        A.Vehicle2NoOf As 'Two Wheeler', A.Vahicle2Amt As 'Two Wheeler Amount',
                                        A.Vehicle4NoOf As 'Medium Vehicle', A.Vahicle4Amt As 'Medium Vehicle Amount',
                                        A.VehicleNoOf As 'Heavy Vehicle', A.Vahicle_Amt As 'Heavy Vehicle Amount',

                                        A.CreatedOn As 'Created On', A.CreatedBy As 'Created By' 
                                        from TicketDetails As A 
                                        Left Join mstTimeSlot As B on A.Boating_TwoSeaterTimeSlot = B.SlotId and B.ResourceId ='SGNP2Boat' 
                                        Left Join mstTimeSlot As C on A.Boating_FourSeaterTimeSlot = C.SlotId and C.ResourceId ='SGNP4Boat'
                                        Left Join mstTimeSlot As D on A.MiniTrain_TimeSlot = D.SlotId and D.ResourceId ='SGNPTrain' 
                                        Left Join mstTimeSlot As E on A.Safari_TimeSlot = E.SlotId and E.ResourceId ='SGNPLion' ";

                SQLCommand = SQLCommand + " Where A.PayFlag = 'Y' ";

                if (PaymentType != "" && PaymentType != null)
                {
                    SQLCommand = SQLCommand + " And A.PaymentType = @PaymentType ";
                }

                if (TicketNo != "" && TicketNo != null)
                {
                    SQLCommand = SQLCommand + " And A.TicketNo = @TicketNo ";
                }
                else
                {
                    if (FromDate != "" && ToDate != "")
                    {
                        SQLCommand = SQLCommand + " And Cast(A.CreatedOn As Date) Between @FromDate And @ToDate ";
                    }
                }
                SQLCommand = SQLCommand + " Order By A.CreatedOn ";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);

                m_DataBase.AddInParameter(selectCommand, "@PaymentType", DbType.AnsiString, PaymentType);
                m_DataBase.AddInParameter(selectCommand, "@TicketNo", DbType.AnsiString, TicketNo);

                if (FromDate != "" && ToDate != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.Date, FromDate);
                    m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.Date, ToDate);
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

        internal DataTable GetSGNPSummarisedMIS(string PaymentType, string FromDate, string ToDate)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;

            m_DataBase = DatabaseFactory.CreateDatabase(m_MahaSevaConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = @"Select 
                                        A.CreatedOn As 'Created On', A.PaymentType As 'Payment Type', A.PayFlag As 'Pay Flag' ,
                                        Sum(A.MainEntrance_NoOfAdult) + Sum(A.MainEntrance_NoOfChild) As 'Entrance Count',
                                        Sum(A.MainEntrance_ChildAmt) + Sum(A.MainEntrance_AdultAmt) As 'Entrance Amount',
                                        Sum(A.MiniTrain_NoOfAdult) + Sum(A.MiniTrain_NoOfChild) As 'Mini Train Count',
                                        Sum(A.MiniTrain_AdultAmt) + Sum(A.MiniTrain_ChildAmt) As 'Mini Trani Amount',
                                        Sum(A.Boating_NoOf_TwoSeater) As 'Two Seater Boat', Sum(A.Boating_TwoSeater_Amt) As 'Two Seater Boat Amount',
                                        Sum(A.Boating_NoOf_FourSeater) As 'Four Seater Boat', Sum(A.Boating_FourSeater_Amt) As 'Four Seater Boat Amount',
                                        Sum(A.Safari_NoOfAdult) + Sum(A.Safari_NoOfChild) As 'Safari Count', 
                                        Sum(A.Safari_AdultAmt) + Sum(A.Safari_ChildAmt) As 'Safari Amount',
                                        Sum(A.Grand_Tot) As 'Sub Total', Sum(A.PortalFee) As 'Portal Fee + Service Tax', Sum(A.Total) As 'Total'
                                        from TicketDetails As A 
                                        ";

                SQLCommand = SQLCommand + " Where 1 = 1 and PayFlag = 'Y'";                

                if (PaymentType != "" && PaymentType != null)
                {
                    SQLCommand = SQLCommand + " And PaymentType = @PaymentType ";
                }

                if (FromDate != "" && ToDate != "")
                {
                    SQLCommand = SQLCommand + " And Cast(CreatedOn As Date) Between @FromDate And @ToDate ";
                }

                SQLCommand = SQLCommand + " Group By A.PaymentType , A.CreatedOn, A.PayFlag Order By A.CreatedOn";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);

                m_DataBase.AddInParameter(selectCommand, "@PaymentType", DbType.AnsiString, PaymentType);

                if (FromDate != "" && ToDate != "")
                {
                    m_DataBase.AddInParameter(selectCommand, "@FromDate", DbType.Date, FromDate);
                    m_DataBase.AddInParameter(selectCommand, "@ToDate", DbType.Date, ToDate);
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
