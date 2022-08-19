<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="MasterPage.Master" CodeBehind="ExportDAT.aspx.cs" Inherits="CitizenPortal.Export.ExportDAT" %>

<%--<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>   
<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <%--  <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
    <script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
    <link href="Styles/calendar-blue.css" rel="stylesheet" type="text/css" />--%>
    <script type="text/javascript">
        $(document).ready(function () {
            debugger;
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
    <script type="text/javascript">
       
    </script>


    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border-color: #FF99FF;
            background-color: #FF99FF;
        }

        .auto-style2 {
            width: 86px;
        }

        .auto-style3 {
            width: 133px;
        }

        .auto-style4 {
            font-size: x-large;
        }

        .auto-style5 {
            width: 330px;
        }

        .auto-style6 {
            width: 183px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <table align="center" border="1" class="auto-style1">
        <tr>
            <td colspan="6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style4">Export DAT File</span></td>
        </tr>
        <tr>
            <td class="auto-style2">From Date</td>
            <td class="auto-style5">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><img src="calender.png" />
            </td>
            <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; To Date</td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><img src="calender.png" />
            </td>
            &nbsp;&nbsp;
                <td>&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Export DAT File" OnClick="Button1_Click" />
                </td>
            <td>
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Refresh" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:GridView ID="GridView1" runat="server" Visible="false">
                </asp:GridView>
            </td>
        </tr>

    </table>
</asp:Content>
