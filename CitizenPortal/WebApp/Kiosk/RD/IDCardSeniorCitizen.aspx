<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IDCardSeniorCitizen.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.RD.IDCardSeniorCitizen" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../../g2c/js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function printDiv() {
            debugger;
            var divToPrint = document.getElementById('printableArea');
            var htmlToPrint = "";
            var htmlToPrint = '' + '<style type="text/css">'
           + 'table th, table td {' + 'padding:0;' + '' + 'font-size:10px;' + '' + 'line-height:initial;' + ' }' +
      '</style>';

            htmlToPrint += divToPrint.outerHTML;
            newWin = window.open("");
            newWin.document.write(htmlToPrint);
            newWin.print();
            newWin.close();
        }
    </script>

</head>
    <body>
    <form id="form2" runat="server">
        <div id="printableArea">
            <table width="860" border="0" align="center" cellpadding="0" cellspacing="0" style="font-size:10px; font-family: Arial, Helvetica, sans-serif; ">
                <tr>
                    <td>
                        <table width="380 border="0" cellspacing="0" cellpadding="0" style="background: url(/WebApp/Kiosk/RD/img/card_bodybg.png); background-repeat:no-repeat;  background-position: center; -webkit-print-color-adjust: exact;   border-right: 1px solid #ddd; border-bottom: 4px solid #369; border-left: 1px solid #ddd;">
                            <tr style="background-color: #D30601; background: url(/WebApp/Kiosk/RD/img/id_card_bg.png); -webkit-print-color-adjust: exact;             background-size: cover;">
                                <td colspan="3">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td style="padding: 5px;">
                                                <img src="img/odisha_police_logo.png" /></td>
                                            <td style="font-size: 18px; text-align: center; color: #fff; border-top-left-radius: 4px; border-top-right-radius: 4px;">Police Commissionerate<br />
                                                Bhubaneswar - Cuttack</td>
                                            <td><img src="img/cpbc_logo.png" /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td style="padding: 2px; text-align: center; font-weight: bold;">860/CP </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="text-align: center; padding: 5px 5px;">
                                                <img id="profilephoto" runat="server" style="height:72px;width:90px;" /></td>
                                        </tr>
                                        <tr>
                                            <td valign="baseline"> 
                                            <img src="img/commissioner_sign.jpg" /></td>

                                        </tr>
                                    </table>
                                </td>
                                <td valign="top">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td style="font-weight: bold; padding: 5px 5px;">Name</td>
                                            <td><asp:Label ID="lblname" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold; padding: 5px 5px;">Designation/Esst.</td>
                                             <td><asp:Label ID="lblappid" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold; padding: 5px 5px;">Date of Birth</td>
                                            <td><asp:Label ID="lbldob" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td valign="middle" style="font-weight: bold; padding: 5px 5px;">Blood Group</td>
                                           <td><asp:Label ID="lblbloodgroup" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="font-weight: bold; padding: 5px 5px;">Present Address</td>
                                            <td><asp:Label ID="lblpaddress" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="font-weight: bold; padding: 5px 5px;">Permanent Address</td>
                                            <td><asp:Label ID="lblpermanentaddress" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                 <img id="imgsignature" runat="server" style="height:10px;width:96px;padding-left:55px;" /></td>
                                            
                                        </tr>
                                    </table>
                                </td>
                                
                            </tr>
                            <tr>
                                <td colspan="4" valign="bottom">
                                    <div style="float: left; padding-top:7px; padding-left:10px;">
                                        
                                        Signature of Card Holder
                                    </div>
                                    <div style="float: right; text-align: right; padding-right:12px; padding-bottom:8px;">
                                       
                                        Dy. Commissioer of Police, <br />(HQRS Bhubaneswar - Cuttack)</div>
                                </td>
                            </tr>
                        </table>
                    </td>
           
                    <td valign="top">
                        <table width="380" border="0" cellspacing="0" cellpadding="0" style="border-top: 1px solid #ddd; border-right: 1px solid #ddd; border-bottom: 4px solid #369; border-left: 1px solid #ddd;">
                            <tr>
                              <td colspan="6" style="font-size: 14px; font-weight: bold; color: #000; text-align: center; text-decoration: underline; padding: 5px;">INSTRUCTIONS</td>
                            </tr>
                            <tr>
                              <td valign="top" style="font-weight: bold;"><ol style="line-height: 20px; height:210px; font-weight: normal; text-align: left; padding: 0 0 0 25px; margin: 0;">
                                        <li>Please surrender this card on retirement/resignation/Transfer/Suspension/Remova from service. Its loss should be reported to the Dy. Commissioner of Police/HQ.</li>
                                        <li>Loss / mutilation/late renewal/unauthorized retention etc will entail penal or disciplinary consequences.</li>
                                        <li>Please Display this Card as proof of your Identity.</li>
                                        <li>This Card is not Transferable.</li>
                                        <li><b> If you need any assistance please contact<br /> @ +91-8763186566</b></li>
                                    </ol></td>
                                <td valign="top" style="font-weight: bold; padding:5px; -webkit-print-color-adjust: exact; ">
                                    <%--<img src="img/qr_code_verify.jpg" />--%>
                                      <uc1:QRCode runat="server" ID="QRCode1" />
                                    
                                </td>
                            </tr>
                        </table></td>
                </tr>
</table>

            
        </div>
        <div style="margin: 0 auto; text-align: center;">
                <input type="button" value="Print" onclick="printDiv()" style="margin: 20px; background-color: #09C; color: #fff; padding: 10px 20px; border: 0; border-radius: 2px;" />
            </div>
    </form>
</body>
</html>
