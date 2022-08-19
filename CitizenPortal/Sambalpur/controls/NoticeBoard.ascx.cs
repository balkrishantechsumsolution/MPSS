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
    public partial class NoticeBoard : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindNotice();
        }

        private void BindNotice()
        {
            string LoginID = "";
            
            LoginID = Session["LoginID"].ToString();

            CBCSAdmissionFormBLL objBLL = new CBCSAdmissionFormBLL();
            DataTable t_DT = objBLL.GetNoticeDetail("", "", "", LoginID);
            divNotice.Controls.Clear();
            if (t_DT.Rows.Count > 0)
            {
                for (int i = 0; i < t_DT.Rows.Count; i++)
                {
                    divNotice.Controls.Add(new LiteralControl("<tr>"));
                    divNotice.Controls.Add(new LiteralControl("<td>" + t_DT.Rows[i]["NoticeNumber"].ToString() + "</td>"));//Serial No
                    divNotice.Controls.Add(new LiteralControl("<td>" + t_DT.Rows[i]["NoticeDate"].ToString() + "</td>"));//Notice Date
                    divNotice.Controls.Add(new LiteralControl("<td>" + t_DT.Rows[i]["NoticeHeading"].ToString() + "</td>"));//Notice Heading
                    divNotice.Controls.Add(new LiteralControl("<td>" + t_DT.Rows[i]["NoticeDetail"].ToString() + "</td>"));//Notce Detail
                    divNotice.Controls.Add(new LiteralControl("</tr>"));

                }
            }

        }
    }
}