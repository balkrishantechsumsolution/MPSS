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
    public partial class ActiveServices : System.Web.UI.UserControl
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
            t_DS = m_G2GDashboardBLL.GetActivityCSVTU(UserID,"","","","4","");
            DataTable t_DT = t_DS.Tables[0];
            divActivity.Controls.Clear();
            if (t_DT.Rows.Count > 0)
            {
                divActivity.Controls.Add(new LiteralControl("<table class='tblActivity table table-bordered' cellpadding='10' style='width: 100 %; margin: 5px auto;'>"));
                divActivity.Controls.Add(new LiteralControl("<tr>"));
                divActivity.Controls.Add(new LiteralControl("<th>Status</th>"));
                divActivity.Controls.Add(new LiteralControl("<th>Activity</th>"));
                //divActivity.Controls.Add(new LiteralControl("<th>Start Date</th>"));
                divActivity.Controls.Add(new LiteralControl("<th>End Date</th>"));
                divActivity.Controls.Add(new LiteralControl("<th>Semester</th>"));
                divActivity.Controls.Add(new LiteralControl("<th>ExamYear</th>"));
                divActivity.Controls.Add(new LiteralControl("</tr>"));

                for (int i = 0; i < t_DT.Rows.Count; i++)
                {   
                    //divActivity.Controls.Add(new LiteralControl("<div class='SrvDiv' id='" + t_DT.Rows[i]["MenuID"].ToString() + "' runat='server'>"));
                    //divActivity.Controls.Add(new LiteralControl("<a href='" + t_DT.Rows[i]["Url"].ToString() + "' target='_blank'>"));
                    //divActivity.Controls.Add(new LiteralControl("<img alt='' align='left' />"));
                    //divActivity.Controls.Add(new LiteralControl("<b>" + t_DT.Rows[i]["MenuName"].ToString() + "</b><br />"));
                    //divActivity.Controls.Add(new LiteralControl("<span>" + t_DT.Rows[i]["ToolTip"].ToString() + "</span>"));
                    //divActivity.Controls.Add(new LiteralControl("</a>"));
                    //divActivity.Controls.Add(new LiteralControl("</div>"));


                    divActivity.Controls.Add(new LiteralControl("<tr>"));
                    divActivity.Controls.Add(new LiteralControl("<td style='color:"+ t_DT.Rows[i]["Status"].ToString() + ";font-weight:bold;'>" + t_DT.Rows[i]["IsActive"].ToString() + "</td>"));
                    divActivity.Controls.Add(new LiteralControl("<td style='width:120px'>"));
                    divActivity.Controls.Add(new LiteralControl("<a href='" + t_DT.Rows[i]["Url"].ToString() + "' target='_blank' alt='" + t_DT.Rows[i]["AtivityToolTip"].ToString() + "'>"));
                    divActivity.Controls.Add(new LiteralControl(t_DT.Rows[i]["ActivityName"].ToString()));
                    divActivity.Controls.Add(new LiteralControl("</a>"));
                    divActivity.Controls.Add(new LiteralControl("</td>"));
                    //divActivity.Controls.Add(new LiteralControl("<td>" + t_DT.Rows[i]["StartDate"].ToString() + "</td>"));
                    divActivity.Controls.Add(new LiteralControl("<td>" + t_DT.Rows[i]["EndDate"].ToString() + "</td>"));
                    divActivity.Controls.Add(new LiteralControl("<td>" + t_DT.Rows[i]["Semester"].ToString() + "</td>"));
                    divActivity.Controls.Add(new LiteralControl("<td>" + t_DT.Rows[i]["ExamYear"].ToString() + "</td>"));
                    divActivity.Controls.Add(new LiteralControl("</tr>"));
                    
                }
                divActivity.Controls.Add(new LiteralControl("</table>"));
            }
        }
    }
}

//RowID MenuID  StartDate EndDate Semester     ActivityName AtivityToolTip  URL