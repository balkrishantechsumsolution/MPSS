using Microsoft.Owin;
using SqlHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.DataVisualization.Charting;
using System.Text;
using System.Web.UI.HtmlControls;
using javax.swing.text.html;
using DocumentFormat.OpenXml.Bibliography;

namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class MISReports : System.Web.UI.Page
    {
        static data sqlhelper = new data();
        private GridView gv;
        int i = 0;
        protected void Page_Init(object sender, EventArgs e)
        {
            i = 0;
            gv = new GridView();
            
            gv.ID = "gv";
            gv.AutoGenerateColumns = true;
            gv.Columns.Add(new TemplateField());
            gv.RowCreated += gv_RowCreated;
            gv.RowDataBound += gv_RowDataBound;
            gv.AllowPaging = true;
            gv.PageSize= 50;


            pnl.Controls.Add(gv);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            };
               
        }

        void gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.DataItem != null)
            {
               
            }




        }

        void gv_RowCreated(object sender, GridViewRowEventArgs e)
        {
           

            LinkButton lb = new LinkButton();
                lb.ID = "View";
                lb.Text = "View";
                lb.Click += lb_Click;

                lb.ToolTip = "View";
                lb.CssClass = "tagBubbleView";
                lb.CommandName = "View";
                lb.CommandArgument = e.Row.RowIndex.ToString();

            //e.Row.Cells[e.Row.Cells.Count - 1].Controls.Add(lb);
            e.Row.Cells[0].Controls.Add(lb);
          
          
        }



        void lb_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)ViewState["CurrentTable"];

            var lb = (LinkButton)sender;
                var i = int.Parse(lb.CommandArgument);
                string appID = dt.Rows[i]["APPID"].ToString(); ;
                string newWin = "";
                newWin = "window.open(\"AcknowledgementMPBOC.aspx?AppID=" + appID + "&SvcID=2465\", \"_blank\", \"WIDTH=1080,HEIGHT=790,scrollbars=no, menubar=no,resizable=yes,directories=no,location=no\");";

                Page.ClientScript.RegisterStartupScript(this.GetType(), "pop", newWin, true);
          
        }
        protected DataTable ShowData()
        {
            DataTable dt = new DataTable();
            SqlParameter[] parameter = {
                 new SqlParameter("@AppID", txtApplicationID.Text),
                  new SqlParameter("@RegNo", txtRegNo.Text),
                 new SqlParameter("@SvcID", "2465")
            };

            dt = sqlhelper.ExecuteDataTable("studentMISReport", parameter);

            return dt;
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            try
            {
                DataTable dt = new DataTable();
                dt = ShowData();
                 ViewState["CurrentTable"] = dt;  
                gv.DataSource = dt;
                gv.DataBind();
            }

            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);



            }


        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            ExportGridToExcel();
        }
        private void ExportGridToExcel()
        {
            DataTable dt = new DataTable();
            dt = ShowData();
            string attachment = "attachment; filename=DB.xls";
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/vnd.ms-excel";
            string tab = "";
            foreach (DataColumn dc in dt.Columns)
            {
                Response.Write(tab + dc.ColumnName);
                tab = "\t";
            }
            Response.Write("\n");
            int i;
            foreach (DataRow dr in dt.Rows)
            {
                tab = "";
                for (i = 0; i < dt.Columns.Count; i++)
                {
                    Response.Write(tab + dr[i].ToString());
                    tab = "\t";
                }
                Response.Write("\n");
            }
            Response.End();
        }

        
    }
}