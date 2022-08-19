<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebTestClickjacking.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.Test.WebTestClickjacking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    	<iframe src="http://localhost:53056/WebApp/G2G/OISF/PM/FrmEpassPM.aspx" style="width:1300px;
height:100px;position:absolute;top:0px;left:0px;filter:alpha(opacity=50);opacity:0.5" sandbox>
       
    	</iframe>

<a href="http://www.google.com" target="_blank" style="position:relative;left:20px;font-size:15px;z-index:-1">CLICK ME!</a>
</body>
</html>
