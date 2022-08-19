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
    public class MigrationBLL: BLLBase
    {
        private MigrationDAL m_MigrationDAL;
        public MigrationBLL()
        {
            m_MigrationDAL = new MigrationDAL();
        }

        public DataTable InsertMigration(Migration_DT objMigration_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_MigrationDAL.InsertMigration(objMigration_DT, AFields);

            return t_AppDT;
        }

        public DataTable InsertMigrationITI(MigrationITI_DT objMigration_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_MigrationDAL.InsertMigrationITI(objMigration_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetMigration(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_MigrationDAL.GetMigration(ServiceID, AppID);
            return t_AppDS;
        }

        public DataSet GetITIMigration(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_MigrationDAL.GetITIMigration(ServiceID, AppID);
            return t_AppDS;
        }

        public DataSet GetMigrationCertificate(string ServiceID, string AppID, string RegNo)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_MigrationDAL.GetMigrationCertificate(ServiceID, AppID, RegNo);
            return t_AppDS;
        }

        public DataTable GetDTEAppDetails(string m_AppID, string m_ServiceID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationDAL.GetDTEAppDetails(m_AppID, m_ServiceID);
            return t_AppDS;
        }

        public DataSet GetMigrationCertificateITI(string ServiceID, string AppID,string RegNo)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_MigrationDAL.GetMigrationCertificateITI(ServiceID, AppID, RegNo);
            return t_AppDS;
        }

        public DataTable GetInstituteMaster()
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationDAL.GetInstituteMaster();
            return t_AppDS;
        }

        public DataTable GetITIAppDetails(string m_AppID, string m_ServiceID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationDAL.GetITIAppDetails(m_AppID, m_ServiceID);
            return t_AppDS;
        }

        public DataTable GetInstituteMasterlegacy()
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationDAL.GetInstituteMasterlegacy();
            return t_AppDS;
        }

        public DataTable GetInstituteMasterITI()
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationDAL.GetInstituteMasterITI();
            return t_AppDS;
        }

        public DataTable GetBranchMaster()
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationDAL.GetBranchMaster();
            return t_AppDS;
        }
        public DataTable GetBranchMasterlegacy()
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationDAL.GetBranchMasterlegacy();
            return t_AppDS;
        }

        public DataTable GetITICourseMaster()
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationDAL.GetITICourseMaster();
            return t_AppDS;
        }

        public DataTable GetSubject(string SemesterCode, string BranchCode)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationDAL.GetSubject(SemesterCode, BranchCode);
            return t_AppDS;
        }

        public DataTable GetlegacyDataMigration(string m_AppID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationDAL.GetlegacyDataMigration(m_AppID);
            return t_AppDS;
        }

        public DataTable InsertMigrationNew(MigrationNew_DT objMigrationNew_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_MigrationDAL.InsertMigrationNew(objMigrationNew_DT, AFields);

            return t_AppDT;
        }

        public DataTable InsertNewMigration(NewMigration_DT objNewMigration_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_MigrationDAL.InsertNewMigration(objNewMigration_DT, AFields);

            return t_AppDT;
        }

        public DataTable InsertNewMigrationVerify(NewMigrationVerify_DT data, string[] aFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_MigrationDAL.InsertNewMigrationVerify(data, aFields);

            return t_AppDT;
        }

        public DataTable GetSemester(string svcID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationDAL.GetSemester(svcID);
            return t_AppDS;
        }

        public DataTable GetManualDataMigration(string m_AppID, string m_ServiceID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationDAL.GetManualDataMigration(m_AppID, m_ServiceID);
            return t_AppDS;
        }

        public DataSet GetCBAApplicationDetails(string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_MigrationDAL.GetCBAApplicationDetails(AppID);

            return t_AppDS;
        }

        public DataTable InsertCBAData(CBACSVTU_DT obj_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_MigrationDAL.InsertCBAData(obj_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetProvisionalDetail(string ServiceID, string AppID)
        {
            DataSet t_DS = null;

            t_DS = m_MigrationDAL.GetProvisionalDetail(ServiceID, AppID);

            return t_DS;
        }

        public DataSet GetMigrationDetail(string ServiceID, string AppID)
        {
            DataSet t_DS = null;

            t_DS = m_MigrationDAL.GetMigrationDetail(ServiceID, AppID);

            return t_DS;
        }

        public DataSet GetDegreeDetail(string ServiceID, string AppID)
        {
            DataSet t_DS = null;

            t_DS = m_MigrationDAL.GetDegreeDetail(ServiceID, AppID);

            return t_DS;
        }

        public DataSet ProvisionalCertificate(string ServiceID, string AppID, string RegNo)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_MigrationDAL.ProvisionalCertificate(ServiceID, AppID, RegNo);
            return t_AppDS;
        }

        public DataSet DegreeCertificate(string ServiceID, string AppID, string RegNo, string Flag)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_MigrationDAL.DegreeCertificate(ServiceID, AppID, RegNo, Flag);
            return t_AppDS;
        }

        public DataSet GetTranscriptDetail(string ServiceID, string AppID)
        {
            DataSet t_DS = null;

            t_DS = m_MigrationDAL.GetTranscriptDetail(ServiceID, AppID);

            return t_DS;
        }

        public DataSet DegreeAddress(string ServiceID, string AppID, string RegNo)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_MigrationDAL.DegreeAddress(ServiceID, AppID, RegNo);
            return t_AppDS;
        }
    }
}
