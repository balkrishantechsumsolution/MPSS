using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Entrance.Login
{
    public partial class Dashboard : System.Web.UI.Page
    {
        CitizenDashboardBLL m_CitizenDashboardBLL = new CitizenDashboardBLL();
        OUATBLL m_OUATBLL = new OUATBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            string UID = "", ProfileID = "", KeyField = "";
            //int Department;

            UID = Request.QueryString["UID"].ToString();
            ProfileID = Request.QueryString["UID"].ToString();
            if (Request.QueryString["KeyField"] != null && Request.QueryString["KeyField"] != "")
            {
                KeyField = Request.QueryString["KeyField"].ToString();
            }
            else
                KeyField = "";

            // Department = Convert.ToInt32(Session["Department"].ToString());
            DataTable dt = null;
            dt = m_OUATBLL.GetCitizenDashboardCSVTU(UID, ProfileID, KeyField);

            gridview.DataSource = dt;
            gridview.DataBind();


            if (Session["HomePage"] == null)
            {
                Session["HomePage"] = "/WebApp/KIOSK/OUAT/UG/OUATDashboard.aspx";
            }

            BindMenu(UID, ProfileID, KeyField);

        }

        private void BindMenu(string UID, string ProfileID, string KeyField)
        {
            string AppID = "", ServiceID = "", PayStatus = "", ShowBrifeCase="", Acknowledgement ="", AdmitCard = ""; ;
            DataTable dt = null;
            dt = m_CitizenDashboardBLL.GetCitizenMenu(UID, ProfileID, KeyField);
            if (dt.Rows.Count > 0) {
                ProfileID = dt.Rows[0]["ProfileID"].ToString();
                AppID = dt.Rows[0]["AppID"].ToString();
                ServiceID = dt.Rows[0]["ServiceID"].ToString();
                PayStatus = dt.Rows[0]["PayStatus"].ToString();
                ShowBrifeCase = dt.Rows[0]["ShowBrifeCase"].ToString();
                Acknowledgement = dt.Rows[0]["Acknowledgement"].ToString();
                AdmitCard = dt.Rows[0]["AdmitCard"].ToString();
            }

            pnlMenu.Controls.Clear();



            /* */
            if (ShowBrifeCase == "Show")
            {
                pnlMenu.Controls.Add(new LiteralControl("<div style='min-height: 4.66em; z-index: -760;' class='SrvDiv' id='106'>"));
                pnlMenu.Controls.Add(new LiteralControl("<a href='/WebApp/Kiosk/Forms/Attachment.aspx?SvcId=" + ServiceID + "&AppID=" + AppID + "&UID=" + ProfileID + "&ProfileID=" + ProfileID + "'>"));
                pnlMenu.Controls.Add(new LiteralControl("<img src='/Sambalpur/img/DigiVarsity.png' alt='' align='left' style='height: 70px;' />"));
                pnlMenu.Controls.Add(new LiteralControl("</a><a href='/WebApp/Kiosk/Forms/Attachment.aspx?SvcId=" + ServiceID + "&AppID=" + AppID + "&UID=" + ProfileID + "&ProfileID=" + ProfileID + "'>Document Brief Case</a>"));
                pnlMenu.Controls.Add(new LiteralControl("<br />"));
                pnlMenu.Controls.Add(new LiteralControl("<span>Click to View Uploaded Document (till 10.09.2021 05:00 PM )</span>"));
                pnlMenu.Controls.Add(new LiteralControl("</div>"));
            }
            if (PayStatus == "UnPaid")
            {
                pnlMenu.Controls.Add(new LiteralControl("<div style='min-height: 4.66em; z-index: -760;' class='SrvDiv' id='104'>"));
                pnlMenu.Controls.Add(new LiteralControl("<a href='/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcId=" + ServiceID + "&AppID=" + AppID + "&UID=" + ProfileID + "&ProfileID=" + ProfileID + "'>"));
                pnlMenu.Controls.Add(new LiteralControl("<img src='/Sambalpur/img/DigiVarsity.png' alt='' align='left' style='height: 70px;' />"));
                pnlMenu.Controls.Add(new LiteralControl("</a><a href='/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcId=" + ServiceID + "&AppID=" + AppID + "&UID=" + ProfileID + "&ProfileID=" + ProfileID + "'>Make Payment</a>"));
                pnlMenu.Controls.Add(new LiteralControl("<br />"));
                pnlMenu.Controls.Add(new LiteralControl("<span>Click to Pay Application Fee</span>"));
                pnlMenu.Controls.Add(new LiteralControl("</div>"));
            }
            if (Acknowledgement == "Show")
            {
                pnlMenu.Controls.Add(new LiteralControl("<div style='min-height: 4.66em; z-index: -760;' class='SrvDiv' id='107'>"));
                pnlMenu.Controls.Add(new LiteralControl("<a href='/WebApp/Kiosk/Forms/Acknowledgement.aspx?SvcId=" + ServiceID + "&AppID=" + AppID + "&UID=" + ProfileID + "&ProfileID=" + ProfileID + "'>"));
                pnlMenu.Controls.Add(new LiteralControl("<img src='/Sambalpur/img/DigiVarsity.png' alt='' align='left' style='height: 70px;' />"));
                pnlMenu.Controls.Add(new LiteralControl("</a><a href='/WebApp/Kiosk/Forms/Acknowledgement.aspx?SvcId=" + ServiceID + "&AppID=" + AppID + "&UID=" + ProfileID + "&ProfileID=" + ProfileID + "'>Acknowledgement</a>"));
                pnlMenu.Controls.Add(new LiteralControl("<br />"));
                pnlMenu.Controls.Add(new LiteralControl("<span>Click to View Filled Application</span>"));
                pnlMenu.Controls.Add(new LiteralControl("</div>"));
            }

            if (AdmitCard == "Show")
            {
                pnlMenu.Controls.Add(new LiteralControl("<div style='min-height: 4.66em; z-index: -760;' class='SrvDiv' id='108'>"));
                pnlMenu.Controls.Add(new LiteralControl("<a href='/WebApp/Entrance/PhD/PhDAdmitCard.aspx?SvcId=" + ServiceID + "&AppID=" + AppID + "&UID=" + ProfileID + "&ProfileID=" + ProfileID + "'>"));
                pnlMenu.Controls.Add(new LiteralControl("<img src='/Sambalpur/img/DigiVarsity.png' alt='' align='left' style='height: 70px;' />"));
                pnlMenu.Controls.Add(new LiteralControl("</a><a href='/WebApp/Entrance/PhD/PhDAdmitCard.aspx?SvcId=" + ServiceID + "&AppID=" + AppID + "&UID=" + ProfileID + "&ProfileID=" + ProfileID + "'>Admit Card</a>"));
                pnlMenu.Controls.Add(new LiteralControl("<br />"));
                pnlMenu.Controls.Add(new LiteralControl("<span>Click to View Download Admit Card</span>"));
                pnlMenu.Controls.Add(new LiteralControl("</div>"));
            }


            /*Add for Doc file upload on 1 Aug 2017*/

            //pnlMenu.Controls.Add(new LiteralControl("<div style='min-height: 4.66em; z-index: -760;' class='SrvDiv' id='106'>"));
            //pnlMenu.Controls.Add(new LiteralControl("<a href='/WebApp/Kiosk/Forms/CSCUploadDocument.aspx?UID=" + ProfileID + "'>"));
            //pnlMenu.Controls.Add(new LiteralControl("<img src='/webapp/kiosk/Images/odisalogo_1.png' alt='' align='left' style='height: 70px;' />"));
            //pnlMenu.Controls.Add(new LiteralControl("</a><a href='/WebApp/Kiosk/Forms/CSCUploadDocument.aspx?UID=" + ProfileID + "&ProfileID=" + ProfileID + "'>Upload Document File</a>"));
            //pnlMenu.Controls.Add(new LiteralControl("<br />"));
            //pnlMenu.Controls.Add(new LiteralControl("<span>Upload all document used in services</span>"));
            //pnlMenu.Controls.Add(new LiteralControl("</div>"));
        }

        DataControlFieldCell GetCellByName(GridViewRow Row, String CellName)
        {
            foreach (DataControlFieldCell Cell in Row.Cells)
            {
                if (Cell.ContainingField.ToString() == CellName)
                    return Cell;
            }
            return null;
        }

        protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int i = 0;
                HtmlAnchor t_Anchor = null;

                string t_PaymentStatus = "U";
                string t_AckURL = "";

                TableCell Cell = GetCellByName(e.Row, "PaymentStatus");

                if (Cell != null && Cell.Text != "")
                {
                    if (Cell.Text.ToUpper() == "PAID")
                    {
                        t_PaymentStatus = "P";
                    }
                }

                Cell = GetCellByName(e.Row, "View");

                if (Cell != null && Cell.Text != "" && Cell.Text != "&nbsp;")
                {
                    t_AckURL = Cell.Text.Replace("&nbsp;", "");
                }

                i = e.Row.Cells.Count - 1;

                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "TakeAction_" + e.Row.RowIndex;

                t_Anchor.InnerHtml = "View";

                t_Anchor.Attributes.Add("onclick", "TakeAction('" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[2].Text + "', '" + t_PaymentStatus + "', '" + t_AckURL + "')");

                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[i].Controls.Add(t_Anchor);
                e.Row.Cells[i].Attributes.Add("Title", "View");
                e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");

                i++;

                t_Anchor = null;

                int j = 0;
                j = e.Row.Cells.Count - 2;
                HtmlAnchor t_Status = null;
                t_Status = new HtmlAnchor();


                if (e.Row.Cells[6].Text == "Sent Back")
                {

                    t_Status.ID = "ShowAction_" + e.Row.RowIndex;
                    t_Status.InnerHtml = e.Row.Cells[6].Text;
                    t_Status.Attributes.Add("onclick", "ShowAction('" + e.Row.Cells[0].Text + "','" + e.Row.Cells[2].Text + "')");



                    t_Status.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                    e.Row.Cells[j].Controls.Add(t_Status);
                    e.Row.Cells[j].Attributes.Add("Title", e.Row.Cells[6].Text);
                    e.Row.Cells[j].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");

                    j++;
                }
                //if (e.Row.Cells[6].Text == "Sent Back" || e.Row.Cells[6].Text == "Paid")
                else if (e.Row.Cells[6].Text.ToUpper() == "ONHOLD")
                {

                    t_Status.ID = "ShowAction_" + e.Row.RowIndex;
                    t_Status.Title = "Edit";
                    t_Status.InnerHtml = e.Row.Cells[6].Text;
                    t_Status.Attributes.Add("onclick", "ShowActionEdit('" + e.Row.Cells[0].Text + "','" + e.Row.Cells[2].Text + "')");
                    t_Status.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                    e.Row.Cells[j].Controls.Add(t_Status);
                    e.Row.Cells[j].Attributes.Add("Title", e.Row.Cells[6].Text);
                    e.Row.Cells[j].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                    j++;
                }
                t_Status = null;




            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {

                e.Row.Cells[0].Attributes.Add("style", "display:none");
                e.Row.Cells[1].Attributes.Add("style", "display:none");
            }
        }

        protected void grdView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //GetSelectedRec();
            gridview.PageIndex = e.NewPageIndex;
            gridview.DataBind();
        }
    }
}