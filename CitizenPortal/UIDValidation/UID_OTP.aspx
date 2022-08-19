<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UID_OTP.aspx.cs" Inherits="CitizenPortal.UIDValidation.UID_OTP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OTP</title>
    <link href="../Styles/Border.css" rel="stylesheet" type="text/css" />
    <style>
        h1
        {
            color: #666;
            font-size: 16px;
            font-family: Arial;
            text-align: center;
            margin-top: 25px;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <h1>
        One Time Password</h1>
    <hr />
    <div style="margin: 40px 10px;">
        <asp:Label ID="lblError" runat="server" Style="color: Red" Text="" Visible="false" />
        <%--<asp:Label ID="lblSuccess" runat="server" Style="color: Green" Text="" Visible="false" />--%>
        <asp:Panel ID="pnlConfirm" runat="server" Visible="false">
            <fieldset>
                <legend class="field-lable">
                    <asp:Label ID="lblappagreement" runat="server" Text="Notice : "></asp:Label>
                </legend>
                <p>
                    Dear Customer,</p>
                <p style="text-indent: 50px;">
                    Please note that your mobile number must be registered with aadhaar to get your
                    One Time Password(OTP).</p>
            </fieldset>
            <div class="brdbutton" dir="ltr" style="width: 98% !important">
                <table align="center">
                    <tr>
                        <td align="right">
                            <asp:Button ID="btnContinue" runat="server" Text="Continue" OnClick="btnContinue_Click" />
                        </td>
                        <td align="left">
                            <asp:Button ID="btncloseNotice" runat="server" Text="Close" OnClientClick="closePage();" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlOTP" runat="server" Visible="false">
            <fieldset>
                <legend class="field-lable">
                    <asp:Label ID="lblOTPValidation" runat="server" Text="OTP Validation : "></asp:Label>
                </legend>
                <p>
                    Dear Customer,</p>
                <p style="text-indent: 50px;">
                    <asp:Label ID="lblStatus" runat="server" Text="" /></p>
                <asp:Panel ID="pnlEnterOTP" runat="server" Visible="false">
                    <table width="100%">
                        <tr>
                            <td>
                                <asp:Label ID="lblOTP" runat="server" Text="OTP" ToolTip="One Time Password" />
                                <span class="mandatory">*</span>
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:TextBox ID="txtOTP" runat="server" Text="" />
                                <asp:RequiredFieldValidator ID="rfvOTP" runat="server" ControlToValidate="txtOTP"
                                    ErrorMessage="Please Enter OTP" ForeColor="Red" Display="Dynamic" Enabled="true"
                                    Font-Size="10px" ValidationGroup="OTPValidation" />
                            </td>
                        </tr>
                    </table>
                    <div class="brdbutton" dir="ltr" style="width: 98% !important">
                        <table align="center">
                            <tr>
                                <td align="right">
                                    <asp:Button ID="btnValidateOTP" runat="server" Text="Validate OTP" OnClick="btnValidateOTP_Click"
                                        ValidationGroup="OTPValidation" />
                                </td>
                                <td align="left">
                                    <asp:Button ID="btnCloseOTPValidation" runat="server" Text="Close" OnClientClick="closePage();" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </fieldset>
        </asp:Panel>
        <asp:Panel ID="pnlDetails" runat="server" Visible="false">
            <fieldset>
                <legend class="field-lable">
                    <asp:Label ID="lblDetails" runat="server" Text="Citizen Details:"></asp:Label>
                </legend>
                <table style="margin-top: 1%;" runat="server" id="tbl1" visible="false">
                    <tr>
                        <td rowspan="4">
                            <asp:Image ID="img1" runat="server" Visible="false" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px;">
                            <b>CitizenName </b>
                        </td>
                        <td>
                            :
                        </td>
                        <td style="width: 200px;">
                            <asp:Label ID="lblCitizenName" runat="server" />
                        </td>
                        <td style="width: 100px;">
                            <b>Birth Date</b>
                        </td>
                        <td>
                            :
                        </td>
                        <td style="width: 200px;">
                            <asp:Label ID="lblDOB" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Gender</b>
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:Label ID="lblGender" runat="server" />
                        </td>
                        <td>
                            <b>Contacts</b>
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:Label ID="lblContacts" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Address</b>
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:Label ID="lblAddress1" runat="server" />
                        </td>
                        <td>
                            <b>Address 2</b>
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:Label ID="lblAddress2" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7" align="center">
                            <asp:Button ID="btnVerify" runat="server" Text="Proceed" OnClientClick="SetName();" />
                            <asp:Button ID="btnClose" runat="server" Text="Close" OnClientClick="closePage();" />
                        </td>
                    </tr>
                </table>
            </fieldset>
        </asp:Panel>
    </div>
    </form>
    <script type="text/javascript">
        function SetName() {
            debugger;
            if (window.opener != null && !window.opener.closed) {
                var txtUID = "";
                if (window.opener.document.getElementById("CPH_txtUIDNew") == null || window.opener.document.getElementById("CPH_txtUIDNew") == "")
                    txtUID = window.opener.document.getElementById("CPH_Paas1_txtUIDNew");
                else
                    txtUID = window.opener.document.getElementById("CPH_txtUIDNew");

                var txtEID = "";
                if (window.opener.document.getElementById("CPH_txtEIDNew") == null || window.opener.document.getElementById("CPH_txtEIDNew") == "")
                    txtEID = window.opener.document.getElementById("CPH_Paas1_txtEIDNew");
                else
                    txtEID = window.opener.document.getElementById("CPH_txtEIDNew")
                txtUID.value = getUrlVars()["UID"];
                txtEID.value = getUrlVars()["EID"];
                window.close();
                window.opener.ParentWindowFunction();
                return false;
            }
            window.close();
        }

        function closePage() {
            window.close();
        }
        function getUrlVars() {
            var vars = [], hash;
            var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            for (var i = 0; i < hashes.length; i++) {
                hash = hashes[i].split('=');
                vars.push(hash[0]);
                vars[hash[0]] = hash[1];
            }
            return vars;
        }
    </script>
</body>
</html>
