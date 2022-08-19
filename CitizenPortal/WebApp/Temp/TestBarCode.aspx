<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestBarCode.aspx.cs" Inherits="CitizenPortal.WebApp.Temp.TestBarCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="/Scripts/jquery-2.2.3.min.js"></script>
    <script src="/Scripts/jquery-barcode.min.js"></script>
    <script src="/WebApp/Scripts/Barcode.js"></script>

    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            //generateBarcode(document.getElementById('BarcodeID.ClientID').value);
            generateBarcode('16117112000000000084');
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div id="Div1" class="Renderbarcode">
                                                </div>
    </div>
    </form>
</body>
</html>
