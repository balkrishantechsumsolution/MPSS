using CitizenPortalLib.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G.OISF
{
    public partial class FrmBarReport : System.Web.UI.Page
    {

        OISFDALReport obj = new OISFDALReport();
        DataSet ds = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
              
                if (!IsPostBack)
                {
                    BindChart();
                }

            }
            catch (Exception ex)
            {


            }

        }

        public void BindChart()
        {

            if(drpSelectType.SelectedValue.ToUpper()=="C")
            {
                DivCategory.Visible = true;
                DivDistrict.Visible = false;

                ds = obj.GetOISFAppDetails("OPR1", "", "", "", "", "", "", "", "", "", "");

                ChartCategory.DataSource = ds.Tables[0];

                ChartCategory.Series["Series1"].XValueMember = "Type";

                ChartCategory.Series["Series2"].XValueMember = "Qual";
                ChartCategory.Series["Series3"].XValueMember = "DisQual";

                ChartCategory.Series["Series4"].XValueMember = "Abs";


                ChartCategory.Series["Series1"].YValueMembers = "Appeared";
                ChartCategory.Series["Series1"].SmartLabelStyle.Enabled = false;
                ChartCategory.Series["Series1"].LegendText = "Appeared";
                ChartCategory.Series["Series2"].YValueMembers = "Qualify";
                ChartCategory.Series["Series2"].SmartLabelStyle.Enabled = false;
                ChartCategory.Series["Series2"].LegendText = "Qualify";
                ChartCategory.Series["Series3"].YValueMembers = "Disqualify";
                ChartCategory.Series["Series3"].SmartLabelStyle.Enabled = false;
                ChartCategory.Series["Series3"].LegendText = "Disqualify";
                ChartCategory.Series["Series4"].YValueMembers = "Absent";
                ChartCategory.Series["Series4"].SmartLabelStyle.Enabled = false;
                ChartCategory.Series["Series4"].LegendText = "Absent";


                ChartCategory.Legends.Add(new Legend("Legend2"));



                ChartCategory.DataBind();


                foreach (Series charts in ChartCategory.Series)
                {

                    charts.LabelAngle = -90;
                    foreach (DataPoint point in charts.Points)
                    {

                        if (charts.Name == "Series1")
                        {
                            point.Label = string.Format("{0:0} - {1}", point.YValues[0], "Appeared");

                        }
                        else
                        {
                            point.Label = string.Format("{0:0} - {1}", point.YValues[0], point.AxisLabel);
                        }




                    }
                }
            }
            if (drpSelectType.SelectedValue.ToUpper() == "D")
            {
                DivDistrict.Visible = true;
                DivCategory.Visible = false;
                ds = obj.GetOISFAppDetails("OPR2", "", "", "", "", "", "", "", "", "", "");

                chartDistrict.DataSource = ds.Tables[0];

                chartDistrict.Series["Series11"].XValueMember = "Type";

                chartDistrict.Series["Series21"].XValueMember = "Qual";
                chartDistrict.Series["Series31"].XValueMember = "DisQual";

                chartDistrict.Series["Series41"].XValueMember = "Abs";
 

            chartDistrict.Series["Series11"].YValueMembers = "Appeared";
                chartDistrict.Series["Series11"].SmartLabelStyle.Enabled = false;
                chartDistrict.Series["Series11"].LegendText = "Appeared";
                chartDistrict.Series["Series21"].YValueMembers = "Qualify";
                chartDistrict.Series["Series21"].SmartLabelStyle.Enabled = false;
                chartDistrict.Series["Series21"].LegendText = "Qualify";
                chartDistrict.Series["Series31"].YValueMembers = "Disqualify";
                chartDistrict.Series["Series31"].SmartLabelStyle.Enabled = false;
                chartDistrict.Series["Series31"].LegendText = "Disqualify";
                chartDistrict.Series["Series41"].YValueMembers = "Absent";
                chartDistrict.Series["Series41"].SmartLabelStyle.Enabled = false;
                chartDistrict.Series["Series41"].LegendText = "Absent";


                chartDistrict.Legends.Add(new Legend("Legend21"));


            chartDistrict.ChartAreas["ChartArea11"].AxisX.LabelStyle.Interval = 1;


                chartDistrict.DataBind();


                foreach (Series charts in chartDistrict.Series)
                {

                    charts.LabelAngle = -90;
                    foreach (DataPoint point in charts.Points)
                    {

                        if (charts.Name == "Series11")
                        {
                            point.Label = string.Format("{0:0} - {1}", point.YValues[0], "Appeared");

                        }
                        else
                        {
                            point.Label = string.Format("{0:0} - {1}", point.YValues[0], point.AxisLabel);
                        }




                    }
                }
            }
        }

        protected void Unnamed1_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindChart();
        }
    }
}