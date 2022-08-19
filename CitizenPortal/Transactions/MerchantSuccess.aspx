<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MerchantSuccess.aspx.cs" Inherits="CitizenPortal.Transactions.MerchantSucess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap_theme.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>

<link href="../css/bootstrap-theme.min.css" rel="stylesheet" />
<link href="../css/bootstrap.min.css" rel="stylesheet" />
<meta charset="utf-8" />
<title>Payment Service Provider | Merchant Accounts</title>
<style>
.has-success .form-control, .has-success .control-label, .has-success .radio, .has-success .checkbox, .has-success .radio-inline, .has-success .checkbox-inline {
	color: #1cb78c !important;
}
.has-success .help-block {
	color: #1cb78c !important;
	border-color: #1cb78c !important;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 6px #1cb78c;
}
.has-error .form-control, .has-error .help-block, .has-error .control-label, .has-error .radio, .has-error .checkbox, .has-error .radio-inline, .has-error .checkbox-inline {
	color: #f0334d;
	border-color: #f0334d;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 6px #f0334d;
}
table {
	color: #333; /* Lighten up font color */
	font-family: 'Raleway', Helvetica, Arial, sans-serif;
	font-weight: bold;
	width: 640px;
	border-collapse: collapse;
	border-spacing: 0;
}
td, th {
	border: 1px solid #CCC;
	height: 30px;
} /* Make cells a bit taller */
th {
	background: #F3F3F3; /* Light grey background */
	font-weight: bold; /* Make sure they're bold */
	font-color: #1cb78c !important;
}
td {
	background: #FAFAFA; /* Lighter grey background */
	text-align: left;
	padding: 2px;/* Center our text */
}
label {
	font-weight: normal;
	display: block;
}
</style>
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
