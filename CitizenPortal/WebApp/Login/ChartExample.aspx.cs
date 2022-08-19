using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Services;
using System.Web.Services;

namespace CitizenPortal.WebApp.Login
{
    public partial class ChartExample : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<FruitEnity> FruitAnalysis()
        {
            List<FruitEnity> fruitinfo = new List<FruitEnity>();
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select name,value from tbl_fruitanalysis";
                    cmd.Connection = con;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds, "FruitAnalysis");
                    }
                }
            }
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables["FruitAnalysis"].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables["FruitAnalysis"].Rows)
                        {
                            fruitinfo.Add(new FruitEnity
                            {
                                Name = dr["name"].ToString(),
                                Value = Convert.ToInt32(dr["value"])
                            });
                        }
                    }
                }
            }
            return fruitinfo;
        }

        public class FruitEnity
        {
            public string Name { get; set; }
            public int Value { get; set; }
        }

        public class RevenueEntity
        {
            public string year { get; set; }
            public int amount { get; set; }
            public Boolean drilldown { get; set; }
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<RevenueEntity> GetRevenueByDecade()
        {
            List<RevenueEntity> DecadeRevenues = new List<RevenueEntity>();
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select quarter,SUM(value)value from tbl_fruitanalysis group by quarter";
                    cmd.Connection = con;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds, "dsRevenue");
                    }
                }
            }
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables["dsRevenue"].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables["dsRevenue"].Rows)
                        {
                            DecadeRevenues.Add(new RevenueEntity
                            {
                                year = dr["quarter"].ToString(),
                                amount = Convert.ToInt32(dr["value"]),
                                drilldown = true
                            });
                        }
                    }
                }
            }
            return DecadeRevenues;
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<RevenueEntity> GetRevenueByYear(string quarter)
        {
            List<RevenueEntity> YearRevenues = new List<RevenueEntity>();
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select year,SUM(amount)amount from tbl_fruitanalysis where quarter='" + quarter + "'  group by year";
                    cmd.Connection = con;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds, "dsRevenue");
                    }
                }
            }
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables["dsRevenue"].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables["dsRevenue"].Rows)
                        {
                            YearRevenues.Add(new RevenueEntity
                            {
                                year = dr["year"].ToString(),
                                amount = Convert.ToInt32(dr["amount"]),
                                drilldown = true
                            });
                        }
                    }
                }
            }
            return YearRevenues;
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<RevenueEntity> GetRevenueByQuarter(string year)
        {
            List<RevenueEntity> QuarterRevenues = new List<RevenueEntity>();
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select quarter,SUM(amount)amount from tbl_fruitanalysis where year='" + year + "' group by quarter";
                    cmd.Connection = con;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds, "dsQuarter");
                    }
                }
            }
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables["dsQuarter"].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables["dsQuarter"].Rows)
                        {
                            QuarterRevenues.Add(new RevenueEntity
                            {
                                year = dr["quarter"].ToString(),
                                amount = Convert.ToInt32(dr["amount"])

                            });
                        }
                    }
                }
            }
            return QuarterRevenues;
        }
    }
}