using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.ReFundPayment
{
    public partial class RefundPaymentReciept : System.Web.UI.Page
    {
        OUATBLL m_OUATBLL = new OUATBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();
           
            DataSet dt = m_OUATBLL.GetOUATRefundPaymentReciept(m_ServiceID, m_AppID);
            DataTable dtGrid = dt.Tables[1];
            Gridview1.DataSource = dtGrid;
            Gridview1.DataBind();
            DataTable dtApp = dt.Tables[0];
          
            DataTable dtTransDetail = dt.Tables[2];
           
            if (dt.Tables[0].Rows.Count != 0)
            {

                lblservicename.Text = dtApp.Rows[0]["Servicename"].ToString();
                lblApplicantName.Text = dtApp.Rows[0]["AppName"].ToString();

                lblApplicationdate.Text = Convert.ToDateTime(dtApp.Rows[0]["CreatedOn"]).ToString("dd/MM/yyyy HH:mm:ss");
                try
                {

                    QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);

                }
                catch { }

            }

            else
            { QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID); }

           
            if (dt.Tables[2].Rows.Count != 0)
            {
                lblaccountnumber.Text = dtTransDetail.Rows[0]["AccountNumber"].ToString();
                lblaccountholder.Text = dtTransDetail.Rows[0]["NameOfAccountHolder"].ToString();
                lblbankname.Text = dtTransDetail.Rows[0]["BankName"].ToString();
                lblbranch.Text = dtTransDetail.Rows[0]["BankBranch"].ToString();
                lblRefundID.Text = dtTransDetail.Rows[0]["RefundID"].ToString();

            }
           
            else
            { QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID); }




        }
    }
}