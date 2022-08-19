using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib;
using CitizenPortalLib.DAL;
using System.Data;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;

namespace CitizenPortal.WebApp.G2G.OISF
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                OISFDALReport obj = new OISFDALReport();
                DataSet ds=obj.GetOISFAppDetails("OP01","","","","","","","","","","");
                grdCat.DataSource = ds.Tables[0];
                grdCat.DataBind();
                grdDist.DataSource = ds.Tables[1];
                grdDist.DataBind();

                //ChartCategory.Series[0].ChartType = SeriesChartType.Pie;
                ChartCategory.DataSource= ds.Tables[0];
                ChartCategory.Series["Series1"].XValueMember = "Category";
                ChartCategory.Series["Series1"].YValueMembers = "Total";
                ChartCategory.DataBind();


                ChartDistrict.DataSource = ds.Tables[1];
                ChartDistrict.Series["Series1"].XValueMember = "districtname";
                ChartDistrict.Series["Series1"].YValueMembers = "Total";
                ChartDistrict.DataBind();

                //ChartCategory.Series[0].LegendUrl = "TestReport.html";
                //ChartCategory.Series[0].LabelUrl = "TestReport.html";
                //ChartCategory.Series[0].Url = "TestReport.html";

                //ChartCategory.Series[0].LegendPostBackValue = "#VALY-#VALX";
                //ChartCategory.Series[0].LabelPostBackValue = "#VALY-#VALX";
                //ChartCategory.Series[0].PostBackValue = "#VALY-#VALX";

                //ChartCategory.Series[0].LegendMapAreaAttributes = "target=\"_blank\"";
                //ChartCategory.Series[0].LabelMapAreaAttributes = "target=\"_blank\"";
                //ChartCategory.Series[0].MapAreaAttributes = "target=\"_blank\"";


                foreach (Series charts in ChartCategory.Series)
                {
                    foreach (DataPoint point in charts.Points)
                    {
                        //switch (point.AxisLabel)
                        //{
                        //    case "Q1": point.Color = Color.RoyalBlue; break;
                        //    case "Q2": point.Color = Color.SaddleBrown; break;
                        //    case "Q3": point.Color = Color.SpringGreen; break;
                        //}
                        point.Label = string.Format("{0:0} - {1}", point.YValues[0], point.AxisLabel);

                    }
                }

            }
            catch (Exception ex)
            {

                
            }
        }

        protected void ChartCategory_Click(object sender, ImageMapEventArgs e)
        {
            HttpContext.Current.Session["VAL"] = e.PostBackValue;
        }

       
    }
}