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
    public class TransactionSummaryBLL : BLLBase
    {
        private TransactionSummaryDAL m_TransactionSummaryDAL;

        public TransactionSummaryBLL()
        {
            m_TransactionSummaryDAL = new TransactionSummaryDAL();
        }

        public DataTable GetServices()
        {
            return m_TransactionSummaryDAL.GetServices();
        }

        public DataTable GetServicesAdmin()
        {
            return m_TransactionSummaryDAL.GetServicesAdmin();
        }
    }
}
