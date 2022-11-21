<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="CenterList.aspx.cs" Inherits="CitizenPortal.g2c.forms.CenterList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/style.admin.css" rel="stylesheet" />
    <style>
        table#cphbody_GridView {
        }

        #cphbody_GridView ul {
        }

        #cphbody_GridView a {
            color: #014c8c;
            background-color: #eceeef;
            border-color: #ddd;
            padding: 10px;
            border: 1px solid #ddd;
        }

            #cphbody_GridView a:hover {
                color: #014c8c;
                background-color: #eceeef;
                border-color: #ddd;
            }


            table#cphbody_GridView tbody>tr>th scope {
                color: #014c8c;
                background-color: #eceeef;
                border-color: #ddd;
            }

        #cphbody_GridView span {
            background-color: #4879a9;
            color: #fff;
            border-color: #ddd;
            padding: 10px;
            border: 1px solid #ddd;
        }

        .BtnSearch {
            height: 29px !important;
            padding-top: 4px !important;
            color: #000000;
            margin-left: 5px;
            color: #fff;
            background-color: #5cb85c;
            border-color: #4cae4c;
        }

        .BtnReset {
            height: 29px !important;
            padding-top: 4px !important;
            margin-left: 5px;
            color: #fff;
            background-color: #d9534f;
            border-color: #d43f3a;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <div class="row mbtm10">
        <div class="w95">
            <div class="col-lg-2" style="padding-left: 0; padding-right: 0;">
                <h1>CSC Details</h1>
            </div>
            <div class="col-lg-10" style="margin-top: 20px; padding: 7px 0 10px 0; border-bottom: 4px solid #FF7D01; background-color: #F8F8FF;">
                <div class="col-xs-3" style="padding-right: 0px">
                    <span style="padding-right: 7px; font-weight: bold;">District :</span>
                    <asp:DropDownList ID="SelectDistrict" runat="server" AutoPostBack="true" AppendDataBoundItems="true" Width="200px" Height="30px" OnSelectedIndexChanged="SelectDistrict_SelectedIndexChanged">
                        <asp:ListItem Text="ALL" Value="ALL"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-xs-6" style="padding-left: 50px">
                    <span style="padding-right: 7px; font-weight: bold;">CSC Name :</span>
                    <%--<asp:DropDownList ID="SelectBlock" runat="server" AutoPostBack="true" AppendDataBoundItems="true" Width="200px" Height="30px" OnSelectedIndexChanged="SelectBlock_SelectedIndexChanged">
                        <asp:ListItem Text="ALL" Value="ALL"></asp:ListItem>
                    </asp:DropDownList>--%>
                    <asp:TextBox ID="SrcCscName" Width="200px" Height="30px" runat="server"></asp:TextBox>
                    <asp:Button ID="CscSearch" runat="server" CssClass="btn BtnSearch" Text="Search" OnClick="SrcCscName_TextChanged"></asp:Button>
                    <asp:Button ID="BtnClear" runat="server" CssClass="btn BtnReset" Text="Clear Filters" OnClick="Clear_Filters"></asp:Button>
                </div>
                <div class="col-xs-3" style="text-align: right; padding-top: 9px;">
                    <span style="padding-right: 10px; font-weight: bold;">Total No. of Records :</span>
                    <asp:Label ID="TotalRecords" Font-Bold="true" runat="server"></asp:Label>
                </div>
            </div>
            <div class="col-md-12 p0">
                <div class="">
                    <div>
                        <asp:GridView ID="GridView" runat="server" ShowHeaderWhenEmpty="true" AutoPostBack="true" CssClass="table table-striped table-bordered" AllowSorting="True" AllowPaging="true" PageSize="6" OnPageIndexChanging="OnPaging" OnSorting="GridView_Sorting">
                            <EmptyDataTemplate>
                                <div style="font-size: 17px; color: red; font-weight: bold; text-align: center">
                                    No records found!!!.
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
