using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CitizenPortalLib.DataStructs;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace CitizenPortalLib.DAL
{
    internal class ServicesDAL:DALBase
    {
        Database m_DataBase;
        /// <summary>
        /// ///////////////////
        /// </summary>
        /// <returns></returns>
        internal DataTable GetServices()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetServiceSP");
                
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataSet GetInitialData(string Option, string param1, string param2, string param3, string param4, string param5, string param6, string param7, string param8, string param9, string param10, string param11, string param12, string param13, string param14, string param15)
        {
            DataSet oDataSet = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetOfficeMasterDetailsSP");
                m_DataBase.AddInParameter(selectCommand, "@Option", DbType.AnsiString, Option);
                m_DataBase.AddInParameter(selectCommand, "@param1", DbType.AnsiString, param1);
                m_DataBase.AddInParameter(selectCommand, "@param2", DbType.AnsiString, param2);
                m_DataBase.AddInParameter(selectCommand, "@param3", DbType.AnsiString, param3);
                m_DataBase.AddInParameter(selectCommand, "@param4", DbType.AnsiString, param4);
                m_DataBase.AddInParameter(selectCommand, "@param5", DbType.AnsiString, param5);
                m_DataBase.AddInParameter(selectCommand, "@param6", DbType.AnsiString, param6);
                m_DataBase.AddInParameter(selectCommand, "@param7", DbType.AnsiString, param7);
                m_DataBase.AddInParameter(selectCommand, "@param8", DbType.AnsiString, param8);
                m_DataBase.AddInParameter(selectCommand, "@param9", DbType.AnsiString, param9);
                m_DataBase.AddInParameter(selectCommand, "@param10", DbType.AnsiString, param10);
                m_DataBase.AddInParameter(selectCommand, "@param11", DbType.AnsiString, param11);
                m_DataBase.AddInParameter(selectCommand, "@param12", DbType.AnsiString, param12);
                m_DataBase.AddInParameter(selectCommand, "@param13", DbType.AnsiString, param13);
                m_DataBase.AddInParameter(selectCommand, "@param14", DbType.AnsiString, param14);
                m_DataBase.AddInParameter(selectCommand, "@param15", DbType.AnsiString, param15);


                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataSet.Load(Reader, LoadOption.OverwriteChanges, new string[] {"1", "2", "3", "4", "5" });
                return oDataSet;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataSet GetServiceOfficeData(string Option, string param1, string param2, string param3, string param4, string param5, string param6, string param7, string param8, string param9, string param10, string param11, string param12, string param13, string param14, string param15, string param16, string param17, string param18, string param19, string param20, string param21, string param22, string param23)
        {
            DataSet oDataSet = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetServiceOfficeMasterDetailsSP");
                m_DataBase.AddInParameter(selectCommand, "@Option", DbType.AnsiString, Option);
                m_DataBase.AddInParameter(selectCommand, "@param1", DbType.AnsiString, param1);
                m_DataBase.AddInParameter(selectCommand, "@param2", DbType.AnsiString, param2);
                m_DataBase.AddInParameter(selectCommand, "@param3", DbType.AnsiString, param3);
                m_DataBase.AddInParameter(selectCommand, "@param4", DbType.AnsiString, param4);
                m_DataBase.AddInParameter(selectCommand, "@param5", DbType.AnsiString, param5);
                m_DataBase.AddInParameter(selectCommand, "@param6", DbType.AnsiString, param6);
                m_DataBase.AddInParameter(selectCommand, "@param7", DbType.AnsiString, param7);
                m_DataBase.AddInParameter(selectCommand, "@param8", DbType.AnsiString, param8);
                m_DataBase.AddInParameter(selectCommand, "@param9", DbType.AnsiString, param9);
                m_DataBase.AddInParameter(selectCommand, "@param10", DbType.AnsiString, param10);
                m_DataBase.AddInParameter(selectCommand, "@param11", DbType.AnsiString, param11);
                m_DataBase.AddInParameter(selectCommand, "@param12", DbType.AnsiString, param12);
                m_DataBase.AddInParameter(selectCommand, "@param13", DbType.AnsiString, param13);
                m_DataBase.AddInParameter(selectCommand, "@param14", DbType.AnsiString, param14);
                m_DataBase.AddInParameter(selectCommand, "@param15", DbType.AnsiString, param15);


                m_DataBase.AddInParameter(selectCommand, "@param16", DbType.AnsiString, param15);
                m_DataBase.AddInParameter(selectCommand, "@param17", DbType.AnsiString, param15);
                m_DataBase.AddInParameter(selectCommand, "@param18", DbType.AnsiString, param15);
                m_DataBase.AddInParameter(selectCommand, "@param19", DbType.AnsiString, param15);
                m_DataBase.AddInParameter(selectCommand, "@param20", DbType.AnsiString, param15);
                m_DataBase.AddInParameter(selectCommand, "@param21", DbType.AnsiString, param15);
                m_DataBase.AddInParameter(selectCommand, "@param22", DbType.AnsiString, param15);
                m_DataBase.AddInParameter(selectCommand, "@param23", DbType.AnsiString, param15);


                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataSet.Load(Reader, LoadOption.OverwriteChanges, new string[] { "1", "2", "3", "4", "5" });
                return oDataSet;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetServiceName(int ServiceID)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetServiceNameOnlySP");
                m_DataBase.AddInParameter(selectCommand, "@SvcID", DbType.AnsiString, ServiceID);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetDepartmentCode(string DepartmentCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetDepartmentSP");                
                m_DataBase.AddInParameter(selectCommand, "@DepartmentCode", DbType.AnsiString, DepartmentCode);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        
        internal DataTable GetDeptServices(string DepartmentCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetDeptServiceSp");
                m_DataBase.AddInParameter(selectCommand, "@DepartmentCode", DbType.AnsiString, DepartmentCode);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        internal DataTable GetDeptITIServices(string DepartmentCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetDeptITIServiceSp");
                m_DataBase.AddInParameter(selectCommand, "@DepartmentCode", DbType.AnsiString, DepartmentCode);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetDepartment()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetDepartmentSP");
                m_DataBase.AddInParameter(selectCommand, "@DepartmentCode", DbType.AnsiString, "");
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetServiceAuthority(object serviceCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetServiceAuthoritySp");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, serviceCode);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetOfficer(string OfficeCode, string ServiceCode, string DistrictCode, string BlockCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetOfficerDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@OfficeCode", DbType.AnsiString, OfficeCode);
                m_DataBase.AddInParameter(selectCommand, "@ServiceCode", DbType.AnsiString, ServiceCode);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@BlockCode", DbType.AnsiString, BlockCode);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetOffice(string DistrictCode, string TalukaCode, string VillageCode, string ServiceCode, string DepartmentCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetOfficeDetailSP");
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@BlockCode", DbType.AnsiString, TalukaCode);
                m_DataBase.AddInParameter(selectCommand, "@PanchayatCode", DbType.AnsiString, VillageCode);
                m_DataBase.AddInParameter(selectCommand, "@SvcID", DbType.AnsiString, ServiceCode);
                m_DataBase.AddInParameter(selectCommand, "@DeptID", DbType.AnsiString, DepartmentCode);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        internal DataTable GetBPLYEAR(int ServiceId, string State, string District, string Taluka, string Village)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetBPLYearSP");

                m_DataBase.AddInParameter(selectCommand, "@ServiceId", DbType.AnsiString, ServiceId);
                m_DataBase.AddInParameter(selectCommand, "@State", DbType.AnsiString, State);
                m_DataBase.AddInParameter(selectCommand, "@District", DbType.AnsiString, District);
                m_DataBase.AddInParameter(selectCommand, "@Taluka", DbType.AnsiString, Taluka);
                m_DataBase.AddInParameter(selectCommand, "@Village", DbType.AnsiString, Village);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }


        internal DataTable binddetails(string uid)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("binddeatails");
                m_DataBase.AddInParameter(selectCommand, "@uid", DbType.AnsiString, uid);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetEAppealServices()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetEAppealServicesSP");

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetEAppealDepartment()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetEAppealDepartmentSP");
                m_DataBase.AddInParameter(selectCommand, "@DepartmentCode", DbType.AnsiString, "");
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetEAppealDeptServices(string DepartmentCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetEAppealDeptServicesSp");
                m_DataBase.AddInParameter(selectCommand, "@DepartmentCode", DbType.AnsiString, DepartmentCode);

                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetEAppealDepartmentCode(string DepartmentCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetEAppealDepartmentCodeSP");
                m_DataBase.AddInParameter(selectCommand, "@DepartmentCode", DbType.AnsiString, DepartmentCode);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        internal DataTable GetOfficeName(string ServiceCode, string DepartmentCode, string DistrictCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetOfficeNameSP");
                m_DataBase.AddInParameter(selectCommand, "@ServiceCode", DbType.AnsiString, ServiceCode);
                m_DataBase.AddInParameter(selectCommand, "@DepartmentCode", DbType.AnsiString, DepartmentCode);
                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetEAppealServiceAuthority(object serviceCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("GetEAppealServiceAuthoritySp");
                m_DataBase.AddInParameter(selectCommand, "@ServiceID", DbType.AnsiString, serviceCode);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges);
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataSet ServiceOfficerMapping(string SvcId, string DepartmentId
            , string OfficeName, string OfficeAddress, string EmailID, string MobileNo
            , string AppellateOfficeName, string AppellateOfficeAddress, string AppellateEmailID, string AppellateMobileNo
            , string RevisionalOfficeName, string RevisionalOfficeAddress, string RevisionalEmailID, string RevisionalMobileNo
            , string TimeLimit, string Flag, string DistrictCode, string CreatedBy
            //,string searchByRevisionalDropdown
            )
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;

               //selectCommand = m_DataBase.GetStoredProcCommand("ServiceOfficerMappingSP");
                selectCommand = m_DataBase.GetStoredProcCommand("ServiceOfficerMappingV2SP");

                m_DataBase.AddInParameter(selectCommand, "@DistrictCode", DbType.AnsiString, DistrictCode);
                m_DataBase.AddInParameter(selectCommand, "@SvcId", DbType.AnsiString, SvcId);
                m_DataBase.AddInParameter(selectCommand, "@DepartmentId", DbType.AnsiString, DepartmentId);


                // m_DataBase.AddInParameter(selectCommand, "@DesignatedOfficerDesignation", DbType.AnsiString, DesignatedOfficer);
                m_DataBase.AddInParameter(selectCommand, "@DesignatedOffice", DbType.AnsiString, OfficeName);
                m_DataBase.AddInParameter(selectCommand, "@DesignatedOfficeAddress", DbType.AnsiString, OfficeAddress);
                m_DataBase.AddInParameter(selectCommand, "@DesignatedEmailID", DbType.AnsiString, EmailID);
                m_DataBase.AddInParameter(selectCommand, "@DesignatedMobileNo", DbType.AnsiString, MobileNo);

                // m_DataBase.AddInParameter(selectCommand, "@AppellateAuthorityDesignation", DbType.AnsiString, AppellateAuthority);
                m_DataBase.AddInParameter(selectCommand, "@AppellateOffice", DbType.AnsiString, AppellateOfficeName);
                m_DataBase.AddInParameter(selectCommand, "@AppellateOfficeAddress", DbType.AnsiString, AppellateOfficeAddress);
                m_DataBase.AddInParameter(selectCommand, "@AppellateEmailID", DbType.AnsiString, AppellateEmailID);
                m_DataBase.AddInParameter(selectCommand, "@AppellateMobileNo", DbType.AnsiString, AppellateMobileNo);
                //  m_DataBase.AddInParameter(selectCommand, "@RevisionalAuthorityDesignation", DbType.AnsiString, RevisionalAuthority);


                m_DataBase.AddInParameter(selectCommand, "@RevisionalOffice", DbType.AnsiString, RevisionalOfficeName);
                m_DataBase.AddInParameter(selectCommand, "@RevisionalOfficeAddress", DbType.AnsiString, RevisionalOfficeAddress);
                m_DataBase.AddInParameter(selectCommand, "@RevisionalEmailID", DbType.AnsiString, RevisionalEmailID);
                m_DataBase.AddInParameter(selectCommand, "@RevisionalMobileNo", DbType.AnsiString, RevisionalMobileNo);

                m_DataBase.AddInParameter(selectCommand, "@TimeLimit", DbType.AnsiString, TimeLimit);
                m_DataBase.AddInParameter(selectCommand, "@Flag", DbType.AnsiString, Flag);
                m_DataBase.AddInParameter(selectCommand, "@CreatedBy", DbType.AnsiString, CreatedBy);
               // m_DataBase.AddInParameter(selectCommand, "@RevisionalSearchValue", DbType.AnsiString, searchByRevisionalDropdown);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "0", "1", "2", "3", "4", "5","6" });
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataSet serachByAuthority(string value)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("SearchByAuthorityPerson");
                m_DataBase.AddInParameter(selectCommand, "@value", DbType.AnsiString, value);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "0", "1", "2" });
                return oDataTable;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        internal DataSet districtBlockPanchayat(string id,string district, string block, string panchayat,string ddlDistId,string ddlBlockId,string districtName)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);

            try
            {

                {
                    DbCommand selectCommand;
                    selectCommand = m_DataBase.GetStoredProcCommand("districtBlockPanchayatTextSP");
                    m_DataBase.AddInParameter(selectCommand, "@Id", DbType.AnsiString, id);
                    m_DataBase.AddInParameter(selectCommand, "@DistrictName", DbType.AnsiString, district);
                    m_DataBase.AddInParameter(selectCommand, "@BlockName", DbType.AnsiString, block);
                    m_DataBase.AddInParameter(selectCommand, "@PanachayatName", DbType.AnsiString, panchayat);
                    m_DataBase.AddInParameter(selectCommand, "@ddlDistId", DbType.AnsiString, ddlDistId);
                    m_DataBase.AddInParameter(selectCommand, "@ddlBlockId", DbType.AnsiString, ddlBlockId);
                    m_DataBase.AddInParameter(selectCommand, "@DistrictSerach", DbType.AnsiString, districtName);
                   
                   
                    //text.Direction = ParameterDirection.Output;
                    //cmd1.Parameters.Add(text);
                    Reader = m_DataBase.ExecuteReader(selectCommand);
                    if (Reader != null)
                        oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "0", "1", "2", "3", "4", "5" });
                    return oDataTable;
                }
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
        internal List<string> SearchByDistrictBlockPanchayat(string value)
        {
            DataSet oDataTable = new DataSet();
            IDataReader Reader = null;
            m_DataBase = Factory.Create(this.ConnectionString);
            List<string> empResult = new List<string>();
            try
            {
                DbCommand selectCommand;
                selectCommand = m_DataBase.GetStoredProcCommand("SearchByDistrictBlockPanchayatSP");
                m_DataBase.AddInParameter(selectCommand, "@value", DbType.AnsiString, value);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader, LoadOption.OverwriteChanges, new string[] { "0" });

             
                foreach (DataRow dr in oDataTable.Tables[0].Rows)
                {
                    empResult.Add(string.Format("{0}", dr["DistrictName"]));
                }
                return empResult;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
    }
}
