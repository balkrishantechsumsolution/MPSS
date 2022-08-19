using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.OISF
{
    public partial class GrievanceForm : System.Web.UI.Page
    {
        OISFBLL m_OISFBLL = new OISFBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            //if (!IsPostBack) { btnPrint.Visible = false; }

            DataSet dt = m_OISFBLL.OSIFGetGrievanceForm(m_AppID);
            DataTable dtApp = dt.Tables[0];
            //DataTable dtTransDetail = dt.Tables[1];
            if (dtApp.Rows.Count != 0)
            {
                lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
                lblAppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["CreatedOn"]).ToString("dd/MM/yyyy HH:mm:ss");
                lblAppname.Text = dtApp.Rows[0]["FullName"].ToString();
                lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();
                lblMobile.Text = dtApp.Rows[0]["Mobile"].ToString();
                lblEmail.Text = dtApp.Rows[0]["EmailId"].ToString();
                lblDOB.Text = dtApp.Rows[0]["DOB"].ToString();
                lblAge.Text = dtApp.Rows[0]["Age"].ToString() + " years";
                lblCategory.Text = dtApp.Rows[0]["Religion"].ToString() + " (" + dtApp.Rows[0]["Category"].ToString() + ") ";
                //ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfileSign.Src = dtApp.Rows[0]["ImageSign"].ToString();
                if (dtApp.Rows[0]["RollNumber"].ToString() != "")
                    lblRollNo.Text = dtApp.Rows[0]["RollNumber"].ToString();
                else
                    lblRollNo.Text = "-";
                if (dtApp.Rows[0]["CenterName"].ToString() != "")
                    lblVenue.Text = dtApp.Rows[0]["CenterName"].ToString();
                else
                    lblVenue.Text = "Not Assigned";

                if (dtApp.Rows[0]["AllocationTime"].ToString() != "") 
                    lblDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AllocationTime"]).ToString("dd/MM/yyyy");
                else{ 
                    lblDate.Text = "Not Assigned"; lblTime.Text = "Not Assigned";
                }
                m_ServiceID = "388";
                try
                {
                    QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);
                }
                catch { }
            }
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (txtSubject.Text == "" || txtGreivance.Text == "")
            {
                string m_Message = "Please enter Subject and Grievance Details.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }
            
            DataTable t_Result = null;

            //int result = 0;

            try
            {
                t_Result = m_OISFBLL.InsertGrievance(lblAppID.Text, lblRollNo.Text, lblMobile.Text, txtSubject.Text, txtGreivance.Text);

                if (t_Result != null && t_Result.Rows.Count > 0)
                {
                    if (t_Result.Rows[0]["AppID"].ToString() != "")
                    {
                        btnSubmit.Visible = false;
                        btnPrint.Visible = true;
                        m_ServiceID = t_Result.Rows[0]["GrievanceID"].ToString();
                        m_AppID = t_Result.Rows[0]["AppID"].ToString();
                        txtSubject.Attributes.Add("style","border:none");
                        txtSubject.ReadOnly = true;
                        txtGreivance.Attributes.Add("style", "border:none");
                        txtGreivance.ReadOnly = true;
                        trGrievance.Style.Add("display", "");
                        lblGrievanceID.Text = t_Result.Rows[0]["GrievanceID"].ToString();
                        lblCreatedOn.Text = t_Result.Rows[0]["CreatedOn"].ToString();
                        string m_Message = "Your Grievance has been logged. Please take print of the page.";
                        divErr.InnerHtml = m_Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                        //Response.Redirect("/WebApp/Kiosk/OISF/GrievanceForm.aspx?AppID=" + m_AppID);

                        string t_SMSText = t_Result.Rows[0]["SMSText"].ToString();
                        string MailText = t_Result.Rows[0]["MailText"].ToString();
                        string Subject = t_Result.Rows[0]["Subject"].ToString();
                        string MailID = t_Result.Rows[0]["MailID"].ToString();
                        //MailText = divPrint.InnerHtml;
                        try
                        {
                            //StringBuilder tSB = new StringBuilder();
                            //StringWriter tSW = new StringWriter(tSB);

                            //HtmlTextWriter tHTW = new HtmlTextWriter(tSW);
                            //Panel1.RenderControl(tHTW);

                            //MailText = tSB.ToString();
                                
                            CitizenPortalLib.EMailSMS SendSMS = new CitizenPortalLib.EMailSMS();
                            SendSMS.sendsms(lblMobile.Text, t_SMSText);
                            if (MailID != "")
                                CitizenPortalLib.CommonUtility.SendEmailWithAttachment("388", lblAppID.Text, "", MailID, "", "",
                                Subject, MailText, true, null);
                        }
                        catch (Exception ex) { }
                        
                    }
                    else
                    {
                        string m_Message = "No record found againt the data entered.";
                        divErr.InnerHtml = m_Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                    }
                }
                else
                {
                    string m_Message = "No record found againt the data entered.";
                    divErr.InnerHtml = m_Message;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
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

        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {
            /* Verifies that the control is rendered */
        }
    }
}