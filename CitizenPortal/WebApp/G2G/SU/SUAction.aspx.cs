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

namespace CitizenPortal.WebApp.G2G.SU
{
    public partial class SUAction : AdminBasePage
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
                divErr.Style.Add("display", "none");

                divReport.Visible = false;
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

            if (LoginID.Contains("BSSO"))
            {
                divReport.Visible = true;
                m_DisplayFileUpload = true;
            }

            if (m_ServiceID == "374")//Supply of photocopy of Answer Sheet
            {
                lblReport.Text = "Upload Answersheet";
                divReport.Visible = true;
                m_DisplayFileUpload = true;
            }
            else if (m_ServiceID == "373")//Issue of Duplicate Semester Marksheet
            {
                lblReport.Text = "Upload Semester Marksheet";
                divReport.Visible = true;
                m_DisplayFileUpload = true;
            }
            else if (m_ServiceID == "372")//Issue of Duplicate Divisional Marksheet
            {
                lblReport.Text = "Upload Divisional Marksheet";
                divReport.Visible = true;
                m_DisplayFileUpload = true;
            }
            else if (m_ServiceID == "427")//Issue of Duplicate Divisional Marksheet
            {
                lblReport.Text = "Upload PNTC Marksheet";
                divReport.Visible = true;
                m_DisplayFileUpload = true;
            }
            else if (m_ServiceID == "1446")//Issue of Duplicate Divisional Marksheet
            {
                if (LoginID.Contains("Principal"))
                {
                    divRecom.Visible = true;
                }
                else
                { divRecom.Visible = false; }
            }

            //DisplayAppDetail();
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
                divReport.Visible = false;
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
            hdnDSCount.Value = t_Count.ToString();
            Panel t_Panel = pnlDocs;
            CheckBox chb = null;

            t_Panel.Controls.Clear();

            t_Panel.Controls.Add(new LiteralControl("<table class='table table-striped table-bordered table-hover dataTable no-footer' style='margin-bottom: 0;'>"));

            t_Panel.Controls.Add(new LiteralControl("<tr>"));

            t_Panel.Controls.Add(new LiteralControl("<th>"));
            t_Panel.Controls.Add(new LiteralControl("Sl."));
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
            DataTable dt = m_WorkFlowBLL.GetActions(m_ServiceID, m_AppID);
            Panel t_pnlActions = pnlActions;
            Button t_LinkButton = null;
            //t_pnlActions.Controls.Add(new LiteralControl("<table class='table table-striped table-bordered table-hover dataTable no-footer'><tr>"));


            if (m_ServiceID == "1446")
            {
                string createdBy = "UnivAdmin";

                if (Session["LoginID"].ToString().ToUpper() == createdBy.ToUpper())
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

                    HtmlAnchor t_Anchor1 = new HtmlAnchor();
                    t_Anchor1.ID = "EFM_ViewOutput";
                    t_Anchor1.InnerText = "Edit Migration";
                    t_Anchor1.ClientIDMode = ClientIDMode.Static;
                    
                    t_Anchor1.Attributes.Add("class", "btn btn-outline btn-primary");
                    t_Anchor1.Style.Add("margin", "5px;");
                    t_Anchor1.Attributes.Add("onclick", "javascript: EditMigration('"+m_AppID+ "','" + m_ServiceID + "');");
                    t_pnlActions.Controls.Add(t_Anchor1);
                    t_Anchor1 = null;
                }
            }
            else
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


            //t_LinkButton = new Button();

            //t_LinkButton.Text = "View Output";
            //t_LinkButton.ID = "LB_output";
            //t_LinkButton.ClientIDMode = ClientIDMode.Static;
            //t_LinkButton.EnableViewState = true;
            //t_LinkButton.CssClass = "btn btn-outline btn-primary";
            ////t_LinkButton.Style.Add("color", "#ccc");
            //t_LinkButton.Style.Add("margin", "5px;");
            ////t_LinkButton.Style.Add("border-color","#ccc;");
            //t_LinkButton.Attributes.Add("onclick", "javascript: ViewOutput();");
            ////t_LinkButton.Click += new EventHandler(LinkButton_Click);

            //t_pnlActions.Controls.Add(t_LinkButton);
            ////t_pnlActions.Controls.Add(new LiteralControl("</td>"));
            //t_LinkButton = null;

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

                divErr.InnerHtml = "Please select file for upload";
                divErr.Style.Add("display", "");
                divErr.Attributes.Add("class", "error");
                //gvDoc.Style.Add("dislpay", "block");

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
                            m_AppID + " is sent back. Remark: " + t_Remarks + ". Please login to check the status of your application. From Chhattisgarh Swami Vivekanad Technical University, Raipur");

                }


                if (HFApprove.Value == "1")
                {
                    CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                    string MobileNo = t_Result.Rows[0]["Mobile"].ToString();

                    if (MobileNo != "") {
                        if (m_ServiceID == "1446")
                        {
                            test.sendsms(MobileNo, "Your application with Reference ID " + m_AppID + " for migration certificate has been processed and approved, please submit the required documents(Registration card / affidavit(if any) / FIR(if any), copy of mark sheet) in original at academy - II section and collect your migration certificate. From Chhattisgarh Swami Vivekanad Technical University, Raipur");
                        }
                        else {
                            test.sendsms(MobileNo, "Your application with Reference ID " + m_AppID + " is approved successfully. From Chhattisgarh Swami Vivekanad Technical University, Raipur");
                        }
                    }                    

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

        int UploadReport()
        {
            int result = 0;
            FileUpload fu = (FileUpload)fuReport;
            //Label lblSubCatID = (Label)gvDoc.Rows[rowIndex].FindControl("lblSubCatID");
            string _Profileid = m_ProfileID;
            string lblSubCatID = "3";

            string t_StageID = HFStageID.Value;
            string t_ActionID = HFActionID.Value;
            string t_Remarks = txtRemark.InnerText.Trim();
            string t_CreatedBy = Session["LoginID"].ToString();
            string t_IPAddress = Request.UserHostAddress;
            try
            {
                if (fu.HasFile)
                {
                    string path = "";
                    if (m_ServiceID == "1446")
                    {
                        path = string.Format(m_DocumentPath, m_AppID);
                    }
                    else
                    {
                        path = string.Format(m_DocumentPath, m_ProfileID);// "/MPOQuickLinks/MPPHSCL/Registration/DocUploads/" + _Profileid + "/" + AppID;
                    }
                    string finenameSuffix = Convert.ToString(DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString());
                    string fileName = Path.GetFileName(fu.FileName);
                    //string FullfileName = Path.GetFileName(fu.FileName + "_" + finenameSuffix);
                    string fileExt = Path.GetExtension(fu.FileName).ToLower();
                    string Error = ValidateFileSizeAndExtn(fu);
                    if (Error != string.Empty)
                    {
                        result = 0;
                        throw new Exception(Error);
                    }
                    string lblDocID = "DOC999";
                    string Docname = _Profileid.ToString() + "_" + lblDocID.Trim() + "_" + finenameSuffix.ToString() + fileExt.ToString();
                    if (!saveAttachment(fu, path, Docname))
                    {
                        result = 0;
                        throw new Exception("An error occured while uploading. Please Try later");
                    }

                    DocumentBriefcaseBLL t_DocumentBriefcaseBLL = new DocumentBriefcaseBLL();
                    t_DocumentBriefcaseBLL.SaveG2GDocument(m_ProfileID, "", m_ServiceID, m_AppID,
                        lblDocID.Trim(), Docname.ToString(), path.ToString() + "/" + Docname.ToString()
                        , t_StageID, t_CreatedBy, DateTime.Now.ToString("yyy-MM-dd"), ""
                        , Docname, path.ToString() + "/" + Docname.ToString(), "", "", "", "", "", "", "", ""
                        , "", "", "", "", ""
                        , "", "", "", "", "");

                    result = 1;

                    divErr.InnerHtml = "File Uploaded Successfully !!";
                    divErr.Attributes.Add("class", "success");
                    divErr.Style.Add("display", "");

                    DisplayUploadedFiles();

                    //gvDoc.Style.Add("dislpay", "block");
                }
                /* 2016-11-07 File Upload Logic commented as per feedback to not mark the file upload as mandatory option for Dept User */
                //else
                //{
                //    divErr.InnerHtml = "Please select file for upload";
                //    divErr.Style.Add("display", "");
                //    divErr.Attributes.Add("class", "error");
                //    //gvDoc.Style.Add("dislpay", "block");
                //}
                else
                {
                    result = 1;

                }
            }
            catch (Exception ex)
            {

                divErr.InnerHtml = ex.Message;
                divErr.Style.Add("display", "");
                divErr.Attributes.Add("class", "error");
            }
            return result;
        }


        public static bool CheckForIsImage(byte[] data, FileUpload FU)
        {
            //read 64 bytes of the stream only to determine the type
            string myStr = System.Text.Encoding.ASCII.GetString(data).Substring(0, 16);
            //check if its definately an image.
            if (myStr.Substring(8, 2).ToString().ToLower() != "if")
            {
                //its not a jpeg
                if (myStr.Substring(0, 3).ToString().ToLower() != "gif")
                {
                    //its not a gif
                    if (myStr.Substring(0, 2).ToString().ToLower() != "bm")
                    {
                        //its not a .bmp
                        if (myStr.Substring(0, 2).ToString().ToLower() != "png")
                        {
                            //its not a .bmp
                            if (myStr.Substring(0, 2).ToString().ToLower() != "ii")
                            {
                                //its not a tiff
                                //ProcessErrors("notImage");
                                FU.PostedFile.InputStream.Close();
                                myStr = null;
                                return false;
                            }
                        }
                    }
                }

            }
            myStr = null;
            return true;
        }
        private string ValidateFileSizeAndExtn(FileUpload flUpl)
        {
            string FileExtension = string.Empty;
            if (!flUpl.HasFile)
            {
                return "Select a file to upload !";
            }
            else if (flUpl.FileBytes.Length > (10 * 1048576))// 200KB = 204800, 1 MB = 1048576
            {
                return "File should not be greater than 1500 KB !";
            }
            else if (Path.GetExtension(flUpl.PostedFile.FileName) == "")
            {
                return "File must be .jpg or .jpeg or .pdf !";

            }
            else
            {


                FileExtension = Path.GetExtension(flUpl.PostedFile.FileName).Substring(1).ToUpper();
                byte[] imgfile = null;
                if (FileExtension == "JPG" | FileExtension == "JPEG")
                {
                    Stream fs = null;
                    fs = flUpl.PostedFile.InputStream;
                    BinaryReader br1 = new BinaryReader(fs);
                    imgfile = br1.ReadBytes(flUpl.PostedFile.ContentLength);
                    bool fii = false;
                    fii = CheckForIsImage(imgfile, flUpl);
                    if (fii == false)
                    {
                        return "File must be .jpg or .jpeg or .pdf !";
                    }
                }
                else if (FileExtension == "PDF")
                {
                    System.IO.BinaryReader r = new System.IO.BinaryReader(flUpl.PostedFile.InputStream);
                    string fileclass = string.Empty;
                    byte buffer = 0;
                    buffer = r.ReadByte();
                    fileclass = buffer.ToString();
                    buffer = r.ReadByte();
                    fileclass += buffer.ToString();
                    if ((fileclass == "3780"))
                    {
                        return string.Empty;
                    }
                    else
                    { return "File must be .jpg or .jpeg or .pdf !"; }
                }

                if (FileExtension == "JPG")
                {
                    return string.Empty;
                }
                else if (FileExtension == "JPEG")
                {
                    return string.Empty;
                }
                else
                {
                    return "File must be .jpg or .jpeg or .pdf !";
                }
            }
        }

        #region File Upload Utilities
        private bool saveAttachment(FileUpload photo, string photoPath, string FullfileName)
        {
            bool savefile = false;
            try
            {
                SaveFileToQuickLinks(photoPath, photo.PostedFile, new string[] { ".jpeg", ".jpg", ".pdf", ".png" }, FullfileName);
                savefile = true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return savefile;
        }
        private string GetDirectory(string Filename)
        {
            return Filename.Substring(0, Filename.LastIndexOf("\\"));
        }
        private void SaveFileToQuickLinks(string Path, HttpPostedFile File, string[] AllowedFormats, string FullfileName)
        {
            string ext = GetFileExtension(File, AllowedFormats);
            SaveFileToQuickLinks(Path + "/" + FullfileName, File);
            return;
        }
        private string GetFileExtension(HttpPostedFile file, string[] AllowedFormats)
        {
            string p;
            if (file != null)
            {
                p = file.FileName;
                return GetFileExtension(p, AllowedFormats);
            }
            else
            {
                return null;
            }
        }
        private string CheckExtension(string ext, string[] AllowedExtensions)
        {
            //return ((ext.ToLower() == ".jpg") || (ext.ToLower() == ".gif")) ? ext.ToLower() : ".txt";
            bool valiedFormat = false;
            if (ext == null) { return null; }
            for (int tempI = 0; tempI < AllowedExtensions.Length; tempI++)
            {
                if (AllowedExtensions[tempI].ToLower() == ext.ToLower()) { valiedFormat = true; }
            }
            if (!valiedFormat) { return ".txt"; }
            else return ext.ToLower();
        }
        private string GetFileExtension(string File, string[] AllowedExtensions)
        {
            string ext = ((File == "") || (File == null)) ? null : CheckExtension(File.Substring(File.LastIndexOf(".")), AllowedExtensions);
            //return (File == "") ? null : CheckExtension(File.Substring(File.LastIndexOf(".")));
            return CheckExtension(ext, AllowedExtensions);
        }
        private string LocMapPath(string url)
        {
            //return "";// Resources.resource.lblQuickLinksDirectory + url.Replace("/", "\\").ToString();
            string QuickLinksDirectory = System.Configuration.ConfigurationManager.AppSettings["QuickLinksDirectory"].ToString();
            string filePath = QuickLinksDirectory + url.Replace("/", "\\").ToString();// ConfigurationManager.AppSettings["Path"].ToString() + url.Replace("/", "\\").ToString();
            return filePath;
        }

        protected void btnUpload_Click(object sender, ImageClickEventArgs e)
        {

            {
                UploadReport();
            }
        }

        private void SaveFileToQuickLinks(string Filename, HttpPostedFile _File)
        {
            if (_File != null)
            {
                if ((Filename != null))
                {
                    if (_File.ContentLength == 0)
                    {
                        return;
                        //throw new ApplicationException("The uploaded file is either empty or an error occured while uploading the file. Check the file and try again.");
                    }
                    string FilePath = LocMapPath(Filename);
                    String directory = GetDirectory(FilePath);
                    if (!Directory.Exists(directory))
                    {
                        Directory.CreateDirectory(directory);
                    }
                    _File.SaveAs(FilePath);
                    if (File.Exists(FilePath))
                    {
                        File.SetAttributes(FilePath, FileAttributes.Normal);
                    }
                }
            }
        }
        #endregion

    }
}