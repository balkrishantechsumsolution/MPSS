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
    public class SuggestionDetailBLL : BLLBase
    {
        private SuggestionDetailDAL m_SuggestionDetailDAL;

        public SuggestionDetailBLL()
        {
            m_SuggestionDetailDAL = new SuggestionDetailDAL();
        }

        public DataTable SuggestionDetail(string UserId)
        {
            return m_SuggestionDetailDAL.UserDetail(UserId);
        }

        public void Insert(SuggestionDetail_DT objSuggestionDetail_DT, string[] AFields)
        {
            m_SuggestionDetailDAL.Insert(objSuggestionDetail_DT, AFields);
        }

    }
}
