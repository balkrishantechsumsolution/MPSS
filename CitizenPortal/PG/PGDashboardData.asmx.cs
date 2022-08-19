using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace CitizenPortal.PG
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class PGDashboardData : System.Web.Services.WebService
    {
        //Common Function
        DataSet ds = new DataSet();
        public DataSet GetSPData(int Flag)
        {
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GetProcPGFilterDataSp", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
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


        [WebMethod]
        public string PGResponseCount()
        {
            DataTable dt = new DataTable();
            GetSPData(1);
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
        public List<GetServiceName> BankPaymentMode()
        {
            List<GetServiceName> PaymentMode = new List<GetServiceName>();
            GetSPData(2);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            PaymentMode.Add(new GetServiceName
                            {
                                Name = dr["Bank_PaymentMode"].ToString(),
                                Count = Convert.ToInt32(dr["TotalNum"]),
                            });
                        }
                    }
                }
            }
            return PaymentMode;
        }


        [WebMethod]
        public List<GetServiceName> BankServiceCount()
        {
            List<GetServiceName> ServiceCount = new List<GetServiceName>();
            GetSPData(3);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            ServiceCount.Add(new GetServiceName
                            {
                                Name = dr["ServiceID"].ToString(),
                                Count = Convert.ToInt32(dr["TotalNum"]),
                            });
                        }
                    }
                }
            }
            return ServiceCount;
        }


        [WebMethod]
        public List<GetServiceName> DateWiseBankCount()
        {
            List<GetServiceName> DateWiseCount = new List<GetServiceName>();
            GetSPData(4);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            DateWiseCount.Add(new GetServiceName
                            {
                                Name = dr["DayDate"].ToString(),
                                Count = Convert.ToInt32(dr["DayCount"]),
                            });
                        }
                    }
                }
            }
            return DateWiseCount;
        }
    }
}