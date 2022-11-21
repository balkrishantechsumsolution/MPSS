<%@ Page Language="C#" AutoEventWireup="true" Inherits="index" Codebehind="index.aspx.cs" %>

<%@ Register Src="ImageCrop.ascx" TagName="ImageCrop" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Crop Testing Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <table>
        <tr>
            <td>
                Old Pic:<asp:Image ID="imgOld" runat="server"/>
            </td>
        </tr>
        <tr>
            <td>
                New Pic:
                <asp:Image ID="imgReplace" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                Application No:<asp:TextBox ID="txtAppNo" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" />
                <asp:Button ID="btnReplace" runat="server" Text="Replace" OnClick="btnReplace_Click" />
                  <uc1:ImageCrop id="ImageCrop1" runat="server">
        </uc1:ImageCrop>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
