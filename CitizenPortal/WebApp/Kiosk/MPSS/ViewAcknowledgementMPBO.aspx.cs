using System;
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
using sun.net.www.content.image;

namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class ViewAcknowledgementMPBO : System.Web.UI.Page
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
            gv.PageIndexChanging += gv_PageIndexChanged;
            gv.AllowPaging = true;
            gv.PageSize = 50;




            pnl.Controls.Add(gv);
        }

        protected void gv_PageIndexChanged(object sender, GridViewPageEventArgs e)
        {
            gv.PageIndex = e.NewPageIndex;
            gv.DataSource = ViewState["Paging"];
            gv.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
           

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
            if (i >= 0)
            {
                string appID = dt.Rows[i]["APPID"].ToString();
                string newWin = "";
                newWin = "window.open(\"AcknowledgementMPBOC.aspx?AppID=" + appID + "&SvcID=2465\", \"_blank\", \"WIDTH=1080,HEIGHT=790,scrollbars=no, menubar=no,resizable=yes,directories=no,location=no\");";

                Page.ClientScript.RegisterStartupScript(this.GetType(), "pop", newWin, true);
            }

        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = ShowData();
                gv.DataSource = dt;
                ViewState["CurrentTable"] = dt;
                ViewState["Paging"] = dt;
                gv.DataBind();
            }

            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);



            }
        }
        protected DataTable ShowData()
        {
            DataTable dt = new DataTable();
            SqlParameter[] parameter = {
                 new SqlParameter("@SamagraNo", txtSamagraNo.Text),
                  new SqlParameter("@Birthdate", txtBirthdate.Text),
                 new SqlParameter("@AppID", txtApplicationID.Text),
                  new SqlParameter("@RegNo", txtRegNo.Text),
                 new SqlParameter("@SvcID", "2465")
            };

            dt = sqlhelper.ExecuteDataTable("GetAcknowReport", parameter);

            return dt;
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebApp/Kiosk/MPSS/MPSOSPage.aspx");
        }
    }
}