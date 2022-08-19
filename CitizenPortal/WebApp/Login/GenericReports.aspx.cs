using System;
using System.Data;
using CitizenPortalLib.BLL;
using System.Web.UI.WebControls;
namespace CitizenPortal.WebApp.Login
{
    public partial class GenericReports : System.Web.UI.Page
    {
        KioskRegistrationBLL m_KioskRegistrationBLL = new KioskRegistrationBLL();

        string ReptId = null;
        string ReptSpNam = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ReportID"] == null)
            {
                DataGridView.DataBind();
                return;
            }

            if (Request.QueryString["ReportID"].ToString() == "")
            {
                DataGridView.DataBind();
                return;
            }

            ReptId = Request.QueryString["ReportID"].ToString();

            DataTable dt = new DataTable();
            dt = m_KioskRegistrationBLL.GetReportSpName(ReptId);

            if (dt.Rows.Count == 0)
            {
                DataGridView.DataBind();
                //string mm;
                //mm = @"<style>.sorting_asc{display:none!important;}</style>";
                //DataGridView.Style.Add("sorting_asc", "display:none");
                //DataGridView.Style.Add(@"<style type='text/css'>.sorting_asc{display:none!important;}</style>","");
                //DataGridView.Attributes.Add("style", ".sorting_asc:display: none;");
                //DataGridView.Attributes.Add("style", "display: none;");
                //DataGridView.CssClass = mm.ToString();
                return;
            }

            ReptId = dt.Rows[0]["ReportId"].ToString();
            ReptSpNam = dt.Rows[0]["ReportSpName"].ToString();

            dt = m_KioskRegistrationBLL.GetReportList(ReptId, ReptSpNam);

            DataGridView.DataSource = dt;
            int i;

            for (i = 0; i < dt.Columns.Count; i++)
            {
                BoundField ColName = new BoundField();
                ColName.DataField = dt.Columns[i].ToString();
                ColName.HeaderText = dt.Columns[i].ToString();
                DataGridView.Columns.Add(ColName);
                ColName = null;
            }
            DataGridView.DataBind();
        }
        protected void DataGridView_PreRender(object sender, EventArgs e)
        {
            if (DataGridView.Rows.Count > 0)
            {
                DataGridView.UseAccessibleHeader = true;
                DataGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
                DataGridView.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }
    }
}