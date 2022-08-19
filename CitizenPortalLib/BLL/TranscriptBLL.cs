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
    public class TranscriptBLL: BLLBase
    {
        private TranscriptDAL m_TranscriptDAL;
        public TranscriptBLL()
        {
            m_TranscriptDAL = new TranscriptDAL();
        }

        public DataTable InsertTranscript(Transcript_DT objTranscript_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_TranscriptDAL.InsertTranscript(objTranscript_DT, AFields);
            return t_AppDT;
        }

        public DataSet GetTranscript(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_TranscriptDAL.GetTranscript(ServiceID, AppID);
            return t_AppDS;
        }

        public DataTable InsertTranscriptITI(TranscriptITI_DT objTranscript_DT, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_TranscriptDAL.InsertTranscriptITI(objTranscript_DT, AFields);
            return t_AppDT;
        }

        public DataSet GetTranscriptITI(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_TranscriptDAL.GetTranscriptITI(ServiceID, AppID);
            return t_AppDS;
        }
    }
}
