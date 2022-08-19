using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortal;
using CitizenPortalLib.BLL;
using System.Data;
using System.Web.UI.HtmlControls;

namespace CitizenPortal.WebApp.Kiosk.Forms
{
    public partial class CSCUploadDocument : System.Web.UI.Page
    {
        CitizenDashboardBLL m_CitizenDashboardBLL = new CitizenDashboardBLL();
        string UID = "", ProfileID = "", KeyField = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divErr.Style.Add("display", "none");

                ConfirmPaymentBLL t_ConfirmPaymentBLL = new ConfirmPaymentBLL();

                string t_KioskID = Convert.ToString(HttpContext.Current.Session["KioskID"]);

                DataTable t_DT = t_ConfirmPaymentBLL.GetServiceToPayAtCSC(t_KioskID);

                ddlService.DataTextField = "ServiceName";
                ddlService.DataValueField = "ServiceID";
                ddlService.DataSource = t_DT;
                ddlService.DataBind();
                ddlService.Items.Insert(0, new ListItem("--Select Service--", "0"));
                /*Added for */
               
                UID = Request.QueryString["UID"].ToString();
                ProfileID = Request.QueryString["UID"].ToString();

                // Department = Convert.ToInt32(Session["Department"].ToString());GetCitiZenDashboardGridForDocumentUploadSP
                DataTable dt = null;
                dt = m_CitizenDashboardBLL.GetCitiZenDashboardGridForDocumentUpload(UID, ProfileID, KeyField);
                if (dt != null && dt.Rows.Count > 0)
                {
                    gridview.DataSource = dt;
                    gridview.DataBind();
                }
            }
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
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string m_SvcID, m_AppID;
                ConfirmPaymentBLL t_ConfirmPaymentBLL = new ConfirmPaymentBLL();

                m_SvcID = m_AppID = "";

                m_SvcID = ddlService.SelectedItem.Value;
                m_AppID = txtAppID.Text;
                
                    DataTable t_DT = t_ConfirmPaymentBLL.VerifyApplicationAndPayment(m_SvcID, m_AppID);

                    if (t_DT != null && t_DT.Rows.Count > 0)
                    {
                        if (t_DT.Rows[0]["Result"].ToString() == "1")
                        {
                            
                            divErr.InnerHtml = "Invalid Application Details";
                            divErr.Style.Add("display", "");
                            divErr.Attributes.Add("class", "error");
                        }
                        else if (t_DT.Rows[0]["Result"].ToString() == "2")
                        {
                        Response.Redirect("MakePayment.aspx?SvcID=" + m_SvcID + "&AppID=" + m_AppID);
                        //divErr.InnerHtml = "Payment Status is Pending Please Click on Link And Make Payment";
                        //divErr.InnerHtml += "<a href='MakePayment.aspx?SvcID='"+ m_SvcID + "'&AppID='"+ m_AppID + ">";
                        //divErr.InnerHtml += "Make Payment";
                        //divErr.InnerHtml += "</a>";
                        //divErr.Style.Add("display", "");
                        //divErr.Attributes.Add("class", "error");

                    }
                        else if (t_DT.Rows[0]["Result"].ToString() == "3") //payment done upload document file
                        {
                            Response.Redirect("Attachment.aspx?SvcID=" + m_SvcID + "&AppID=" + m_AppID);
                        }
                        else if (t_DT.Rows[0]["Result"].ToString() == "4") //payment and document file are done
                        {
                            divErr.InnerHtml = "Invalid Request !";
                            divErr.Style.Add("display", "");
                            divErr.Attributes.Add("class", "error");
                        }

                    }
                }
            catch (Exception ex)
            {
                divErr.InnerHtml = ex.Message;
                divErr.Style.Add("display", "");
                divErr.Attributes.Add("class", "error");
            }
        }
    }
}