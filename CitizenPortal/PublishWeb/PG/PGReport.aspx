<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PGReport.aspx.cs" Inherits="CitizenPortal.PG.PGReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="LblAppid" Text="App Id" runat="server"></asp:Label>
            <asp:TextBox ID="txtAppID" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            <asp:GridView ID="GVSearchItem" runat="server" Visible="false"
                AutoGenerateColumns="false" ShowFooter="true" OnRowCommand="GVSearchItem_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Service ID">
                        <ItemTemplate>
                            <asp:Label ID="ServiceID" runat="server"
                                Text='<%#Eval("ServiceID")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="App ID">
                        <ItemTemplate>
                            <asp:Label ID="AppID" runat="server"
                                Text='<%#Eval("AppID")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Pg Sequence No">
                        <ItemTemplate>
                            <asp:Label ID="PGSequenceNo" runat="server"
                                Text='<%#Eval("PGSequenceNo")%>'></asp:Label>
                        </ItemTemplate>
                        <%--<EditItemTemplate>
                                <asp:TextBox ID="txtService" runat="server" Text='<%#
                                         Eval("service_name")%>'></asp:TextBox>
                            </EditItemTemplate>--%>
                           
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Amt">
                        <ItemTemplate>
                            <asp:Label ID="Amount" runat="server" Text='<%#
                                         Eval("Amount")%>'></asp:Label>
                        </ItemTemplate>
                        <%--<EditItemTemplate>
                                <asp:TextBox ID="txtService" runat="server" Text='<%#
                                         Eval("service_name")%>'></asp:TextBox>
                            </EditItemTemplate>--%>
                           
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkApi" runat="server" CommandArgument='<%# Eval("PGSequenceNo")%>' CommandName="API"
                                Text="Check Status From ICICI"></asp:LinkButton>
                        </ItemTemplate>

                        <%--                            <FooterTemplate>
     
                                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="AddService"
                                         />
                            </FooterTemplate>--%>
                        <%-- OnClientClick='<%# String.Format("EditBankAccount(\"{0}\");", Eval("PGSequenceNo")) %>'--%>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
            <br />
            <br />
            <br />
            <br />
            <asp:GridView ID="grdAccount" runat="server" Visible="false"
                AutoGenerateColumns="false" ShowFooter="true" OnRowCommand="grdAccountItem_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Bank Status">
                        <ItemTemplate>
                            <asp:Label ID="status" runat="server"
                                Text='<%#Eval("status")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ezpay trans id">
                        <ItemTemplate>
                            <asp:Label ID="ezpaytranid" runat="server"
                                Text='<%#Eval("ezpaytranid")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Amount">
                        <ItemTemplate>
                            <asp:Label ID="amount" runat="server"
                                Text='<%#Eval("amount")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="trans date">
                        <ItemTemplate>
                            <asp:Label ID="trandate" runat="server"
                                Text='<%#Eval("trandate")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Pg Sequence No">
                        <ItemTemplate>
                            <asp:Label ID="PGSequenceNo" runat="server"
                                Text='<%#Eval("pgreferenceno")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="settlement date">
                        <ItemTemplate>
                            <asp:Label ID="sdt" runat="server" Text='<%#
                                         Eval("sdt")%>'></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="App Id">
                        <ItemTemplate>
                            <asp:Label ID="AppID" runat="server" Text='<%#
                                         Eval("AppID")%>'></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="Linksave" runat="server" CommandArgument='<%#Eval("status") + ";" +Eval("ezpaytranid") + ";"+Eval("amount") + ";" + Eval("trandate") +";"+ Eval("pgreferenceno")+";"+Eval("sdt") +";"+Eval("AppID") %>' CommandName="Manage"
                                Text="Save In Pgresponse And transaction Table"></asp:LinkButton>
                        </ItemTemplate>

                        <%--                            <FooterTemplate>
     
                                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="AddService"
                                         />
                            </FooterTemplate>--%>
                        <%-- OnClientClick='<%# String.Format("EditBankAccount(\"{0}\");", Eval("PGSequenceNo")) %>'--%>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblMsg" Visible="false"  runat ="server"></asp:Label>
        </div>
    </form>
</body>
</html>
