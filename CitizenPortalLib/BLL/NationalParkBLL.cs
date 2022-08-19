using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CitizenPortalLib.DAL;
using System.Data;
using CitizenPortalLib.DataStructs;
using System.Transactions;

namespace CitizenPortalLib.BLL
{
    public class NationalParkBLL : BLLBase
    {
        private NationalParkDAL m_NationalParkDAL;
        static string m_MahaSevaConnectionString = "Sewa";

        public NationalParkBLL()
        {
            m_NationalParkDAL = new NationalParkDAL();
        }

        public DataTable SlotDetail(string ResourceID)
        {
            return m_NationalParkDAL.SlotDetail(ResourceID);
        }

        public DataTable AvailableSeats(string ResourceID, string Dated)
        {
            return m_NationalParkDAL.AvailableSeats(ResourceID, Dated);
        }

        public DataTable GetRate()
        {
            return m_NationalParkDAL.GetRate();
        }

        //public DataTable GetTrainSeats(string ResourceID)
        //{
        //    return m_NationalParkDAL.GetTrainSeats(ResourceID);
        //}

        public string InsertData(TicketDetails_DT objTicketDetails_DT, string[] AFields, string ServiceId, TrackStatus_DT objTrackStatus_DT, string[] AStatusFields, string Train, string TwoBoat, string FourBoat, string Lion, string ExcursionDate, string Amount)
        {
            string t_AppID = "";
            string t_Ticket = "";
            string t_ApplicationName = "SGNPTicket";
            string Prefix = "SGNP";
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                t_Ticket = m_NationalParkDAL.GetSequenceNo(t_ApplicationName, Prefix);
                t_AppID = m_NationalParkDAL.InsertTicketDatail(objTicketDetails_DT, AFields, ServiceId, t_Ticket);
                m_NationalParkDAL.InsertTrackStatus(objTrackStatus_DT, AStatusFields, t_AppID, Amount);
                m_NationalParkDAL.UpdateSeats(ExcursionDate, Train, TwoBoat, FourBoat, Lion);

            scope.Complete();

            }

            return t_AppID;
        }

        public void RollBackSeats(string Train, string TwoBoat, string FourBoat, string Lion, string ExcursionDate)
        {
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                m_NationalParkDAL.RollBackSeats(ExcursionDate, Train, TwoBoat, FourBoat, Lion);
                scope.Complete();
            }
        }

        public string GetSequenceNo(string ApplicationName, string Prefix)
        {
            string t_Ticket = "";
            t_Ticket = m_NationalParkDAL.GetSequenceNo(ApplicationName, Prefix);
            return t_Ticket;
        }

        public void PGTransaction(DataStructs.PGTransaction_DT objPGTransaction_DT, string[] AFields, string AppId, string PayStatus)
        {
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                m_NationalParkDAL.PGTransaction(objPGTransaction_DT, AFields);
                m_NationalParkDAL.UpdateTrackStatus(AppId, PayStatus);
                scope.Complete();
            }
            
        }

        public string CancelSeats(string ExcursionDate, string Train, string TwoBoat, string FourBoat, string Lion, string TicketNo)
        {
            string t_CancelNo;
            t_CancelNo = m_NationalParkDAL.CancelSeats(ExcursionDate, Train, TwoBoat, FourBoat, Lion, TicketNo);
            return t_CancelNo;
        }

        public DataTable VarifyAvalibality(string Dated, string Train, string Boat2, string Boat4, string Safari)
        {
            return m_NationalParkDAL.VarifyAvalibality(Dated, Train, Boat2, Boat4, Safari);
        }

        public DataTable GetPayBreakUp(string PayBreakUpId, string UserType)
        {
            //if (UserType.ToUpper() == "COUNTER")
            //{
            //    return m_NationalParkDAL.GetPayBreakUp("1015", UserType);
            //}
            //else if (UserType.ToUpper() == "KIOSK")
            //{
            //    return m_NationalParkDAL.GetPayBreakUp("1014", UserType);
            //}
            //else if (UserType.ToUpper() == "CITIZEN")
            //{
            //    return m_NationalParkDAL.GetPayBreakUp("1015", UserType);
            //}
            return m_NationalParkDAL.GetPayBreakUp(PayBreakUpId, UserType);           
        }

        public void UpdateFlag(string AppId, string ServiceId, string Status, string PayeeName)
        {
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                m_NationalParkDAL.UpdateFlag(AppId, ServiceId, Status, PayeeName);                
                scope.Complete();
            }
        }

        public DataTable GetSGNPDetailMIS(string PaymentType, string FromDate, string ToDate, string TicketNo)
        {
            return m_NationalParkDAL.GetSGNPDetailMIS(PaymentType, FromDate, ToDate, TicketNo);
        }

        public DataTable GetSGNPSummarisedMIS(string PaymentType, string FromDate, string ToDate)
        {
            return m_NationalParkDAL.GetSGNPSummarisedMIS(PaymentType, FromDate, ToDate);
        }
    }
}
