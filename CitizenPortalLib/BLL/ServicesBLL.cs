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
    public class ServicesBLL : BLLBase
    {
        /// <summary>
        /// ////////////////////
        /// </summary>
        private ServicesDAL m_ServicesDAL;
        public ServicesBLL()
        {
            m_ServicesDAL = new ServicesDAL();
        }

        public DataTable GetServices()
        {
            DataTable ServicesDT = null;

            ServicesDT = m_ServicesDAL.GetServices();

            return ServicesDT;
        }

        public DataTable GetDepartment( string SVCID)
        {
            DataTable DeptDT = null;

            DeptDT = m_ServicesDAL.GetDepartmentCode(SVCID);

            return DeptDT;
        }

        public DataSet GetInitialData(string Option, string param1, string param2, string param3, string param4, string param5, string param6, string param7, string param8, string param9, string param10, string param11, string param12, string param13, string param14, string param15)
        {
            DataSet dataSet = null;

            dataSet = m_ServicesDAL.GetInitialData(Option, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15);

            return dataSet;
        }

        public DataSet GetServiceOfficeData(string Option, string param1, string param2, string param3, string param4, string param5, string param6, string param7, string param8, string param9, string param10, string param11, string param12, string param13, string param14, string param15,  string param16, string param17, string param18, string param19, string param20, string param21, string param22, string param23)
        {
            DataSet dataSet = null;

            dataSet = m_ServicesDAL.GetServiceOfficeData(Option, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16, param17, param18, param19, param20, param21, param22, param23);

            return dataSet;
        }

        public DataTable GetServiceName(int ServiceID)
        {
            DataTable ServicesDT = null;

            ServicesDT = m_ServicesDAL.GetServiceName(ServiceID);

            return ServicesDT;
        }

        public DataTable GetDepartment()
        {
            DataTable DeptDT = null;

            DeptDT = m_ServicesDAL.GetDepartment();

            return DeptDT;
        }

        public DataTable GetOffice(string DistrictControl, string TalukaControl, string VillageControl, string ServiceControl, string DepartmentControl)
        {
            DataTable OfficerDT = null;

            OfficerDT = m_ServicesDAL.GetOffice(DistrictControl, TalukaControl, VillageControl, ServiceControl, DepartmentControl);

            return OfficerDT;
        }

        public DataTable GetOfficer(string OfficeCode, string ServiceCode, string DistrictCode, string BlockCode)
        {
            DataTable OfficeDT = null;

            OfficeDT = m_ServicesDAL.GetOfficer(OfficeCode, ServiceCode, DistrictCode, BlockCode);

            return OfficeDT;
        }

        public DataTable AppleteAuthority(string serviceCode)
        {
            DataTable OfficeDT = null;
            OfficeDT = m_ServicesDAL.GetServiceAuthority(serviceCode);
            return OfficeDT;
        }

        public DataTable GetDeptServices(string DepartmentCode)
        {
            DataTable ServicesDT = null;
            ServicesDT = m_ServicesDAL.GetDeptServices(DepartmentCode);
            return ServicesDT;
        }

        public DataTable GetDeptITIServices(string DepartmentCode)
        {
            DataTable ServicesDT = null;
            ServicesDT = m_ServicesDAL.GetDeptITIServices(DepartmentCode);
            return ServicesDT;
        }
        public DataTable binddetails(string uid)
        {
            DataTable OfficerDT = null;

            OfficerDT = m_ServicesDAL.binddetails(uid);

            return OfficerDT;
        }

       
        public DataTable BindBPLYear(int ServiceId, string State, string District, string Taluka, string Village)
        {
            DataTable OfficeDT = null;

            OfficeDT = m_ServicesDAL.GetBPLYEAR(ServiceId, State, District, Taluka, Village);

            return OfficeDT;
        }

        public DataTable GetEAppealServices()
        {
            DataTable ServicesDT = null;
            ServicesDT = m_ServicesDAL.GetEAppealServices();
            return ServicesDT;
        }

        public DataTable GetEAppealDepartment()
        {
            DataTable DeptDT = null;

            DeptDT = m_ServicesDAL.GetEAppealDepartment();

            return DeptDT;
        }

        public DataTable GetEAppealDeptServices(string DepartmentCode)
        {
            DataTable ServicesDT = null;
            ServicesDT = m_ServicesDAL.GetEAppealDeptServices(DepartmentCode);
            return ServicesDT;
        }

        public DataTable GetEAppealDepartmentCode(string SVCID)        {
            DataTable DeptDT = null;
            DeptDT = m_ServicesDAL.GetEAppealDepartmentCode(SVCID);
            return DeptDT;
        }

        public DataTable GetOfficeName(string ServiceCode, string DepartmentCode, string DistrictCode)
        {
            DataTable DeptDT = null;
            DeptDT = m_ServicesDAL.GetOfficeName(ServiceCode, DepartmentCode, DistrictCode);
            return DeptDT;
        }

        public DataTable EAppealAppleteAuthority(string serviceCode)
        {
            DataTable OfficeDT = null;
            OfficeDT = m_ServicesDAL.GetEAppealServiceAuthority(serviceCode);
            return OfficeDT;
        }

        public DataSet ServiceOfficerMapping(string SvcId, string DepartmentId
            , string OfficeName, string OfficeAddress, string EmailID, string MobileNo
            , string AppellateOfficeName, string AppellateOfficeAddress, string AppellateEmailID, string AppellateMobileNo
            , string RevisionalOfficeName, string RevisionalOfficeAddress, string RevisionalEmailID, string RevisionalMobileNo
            , string TimeLimit, string Flag, string DistrictCode, string CreatedBy
           // ,string searchByRevisionalDropdown
            )
        {
            DataSet DeptDT = null;
            DeptDT = m_ServicesDAL.ServiceOfficerMapping(SvcId, DepartmentId
                , OfficeName, OfficeAddress, EmailID, MobileNo
                , AppellateOfficeName, AppellateOfficeAddress, AppellateEmailID, AppellateMobileNo
                , RevisionalOfficeName, RevisionalOfficeAddress, RevisionalEmailID, RevisionalMobileNo
                , TimeLimit, Flag, DistrictCode, CreatedBy
                //,searchByRevisionalDropdown
                );
            return DeptDT;
        }

        public DataSet serachByAuthority(string value)
        {
            DataSet DeptDT = null;
            DeptDT = m_ServicesDAL.serachByAuthority(value);
            return DeptDT;
        }

        public DataSet districtBlockPanchayat(string id,string district, string block, string panchayat,string ddlDistId,string ddlBlockId,string districtName)
        {
            DataSet DeptDT = null;
            DeptDT = m_ServicesDAL.districtBlockPanchayat(id,district, block, panchayat, ddlDistId, ddlBlockId, districtName);
            return DeptDT;
        }
        public List<string> SearchByDistrictBlockPanchayat(string districtName)
        {
            List<string> empResult = new List<string>();
            ///DataSet DeptDT = null;
            empResult = m_ServicesDAL.SearchByDistrictBlockPanchayat(districtName);
            return empResult;
        }
    }
}
