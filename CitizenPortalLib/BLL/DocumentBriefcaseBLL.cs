using CitizenPortalLib.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitizenPortalLib.BLL
{
    public class DocumentBriefcaseBLL : BLLBase
    {
        private DocumentBriefcaseDAL m_DocumentBriefcaseDAL;
        public DocumentBriefcaseBLL()
        {
            m_DocumentBriefcaseDAL = new DocumentBriefcaseDAL();
        }
      
        public DataTable GetSavedDocumentDetails(string ProfileID, string AppType, string ServiceID, string AppID)
        {
            DataTable t_AppDS = null;

            t_AppDS = m_DocumentBriefcaseDAL.GetSavedDocumentDetails(ProfileID, AppType, ServiceID, AppID);

            return t_AppDS;
        }
        public DataTable GetSavedDocumentDetailsNew(string ProfileID, string AppType, string ServiceID, string AppID)
        {
            DataTable t_AppDS = null;

            t_AppDS = m_DocumentBriefcaseDAL.GetSavedDocumentDetailsNew(ProfileID, AppType, ServiceID, AppID);

            return t_AppDS;
        }

        public DataTable DeleteDocument(string ProfileID, string AppType, string ServiceID, string AppID, string DocumentID)
        {
            DataTable t_AppDS = null;

            t_AppDS = m_DocumentBriefcaseDAL.DeleteDocument(ProfileID, AppType, ServiceID, AppID, DocumentID);

            return t_AppDS;
        }

        public string GetProfileID(string ServiceID, string AppID)
        {
            string t_AppDS = null;

            t_AppDS = m_DocumentBriefcaseDAL.GetProfileID(ServiceID, AppID);

            return t_AppDS;
        }

        public DataTable SaveDocument(string ProfileID, string AppType, string ServiceID, string AppID, string DocumentID, string DocumentName, string DocumentPath)
        {
            DataTable t_AppDS = null;

            t_AppDS = m_DocumentBriefcaseDAL.SaveDocument(ProfileID, AppType, ServiceID, AppID, DocumentID, DocumentName, DocumentPath);

            return t_AppDS;
        }

        public DataTable SubmitDocumentDetails(string ProfileID, string AppType, string ServiceID, string AppID)
        {
            DataTable t_AppDS = null;

            t_AppDS = m_DocumentBriefcaseDAL.SubmitDocumentDetails(ProfileID, AppType, ServiceID, AppID);

            return t_AppDS;
        }

        public DataTable SaveG2GDocument(string ProfileID, string AppType, string ServiceID, string AppID, string DocumentID, string DocumentName, string DocumentPath
            , string CurrentStage, string CreatedBy, string CreatedOn, string CreatedByRole
            , string FileName1, string FilePath1, string FileName2, string FilePath2, string FileName3, string FilePath3, string FileName4, string FilePath4, string FileName5, string FilePath5
            , string Remarks1, string Remarks2, string Remarks3, string Remarks4, string Remarks5
            , string Date1, string Date2, string Date3, string Date4, string Date5)
        {
            DataTable t_AppDS = null;

            t_AppDS = m_DocumentBriefcaseDAL.SaveG2GDocument(ProfileID, AppType, ServiceID, AppID, DocumentID, DocumentName, DocumentPath
                , CurrentStage, CreatedBy, CreatedOn, CreatedByRole
            , FileName1, FilePath1, FileName2, FilePath2, FileName3, FilePath3, FileName4, FilePath4, FileName5, FilePath5
            , Remarks1, Remarks2, Remarks3, Remarks4, Remarks5
            , Date1, Date2, Date3, Date4, Date5);

            return t_AppDS;
        }

        public DataTable GetG2GSavedDocumentDetails(string ProfileID, string AppType, string ServiceID, string AppID)
        {
            DataTable t_AppDS = null;

            t_AppDS = m_DocumentBriefcaseDAL.GetG2GSavedDocumentDetails(ProfileID, AppType, ServiceID, AppID);

            return t_AppDS;
        }

        public DataTable GetSavedDocumentDetailsG2G(string ProfileID, string AppType, string ServiceID, string AppID)
        {
            DataTable t_AppDS = null;

            t_AppDS = m_DocumentBriefcaseDAL.GetSavedDocumentDetailsG2G(ProfileID, AppType, ServiceID, AppID);

            return t_AppDS;
        }

        public DataTable VerifyDocumentDetails(string ServiceID, string AppID)
        {
            DataTable t_AppDS = null;

            t_AppDS = m_DocumentBriefcaseDAL.VerifyDocumentDetails(ServiceID, AppID);

            return t_AppDS;
        }

        public DataTable GetSavedDocumentDetailsByProfile(string ProfileID, string AppType)
        {
            DataTable t_AppDS = null;

            t_AppDS = m_DocumentBriefcaseDAL.GetSavedDocumentDetailsByProfile(ProfileID, AppType);

            return t_AppDS;
        }

        public DataTable GetSavedDocumentDetailsCustom(string ProfileID, string AppType, string ServiceID, string AppID)
        {
            DataTable t_AppDS = null;

            t_AppDS = m_DocumentBriefcaseDAL.GetSavedDocumentDetailsCustom(ProfileID, AppType, ServiceID, AppID);

            return t_AppDS;
        }

        public DataTable SaveSentBack(string ProfileID, string ServiceID, string AppID, string Remarks)
        {
            DataTable t_SaveSentBack = null;

            t_SaveSentBack = m_DocumentBriefcaseDAL.saveSentBack(ProfileID, ServiceID, AppID, Remarks);

            return t_SaveSentBack;
        }
        public DataTable GetSavedDocumentDetailsById(string Keyfield, string m_db = "")
        {
            DataTable t_AppDS = null;

            t_AppDS = m_DocumentBriefcaseDAL.GetSavedDocumentDetailsById(Keyfield, m_db);

            return t_AppDS;
        }

        public DataTable GetApplictionRemark(string ServiceID, string AppID)
        {
            DataTable t_AppDS = null;

            t_AppDS = m_DocumentBriefcaseDAL.GetApplictionRemark(ServiceID, AppID);

            return t_AppDS;
        }
    }
}
