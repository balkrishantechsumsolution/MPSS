using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Services;
using System.Web.Services;

namespace CitizenPortal.WebApp.Login
{
    public partial class LiveChartDashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //[WebMethod]
        //public static DataSet GetDataFromDB()
        //{
        //    DataTable dt = new DataTable();
        //    using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
        //    {
        //        DataSet ds = new DataSet();
        //        using (SqlCommand cmd = new SqlCommand("Report_GetReportDataSP", con))
        //        {
        //            con.Open();
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@ServiceID", 105);
        //            cmd.Parameters.AddWithValue("@FromDate", "");
        //            cmd.Parameters.AddWithValue("@ToDate", "");
        //            SqlDataAdapter da = new SqlDataAdapter(cmd);
        //            da.Fill(ds);
        //            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        //            return ds;
        //        }
        //    }
        //}

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<FruitEnity> ServiceList()
        {
            List<FruitEnity> ServiceCount = new List<FruitEnity>();
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Report_GetReportDataSP", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ServiceID", 105);
                    cmd.Parameters.AddWithValue("@FromDate", "");
                    cmd.Parameters.AddWithValue("@ToDate", "");
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                }
            }
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[4];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            ServiceCount.Add(new FruitEnity
                            {
                                Name = dr["SvcName"].ToString(),
                                Value = Convert.ToInt32(dr["Cnt"]),
                            });
                        }
                    }
                }
            }
            return ServiceCount;
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<cDepartment> GetDepartment()
        {
            List<cDepartment> DepartmentList = new List<cDepartment>();
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Report_GetReportDataSP", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ServiceID", 105);
                    cmd.Parameters.AddWithValue("@FromDate", "");
                    cmd.Parameters.AddWithValue("@ToDate", "");
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                }
            }
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


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<cApplication> GetApplication(string DeptName)
        {
            List<cApplication> ApplicationList = new List<cApplication>();
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Report_GetReportDataSP", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ServiceID", 105);
                    cmd.Parameters.AddWithValue("@FromDate", "");
                    cmd.Parameters.AddWithValue("@ToDate", "");
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                }
            }
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[1];
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


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<RevenueEntity> GetRevenueByQuarter(string year)
        {
            List<RevenueEntity> QuarterRevenues = new List<RevenueEntity>();
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Report_GetReportDataSP", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ServiceID", 105);
                    cmd.Parameters.AddWithValue("@FromDate", "");
                    cmd.Parameters.AddWithValue("@ToDate", "");
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                }
            }
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[2];
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

        public class cApplication
        {
            public int AppCount { get; set; }
            public int AppDisp { get; set; }
            public int AppPend { get; set; }
            public int AppAprov { get; set; }
            public int AppRejct { get; set; }
            public Boolean drilldown { get; set; }
        }

        public class FruitEnity
        {
            public string Name { get; set; }
            public int Value { get; set; }
        }
    }
}