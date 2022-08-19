using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.DAL;

namespace CitizenPortalLib.BLL
{
    public class CBCSAdmissionFormBLL : BLLBase
    {
        private CBCSAdmissionFormDAL m_CBCSAdmissionFormDAL;
        public CBCSAdmissionFormBLL()
        {
            m_CBCSAdmissionFormDAL = new CBCSAdmissionFormDAL();
        }
        public DataTable InsertCBCSAdmissionFormData(CBCSAdmissionForm_DT objCBCSAdmissionForm_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_CBCSAdmissionFormDAL.InsertCBCSAdmissionFormData(objCBCSAdmissionForm_DT, AFields);

            return t_AppDT;
        }
        public DataTable InsertCBCSAdmissionFormDataByStudent(CBCSAdmissionForm_DT objCBCSAdmissionForm_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_CBCSAdmissionFormDAL.InsertCBCSAdmissionFormDataByStudent(objCBCSAdmissionForm_DT, AFields);

            return t_AppDT;
        }
        public DataTable InsertAdmissionFormDataByDEO(CBCSAdmissionForm_DT objCBCSAdmissionForm_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_CBCSAdmissionFormDAL.InsertAdmissionFormDataByDEO(objCBCSAdmissionForm_DT, AFields);

            return t_AppDT;
        }
        
        public DataTable GetCBCSCourseLists()
        {
            DataTable t_CourseDT = null;

            t_CourseDT = m_CBCSAdmissionFormDAL.GetCBCSCourseLists();

            return t_CourseDT;
        }

        public DataSet GetCBCSCourseSubject(string CourseName, string SubjectType)
        {
            DataSet t_SubjectDS = null;

            t_SubjectDS = m_CBCSAdmissionFormDAL.GetCBCSCourseSubject(CourseName, SubjectType);

            return t_SubjectDS;
        }

        public DataTable GetCollegeProfile(string LoginID)
        {
            DataTable t_DT = null;
            t_DT = m_CBCSAdmissionFormDAL.GetCollegeProfile(LoginID);
            return t_DT;
        }

        public DataSet GetRelationList()
        {
            DataSet t_RelationDS = null;

            t_RelationDS = m_CBCSAdmissionFormDAL.GetRelationList();

            return t_RelationDS;
        }
        public DataSet GetApplicationDetails(string AppID)
        {
            DataSet t_SubjectDS = null;

            t_SubjectDS = m_CBCSAdmissionFormDAL.GetApplicationDetails(AppID);

            return t_SubjectDS;
        }
        public DataSet GetStudentAdmissionData(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_CBCSAdmissionFormDAL.GetStudentAdmissionData(ServiceID, AppID);

            return t_AppDS;
        }

        public DataTable GETSudentMasterForSearch(string AppID, string dob, string name, string mobile, string admissionno)
        {
            DataTable t_CourseDT = null;

            t_CourseDT = m_CBCSAdmissionFormDAL.GETSudentMasterForSearch(AppID, dob, name, mobile, admissionno);

            return t_CourseDT;
        }
        public DataTable Get_CollegeDetail(string UserID)
        {
            DataTable t_CollegeDT = null;

            t_CollegeDT = m_CBCSAdmissionFormDAL.Get_CollegeDetail(UserID);

            return t_CollegeDT;
        }

        public DataTable Get_CollegeList()
        {
            DataTable t_CollegeDT = null;

            t_CollegeDT = m_CBCSAdmissionFormDAL.Get_CollegeList();

            return t_CollegeDT;
        }

        public DataTable InsertCollegeData(SUCollege_DT t_SUCollege_DT, string[] aFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_CBCSAdmissionFormDAL.InsertCollegeData(t_SUCollege_DT, aFields);
            return t_AppDT;
        }

        public DataTable Get_RollNoList(string BranchCode, string SubjectCode, string CollegeCode, string AdmissionYear, string Condition)
        {
            DataTable t_CollegeDT = null;

            t_CollegeDT = m_CBCSAdmissionFormDAL.Get_RollNoList(BranchCode, SubjectCode, CollegeCode, AdmissionYear, Condition);

            return t_CollegeDT;
        }

        public DataTable UpdateCollegeProfile(SUCollege_DT t_SUCollege_DT, string[] aFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_CBCSAdmissionFormDAL.UpdateCollegeProfile(t_SUCollege_DT, aFields);
            return t_AppDT;
        }

        public DataTable Insert_RollNoList(string RollNoData, string LoginID)
        {
            DataTable t_CollegeDT = null;

            t_CollegeDT = m_CBCSAdmissionFormDAL.Insert_RollNoList(RollNoData, LoginID);

            return t_CollegeDT;
        }
        public DataTable Insert_RegNoList(string RegNoData, string LoginID)
        {
            DataTable t_CollegeDT = null;

            t_CollegeDT = m_CBCSAdmissionFormDAL.Insert_RegNoList(RegNoData, LoginID);

            return t_CollegeDT;
        }

        public DataSet GetStudentHistoryData(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_CBCSAdmissionFormDAL.GetStudentHistoryData(ServiceID, AppID);

            return t_AppDS;
        }

        public DataTable GetBulkData(string LoginID, string CollegeCode, string BranchCode, string ServiceCode, string FromDate, string ToDate, string Status, string AppID)
        {
            DataTable t_CollegeDT = null;

            t_CollegeDT = m_CBCSAdmissionFormDAL.GetBulkData(LoginID, CollegeCode, BranchCode, ServiceCode, Status, FromDate, ToDate, AppID);

            return t_CollegeDT;
        }

        public DataTable SubmitG2GAdmissionData(Admission_DT objAdmission_DT, string[] AFields)
        {
            return m_CBCSAdmissionFormDAL.SubmitG2GAdmissionData(objAdmission_DT, AFields);
        }
        public DataTable MobileValidation(string Mobile)
        {
            DataTable t_CollegeDT = null;

            t_CollegeDT = m_CBCSAdmissionFormDAL.MobileValidation(Mobile);

            return t_CollegeDT;
        }

        public DataTable GetFinanceData(string LoginID, string CollegeCode, string BranchCode, string ServiceCode, string FromDate, string ToDate, string Status, string AppID)
        {
            DataTable t_CollegeDT = null;

            t_CollegeDT = m_CBCSAdmissionFormDAL.GetFinanceData(LoginID, CollegeCode, BranchCode, ServiceCode, Status, FromDate, ToDate, AppID);

            return t_CollegeDT;
        }
        public DataSet GetEditApplicationDetails(string AppID)
        {
            DataSet t_SubjectDS = null;

            t_SubjectDS = m_CBCSAdmissionFormDAL.GetEditApplicationDetails(AppID);

            return t_SubjectDS;
        }
        public DataTable EditStudentDataDT(CBCSAdmissionForm_DT objCBCSAdmissionForm_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_CBCSAdmissionFormDAL.EditStudentDataDT(objCBCSAdmissionForm_DT, AFields);

            return t_AppDT;
        }

        public DataTable Get_SUDepartmentList(string CollegeCode)
        {
            DataTable t_DeptDT = null;

            t_DeptDT = m_CBCSAdmissionFormDAL.Get_SUDepartmentList(CollegeCode);

            return t_DeptDT;
        }
        public DataTable Get_SUSubjectList(string departmentCode)
        {
            DataTable t_DeptDT = null;

            t_DeptDT = m_CBCSAdmissionFormDAL.Get_SUSubjectList(departmentCode);

            return t_DeptDT;
        }
        public DataSet ValidateRegisteredMobile(string Mobile, string Type)
        {
            DataSet dt = null;
            dt = m_CBCSAdmissionFormDAL.ValidateRegisteredMobile(Mobile, Type);
            return dt;
        }
        public DataTable InsertPGAdmissionFormData(SUPGAdmission_DT objCBCSAdmissionForm_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_CBCSAdmissionFormDAL.InsertPGAdmissionFormData(objCBCSAdmissionForm_DT, AFields);

            return t_AppDT;
        }
        public DataTable GetPGAppDetails(string SvcID, string AppID)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_CBCSAdmissionFormDAL.GetPGAppDetails(SvcID, AppID);

            return t_AppDT;
        }

        public DataTable Get_SUProgramList(string DepartmentCode, string CourseType)
        {
            DataTable t_DeptDT = null;

            t_DeptDT = m_CBCSAdmissionFormDAL.Get_SUProgramList(DepartmentCode, CourseType);

            return t_DeptDT;
        }

        public DataTable Get_SUEligibilityCriteria(string ProgramId)
        {
            DataTable t_DeptDT = null;

            t_DeptDT = m_CBCSAdmissionFormDAL.Get_SUEligibilityCriteria(ProgramId);

            return t_DeptDT;
        }

        public DataTable SubmitAdmitData(Admission_DT objAdmission_DT, string[] aFields)
        {
            return m_CBCSAdmissionFormDAL.SubmitAdmitData(objAdmission_DT, aFields);
        }

        public DataTable GetPaperLists(string BranchCode, string Semester, string Year)
        {
            DataTable DT = null;
            DT = m_CBCSAdmissionFormDAL.GetPaperLists(BranchCode, Semester, Year);
            return DT;
        }

        public DataTable InternalMarkData(InternalMark_DT t_InternalMark_DT, string[] aFields)
        {
            return m_CBCSAdmissionFormDAL.InternalMarkData(t_InternalMark_DT, aFields);
        }

        public DataTable EditStudentData1617DT(CBCSAdmissionForm_DT objCBCSAdmissionForm_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_CBCSAdmissionFormDAL.EditStudentData1617DT(objCBCSAdmissionForm_DT, AFields);

            return t_AppDT;
        }

        public DataSet GetEditApplicationDetails1617(string AppID)
        {
            DataSet t_SubjectDS = null;

            t_SubjectDS = m_CBCSAdmissionFormDAL.GetEditApplicationDetails_1617(AppID);

            return t_SubjectDS;
        }

        public DataTable InternalMarkSubmitted(string College, string Branch, string ExamType, string Session, string Semester, string Paper, string UID)
        {
            DataTable t_SubmittedDT = null;

            t_SubmittedDT = m_CBCSAdmissionFormDAL.InternalMarkSubmitted(College, Branch, ExamType, Session, Semester, Paper, UID);

            return t_SubmittedDT;
        }

        public DataTable PracticalMarkSubmitted(string College, string Branch, string ExamType, string Session, string Semester, string Paper, string UID)
        {
            DataTable t_SubmittedDT = null;

            t_SubmittedDT = m_CBCSAdmissionFormDAL.PracticalMarkSubmitted(College, Branch, ExamType, Session, Semester, Paper, UID);

            return t_SubmittedDT;
        }

        public DataTable GetCollegeDetails()
        {
            DataTable t_CollegeDT = null;

            t_CollegeDT = m_CBCSAdmissionFormDAL.GetCollegeDetails();

            return t_CollegeDT;
        }

        public DataSet GetEditStudentInfo(string RollNo)
        {
            DataSet t_SubjectDS = null;

            t_SubjectDS = m_CBCSAdmissionFormDAL.GetEditStudentInfo(RollNo);

            return t_SubjectDS;
        }

        public DataTable UpdateStudentData(CBCSAdmissionForm_DT objCBCSAdmissionForm_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_CBCSAdmissionFormDAL.UpdateStudentData(objCBCSAdmissionForm_DT, AFields);

            return t_AppDT;
        }

        public DataTable GetSubjectType(string BranchCode)
        {
            DataTable t_DT = null;
            t_DT = m_CBCSAdmissionFormDAL.GetSubjectType(BranchCode);
            return t_DT;
        }

        public DataTable InsertSemesterFee(SemesterFee_DT t_SemesterFee_DT, string[] aFields)
        {
            return m_CBCSAdmissionFormDAL.InsertSemesterFee(t_SemesterFee_DT, aFields);
        }

        public DataTable SemesterFeeRefund(ExcelUpload_DT t_ExcelUpload_DT, string[] aFields, string DestinationSP)
        {
            return m_CBCSAdmissionFormDAL.SemesterFeeRefund(t_ExcelUpload_DT, aFields, DestinationSP);
        }

        public DataTable InsertCollegeMaster(SUCollege_DT t_SUCollege_DT, string[] aFields, string DestinationSP)
        {
            return m_CBCSAdmissionFormDAL.InsertCollegeMaster(t_SUCollege_DT, aFields, DestinationSP);
        }

        #region forTheoryMarks
        public DataTable GetZoneCollegeList(string Semester, string ExamYear, string m_LoginID)
        {
            DataTable t_CollegeDT = null;
            t_CollegeDT = m_CBCSAdmissionFormDAL.GetZoneCollegeList(Semester, ExamYear, m_LoginID);
            return t_CollegeDT;
        }
        
        public DataTable GetTheoryPaperLists(string branch, string semester, string examyear, string subjecttype, string LoginID)
        {
            DataTable DT = null;
            DT = m_CBCSAdmissionFormDAL.GetTheoryPaperLists(branch, semester, examyear, subjecttype, LoginID);
            return DT;
        }

        public DataSet GetStudentTheoryPaperDetails(string College, string ExamType, string Branch, string t_Year, string Semester, string PaperCode, string RollNo, string SubjectType, string Range, string Examiner, string ZoneID)
        {
            return m_CBCSAdmissionFormDAL.GetStudentTheoryPaperDetails(College, ExamType, Branch, t_Year, Semester, PaperCode, RollNo, SubjectType, Range, Examiner, ZoneID);
        }

        public DataTable GetZone(string LoginID)
        {
            DataTable DT = null;
            DT = m_CBCSAdmissionFormDAL.GetZone(LoginID);
            return DT;
        }

        public DataTable GetPaperSubjectType(string BranchCode, string Semester)
        {
            DataTable t_DT = null;
            t_DT = m_CBCSAdmissionFormDAL.GetPaperSubjectType(BranchCode, Semester);
            return t_DT;
        }

        public DataTable InsertTheoryMarkData(TheoryMark_DT t_TheoryMark_DT, string[] aFields)
        {
            return m_CBCSAdmissionFormDAL.InsertTheoryMarkData(t_TheoryMark_DT, aFields);
        }

        public DataTable TheoryMarkSubmitted(string College, string Branch, string ExamType, string Session, string Semester, string Paper, string UID, string CreatedBy, string ZoneID)
        {
            DataTable t_SubmittedDT = null;

            t_SubmittedDT = m_CBCSAdmissionFormDAL.TheoryMarkSubmitted(College, Branch, ExamType, Session, Semester, Paper, UID, CreatedBy, ZoneID);

            return t_SubmittedDT;
        }

        public DataSet TheoryMarksSummary(string mCollege, string mBranch, string mSemester, string mPaper, string mYear, string mType, string mCreatedBy, string mExaminerID)
        {
            return m_CBCSAdmissionFormDAL.TheoryMarksSummary(mCollege, mBranch, mSemester, mPaper, mYear, mType, mCreatedBy, mExaminerID);
        }
        #endregion

        public DataTable InsertNoticeDetail(NoticeData_DT objNoticeData_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_CBCSAdmissionFormDAL.InsertNoticeDetail(objNoticeData_DT, AFields);

            return t_AppDT;
        }

        public DataTable GetNoticeDetail(string SearchText, string FromDate, string ToDate, string NoticeType)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_CBCSAdmissionFormDAL.GetNoticeDetail(SearchText, FromDate, ToDate, NoticeType);

            return t_AppDT;
        }

        public DataTable InsertActivity(Activity_DT t_Activity_DT, string[] aFields)
        {
            return m_CBCSAdmissionFormDAL.InsertActivity(t_Activity_DT, aFields);
        }
        public DataTable InsertZoneConfiguration(Zone_DT t_Zone_DT, string[] aFields)
        {
            return m_CBCSAdmissionFormDAL.InsertZoneConfiguration(t_Zone_DT, aFields);
        }

        public DataTable GetSupervisorTheoryPaperDetail(string College, string ExamType, string Branch, string t_Year, string Semester, string PaperCode, string RollNo, string SubjectType, string ExaminerID)
        {
            return m_CBCSAdmissionFormDAL.GetSupervisorTheoryPaperDetail(College, ExamType, Branch, t_Year, Semester, PaperCode, RollNo, SubjectType, ExaminerID);
        }

        public DataTable InsertSupervisorMarkData(TheoryMark_DT t_TheoryMark_DT, string[] aFields)
        {
            return m_CBCSAdmissionFormDAL.InsertSupervisorMarkData(t_TheoryMark_DT, aFields);
        }

        public DataSet SupervisorMarksSummary(string mCollege, string mBranch, string mSemester, string mPaper, string mYear, string mType, string mCreatedBy)
        {
            return m_CBCSAdmissionFormDAL.SupervisorMarksSummary(mCollege, mBranch, mSemester, mPaper, mYear, mType, mCreatedBy);
        }

        public DataTable GetStudentTheoryReport(string College, string ExamType, string Branch, string t_Year, string Semester, string PaperCode, string RollNo, string SubjectType, string branch, string ZoneID)
        {
            return m_CBCSAdmissionFormDAL.GetStudentTheoryReport(College, ExamType, Branch, t_Year, Semester, PaperCode, RollNo, SubjectType, ZoneID);
        }

        public DataTable GetExaminer(string LoginID, string Branch, string t_Year, string Semester, string SubjectType, string SubjectCode, string PaperCode, string Examiner)
        {
            return m_CBCSAdmissionFormDAL.GetExaminer(LoginID, Branch, t_Year, Semester, SubjectType, SubjectCode, PaperCode, Examiner);
        }

        public DataTable InsertExaminer(Examiner_DT t_Examiner_DT, string[] aFields)
        {
            return m_CBCSAdmissionFormDAL.InsertExaminer(t_Examiner_DT, aFields);
        }

        public DataTable GetRollNoRange(string Branch, string t_Year, string Semester, string PaperCode, string College)
        {
            return m_CBCSAdmissionFormDAL.GetRollNoRange(Branch, t_Year, Semester, PaperCode, College);
        }

        public DataTable AssignExaminerData(TheoryMark_DT t_TheoryMark_DT, string[] aFields)
        {
            return m_CBCSAdmissionFormDAL.AssignExaminerData(t_TheoryMark_DT, aFields);
        }

        public DataSet PrintMarkFile(string mBranch, string mSemester, string mPaper, string mYear, string mZoneID, string mExaminerID)
        {
            return m_CBCSAdmissionFormDAL.PrintMarkFile(mBranch, mSemester, mPaper, mYear, mZoneID, mExaminerID);
        }

        public DataSet PrintMarkFileRange(string mBranch, string mSemester, string mPaper, string mYear, string mZoneID, string mExaminerID, string mMarFileSetID, string mRollRange)
        {
            return m_CBCSAdmissionFormDAL.PrintMarkFileRange(mBranch, mSemester, mPaper, mYear, mZoneID, mExaminerID, mMarFileSetID, mRollRange);
        }

        public DataTable InsertLateralMark(TheoryMark_DT t_TheoryMark_DT, string[] aFields)
        {
            return m_CBCSAdmissionFormDAL.InsertLateralMark(t_TheoryMark_DT, aFields);
        }

        public DataTable GetTeachersSubject()
        {
            DataTable t_DT = null;

            t_DT = m_CBCSAdmissionFormDAL.GetTeachersSubject();

            return t_DT;
        }

        public DataTable GetDesignation()
        {
            DataTable t_DT = null;

            t_DT = m_CBCSAdmissionFormDAL.GetDesignation();

            return t_DT;
        }

        public DataTable InsertCollegeTeachers(CollegeTeachers_DT t_CollegeTeachers_DT, string[] aFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_CBCSAdmissionFormDAL.InsertCollegeTeachers(t_CollegeTeachers_DT, aFields);
            return t_AppDT;
        }

        public DataTable GetCollegeTeacher(string LoginID)
        {
            DataTable t_DT = null;
            t_DT = m_CBCSAdmissionFormDAL.GetCollegeTeacher(LoginID);
            return t_DT;
        }

        public DataTable EditTeachersProfile(string ProfileID)
        {
            DataTable t_DT = null;
            t_DT = m_CBCSAdmissionFormDAL.EditTeachersProfile(ProfileID);
            return t_DT;
        }

        public DataTable GetBankName()
        {
            DataTable t_CollegeDT = null;
            t_CollegeDT = m_CBCSAdmissionFormDAL.GetBankName();
            return t_CollegeDT;
        }
        public DataTable InsertCollegeBankDetail(BankDetail_DT t_BankDetail_DT, string[] aFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_CBCSAdmissionFormDAL.InsertCollegeBankDetail(t_BankDetail_DT, aFields);
            return t_AppDT;
        }

        public DataSet GetEditStudentPics(string RollNo)
        {
            DataSet t_SubjectDS = null;

            t_SubjectDS = m_CBCSAdmissionFormDAL.GetEditStudentPics(RollNo);

            return t_SubjectDS;
        }

        public DataTable UpdateStudentPics(EditStudentPics_DT objCBCSAdmissionForm_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_CBCSAdmissionFormDAL.UpdateStudentPics(objCBCSAdmissionForm_DT, AFields);

            return t_AppDT;
        }
        public DataTable CollegeAffiliation(string UserID)
        {
            DataTable t_CollegeDT = null;

            t_CollegeDT = m_CBCSAdmissionFormDAL.CollegeAffiliation(UserID);

            return t_CollegeDT;
        }

        public DataTable InserCollegeAffiliation(CollegeAffiiation_DT t_CollegeAffiiation_DT, string[] aFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_CBCSAdmissionFormDAL.InserCollegeAffiliation(t_CollegeAffiiation_DT, aFields);
            return t_AppDT;
        }

        public DataSet GetStudentExamDetail(string RollNo, string Semester, string ExamYear)
        {
            DataSet t_AppDS = null;

            t_AppDS = m_CBCSAdmissionFormDAL.GetStudentExamDetail(RollNo, Semester, ExamYear);

            return t_AppDS;
        }

        public DataTable GetProgramList()
        {
            DataTable t_CourseDT = null;

            t_CourseDT = m_CBCSAdmissionFormDAL.GetProgramList();

            return t_CourseDT;
        }

        public DataTable GetSubProgramList(string Program)
        {
            DataTable t_CourseDT = null;

            t_CourseDT = m_CBCSAdmissionFormDAL.GetSubProgramList(Program);

            return t_CourseDT;
        }

        public DataTable GetCourseList(string Program, string SubProgram)
        {
            DataTable t_CourseDT = null;

            t_CourseDT = m_CBCSAdmissionFormDAL.GetCourseList(Program, SubProgram);

            return t_CourseDT;
        }

        public DataTable GETDTEStudentSearch(string coursename, string regNo, string dob, string name, string rollno, string father)
        {
            DataTable t_CourseDT = null;

            t_CourseDT = m_CBCSAdmissionFormDAL.GETDTEStudentSearch(coursename, regNo, dob, name, rollno, father);

            return t_CourseDT;
        }

        public DataTable GetTeachersSubject(string College, string SubProgram, string Course, string Semester, string Session)
        {
            DataTable t_DT = null;

            t_DT = m_CBCSAdmissionFormDAL.GetTeachersSubject(College, SubProgram, Course, Semester, Session);

            return t_DT;
        }

        public DataTable InsertFacultyDetail(FacultyDetail_DT t_FacultyDetail_DT, string[] aFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_CBCSAdmissionFormDAL.InsertFacultyDetail(t_FacultyDetail_DT, aFields);
            return t_AppDT;
        }

        public DataTable GetBulkApprovalData(string LoginID, string CollegeCode, string BranchCode, string ServiceCode, string FromDate, string ToDate, string Status, string AppID)
        {
            DataTable t_CollegeDT = null;

            t_CollegeDT = m_CBCSAdmissionFormDAL.GetBulkApprovalData(LoginID, CollegeCode, BranchCode, ServiceCode, Status, FromDate, ToDate, AppID);

            return t_CollegeDT;
        }

        public DataTable GetNominatedFaculty(string LoginID, string CollegeCode, string BranchCode, string ServiceCode, string FromDate, string ToDate, string Status, string AppID)
        {
            DataTable t_CollegeDT = null;

            t_CollegeDT = m_CBCSAdmissionFormDAL.GetNominatedFaculty(LoginID, CollegeCode, BranchCode, ServiceCode, Status, FromDate, ToDate, AppID);

            return t_CollegeDT;
        }

        public DataTable InsertNominatedFaculty(NominateFaculty_TB obj_DT, string[] AFields)
        {
            return m_CBCSAdmissionFormDAL.InsertNominatedFaculty(obj_DT, AFields);
        }

        public DataSet GetFacultyData(string FacultyID, string ProfileID, string keyField)
        {
            return m_CBCSAdmissionFormDAL.GetFacultyData(FacultyID, ProfileID, keyField);
        }

        public DataTable GetNominateFacultyData(string LoginID, string CollegeCode, string Department, string Program, string SubProgram, string Coures, string examSession
            , string Semester, string SubjectCode, string BranchCode, string ServiceCode, string FromDate, string ToDate, string Status, string AppID)
        {
            DataTable t_DT = null;

            t_DT = m_CBCSAdmissionFormDAL.GetNominateFacultyData(LoginID, CollegeCode, Department, Program, SubProgram, Coures, examSession
            , Semester, SubjectCode, BranchCode, ServiceCode, FromDate, ToDate, Status, AppID);

            return t_DT;
        }
        public DataTable GetDepartment()
        {
            DataTable t_DT = null;
            t_DT = m_CBCSAdmissionFormDAL.GetDepartment();
            return t_DT;
        }

        public DataTable GetQualification(string QulaificationType)
        {
            DataTable t_DT = null;
            t_DT = m_CBCSAdmissionFormDAL.GetQualification(QulaificationType);
            return t_DT;
        }

        public DataTable InsertActivityCSVTU(ActivityCSVTU_DT t_Activity_DT, string[] aFields)
        {
            return m_CBCSAdmissionFormDAL.InsertActivityCSVTU(t_Activity_DT, aFields);
        }

    }
}
