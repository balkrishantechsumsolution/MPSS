<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.Test.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">

 

</head>
<body>
    	<iframe src="http://javascript.info/misc/files/clickprotected.php" style="width:300px;
height:100px;position:absolute;top:0px;left:0px;filter:alpha(opacity=50);opacity:0.5">
            Hi i am in the frame
    	</iframe>

<a href="http://www.google.com" target="_blank" style="position:relative;left:20px;font-size:15px;z-index:-1">CLICK ME!</a>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    </form>
</body>
</html>
