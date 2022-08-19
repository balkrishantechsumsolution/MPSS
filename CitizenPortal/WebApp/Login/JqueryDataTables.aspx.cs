using System;
using System.Data;
using CitizenPortalLib.BLL;
using System.Web.UI.WebControls;
namespace CitizenPortal.WebApp.Login
{
    public partial class JqueryDataTables : System.Web.UI.Page
    {
        KioskRegistrationBLL m_KioskRegistrationBLL = new KioskRegistrationBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = null;
            dt = m_KioskRegistrationBLL.GetCSCCenterList();
            DataGridView.DataSource = dt;
            int i;
            
            for (i = 0; i < dt.Columns.Count; i++)
            {
                BoundField test = new BoundField();
                test.DataField = dt.Columns[i].ToString();
                test.HeaderText = dt.Columns[i].ToString();
                DataGridView.Columns.Add(test);
                test = null;
            }
            DataGridView.DataBind();
        }

        protected void DataGridView_PreRender(object sender, EventArgs e)
        {
            if (DataGridView.Rows.Count > 0)
            {
                //This replaces <td> with <th> and adds the scope attribute
                DataGridView.UseAccessibleHeader = true;

                //This will add the <thead> and <tbody> elements
                DataGridView.HeaderRow.TableSection = TableRowSection.TableHeader;

                //This adds the <tfoot> element. 
                //Remove if you don't have a footer row
                DataGridView.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }

    }
}