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
    public partial class AdmitCardViewPage : System.Web.UI.Page
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
            if (Request["hfSamagraNo"] != null)
            {
                

                hfSamagraNo.Value = Request["hfSamagraNo"].ToString();
                hfBirthdate.Value = Request["hfBirthdate"].ToString();
                hfApplicationID.Value = Request["hfApplicationID"].ToString();
                hfRegNo.Value = Request["hfRegNo"].ToString();
            }
            BindGrid();
        }

        public void BindGrid()
        {
            try
            {
                DataTable dt = new DataTable();

                //hfSamagraNo.Value = txtSamagraNo.Text;
                //hfBirthdate.Value = txtBirthdate.Text;
                //hfApplicationID.Value = txtApplicationID.Text;
                //hfRegNo.Value = txtRegNo.Text;

                string SamagraNo = hfSamagraNo.Value;
                string Birthdate = hfBirthdate.Value;
                string ApplicationID = hfApplicationID.Value;
                string RegNo = hfRegNo.Value;

               
                    SqlParameter[] parameter = {
                     new SqlParameter("@SamagraNo", SamagraNo.ToString()),
                     new SqlParameter("@Birthdate",Birthdate.ToString()),
                     new SqlParameter("@AppID", ApplicationID.ToString()),
                     new SqlParameter("@RegNo",RegNo.ToString()),
                     new SqlParameter("@SvcID", "2465")
                };

                    dt = sqlhelper.ExecuteDataTable("GetAdmitCardViewPageSP", parameter);

                    gv.DataSource = dt;
                    ViewState["CurrentTable"] = dt;
                    ViewState["Paging"] = dt;
                    ViewState["Paging"] = dt;
                    gv.DataBind();
                }

            



            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);



            }
        }
        protected void gv_PageIndexChanged(object sender, GridViewPageEventArgs e)
        {
            gv.PageIndex = e.NewPageIndex;
            gv.DataSource = ViewState["Paging"];
            gv.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            hfSamagraNo.Value = txtSamagraNo.Text;
            hfBirthdate.Value = txtBirthdate.Text;
            hfApplicationID.Value = txtApplicationID.Text;
            hfRegNo.Value = txtRegNo.Text;

        }

        void gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowType != DataControlRowType.Header && e.Row.RowType != DataControlRowType.Footer)
            {
                TableCell cell = e.Row.Cells[e.Row.Cells.Count - 1];

                string PaymentMode = cell.Text;

                LinkButton lb = new LinkButton();
                lb.ID = "Attachment";
                lb.Text = "View";
                lb.Command += lb_Command;

                lb.ToolTip = "Attachment";
                lb.CssClass = "tagBubbleAttachment";
                lb.CommandName = "Attachment";
                lb.CommandArgument = e.Row.RowIndex.ToString();

                //e.Row.Cells[e.Row.Cells.Count - 1].Controls.Add(lb);
                e.Row.Cells[1].Controls.Add(lb);
            }



        }

        void gv_RowCreated(object sender, GridViewRowEventArgs e)
        {



        }



        void lb_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Attachment")
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];

                var lb = (LinkButton)sender;
                var i = int.Parse(lb.CommandArgument);
                if (i >= 0)
                {
                    string AppID = dt.Rows[i]["AppID"].ToString();
                    string newWin = "";
                    newWin = "window.open(\"AdmitCardMPSOS.aspx?AppID=" + AppID + "&SvcID=2465\", \"_blank\", \"WIDTH=1080,HEIGHT=790,scrollbars=no, menubar=no,resizable=yes,directories=no,location=no\");";

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "pop", newWin, true);
                }
            }

        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            hfSamagraNo.Value = txtSamagraNo.Text;
            hfBirthdate.Value = txtBirthdate.Text;
            hfApplicationID.Value = txtApplicationID.Text;
            hfRegNo.Value = txtRegNo.Text;

            BindGrid();
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebApp/Kiosk/MPSS/MPSOSPage.aspx");
        }
    }
}