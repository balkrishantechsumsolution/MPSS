using CitizenPortalLib.DAL;
using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitizenPortalLib.BLL
{
    public class RatingFeedBackBLL : BLLBase
    {
        private RatingFeedBackDAL m_RatingFeedBackDAL;
        public RatingFeedBackBLL()
        {
            m_RatingFeedBackDAL = new RatingFeedBackDAL();
        }
        public DataTable InsertRatingFeedBack(RatingFeedBack_DT objRatingFeedBack_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_RatingFeedBackDAL.InsertRatingFeedBack(objRatingFeedBack_DT, AFields);

            return t_AppDT;
        }
    }
}
