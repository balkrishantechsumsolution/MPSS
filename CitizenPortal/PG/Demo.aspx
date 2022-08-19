<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Demo.aspx.cs" Inherits="CitizenPortal.PG.Demo" %>


<%--<%@ Import Namespace="PortalLib.Framework.BillPayment.ePG" %>--%>
<%@ Import Namespace="System.Data.SqlClient" %>
<%--<%@ Import Namespace="PortalLib.Framework.Utilities" %>--%>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Globalization" %>

<%--<%@ Import Namespace="PortalLib.Framework.DeliveryChannel" %>
<%@ Import Namespace="PortalLib.Framework.Administration" %>
<%@ Import Namespace="PortalLib.Framework.BillPayment" %>--%>

<!DOCTYPE html>


<script runat="server">


    /* Response returned from ICICI Bank after a successful Transaction
     * 
     * 
     * 
     * Key: E000: value = E000Key: 1610255139553: value = 1610255139553Key: 0.00: value = 0.00Key: 0.02: value = 0.02Key: 1.02: value = 1.02Key: 1: value = 1Key: 25-10-2016 11:12:13: value = 25-10-2016 11:12:13Key: : value = Key: : value = Key: CREDIT_CARD: value = CREDIT_CARDKey: 654: value = 654Key: 16117108000000001507: value = 16117108000000001507Key: 123279: value = 123279Key: d9d21bb7cbd3a1c862b20ada34af88267cc3961ba52b23e24b50e3e22365b902fd1f68e9613c501e85b43552c33984b600d10eea13ce48a0507397558aab1ac2: value = d9d21bb7cbd3a1c862b20ada34af88267cc3961ba52b23e24b50e3e22365b902fd1f68e9613c501e85b43552c33984b600d10eea13ce48a0507397558aab1ac2Key: 0: value = 0
     * 
     * 
     * 
Key: E000: value = E000 (=> 1. Response Code)
Key: 1610255139553: value = 1610255139553 (=> 2. Unique Ref Number)
Key: 0.00: value = 0.00 (=> 3. Service Tax Amount)
Key: 0.02: value = 0.02 (=> 4. Processing Fee Amount)
Key: 1.02: value = 1.02 (=> 5. Total Amount)
Key: 1: value = 1 (=> 6. Transaction Amount)
Key: 25-10-2016 11:12:13: value = 25-10-2016 11:12:13 (=> 7. Transaction Date)
Key: : value =  (=> 8. Interchange Value)
Key: : value =  (=> 9. TDR)
Key: CREDIT_CARD: value = CREDIT_CARD (=> 10. Payment Mode)
Key: 654: value = 654 (=> 11. Sub-merchant ID)
Key: 16117108000000001507: value = 16117108000000001507 (=> 12. Reference No)
Key: 123279: value = 123279 (=> 14. ID)
Key: d9d21bb7cbd3a1c862b20ada34af88267cc3961ba52b23e24b50e3e22365b902fd1f68e9613c501e85b43552c33984b600d10eea13ce48a0507397558aab1ac2: value = d9d21bb7cbd3a1c862b20ada34af88267cc3961ba52b23e24b50e3e22365b902fd1f68e9613c501e85b43552c33984b600d10eea13ce48a0507397558aab1ac2 (=> 15. RS)
Key: 0: value = 0 (=> 13. TPS)
     * 
     * 
     * 
     */
     // Error demo
        /* string Bank_ResponseCode = "E006";
         string Bank_UniqueRefNumber = "1610255139553";
         string Bank_ServiceTax = "0.00";
         string Bank_ProcessFee = "0.02";
         string Bank_TotalAmt = "1.02";
         string Bank_TransactionAmt = "1";
         string Bank_TransDate = "";
         string Bank_Interchangevalue = "";
         string Bank_TDR = "";
         string Bank_PaymentMode = "CREDIT_CARD";
         string Bank_SubMerchantId = "654";
         string BANK_ReferenceNo = "16117108000000001507";
         string Bank_MerchantId = "123279";
         string Bank_RS = "d9d21bb7cbd3a1c862b20ada34af88267cc3961ba52b23e24b50e3e22365b902fd1f68e9613c501e85b43552c33984b600d10eea13ce48a0507397558aab1ac2";
         string Bank_TPS = "0";
         string ReferenceNo = "";
         string Bank_ResponseString = "0";  */
          //for show the error code from demo 
         // Response.Write("<br />");
         // Response.Write("Key: " + HttpContext.Current.Request.Form[key] + ": value = " + value);

        //   End: Dummy Values   




    protected void Page_Load(object sender, EventArgs e)
    {
        string ServiceID = "";
        string AppID = "";
        string Bank_ResponseCode = "E000";
        string Bank_UniqueRefNumber = "";
        string Bank_ServiceTax = "0.00";
        string Bank_ProcessFee = "0.02";
        string Bank_TotalAmt = "1.02";
        string Bank_TransactionAmt = "1";
        string Bank_TransDate = "";
        string Bank_Interchangevalue = "";
        string Bank_TDR = "";
        string Bank_PaymentMode = "CREDIT_CARD";
        string Bank_SubMerchantId = "654";
        string BANK_ReferenceNo = "PG00000023"; //= "16117108000000001507";
        string Bank_MerchantId = "123279";
        string Bank_RS = "d9d21bb7cbd3a1c862b20ada34af88267cc3961ba52b23e24b50e3e22365b902fd1f68e9613c501e85b43552c33984b600d10eea13ce48a0507397558aab1ac2";
        string Bank_TPS = "0";
        string ReferenceNo = "PG00000023";
        string Bank_ResponseString = "0";
        string Param1 = "";
        string Param2 = "";
        string Param3 = "";
        string Param4 = "";
        string Param5 = "";
        int IsActive = 1;
        string Createdby = "";
        string CreatedOn = "";
        string Modifiedby = "";
        string ModifiedOn = "";

        InsertResponse(Bank_ResponseString);


        


        
       
       

        DataSet ds1 = new DataSet();
        ds1 = GetserviceList(ReferenceNo);
        if (ds1.Tables.Count > 0)
        {
            ServiceID = ds1.Tables[0].Rows[0]["ServiceID"].ToString();
            AppID = ds1.Tables[0].Rows[0]["AppID"].ToString();
        }
        else {

            Response.Write("Record Are Not found");


        }
        string PG_Status = "PG000";
        //end here


        //insert the value  in database
        InsertLog(ServiceID, AppID, ReferenceNo, Bank_ResponseCode, Bank_UniqueRefNumber, Bank_ServiceTax, Bank_ProcessFee, Bank_TotalAmt, Bank_TransactionAmt, Bank_TransDate, Bank_Interchangevalue, Bank_TDR, Bank_PaymentMode, Bank_SubMerchantId, BANK_ReferenceNo, Bank_MerchantId, Bank_RS, Bank_TPS, Bank_ResponseString, Param1, Param2, Param3, Param4, Param5, IsActive, Createdby, CreatedOn, Modifiedby, ModifiedOn);


        string t_URL = ConfigurationManager.AppSettings["SuccessUrl"].ToString();//"=" + ServiceID + "&AppID=" + ReferenceNo + "&Status=Y";
        string url = t_URL + "&SvcID=" + ServiceID + "&PGSequence=" + ReferenceNo + "&Status=" + PG_Status;



        //live /demo url 
        Response.Redirect(url);





    }


    protected bool InsertResponse(string Response)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

        SqlConnection con = new SqlConnection(connStr);
        SqlCommand cmd = null;
        //  cmd = con.CreateCommand();
        cmd = new SqlCommand("BankResponseSp", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Response", Response);
        try
        {

            con.Open();
            // trans = con.BeginTransaction();
            // cmd.Transaction = trans;


            cmd.ExecuteNonQuery();
            // trans.Commit();

            return true;


        }
        catch (Exception ex)
        {
            // trans.Rollback();
            return false;

        }
        finally
        {
            // trans.Dispose();
            // con.Dispose();
            con.Close();

        }



    }

    protected bool InsertLog(string ServiceID, string AppID, string ReferenceNo, string Bank_ResponseCode, string Bank_UniqueRefNumber, string Bank_ServiceTax, string Bank_ProcessFee, string Bank_TotalAmt, string Bank_TransactionAmt, string Bank_TransDate, string Bank_Interchangevalue, string Bank_TDR, string Bank_PaymentMode, string Bank_SubMerchantId, string BANK_ReferenceNo, string Bank_MerchantId, string Bank_RS, string Bank_TPS, string Bank_ResponseString, string Param1, string Param2, string Param3, string Param4, string Param5, int IsActive, string Createdby, string CreatedOn, string Modifiedby, string ModifiedOn)
    {

        string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

        SqlConnection con = new SqlConnection(connStr);

        SqlCommand cmd = null;
        //  cmd = con.CreateCommand();
        cmd = new SqlCommand("PGResponseSP", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ServiceID", ServiceID);
        cmd.Parameters.AddWithValue("@AppID", AppID);
        cmd.Parameters.AddWithValue("@ReferenceNo", ReferenceNo);
        cmd.Parameters.AddWithValue("@Bank_ResponseCode", Bank_ResponseCode);
        cmd.Parameters.AddWithValue("@Bank_UniqueRefNumber", Bank_UniqueRefNumber);
        cmd.Parameters.AddWithValue("@Bank_ServiceTax", Bank_ServiceTax);
        cmd.Parameters.AddWithValue("@Bank_ProcessFee", Bank_ProcessFee);
        cmd.Parameters.AddWithValue("@Bank_TotalAmt", Bank_TotalAmt);
        cmd.Parameters.AddWithValue("@Bank_TransactionAmt", Bank_TransactionAmt);
        cmd.Parameters.AddWithValue("@Bank_TransDate", Bank_TransDate);
        cmd.Parameters.AddWithValue("@Bank_Interchangevalue", Bank_Interchangevalue);
        cmd.Parameters.AddWithValue("@Bank_TDR", Bank_TDR);
        cmd.Parameters.AddWithValue("@Bank_PaymentMode", Bank_PaymentMode);
        cmd.Parameters.AddWithValue("@Bank_SubMerchantId", Bank_SubMerchantId);
        cmd.Parameters.AddWithValue("@BANK_ReferenceNo", BANK_ReferenceNo);
        cmd.Parameters.AddWithValue("@Bank_MerchantId", Bank_MerchantId);
        cmd.Parameters.AddWithValue("@Bank_RS", Bank_RS);
        cmd.Parameters.AddWithValue("@Bank_TPS", Bank_TPS);
        cmd.Parameters.AddWithValue("@Bank_ResponseString", Bank_ResponseString);
        cmd.Parameters.AddWithValue("@Param1", Param1);
        cmd.Parameters.AddWithValue("@Param2", Param2);
        cmd.Parameters.AddWithValue("@Param3", Param3);
        cmd.Parameters.AddWithValue("@Param4", Param4);
        cmd.Parameters.AddWithValue("@Param5", Param5);
        cmd.Parameters.AddWithValue("@IsActive", IsActive);
        cmd.Parameters.AddWithValue("@Createdby", Createdby);
        cmd.Parameters.AddWithValue("@CreatedOn", CreatedOn);
        cmd.Parameters.AddWithValue("@Modifiedby", Modifiedby);
        cmd.Parameters.AddWithValue("@ModifiedOn", ModifiedOn);


        //SqlTransaction trans = null;
        try
        {

            con.Open();
            // trans = con.BeginTransaction();
            // cmd.Transaction = trans;


            cmd.ExecuteNonQuery();
            // trans.Commit();

            return true;


        }
        catch (Exception ex)
        {
            // trans.Rollback();
            return false;

        }
        finally
        {
            // trans.Dispose();
            // con.Dispose();
            con.Close();

        }


    }
    protected DataSet GetserviceList(string Pgsequence)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

        SqlConnection con = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("Select  ServiceID ,AppID  from PGRequestTB where PGSequenceNo =@PGSequenceNo ", con);
        cmd.Parameters.AddWithValue("@PGSequenceNo", Pgsequence);
        cmd.CommandType = CommandType.Text;
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        return ds;

    }

    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    try
    //    {

    //        lblMsg.Visible = false;


    //        if (!Page.IsPostBack)
    //        {

    //            if (Request.HttpMethod == "POST")
    //            {

    //                string BankRefId = Request.Form["BID"];
    //                string Status = Request.Form["PAID"];
    //                string staDesc = "";


    //                double amount = Convert.ToDouble(Request.Form["AMT"]);
    //                string refNo = Request.Form["PRN"];
    //                string RawITC = Request.Form["ITC"];

    //                string[] SubItc = RawITC.Split('|');
    //                string Cid = SubItc[0].ToString();
    //                string ITC = SubItc[1].ToString();

    //                string Sid= SubItc[2].ToString();

    //                SSid= SubItc[3].ToString();

    //                string appno = "";
    //                double base_amt = 0;
    //                //Reform the ePG Object with the details posted by SBI
    //                string SName = "Self Recharge through UBI";

    //                //if (Cid.ToUpper() == "CITIZEN")
    //                //{
    //                //    SName = "Payment through UBI";
    //                //    appno = GetAppNo(refNo);
    //                //}

    //                //ePGDFields ePG = new ePGDFields("", "", "", Sid, SSid, SName, amount, base_amt, appno, this.Session.SessionID, Cid, "");

    //                //Code written for TopUp through SBI Only
    //                //To do..
    //                //This ePG object to be Cross Checked with the Object  which is added  to the session

    //                PopulateDetails(ePG, BankRefId, refNo);

    //                if (Status.ToUpper() != "N")
    //                {
    //                    bool result = false;
    //                    //Edited on 21-APR-2009 FOR HANDLING BOTH CITIZEN & KIOSK SBI Top Ups...................
    //                    //Response.Write(ePG.GetChannelId().ToUpper());

    //                    //if (ePG.GetChannelId().ToUpper() == "CITIZEN" || ePG.GetUserType().ToUpper()=="CU")
    //                    //{
    //                    //  result=  UpdateCitizenDB (ePG, refNo, BankRefId, Status, staDesc);
    //                    //}
    //                    //else 
    //                    //{ 
    //                    //   result=UpdateDB(ePG, refNo, BankRefId, Status, staDesc); 
    //                    // }

    //                    //Ends..................................................................................
    //                    if (ITC == "KIOSK")
    //                    {
    //                        result = UpdateDB(ePG, refNo, BankRefId, Status, staDesc);
    //                    }


    //                    if (result)
    //                    {
    //                        //Dispatch Reciept 
    //                        //DispatchReciept(ePG);
    //                        lblMPOTransId.Text = MPOTransId;
    //                        throw new Exception("Congratulations! Your transaction has been successfully completed." + "<br/>" + "Kindly note down your receipt No. for future references.");
    //                    }
    //                    else
    //                    {
    //                        throw new Exception("Payment not done because  " + "database update failed at MPOnline.Your amount  will be refunded or contact MPOnline.");
    //                    }

    //                }
    //                else
    //                {

    //                    bool result = UpdatePgTxnDtls(ePG, refNo, BankRefId, Status, staDesc);
    //                    throw new Exception("Payment not done because  " + staDesc + "(Code:" + Status + ")");

    //                }


    //            }
    //            else
    //            {
    //                throw new Exception("No Response recieved from Union Bank.");
    //            }


    //        }



    //    }
    //    catch (Exception ex)
    //    {
    //        lblMsg.Text = ex.Message;
    //        lblMsg.Visible = true;

    //    }

    //}
    //private string GetAppNo(string refNo)
    //{
    //    string select = " select app_id from pgtxnDetails where txn_id='" + refNo + "' ";
    //    return Functions.ExecuteScalar(select, Databases.MainDatabase);
    //}
    //private void IsPaymentDone(string BankRefId)
    //{
    //    string select = String.Format("select trans_id from delivery_channel_trans_dtls where instrument_no='{0}'  and trans_type='CR'  and instrument_type='PG'", BankRefId);
    //    DataTable dt = Functions.ExecuteQuery(select, Databases.MainDatabase);
    //    if (dt.Rows.Count > 0)
    //    {
    //        throw new Exception(String.Format("Payment  already done with the trans_id='{0}'.Check your  Transactions.", dt.Rows[0]["trans_id"].ToString()));
    //    }
    //}
    //private void PopulateDetails(ePGDFields ePG,string BankRefId,string RefNo)
    //{
    //    lblChannelId.Text = ePG.GetChannelId();
    //    lblService.Text = ePG.Getservice_name();
    //    lblAppNo.Text = ePG.GetApplication_no();
    //    txtAmount.Value = ePG.GetTotalAmount().ToString();
    //    lblUid.Text = ePG.Getuser_id();
    //    lblUBIRefNo.Text = BankRefId;
    //    lblRefNo.Text = RefNo;
    //}


    //private bool UpdatePgTxnDtls(ePGDFields ePG,string refNo, string BankRefId, string Status, string staDesc)
    //{
    //    SqlConnection conn = null;
    //    try
    //    {
    //        string  Update = " UPDATE pgTxnDetails SET "+
    //                         " bank_txn_id='" + BankRefId + "'," +
    //                         " bank_auth_id='',"+
    //                         " bank_response_code='" +Status + "'," +
    //                         " bank_response_desc='" + staDesc + "' " +
    //                         "  WHERE txn_id='" + refNo + "'";

    //        conn = Connection.GetConnection(); conn.Open();

    //        return Functions.ExecuteNonQuery(Update, Databases.MainDatabase, conn, null);
    //    }
    //    catch (Exception ex) { throw ex; }
    //    finally { if (conn != null) { if (conn.State == ConnectionState.Open) { conn.Close(); } } }

    //}

    //private bool UpdateDB(ePGDFields ePG, string refNo, string BankRefId, string Status, string staDesc)
    //{
    //    IsPaymentDone(BankRefId);
    //    return UpdatePgTxnDtls(ePG, refNo, BankRefId, Status, staDesc) && CompletePaymentProcess(ePG, BankRefId);


    //}


    //private bool CompletePaymentProcess(ePGDFields ePG,string BankRefId)
    //{

    //    SqlConnection conn = null;
    //    SqlTransaction tx = null;
    //    try
    //    {

    //        if (ePG.Getservice_id() == "TOP" || ePG.Getservice_id() == "TOP|R")
    //        {
    //            conn = Connection.GetConnection(); conn.Open();
    //            tx = conn.BeginTransaction();
    //            //string dt_enGB = DateTime.Now.ToString("dd/MM/yyyy", new CultureInfo("en-US"));
    //            //string dt_enUS = DateTime.Now.ToString("MM/dd/yyyy", new CultureInfo("en-US"));
    //            string dt_enGB = Functions.GetCurrentDateTime(false);
    //            string dt_enUS = Functions.GetCurrentDateTime(true);
    //            //DCBillPaymentProcessAction DCB = new DCBillPaymentProcessAction(conn,null);
    //            DeliveryChannelTransaction DCT = ProcessKIOSKRecharge(conn,tx,ePG.GetChannelId(), ePG.GetTotalAmount(), ePG.Getuser_id(), "UBIePG", dt_enGB, "PG", BankRefId, dt_enGB, "", "", "Done", dt_enGB);
    //            MPOTransId = DCT.Gettrans_id();


    //            //if (DCT != null) { return true; }
    //            //else { return false; }

    //            if (DCT != null)
    //            {
    //                tx.Commit();
    //                conn.Close();
    //                return true;
    //            }
    //            else
    //            {
    //                tx.Rollback();
    //                conn.Close();
    //                return false;
    //            }


    //        }
    //        else { throw new Exception("Payment Process not yet implemented for the Service"); }
    //    }

    //    catch (Exception ex)
    //    {
    //        if (tx != null) { tx.Rollback(); }
    //        throw ex;

    //    }
    //    finally { if (conn != null) { if (conn.State == ConnectionState.Open) { conn.Close(); } } }

    //}
    ////This method to be made  Globally available
    ////Same method copied from Portal 
    ////Either to be moved to   App_Code or PortalLib.
    //private  DeliveryChannelTransaction ProcessKIOSKRecharge(SqlConnection conn,SqlTransaction tx,string sChannelId, double TransAmount, string userId, string RecievedBy, string RecievedDate, string PaymentMode, string PaymentNumber, string PaymentDate_enGB,string BankId, string BranchName, string Remarks, string sDate_enGB)
    //{
    //    DeliveryChannelLedgerDB DCLDB = new DeliveryChannelLedgerDB(conn, tx);
    //    DeliveryChannelTransactionDB DCTDB = new DeliveryChannelTransactionDB(conn, tx);
    //    string TransId = DeliveryChannelTransactionDB.GetNextSeqNo(conn);
    //    int Curr_Fin_Year = DeliveryChannelLedgerDB.GetFinYear(DateTime.Now.Month, DateTime.Now.Year);
    //    double LedgerClosingBalance = DCLDB.GetClosingBalance(sChannelId, Curr_Fin_Year);
    //    double Trans_Closing = LedgerClosingBalance + TransAmount;//??? To be Checked .. 


    //    //Instrument Status
    //    //P-Pending for Clearence
    //    //C-Cleared
    //    //B-Bounced
    //    //L-Less Payment
    //    //R-Rejected

    //    //Instrument_Type
    //    //CQ-Cheque
    //    //DD-DemandDraft
    //    //CS-Cash
    //    //ED-EDC
    //    //TR-Transfer
    //    //SR-SelfRecharge
    //    //AU-Automation
    //    BranchName = "UBI Direct Debit";

    //    DeliveryChannelTransaction DCT = new DeliveryChannelTransaction(sChannelId, "CR", TransId, sDate_enGB, "", "TOP", "R", "P",
    //                                                                                "MPO", "DC", PaymentMode, "026", BranchName, PaymentNumber
    //                                                                                , PaymentDate_enGB, TransAmount, "C", Trans_Closing, Remarks,
    //                                                                                TransAmount, 0, 0, 0, 0, 0, "", 0, "",
    //                                                                                0, null, null, null, null, null, null, null, null,
    //                                                                                userId, sDate_enGB, userId, sDate_enGB);


    //    bool result = DCTDB.insertTransaction(DCT) &&
    //                   DCLDB.UpdateKIOSKCreditLedger(sChannelId, DateTime.Now.Month, DateTime.Now.Year, TransAmount, userId, sDate_enGB);


    //    if (result)
    //    {
    //        return DCT;
    //    }
    //    else
    //    {
    //        return null;
    //    }

    //}

    //Code added on 21-APr-2009...
    //FOR CITIZEN DIRECT DEBIT THRU SBI.......................................................

    //private bool UpdateCitizenDB(ePGDFields ePG, string refNo, string BankRefId, string Status, string staDesc)
    //{
    //    IsPaymentDone(BankRefId);
    //    return UpdatePgTxnDtls(ePG, refNo, BankRefId, Status, staDesc) && CashPaymentProcess(ePG, BankRefId);
    //}

    //For application Update
    //    private bool UpdatePaidStatus(Service service, string TransId, ePGDFields epgDtls,SqlConnection conn,SqlTransaction tx)
    //    {
    //        ServicePaymentObject servicePaymentObject = new ServicePaymentObject();
    //        ServicePayment servicePayment = servicePaymentObject.GetServicePaymentObject(service);
    //        return servicePayment.UpdateServiceTable(epgDtls, TransId, service, conn, tx);

    //    }

    //    //This method for Inserting Payment data in DCT & Application level table...

    //    private bool CashPaymentProcess(ePGDFields ePGF, string bankId)
    //    {
    //        SqlConnection conn = null;
    //        SqlTransaction tx = null;
    //        bool Result = false;

    //        try
    //        {

    //            #region  GetPayments Parameters From Session and Verifying Password..  

    //            newDeliveryChannelUser deliveryChannelUser = (newDeliveryChannelUser)Context.Session["DeliveryChannelUser"];


    //            string app_no = ePGF.GetApplication_no();

    //            string user_type = ePGF.GetUserType().ToString();
    //            string child_Service_Id = ePGF.GetSubServiceId();

    //            #endregion

    //            #region Preparing Others Dependent Parametes

    //            string userId = ePGF.Getuser_id();
    //            string date = Functions.GetCurrentDateTime(false);

    //            double transAmount = ePGF.GetTotalAmount();

    //            #endregion

    //            #region Prepare Connection and  transaction

    //            conn = Connection.GetConnection();
    //            conn.Open();
    //            tx = conn.BeginTransaction();

    //            #endregion

    //            #region Preparing DBObjects

    //            Service service = Service.GetService(ePGF.Getservice_id(), conn, tx);
    //            ServiceCharge ServiceCharge = service.GetServiceCharge();
    //            DeliveryChannelTransactionDB DCTDB = new DeliveryChannelTransactionDB(conn, tx);
    //            string trans_id = DeliveryChannelTransactionDB.GetNextSeqNo(conn, tx);


    //            double PortalCharge = ServiceCharge.GetPortalCharge();






    //            if (service.GetServiceId() == "51")
    //            {
    //                PortalCharge = ServiceCharge.GetPortalCharge() / 2;
    //            }
    //            double amount = ePGF.GetTotalAmount() - PortalCharge;



    //            if (ServiceCharge.GetPortalChargePayableBy() == "C")
    //            {
    //                transAmount = amount + ServiceCharge.GetPortalCharge();

    //                if (service.GetServiceId() == "51")
    //                {
    //                    transAmount = amount + ServiceCharge.GetPortalCharge() / 2;
    //                }
    //                 else if (service.GetServiceId() == "999" && ePGF.GetSubServiceId() == "E0021" )
    //                    {

    //                        transAmount = amount + ServiceCharge.GetPortalCharge() + 10;
    //                    }
    //                    //For PAHUT
    //                    else if (service.GetServiceId() == "999" && ePGF.GetSubServiceId() == "E0023")
    //                    {

    //                        transAmount = amount + ServiceCharge.GetPortalCharge() + 10;
    //                    }
    //                    //For Seed
    //                    else if (service.GetServiceId() == "999" && ePGF.GetSubServiceId() == "E0027")
    //                    {
    //                        transAmount = amount + ServiceCharge.GetPortalCharge() + 10;
    //                    }
    //                    //For ITOPE
    //                    else if (service.GetServiceId() == "999" && ePGF.GetSubServiceId() == "E0025")
    //                    {
    //                        transAmount = amount + ServiceCharge.GetPortalCharge() + 10;
    //                    }
    //                    //For Guruji 2009
    //                    else if (service.GetServiceId() == "999" && ePGF.GetSubServiceId() == "E0022")
    //                    {
    //                        transAmount = amount + ServiceCharge.GetPortalCharge() + 10;
    //                    }
    //                    //For Jail
    //                    else if (service.GetServiceId() == "999" && ePGF.GetSubServiceId() == "E0028")
    //                    {
    //                        transAmount = amount + ServiceCharge.GetPortalCharge() + 10;
    //                    }

    //                        //For JDEOT
    //                    else if (service.GetServiceId() == "999" && ePGF.GetSubServiceId() == "E0030")
    //                    {
    //                        transAmount = amount + ServiceCharge.GetPortalCharge() + 10;
    //                    }

    //                    else if (service.GetServiceId() == "999" && ePGF.GetSubServiceId() == "E0029")
    //                    {
    //                        transAmount = amount + ServiceCharge.GetPortalCharge() + 10;
    //                    }
    //                    //For PMT TAC
    //                    else if (service.GetServiceId() == "999" && ePGF.GetSubServiceId() == "TAC15")
    //                    {

    //                        transAmount = amount + ServiceCharge.GetPortalCharge() + 10;
    //                    }
    //                    else if (service.GetServiceId() == "999" && ePGF.GetSubServiceId() == "TAC25")
    //                    {
    //                        transAmount = amount + ServiceCharge.GetPortalCharge() + 10;

    //                    }
    //                    else if (service.GetServiceId() == "999" && ePGF.GetSubServiceId() == "TAC28")
    //                    {
    //                        transAmount = amount + ServiceCharge.GetPortalCharge() + 10;
    //                    }

    //                    else if (service.GetServiceId() == "999" && ePGF.GetSubServiceId() == "TAC22")
    //                    {

    //                        transAmount = amount + ServiceCharge.GetPortalCharge() + 10;
    //                    }

    //            }


    //            if (ServiceCharge.GetPortalChargePayableBy() == "G")
    //            {
    //                amount = ePGF.GetTotalAmount();
    //                transAmount = amount;
    //            }






    //            #endregion


    //            #region Construct DC Transaction & Local Application Table

    //            DeliveryChannelTransaction DCT = new DeliveryChannelTransaction(ePGF.GetChannelId(), "DR", trans_id, date, app_no, service.GetServiceId(), child_Service_Id, "P", service.GetOrganization(conn, tx).GetOrganizationId(), user_type, "NF", bankId, null, bankId, null, 0, null, 0, null,
    //                                                                            transAmount,amount,
    //                                                                            ServiceCharge.GetDCCharge(), PortalCharge, ServiceCharge.GetGovtCharge(),
    //                                                                            ServiceCharge.GetMiscCharge01(), ServiceCharge.GetMiscCharge01_Desc(),
    //                                                                            ServiceCharge.GetMiscCharge02(), ServiceCharge.GetMiscCharge02_Desc(),
    //                                                                            ServiceCharge.GetMiscCharge03(), ServiceCharge.GetMiscCharge03_Desc(),
    //                                                                            null, null, null, null, null, null, null, userId, date,userId, date);


    //            #endregion


    //            //Result = DCTDB.insertTransaction(DCT) && UpdatePaidStatus(service, trans_id, ePGF,conn,tx );
    //            //UpdateTable_ServiceTablePaidStatus(ePGF, conn, txn)   

    //            Result = DCTDB.insertTransaction(DCT) && UpdateTable_ServiceTablePaidStatus(ePGF, conn, tx, DCT);

    //             if (Result)
    //             {

    //                 MPOTransId = DCT.Gettrans_id(); //Set Transaction Id here...
    //                 lblMPOTransId.Text= MPOTransId;
    //                 tx.Commit();
    //                 ShowReciept(ePGF, MPOTransId);
    //             }
    //             else
    //             {
    //                 tx.Rollback();
    //                 throw new Exception("Transaction Failed.Please contact with the Reference No:" + ePGF.GetApplication_no());
    //             }

    //        }
    //        catch (Exception ex) { if (tx.Connection != null) { tx.Rollback(); } throw ex; }
    //        finally { conn.Close(); }

    //        return Result;

    //    }


    //    private bool UpdateTable_ServiceTablePaidStatus(ePGDFields ePGF, SqlConnection conn, SqlTransaction txn, DeliveryChannelTransaction DCT) 
    //    {
    //        ServicePayment servicePayment = null;
    //        Service service = null;
    //        try    
    //        {

    //            ServiceDB serviceDB = new ServiceDB(conn,txn);
    //            service = serviceDB.Select(ePGF.Getservice_id());
    //            ServicePaymentObject servicePaymentObject   = new ServicePaymentObject();
    //            servicePayment = servicePaymentObject.GetServicePaymentObject(service);


    //        }
    //        catch (Exception ex)
    //        {
    //            Functions.LogError(ex, "EPGErrors");
    //            Response.Write(ex.Message);
    //        }
    //        return servicePayment.UpdateServiceTable(ePGF, DCT.Gettrans_id(), service, conn, txn);
    //    }



    //    //Code on 20 july 2009 for show reciept

    //    private void ShowReciept(ePGDFields ePGF, string TxnId)
    //{

    //        //Still Code  Needs Improvement may be Service Level Package based..
    //        string recptURL   = "";

    //       switch(ePGF.Getservice_id())
    //       {
    //            case "45" : 

    //                recptURL = "https://www.mponline.gov.in/Portal/Services/Forest/ShowReciept.aspx";
    //                break;
    //                //Case "51"
    //                //    If ePGF.GetSubServiceId() = "512" Then
    //                //        recptURL = "\Portal\Services\RGPVDegree\ShowReciept.aspx"
    //                //    End If

    //            case "1001" :
    //                if (ePGF.GetSubServiceId() == "49258")
    //                {
    //                    //change from http to https on 03 march 2009
    //                    recptURL = "https://www.mponline.gov.in/Portal/Services/ThirdPartyPG/ShowReciept.aspx ? data=" + MPOTransId + "&BData=" + TxnId + "&cdata=" + ePGF.GetApplication_no() + "&ddata=" + ePGF.GetSubServiceId() + "&edata=" + ePGF.GetFirst_name() + "&fdata=" + ePGF.GetTotalAmount().ToString();

    //                }
    //               break;

    //            case "997" :
    //                recptURL = "https://www.mponline.gov.in/Portal/Examination/OpenSchool/ShowReciept.aspx ? data=" + ePGF.GetApplication_no();
    //              break;

    //            case "46" :

    //                recptURL = "https://www.mponline.gov.in/Portal/Services/TownAndCountryPlanning/ShowReciept.aspx";
    //            break;


    //                //Vapam PMT TAC Rectification
    //           case "999" :
    //                if (ePGF.GetSubServiceId().Trim() == "TAC15")
    //                {

    //                    recptURL = "https://www.mponline.gov.in/Portal/Examinations/Vyapam/AdmitCard/ShowReciept.aspx";
    //                }

    //                if (ePGF.GetSubServiceId().Trim() == "TAC25")
    //                {
    //                    recptURL = "https://www.mponline.gov.in/Portal/Examinations/Vyapam/AdmitCard/ShowReciept.aspx";
    //                }
    //                if (ePGF.GetSubServiceId().Trim() == "TAC28")
    //                {

    //                    recptURL = "https://www.mponline.gov.in/Portal/Examinations/Vyapam/AdmitCard/ShowReciept.aspx";
    //                }
    //                if (ePGF.GetSubServiceId().Trim() == "TAC22")
    //                {

    //                    recptURL = "https://www.mponline.gov.in/Portal/Examinations/Vyapam/AdmitCard/ShowReciept.aspx";
    //                }
    //                break;
    //                //for MPPSC on 10/07/09
    //           case "996" :

    //                recptURL = "https://www.mponline.gov.in/Portal/Examinations/MPPSC/ShowReciept.aspx?data=" + ePGF.GetApplication_no();
    //               break;
    //                //for ONLINE COUNSELING ON 13/07/2009
    //            case "2009" :

    //                recptURL = "https://www.mponline.gov.in/Portal/Services/OnlineCounselling/ShowReceipt.aspx?data=" + ePGF.GetApplication_no();
    //              break;
    //                //Ends**************************************E:\Working\Source\Portal\Services\RGPVDegree\RevalRetotal\ShowReciept.aspx
    //        }

    //           if (recptURL != "") 
    //            {
    //                Response.Redirect(recptURL); 
    //            }


    //    }

    //    //End



    //eNDS         
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<%--<head runat="server">
    <title>Self Recharge Response Page</title>

    <link href="/Quick Links/Sbi/sbistyle.css" rel="stylesheet" type="text/css" />
    <script language="javascript" src="/Portal/headers/printFunction.js"></script>
    <script>
        var langid = "en-US";
    </script>
</head>--%>
<%--<body>
    <form id="form1" runat="server">
        <div id="PrintContent">
            <label id="lbl_msg" runat="server"></label>
            <table width="964" border="0" align="center" cellpadding="0" cellspacing="0">
                <!--<tr>
    <td height="65" align="left" valign="middle" background="/Quick Links/Sbi/bg.png">
    <img src="/Quick Links/Sbi/sbi_logo.png" width="202" height="61" /></td>
  </tr>-->
                <tr>
                    <td align="center" valign="top" style="height: 10px"></td>
                </tr>
                <tr>
                    <td align="center" valign="top">

                        <table border="0" cellspacing="0" cellpadding="0" style="width: 400px; height: 331px; background-repeat: no-repeat;" background="/Quick Links/Union Bank/mainBG.png">
                            <tr>
                                <td align="center" valign="top" class="tab">
                                    <table width="98%" border="0" cellspacing="1" cellpadding="1">
                                        <tr>
                                            <td align="center" valign="middle" class="h4">ICICI Payment Gateway</td>
                                        </tr>
                                        <tr>
                                            <td align="center" valign="middle" style="height: 272px">
                                                <table width="95%" border="0" align="center" cellpadding="3" cellspacing="3">
                                                    <tr>
                                                        <td align="center" valign="middle" colspan="2">
                                                            <asp:Label ID="lblMsg" CssClass="notetext" runat="server" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" valign="middle" colspan="2">
                                                            <asp:Label ID="StatMsg" runat="server" Font-Bold="True" ForeColor="Red" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" valign="middle" width="39%">Reference No</td>
                                                        <td align="left" valign="middle" width="61%">
                                                            <asp:Label ID="lblRefNo" runat="server" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="39%" align="left" valign="middle">Channel ID</td>
                                                        <td width="61%" align="left" valign="middle">
                                                            <asp:Label ID="lblChannelId" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" valign="middle" width="39%" style="visibility: hidden">User Id</td>
                                                        <td align="left" valign="middle" width="61%" style="visibility: hidden">

                                                            <asp:Label ID="lblUid" runat="server" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" valign="middle" width="39%">ICICI Refernce No</td>
                                                        <td align="left" valign="middle" width="61%">
                                                            <asp:Label ID="lblUBIRefNo" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" valign="middle" width="39%">Service Used</td>
                                                        <td align="left" valign="middle" width="61%">
                                                            <asp:Label ID="lblService" runat="server" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" valign="middle">Amount</td>
                                                        <td align="left" valign="middle">

                                                            <input type="text" runat="server" maxlength="5" id="txtAmount" class="input" disabled="disabled" style="color: #ff0000" /></td>
                                                    </tr>
                                                    <tr style="visibility: hidden;">
                                                        <td align="left" valign="middle">Application No</td>
                                                        <td align="left" valign="middle">
                                                            <asp:Label ID="lblAppNo" runat="server" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" valign="middle">Transaction Id</td>
                                                        <td align="left" valign="middle">
                                                            <asp:Label ID="lblMPOTransId" runat="server" /></td>
                                                    </tr>
                                                </table>
                                                <input id="btnPrint" onclick="javascript: this.style.display = 'none'; PrintThisPage(); this.style.display = 'block';"
                                                    type="image" alt="Print" src="/Quick Links/SBI/Print.png" value="Print" />
                                                &nbsp;
                        <a href="https://www.mponline.gov.in/Portal/index.aspx?langid=en-US" title="MPOnline Portal Home Page">
                            <img border="0" src="/Quick Links/Union Bank/home.png" alt="Home" /></a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="tab" valign="top"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

        </div>

    </form>
</body>--%>
</html>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
</asp:Content>--%>

