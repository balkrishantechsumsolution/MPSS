using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using Encryption.AES;
using iTextSharp.text.pdf;
using Newtonsoft.Json;
using Org.BouncyCastle.Asn1.Cmp;
using SqlHelper;
using sun.security.jca;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using static DevExpress.Web.Internal.HiddenFieldUtils;


namespace CitizenPortal.WebApp.Kiosk.ADMIN
{
    public partial class ApprovalList : System.Web.UI.Page
    {
        static data sqlhelper = new data();
        private GridView gv;
        int i = 0;
        string m_AppID, m_ServiceID;
        string m_UserType;
        bool m_SkipPayment = false;

        string m_PayeeName = "";
        string m_PayeeMobile = "";
        string m_PayeeEmailID = "";

        string m_PgAppID = "", m_ProfileId = "";
        protected void Page_Init(object sender, EventArgs e)
        {
            i = 0;
            gv = new GridView();

            gv.ID = "gv";
            gv.AutoGenerateColumns = true;
            gv.Columns.Add(new TemplateField());
            gv.RowCreated += gv_RowCreated;
            gv.RowDataBound += gv_RowDataBound;
            gv.PageIndexChanging += gv_PageIndexChanged;
            gv.AllowPaging = true;
            gv.PageSize = 50;

            pnl.Controls.Add(gv);

            BindGrid();
        }

        public void BindGrid()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = ShowData();
                ViewState["CurrentTable"] = dt;
                ViewState["Paging"] = dt;
                gv.DataSource = dt;
                gv.DataBind();
                lblTotal.Text = "Total Rows: " + dt.Rows.Count;
            }

            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);



            }
        }

        protected void gv_PageIndexChanged(object sender, GridViewPageEventArgs e)
        {
            gv.PageIndex = e.NewPageIndex;
            gv.DataSource = ViewState["Paging"];
            gv.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginID"].ToString() == null)
            {
                return;
            }

        }

        void gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowType != DataControlRowType.Header && e.Row.RowType != DataControlRowType.Footer)
            {
                LinkButton lb1 = new LinkButton();
                lb1.ID = "Attachment";
                lb1.Text = "Attachment";
                lb1.Command += lb1_Command;

                lb1.ToolTip = "Attachment";
                lb1.CssClass = "tagBubbleAttachment";
                lb1.CommandName = "Attachment";
                lb1.CommandArgument = e.Row.RowIndex.ToString();
                e.Row.Cells[1].Controls.Add(lb1);




                LinkButton lb = new LinkButton();
                lb.ID = "View";
                lb.Text = "View";
                lb.Command += lb_Command;

                lb.ToolTip = "View";
                lb.CssClass = "tagBubbleView";
                lb.CommandName = "View";
                lb.CommandArgument = e.Row.RowIndex.ToString();

                e.Row.Cells[2].Controls.Add(lb);



                TableCell cell = e.Row.Cells[e.Row.Cells.Count - 1];

                string PaymentMode = cell.Text;
                if (PaymentMode == "Unpaid")
                {
                    cell.BackColor = Color.Red;
                }

                //CheckBox headerchk = (CheckBox)gv.HeaderRow.FindControl("chkApproval-1");
                //headerchk.Attributes.Add("onclick", "javascript:SelectheaderCheckboxes('" + headerchk.ClientID + "')");
                //CheckBox childchk = (CheckBox)e.Row.FindControl("chkApproval"+ e.Row.RowIndex);
                //childchk.Attributes.Add("onclick", "javascript:Selectchildcheckboxes('" + headerchk.ClientID + "')");


            }

        }

        void gv_RowCreated(object sender, GridViewRowEventArgs e)
        {
            //CheckBox chk = new CheckBox();
            //chk.ID = "chkApproval" + e.Row.RowIndex;
            ////chk.Click += chk_Click;
            //e.Row.Cells[0].Controls.Add(chk);

            LinkButton lb = new LinkButton();
            lb.ID = "Pay";
            lb.Text = "Pay";
            lb.Command += lb_Command;

            lb.ToolTip = "Pay";
            lb.CssClass = "tagBubblePay";
            lb.CommandName = "Pay";
            lb.CommandArgument = e.Row.RowIndex.ToString();

            e.Row.Cells[0].Controls.Add(lb);

            lb.Attributes.Add("onclick", "javascript:GetPayment('" + e.Row.RowIndex.ToString() + "')");


        }

        void lb1_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Attachment")
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];

                var lb = (LinkButton)sender;
                var i = int.Parse(lb.CommandArgument);
                if (i >= 0)
                {
                    string ID = dt.Rows[i]["SchoolID"].ToString();
                    string AppID = "";
                    string newWin = "";
                    newWin = "window.open(\"/WebApp/Kiosk/MPSS/MPSSAttachmentShows.aspx?ID=" + ID + "&AppID=" + AppID + "&SvcID=1466&TypeID=1\", \"_blank\", \"WIDTH=1080,HEIGHT=790,scrollbars=no, menubar=no,resizable=yes,directories=no,location=no\");";

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "pop", newWin, true);
                }
            }

        }

        void lb_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];

                var lb = (LinkButton)sender;
                var i = int.Parse(lb.CommandArgument);
                if (i >= 0)
                {
                    string SchoolID = dt.Rows[i]["SchoolID"].ToString();
                    string Amountdate = dt.Rows[i]["Amountdate"].ToString();
                    Response.Redirect("~/WebApp/Kiosk/ADMIN/MPSSStudentDetails.aspx?SchoolID=" + SchoolID + "&Amountdate=" + Amountdate);
                }
            }
            if (e.CommandName == "Pay")
            {
                try
                {
                    string text = "";
                    string Data = hdPaymentData.Value;
                    string jsonData = Data.Replace("\n", "");
                    JavaScriptSerializer js = new JavaScriptSerializer();
                    var viewModel = js.Deserialize<DataCls[]>(jsonData);

                    SafeXPaymentGateway(viewModel);

                    //var m_TransID = dt.Rows[0]["TransID"].ToString();
                    //var m_ServiceID = "1466";

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "pop", "alert('Payment Submitted Successfully.');", true);


                }
                catch (System.Exception ex)
                {
                    string msg = "";
                    msg = ex.Message;

                    throw new System.Exception(msg);
                }
            }

        }
        protected DataTable ShowData()
        {
            DataTable dt = new DataTable();
            SqlParameter[] parameter = {
                 new SqlParameter("@Fromdate", txtFromdate.Text),
                  new SqlParameter("@Todate", txtTodate.Text),
                 new SqlParameter("@SvcID", "1466")
            };

            dt = sqlhelper.ExecuteDataTable("MPSSPaymentDetaisForApproval", parameter);

            return dt;
        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            ExportGridToExcel();
        }
        private void ExportGridToExcel()
        {
            DataTable dt = new DataTable();
            dt = ShowData();
            string attachment = "attachment; filename=DB.xls";
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/vnd.ms-excel";
            string tab = "";
            foreach (DataColumn dc in dt.Columns)
            {
                Response.Write(tab + dc.ColumnName);
                tab = "\t";
            }
            Response.Write("\n");
            int i;
            foreach (DataRow dr in dt.Rows)
            {
                tab = "";
                for (i = 0; i < dt.Columns.Count; i++)
                {
                    Response.Write(tab + dr[i].ToString());
                    tab = "\t";
                }
                Response.Write("\n");
            }
            Response.End();
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebApp/Kiosk/ADMIN/AdminDashboard.aspx");
        }
        protected void btnPayment_Click(object sender, EventArgs e)
        {
            try
            {
                string text = "";
                string Data = hdPaymentData.Value;
                string jsonData = Data.Replace("\n", "");
                JavaScriptSerializer js = new JavaScriptSerializer();
                var viewModel = js.Deserialize<DataCls[]>(jsonData);


                //DataTable dtAll = new DataTable();
                //SqlParameter[] parameter = {
                //         new SqlParameter("@amtDate", viewModel[0].amtDate),
                //          new SqlParameter("@userId", viewModel[0].userId),
                //           new SqlParameter("@totalStudent", viewModel[0].totalStudent),
                //            new SqlParameter("@BankAccNo", viewModel[0].BankAccNo),
                //             new SqlParameter("@BankAccIFFSC", viewModel[0].BankAccIFFSC),
                //              new SqlParameter("@amt", viewModel[0].amt),
                //            new SqlParameter("@LoginID", HttpContext.Current.Session["LoginID"].ToString() ),
                //};

                //DataSet result = sqlhelper.ExecuteDataTableNon("InsertPaymentByAdminMPSOS", parameter);
                //DataTable dt = result.Tables[0];

                SafeXPaymentGateway(viewModel);

                //var m_TransID = dt.Rows[0]["TransID"].ToString();
                //var m_ServiceID = "1466";

                Page.ClientScript.RegisterStartupScript(this.GetType(), "pop", "alert('Payment Submitted Successfully.');", true);


            }
            catch (System.Exception ex)
            {
                string msg = "";
                msg = ex.Message;

                throw new System.Exception(msg);
            }
        }

        private void SafeXPaymentGateway(DataCls[] dataCLS)
        {
            string amount = "";
            string cust_name = "";
            string email_id = "";
            string mobile_no = "";
            string unique_id = "";// Guid.NewGuid().ToString();
            string is_logged_in = "Y";
            string m_ProfileID = "";// Session["ProfileID"].ToString();
            string t_AppID = "";

            if (Session["UserType"].ToString().ToUpper() == "CITIZEN")
            {
                m_ProfileID = Session["ProfileID"].ToString();
            }
            else { m_ProfileID = Session["LoginID"].ToString(); }

            DataTable dtAll = new DataTable();
            SqlParameter[] parameter = {
                     new SqlParameter("@AppID", dataCLS[0].userId),
                      new SqlParameter("@ServiceID", "1466"),
                       new SqlParameter("@UserType",HttpContext.Current.Session["LoginID"].ToString() ),

            };

            DataSet dt = sqlhelper.ExecuteDataTableNon("GetPaymentInfoSP", parameter);


            if (dt != null && dt.Tables[0].Rows.Count > 0)
            {
                DataTable AppDetails = dt.Tables[0];

                //lblAppDate.InnerText = Convert.ToDateTime(AppDetails.Rows[0]["AppDate"]).ToString("dd/MM/yyyy HH:mm:ss");
                //lblAppID.InnerText = AppDetails.Rows[0]["AppID"].ToString();
                //lblAppName.InnerText = AppDetails.Rows[0]["AppName"].ToString();
                ////lblServiceID.InnerText = AppDetails.Rows[0]["ServiceID"].ToString();
                //lblServiceName.InnerText = AppDetails.Rows[0]["ServiceName"].ToString();
                //lblCreatedBy.InnerText = AppDetails.Rows[0]["CreatedBy"].ToString();

                m_PayeeName = AppDetails.Rows[0]["PayeeName"].ToString();
                m_PayeeMobile = AppDetails.Rows[0]["PayeeMobile"].ToString();
                m_PayeeEmailID = AppDetails.Rows[0]["PayeeEmailID"].ToString();

                cust_name = m_PayeeName;
                email_id = m_PayeeEmailID;
                mobile_no = m_PayeeMobile;
                unique_id = AppDetails.Rows[0]["AppID"].ToString();
                is_logged_in = "Y";

            }

            if (dt != null && dt.Tables[1].Rows.Count > 0)
            {
                DataTable FeeDetails = dt.Tables[1];
                amount = FeeDetails.Rows[0]["txn_amount"].ToString();
            }

            string ag_id = "Paygate";
            string me_id = ConfigurationManager.AppSettings["MEID"].ToString();  //"202104210302";
            string me_key = ConfigurationManager.AppSettings["MEKey"].ToString();  //"n2B808GWxEls3oFzOz6wfxgEpSfPaQunLCU54vDJty4=";
            string order_no = Guid.NewGuid().ToString();// HFOrderNo.Value;

            string country = "IND";
            string currency = "INR";
            string txn_type = "SALE";
            string success_url = ConfigurationManager.AppSettings["PGSuccessURL"].ToString(); //"http://localhost:53056/PaymentGateway/MerchantSuccess.aspx";
            string failure_url = ConfigurationManager.AppSettings["PGFailurePayURL"].ToString(); //"http://localhost:53056/PaymentGateway/MerchantFailure.aspx";
            string channel = "WEB";
            string pg_id = "";

            string txnagId = (!String.IsNullOrEmpty(ag_id)) ? ag_id : string.Empty;
            string txnmerchantId = (!String.IsNullOrEmpty(me_id)) ? me_id : string.Empty;
            string txnmerchantKey = (!String.IsNullOrEmpty(me_key)) ? me_key : string.Empty;

            string txnorderNumber = (!String.IsNullOrEmpty(order_no)) ? order_no : string.Empty;
            string txnAmount = (!String.IsNullOrEmpty(amount)) ? amount : string.Empty;
            string txnCountry = (!String.IsNullOrEmpty(country)) ? country : string.Empty;
            string txnCountryCurrency = (!String.IsNullOrEmpty(currency)) ? currency : string.Empty;
            string txnType = (!String.IsNullOrEmpty(txn_type)) ? txn_type : string.Empty;
            string txnsuccessUrl = (!String.IsNullOrEmpty(success_url)) ? success_url : string.Empty;
            string txnfailureUrl = (!String.IsNullOrEmpty(failure_url)) ? failure_url : string.Empty;
            string txnChannel = (!String.IsNullOrEmpty(channel)) ? channel : string.Empty;

            string pgId = (!String.IsNullOrEmpty(pg_id)) ? pg_id : string.Empty;
            string pgPayMode = "";// (!String.IsNullOrEmpty(paymode.Items[paymode.SelectedIndex].Value)) ? paymode.Items[paymode.SelectedIndex].Value : string.Empty;
            string pgscheme = string.Empty;// "";// (!String.IsNullOrEmpty(scheme.Value)) ? scheme.Value : string.Empty;
            string pgEmiMonths = "";// (!String.IsNullOrEmpty(emi_months.Value)) ? emi_months.Value : string.Empty;

            string ccCardNo = "";// (!String.IsNullOrEmpty(card_no.Value)) ? card_no.Value : string.Empty;
            string ccExpMonth = "";// (!String.IsNullOrEmpty(exp_month.Items[exp_month.SelectedIndex].Value)) ? exp_month.Items[exp_month.SelectedIndex].Value : string.Empty;
            string ccexpYear = "";// (!String.IsNullOrEmpty(exp_year.Items[exp_year.SelectedIndex].Value)) ? exp_year.Items[exp_year.SelectedIndex].Value : string.Empty;
            string ccCardName = "";// (!String.IsNullOrEmpty(card_name.Value)) ? card_name.Value : string.Empty;
            string ccCvv2 = "";// (!String.IsNullOrEmpty(cvv2.Value)) ? cvv2.Value : string.Empty;

            string custName = "";// (!String.IsNullOrEmpty(cust_name)) ? cust_name : string.Empty;
            string custEmailId = "";// (!String.IsNullOrEmpty(email_id)) ? email_id : string.Empty;
            string custMobileNo = "";// (!String.IsNullOrEmpty(mobile_no)) ? mobile_no : string.Empty;
            string custUniqueId = "";// (!String.IsNullOrEmpty(unique_id)) ? unique_id : string.Empty;
            string custisLoggedIn = "";// (!String.IsNullOrEmpty(is_logged_in)) ? is_logged_in : string.Empty;

            string billAddress = "";// (!String.IsNullOrEmpty(bill_address.Value)) ? bill_address.Value : string.Empty;
            string billCity = "";// (!String.IsNullOrEmpty(bill_city.Value)) ? bill_city.Value : string.Empty;
            string billState = "";// (!String.IsNullOrEmpty(bill_state.Value)) ? bill_state.Value : string.Empty;
            string billCountry = "";//  (!String.IsNullOrEmpty(bill_country.Value)) ? bill_country.Value : string.Empty;
            string billZip = "";// (!String.IsNullOrEmpty(bill_zip.Value)) ? bill_zip.Value : string.Empty;

            string shipAddress = "";//  (!String.IsNullOrEmpty(ship_address.Value)) ? ship_address.Value : string.Empty;
            string shipCity = "";//  (!String.IsNullOrEmpty(ship_city.Value)) ? ship_city.Value : string.Empty;
            string shipState = "";// (!String.IsNullOrEmpty(ship_state.Value)) ? ship_state.Value : string.Empty;
            string shipCountry = "";//  (!String.IsNullOrEmpty(ship_country.Value)) ? ship_country.Value : string.Empty;
            string shipZip = "";// (!String.IsNullOrEmpty(ship_zip.Value)) ? ship_zip.Value : string.Empty;
            string shipDays = "";// (!String.IsNullOrEmpty(ship_days.Value)) ? ship_days.Value : string.Empty;
            string shipAddressCount = "";// (!String.IsNullOrEmpty(address_count.Value)) ? address_count.Value : string.Empty;

            string itemCount = "";// (!String.IsNullOrEmpty(item_count.Value)) ? item_count.Value : string.Empty;
            string itemValue = "";// (!String.IsNullOrEmpty(item_value.Value)) ? item_value.Value : string.Empty;
            string itemCategory = "";// (!String.IsNullOrEmpty(item_category.Value)) ? item_category.Value : string.Empty;


            string udf_1 = m_AppID;
            string udf_2 = m_ServiceID;
            string udf_3 = "/WebApp/Kiosk/Forms/Acknowledgement.aspx";
            string udf_4 = m_ProfileID;
            string udf_5 = m_PgAppID;

            string udf1 = (!String.IsNullOrEmpty(udf_1)) ? udf_1 : string.Empty;
            string udf2 = (!String.IsNullOrEmpty(udf_2)) ? udf_2 : string.Empty;
            string udf3 = (!String.IsNullOrEmpty(udf_3)) ? udf_3 : string.Empty;
            string udf4 = (!String.IsNullOrEmpty(udf_4)) ? udf_4 : string.Empty;
            string udf5 = (!String.IsNullOrEmpty(udf_5)) ? udf_5 : string.Empty;


            string txn_details = txnagId + "|" + txnmerchantId + "|" + txnorderNumber + "|" + txnAmount + "|" + txnCountry + "|" + txnCountryCurrency + "|" + txnType + "|" + txnsuccessUrl + "|" + txnfailureUrl + "|" + txnChannel;
            string pg_details = pgId + "|" + pgPayMode + "|" + pgscheme + "|" + pgEmiMonths;
            string card_details = ccCardNo + "|" + ccExpMonth + "|" + ccexpYear + "|" + ccCvv2 + "|" + ccCardName;
            string cust_details = custName + "|" + custEmailId + "|" + custMobileNo + "|" + custUniqueId + "|" + custisLoggedIn;
            string bill_details = billAddress + "|" + billCity + "|" + billState + "|" + billCountry + "|" + billZip;
            string ship_details = shipAddress + "|" + shipCity + "|" + shipState + "|" + shipCountry + "|" + shipZip + "|" + shipDays + "|" + shipAddressCount;
            string item_details = itemCount + "|" + itemValue + "|" + itemCategory;
            string other_details = udf1 + "|" + udf2 + "|" + udf3 + "|" + udf4 + "|" + udf5;

            MyCryptoClass aes = new MyCryptoClass();
            string enc_txn_details = aes.encrypt(txn_details);
            string enc_pg_details = aes.encrypt(pg_details);
            string enc_card_details = aes.encrypt(card_details);
            string enc_cust_details = aes.encrypt(cust_details);
            string enc_bill_details = aes.encrypt(bill_details);
            string enc_ship_details = aes.encrypt(ship_details);
            string enc_item_details = aes.encrypt(item_details);
            string enc_other_details = aes.encrypt(other_details);


            NameValueCollection data = new NameValueCollection();
            data.Add("me_id", txnmerchantId);
            data.Add("txn_details", enc_txn_details);
            data.Add("pg_details", enc_pg_details);
            data.Add("card_details", enc_card_details);
            data.Add("cust_details", enc_cust_details);
            data.Add("bill_details", enc_bill_details);
            data.Add("ship_details", enc_ship_details);
            data.Add("item_details", enc_item_details);
            data.Add("other_details", enc_other_details);
            //--=======================



            m_AppID = dataCLS[0].userId;
            m_ServiceID = "1466";

            decimal Amount = decimal.Parse(dataCLS[0].amt);
            decimal Portal = 0.00M;
            decimal STax = 0.00M;
            SafeXPayRequest_DT ObjRequest_DT = new SafeXPayRequest_DT();



            ObjRequest_DT.ag_id = ag_id;
            ObjRequest_DT.me_id = me_id;
            ObjRequest_DT.order_no = order_no;
            ObjRequest_DT.Amount = amount;
            ObjRequest_DT.Country = country;
            ObjRequest_DT.Currency = currency;
            ObjRequest_DT.txn_type = txn_type;
            ObjRequest_DT.success_url = success_url;
            ObjRequest_DT.failure_url = failure_url;
            ObjRequest_DT.Channel = channel;
            ObjRequest_DT.pg_id = pg_id;
            ObjRequest_DT.Paymode = pgPayMode;

            ObjRequest_DT.Scheme = pgscheme;
            ObjRequest_DT.emi_months = pgEmiMonths;
            ObjRequest_DT.card_no = ccCardNo;
            ObjRequest_DT.exp_month = ccExpMonth;
            ObjRequest_DT.exp_year = ccexpYear;
            ObjRequest_DT.cvv = ccCvv2;
            ObjRequest_DT.card_name = ccCardName;
            ObjRequest_DT.cust_name = cust_name;
            ObjRequest_DT.email_id = email_id;
            ObjRequest_DT.mobile_no = mobile_no;
            ObjRequest_DT.unique_id = unique_id;
            ObjRequest_DT.is_logged_in = is_logged_in;
            ObjRequest_DT.bill_address = billAddress;
            ObjRequest_DT.bill_city = billCity;
            ObjRequest_DT.bill_state = billState;
            ObjRequest_DT.bill_country = billCountry;
            ObjRequest_DT.bill_zip = billZip;
            ObjRequest_DT.ship_address = shipAddress;
            ObjRequest_DT.ship_city = shipCity;
            ObjRequest_DT.ship_state = shipState;
            ObjRequest_DT.ship_country = shipCountry;
            ObjRequest_DT.ship_zip = shipZip;
            ObjRequest_DT.ship_days = shipDays;
            ObjRequest_DT.address_count = shipAddressCount;
            ObjRequest_DT.item_count = itemCount;
            ObjRequest_DT.item_value = itemValue;
            ObjRequest_DT.item_category = itemCategory;
            ObjRequest_DT.udf_1 = udf_1;
            ObjRequest_DT.udf_2 = udf_2;
            ObjRequest_DT.udf_3 = udf_3;
            ObjRequest_DT.udf_4 = udf_4;
            ObjRequest_DT.udf_5 = udf_5;
            ObjRequest_DT.Vpa_address = "";

            ObjRequest_DT.txn_details = txn_details;
            ObjRequest_DT.pg_details = pg_details;
            ObjRequest_DT.card_details = card_details;
            ObjRequest_DT.cust_details = cust_details;
            ObjRequest_DT.Bill_details = bill_details;
            ObjRequest_DT.Item_details = item_details;
            ObjRequest_DT.Other_details = other_details;
            ObjRequest_DT.UPI_details = "";

            ObjRequest_DT.enc_txn_details = enc_txn_details;
            ObjRequest_DT.enc_pg_details = enc_pg_details;
            ObjRequest_DT.enc_card_details = enc_card_details;
            ObjRequest_DT.enc_cust_details = enc_cust_details;
            ObjRequest_DT.enc_bill_details = enc_bill_details;
            ObjRequest_DT.enc_ship_details = enc_ship_details;
            ObjRequest_DT.enc_item_details = enc_item_details;
            ObjRequest_DT.enc_other_details = enc_other_details;
            ObjRequest_DT.appid = m_AppID;
            ObjRequest_DT.pgappid = m_PgAppID;
            ObjRequest_DT.serviceid = m_ServiceID;
            ObjRequest_DT.profileid = m_ProfileId;
            ObjRequest_DT.createdby = Session["LoginID"].ToString();

            ObjRequest_DT.data = Convert.ToString(data);

            //result = m_ConfirmPaymentBLL.InsertSafeXRequest(ObjRequest_DT, AFields);
            //SafeXPayRequest_DT ObjPGAppRequest_DT
            SqlParameter[] parameter1 = {
                     new SqlParameter("@ag_id",ObjRequest_DT.ag_id),
new SqlParameter("@me_id",ObjRequest_DT.me_id),
new SqlParameter("@order_no",ObjRequest_DT.order_no),
new SqlParameter("@Amount",ObjRequest_DT.Amount),
new SqlParameter("@Country",ObjRequest_DT.Country),
new SqlParameter("@Currency",ObjRequest_DT.Currency),
new SqlParameter("@txn_type",ObjRequest_DT.txn_type),
new SqlParameter("@success_url",ObjRequest_DT.success_url),
new SqlParameter("@failure_url",ObjRequest_DT.failure_url),
new SqlParameter("@Channel",ObjRequest_DT.Channel),
new SqlParameter("@pg_id",ObjRequest_DT.pg_id),
new SqlParameter("@Paymode",ObjRequest_DT.Paymode),
new SqlParameter("@Scheme",ObjRequest_DT.Scheme),
new SqlParameter("@emi_months",ObjRequest_DT.emi_months),
new SqlParameter("@card_no",ObjRequest_DT.card_no),
new SqlParameter("@exp_month",ObjRequest_DT.exp_month),
new SqlParameter("@exp_year",ObjRequest_DT.exp_year),
new SqlParameter("@cvv",ObjRequest_DT.cvv),
new SqlParameter("@card_name",ObjRequest_DT.card_name),
new SqlParameter("@cust_name",ObjRequest_DT.cust_name),
new SqlParameter("@email_id",ObjRequest_DT.email_id),
new SqlParameter("@mobile_no",ObjRequest_DT.mobile_no),
new SqlParameter("@unique_id",ObjRequest_DT.unique_id),
new SqlParameter("@is_logged_in",ObjRequest_DT.is_logged_in),
new SqlParameter("@bill_address",ObjRequest_DT.bill_address),
new SqlParameter("@bill_city",ObjRequest_DT.bill_city),
new SqlParameter("@bill_state",ObjRequest_DT.bill_state),
new SqlParameter("@bill_country",ObjRequest_DT.bill_country),
new SqlParameter("@bill_zip",ObjRequest_DT.bill_zip),
new SqlParameter("@ship_address",ObjRequest_DT.ship_address),
new SqlParameter("@ship_city",ObjRequest_DT.ship_city),
new SqlParameter("@ship_state",ObjRequest_DT.ship_state),
new SqlParameter("@ship_country",ObjRequest_DT.ship_country),
new SqlParameter("@ship_zip",ObjRequest_DT.ship_zip),
new SqlParameter("@ship_days",ObjRequest_DT.ship_days),
new SqlParameter("@address_count",ObjRequest_DT.address_count),
new SqlParameter("@item_count",ObjRequest_DT.item_count),
new SqlParameter("@item_value",ObjRequest_DT.item_value),
new SqlParameter("@item_category",ObjRequest_DT.item_category),
new SqlParameter("@udf_1",ObjRequest_DT.udf_1),
new SqlParameter("@udf_2",ObjRequest_DT.udf_2),
new SqlParameter("@udf_3",ObjRequest_DT.udf_3),
new SqlParameter("@udf_4",ObjRequest_DT.udf_4),
new SqlParameter("@udf_5",ObjRequest_DT.udf_5),
new SqlParameter("@Vpa_address",ObjRequest_DT.Vpa_address),
new SqlParameter("@txn_details",ObjRequest_DT.txn_details),
new SqlParameter("@pg_details",ObjRequest_DT.pg_details),
new SqlParameter("@card_details",ObjRequest_DT.card_details),
new SqlParameter("@cust_details",ObjRequest_DT.cust_details),
new SqlParameter("@Bill_details",ObjRequest_DT.Bill_details),
new SqlParameter("@Item_details",ObjRequest_DT.Item_details),
new SqlParameter("@Other_details",ObjRequest_DT.Other_details),
new SqlParameter("@UPI_details",ObjRequest_DT.UPI_details),
new SqlParameter("@enc_txn_details",ObjRequest_DT.enc_txn_details),
new SqlParameter("@enc_pg_details",ObjRequest_DT.enc_pg_details),
new SqlParameter("@enc_card_details",ObjRequest_DT.enc_card_details),
new SqlParameter("@enc_cust_details",ObjRequest_DT.enc_cust_details),
new SqlParameter("@enc_bill_details",ObjRequest_DT.enc_bill_details),
new SqlParameter("@enc_ship_details",ObjRequest_DT.enc_ship_details),
new SqlParameter("@enc_item_details",ObjRequest_DT.enc_item_details),
new SqlParameter("@enc_other_details",ObjRequest_DT.enc_other_details),
new SqlParameter("@appid",ObjRequest_DT.appid),
new SqlParameter("@pgappid",ObjRequest_DT.pgappid),
new SqlParameter("@serviceid",ObjRequest_DT.serviceid),
new SqlParameter("@profileid",ObjRequest_DT.profileid),
new SqlParameter("@createdby",Session["LoginID"].ToString()),

            };

            DataSet ds = sqlhelper.ExecuteDataTableNon("InsertSafeXRequestSP", parameter1);


            string PaymentURL = ConfigurationManager.AppSettings["PGURL"].ToString();
            HttpHelper.RedirectAndPOST(this.Page, PaymentURL, data);
        }
        public class DataCls
        {
            public string amtDate { get; set; }
            public string userId { get; set; }
            public string amt { get; set; }

            public string totalStudent { get; set; }
            public string BankAccNo { get; set; }
            public string BankAccIFFSC { get; set; }
            public string LoginID { get; set; }

        }
    }
}