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
    public class VLEUIDBLL : BLLBase
    {
        private VLEUIDDAL m_VLEUIDDAL;     

        public VLEUIDBLL()
        {
            m_VLEUIDDAL = new VLEUIDDAL();           
            
        }

        int ResultRow;
        public int InsertVLEUID(VLEDetails_DT objVLEDetails_DT, string[] AFields, VLEInformationLog_DT objVLEInformationLog_DT, string[] VLEFields)
        {
            
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {                
                m_VLEUIDDAL.InsertVLEUID(objVLEDetails_DT, AFields);
                m_VLEUIDDAL.UpdateVLEInfoLog(objVLEInformationLog_DT, VLEFields);
                scope.Complete();

            }

            return ResultRow;
        
        }

        public DataTable GetVLEUID(string VLEID, string UID, string EID)
        {
            return m_VLEUIDDAL.GetVLEID(VLEID, UID, EID);
        }

        public DataTable AllVLEList(string VLEID, string DistrictCode)
        {
            return m_VLEUIDDAL.AllVLEList(VLEID, DistrictCode);
        }

        public DataTable UIDCount(string UID)
        {
            return m_VLEUIDDAL.UIDCount(UID);
        }

        public DataTable SkipVLEInfo(string SvcID)
        {
            return m_VLEUIDDAL.SkipVLEInfo(SvcID);
        }
    }
}
