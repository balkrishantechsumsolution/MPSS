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
    public class MigrationSUBLL: BLLBase
    {
        private MigrationSUDAL m_MigrationSUDAL;
        public MigrationSUBLL()
        {
            m_MigrationSUDAL = new MigrationSUDAL();
        }

        public DataTable InsertMigrationSU(MigrationSU_DT objMigrationSU_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_MigrationSUDAL.InsertMigrationSU(objMigrationSU_DT, AFields);

            return t_AppDT;
        }        

        public DataSet GetMigrationSU(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_MigrationSUDAL.GetMigrationSU(ServiceID, AppID);
            return t_AppDS;
        }        

        public DataSet GetMigrationCertificateSU(string ServiceID, string AppID, string RegNo)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_MigrationSUDAL.GetMigrationCertificateSU(ServiceID, AppID, RegNo);
            return t_AppDS;
        }

        public DataTable GetlegacyData(string m_AppID, string m_RegNo, string m_RollNo)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationSUDAL.GetlegacyData(m_AppID, m_RegNo, m_RollNo);
            return t_AppDS;
        }


        public DataTable GetSUAppDetails(string m_AppID, string m_ServiceID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationSUDAL.GetSUAppDetails(m_AppID, m_ServiceID);
            return t_AppDS;
        }
        
        public DataTable GetCollegeMaster()
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationSUDAL.GetCollegeMaster();
            return t_AppDS;
        }             
        
        public DataTable GetBranchMaster()
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationSUDAL.GetBranchMaster();
            return t_AppDS;
        }
        
        public DataTable GetSubject(string SemesterCode, string BranchCode)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationSUDAL.GetSubject(SemesterCode, BranchCode);
            return t_AppDS;
        }
       
        public DataTable GetSemester(string svcID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationSUDAL.GetSemester(svcID);
            return t_AppDS;
        }

        public DataTable InsertSUManualData(SUManualData_DT objMigrationSU_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_MigrationSUDAL.InsertSUManualData(objMigrationSU_DT, AFields);

            return t_AppDT;
        }
                
        public DataTable GetManualDataSU(string m_AppID, string m_ServiceID, string m_RegNo, string RollNo)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationSUDAL.GetManualDataSU(m_AppID, m_ServiceID, m_RegNo, RollNo);
            return t_AppDS;
        }
        public DataSet GetStudentDetailBasedOnRollNo(string RollNo,string DOB,string RegNo)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_MigrationSUDAL.GetStudentDetailBasedOnRollNo(RollNo,DOB,RegNo);
            return t_AppDS;
        }
        public DataTable GetCBCAServices(string LoginID)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_MigrationSUDAL.GetCBCAServices(LoginID);
            return t_AppDS;
        }
        public DataSet GetMigrationSUApplication(string RollNo, string DOB, string RegNo)
        {
            DataSet t_AppDS = null;
            t_AppDS = m_MigrationSUDAL.GetMigrationSUApplication(RollNo, DOB, RegNo);
            return t_AppDS;
        }
    }
}
