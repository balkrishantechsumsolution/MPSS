<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MerchantSuccess.aspx.cs" Inherits="CitizenPortal.PaymentGateway.MerchantSuccess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="container cs-border-light-blue"> 
  
  <!-- first line -->
  <div class="row pad-top"></div>
  <!-- end first line -->
  
  <div class="equalheight row" style="padding-top: 10px;">
    <div id="cs-main-body" class="cs-text-size-default pad-bottom">
      <div class="col-sm-9  equalheight-col pad-top">
        <div style="padding-bottom: 50px;">
          <h1>Thank you!</h1>
          <div class="row">
            <div class="col-sm-12">
              <legend>Your payemnt is completed. Here is the details for it</legend>
            </div>
            <div class="col-sm-12">
              <legend><asp:Label ID="lblResponseMessage" runat="server"> </asp:Label></legend>
            </div>
            
            <div class="row">
                  <div class="col-sm-6">
                    <div class="form-group">
                      <label class="control-label col-sm-4">Order Number</label>
                      <div class="col-sm-8"> <asp:Label ID="lblOrderNumber" runat="server"> </asp:Label></div>
                    </div>
                  </div>
                  <div class="col-sm-6">
                    <div class="form-group">
                      <label class="control-label col-sm-4">Amount</label>
                      <div class="col-sm-8"><asp:Label ID="lblAmount" runat="server"> </asp:Label> </div>
                    </div>
                  </div>
                </div>
                
                
                <div class="row">
                  <div class="col-sm-6">
                    <div class="form-group">
                      <label class="control-label col-sm-4">Transaction AG REF</label>
                      <div class="col-sm-8"> <asp:Label ID="lblAgRef" runat="server"> </asp:Label></div>
                    </div>
                  </div>
                  <div class="col-sm-6">
                    <div class="form-group">
                      <label class="control-label col-sm-4">Transaction PG REF</label>
                      <div class="col-sm-8"> <asp:Label ID="lblPgRef" runat="server"> </asp:Label></div>
                    </div>
                  </div>
                </div>
                
                <div class="row">
                  <div class="col-sm-6">
                    <div class="form-group">
                      <label class="control-label col-sm-4">Transaction Status</label>
                      <div class="col-sm-8"> <asp:Label ID="lblTransactionStatus" runat="server"> </asp:Label></div>
                    </div>
                  </div>
                  <div class="col-sm-6">
                    <div class="form-group">
                      <label class="control-label col-sm-4">Transaction Date and Time</label>
                      <div class="col-sm-8"><asp:Label ID="lblTransactionDate" runat="server"> </asp:Label> </div>
                    </div>
                  </div>
                </div>
                
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
    </div>
    </form>
</body>
</html>
