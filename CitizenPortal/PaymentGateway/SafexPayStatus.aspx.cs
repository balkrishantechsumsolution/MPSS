using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.PaymentGateway
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        ConfirmPaymentBLL m_ConfirmPaymentBLL = new ConfirmPaymentBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable result = m_ConfirmPaymentBLL.CheckSafexPayStatus(AppID, OrderNo, agRef, pgRef, txnDate, Amount);

            DataTable result = m_ConfirmPaymentBLL.InsertSafeXWebhokResponse(AppID, OrderNo, agRef, pgRef, txnDate, Amount);
            if (result.Rows[0].ToString() == "Sucecess")
            {
                status = "Sucess";
            }
            else { status = "Fail"; }
        }
    }
}