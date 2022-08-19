using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System.Data;

namespace CitizenPortal.WebApp.Kiosk.Forms
{
    public partial class MakePayment :  BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                divErr.Style.Add("display", "none");

                ConfirmPaymentBLL t_ConfirmPaymentBLL = new ConfirmPaymentBLL();

                string t_KioskID= HttpContext.Current.Session["KioskID"].ToString();
                
                DataTable t_DT = t_ConfirmPaymentBLL.GetServiceToPayAtCSC(t_KioskID);

                ddlService.DataTextField = "ServiceName";
                ddlService.DataValueField = "ServiceID";
                ddlService.DataSource = t_DT;
                ddlService.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string m_SvcID, m_AppID;
            ConfirmPaymentBLL t_ConfirmPaymentBLL = new ConfirmPaymentBLL();

            m_SvcID = m_AppID = "";

            m_SvcID = ddlService.SelectedItem.Value;
            m_AppID = txtAppID.Text;
            try
            {

                DataTable t_DT = t_ConfirmPaymentBLL.VerifyApplication(m_SvcID, m_AppID);

                if (t_DT != null && t_DT.Rows.Count > 0)
                {
                    if (t_DT.Rows[0]["Result"].ToString() == "1")
                    {
                        Response.Redirect("Attachment.aspx?SvcID=" + m_SvcID + "&AppID=" + m_AppID);

                    }
                    else
                    {
                        divErr.InnerHtml = "Invalid Application Details";
                        divErr.Style.Add("display", "");
                        divErr.Attributes.Add("class", "error");

                    }

                }
            }
            catch (Exception ex)
            {
                divErr.InnerHtml = ex.Message;
                divErr.Style.Add("display", "");
                divErr.Attributes.Add("class", "error");
            }

        }
    }
}