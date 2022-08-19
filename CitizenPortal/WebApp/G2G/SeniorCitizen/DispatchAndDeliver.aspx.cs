using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CitizenPortalLib.BLL;
using System.Text;
using System.Text.RegularExpressions;

namespace CitizenPortal.WebApp.G2G.SeniorCitizen
{
    
    public partial class DispatchAndDeliver : System.Web.UI.Page
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        SeniorCitizenBLL m_SeniorCitizenBLL = new SeniorCitizenBLL();
        string LoginID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            LoginID = Session["LoginID"].ToString();
            if (!IsPostBack)
            {
                if (LoginID.Contains("ACPReserve"))
                {
                    BindPSList();
                    DivPs.Visible = true;
                    lblHeading.Text = "For Dispatch";
                    
                }
                else
                {
                    DivPs.Visible = false;
                    lblHeading.Text = "For Delivery";
                    Data();
                }
                
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlPS.SelectedIndex > 0)
                {
                    Data();
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DropDownList ddlSts = (DropDownList)e.Row.FindControl("ddlStatusNodal");
                    TextBox TXTRemarks = (TextBox)e.Row.FindControl("TXTRemarksNodal");
                    LinkButton Btn = (LinkButton)e.Row.FindControl("BtnDispatchIndv");
                    LoginID = Session["LoginID"].ToString();

                    if (LoginID.Contains("ACPReserve"))
                    {
                        grdView.HeaderRow.Cells[5].Visible = false;
                        grdView.HeaderRow.Cells[1].Visible = true;
                        e.Row.Cells[5].Visible = false;
                        e.Row.Cells[1].Visible = true;
                        Btn.Text = "Dispatch";
                        
                    }
                    else
                    {
                        grdView.HeaderRow.Cells[5].Visible = true;
                        grdView.HeaderRow.Cells[1].Visible = false;
                        e.Row.Cells[5].Visible = true;
                        e.Row.Cells[1].Visible = false;
                        Btn.Text = "Submit";
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void Data()
        {
            try
            {
                string FromDate = "";
                string ToDate = "";
                string Status = "";
                string category = "";
                string DistrictCode = "";
                string AppID = "";
                string RollNo = "";
                int Department;
                string PoliceStation = "";

                LoginID = Session["LoginID"].ToString();
                Department = Convert.ToInt32(Session["Department"].ToString());

                //if (ddlCategory.SelectedValue != "")
                //{
                //    category = ddlCategory.SelectedValue;
                //}

                //if (ddlCategory.SelectedValue == "0")
                //{
                //    string m_Message = "Please Select Application Type.";
                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                //    return;
                //}

                if (ddlDistrict.SelectedValue != "")
                {
                    DistrictCode = ddlDistrict.SelectedValue;
                }
                if (ddlPS.SelectedIndex > 0)
                {
                    PoliceStation = ddlPS.SelectedItem.Text;
                }
                else
                {
                   
                    if (!LoginID.Contains("ACPReserve"))
                    {
                        PoliceStation = LoginID;
                    }

                }

                if (txtFromDate.Text != "" && txtToDate.Text != "")
                {
                    FromDate = Convert.ToDateTime(txtFromDate.Text).ToString("yyyy-MM-dd");
                    ToDate = Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd");
                }

                if (txtAppID.Text != null && txtAppID.Text != "")
                {
                    AppID = txtAppID.Text;
                    if (AppID.Length != 12)
                    {
                        string m_Message = "Reference ID must be of 12 digit number.";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                        return;
                    }
                }

                DataTable dt = new DataTable();
                dt = m_G2GDashboardBLL.GetSeniorCitizenG2GDispatch(LoginID, Department, category, DistrictCode, FromDate, ToDate, Status, AppID, RollNo, PoliceStation);
                if (dt.Rows.Count > 0)
                {
                    grdView.DataSource = dt;
                    grdView.DataBind();
                    lblMsg.Text = "";
                    lblMsg.Visible = false;
                    grdView.Visible = true;
                    BtnDispatch.Visible = true;
                }
                else
                {

                    //dt.Rows.Add(dt.NewRow());
                    //grdView.DataSource = dt;
                    //grdView.DataBind();
                    //int columncount = grdView.Rows[0].Cells.Count;
                    //grdView.Rows[0].Cells.Clear();
                    //grdView.Rows[0].Cells.Add(new TableCell());
                    //grdView.Rows[0].Cells[0].ColumnSpan = columncount;
                    //grdView.Rows[0].Cells[0].Text = "No Records Found";
                    lblMsg.Text = "No Records Found";
                    lblMsg.Visible = true;
                    grdView.Visible = false;
                    BtnDispatch.Visible = false;
                }

                lblTotalRecords.InnerText = dt.Rows.Count.ToString();
                LoginID = Session["LoginID"].ToString();
                if (LoginID.Contains("ACPReserve"))
                {
                    BtnDispatch.Text = "Dispatched Selected Cards";
                    
                }
                else
                {
                    BtnDispatch.Text = "Submit";
                }

            }
            catch (Exception ex)
            {

            }
        }

        public void BindPSList()
        {
            try
            {
                string DistrictCode = "0";
                DataTable dt = new DataTable();
                dt = m_SeniorCitizenBLL.GetDistrictPoliceStations(DistrictCode);
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlPS.DataSource = dt;
                    ddlPS.DataTextField = "Police_Station";
                    ddlPS.DataValueField = "RowID";
                    ddlPS.DataBind();
                    ddlPS.Items.Insert(0, new ListItem("--Select--", ""));
                }
            }
            catch (Exception e)
            {

            }

        }
        public string GenerateRandomDispatchID()
        {
            Random RNG = new Random();
            var builder = new StringBuilder();
            while (builder.Length < 16)
            {
                builder.Append(RNG.Next(10).ToString());
            }
            var rndnumber = builder.ToString();

            return rndnumber;
        }
        protected void BtnDispatch_Click(object sender, EventArgs e)
        {
            try
            {
                StringBuilder sb = new StringBuilder();
                //sb.AppendLine("<?xml version=\"1.0\" ?>");
                foreach (GridViewRow row in grdView.Rows)
                {
                    string DispatchId = "";
                    string AppID = "";
                    string PoliceStation = "";
                    string Remarks = "";
                    string Status = "";
                    LoginID = Session["LoginID"].ToString();
                    DispatchId = Convert.ToString(GenerateRandomDispatchID());
                    AppID = ((HyperLink)row.FindControl("HPLAppHistory")).Text;
                    TextBox TXTRemarks = (TextBox)row.FindControl("TXTRemarksNodal");
                    Remarks = TXTRemarks.Text;

                    if (LoginID.Contains("ACPReserve"))
                    {
                        //dispatch data
                        PoliceStation = Convert.ToString(ddlPS.SelectedItem.Text);
                        CheckBox ChkItem = (CheckBox)row.FindControl("chkapp");

                        if (!ChkItem.Checked)
                            continue;
                        sb.AppendLine("<DispatchData>");
                        sb.AppendLine("<Data>");
                        sb.AppendLine("<DispatchId>" + DispatchId + "</DispatchId>");
                        sb.AppendLine("<AppID>" + AppID + "</AppID>");
                        sb.AppendLine("<PoliceStation>" + PoliceStation + "</PoliceStation>");
                        sb.AppendLine("<Remarks>" + Remarks + "</Remarks>");
                        sb.AppendLine("<CreatedBy>" + LoginID + "</CreatedBy>");
                        sb.AppendLine("<Status>" + Status + "</Status>");
                        sb.AppendLine("</Data>");
                        sb.AppendLine("</DispatchData>");

                        
                    }
                    else
                    {
                        //deliver data
                        DropDownList ddlSts = (DropDownList)row.FindControl("ddlStatusNodal");
                        Status = ddlSts.SelectedItem.Text;

                        if (ddlSts.SelectedValue == "Select")
                            continue;
                        sb.AppendLine("<DispatchData>");
                        sb.AppendLine("<Data>");
                        sb.AppendLine("<DispatchId>" + DispatchId + "</DispatchId>");
                        sb.AppendLine("<AppID>" + AppID + "</AppID>");
                        sb.AppendLine("<PoliceStation>" + PoliceStation + "</PoliceStation>");
                        sb.AppendLine("<Remarks>" + Remarks + "</Remarks>");
                        sb.AppendLine("<CreatedBy>" + LoginID + "</CreatedBy>");
                        sb.AppendLine("<Status>" + Status + "</Status>");
                        sb.AppendLine("</Data>");
                        sb.AppendLine("</DispatchData>");
                    }
                    

                }
                if (sb.Length > 1)
                {
                    DataTable dt = new DataTable();
                    dt = m_SeniorCitizenBLL.InsertSeniorCitizenDispatchData(sb.ToString(),LoginID);

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        CitizenPortalLib.EMailSMS SMSServices = new CitizenPortalLib.EMailSMS();
                        foreach (DataRow dr in dt.Rows)
                        {
                            //send to applicant
                            if (dr["MobileNo"].ToString() != "")
                            {
                                SMSServices.sendsms(dr["MobileNo"].ToString(), dr["SMSText"].ToString());
                            }
                        }
                        

                        Data();
                        //RedirectPageWithMsg(this.Page, URL_t, "Transaction Refund Reference No For this Request is " + RequestNo + " Kindly Note Down for Further Reference");
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + BtnDispatch.Text + " successfully !');", true);

                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

       
        public static void RedirectPageWithMsg(System.Web.UI.Page page, string url, string Msg)
        {
            String strScript = String.Empty;
            strScript += "alert('" + Msg + "');\n";
            strScript += "function redirectMyPage()\n{\n";
            strScript += "window.location='" + url + "';\n}\n";
            strScript += "setTimeout('redirectMyPage()',1);\n";

            ScriptManager.RegisterStartupScript(page, typeof(Page), "myKey", strScript, true);
        }

        protected void BtnDispatchIndv_Click(object sender, EventArgs e)
        {
            try
            {
                StringBuilder sb = new StringBuilder();
                //sb.AppendLine("<?xml version=\"1.0\" ?>");
                LinkButton BtnDispatch = (LinkButton)sender;
                GridViewRow row = (GridViewRow)BtnDispatch.NamingContainer;
                string DispatchId = "";
                string AppID = "";
                string PoliceStation = "";
                string Remarks = "";
                string Status = "";
                LoginID = Session["LoginID"].ToString();
                DispatchId = Convert.ToString(GenerateRandomDispatchID());
                AppID = ((HyperLink)row.FindControl("HPLAppHistory")).Text;
                TextBox TXTRemarks = (TextBox)row.FindControl("TXTRemarksNodal");
                Remarks = TXTRemarks.Text;

                if (LoginID.Contains("ACPReserve"))
                {
                    //dispatch data
                    PoliceStation = Convert.ToString(ddlPS.SelectedItem.Text);
                    CheckBox ChkItem = (CheckBox)row.FindControl("chkapp");

                    sb.AppendLine("<DispatchData>");
                    sb.AppendLine("<Data>");
                    sb.AppendLine("<DispatchId>" + DispatchId + "</DispatchId>");
                    sb.AppendLine("<AppID>" + AppID + "</AppID>");
                    sb.AppendLine("<PoliceStation>" + PoliceStation + "</PoliceStation>");
                    sb.AppendLine("<Remarks>" + Remarks + "</Remarks>");
                    sb.AppendLine("<CreatedBy>" + LoginID + "</CreatedBy>");
                    sb.AppendLine("<Status>" + Status + "</Status>");
                    sb.AppendLine("</Data>");
                    sb.AppendLine("</DispatchData>");


                }
                else
                {
                    //deliver data
                    DropDownList ddlSts = (DropDownList)row.FindControl("ddlStatusNodal");
                    Status = ddlSts.SelectedItem.Text;

                    if (ddlSts.SelectedValue == "Select")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please select status !');", true);
                    }
                    else
                    {
                        sb.AppendLine("<DispatchData>");
                        sb.AppendLine("<Data>");
                        sb.AppendLine("<DispatchId>" + DispatchId + "</DispatchId>");
                        sb.AppendLine("<AppID>" + AppID + "</AppID>");
                        sb.AppendLine("<PoliceStation>" + PoliceStation + "</PoliceStation>");
                        sb.AppendLine("<Remarks>" + Remarks + "</Remarks>");
                        sb.AppendLine("<CreatedBy>" + LoginID + "</CreatedBy>");
                        sb.AppendLine("<Status>" + Status + "</Status>");
                        sb.AppendLine("</Data>");
                        sb.AppendLine("</DispatchData>");
                    }
                }


                if (sb.Length > 1)
                {
                    DataTable dt = new DataTable();
                    dt = m_SeniorCitizenBLL.InsertSeniorCitizenDispatchData(sb.ToString(), LoginID);

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        CitizenPortalLib.EMailSMS SMSServices = new CitizenPortalLib.EMailSMS();
                        foreach (DataRow dr in dt.Rows)
                        {
                            //send to applicant
                            if (dr["MobileNo"].ToString() != "")
                            {
                                SMSServices.sendsms(dr["MobileNo"].ToString(), dr["SMSText"].ToString());
                            }
                        }


                        Data();
                        //RedirectPageWithMsg(this.Page, URL_t, "Transaction Refund Reference No For this Request is " + RequestNo + " Kindly Note Down for Further Reference");
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + BtnDispatch.Text + " successfully !');", true);

                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}