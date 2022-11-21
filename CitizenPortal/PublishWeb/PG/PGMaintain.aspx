<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PGMaintain.aspx.cs" Inherits="CitizenPortal.PG.PGMaintain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Button runat="server" ID="btnCheckAppresponse" Text="Check Success List From Bank ApI" OnClick="btnCheckAppresponse_Click" />
        <asp:GridView ID="gvSuccesss" runat="server"
                AutoGenerateColumns="false" ShowFooter="true">
                <Columns>
                     <asp:TemplateField HeaderText="Row Number">
                        <ItemTemplate>
                            <asp:Label ID="RowNumber" runat="server"
                             Text='<%#Eval("RowNumber")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Bank Status">
                        <ItemTemplate>
                            <asp:Label ID="status" runat="server"
                                Text='<%#Eval("Pgstatus")%>'></asp:Label>
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
                   
                </Columns>
            </asp:GridView>
            <asp:Button runat="server" ID="btnSuccess" Text="Save In Response" OnClick="btnSuccess_Click" />
        </div>
    </form>
</body>
</html>
