using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Forms
{
    public partial class ApplicationStatus : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtAppID.Text == "") {
                string t_Script;
                string m_Message = "Please enter Reference ID";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='/WebApp/Kiosk/Forms/ApplicationStatus.aspx';", true);

                return;
            }
            string m_AppID, m_ServiceID, t_PayFlag="";
            ApplicationStatusBLL t_ApplicationStatusBLL = new ApplicationStatusBLL();

            m_AppID = txtAppID.Text.Trim();
            //m_ServiceID = Request.QueryString["SvcID"].ToString();


            DataSet dt = t_ApplicationStatusBLL.TrackApplication(m_AppID);

            if (dt.Tables[0].Rows.Count > 0)
            {
                DataTable dtApp = dt.Tables[0];                
                DataTable dtTransDetail = dt.Tables[1];
                DataTable dtWorkFlow = dt.Tables[2];

                lblTokenNo.Text = dtApp.Rows[0]["AppID"].ToString();
                lblAppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["CreatedOn"].ToString()).ToString("dd/MM/yyyy");
                lblAppFor.Text = dtApp.Rows[0]["ServiceName"].ToString();
                lblAppName.Text = dtApp.Rows[0]["AppName"].ToString();
                t_PayFlag = dtApp.Rows[0]["PayFlag"].ToString();
                m_ServiceID = dtApp.Rows[0]["ServiceID"].ToString();
                if (t_PayFlag == "Y")
                {
                    if (dtTransDetail.Rows.Count != 0)
                    {
                        trpay.Attributes.Add("style", "display:");
                        trpay1.Attributes.Add("style", "display:");
                        lblPayStatus.Text = "Paid";
                        lblTrnID.Text = dtTransDetail.Rows[0]["TrnID"].ToString();
                        lblTrnDate.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy");
                        lblTotalAmount.Text = dtTransDetail.Rows[0]["total"].ToString();
                        lblAmtWord.Text = dtTransDetail.Rows[0]["AmtInText"].ToString();
                    }
                    else
                    {
                        trpay.Attributes.Add("style", "display:none");
                        trpay1.Attributes.Add("style", "display:none");
                    }
                }
                else {
                    lblPayStatus.Text = "Unpaid";
                    trpay.Attributes.Add("style", "display:none");
                    trpay1.Attributes.Add("style", "display:none");
                }

                lblStatus.Text = dtWorkFlow.Rows[0]["status"].ToString();
                lblActionDate.Text = Convert.ToDateTime(dtWorkFlow.Rows[0]["ModifiedOn"].ToString()).ToString("dd/MM/yyyy");
                lblRemarks.Text = dtWorkFlow.Rows[0]["Remarks"].ToString();
                try { QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID); }
                catch { }
                divStatus.Attributes.Add("style", "display:block");
                divApp.Attributes.Add("style", "display:none");
            }
            else
            {
                error.InnerText = "Record Not Found.";
                divStatus.Attributes.Add("style", "display:none");
                divApp.Attributes.Add("style", "display:block");
                string m_Message = "No record found, please enterr valid Reference ID";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='/WebApp/Kiosk/Forms/ApplicationStatus.aspx';", true);

                return;
            }
        }

    }
}