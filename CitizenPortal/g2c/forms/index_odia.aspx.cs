using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.g2c.forms
{
    public partial class index_odia : System.Web.UI.Page
    {
        GetCountBLL m_GetcountBLL = new GetCountBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = m_GetcountBLL.Getcount();
            lblDepartment.Text = dt.Rows[0]["Department"].ToString();
            lblServices.Text = dt.Rows[0]["Services"].ToString();
            lblTrasation.Text = dt.Rows[0]["Transation"].ToString();
            lblHabisha.Text = dt.Rows[0]["Habisha"].ToString();
        }
    }
}