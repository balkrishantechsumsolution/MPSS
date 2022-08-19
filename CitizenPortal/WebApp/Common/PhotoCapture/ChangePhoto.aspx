<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePhoto.aspx.cs" Inherits="CitizenPortal.WebApp.Common.ChangePhoto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script type="text/javascript">

    function ShowPopUp() {

        window.open('CapturePhoto.aspx', "wndPopUp", 'width=720,height=400,left=100,top=100,resizable=no');

    }

</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>    
<img id="Userpic" src="" runat="server" />
<br />
<input type="button" id="btnSave" value="Take Photo" onclick="ShowPopUp();" />
    </div>
    </form>
</body>
</html>
