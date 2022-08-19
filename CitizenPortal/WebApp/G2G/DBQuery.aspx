<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DBQuery.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.DBQuery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .tdRT {
            text-align: right;
        }

        .tdLT {
            text-align: left;
        }

        .style2 {
            width: 800px;
        }
    </style>
    <script type="text/javascript" language="javascript">
        function GetSelected(Button) {
            document.getElementById('<%=HFSelected.ClientID %>').value = Button;
            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="wrapper">
                <div class="form-wrapper">
                    <div class="popup">
                        <table cellspacing="0" align="center">
                            <tbody class="wrapper-border">
                                <tr class="wrapper-border">
                                    <td class="top-left bordercommon"></td>
                                    <td class="top-middle bordercommon"></td>
                                    <td class="top-right bordercommon"></td>
                                </tr>
                                <tr class="wrapper-border">
                                    <td class="left-middle bordercommon"></td>
                                    <td align="center" class="middle-middle">
                                        <div class="round-border">
                                            <div align="left" class="title-lable">
                                                <table border="0" cellpadding="0" cellspacing="0" class="style1">
                                                    <tr>
                                                        <td style="font-size: 14px; font-weight: bold; color: #4F4F4F;">Execute DB Query&nbsp;
                                                        </td>
                                                        <td>&nbsp;
                                                        </td>
                                                        <td align="right" class="lbl_Validator"></td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="brd">
                                                <fieldset>
                                                    <legend class="field-lable">Filter : </legend>
                                                    <asp:Panel ID="Panel1" runat="server" CssClass="agrement">
                                                        <table width="100%">
                                                            <tr>
                                                                <td valign="top" align="left">
                                                                    <table width="350px">
                                                                        <tr>
                                                                            <td align="right" class="style10 lbl_property" width="120px" nowrap="nowrap">Database Name
                                                                            </td>
                                                                            <td class="lbl_property" width="10px" align="center">:</td>
                                                                            <td class="mandatory" width="10px">&nbsp;
                                                                            </td>
                                                                            <td align="left" class="style9" width="230px">
                                                                                <asp:DropDownList ID="ddlDB" runat="server" Width="100%"
                                                                                    OnSelectedIndexChanged="ddlDB_SelectedIndexChanged" AutoPostBack="True"
                                                                                    CssClass="lbl_value">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="right" class="style10 lbl_property" width="120px" nowrap="nowrap"></td>
                                                                            <td class="lbl_property" width="10px"></td>
                                                                            <td class="mandatory" width="10px"></td>
                                                                            <td align="left" class="style9" width="230px"></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="50px">&nbsp;
                                                                </td>
                                                                <td align="right" valign="top">&nbsp;</td>
                                                                <td align="right" valign="top">
                                                                    <table>
                                                                        <tr>
                                                                            <td align="right" class="style10 lbl_property" width="120px" nowrap="nowrap">Table Name
                                                                            </td>
                                                                            <td align="center" class="lbl_property" width="10px">:
                                                                            </td>
                                                                            <td class="mandatory" width="10px">&nbsp;
                                                                            </td>
                                                                            <td align="left" width="230px">
                                                                                <asp:DropDownList ID="ddlTables" runat="server" Width="230px"
                                                                                    CssClass="lbl_value">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="right" class="style10 lbl_property" width="120px" nowrap="nowrap"></td>
                                                                            <td class="lbl_property" width="10px"></td>
                                                                            <td class="mandatory" width="10px"></td>
                                                                            <td align="left" class="style9" width="230px"></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" valign="top" width="20px">&nbsp;</td>
                                                                <td align="right" valign="top">
                                                                    <asp:Button ID="btnShowData" runat="server" CssClass="buton" Font-Bold="True"
                                                                        ForeColor="#000066" Height="30px" OnClick="btnShowData_Click"
                                                                        Text="Show Data" OnClientClick="return GetSelected('S');"
                                                                        Width="100px" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </fieldset>
                                                <fieldset>
                                                    <legend class="field-lable">Query Builder : </legend>
                                                    <asp:Panel ID="Panel2" runat="server" CssClass="agrement">
                                                        <table class="style1">
                                                            <tr>
                                                                <td class="style2">
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td align="right" class="lbl_property" width="110px">Query</td>
                                                                            <td width="20px">:</td>
                                                                            <td align="left">
                                                                                <asp:DropDownList ID="ddlQuery" runat="server" CssClass="lbl_value"
                                                                                    Width="99%">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="20px">&nbsp;</td>
                                                                <td width="100px">
                                                                    <asp:Button ID="btnSave" runat="server" CssClass="buton" Font-Bold="True"
                                                                        ForeColor="#000066" Height="25px" Text="Save" Width="100px"
                                                                        Visible="False" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style2">&nbsp;</td>
                                                                <td width="20px">&nbsp;</td>
                                                                <td width="100px">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" rowspan="4" valign="top">
                                                                    <asp:TextBox ID="txtQuery" runat="server" CssClass="txtMultiLine lbl_value"
                                                                        Height="88px" Rows="10" TextMode="MultiLine" Width="99%"></asp:TextBox>
                                                                </td>
                                                                <td width="20px">&nbsp;</td>
                                                                <td width="100px">
                                                                    <asp:Button ID="btnExecute" runat="server" CssClass="buton" Font-Bold="True"
                                                                        ForeColor="#000066" Height="25px" OnClick="btnExecute_Click"
                                                                        OnClientClick="return GetSelected('E');" Text="Execute" Width="100px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="20px"></td>
                                                                <td width="100px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="20px"></td>
                                                                <td width="100px">
                                                                    <asp:Button ID="btnClearResults" runat="server" CssClass="buton" Font-Bold="True"
                                                                        ForeColor="#000066" Height="25px" OnClick="btnClearResults_Click" Text="Clear"
                                                                        Width="100px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="20px"></td>
                                                                <td width="100px"></td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </fieldset>

                                                <asp:Panel ID="pnlResults" runat="server" Width="100%">
                                                    <fieldset>
                                                        <legend class="field-lable">Result : </legend>
                                                        <table>
                                                            <tr>
                                                                <td align="right">
                                                                    <asp:Label ID="lblMsg" runat="server" CssClass="lbl_value"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right"></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:Panel ID="Panel3" runat="server" CssClass="agrement" ScrollBars="Auto"
                                                                        Width="842px">
                                                                        <asp:GridView ID="gvResults" runat="server" AlternatingRowStyle-BackColor="#C2D69B"
                                                                            BorderColor="#666666" BorderStyle="Solid" BorderWidth="1px" EmptyDataText="There is no data to display"
                                                                            Font-Names="arial" Font-Size="9pt" HeaderStyle-BackColor="green"
                                                                            AllowPaging="True" OnPageIndexChanging="gvResults_PageIndexChanging"
                                                                            CssClass="gvDetail">
                                                                            <HeaderStyle BackColor="#E2E2E2" ForeColor="#000099" />
                                                                            <AlternatingRowStyle BackColor="#F7F7F7" />
                                                                        </asp:GridView>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </fieldset>
                                                </asp:Panel>
                                                <asp:HiddenField ID="HFSelected" runat="server" />
                                            </div>
                                            <div class="brdbutton">
                                                <table align="center" width="100%">
                                                    <tr>
                                                        <td align="right">&nbsp;
                                                        </td>
                                                        <td align="center">
                                                            <asp:Button ID="btn_Excel" runat="server" CausesValidation="False"
                                                                CommandName="Insert" CssClass="buton" Font-Bold="True" ForeColor="#000066"
                                                                Height="30px" OnClick="btn_Excel_Click" TabIndex="40" Text="Export to Excel"
                                                                ToolTip="Export Data to Excel" Width="120px" />
                                                        </td>
                                                        <td>&nbsp;</td>
                                                        <td align="center">
                                                            <asp:Button ID="btn_Cancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                CssClass="buton" Font-Bold="True" ForeColor="#000066" Height="30px" TabIndex="40"
                                                                Text="Cancel" Width="120px" />
                                                        </td>
                                                        <td align="left">&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="right-middle bordercommon"></td>
                                </tr>
                                <tr class="wrapper-border bordercommon">
                                    <td class="bottom-left bordercommon"></td>
                                    <td class="bottom-middle bordercommon"></td>
                                    <td class="bottom-right bordercommon"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
