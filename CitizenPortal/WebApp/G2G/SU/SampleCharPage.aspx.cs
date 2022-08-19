using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CitizenPortalLib;
using System.Web.Services;

namespace CitizenPortal.WebApp.G2G.SU
{
    public partial class SampleCharPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        public class SeriesItem
        {
            public string name { get; set; }
            public int[] data { get; set; }
        }

        public class xAxis
        {
            public string[] categories { get; set; }
            public bool crosshair { get; set; }
        }
        public class BarChartData
        {
            public SeriesItem[] series { get; set; }
            public xAxis xAxis { get; set; }

            public BarChartData()
            {
            }

            public BarChartData(SeriesItem[] Series, xAxis XAxis)
            {
                series = Series;
                xAxis = XAxis;
            }
        }
        [WebMethod]
        public static BarChartData YearWiseStudent()
        {
            string LoginID = "";// Session["LoginID"].ToString();
            G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
            int AdmissionYear = 0;
            string CollegeCode = "";
            string BranchCode = "";
            string HonsCode = "";
            int ReportType = 0;

            DataTable DTResult = null;
            DTResult = m_G2GDashboardBLL.GetChartData(LoginID, AdmissionYear, CollegeCode, BranchCode, HonsCode, ReportType);

            List<SeriesItem> series = new List<SeriesItem>();
            List<int> arr = null;

            //series.Add(new SeriesItem() { name = "Total Count", data = new int[] { 2015, 2018 } });
            //series.Add(new SeriesItem() { name = "Pendency", data = new int[] { 40, 68 } });
            for (int i = 0; i < DTResult.Columns.Count; i++)
            {
                //if (DTResult.Columns[i].ColumnName == "AH" || DTResult.Columns[i].ColumnName == "AP"
                //            || DTResult.Columns[i].ColumnName == "CH" || DTResult.Columns[i].ColumnName == "CP" || DTResult.Columns[i].ColumnName == "SH" || DTResult.Columns[i].ColumnName == "SP")
                {
                    SeriesItem seriesItem = new SeriesItem();
                    seriesItem.name = DTResult.Columns[i].ColumnName;
                    arr = new List<int>();
                    for (int j = 0; j < DTResult.Rows.Count; j++)
                    {
                        arr.Add(Convert.ToInt32(DTResult.Rows[j][DTResult.Columns[i].ColumnName]));
                    }
                    seriesItem.data = arr.ToArray();
                    series.Add(seriesItem);
                }
            }

            //xAxis x = new xAxis() { crosshair = true, categories = new string[] { "2018", "2019" } };
            xAxis x = new xAxis();
            x.crosshair = true;
            string[] GYear = new string[4];

            for (int i = 0; i < DTResult.Rows.Count; i++)
            {
                GYear[i] = DTResult.Rows[i][0].ToString();
            }
            x.categories = GYear;

            BarChartData chartData = new BarChartData(series.ToArray(), x);
            return chartData;
        }

        [WebMethod]
        public static BarChartData BranchWiseHonours()
        {
            string LoginID = "";// Session["LoginID"].ToString();
            G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
            int AdmissionYear = 0;
            string CollegeCode = "";
            string BranchCode = "";
            string HonsCode = "";
            int ReportType = 1;

            DataTable DTResult = null;
            DTResult = m_G2GDashboardBLL.GetChartData(LoginID, AdmissionYear, CollegeCode, BranchCode, HonsCode, ReportType);

            List<SeriesItem> series = new List<SeriesItem>();
            List<int> arr = null;

            //series.Add(new SeriesItem() { name = "Total Count", data = new int[] { 2015, 2018 } });
            //series.Add(new SeriesItem() { name = "Pendency", data = new int[] { 40, 68 } });
            for (int i = 0; i < DTResult.Columns.Count; i++)
            {
                if (DTResult.Columns[i].ColumnName == "AH" || DTResult.Columns[i].ColumnName == "AP"
                            || DTResult.Columns[i].ColumnName == "CH" || DTResult.Columns[i].ColumnName == "CP" || DTResult.Columns[i].ColumnName == "SH" || DTResult.Columns[i].ColumnName == "SP")
                {
                    SeriesItem seriesItem = new SeriesItem();
                    seriesItem.name = DTResult.Columns[i].ColumnName;
                    arr = new List<int>();
                    for (int j = 0; j < DTResult.Rows.Count; j++)
                    {
                        arr.Add(Convert.ToInt32(DTResult.Rows[j][DTResult.Columns[i].ColumnName]));
                    }
                    seriesItem.data = arr.ToArray();
                    series.Add(seriesItem);
                }
            }

            //xAxis x = new xAxis() { crosshair = true, categories = new string[] { "2018", "2019" } };
            xAxis x = new xAxis();
            x.crosshair = true;
            string[] GYear = new string[4];

            for (int i = 0; i < DTResult.Rows.Count; i++)
            {
                GYear[i] = DTResult.Rows[i]["AdmissionYear"].ToString();
            }
            x.categories = GYear;

            BarChartData chartData = new BarChartData(series.ToArray(), x);
            return chartData;
        }
    }
}