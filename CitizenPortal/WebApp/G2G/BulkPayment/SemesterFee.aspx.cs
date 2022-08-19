using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.BLL;
using System.Data;
using System.Text;

namespace CitizenPortal.WebApp.G2G.BulkPayment
{
    public partial class SemesterFee : System.Web.UI.Page
    {
        string m_AppID, m_ServiceID, m_RollNo;

        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        string m_College = "", m_ExamYear = "", m_ExamType = "", m_BranchCode = "", m_Status = "", m_Semester = "";
        string AppID = "", PortalFee = "", OtherCharges = "", ExamFee = "", LateFee = "";
        protected void BtnNext_Click(object sender, EventArgs e)
        {
            GenerateBatch(AppID, PortalFee, OtherCharges, ExamFee, LateFee);

            //Response.Redirect("/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["RollNo"] == null) return;
            m_RollNo = Request.QueryString["RollNo"].ToString();
            m_College = Request.QueryString["College"].ToString();
            m_ExamType = Request.QueryString["Type"].ToString();
            m_BranchCode = Request.QueryString["Branch"].ToString();
            m_Status = Request.QueryString["Flag"].ToString();
            m_Semester = Request.QueryString["Semester"].ToString();
            m_ExamYear = Request.QueryString["Year"].ToString();

            DataTable t_dt = null;
            t_dt = m_G2GDashboardBLL.GetStudentData_BulkPayment(m_College, m_ExamType, m_BranchCode, m_Status, m_RollNo, m_Semester);

            if (t_dt.Rows.Count > 0)
            {
                lblName.Text = t_dt.Rows[0]["Name"].ToString();
                lblRollNo.Text = t_dt.Rows[0]["RollNo"].ToString();
                lblSemester.Text = m_Semester;
                lblExam.Text = Request.QueryString["Year"].ToString() + " (" + Request.QueryString["Type"].ToString() + ")";
                HdfAppID.Value = t_dt.Rows[0]["AppID"].ToString();

                
                AppID = t_dt.Rows[0]["AppID"].ToString();
                PortalFee = t_dt.Rows[0]["PortalFee"].ToString();
                OtherCharges = t_dt.Rows[0]["OtherCharges"].ToString();
                ExamFee = t_dt.Rows[0]["ExamFees"].ToString();
                LateFee = t_dt.Rows[0]["LateFeeAmount"].ToString();

                DataGridView.DataSource = t_dt;
                DataGridView.DataBind();

                lblCertificateName.Text = "+3 CBCS Semester Examination Fees for " + m_Semester + "-" + m_ExamYear + " (" + m_ExamType + ")";
                if (t_dt.Rows[0]["PayFlag"].ToString() == "N")
                {
                    tblTrans.Visible = false;
                    btnPrint.Visible = false;
                    BtnNext.Visible = true;

                }
                else {
                    tblTrans.Visible = true;
                    btnPrint.Visible = true;
                    BtnNext.Visible = false;
                }
            }
            else
            {
            }
            /*
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

            */
        }

        private void GenerateBatch(string AppID, string PortalFee, string OtherCharges, string ExamFee, string LateFee)
        {
            try
            {
                string Service = "0";
                string BranchName = "";
                string ExamType = "";
                string Semester = "";

                DataTable dt = new DataTable();

                BranchName = m_BranchCode;
                ExamType = m_ExamType;
                Semester = m_Semester;

                if (ExamType == "Regular")
                {
                    Service = "1457";
                }
                else if (ExamType == "Back")
                {
                    Service = "1451";
                }

                StringBuilder sb = new StringBuilder();
                
                sb.AppendLine("<BatchData>");
                sb.AppendLine("<Data>");
                sb.AppendLine("<SvcID>" + Service + "</SvcID>");
                sb.AppendLine("<AppID>" + AppID + "</AppID>");
                sb.AppendLine("<PortalFee>" + PortalFee + "</PortalFee>");
                sb.AppendLine("<OtherCharges>" + OtherCharges + "</OtherCharges>");
                sb.AppendLine("<ExamFee>" + ExamFee + "</ExamFee>");
                sb.AppendLine("<LateFee>" + LateFee + "</LateFee>");
                sb.AppendLine("</Data>");
                sb.AppendLine("</BatchData>");

                if (sb.Length > 0)
                {
                    dt = m_G2GDashboardBLL.GenerateBatch_BulkPay(sb.ToString(), "Payment by Student", Service, Convert.ToString(Session["LoginID"]), BranchName, ExamType, Semester, m_ExamYear);
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        if (dt.Rows[0]["Result"].ToString() == "1")
                        {
                            Response.Redirect("/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=" + dt.Rows[0]["ServiceID"].ToString() + "&AppID=" + dt.Rows[0]["AppID"].ToString());
                        }
                        else
                        {
                            Response.Write("<script>alert('Selected Application batch already generated please check with Batch NO. " + dt.Rows[0]["BatchID"].ToString() + " !.')</script>");
                        }
                    }

                }
                
            }
            catch (Exception ex)
            {
                Response.Write("<script type=text/javascript>alert('Please try later \n.error log--" + ex.Message + "----')</script>");
            }
        }

        protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {
                //e.Row.Cells[0].Attributes.Add("style", "display:none");
            }
        }
    }
}