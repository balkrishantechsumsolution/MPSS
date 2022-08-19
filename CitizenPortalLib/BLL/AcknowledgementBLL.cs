using CitizenPortalLib.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitizenPortalLib.BLL
{
    public class AcknowledgementBLL : BLLBase
    {
        private AcknowledgementDAL m_AcknowledgementDAL;

        public AcknowledgementBLL()
        {
            m_AcknowledgementDAL = new AcknowledgementDAL();
        }

        public DataTable GetAcknowledgementInfo(string ServiceID, string AppID)
        {
            return m_AcknowledgementDAL.GetAcknowledgementInfo(ServiceID, AppID);
        }
        
    }
}
