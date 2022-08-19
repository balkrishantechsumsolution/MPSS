<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OISF_CategoryWiseReport.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.OISF_CategoryWiseReport" %>

<!DOCTYPE html>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OISF Category Wise Report</title>
</head>
<body>
    <form id="form1" runat="server">

          <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
           <asp:UpdatePanel ID="UpdatePanel1"
         runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <table>
      <tr><td>

            <asp:DropDownList ID="drpCategoy" runat="server" OnSelectedIndexChanged="drpDistrict_SelectedIndexChanged" AutoPostBack="True" Height="16px" Width="178px">
                <asp:ListItem Selected="True">ALL</asp:ListItem>
                <asp:ListItem>UR</asp:ListItem>
                <asp:ListItem>SC</asp:ListItem>
                <asp:ListItem>ST</asp:ListItem>
                <asp:ListItem>OBC</asp:ListItem>
        </asp:DropDownList>
            </td></tr>
        <tr> <td>

<asp:GridView ID="grdCategoy" runat="server"></asp:GridView>
             </td></tr>
        </table>
           </ContentTemplate>
    </asp:UpdatePanel> 
    </div>
    </form>
</body>
</html>
