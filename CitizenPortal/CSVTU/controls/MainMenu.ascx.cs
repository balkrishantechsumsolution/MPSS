using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.Sambalpur.controls
{
    public partial class MainMenu : System.Web.UI.UserControl
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        string m_UserID = "", m_Role = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginID"].ToString() != null)
            {
                m_UserID = Session["LoginID"].ToString();

            }
            
            GetMenu(m_UserID);
        }

        private void GetMenu(string UserID)
        {
            DataSet t_DS = null;
            t_DS = m_G2GDashboardBLL.GetMainMenu(UserID);
            DataTable t_DT = t_DS.Tables[0];
            divMenu.Controls.Clear();
            if (t_DT.Rows.Count > 0)
            {
                for (int i = 0; i < t_DT.Rows.Count; i++)
                {
                    //divMenu.Controls.Add(new LiteralControl("<div class='col ptop20 pbtm20'>"));
                    //divMenu.Controls.Add(new LiteralControl("<a href='" + t_DT.Rows[i]["Url"].ToString() + "' alt='" + t_DT.Rows[i]["ToolTip"].ToString() + "' class='d-inline-block more_btns'>" + t_DT.Rows[i]["MenuName"].ToString() + "</a>"));
                    //divMenu.Controls.Add(new LiteralControl("</div>"));

                    divMenu.Controls.Add(new LiteralControl("<div class='SrvDiv' id='" + t_DT.Rows[i]["MenuID"].ToString() + "' runat='server'>"));
                    divMenu.Controls.Add(new LiteralControl("<a href='" + t_DT.Rows[i]["Url"].ToString() + "' target='_blank'>"));
                    divMenu.Controls.Add(new LiteralControl("<img alt='' align='left' />"));
                    divMenu.Controls.Add(new LiteralControl("<b>" + t_DT.Rows[i]["MenuName"].ToString() + "</b><br />"));
                    divMenu.Controls.Add(new LiteralControl("<span>" + t_DT.Rows[i]["ToolTip"].ToString() + "</span>"));
                    divMenu.Controls.Add(new LiteralControl("</a>"));
                    divMenu.Controls.Add(new LiteralControl("</div>"));
                }
            }
        }
    }
}