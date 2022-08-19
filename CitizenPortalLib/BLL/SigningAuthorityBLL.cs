using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CitizenPortalLib.DAL;
using CitizenPortalLib.DataStructs;
using System.Transactions;
using System.Data;

namespace CitizenPortalLib.BLL
{
    public class SigningAuthorityBLL : BLLBase
    {
        private SigningAuthorityDAL m_SigningAuthorityDAL;

        public SigningAuthorityBLL()
        {
            m_SigningAuthorityDAL = new SigningAuthorityDAL();
        }

        public void Insert(SigningAuthority_DT TopDetails, string[] AFields)
        {
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                m_SigningAuthorityDAL.Insert(TopDetails, AFields);
                scope.Complete();
            }
        }

        public DataTable GetService()
        {
            return m_SigningAuthorityDAL.GetService();
        }

        public DataTable GetShowSubDivision(string AuthorityId)
        {
            return m_SigningAuthorityDAL.GetShowSubDivision(AuthorityId);
        }

        public DataTable GetAuthority()
        {
            return m_SigningAuthorityDAL.GetAuthority();
        }

        public DataTable GetSubDivision(string TalukaCode)
        {
            return m_SigningAuthorityDAL.GetSubDivision(TalukaCode);
        }

        public DataTable GetDocument(string ServiceId)
        {
            return m_SigningAuthorityDAL.GetDocument(ServiceId);
        }

        public string DeleteSigningAuthority(string RowId)
        {
            return m_SigningAuthorityDAL.DeleteSigningAuthority(RowId);
        }

        public DataTable GetSigningAuthority(string DistrictCode, string TalukaCode, string ServiceId, string DocumentType, string LangId, string CertificateType, string SubDivision)
        {
            return m_SigningAuthorityDAL.GetSigningAuthority(DistrictCode, TalukaCode, ServiceId, DocumentType, LangId, CertificateType, SubDivision);
        }

        public DataTable DeleteButton(string DistrictCode, string TalukaCode, string ServiceId, string DocumentType, string LangId, string KioskId, string CertificateType, string SubDivision)
        {
            return m_SigningAuthorityDAL.DeleteButton(DistrictCode, TalukaCode, ServiceId, DocumentType, LangId, KioskId, CertificateType, SubDivision);
        }
    }
}
