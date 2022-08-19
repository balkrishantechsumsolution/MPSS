<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/g2c/Master/Home.Master" CodeBehind="ExportAll.aspx.cs" Inherits="CitizenPortal.Export.ExportAll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
    <script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
    <link href="Styles/calendar-blue.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    $(document).ready(function () {
        $("#<%=TextBox2.ClientID %>").dynDateTime({
            showsTime: true,
            ifFormat: "%Y/%m/%d %H:%M",
            daFormat: "%l;%M %p, %e %m,  %Y",
            align: "BR",
            electric: false,
            singleClick: true,
            displayArea: ".siblings('.dtcDisplayArea')",
            button: ".next()"
        });
    });
</script>
    <script type="text/javascript">
    $(document).ready(function () {
        $("#<%=TextBox3.ClientID %>").dynDateTime({
            showsTime: true,
            ifFormat: "%Y/%m/%d %H:%M",
            daFormat: "%l;%M %p, %e %m,  %Y",
            align: "BR",
            electric: false,
            singleClick: true,
            displayArea: ".siblings('.dtcDisplayArea')",
            button: ".next()"
        });
    });
</script>
    <style type="text/css">
        .auto-style1 {
            width:100%;
            border-color: #FF99FF;
            background-color: #FF99FF;
        }
        .auto-style2 {
            width: 86px;
            height: 27px;
        }
        .auto-style3 {
            width: 133px;
            height: 27px;
        }
        .auto-style4 {
            font-size: x-large;
        }
        .auto-style5 {
            height: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <table align="center" border="1" class="auto-style1">
            <tr>
                <td colspan="6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style4">Export Grid</span></td>
            </tr>
            <tr>
                <td class="auto-style2">Start Date</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End Date</td>
                <td class="auto-style3"></td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click"  />
                </td>
            </tr>
            <asp:Panel ID="Panel1" runat="server">
            <tr>
                <td colspan="6">
                   <asp:GridView ID="GridView1" AutoGenerateColumns="false" BorderWidth="1" GridLines="Both" runat="server" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageIndex="3" PageSize="3" >
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
             <Columns>
                 <asp:BoundField DataField="id" HeaderText="id" />
                 <asp:BoundField DataField="Name" HeaderText="Name" />
                 <asp:BoundField DataField="Salary" HeaderText="Salary" />
                
        </Columns>
        </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                 <td colspan="2">
                     Export Type</td>
                <td>
        <asp:DropDownList ID="DropDownList1" runat="server" Width="124px">

                <asp:ListItem Text="--Export Type--"></asp:ListItem>
                <asp:ListItem Text="Word File"></asp:ListItem>
                <asp:ListItem Text="HTML File"></asp:ListItem>
                <asp:ListItem Text="PDF File" ></asp:ListItem>
                <asp:ListItem Text="Excel File"></asp:ListItem>
                <asp:ListItem Text="Text File"></asp:ListItem>
                <asp:ListItem Text="CSV File" ></asp:ListItem>
             
            
        </asp:DropDownList>
                </td>
                 <td >
                    <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Download File" />
             
                </td>
              
                
            </tr>
                </asp:Panel>
        </table>
</asp:Content>