using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

namespace CitizenPortal.WebApp.Charts
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class DashboardData : System.Web.Services.WebService
    {
        private DataSet ds = new DataSet();

        public DataSet GetRecruitmentData(int Flag)
        {
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Report_GetReportDataRecruitmentSP", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ServiceID", 105);
                    cmd.Parameters.AddWithValue("@FromDate", "");
                    cmd.Parameters.AddWithValue("@ToDate", "");
                    cmd.Parameters.AddWithValue("@Flag", Flag);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                }
                return ds;
            }
        }

        public DataSet GetSSEPDDeptData(int Flag)
        {
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Report_GetReportDataSP", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ServiceID", 105);
                    cmd.Parameters.AddWithValue("@FromDate", "");
                    cmd.Parameters.AddWithValue("@ToDate", "");
                    cmd.Parameters.AddWithValue("@Flag", Flag);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                }
                return ds;
            }
        }

        public DataSet GetSSEPDDeptDrillData(int Flag, int ServiceID, string DrillDownType)
        {
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Report_GetReportDataSP", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ServiceID", ServiceID);
                    cmd.Parameters.AddWithValue("@FromDate", "");
                    cmd.Parameters.AddWithValue("@ToDate", "");
                    cmd.Parameters.AddWithValue("@Flag", Flag);
                    cmd.Parameters.AddWithValue("@DrillDownType", DrillDownType);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                }
                return ds;
            }
        }

        public DataSet GetDTEDeptData(int Flag)
        {
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Report_GetReportDataDTESP", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ServiceID", 105);
                    cmd.Parameters.AddWithValue("@FromDate", "");
                    cmd.Parameters.AddWithValue("@ToDate", "");
                    cmd.Parameters.AddWithValue("@Flag", Flag);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                }
                return ds;
            }
        }

        public DataSet GetDTEDeptDrillData(int Flag, int ServiceID, string DrillDownType)
        {
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Report_GetReportDataDTESP", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ServiceID", ServiceID);
                    cmd.Parameters.AddWithValue("@FromDate", "");
                    cmd.Parameters.AddWithValue("@ToDate", "");
                    cmd.Parameters.AddWithValue("@Flag", Flag);
                    cmd.Parameters.AddWithValue("@DrillDownType", DrillDownType);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                }
                return ds;
            }
        }

        public DataSet GetOUATData(int Flag)
        {
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Report_GetReportDataOUATSP", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ServiceID", 105);
                    cmd.Parameters.AddWithValue("@FromDate", "");
                    cmd.Parameters.AddWithValue("@ToDate", "");
                    cmd.Parameters.AddWithValue("@Flag", Flag);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                }
                return ds;
            }
        }

        public DataSet GetOUATAgroDiplomaData(int Flag)
        {
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Report_GetReportDataOUATAgroDiplomaSP", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ServiceID", 105);
                    cmd.Parameters.AddWithValue("@FromDate", "");
                    cmd.Parameters.AddWithValue("@ToDate", "");
                    cmd.Parameters.AddWithValue("@Flag", Flag);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                }
                return ds;
            }
        }

        public DataSet GetOUATPGData(int Flag)
        {
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Report_GetReportDataOUATPGSP", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ServiceID", 105);
                    cmd.Parameters.AddWithValue("@FromDate", "");
                    cmd.Parameters.AddWithValue("@ToDate", "");
                    cmd.Parameters.AddWithValue("@Flag", Flag);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                }
                return ds;
            }
        }


        public class GetServiceName
        {
            public string Name { get; set; }
            public int Count { get; set; }
        }

        public class RevenueEntity
        {
            public string year { get; set; }
            public int amount { get; set; }
            public Boolean drilldown { get; set; }
        }

        public class cDepartment
        {
            public string DeptName { get; set; }
            public int DeptCount { get; set; }
            public Boolean drilldown { get; set; }
        }

        public class DepartmentServiceList
        {
            public string SvcName { get; set; }
            public int SvcCount { get; set; }
            public int SvcID { get; set; }
            public Boolean drilldown { get; set; }
        }

        public class cApplication
        {
            public int AppCount { get; set; }
            public int AppDisp { get; set; }
            public int AppPend { get; set; }
            public int AppAprov { get; set; }
            public int AppRejct { get; set; }
            public Boolean drilldown { get; set; }
        }

        public class DrillDownApplication
        {
            public int AppCount { get; set; }
            public int AppDisp { get; set; }
            public int AppPend { get; set; }
            public int AppAprov { get; set; }
            public int AppRejct { get; set; }
            public int SvcID { get; set; }
            public Boolean drilldown { get; set; }
        }

        public class FruitEnity
        {
            public string Name { get; set; }
            public int Value { get; set; }
        }

        [WebMethod]
        public List<cDepartment> GetDepartment()
        {
            List<cDepartment> DepartmentList = new List<cDepartment>();
            //DataSet ds = new DataSet();
            //using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            //{
            //    using (SqlCommand cmd = new SqlCommand("Report_GetReportDataSP", con))
            //    {
            //        con.Open();
            //        cmd.CommandType = CommandType.StoredProcedure;
            //        cmd.Parameters.AddWithValue("@ServiceID", 105);
            //        cmd.Parameters.AddWithValue("@FromDate", "");
            //        cmd.Parameters.AddWithValue("@ToDate", "");
            //        SqlDataAdapter da = new SqlDataAdapter(cmd);
            //        da.Fill(ds);
            //    }
            //}
            GetSSEPDDeptData(1);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            DepartmentList.Add(new cDepartment
                            {
                                DeptName = dr["DepartmentName"].ToString(),
                                DeptCount = Convert.ToInt32(dr["SvcCount"]),
                                drilldown = true
                            });
                        }
                    }
                }
            }
            return DepartmentList;
        }

        [WebMethod]
        public List<cApplication> GetApplication(string DeptName)
        {
            List<cApplication> ApplicationList = new List<cApplication>();
            GetSSEPDDeptData(2);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            ApplicationList.Add(new cApplication
                            {
                                AppCount = Convert.ToInt32(dr["Application Count"]),
                                AppDisp = Convert.ToInt32(dr["ApplicationDisposed"]),
                                AppPend = Convert.ToInt32(dr["ApplicationPending"]),
                                AppAprov = Convert.ToInt32(dr["ApplicationApproved"]),
                                AppRejct = Convert.ToInt32(dr["ApplicationRejected"]),
                                drilldown = true
                            });
                        }
                    }
                }
            }
            return ApplicationList;
        }

        [WebMethod]
        public List<RevenueEntity> GetRevenueByQuarter(string year)
        {
            //List<DepartmentServiceList> ServiceCount = new List<DepartmentServiceList>();
            //GetSSEPDDeptData(3);
            List<RevenueEntity> QuarterRevenues = new List<RevenueEntity>();
            GetSSEPDDeptDrillData(3, 103, year);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            QuarterRevenues.Add(new RevenueEntity
                            {
                                year = dr["DistrictName"].ToString(),
                                amount = Convert.ToInt32(dr["Application Count"])
                            });
                        }
                    }
                }
            }
            return QuarterRevenues;
        }

        [WebMethod]
        public List<DepartmentServiceList> SSEPDServiceList()
        {
            List<DepartmentServiceList> ServiceCount = new List<DepartmentServiceList>();
            GetSSEPDDeptData(5);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            ServiceCount.Add(new DepartmentServiceList
                            {
                                SvcName = dr["SvcName"].ToString(),
                                SvcID = Convert.ToInt32(dr["SvcID"]),
                                SvcCount = Convert.ToInt32(dr["Cnt"]),
                                drilldown = true
                            });
                        }
                    }
                }
            }
            return ServiceCount;
        }

        [WebMethod]
        public List<DrillDownApplication> GetSSEPDDeptApplication(int SvcID)
        {
            List<DrillDownApplication> ApplicationList = new List<DrillDownApplication>();
            GetSSEPDDeptDrillData(6, SvcID, "");
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            ApplicationList.Add(new DrillDownApplication
                            {
                                AppCount = Convert.ToInt32(dr["Application Count"]),
                                AppDisp = Convert.ToInt32(dr["ApplicationDisposed"]),
                                AppPend = Convert.ToInt32(dr["ApplicationPending"]),
                                AppAprov = Convert.ToInt32(dr["ApplicationApproved"]),
                                AppRejct = Convert.ToInt32(dr["ApplicationRejected"]),
                                SvcID = Convert.ToInt32(dr["SvcID"]),
                                drilldown = true
                            });
                        }
                    }
                }
            }
            return ApplicationList;
        }

        [WebMethod]
        public List<RevenueEntity> GetSSEPDDeptDistrict(string year, int SvcID)
        {
            List<RevenueEntity> QuarterRevenues = new List<RevenueEntity>();
            GetSSEPDDeptDrillData(7, SvcID, year);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            QuarterRevenues.Add(new RevenueEntity
                            {
                                year = dr["DistrictName"].ToString(),
                                amount = Convert.ToInt32(dr["Application Count"])
                            });
                        }
                    }
                }
            }
            return QuarterRevenues;
        }

        [WebMethod]
        public string ConvertDataTabletoString()
        {
            //DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Report_GetReportDataRecruitmentSP", con))
                {
                    //con.Open();
                    //cmd.CommandType = CommandType.StoredProcedure;
                    //cmd.Parameters.AddWithValue("@ServiceID", 105);
                    //cmd.Parameters.AddWithValue("@FromDate", "");
                    //cmd.Parameters.AddWithValue("@ToDate", "");
                    //SqlDataAdapter da = new SqlDataAdapter(cmd);
                    //da.Fill(ds);
                    GetRecruitmentData(1);
                    dt = ds.Tables[0];
                    System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                    List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                    Dictionary<string, object> row;
                    foreach (DataRow dr in dt.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in dt.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }
                        rows.Add(row);
                    }
                    return serializer.Serialize(rows);
                }
            }
        }

        [WebMethod]
        public List<GetServiceName> ServiceName()
        {
            List<GetServiceName> ServiceList = new List<GetServiceName>();

            //using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            //{
            //    using (SqlCommand cmd = new SqlCommand("Report_GetReportDataRecruitmentSP", con))
            //    {
            //        con.Open();
            //        cmd.CommandType = CommandType.StoredProcedure;
            //        cmd.Parameters.AddWithValue("@ServiceID", 105);
            //        cmd.Parameters.AddWithValue("@FromDate", "");
            //        cmd.Parameters.AddWithValue("@ToDate", "");
            //        SqlDataAdapter da = new SqlDataAdapter(cmd);
            //        da.Fill(ds);
            //    }
            //}

            GetRecruitmentData(2);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            ServiceList.Add(new GetServiceName
                            {
                                Name = dr["Category"].ToString(),
                                Count = Convert.ToInt32(dr["Column1"]),
                            });
                        }
                    }
                }
            }
            return ServiceList;
        }

        [WebMethod]
        public List<GetServiceName> CompleteApplication()
        {
            List<GetServiceName> CompleteList = new List<GetServiceName>();
            GetRecruitmentData(4);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            CompleteList.Add(new GetServiceName
                            {
                                Name = dr["Category"].ToString(),
                                Count = Convert.ToInt32(dr["Column1"]),
                            });
                        }
                    }
                }
            }
            return CompleteList;
        }

        [WebMethod]
        public List<GetServiceName> InCompleteApplication()
        {
            List<GetServiceName> InCompleteList = new List<GetServiceName>();
            GetRecruitmentData(3);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            InCompleteList.Add(new GetServiceName
                            {
                                Name = dr["Category"].ToString(),
                                Count = Convert.ToInt32(dr["Column1"]),
                            });
                        }
                    }
                }
            }
            return InCompleteList;
        }

        [WebMethod]
        public List<GetServiceName> GetList()
        {
            List<GetServiceName> ListInfo = new List<GetServiceName>();
            GetRecruitmentData(2);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            ListInfo.Add(new GetServiceName
                            {
                                Name = dr["Category"].ToString(),
                                Count = Convert.ToInt32(dr["Column1"]),
                            });
                        }
                    }
                }
            }
            return ListInfo;
        }

        [WebMethod]
        public List<FruitEnity> DistrictWiseReport()
        {
            List<FruitEnity> DWiseReport = new List<FruitEnity>();
            GetRecruitmentData(7);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            DWiseReport.Add(new FruitEnity
                            {
                                Name = dr["Districtname"].ToString(),
                                Value = Convert.ToInt32(dr["Cnt"]),
                            });
                        }
                    }
                }
            }
            return DWiseReport;
        }

        [WebMethod]
        public List<FruitEnity> DateWiseReport()
        {
            List<FruitEnity> DteWiseReport = new List<FruitEnity>();
            GetRecruitmentData(8);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            DteWiseReport.Add(new FruitEnity
                            {
                                Name = dr["AllocationTime"].ToString(),
                                Value = Convert.ToInt32(dr["Cnt"]),
                            });
                        }
                    }
                }
            }
            return DteWiseReport;
        }

        [WebMethod]
        public List<FruitEnity> CenterWiseReport()
        {
            List<FruitEnity> CntrWiseReport = new List<FruitEnity>();
            GetRecruitmentData(9);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            CntrWiseReport.Add(new FruitEnity
                            {
                                Name = dr["Centerid"].ToString(),
                                Value = Convert.ToInt32(dr["Cnt"]),
                            });
                        }
                    }
                }
            }
            return CntrWiseReport;
        }

        [WebMethod]
        public List<FruitEnity> DistrictWrittenQualifiedReport()
        {
            List<FruitEnity> DQWrittenReport = new List<FruitEnity>();
            GetRecruitmentData(10);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            DQWrittenReport.Add(new FruitEnity
                            {
                                Name = dr["DistrictName"].ToString(),
                                Value = Convert.ToInt32(dr["QualifiedForWrittenTest"]),
                            });
                        }
                    }
                }
            }
            return DQWrittenReport;
        }

        [WebMethod]
        public List<FruitEnity> SCWrittenQualifiedReport()
        {
            List<FruitEnity> SCWrittenReport = new List<FruitEnity>();
            GetRecruitmentData(11);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            SCWrittenReport.Add(new FruitEnity
                            {
                                Name = dr["DistrictName"].ToString(),
                                Value = Convert.ToInt32(dr["Cnt"]),
                            });
                        }
                    }
                }
            }
            return SCWrittenReport;
        }

        [WebMethod]
        public List<FruitEnity> STWrittenQualifiedReport()
        {
            List<FruitEnity> STWrittenReport = new List<FruitEnity>();
            GetRecruitmentData(12);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            STWrittenReport.Add(new FruitEnity
                            {
                                Name = dr["DistrictName"].ToString(),
                                Value = Convert.ToInt32(dr["Cnt"]),
                            });
                        }
                    }
                }
            }
            return STWrittenReport;
        }

        [WebMethod]
        public List<FruitEnity> SEBCWrittenQualifiedReport()
        {
            List<FruitEnity> SEBCWrittenReport = new List<FruitEnity>();
            GetRecruitmentData(13);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            SEBCWrittenReport.Add(new FruitEnity
                            {
                                Name = dr["DistrictName"].ToString(),
                                Value = Convert.ToInt32(dr["Cnt"]),
                            });
                        }
                    }
                }
            }
            return SEBCWrittenReport;
        }

        [WebMethod]
        public List<FruitEnity> URWrittenQualifiedReport()
        {
            List<FruitEnity> URWrittenReport = new List<FruitEnity>();
            GetRecruitmentData(14);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            URWrittenReport.Add(new FruitEnity
                            {
                                Name = dr["DistrictName"].ToString(),
                                Value = Convert.ToInt32(dr["Cnt"]),
                            });
                        }
                    }
                }
            }
            return URWrittenReport;
        }

        [WebMethod]
        public string QualifiedCandidateEventWise()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Report_GetReportDataRecruitmentSP", con))
                {
                    GetRecruitmentData(15);
                    dt = ds.Tables[0];
                    System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                    List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                    Dictionary<string, object> row;
                    foreach (DataRow dr in dt.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in dt.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }
                        rows.Add(row);
                    }
                    return serializer.Serialize(rows);
                }
            }
        }

        [WebMethod]
        public List<cDepartment> GetDTEDepartment()
        {
            List<cDepartment> DepartmentList = new List<cDepartment>();
            GetDTEDeptData(1);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            DepartmentList.Add(new cDepartment
                            {
                                DeptName = dr["DepartmentName"].ToString(),
                                DeptCount = Convert.ToInt32(dr["SvcCount"]),
                                drilldown = true
                            });
                        }
                    }
                }
            }
            return DepartmentList;
        }

        [WebMethod]
        public List<cApplication> GetDTEApplication(string DeptName)
        {
            List<cApplication> ApplicationList = new List<cApplication>();
            GetDTEDeptData(2);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            ApplicationList.Add(new cApplication
                            {
                                AppCount = Convert.ToInt32(dr["Application Count"]),
                                AppDisp = Convert.ToInt32(dr["ApplicationDisposed"]),
                                AppPend = Convert.ToInt32(dr["ApplicationPending"]),
                                AppAprov = Convert.ToInt32(dr["ApplicationApproved"]),
                                AppRejct = Convert.ToInt32(dr["ApplicationRejected"]),
                                drilldown = true
                            });
                        }
                    }
                }
            }
            return ApplicationList;
        }

        [WebMethod]
        public List<RevenueEntity> GetDTERevenueByQuarter(string year)
        {
            List<RevenueEntity> QuarterRevenues = new List<RevenueEntity>();
            //GetDTEDeptData(3);
            GetDTEDeptDrillData(3, 121, year);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            QuarterRevenues.Add(new RevenueEntity
                            {
                                year = dr["DistrictName"].ToString(),
                                amount = Convert.ToInt32(dr["Application Count"])
                            });
                        }
                    }
                }
            }
            return QuarterRevenues;
        }

        [WebMethod]
        public List<DepartmentServiceList> DTEServiceList()
        {
            List<DepartmentServiceList> ServiceCount = new List<DepartmentServiceList>();
            GetDTEDeptData(5);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            ServiceCount.Add(new DepartmentServiceList
                            {
                                SvcName = dr["SvcName"].ToString(),
                                SvcID = Convert.ToInt32(dr["SvcID"]),
                                SvcCount = Convert.ToInt32(dr["Cnt"]),
                                drilldown = true
                            });
                        }
                    }
                }
            }
            return ServiceCount;
        }

        [WebMethod]
        public List<DrillDownApplication> GetDTEDeptApplication(int SvcID)
        {
            List<DrillDownApplication> ApplicationList = new List<DrillDownApplication>();
            GetDTEDeptDrillData(6, SvcID, "");
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            ApplicationList.Add(new DrillDownApplication
                            {
                                AppCount = Convert.ToInt32(dr["Application Count"]),
                                AppDisp = Convert.ToInt32(dr["ApplicationDisposed"]),
                                AppPend = Convert.ToInt32(dr["ApplicationPending"]),
                                AppAprov = Convert.ToInt32(dr["ApplicationApproved"]),
                                AppRejct = Convert.ToInt32(dr["ApplicationRejected"]),
                                SvcID = Convert.ToInt32(dr["SvcID"]),
                                drilldown = true
                            });
                        }
                    }
                }
            }
            return ApplicationList;
        }

        //[WebMethod]
        //public List<cApplication> GetDTEDeptApplication(int SvcID)
        //{
        //    List<cApplication> ApplicationList = new List<cApplication>();
        //    GetDTEDeptDrillData(6, SvcID);
        //    if (ds != null)
        //    {
        //        if (ds.Tables.Count > 0)
        //        {
        //            DataTable dt = ds.Tables[0];
        //            if (dt.Rows.Count > 0)
        //            {
        //                foreach (DataRow dr in dt.Rows)
        //                {
        //                    ApplicationList.Add(new cApplication
        //                    {
        //                        AppCount = Convert.ToInt32(dr["Application Count"]),
        //                        AppDisp = Convert.ToInt32(dr["ApplicationDisposed"]),
        //                        AppPend = Convert.ToInt32(dr["ApplicationPending"]),
        //                        AppAprov = Convert.ToInt32(dr["ApplicationApproved"]),
        //                        AppRejct = Convert.ToInt32(dr["ApplicationRejected"]),
        //                        drilldown = true
        //                    });
        //                }
        //            }
        //        }
        //    }
        //    return ApplicationList;
        //}

        [WebMethod]
        public List<RevenueEntity> GetDTEDeptDistrict(string year, int SvcID)
        {
            List<RevenueEntity> QuarterRevenues = new List<RevenueEntity>();
            GetDTEDeptDrillData(7, SvcID, year);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            QuarterRevenues.Add(new RevenueEntity
                            {
                                year = dr["DistrictName"].ToString(),
                                amount = Convert.ToInt32(dr["Application Count"])
                            });
                        }
                    }
                }
            }
            return QuarterRevenues;
        }

        [WebMethod]
        public List<FruitEnity> OUATServiceList()
        {
            List<FruitEnity> OUATServiceCount = new List<FruitEnity>();
            GetOUATData(1);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            OUATServiceCount.Add(new FruitEnity
                            {
                                Name = dr["Text"].ToString(),
                                Value = Convert.ToInt32(dr["Value"]),
                            });
                        }
                    }
                }
            }
            return OUATServiceCount;
        }

        [WebMethod]
        public List<FruitEnity> OUATDistWiseAppCount()
        {
            List<FruitEnity> OUATDistAppCount = new List<FruitEnity>();
            GetOUATData(2);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            OUATDistAppCount.Add(new FruitEnity
                            {
                                Name = dr["DistrictName"].ToString(),
                                Value = Convert.ToInt32(dr["Cnt"]),
                            });
                        }
                    }
                }
            }
            return OUATDistAppCount;
        }

        [WebMethod]
        public List<FruitEnity> OUATDistWiseAppCount2()
        {
            List<FruitEnity> OUATDistAppCount = new List<FruitEnity>();
            GetOUATData(2);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[1];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            OUATDistAppCount.Add(new FruitEnity
                            {
                                Name = dr["DistrictName"].ToString(),
                                Value = Convert.ToInt32(dr["Cnt"]),
                            });
                        }
                    }
                }
            }
            return OUATDistAppCount;
        }

        [WebMethod]
        public List<FruitEnity> OUATAppPaymentCount()
        {
            List<FruitEnity> OUATAppPayCount = new List<FruitEnity>();
            GetOUATData(3);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            OUATAppPayCount.Add(new FruitEnity
                            {
                                Name = dr["Text"].ToString(),
                                Value = Convert.ToInt32(dr["Value"]),
                            });
                        }
                    }
                }
            }
            return OUATAppPayCount;
        }

        [WebMethod]
        public List<FruitEnity> OUATAppPaymentCount2()
        {
            List<FruitEnity> OUATAppPayCount2 = new List<FruitEnity>();
            GetOUATData(4);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            OUATAppPayCount2.Add(new FruitEnity
                            {
                                Name = dr["Text"].ToString(),
                                Value = Convert.ToInt32(dr["Value"]),
                            });
                        }
                    }
                }
            }
            return OUATAppPayCount2;
        }

        [WebMethod]
        public List<FruitEnity> OUATDateWiseReport()
        {
            List<FruitEnity> OuatWiseReport = new List<FruitEnity>();
            GetOUATData(6);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            OuatWiseReport.Add(new FruitEnity
                            {
                                Name = dr["DayDate"].ToString(),
                                Value = Convert.ToInt32(dr["DayCount"]),
                            });
                        }
                    }
                }
            }
            return OuatWiseReport;
        }

        [WebMethod]
        public List<FruitEnity> OUATDateWiseReport2()
        {
            List<FruitEnity> OuatWiseReport2 = new List<FruitEnity>();
            GetOUATData(6);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[1];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            OuatWiseReport2.Add(new FruitEnity
                            {
                                Name = dr["DayDate"].ToString(),
                                Value = Convert.ToInt32(dr["DayCount"]),
                            });
                        }
                    }
                }
            }
            return OuatWiseReport2;
        }

        [WebMethod]
        public List<FruitEnity> OUATExamCenter1()
        {
            List<FruitEnity> OUATCenter1 = new List<FruitEnity>();
            GetOUATData(7);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            OUATCenter1.Add(new FruitEnity
                            {
                                Name = dr["ExamCenter1"].ToString(),
                                Value = Convert.ToInt32(dr["cnt"]),
                            });
                        }
                    }
                }
            }
            return OUATCenter1;
        }

        [WebMethod]
        public List<FruitEnity> OUATExamCenter2()
        {
            List<FruitEnity> OUATCenter2 = new List<FruitEnity>();
            GetOUATData(7);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[1];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            OUATCenter2.Add(new FruitEnity
                            {
                                Name = dr["ExamCenter2"].ToString(),
                                Value = Convert.ToInt32(dr["cnt"]),
                            });
                        }
                    }
                }
            }
            return OUATCenter2;
        }


        [WebMethod]
        public string OUATPGTotalApplication()
        {
            DataTable dt = new DataTable();
            GetOUATPGData(1);
            dt = ds.Tables[0];
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();

                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }


        [WebMethod]
        public List<GetServiceName> OUATPGDistrict()
        {
            List<GetServiceName> OUATPGDistrictList = new List<GetServiceName>();
            GetOUATPGData(2);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            OUATPGDistrictList.Add(new GetServiceName
                            {
                                Name = dr["DistrictName"].ToString(),
                                Count = Convert.ToInt32(dr["cnt"]),
                            });
                        }
                    }
                }
            }
            return OUATPGDistrictList;
        }


        [WebMethod]
        public List<GetServiceName> OUATPGDateWiseReport()
        {
            List<GetServiceName> OUATPGDateWiseReport = new List<GetServiceName>();
            GetOUATPGData(6);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            OUATPGDateWiseReport.Add(new GetServiceName
                            {
                                Name = dr["DayDate"].ToString(),
                                Count = Convert.ToInt32(dr["DayCount"]),
                            });
                        }
                    }
                }
            }
            return OUATPGDateWiseReport;
        }


        [WebMethod]
        public List<GetServiceName> OUATPGPaidReport()
        {
            List<GetServiceName> OUATPGPaidReport = new List<GetServiceName>();
            GetOUATPGData(3);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            OUATPGPaidReport.Add(new GetServiceName
                            {
                                Name = dr["Text"].ToString(),
                                Count = Convert.ToInt32(dr["Value"]),
                            });
                        }
                    }
                }
            }
            return OUATPGPaidReport;
        }


        [WebMethod]
        public List<GetServiceName> OUATPGTotalPaidReport()
        {
            List<GetServiceName> OUATPGTotalPaidReport = new List<GetServiceName>();
            GetOUATPGData(4);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            OUATPGTotalPaidReport.Add(new GetServiceName
                            {
                                Name = dr["Text"].ToString(),
                                Count = Convert.ToInt32(dr["Value"]),
                            });
                        }
                    }
                }
            }
            return OUATPGTotalPaidReport;
        }
    }
}