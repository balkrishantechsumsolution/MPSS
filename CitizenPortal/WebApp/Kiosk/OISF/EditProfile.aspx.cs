using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.OISF
{
    public partial class EditProfile : BasePage
    {
        OISFBLL m_OISFBLL = new OISFBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            if (!IsPostBack)
            {
                divErr.Style.Add("display", "none");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DataSet t_Result = null;

            //int result = 0;

            try
            {
                t_Result = m_OISFBLL.SubmitPayment(m_ServiceID, m_AppID, Session["CitizenID"].ToString(), "Citizen", "");

                if (t_Result != null && t_Result.Tables[0].Rows.Count > 0)
                {
                    if (t_Result.Tables[0].Rows[0]["Result"].ToString() == "1")
                    {
                        //btnSubmit.Visible = false;

                        divErr.InnerHtml = "Payment Done Successfully !! Transaction ID is " + t_Result.Tables[0].Rows[0]["TrnID"].ToString();
                        divErr.Attributes.Add("class", "success");
                        divErr.Style.Add("display", "");
                    }
                }
            }
            catch (Exception ex)
            {
                //btnSubmit.Visible = false;
                divErr.InnerHtml = ex.Message;
                divErr.Style.Add("display", "");
                divErr.Attributes.Add("class", "error");
            }

        }

        protected void btnHome_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("/WebApp/Kiosk/OISF/OISFHome.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID +
                              "&UID=" + Session["CitizenID"].ToString());
        }
    }
}