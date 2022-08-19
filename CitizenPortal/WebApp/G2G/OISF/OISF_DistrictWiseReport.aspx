<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OISF_DistrictWiseReport.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.OISF_DistrictWiseReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OISF District Wise Report</title>
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

            <asp:DropDownList ID="drpDistrict" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpDistrict_SelectedIndexChanged"></asp:DropDownList>
            </td></tr>
         <tr><td>

<asp:GridView ID="grdDistrict" runat="server"></asp:GridView>
             </td></tr>
        
    </table>
           </ContentTemplate>
    </asp:UpdatePanel> 
 
    </div>
    </form>
</body>
</html>
