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
    public class DivisionalCertificateBLL: BLLBase
    {
        private DivisionalCertificateDAL m_DivisionalCertificateDAL;
        public DivisionalCertificateBLL()
        {
            m_DivisionalCertificateDAL = new DivisionalCertificateDAL();
        }

        public DataTable InsertDivisionalCertificate(DivisionalCertificate_DT objDivisionalCertificate_DT1, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_DivisionalCertificateDAL.InsertDivisionalCertificate(objDivisionalCertificate_DT1, AFields);
            return t_AppDT;
        }

        public DataSet GetDivisionalCertificate(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_DivisionalCertificateDAL.GetDivisionalCertificate(ServiceID, AppID);
            return t_AppDS;
        }

        public DataSet GetDocumentVerification(string RegNo, string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_DivisionalCertificateDAL.GetDocumentVerification(RegNo, ServiceID, AppID);
            return t_AppDS;
        }

        public DataTable GetlegacyVerification(string m_AppID)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_DivisionalCertificateDAL.GetlegacyVerification(m_AppID);
            return t_AppDT;
        }

        public DataSet GetDocumentVerificationITI(string RegNo, string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_DivisionalCertificateDAL.GetDocumentVerificationITI(RegNo, ServiceID, AppID);
            return t_AppDS;
        }

        public DataSet GetLegacySemester(string regNo, string t_Semester, string t_Year)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_DivisionalCertificateDAL.GetLegacySemester(regNo, t_Semester, t_Year);
            return t_AppDS;
        }

        public DataTable CheckFileUploadedDTE(string m_AppID, string t_Semester, string m_ServiceID)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_DivisionalCertificateDAL.CheckFileUploadedDTE(m_AppID, t_Semester, m_ServiceID);
            return t_AppDT;
        }

        public DataTable InsertPNTCData(DivisionalCertificate_DT objDivisionalCertificate_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_DivisionalCertificateDAL.InsertPNTCData(objDivisionalCertificate_DT, AFields);
            return t_AppDT;
        }

        public DataSet GetPNTCMarkSheet(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_DivisionalCertificateDAL.GetPNTCMarkSheet(ServiceID, AppID);
            return t_AppDS;
        }
    }
}
