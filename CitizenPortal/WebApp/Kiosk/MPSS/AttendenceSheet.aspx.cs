using CitizenPortal.WebApp.Common.QRCode;
using CitizenPortalLib;
using CitizenPortalLib.BLL;
using java.lang;
using javax.security.auth;
using Org.BouncyCastle.Asn1.IsisMtt.X509;
using SqlHelper;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class AttendenceSheet : System.Web.UI.Page
    {
        string m_ID, m_Class;
        static data sqlhelper = new data();
        bool iHead = false;


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["ID"] == null) return;


                m_ID = Request.QueryString["ID"].ToString();
                m_Class = Request.QueryString["Class"].ToString();


                DataTable dtApp = new DataTable();
                SqlParameter[] parameter = {
                 new SqlParameter("@Centre_Code", m_ID),
                  new SqlParameter("@Class", m_Class)
                 };

                dtApp = sqlhelper.ExecuteDataTable("[GetAttendenceSheetSP]", parameter);


                if (dtApp.Rows.Count != 0)
                {

                    ItemsList.DataSource = dtApp;
                    ViewState["Data"] = dtApp;
                    ItemsList.DataBind();
                }
            }

            catch
            {

            }
        }

        protected void ItemsList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            DataTable dtApp = new DataTable();
            dtApp = (DataTable)ViewState["Data"];

            if (e.Item.ItemType == ListItemType.Header)
            {


                //// Retrieve the Label control in the current DataListItem.
                //Label txtCentreName = (Label)e.Item.FindControl("txtCentreName");
                //txtCentreName.Text = dtApp.Rows[0]["EXAMCENTERNAME"].ToString();

                //// Retrieve the Label control in the current DataListItem.
                //Label LBLEXAMNAME = (Label)e.Item.FindControl("LBLEXAMNAME");
                //LBLEXAMNAME.Text = dtApp.Rows[0]["EXAMNAME"].ToString();

                //m_ID = Request.QueryString["ID"].ToString();                
                //Label TXTCentre_Code = (Label)e.Item.FindControl("TXTCentre_Code");
                //TXTCentre_Code.Text = m_ID;

                //Label LBLCLASS = (Label)e.Item.FindControl("LBLCLASS");
                //LBLCLASS.Text = Request.QueryString["CLASS"].ToString();

                //if (Is5Valid(e.Item.ItemIndex + 1))
                //{  
                //    if (e.Item.ItemIndex + 2 > 0)
                //    {
                //        Panel pnlHeader = (Panel)e.Item.FindControl("pnlHeader");
                //        pnlHeader.Controls.Add(tblHeader);

                //    }
                //}

            }

           

            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                Panel pnlHeader = (Panel)e.Item.FindControl("pnlHeader");
                if (iHead)
                {
                    pnlHeader.Visible = true;
                }
                iHead = false;
                // Retrieve the Label control in the current DataListItem.
                Label txtCentreName = (Label)e.Item.FindControl("txtCentreName");
                txtCentreName.Text = dtApp.Rows[0]["EXAMCENTERNAME"].ToString();

                // Retrieve the Label control in the current DataListItem.
                Label LBLEXAMNAME = (Label)e.Item.FindControl("LBLEXAMNAME");
                LBLEXAMNAME.Text = dtApp.Rows[0]["EXAMNAME"].ToString();

                m_ID = Request.QueryString["ID"].ToString();
                Label TXTCentre_Code = (Label)e.Item.FindControl("TXTCentre_Code");
                TXTCentre_Code.Text = m_ID;

                Label LBLCLASS = (Label)e.Item.FindControl("LBLCLASS");
                LBLCLASS.Text = Request.QueryString["CLASS"].ToString();


               
                if (e.Item.ItemIndex != 0)
                {   

                    if (Is5Valid(e.Item.ItemIndex + 1))
                    {
                        iHead = true;
                    }
                }
                else
                {
                    pnlHeader.Visible = true;
                }

                var headerRow = (System.Web.UI.HtmlControls.HtmlTableRow)e.Item.FindControl("trHeader");
                var tdRow = (System.Web.UI.HtmlControls.HtmlTableRow)e.Item.FindControl("tdRow");
                if (e.Item.ItemIndex > 0)
                {
                    if (headerRow != null)
                    {
                        //headerRow.Style.Add(HtmlTextWriterStyle.Visibility, "hidden");
                    }
                }
                else
                {
                    headerRow.Attributes["style"] = "border: 1px solid black; border-collapse: collapse;";
                }
                if (Is5Valid(e.Item.ItemIndex+1))
                {

                    tdRow.Attributes["style"] = "border: 1px solid black; border-collapse: collapse;page-break-after: always;";
                }
            }
        }
        public  bool Is5Valid(object value)
        {
            return ((int)value) % 5 == 0;
        }
    }


}
