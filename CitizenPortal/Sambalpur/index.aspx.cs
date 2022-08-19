using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.Sambalpur
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            //BindGrid();
        }
        public void BindGrid()
        {
            MigrationSUBLL m_MigrationSUBLL = new MigrationSUBLL();
            DataTable dt = m_MigrationSUBLL.GetCBCAServices("");
            grdView1.DataSource = dt;

            grdView1.DataBind();

        }
        protected void grdView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                int i = 0;
                HtmlAnchor t_Anchor = null;

                t_Anchor = null;

                //-------------------------------//
                i = 4;

                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "TakeAction_" + e.Row.RowIndex;

                t_Anchor.InnerHtml = "Apply";

                t_Anchor.Attributes.Add("onclick", "TakeAction('', 'GUEST')");

                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[i].Controls.Add(t_Anchor);
                e.Row.Cells[i].Attributes.Add("Title", "Apply");
                e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                t_Anchor = null;



            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {
                //e.Row.Cells[8].Attributes.Add("style", "display:none");
                //e.Row.Cells[9].Attributes.Add("style", "display:none");

            }
        }
    }
}