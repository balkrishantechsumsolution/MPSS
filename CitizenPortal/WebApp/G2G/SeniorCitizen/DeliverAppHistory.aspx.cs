using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CitizenPortalLib.BLL;

namespace CitizenPortal.WebApp.G2G.SeniorCitizen
{
    public partial class DeliverAppHistory : System.Web.UI.Page
    {
        SeniorCitizenBLL m_SeniorCitizenBLL = new SeniorCitizenBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString.ToString() != "")
                {
                    BindHistoryData(Request.QueryString["AppId"].ToString());
                }
            }
        }

        public void BindHistoryData(string AppID)
        {
            try
            {
                DataSet ds = new DataSet();
                ds = m_SeniorCitizenBLL.GetSeniorCitizenDeliverHistory(AppID);
                DataTable dt = ds.Tables[0];
                if (dt!=null && dt.Rows.Count > 0)
                {
                    grdView.DataSource = dt;
                    grdView.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    grdView.DataSource = dt;
                    grdView.DataBind();
                    int columncount = grdView.Rows[0].Cells.Count;
                    grdView.Rows[0].Cells.Clear();
                    grdView.Rows[0].Cells.Add(new TableCell());
                    grdView.Rows[0].Cells[0].ColumnSpan = columncount;
                    grdView.Rows[0].Cells[0].Text = "No Records Found For Search Application !";
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}