using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CitizenPortalLib;
using CitizenPortalLib.BLL;

namespace CitizenPortal.WebApp.G2G.PG
{
    public partial class PGAction : System.Web.UI.Page
    {
        string m_AppID, m_ServiceID;
        WorkFlowBLL m_WorkFlowBLL = new WorkFlowBLL();
        string m_ProfileID = "";
        string m_DocumentPath = "/QuickLinks/{0}/DocUploads/";
        bool m_DisplayFileUpload = false;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            HFAppID.Value = m_AppID;
            HFServiceID.Value = m_ServiceID;

            if (!IsPostBack)
            {               
                txtRemark.InnerText = "";
            }

            DataTable dt = m_WorkFlowBLL.GetProfileID(m_ServiceID, m_AppID);

            m_ProfileID = dt.Rows[0]["ProfileID"].ToString();

            string LoginID = "";
            int Department;

            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());

            AcknowledgementBLL t_AcknowledgementBLL = new AcknowledgementBLL();
            DataTable t_DT = t_AcknowledgementBLL.GetAcknowledgementInfo(m_ServiceID, m_AppID);


            if (t_DT != null && t_DT.Rows.Count > 0)
            {
                //SvcName.InnerText = t_DT.Rows[0]["SvcName"].ToString();
                HFAckURL.Value = t_DT.Rows[0]["FullURL"].ToString();
            }           

            DisplayAppDetail();
            DisplayDocuments();
            DisplayRemarks();
            //if (LoginID.Contains("BSSO"))
            {
                DisplayUploadedFiles();
            }
            GenerateActions();

        }

        void DisplayUploadedFiles()
        {
            DocumentBriefcaseBLL t_DocumentBriefcaseBLL = new DocumentBriefcaseBLL();
            string t_ProfileID = t_DocumentBriefcaseBLL.GetProfileID(m_ServiceID, m_AppID);

            DataTable dtDoc = t_DocumentBriefcaseBLL.GetG2GSavedDocumentDetails(t_ProfileID, "", m_ServiceID, m_AppID);

            int t_Count = dtDoc.Rows.Count;

            Panel t_Panel = pnlG2GDocs;

            t_Panel.Controls.Clear();

            if (t_Count > 0)
            {
                t_Panel.Controls.Add(new LiteralControl("<table class='table table-striped table-bordered table-hover dataTable no-footer' style='margin-bottom: 0;'>"));

                t_Panel.Controls.Add(new LiteralControl("<tr>"));

                t_Panel.Controls.Add(new LiteralControl("<th>"));
                t_Panel.Controls.Add(new LiteralControl("Document Name"));
                t_Panel.Controls.Add(new LiteralControl("</th>"));
                t_Panel.Controls.Add(new LiteralControl("<th>"));
                t_Panel.Controls.Add(new LiteralControl("Download"));
                t_Panel.Controls.Add(new LiteralControl("</th>"));

                t_Panel.Controls.Add(new LiteralControl("</tr>"));


                for (int i = 0; i < t_Count; i++)
                {
                    t_Panel.Controls.Add(new LiteralControl("<tr>"));

                    t_Panel.Controls.Add(new LiteralControl("<td>"));
                    t_Panel.Controls.Add(new LiteralControl(dtDoc.Rows[i]["DocDesc"].ToString()));
                    t_Panel.Controls.Add(new LiteralControl("</td>"));

                    t_Panel.Controls.Add(new LiteralControl("<td>"));

                    //if (dtDoc.Rows[i]["Path"].ToString() != "")
                    t_Panel.Controls.Add(new LiteralControl("<a target='_blank' href='" + dtDoc.Rows[i]["Path"].ToString() + "' >View</a>"));

                    t_Panel.Controls.Add(new LiteralControl("</td>"));


                    t_Panel.Controls.Add(new LiteralControl("</tr>"));

                }
                t_Panel.Controls.Add(new LiteralControl("</table>"));

            }
        }

        void DisplayAppDetail()
        {

            if (m_ServiceID == "388")
            {
                divServiceDeliveryDetails.Visible = false;
                return;
            }

            DataTable dt = m_WorkFlowBLL.GetAppDetail(m_ServiceID, m_AppID);

            DateTime AppCreatedOn = Convert.ToDateTime(dt.Rows[0]["CreatedOn"]);
            DateTime AppDeliveryDate = Convert.ToDateTime(dt.Rows[0]["DeliveryDate"]);

            lblCreatedOn.Text = AppCreatedOn.ToString();
            lblDeliveryDate.Text = AppDeliveryDate.ToString();


            if (dt.Rows[0]["ClosedOn"] != null && dt.Rows[0]["ClosedOn"].ToString() != "")
            {
                //divReport.Visible = false;
            }

            ServicesBLL t_ServicesBLL = new ServicesBLL();
            System.Data.DataTable dtAuthority = t_ServicesBLL.AppleteAuthority(m_ServiceID);

            //int t_Count = dt.Rows.Count;

            if (dtAuthority != null && dtAuthority.Rows.Count > 0)
            {

                lblServiceName.Text = dtAuthority.Rows[0]["ServiceName"].ToString();
                lblTimeLimit.Text = dtAuthority.Rows[0]["TimeLimit"].ToString();
                lblDesignatedOfficer.Text = dtAuthority.Rows[0]["DesignatedOfficer"].ToString();
                lblAppellateAuthority.Text = dtAuthority.Rows[0]["AppellateAuthority"].ToString();
                lblRevisionalAuthority.Text = dtAuthority.Rows[0]["RevisionalAuthority"].ToString();
            }

        }

        void DisplayDocuments()
        {
           
            DocumentBriefcaseBLL t_DocumentBriefcaseBLL = new DocumentBriefcaseBLL();
            string t_ProfileID = t_DocumentBriefcaseBLL.GetProfileID(m_ServiceID, m_AppID);

            DataTable dtDoc = t_DocumentBriefcaseBLL.GetSavedDocumentDetails(t_ProfileID, "", m_ServiceID, m_AppID);
           
            int t_Count = dtDoc.Rows.Count;
            hdnDSCount.Value = t_Count.ToString();
            Panel t_Panel = pnlDocs;
            CheckBox chb = null;

            t_Panel.Controls.Clear();

            t_Panel.Controls.Add(new LiteralControl("<table class='table table-striped table-bordered table-hover dataTable no-footer' style='margin-bottom: 0;'>"));

            t_Panel.Controls.Add(new LiteralControl("<tr>"));

            t_Panel.Controls.Add(new LiteralControl("<th>"));
            t_Panel.Controls.Add(new LiteralControl(""));
            t_Panel.Controls.Add(new LiteralControl("</th>"));
            t_Panel.Controls.Add(new LiteralControl("<th>"));
            t_Panel.Controls.Add(new LiteralControl("Document Name"));
            t_Panel.Controls.Add(new LiteralControl("</th>"));
            t_Panel.Controls.Add(new LiteralControl("<th>"));
            t_Panel.Controls.Add(new LiteralControl("Download"));
            t_Panel.Controls.Add(new LiteralControl("</th>"));

            t_Panel.Controls.Add(new LiteralControl("</tr>"));


            for (int i = 0; i < t_Count; i++)
            {
                t_Panel.Controls.Add(new LiteralControl("<tr>"));

                t_Panel.Controls.Add(new LiteralControl("<td>"));
                //int a = i + 1;
                //t_Panel.Controls.Add(new LiteralControl(a.ToString() + "."));

                chb = new CheckBox();
                chb.ID = String.Format("CheckBox_{0}", i);
                //chb.Attributes.Add("onClick", "javascript:CheckCount('" + chb.ID + "');");
                t_Panel.Controls.Add(chb);

                t_Panel.Controls.Add(new LiteralControl("</td>"));

                t_Panel.Controls.Add(new LiteralControl("<td><span>"));
                t_Panel.Controls.Add(new LiteralControl(dtDoc.Rows[i]["DocDesc"].ToString()));
                t_Panel.Controls.Add(new LiteralControl("</span></td>"));

                t_Panel.Controls.Add(new LiteralControl("<td>"));

                //if (dtDoc.Rows[i]["Path"].ToString() != "")
                t_Panel.Controls.Add(new LiteralControl("<a href='#' onClick=\"javascript:ViewDoc('" +
                    dtDoc.Rows[i]["keyfield"].ToString() + "', '" + chb.ID + "')\" >View</a>"));
                //

                //t_Panel.Controls.Add(new LiteralControl("<a href='#' onClick=\"javascript:TestCode('" +    1 + "', '" + chb.ID + "')\" >View</a>"));


                t_Panel.Controls.Add(new LiteralControl("</td>"));


                t_Panel.Controls.Add(new LiteralControl("</tr>"));

            }
            t_Panel.Controls.Add(new LiteralControl("</table>"));

        }

        void DisplayRemarks()
        {
            DataTable dt = m_WorkFlowBLL.GetAppRemarks(m_ServiceID, m_AppID);

            int t_Count = dt.Rows.Count;

            Panel t_Panel = pnlRemarks;

            t_Panel.Controls.Clear();
            t_Panel.Controls.Add(new LiteralControl("<table class='table table-striped table-bordered table-hover dataTable no-footer' style='margin-bottom: 0;'>"));

            t_Panel.Controls.Add(new LiteralControl("<tr>"));

            t_Panel.Controls.Add(new LiteralControl("<th>"));
            t_Panel.Controls.Add(new LiteralControl("No."));
            t_Panel.Controls.Add(new LiteralControl("</th>"));
            t_Panel.Controls.Add(new LiteralControl("<th>"));
            t_Panel.Controls.Add(new LiteralControl("By"));
            t_Panel.Controls.Add(new LiteralControl("</th>"));
            t_Panel.Controls.Add(new LiteralControl("<th>"));
            t_Panel.Controls.Add(new LiteralControl("Dated"));
            t_Panel.Controls.Add(new LiteralControl("</th>"));
            t_Panel.Controls.Add(new LiteralControl("<th>"));
            t_Panel.Controls.Add(new LiteralControl("Remark"));
            t_Panel.Controls.Add(new LiteralControl("</th>"));
            t_Panel.Controls.Add(new LiteralControl("</tr>"));

            for (int i = 0; i < t_Count; i++)
            {
                t_Panel.Controls.Add(new LiteralControl("<tr>"));

                t_Panel.Controls.Add(new LiteralControl("<td>"));
                int a = i + 1;
                t_Panel.Controls.Add(new LiteralControl(a.ToString() + "."));
                t_Panel.Controls.Add(new LiteralControl("</td>"));

                t_Panel.Controls.Add(new LiteralControl("<td>"));
                t_Panel.Controls.Add(new LiteralControl(dt.Rows[i]["CreatedBy"].ToString()));
                t_Panel.Controls.Add(new LiteralControl("</td>"));

                t_Panel.Controls.Add(new LiteralControl("<td>"));
                t_Panel.Controls.Add(new LiteralControl(dt.Rows[i]["CreatedOn"].ToString()));
                t_Panel.Controls.Add(new LiteralControl("</td>"));

                t_Panel.Controls.Add(new LiteralControl("<td>"));
                t_Panel.Controls.Add(new LiteralControl(dt.Rows[i]["Remarks"].ToString()));
                t_Panel.Controls.Add(new LiteralControl("</td>"));

                t_Panel.Controls.Add(new LiteralControl("</tr>"));
            }
            t_Panel.Controls.Add(new LiteralControl("</table>"));
        }

        void GenerateActions()
        {
            DataTable dt = m_WorkFlowBLL.GetActions(m_ServiceID, m_AppID);
            Panel t_pnlActions = pnlActions;
            Button t_LinkButton = null;
           
            //if (m_ServiceID != "374")
            {
                HtmlAnchor t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "HA_ViewOutput";
                t_Anchor.InnerText = "View Output";
                t_Anchor.ClientIDMode = ClientIDMode.Static;
                //t_Anchor.Style.Add("class","btn btn-outline btn-primary");
                t_Anchor.Attributes.Add("class", "btn btn-outline btn-primary");
                t_Anchor.Style.Add("margin", "5px;");
                t_Anchor.Attributes.Add("onclick", "javascript: ViewOutput();");
                t_pnlActions.Controls.Add(t_Anchor);
                t_Anchor = null;
            }
            
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                //t_pnlActions.Controls.Add(new LiteralControl("<td>"));

                t_LinkButton = new Button();

                t_LinkButton.Text = dt.Rows[i]["ActionName"].ToString();
                t_LinkButton.ID = "LB_" + dt.Rows[i]["StageId"].ToString() + "_" + dt.Rows[i]["ActionId"].ToString();
                t_LinkButton.CssClass = "btn btn-outline btn-primary";
                //t_LinkButton.Style.Add("color", "#ccc");
                t_LinkButton.Style.Add("margin", "5px");
                //t_LinkButton.Style.Add("border-color", "#ccc;");
                t_LinkButton.ClientIDMode = ClientIDMode.Static;
                t_LinkButton.EnableViewState = true;

                if (dt.Rows[i]["IsApproval"].ToString() == "1")
                {
                    t_LinkButton.Attributes.Add("onclick",
                        "javascript: return ExecuteAction_Approve('" + dt.Rows[i]["StageId"].ToString() + "', '" + dt.Rows[i]["ActionID"].ToString() + "');");
                }
                else if (dt.Rows[i]["IsDigitalSign"].ToString() == "1")
                {
                    t_LinkButton.Attributes.Add("onclick",
                        "javascript: return ExecuteAction_DigiSign('" + dt.Rows[i]["StageId"].ToString() + "', '" + dt.Rows[i]["ActionID"].ToString() + "');");
                }
                else if (dt.Rows[i]["IsRejection"].ToString() == "1")
                {
                    t_LinkButton.Attributes.Add("onclick",
                        "javascript: return ExecuteAction_Reject('" + dt.Rows[i]["StageId"].ToString() + "', '" + dt.Rows[i]["ActionID"].ToString() + "');");
                }
                else if (dt.Rows[i]["IsSentBack"].ToString() == "1")
                {
                    t_LinkButton.Attributes.Add("onclick",
                        "javascript: return ExecuteAction_SentBack('" + dt.Rows[i]["StageId"].ToString() + "', '" + dt.Rows[i]["ActionID"].ToString() + "');");
                }
                else
                {
                    t_LinkButton.Attributes.Add("onclick",
                        "javascript: return ExecuteAction('" + dt.Rows[i]["StageId"].ToString() + "', '" + dt.Rows[i]["ActionID"].ToString() + "');");
                }

                t_LinkButton.Click += new EventHandler(LinkButton_Click);

                t_pnlActions.Controls.Add(t_LinkButton);
                //t_pnlActions.Controls.Add(new LiteralControl("</td>"));

                t_LinkButton = null;

            }

            //t_pnlActions.Controls.Add(new LiteralControl("<td>"));

            t_LinkButton = new Button();

            t_LinkButton.Text = "Close";
            t_LinkButton.ID = "LB_close";
            t_LinkButton.ClientIDMode = ClientIDMode.Static;
            t_LinkButton.EnableViewState = true;
            t_LinkButton.CssClass = "btn btn-outline btn-danger";
            //t_LinkButton.Style.Add("color", "#ccc");
            t_LinkButton.Style.Add("margin", "5px;");
            //t_LinkButton.Style.Add("border-color","#ccc;");
            t_LinkButton.Attributes.Add("onclick", "javascript: window.close();");
            //t_LinkButton.Click += new EventHandler(LinkButton_Click);

            t_pnlActions.Controls.Add(t_LinkButton);
            //t_pnlActions.Controls.Add(new LiteralControl("</td>"));
            t_LinkButton = null;


            //t_pnlActions.Controls.Add(new LiteralControl("</tr></table>"));

        }

        protected void LinkButton_Click(object sender, EventArgs e)
        {
            DataTable t_Result = null;
            string t_StageID = HFStageID.Value;
            string t_ActionID = HFActionID.Value;
            string t_Remarks = txtRemark.InnerText.Trim();
            string t_CreatedBy = Session["LoginID"].ToString();
            string t_IPAddress = Request.UserHostAddress;
            string t_URL = "";

            int result = 0;

            if (m_DisplayFileUpload)
            {
                result = m_WorkFlowBLL.CheckFileUpload(m_ServiceID, m_AppID);


                if (HFSentBack.Value == "1")
                {
                    result = 1;
                }
                else if (HFReject.Value == "1")
                {
                    result = 1;
                }
            }
            else
            {
                result = 1;
            }

            if (m_DisplayFileUpload && result == 0)
            {              
                return;
            }

            t_Result = m_WorkFlowBLL.SendAppInWorkFlow(m_ServiceID, m_AppID, t_StageID, t_ActionID, t_Remarks, t_CreatedBy, t_IPAddress);

            if (t_Result != null && t_Result.Rows.Count > 0)
            {

                if (t_StageID == "S1")
                {
                    CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                    string MobileNo = t_Result.Rows[0]["Mobile"].ToString();
                    string SMSText = t_Result.Rows[0]["SMSText"].ToString();

                    if (MobileNo != "")
                        test.sendsms(MobileNo, SMSText);

                }

                if (HFSentBack.Value == "1")
                {
                    CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                    string MobileNo = t_Result.Rows[0]["Mobile"].ToString();

                    if (MobileNo != "")
                        test.sendsms(MobileNo, "Your application with Reference ID " +
                            m_AppID + " is sent back. Remark: " + t_Remarks + ". Please login to check the status of your application. From CSVTU, Raipur");

                }


                if (HFApprove.Value == "1")
                {
                    CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                    string MobileNo = t_Result.Rows[0]["Mobile"].ToString();

                    if (MobileNo != "")
                        test.sendsms(MobileNo, "Your application with Reference ID " + m_AppID + " is approved successfully. From Sambalpur University, Odisha");
                }

                if (HFReject.Value == "1")
                {
                    CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                    string MobileNo = t_Result.Rows[0]["Mobile"].ToString();

                    if (MobileNo != "")
                        test.sendsms(MobileNo, "Your application with Reference ID " + m_AppID + " is rejected. From Chhattisgarh Swami Vivekanad Technical University, Raipur");
                }

                if (HFDigiSign.Value != "" && HFDigiSign.Value == "1")
                {
                    //RedirectForDigiSign
                    //t_URL = "../Common/HTML2PDF/HTMLToPDF.aspx" + "?SvcID=" + m_ServiceID + "&AppID=" + m_AppID;
                    t_URL = "../Kiosk/Forms/SeniorCitizenCertificate.aspx" + "?SvcID=" + m_ServiceID + "&AppID=" + m_AppID + "&GenPDF=Y";
                    Response.Redirect(t_URL, false);
                }
                else
                {

                    //SendSMS(m_ServiceID, m_AppID);
                    //SendEmail(m_ServiceID, m_AppID);
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message",
                        "alert('Application Submitted Successfully.');window.opener.document.forms[0].submit();window.close();", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message",
                    "alert('There is some issue while processing the Application.');window.opener.document.forms[0].submit();window.close();", true);
            }

        }
    }
}