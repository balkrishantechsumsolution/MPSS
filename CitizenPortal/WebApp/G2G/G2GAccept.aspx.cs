using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G
{
    public partial class G2GAccept : AdminBasePage
    {
        //SeniorCitizenBLL m_SeniorCitizenBLL = new SeniorCitizenBLL();
        string m_AppID, m_ServiceID;
        WorkFlowBLL m_WorkFlowBLL = new WorkFlowBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            HFAppID.Value = m_AppID;
            HFServiceID.Value = m_ServiceID;

            if (!IsPostBack)
                txtRemark.InnerText = "";

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
            GenerateActions();

        }

        void DisplayAppDetail()
        {
            DataTable dt = m_WorkFlowBLL.GetAppDetail(m_ServiceID, m_AppID);

            DateTime AppCreatedOn = Convert.ToDateTime(dt.Rows[0]["CreatedOn"]);
            DateTime AppDeliveryDate = Convert.ToDateTime(dt.Rows[0]["DeliveryDate"]);

            lblCreatedOn.Text = AppCreatedOn.ToString();
            lblDeliveryDate.Text = AppDeliveryDate.ToString();


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
            /*
            //DataTable dt = m_WorkFlowBLL.GetAppRemarks(m_ServiceID, m_AppID);
            DataTable dt = new DataTable();
            dt.Columns.Add("DocumentName", typeof(string));
            dt.Columns.Add("DocumentLink", typeof(string));

            dt.Rows.Add("Age Proof", "View");
            dt.Rows.Add("Residence Proof", "View");
            dt.Rows.Add("Voter ID", "View");

            int t_Count = dt.Rows.Count;

            Panel t_Panel = pnlDocs;

            t_Panel.Controls.Clear();
            
            t_Panel.Controls.Add(new LiteralControl("<table class='table table-striped table-bordered table-hover dataTable no-footer' style='margin-bottom: 0;'>"));

            t_Panel.Controls.Add(new LiteralControl("<tr>"));

            t_Panel.Controls.Add(new LiteralControl("<th>"));
            t_Panel.Controls.Add(new LiteralControl("No"));
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
                int a = i + 1;
                t_Panel.Controls.Add(new LiteralControl(a.ToString() + "."));
                t_Panel.Controls.Add(new LiteralControl("</td>"));

                t_Panel.Controls.Add(new LiteralControl("<td>"));
                t_Panel.Controls.Add(new LiteralControl(dt.Rows[i]["DocumentName"].ToString()));
                t_Panel.Controls.Add(new LiteralControl("</td>"));

                t_Panel.Controls.Add(new LiteralControl("<td>"));
                t_Panel.Controls.Add(new LiteralControl(dt.Rows[i]["DocumentLink"].ToString()));
                t_Panel.Controls.Add(new LiteralControl("</td>"));


                t_Panel.Controls.Add(new LiteralControl("</tr>"));
                
            }
            t_Panel.Controls.Add(new LiteralControl("</table>"));
            */



            DocumentBriefcaseBLL t_DocumentBriefcaseBLL = new DocumentBriefcaseBLL();
            string t_ProfileID = t_DocumentBriefcaseBLL.GetProfileID(m_ServiceID, m_AppID);

            DataTable dtDoc = t_DocumentBriefcaseBLL.GetSavedDocumentDetails(t_ProfileID, "", m_ServiceID, m_AppID);

            //if (dtDoc.Rows.Count != 0)
            //{
            //    gvDoc.DataSource = dtDoc;
            //    gvDoc.DataBind();
            //}
            //else
            //{
            //    divErr.InnerHtml = "File Uploaded Successfully !!";
            //    divErr.Attributes.Add("class", "success");
            //    divErr.Style.Add("display", "");
            //    divErr.InnerText = "No attachment is required for the service";
            //}


            int t_Count = dtDoc.Rows.Count;

            Panel t_Panel = pnlDocs;

            t_Panel.Controls.Clear();

            t_Panel.Controls.Add(new LiteralControl("<table class='table table-striped table-bordered table-hover dataTable no-footer' style='margin-bottom: 0;'>"));

            t_Panel.Controls.Add(new LiteralControl("<tr>"));

            t_Panel.Controls.Add(new LiteralControl("<th>"));
            t_Panel.Controls.Add(new LiteralControl("No"));
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
                int a = i + 1;
                t_Panel.Controls.Add(new LiteralControl(a.ToString() + "."));
                t_Panel.Controls.Add(new LiteralControl("</td>"));

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
                //t_Panel.Controls.Add(new LiteralControl("<ul>"));

                //t_Panel.Controls.Add(new LiteralControl("<li class='remarksBy'><span class='remarkstxt'>"));
                //t_Panel.Controls.Add(new LiteralControl("Comments By: " + dt.Rows[i]["CreatedBy"].ToString()));
                //t_Panel.Controls.Add(new LiteralControl("</span><span class='remarksDate'>"));

                ////t_Panel.Controls.Add(new LiteralControl(dt.Rows[i]["CreatedOn"].ToString() + " " + dt.Rows[i]["TimeLapsed"].ToString()));
                //t_Panel.Controls.Add(new LiteralControl(dt.Rows[i]["CreatedOn"].ToString()));

                //t_Panel.Controls.Add(new LiteralControl("</span></li>"));

                //t_Panel.Controls.Add(new LiteralControl("<li class='remarksMSG'>"));
                //t_Panel.Controls.Add(new LiteralControl(dt.Rows[i]["Remarks"].ToString()));
                //t_Panel.Controls.Add(new LiteralControl("</li>"));

                //t_Panel.Controls.Add(new LiteralControl("</ul>"));

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
            DataTable dt = m_WorkFlowBLL.GetAcceptanceActions(m_ServiceID, m_AppID);
            Panel t_pnlActions = pnlActions;
            Button t_LinkButton = null;
            //t_pnlActions.Controls.Add(new LiteralControl("<table class='table table-striped table-bordered table-hover dataTable no-footer'><tr>"));

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

            t_Result = m_WorkFlowBLL.AcceptAppInWorkFlow(m_ServiceID, m_AppID, t_StageID, t_ActionID, t_Remarks, t_CreatedBy, t_IPAddress);

            if (t_Result != null && t_Result.Rows.Count > 0)
            {

                //if (HFApprove.Value == "1")
                //{
                //    CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                //    string MobileNo = t_Result.Rows[0]["Mobile"].ToString();

                //    if (MobileNo != "")
                //        test.sendsms(MobileNo, "Your application with Reference ID " + m_AppID + " is approved successfully. From Lokaseba Adhikara -CAP, Odisha Govt.");
                //}

                //if (HFReject.Value == "1")
                //{
                //    CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                //    string MobileNo = t_Result.Rows[0]["Mobile"].ToString();

                //    if (MobileNo != "")
                //        test.sendsms(MobileNo, "Your application with Reference ID " + m_AppID + " is rejected. From Lokaseba Adhikara -CAP, Odisha Govt.");
                //}

                //if (HFDigiSign.Value != "" && HFDigiSign.Value == "1")
                //{
                //    //RedirectForDigiSign
                //    //t_URL = "../Common/HTML2PDF/HTMLToPDF.aspx" + "?SvcID=" + m_ServiceID + "&AppID=" + m_AppID;
                //    t_URL = "../Kiosk/Forms/SeniorCitizenCertificate.aspx" + "?SvcID=" + m_ServiceID + "&AppID=" + m_AppID + "&GenPDF=Y";
                //    Response.Redirect(t_URL, false);
                //}
                //else
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