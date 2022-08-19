<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="Export_XL.aspx.cs" Inherits="CitizenPortal.Export.Export_XL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../g2c/css/style.admin.css" rel="stylesheet" />

    
    <style type="text/css">
        .auto-style1 {
            width: 100%;
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

        .expt_xs h1 {
            font-family: 'proximanovaaltbold';
            background-color: #F8F8FF;
            font-size: 25px;
            color: #212121;
            text-transform: uppercase;
            padding: 10px 0 10px 8px;
            border-bottom: 4px solid #FF7D01;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">

    <div class="container-fluid">
        <div class="col-lg-12 expt_xs mbtm20">

            <div class="row">
                <h1>Export Data Sheet</h1>
                <table border="0" class="auto-style1 table table-striped table-bordered" style="width: 100%; margin: 0 auto;">
                    <tr>
                        <td colspan="6" style="background: #4879a9 !important; color: #fff !important;"><span class="auto-style4">Export DAT File</span></td>
                    </tr>
                    <tr>
                        <td class="auto-style2" style="background-color: #eceeef !important;">From Date</td>
                        <td class="auto-style5">
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><img src="calender.png" /></td>
                        <td class="auto-style3" style="background-color: #eceeef !important;">To Date</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><img src="calender.png" /></td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Export DAT File" /></td>
                        <td>
                            <asp:Button ID="Button2" runat="server" Text="Refresh" /></td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <asp:GridView ID="GridView1" runat="server" Visible="false"></asp:GridView>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    
</asp:Content>
