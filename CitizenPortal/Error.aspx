<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="CitizenPortal.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body style="background-color:#B55738;"> 
    <form id="form1" runat="server">
    <div style="text-align:center; font-family:'Myriad Pro'; color:#fff; margin:5% auto;">
    <p><i class="fa fa-exclamation-circle" style="display:block; font-size:10em; color:#FFD24D"></i>        <span style="font-size:8em; color:#FFD24D;">Ooops,</span> <br />        <span style="font-size:4em; line-height:56px;">There is some error<br />you went wrong.</span></p>
        <p>Don’t worry just go to <a href="~/Sambalpur/index.aspx" style="color:#FFA54C;">home page</a></p>
    </div>
    </form>
</body>
</html>
