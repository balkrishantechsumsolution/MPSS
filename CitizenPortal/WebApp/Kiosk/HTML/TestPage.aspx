<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestPage.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.HTML.TestPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=ddlSubject]').multiselect({
                includeSelectAllOption: false
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ListBox ID="ddlSubject" runat="server" Width="200px" SelectionMode="Multiple">            
        </asp:ListBox>
        <asp:Button Text="Submit" runat="server" OnClick="Submit" />
    </div>
    </form>
</body>
</html>
