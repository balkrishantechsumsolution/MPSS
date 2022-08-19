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
    public class ComplaintRegBAL
    {
        private ComplaintRegDAL ObjComplaintRegDAL;
        public ComplaintRegBAL()
        {
            ObjComplaintRegDAL = new ComplaintRegDAL();
        }

        public DataTable InsertData(ComplaintReg ObjComplaintReg, string[] aFields)
        {
            return ObjComplaintRegDAL.InstComplaintDtl(ObjComplaintReg, aFields);
        }

        public DataSet GetComplaintData(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = ObjComplaintRegDAL.GetComplaintDtl(ServiceID, AppID);
            return t_AppDS;
        }


        #region AddressCommon

        public DataTable GetCCTNSRelation()
        {
            return ObjComplaintRegDAL.GetCCTNSRelation();
        }
        public DataTable GetCCTNSIdentity()
        {
            return ObjComplaintRegDAL.GetCCTNSIdentity();
        }
        public DataTable GetCCTNSNationality()
        {
            return ObjComplaintRegDAL.GetCCTNSNationality();
        }
        public DataTable GetCCTNSState()
        {
            return ObjComplaintRegDAL.GetCCTNSState();
        }
        public DataTable GetCCTNSDistrict(int STATEID)
        {
            return ObjComplaintRegDAL.GetCCTNSDistrict(STATEID);
        }
        public DataTable GetCCTNSPolicStation(int STATEID, int DISTRICTID)
        {
            return ObjComplaintRegDAL.GetCCTNSPolicStation(STATEID, DISTRICTID);
        }
        public DataTable GetCCTNSOffice(int STATEID, int DISTRICTID)
        {
            return ObjComplaintRegDAL.GetCCTNSOffice(STATEID, DISTRICTID);
        }

        #endregion


        public DataTable CheckLocalAadhaar(string UID)
        {
            DataTable t_AppDS = null;
            t_AppDS = ObjComplaintRegDAL.LocalAdhaarData(UID);
            return t_AppDS;
        }

    }
}
