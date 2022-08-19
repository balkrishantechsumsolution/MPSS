using CitizenPortalLib.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CitizenPortalLib.DataStructs;

namespace CitizenPortalLib.BLL
{
    public class G2GDashboardBLL : BLLBase
    {
        private G2GDashboardDAL m_G2GDashboardDAL;

        public G2GDashboardBLL()
        {
            m_G2GDashboardDAL = new G2GDashboardDAL();
        }

        public DataTable GetG2GDashboard(string ServiceID, string AppID, string G2GUser)
        {
            return m_G2GDashboardDAL.GetG2GDashboard(ServiceID, AppID, G2GUser);
        }

        public DataTable GetG2GDashboard(string G2GUser, int Department)
        {
            return m_G2GDashboardDAL.GetG2GDashboard(G2GUser, Department);
        }

        public DataSet GetMainMenu(string userID)
        {
            return m_G2GDashboardDAL.GetMainMenu(userID);
        }

        public DataTable GetDTEG2GDashboard(string G2GUser, int Department, string Service, string District, string Status, string DateFrom, string DateTo)
        {
            return m_G2GDashboardDAL.GetDTEG2GDashboard(G2GUser, Department, Service, District, Status, DateFrom, DateTo);
        }
        
        public DataSet GetBulkBatchDetails(string m_ServiceID, string m_AppID)
        {
            return m_G2GDashboardDAL.GetBulkBatchDetails(m_ServiceID, m_AppID);
        }

        public DataTable GetSUG2GDashboard(string G2GUser, int Department, string Service, string College, string Status, string DateFrom, string DateTo, string AppID, string RegNo)
        {
            return m_G2GDashboardDAL.GetSUG2GDashboard(G2GUser, Department, Service, College, Status, DateFrom, DateTo, AppID, RegNo);
        }
        
        public DataTable GetG2GDashboard_SSEPD(string G2GUser, int Department, string service, string DistrictCode, string FromDate, string ToDate, string Status, string AppID)
        {
            return m_G2GDashboardDAL.GetG2GDashboard_SSEPD(G2GUser, Department, service, DistrictCode, FromDate, ToDate, Status, AppID);
        }

        public DataTable GetTransactionOUAT(string G2GUser, int Department, string Service, string District, string Status, string DateFrom, string DateTo, string Flag, string Semester, string ExamYear)
        {
            return m_G2GDashboardDAL.GetTransactionOUAT(G2GUser, Department, Service, District, Status, DateFrom, DateTo, Flag, Semester, ExamYear);
        }

        public DataTable GetTransactionOUATDetail(string G2GUser, int Department, string Service, string District, string Status, string DateFrom, string DateTo, string Flag, string Semester, string ExamYear)
        {
            return m_G2GDashboardDAL.GetTransactionOUATDetail(G2GUser, Department, Service, District, Status, DateFrom, DateTo, Flag, Semester,ExamYear);
        }

        public DataTable GetG2GDashboard_DSSO(string G2GUser, int Department, string service, string DistrictCode, string FromDate, string ToDate, string Status, string AppID)
        {
            return m_G2GDashboardDAL.GetG2GDashboard_DSSO(G2GUser, Department, service, DistrictCode, FromDate, ToDate, Status, AppID);
        }
        public DataTable GetG2GReport_DSSO(string G2GUser, string service, string DistrictCode, string BlockCode, string FromDate, string ToDate, string Status)
        {
            return m_G2GDashboardDAL.GetG2GReport_DSSO(G2GUser, service, DistrictCode, BlockCode, FromDate, ToDate, Status);
        }

        public DataTable GetG2GPendingForAcceptance(string G2GUser, int Department)
        {
            return m_G2GDashboardDAL.GetG2GPendingForAcceptance(G2GUser, Department);
        }

        public DataTable InsertDTEManualData(DTEManualData_DT DTEManualData_DT, string[] aFields)
        {
            return m_G2GDashboardDAL.InsertDTEManualData(DTEManualData_DT, aFields);
        }

        public DataTable InsertITIManualData(ITIManualData_DT ITIManualData_DT, string[] aFields)
        {
            return m_G2GDashboardDAL.InsertITIManualData(ITIManualData_DT, aFields);
        }

        public DataTable GetOISFG2GData(string G2GUser, int Department)
        {
            return m_G2GDashboardDAL.GetOISFG2GData(G2GUser, Department);
        }

        public DataTable GetOUATAdmissionDetails(string G2GUser, int Department, string Category, string DistrictCode, string FromDate, string ToDate, string Status, string AppID, string RollNo)
        {
            return m_G2GDashboardDAL.GetOUATAdmissionDetails(G2GUser, Department, Category, DistrictCode, FromDate, ToDate, Status, AppID, RollNo);
        }
        public DataTable GetDTEG2GDashboardDetails(string G2GUser, int Department, string Service, string FromDate, string ToDate, string District, string Status, string Branch, string College, string RollNo, string ExamType, string t_Year, string  Semester, string Paper)
        {
            return m_G2GDashboardDAL.GetDTEG2GDashboardDetails(G2GUser, Department, Service, FromDate, ToDate, District, Status, Branch, College, RollNo, ExamType, t_Year, Semester, Paper);
        }
        public DataTable GetDTEG2GITIDashboardDetails(string G2GUser, int Department, string Service, string FromDate, string ToDate, string District, string Status)
        {
            return m_G2GDashboardDAL.GetDTEG2GITIDashboardDetails(G2GUser, Department, Service, FromDate, ToDate, District, Status);
        }


        public DataTable GetITIG2GDashboard(string G2GUser, int Department, string Service, string District, string Status, string FromDate, string ToDate)
        {
            return m_G2GDashboardDAL.GetITIG2GDashboard(G2GUser, Department, Service, District, Status, FromDate, ToDate);
        }

        public DataTable GetOISFG2GData(string G2GUser, int Department, string Category, string DistrictCode, string FromDate, string ToDate, string Status, string AppID)
        {
            return m_G2GDashboardDAL.GetOISFG2GData(G2GUser, Department, Category, DistrictCode, FromDate, ToDate, Status, AppID);
        }

        public DataTable ProcessApplications(string RowID, string CreatedBy, string Action)
        {
            return m_G2GDashboardDAL.ProcessApplications(RowID, CreatedBy, Action);
        }

        public DataTable GetOISFG2GData_District(string G2GUser, int Department, string Category, string DistrictCode, string FromDate, string ToDate)
        {
            return m_G2GDashboardDAL.GetOISFG2GData_District(G2GUser, Department, Category, DistrictCode, FromDate, ToDate);
        }
        
        public DataSet GetPendingServices(string G2GUser, int Department)
        {
            return m_G2GDashboardDAL.GetPendingServices(G2GUser, Department);
        }

        public DataSet GetG2GPendingForSelectedService(string G2GUser, int Department, string SelectedOption, string SelectedServiceID)
        {
            return m_G2GDashboardDAL.GetG2GPendingForSelectedService(G2GUser, Department, SelectedOption, SelectedServiceID);
        }

        public DataTable GetHabishaBrataList(string G2GUser, int Department)
        {
            return m_G2GDashboardDAL.GetHabishaBrataList(G2GUser, Department);
        }

        public DataTable ProcessHabishaBrataApplications(string RowID, string CreatedBy, string ActionType, string Remarks)
        {
            return m_G2GDashboardDAL.ProcessHabishaBrataApplications(RowID, CreatedBy, ActionType, Remarks);
        }

        public DataTable GetOUATG2GData(string G2GUser, int Department, string Category, string DistrictCode, string FromDate, string ToDate, string Status, string AppID, string RollNo)
        {
            return m_G2GDashboardDAL.GetOUATG2GData(G2GUser, Department, Category, DistrictCode, FromDate, ToDate, Status, AppID, RollNo);
        }

        public DataTable GetSeniorCitizenG2GData(string G2GUser, int Department, string Category, string DistrictCode, string FromDate, string ToDate, string Status, string AppID, string RollNo, string PoliceStation)
        {
            return m_G2GDashboardDAL.GetSeniorCitizenG2GData(G2GUser, Department, Category, DistrictCode, FromDate, ToDate, Status, AppID, RollNo, PoliceStation);
        }
        public DataTable GetSeniorCitizenG2GDispatch(string G2GUser, int Department, string Category, string DistrictCode, string FromDate, string ToDate, string Status, string AppID, string RollNo, string PoliceStation)
        {
            return m_G2GDashboardDAL.GetSeniorCitizenG2GDispatch(G2GUser, Department, Category, DistrictCode, FromDate, ToDate, Status, AppID, RollNo, PoliceStation);
        }
        public DataTable GetSUStudentHistory(string G2GUser, int Department, string FromDate, string ToDate, string RollNo, string RegNo, string CollegeCode, string Branch, string Program, string Session, string SubProgram, string Course )
        {
            return m_G2GDashboardDAL.GetSUStudentHistory(G2GUser, Department, FromDate, ToDate, RollNo, RegNo, CollegeCode, Branch, Program,  Session, SubProgram, Course);
        }

        public DataTable GetStudentData_BulkPayment(string College, string ExamType, string BranchName, string paymentStatus, string RollNo, string Semester)
        {
            return m_G2GDashboardDAL.GetStudentData_BulkPayment(College, ExamType, BranchName, paymentStatus, RollNo, Semester);
        }

        public DataTable GenerateBatch_BulkPay(string Data, string Remarks, string SvcID,string CreatedBy,string BranchName,string ExamType, string Semester, string ExamYear)
        {
            return m_G2GDashboardDAL.GenerateBatch_BulkPay(Data,Remarks,SvcID,CreatedBy,BranchName,ExamType, Semester, ExamYear);
        }

        public DataTable GetPGG2GData(string G2GUser, int Department, string Category, string DistrictCode, string FromDate, string ToDate, string Status, string AppID, string CourseType, string DepartmentId, string Program)
        {
            return m_G2GDashboardDAL.GetPGG2GData(G2GUser, Department, Category, DistrictCode, FromDate, ToDate, Status, AppID, CourseType, DepartmentId, Program);
        }

        public DataTable GetMissingPaperStudentData_BulkPayment(string College, string ExamType, string BranchName, string paymentStatus, string RollNo)
        {
            return m_G2GDashboardDAL.GetMissingPaperStudentData_BulkPayment(College, ExamType, BranchName, paymentStatus, RollNo);
        }

        public DataTable GeneratePendingPaperBatch_BulkPay(string Data, string Remarks, string SvcID, string CreatedBy, string BranchName, string ExamType)
        {
            return m_G2GDashboardDAL.GeneratePendingPaperBatch_BulkPay(Data, Remarks, SvcID, CreatedBy, BranchName, ExamType);
        }

        public DataSet GetStudentPaperDetails(string College, string ExamType, string Course, string Program, string t_Year, string Semester, string PaperCode, string RollNo)
        {
            return m_G2GDashboardDAL.GetStudentPaperDetails(College, ExamType, Course, Program, t_Year, Semester, PaperCode, RollNo);
        }
        public DataTable GetPaymentSummary(string G2GUser, int Department, string DateFrom, string DateTo, string Flag, string Semester, string ExamYear, string College)
        {
            return m_G2GDashboardDAL.GetPaymentSummary(G2GUser, Department, DateFrom, DateTo, Flag, Semester, ExamYear, College);
        }
        public DataTable GetConfigDetail()
        {
            return m_G2GDashboardDAL.GetConfigDetail();
        }
        public DataTable GetEditSubjectDetails(string College, string ExamType, string Branch, string t_Year, string Semester, string SubjectType, string RollNo)
        {
            return m_G2GDashboardDAL.GetEditSubjectDetails(College, ExamType, Branch, t_Year, Semester, SubjectType, RollNo);
        }
        public DataTable GetEditSubjectList(string SubType, string Semester, string branchCode)
        {
            DataTable t_AppDS = null;
            t_AppDS = m_G2GDashboardDAL.GetEditSubjectList(SubType, Semester, branchCode);
            return t_AppDS;
        }

        public DataTable GetStudentRegNoDetails(string College, string Branch, string t_Year, string RollNo, string RegNo)
        {
            return m_G2GDashboardDAL.GetStudentRegNoDetails(College, Branch, t_Year, RollNo, RegNo);
        }

        public DataTable UpdateUnivRegNo(string College, string Branch, string ExamType, string Session, string Semester, string Paper, string UID)
        {
            DataTable t_SubmittedDT = null;

            t_SubmittedDT = m_G2GDashboardDAL.UpdateUnivRegNo(College, Branch, ExamType, Session, Semester, Paper, UID);

            return t_SubmittedDT;
        }

        public DataTable UpdateUnivRegNo(UnivRegistration_DT t_UnivRegistration_DT, string[] aFields)
        {
            return m_G2GDashboardDAL.UpdateUnivRegNo(t_UnivRegistration_DT, aFields);
        }


        public DataTable UnivReportDetails(string G2GUser, int Department, string Service, string FromDate, string ToDate, string Branch, string College, string ExamType, string t_Year, string Semester, string SubProgram, string Course, string RollNo)
        {
            return m_G2GDashboardDAL.UnivReportDetails(G2GUser, Department, Service, FromDate, ToDate, Branch, College, ExamType, t_Year, Semester, SubProgram, Course, RollNo);
        }

        public DataSet InternalMarksSummary(string mCollege, string mBranch, string mSemester, string mPaper, string mYear, string mType)
        {
            return m_G2GDashboardDAL.InternalMarksSummary(mCollege, mBranch, mSemester, mPaper, mYear, mType);
        }

        public DataTable GetSemesterFeeDetails(string Semester, string Branch, string ExamType, string ExamYear, string ActionType)
        {
            DataTable t_DT = null;
            t_DT = m_G2GDashboardDAL.GetSemesterFeeDetails(Semester, Branch, ExamType, ExamYear, ActionType);
            return t_DT;
        }

        public DataTable GetMaterData(string Semester, string Branch, string ExamYear, string ActionType)
        {
            DataTable t_DT = null;
            t_DT = m_G2GDashboardDAL.GetMaterData(Semester, Branch, ExamYear, ActionType);
            return t_DT;
        }

        public DataTable GetStudentData_ImprovementExam(string College, string ExamType, string BranchName, string paymentStatus, string RollNo, string Semester)
        {
            return m_G2GDashboardDAL.GetStudentData_ImprovementExam(College, ExamType, BranchName, paymentStatus, RollNo, Semester);
        }

        public DataTable GenerateBatch_BulkPayImprovement(string Data, string Remarks, string SvcID, string CreatedBy, string BranchName, string ExamType, string Semester, string ExamYear, string PaperData)
        {
            return m_G2GDashboardDAL.GenerateBatch_BulkPayImprovement(Data, Remarks, SvcID, CreatedBy, BranchName, ExamType, Semester, ExamYear, PaperData);
        }

        public DataTable GetChartData(string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, string HonsCode, int ReportType)
        {
            return m_G2GDashboardDAL.GetChartData(LoginID, AdmissionYear, CollegeCode, BranchCode, HonsCode, ReportType);
        }

        public DataSet GetActivity(string userID, string Semester, string Activity, string ExamYear, string ActionType)
        {
            return m_G2GDashboardDAL.GetActivity(userID, Semester,Activity,ExamYear, ActionType);
        }
        public DataSet GetZoneConfiguration(string userID, string Semester, string ZoneID, string ExamYear, string ActionType, string BranchCode)
        {
            return m_G2GDashboardDAL.GetZoneConfiguration(userID, Semester, ZoneID, ExamYear, ActionType, BranchCode);
        }

        public DataSet GetApplicationCount(string userID)
        {
            return m_G2GDashboardDAL.GetApplicationCount(userID);
        }

        public DataTable GetDrillSemFee(string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, int ReportType)
        {
            return m_G2GDashboardDAL.GetDrillSemFee(LoginID, AdmissionYear, CollegeCode, BranchCode, ReportType);
        }

        public DataTable GetSemFeeCount(string LoginID, int ExamYear, string CollegeCode, string Semester, string BranchCode, string ExamType, int ReportType)
        {
            return m_G2GDashboardDAL.GetSemFeeCount(LoginID, ExamYear, CollegeCode, Semester, BranchCode, ExamType, ReportType);
        }

        public DataTable GetStudentChart(string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, string HonsCode, int ReportType)
        {
            return m_G2GDashboardDAL.GetStudentChart(LoginID, AdmissionYear, CollegeCode, BranchCode, HonsCode, ReportType);
        }

        public DataTable GetStudentInternal(string LoginID)
        {
            return m_G2GDashboardDAL.GetStudentInternal(LoginID);
        }

        public DataTable GetPhDAdmninData(string LoginID, string Department, string FromDate, string ToDate, string Status, string AppID, string RollNo, string Mobile, string ResearchCenter, string Discipline, string Specilization)
        {
            return m_G2GDashboardDAL.GetPhDAdmninData(LoginID, Department, FromDate, ToDate, Status, AppID, RollNo, Mobile, ResearchCenter, Discipline, Specilization);
        }

        public DataTable GetStudentExamData(string G2GUser, int Department, string FromDate, string ToDate, string RollNo, string RegNo, string CollegeCode, string Branch, string ProgramCode, string Session, string Semester, string SubProgram, string Course)
        {
            return m_G2GDashboardDAL.GetStudentExamData(G2GUser, Department, FromDate, ToDate, RollNo, RegNo, CollegeCode, Branch, ProgramCode, Session, Semester, SubProgram, Course);
        }

        public DataTable GetStudentSemData(string College, string ExamType, string Program, string BranchName, string paymentStatus, string RollNo, string Semester)
        {
            return m_G2GDashboardDAL.GetStudentSemData(College, ExamType, Program, BranchName, paymentStatus, RollNo, Semester);
        }
        public DataSet RecommendedFacultyList(string Year, string Semester, string Department, string Course, string Program, string Subject)
        {
            return m_G2GDashboardDAL.RecommendedFacultyList(Year, Semester, Department, Course, Program, Subject);
        }

        public DataSet GetStudentPracticalPaper(string College, string ExamType, string Course, string Program, string t_Year, string Semester, string PaperCode, string RollNo)
        {
            return m_G2GDashboardDAL.GetStudentPracticalPaper(College, ExamType, Course, Program, t_Year, Semester, PaperCode, RollNo);
        }

        public DataSet GetActivityCSVTU(string userID, string Semester, string Activity, string ExamYear, string ActionType, string CourseCode)
        {
            return m_G2GDashboardDAL.GetActivityCSVTU(userID, Semester, Activity, ExamYear, ActionType, CourseCode);
        }
    }
}
