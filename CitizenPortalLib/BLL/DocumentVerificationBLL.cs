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
    public class DocumentVerificationBLL: BLLBase
    {
        private DocumentVerificationDAL m_DocumentVerificationDAL;
        public DocumentVerificationBLL()
        {
            m_DocumentVerificationDAL = new DocumentVerificationDAL();
        }

        public DataTable InsertDocumentVerification(DocumentVerification_DT objDocumentVerification_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_DocumentVerificationDAL.InsertDocumentVerification(objDocumentVerification_DT, AFields);
            return t_AppDT;
        }

        public DataSet GetDocumentVerification(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_DocumentVerificationDAL.GetDocumentVerification(ServiceID, AppID);
            return t_AppDS;
        }
        
    }
}
