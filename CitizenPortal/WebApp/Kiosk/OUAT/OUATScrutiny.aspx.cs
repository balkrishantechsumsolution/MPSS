using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CitizenPortal.WebApp.Kiosk.OISF;
using CitizenPortalLib;
using CitizenPortalLib.BLL;

namespace CitizenPortal.WebApp.Kiosk.OUAT
{
    public partial class OUATScrutiny : BasePage
    {
        OUATBLL m_OUATBLL = new OUATBLL();
        string m_ServiceID = "388";
        int Steps = 0;
        Image t_Image = null;
        Image m_Image = null;
        RadioButton t_Check = null;
        RadioButton m_Check = null;
        HtmlAnchor t_Anchor = null;
        DropDownList t_DDList = null;

        string RowID = "";
        string LoginID = "";
        int Department;
        protected void Page_Load(object sender, EventArgs e)
        {
            string FromDate = "";
            string ToDate = "";

            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());

            if (!IsPostBack)
            {
                txtFromDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
                txtToDate.Text = DateTime.Now.ToString("dd-MM-yyyy");

                KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL();
                System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetDistrictFromState("21");

                ddlDistrict.DataTextField = "DistrictName";
                ddlDistrict.DataValueField = "DistrictCode";
                ddlDistrict.DataSource = dtDistrict;
                ddlDistrict.DataBind();

                ddlDistrict.Items.Insert(0, new ListItem("-Select-", "0"));
            }


            string category = "";
            string DistrictCode = "";


            if (txtFromDate.Text != "" && txtToDate.Text != "")
            {
                FromDate = Convert.ToDateTime(txtFromDate.Text).ToString("yyyy-MM-dd");
                ToDate = Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd");
            }

            if (ddlCategory.SelectedValue != "")
            {
                category = ddlCategory.SelectedValue;
            }

            if (ddlDistrict.SelectedValue != "")
            {
                DistrictCode = ddlDistrict.SelectedValue;
            }

            if (IsPostBack)
            {
                ViewState["Steps"] = 0;
            }
            BindGrid();
        }

        private void BindGrid()
        {

            string category = "";
            string DistrictCode = "";
            string FromDate = "";
            string ToDate = "";

            if (ddlCategory.SelectedValue != "")
            {
                category = ddlCategory.SelectedValue;
            }

            if (ddlDistrict.SelectedValue != "")
            {
                DistrictCode = ddlDistrict.SelectedValue;
            }
            if (txtFromDate.Text != "" && txtToDate.Text != "")
            {
                FromDate = Convert.ToDateTime(txtFromDate.Text).ToString("yyyy-MM-dd");
                ToDate = Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd");
            }
            DataSet dt = m_OUATBLL.OUATScrutinyData(m_ServiceID, LoginID, DistrictCode, category, FromDate, ToDate);
            DataTable dtApp = dt.Tables[0];

            pnlGrid.Controls.Clear();

            //Steps = Convert.ToInt32(ViewState["Steps"].ToString());

            //if (Steps == 0)
            //    btnPrevious.Enabled = false;
            //else
            //    btnPrevious.Enabled = true;

            if (dtApp != null && dtApp.Rows.Count > 0)
            {
                //if (Convert.ToInt64(dtApp.Rows[0]["dscount"]) > 0)
                //{
                //    lbl_Count.Text = t_DS.Tables[4].Rows[0]["dscount"].ToString();
                //    div_Print.Visible = true;
                //}

                //int Count = Convert.ToInt16(lbl_Count.Text);

                //if (Count < 10)
                //{
                //    btnNext.Enabled = false;
                //}
                //else
                //{
                //    btnNext.Enabled = true;
                //}

                for (int i = 0; i < dtApp.Rows.Count; i++)
                {
                    RowID = dtApp.Rows[i]["RowID"].ToString();


                    t_DDList = new DropDownList();
                    t_DDList.ID = RowID + "_ddl_" + i;
                    t_DDList.Height = Unit.Pixel(20);
                    t_DDList.Width = Unit.Pixel(115);
                    t_DDList.Attributes.Add("style", "display:inline;");
                    t_DDList.ClientIDMode = System.Web.UI.ClientIDMode.Static;
                    t_DDList.Items.Add(new ListItem("Select Reason", "0"));
                    t_DDList.Items.Add(new ListItem("Invalid Photograph", "Invalid Photograph"));
                    t_DDList.Items.Add(new ListItem("Invalid Signature", "Invalid Signature"));
                    t_DDList.Items.Add(new ListItem("Invalid Photgraph & Signature", "Invalid Photgraph & Signature"));
                    t_DDList.Items.Add(new ListItem("More Then One Application", "More Then One Applications"));
                    t_DDList.Items.Add(new ListItem("Hold", "Hold"));

                    pnlGrid.Controls.Add(new LiteralControl("<div style='width: 386px; margin: 2px; padding: 2px; border: 1px solid #ccc; float: left;'>"));
                    pnlGrid.Controls.Add(new LiteralControl("<div style='width: 95px; float: left;'>"));
                    t_Image = new Image();
                    //t_Image.ImageUrl = "data:image/png;base64," + dtApp.Rows[i]["ApplicantPhoto"].ToString();
                    t_Image.ImageUrl = dtApp.Rows[i]["ApplicantPhoto"].ToString();
                    t_Image.ID = RowID + "_img_" + i;
                    t_Image.Width = Unit.Pixel(90);
                    t_Image.Height = Unit.Pixel(110);
                    t_Image.Attributes.Add("style", "border: 1px solid #dcdcdc; margin: 1px;");
                    t_Image.ClientIDMode = System.Web.UI.ClientIDMode.Static;
                    pnlGrid.Controls.Add(t_Image);
                    //pnlGrid.Controls.Add(new LiteralControl("<img style='width: 90px; height: 110px; border: 1px solid #dcdcdc; margin: 1px;' src ='../Images/photo.png' />"));
                    pnlGrid.Controls.Add(new LiteralControl("</div>"));
                    pnlGrid.Controls.Add(new LiteralControl("<div style='width: 170px; float: left; margin: 1px 2px; border: 1px solid #ccc; padding: 2px; height: 110px;'>"));
                    pnlGrid.Controls.Add(new LiteralControl("<div style='font-family: Arial !important; font-size: 11px; padding-bottom: 1px;'> "));
                    pnlGrid.Controls.Add(new LiteralControl("Application ID: " + dtApp.Rows[i]["AppID"].ToString()));
                    pnlGrid.Controls.Add(new LiteralControl("</div>"));
                    pnlGrid.Controls.Add(new LiteralControl("<div style='font-family: Arial !important; font-size: 11px; padding-bottom: 1px;' > "));
                    pnlGrid.Controls.Add(new LiteralControl("Name: " + dtApp.Rows[i]["ApplicantName"].ToString()));
                    pnlGrid.Controls.Add(new LiteralControl("</div>"));
                    pnlGrid.Controls.Add(new LiteralControl("<div style='font-family: Arial !important; font-size: 11px;'> DOB (Age): " + dtApp.Rows[i]["DateOfBirth"].ToString() + " (" + dtApp.Rows[i]["Age"].ToString() + ")</div>"));
                    pnlGrid.Controls.Add(new LiteralControl("<div style='font-family: Arial !important; font-size: 11px; padding-bottom: 1px;'>"));
                    pnlGrid.Controls.Add(new LiteralControl("Religion (Category):" + dtApp.Rows[i]["Religion"].ToString() + "(" + dtApp.Rows[i]["Category"].ToString() + ")"));
                    pnlGrid.Controls.Add(new LiteralControl("</div>"));
                    pnlGrid.Controls.Add(new LiteralControl("<div style='font-family: Arial !important; font-size: 11px; padding-bottom: 1px;'> "));
                    pnlGrid.Controls.Add(new LiteralControl("Mobile No.: " + dtApp.Rows[i]["Mobile"].ToString()));
                    pnlGrid.Controls.Add(new LiteralControl("</div>"));
                    pnlGrid.Controls.Add(new LiteralControl("<div style='font-family: Arial !important; font-size: 11px; padding-bottom: 1px;border-top: 1px solid #ccc;'>Reason : "));
                    pnlGrid.Controls.Add(t_DDList);
                    pnlGrid.Controls.Add(new LiteralControl("</div>"));

                    pnlGrid.Controls.Add(new LiteralControl("<div style='font-family: Arial !important; font-size: 11px; padding-bottom: 1px;'> "));
                    //pnlGrid.Controls.Add(new LiteralControl("Payment: Rs.258.00 (SBI-Connect)"));
                    pnlGrid.Controls.Add(new LiteralControl("</div>"));
                    pnlGrid.Controls.Add(new LiteralControl("</div>"));
                    pnlGrid.Controls.Add(new LiteralControl("<div style='width: 105px; float: right; padding:1px;border: 1px solid #dcdcdc'>"));
                    m_Image = new Image();
                    m_Image.ImageUrl = dtApp.Rows[i]["ApplicantSign"].ToString();
                    m_Image.ID = RowID + "_sig_" + i;
                    m_Image.Width = Unit.Pixel(100);
                    m_Image.Height = Unit.Pixel(45);
                    m_Image.Attributes.Add("style", "margin: 1px;");
                    m_Image.ClientIDMode = System.Web.UI.ClientIDMode.Static;
                    pnlGrid.Controls.Add(m_Image);
                    pnlGrid.Controls.Add(new LiteralControl("</div>"));
                    //pnlGrid.Controls.Add(new LiteralControl("<img style='width: 98px; height: 57px; border: 1px solid #ccc; margin: 1px;' src ='../Images/photo.png' />"));
                    pnlGrid.Controls.Add(new LiteralControl("<div style='width: 103px;padding: 1px 0 0 4px; height: 90px;float: right; border: 1px solid #ccc; font-family: Arial; font-size: 10px;'>"));
                    //pnlGrid.Controls.Add(new LiteralControl("<input id='Checkbox1' type ='radio' name ='grpApp' /><span>Approved</span>"));
                    t_Check = new RadioButton();
                    t_Check.ID = RowID + "_chk_" + i;
                    t_Check.GroupName = "App" + i;
                    t_Check.Text = "Approved";

                    t_Check.Attributes.Add("style", "display:inline;");
                    t_Check.ClientIDMode = System.Web.UI.ClientIDMode.Static;
                    pnlGrid.Controls.Add(t_Check);
                    pnlGrid.Controls.Add(new LiteralControl("<br />"));
                    m_Check = new RadioButton();
                    m_Check.ID = RowID + "_rej_" + i;
                    m_Check.GroupName = "App" + i;
                    m_Check.Text = "Not Approved";
                    m_Check.Attributes.Add("style", "display:inline;");
                    m_Check.Attributes.Add("onclick", "CheckComment('" + RowID + "','" + i + "')");
                    m_Check.ClientIDMode = System.Web.UI.ClientIDMode.Static;
                    pnlGrid.Controls.Add(m_Check);


                    pnlGrid.Controls.Add(new LiteralControl("<br />"));
                    m_Check = new RadioButton();
                    m_Check.ID = RowID + "_hold_" + i;
                    m_Check.GroupName = "App" + i;
                    m_Check.Text = "Hold";
                    m_Check.Attributes.Add("style", "display:inline;");
                    m_Check.Attributes.Add("onclick", "CheckCommentHold('" + RowID + "','" + i + "')");
                    m_Check.ClientIDMode = System.Web.UI.ClientIDMode.Static;
                    pnlGrid.Controls.Add(m_Check);


                    pnlGrid.Controls.Add(new LiteralControl("<br />"));
                    t_Anchor = new HtmlAnchor();
                    t_Anchor.InnerHtml = "View Detail";
                    t_Anchor.ID = RowID + "_view_" + i;
                    t_Anchor.Attributes.Add("onclick", "ViewDetail('" + dtApp.Rows[i]["AppID"].ToString() + "', '" + dtApp.Rows[i]["ServiceID"].ToString() + "')");
                    t_Anchor.Attributes.Add("Title", "View detail");
                    t_Anchor.Attributes.Add("style", "display:inline;cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                    t_Anchor.ClientIDMode = System.Web.UI.ClientIDMode.Static;
                    pnlGrid.Controls.Add(t_Anchor);

                    //pnlGrid.Controls.Add(new LiteralControl("<input id='Checkbox2' type='radio' name ='grpApp' /><span>Reject</span>"));
                    pnlGrid.Controls.Add(new LiteralControl("</div>"));
                    pnlGrid.Controls.Add(new LiteralControl("</div>"));

                }

                pnlGrid.Controls.Add(new LiteralControl("<div style='clear: both'></div>"));
            }
            else
            {
                pnlGrid.Controls.Add(new LiteralControl("<div"));
                pnlGrid.Controls.Add(new LiteralControl("<span><b>No Records to display</b></span>"));
                pnlGrid.Controls.Add(new LiteralControl("</div>"));
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        class ScrutinyData
        {
            public string RowID;
            public string Action;
            public string Reason;
            public string Remarks;
        }

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {

            string RowID = "";
            string oldRowID = "";
            bool t_Approved, t_Rejected;
            string t_Action = "";
            t_Approved = t_Rejected = false;
            string t_Reason = "";
            string counter = "";
            DropDownList d = null;
            //List<ScrutinyData> t_ScrutinyDataList = new List<ScrutinyData>();
            List<string> t_ScrutinyDataList = new List<string>();

            for (int i = 0; i < pnlGrid.Controls.Count; i++)
            {
                ScrutinyData t_ScrutinyDataTemp = new ScrutinyData();

                System.Web.UI.Control c = null;
                c = pnlGrid.Controls[i];
                //RowID = "";

                //t_Approved = t_Rejected = false;

                if (i == 0)
                {

                }

                //Get all the values as selected by User in Form for the application

                if (c is DropDownList)
                {
                    d = (DropDownList)c;

                }

                if (c is RadioButton)
                {
                    RadioButton r = (RadioButton)c;

                    RowID = r.ID.Split('_')[0];
                    counter = r.ID.Split('_')[2];

                    t_ScrutinyDataTemp.RowID = RowID;

                    //if (r.Checked)
                    //{
                    //    if (r.ID.Contains("chk"))
                    //    {
                    //        t_Approved = true;
                    //        t_Action = "A";
                    //        t_Reason = "Application Approved by Authority";
                    //    }
                    //    else if (r.ID.Contains("rej"))
                    //    {
                    //        t_Rejected = true;
                    //        t_Action = "R";

                    //        if (d.SelectedItem.Value != "Select Reason")
                    //            t_Reason = d.SelectedItem.Value;
                    //    }
                    //}

                    //var value = t_ScrutinyDataList.Find(item => item.RowID == RowID).RowID;
                    //string value = "";
                    //if (value == null && value == "")



                    if (!t_ScrutinyDataList.Contains(RowID))
                    {
                        r = pnlGrid.FindControl(RowID + "_chk_" + counter) as RadioButton;

                        if (r != null)
                        {
                            if (r.Checked)
                            {
                                t_Approved = true;
                                t_Action = "A";
                                t_Reason = "Application Approved by Authority";
                            }
                        }

                        r = pnlGrid.FindControl(RowID + "_rej_" + counter) as RadioButton;

                        if (r != null)
                        {
                            if (r.Checked)
                            {
                                t_Rejected = true;
                                t_Action = "R";

                                d = pnlGrid.FindControl(RowID + "_ddl_" + counter) as DropDownList;

                                if (d != null)
                                {
                                    //d = (DropDownList)d;

                                    if (d.SelectedItem.Value != "Select Reason")
                                        t_Reason = d.SelectedItem.Value;

                                }
                            }
                        }

                        r = pnlGrid.FindControl(RowID + "_hold_" + counter) as RadioButton;

                        if (r != null)
                        {
                            if (r.Checked)
                            {
                                //t_Rejected = true;
                                t_Action = "H";

                                //d = pnlGrid.FindControl(RowID + "_ddl_" + counter) as DropDownList;

                                //if (d != null)
                                //{
                                //    //d = (DropDownList)d;

                                //    if (d.SelectedItem.Value != "Select Reason")
                                //        t_Reason = d.SelectedItem.Value;

                                //}
                            }
                        }

                        if (t_Action == "")
                        {
                            //t_ScrutinyDataTemp.Action = "";
                            //t_ScrutinyDataTemp.Reason = "";
                            //t_ScrutinyDataTemp.Remarks = "";

                            t_ScrutinyDataList.Add(RowID);
                        }


                    }

                }



                //RowID is changed, now update the action as chosen by Department User for the Application in DB
                if (t_Action != "")
                {
                    //if (RowID != oldRowID)
                    {

                        DataSet t_Result = null;
                        ScrutinyData t_ScrutinyData = new ScrutinyData();

                        //int result = 0;

                        //RowID, t_Action, t_Reason
                        //t_ScrutinyData.RowID = RowID;
                        //t_ScrutinyData.Action = t_Action;
                        //t_ScrutinyData.Reason = t_Reason;
                        //t_ScrutinyData.Remarks = t_Reason;

                        t_ScrutinyDataList.Add(RowID);

                        try
                        {
                            t_Result = m_OUATBLL.ScrutinyApplication("388", RowID, t_Action, t_Reason, "", LoginID);//TODO: TO be activated after proper verififcation.

                            if (t_Result != null && t_Result.Tables[0].Rows.Count > 0)
                            {
                                if (t_Result.Tables[0].Rows[0]["Result"].ToString() == "1")
                                {

                                    string t_SMSText = "";
                                    string t_MailText = "";

                                    string MailID, CCMailID, BCCMailID, Subject, MailText;
                                    MailID = CCMailID = BCCMailID = Subject = MailText = "";



                                    if (t_Action == "A")
                                    {
                                        t_SMSText =
                                            @"Dear @Name,
Application for Recruitment of Constables in 9th SIRB with Reference ID @AppID, is Verified and is @Status  
You will be informed about the Venue and Date time for Physical Mesurment and Physical Efficiency Examination through SMS. 
 
Regards
LOKASEBA ADHIKARA
Common Application Portal (CAP), Odisha";

                                        t_SMSText =
                                            t_SMSText.Replace("@Name", t_Result.Tables[0].Rows[0]["Name"].ToString())
                                                .Replace("@AppID", t_Result.Tables[0].Rows[0]["AppID"].ToString())
                                                .Replace("@Status", t_Result.Tables[0].Rows[0]["Status"].ToString());

                                        t_MailText = @"<!doctype html>
<html>
<head>
    <title>LOKASEBA ADHIKARA - Confirmation Email</title>    
</head>
<body style=""font-family: ''Andada'' , serif; background-color: #E0E0E0;"">
    <div style=""margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff;"">
        <table style=""padding: 1% 0; width: 100%"">
            <tr>
                <td align=""left"">
                    <img src=""http://g2cservices.in/g2c/img/lokaseba_logo.png"" alt=""LOKASEBA ADHIKARA""
                        style=""margin-left: 5%; height: 60px;"" />
                </td>
                <td align=""right"">
                    <img src=""http://g2cservices.in/WebApp/Kiosk/OISF/img/odisha_policelogo.jpg"" alt=""Odisha Police""
                        style=""margin-right: 5%; height: 60px;"" />
                </td>
            </tr>
        </table>

        <div style=""position: relative; background: #10A5DF; border: 1px solid #0C7FB5;"">
            <h1 style=""color: #fff; font-size: 20px; font-weight: bold; line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); text-transform: uppercase; font-family: arial;"">Recruitment of Constables&nbsp; 2016 - 2017</h1>
        </div>
        <div style=""margin: 5% 5% 0;"">
            <p>
                Dear @Name,
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(0, 112, 192);"">Application for Recruitment of Constables in 9th SIRB with <span style=""color: maroon; font-style: normal;"">Reference ID <b>@AppID</b></span>, is Verified and is <b>@Status</b><span class=""Apple-converted-space"">&nbsp;</span></span>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">&nbsp;</span>
            </p>
            <p style="" font-family: Calibri, sans-serif;
            font-size: 11pt;
            color: rgb(0, 0, 0);
            letter-spacing: normal;margin: 0in 0in 0.0001pt; font-variant: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                You will be informed about the Venue and Date time for Physical Mesurment and Physical Efficiency Examination through SMS.</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            </div>
        <div style=""margin:0 5% 5%;"">
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">Regards</span>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13); font-weight: bold;"">LOKASEBA ADHIKARA<br />
                    Common Application Portal (CAP), Odisha</span>
            </p>
        </div>
    </div>
    </body>
</html>";

                                        t_MailText =
                                            t_MailText.Replace("@Name", t_Result.Tables[0].Rows[0]["Name"].ToString())
                                                .Replace("@AppID", t_Result.Tables[0].Rows[0]["AppID"].ToString())
                                                .Replace("@Status", t_Result.Tables[0].Rows[0]["Status"].ToString());


                                    }
                                    else
                                    {
                                        t_SMSText =
                                            @"Dear @Name,
Application for Recruitment of Constables in 9th SIRB with Reference ID @AppID, is Verified and is @Status  
Due to @Reason 
You may apply again.
 
Regards
LOKASEBA ADHIKARA
Common Application Portal (CAP), Odisha";
                                        t_SMSText =
                                            t_SMSText.Replace("@Name", t_Result.Tables[0].Rows[0]["Name"].ToString())
                                                .Replace("@AppID", t_Result.Tables[0].Rows[0]["AppID"].ToString())
                                                .Replace("@Status", t_Result.Tables[0].Rows[0]["Status"].ToString())
                                                .Replace("@Reason", t_Result.Tables[0].Rows[0]["Reason"].ToString());

                                        t_MailText = @"<!doctype html>
<html>
<head>
    <title>LOKASEBA ADHIKARA - Confirmation Email</title>    
</head>
<body style=""font-family: ''Andada'' , serif; background-color: #E0E0E0;"">
    <div style=""margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff;"">
        <table style=""padding: 1% 0; width: 100%"">
            <tr>
                <td align=""left"">
                    <img src=""http://g2cservices.in/g2c/img/lokaseba_logo.png"" alt=""LOKASEBA ADHIKARA""
                        style=""margin-left: 5%; height: 60px;"" />
                </td>
                <td align=""right"">
                    <img src=""http://g2cservices.in/WebApp/Kiosk/OISF/img/odisha_policelogo.jpg"" alt=""Odisha Police""
                        style=""margin-right: 5%; height: 60px;"" />
                </td>
            </tr>
        </table>

        <div style=""position: relative; background: #10A5DF; border: 1px solid #0C7FB5;"">
            <h1 style=""color: #fff; font-size: 20px; font-weight: bold; line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); text-transform: uppercase; font-family: arial;"">Recruitment of Constables&nbsp; 2016 - 2017</h1>
        </div>
        <div style=""margin: 5% 5% 0;"">
            <p>
                Dear @Name,
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(0, 112, 192);"">Application for Recruitment of Constables in 9th SIRB with <span style=""color: maroon; font-style: normal;"">Reference ID <b>@AppID</b></span>, is Verified and is <b>@Status</b><span class=""Apple-converted-space"">&nbsp;</span></span>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">&nbsp;</span>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                Due to @Reason</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                You may apply again.</p>
            </div>
        <div style=""margin:0 5% 5%;"">
            <div class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
            </div>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;</p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                &nbsp;
            </p>

            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13);"">Regards</span>
            </p>
            <p class=""MsoNormal""
                style=""margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);"">
                <span style=""color: rgb(13, 13, 13); font-weight: bold;"">LOKASEBA ADHIKARA<br />
                    Common Application Portal (CAP), Odisha</span>
            </p>
        </div>
    </div>
    </body>
</html>";

                                        t_MailText =
                                            t_MailText.Replace("@Name", t_Result.Tables[0].Rows[0]["Name"].ToString())
                                                .Replace("@AppID", t_Result.Tables[0].Rows[0]["AppID"].ToString())
                                                .Replace("@Status", t_Result.Tables[0].Rows[0]["Status"].ToString())
                                                .Replace("@Reason", t_Result.Tables[0].Rows[0]["Reason"].ToString());
                                    }

                                    MailID = t_Result.Tables[0].Rows[0]["MailID"].ToString();
                                    CCMailID = t_Result.Tables[0].Rows[0]["CCMailID"].ToString();
                                    BCCMailID = t_Result.Tables[0].Rows[0]["BCCMailID"].ToString();
                                    Subject = t_Result.Tables[0].Rows[0]["Subject"].ToString();
                                    MailText = t_Result.Tables[0].Rows[0]["MailText"].ToString();

                                    SendSMS(t_Result.Tables[0].Rows[0]["mobileNo"].ToString(), t_SMSText, "", "", "");
                                    SendMail(MailID, CCMailID, BCCMailID, Subject, MailText, "388", "", "");

                                    //btnSubmit.Visible = false;

                                    //divErr.InnerHtml = "Payment Done Successfully !! Transaction ID is " + t_Result.Tables[0].Rows[0]["TrnID"].ToString();
                                    //divErr.Attributes.Add("class", "success");
                                    //divErr.Style.Add("display", "");
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            //btnSubmit.Visible = false;
                            //divErr.InnerHtml = ex.Message;
                            //divErr.Style.Add("display", "");
                            //divErr.Attributes.Add("class", "error");
                        }

                        //oldRowID = RowID;

                        t_Approved = t_Rejected = false;
                        RowID = "";
                        t_Action = "";
                        t_Reason = "";
                        counter = "";
                    }
                }


                //if (oldRowID == "" && RowID != "")
                //{
                //    oldRowID = RowID;
                //}

                c = null;

            }

            string test = "";
            BindGrid();

        }



        void SendSMS(string MobileNo, string Message, string ServiceID, string ApplicationID, string ProfileID)
        {
            CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();
            test.sendsms(MobileNo, Message, ServiceID, ApplicationID, ProfileID);//TODO: SMS Logic to be improved, wherein, the ServiceID, ProfileID, Application ID is to be saved in the SMS Table, for storing details for each SMS.
        }

        void SendMail(string MailID, string CCMailID, string BCCMailID, string Subject, string MailText, string ServiceID, string ApplicationID, string ProfileID)
        {

            try
            {
                if (MailID != "" && Subject != "" && MailText != "")
                {
                    CitizenPortalLib.CommonUtility.SendEmailWithAttachment(ServiceID, ApplicationID, ProfileID, MailID, CCMailID, BCCMailID,
                        Subject, MailText, true, null);
                }
            }
            catch
            {

            }
        }
    }
}