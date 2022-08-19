using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.BLL;
using System.Data;

namespace CitizenPortal.WebApp.G2G.BulkPayment
{
    public partial class Acknowledgement : System.Web.UI.Page
    {
        string m_AppID, m_ServiceID;

        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();

        protected void BtnNext_Click(object sender, EventArgs e)
        {
            //Session["HomePage"].ToString()
            Response.Redirect("/WebApp/Examination/OffLineExamForm.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            if (Request.QueryString["PayFlag"] == null)
            {
                DivNext.Visible = false;
                DivPrint.Visible = true;
            }
            else
            {
                DivNext.Visible = true;
                DivPrint.Visible = false;
            }

            DataSet dt = m_G2GDashboardBLL.GetBulkBatchDetails(m_ServiceID, m_AppID);

            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[2];
            DataTable dtAmountDetail = dt.Tables[3];
            DataTable dtGrid = dt.Tables[1];
            if (dtGrid.Rows.Count != 0)
            {
                grdView.DataSource = dtGrid;
                grdView.DataBind();
            }

            if (dt.Tables[0].Rows.Count != 0)
            {
                lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
                AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"]).ToString("dd/MM/yyyy HH:mm:ss");

                lblCertificateName.Text = dtApp.Rows[0]["ServiceName"].ToString();
                lblDeptName.InnerHtml = dtApp.Rows[0]["DepartmentName"].ToString();

                lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
                lblCollegeName.Text = dtApp.Rows[0]["CollegeName"].ToString();
                lblDEOName.Text = dtApp.Rows[0]["CreatedBy"].ToString();

                if (dtTransDetail != null && dtTransDetail.Rows.Count > 0)
                {
                    lblTrnsID.InnerHtml = dtTransDetail.Rows[0]["TrnID"].ToString();
                    lblTranDate.Text = dtTransDetail.Rows[0]["TransactionDate"].ToString();
                    lblTranID.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy HH:mm:ss");
                    lblPayMode.Text = dtTransDetail.Rows[0]["PayMode"].ToString();
                    lblTotalFee.Text = dtTransDetail.Rows[0]["total"].ToString();
                    lblAmtWord.Text = dtTransDetail.Rows[0]["AmtInText"].ToString();
                }

                if (dtAmountDetail != null && dtAmountDetail.Rows.Count > 0)
                {
                    lblPayMode.Text = dtAmountDetail.Rows[0]["PayStatus"].ToString();
                    lblAppFee.Text = dtAmountDetail.Rows[0]["Amount"].ToString();
                }
                try
                {

                    QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);

                }
                catch { }

            }
            else
            { QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID); }
        }
    }
}