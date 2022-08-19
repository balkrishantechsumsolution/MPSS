<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeniorCitizenIDCard.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.RD.SeniorCitizenIDCard" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCodeSr.ascx" TagPrefix="uc2" TagName="QRCodeSr" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../../g2c/js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function printDiv(DIVID) {
            debugger;
            var divToPrint = document.getElementById(DIVID);
            var htmlToPrint = "";
            htmlToPrint += divToPrint.outerHTML;
            newWin = window.open("");
            newWin.document.write(htmlToPrint);
            newWin.print();
            newWin.close();
        }
    </script>
    <style type="text/css">
        body {
margin:0px        }
    </style>
</head>
<body>
    <form id="form2" runat="server">

        <div id="PrintFront" runat="server" class="prntRecept" style="width: 345px; display: block; margin: 0 auto; font-family: Arial; font-size: 12px;">
            <div style="margin: 0 auto; border: 1px solid #eeeeee; height: 220px; width: 350px; max-height: 220px; font-family: Arial;">

                <div>
                    <div style="width: 0; height: 0; border-top: 55px solid #D30601; border-right: 350px solid transparent;">
                    </div>
                    <div style="width: 0; height: 0; border-bottom: 55px solid #050f80; border-left: 350px solid transparent; margin-top: -55px;">
                    </div>
                </div>
                <div style="margin-top: -57px;">
                    <div style="float: left;">
                        <asp:Image ID="Image3" runat="server" ImageUrl="img/odisha_police_logo.png" Style="width: 40px; margin: 5px;" />
                    </div>

                    <div style="float: right">
                        <asp:Image ID="Image5" runat="server" ImageUrl="img/cpbc_logo.png" Style="width: 36px; margin: 5px;" />
                    </div>
                </div>
                <div style="text-transform: uppercase; text-align: center; margin-top: 8px; font-weight: bold; color: #ffffff;">
                    <asp:Label ID="Label4" runat="server" Style="display: block; white-space: nowrap; font-size: 14px; font-weight: bold;"
                        Text="Senior Citizen Security Cell"></asp:Label>
                    <asp:Label ID="Label5" runat="server" Style="display: block; white-space: nowrap; font-size: 13px;"
                        Text="Police Commissionerate"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Style="display: block; white-space: nowrap; font-size: 11px;"
                        Text="Bhubaneswar - Cuttack"></asp:Label>
                </div>
                <div style="clear: both"></div>
                <div style="margin: 0 auto; background-image: url(/WebApp/Kiosk/RD/img/card_bodybg.png); background-repeat: no-repeat; background-position: center; border: 0px solid #000; height: 140px; width: 340px; max-height: 140px;">
                    <table style="width: 100%; height: 100%;">
                        <tr style="vertical-align: top;">
                            <td>
                                <div style="margin: 0 3px; float: right; text-align: center; width: 75px;">
                                    <div>
                                        <img id="profilephoto" runat="server" src="../Images/photo.png" style="width: 74px; height: 95px; border: 1px solid #fff" />
                                    </div>                                    
                                </div>
                                <div style="margin: 0px 5px 5px 0px;">
                                    <table cellpadding="0" cellspacing="0" style="margin: 0 3px 0 3px; width: 220px; font-size: 11px; line-height: 13px;">

                                        <tr>
                                            <td align="left" style="white-space: nowrap; width: 37px; vertical-align: top;">Sl. No.</td>
                                            <td style="text-align: left; width: 7px">:</td>
                                            <td align="justify" valign="top">
                                                <asp:Label ID="lblappid" runat="server" Font-Bold="True" Font-Size="11px"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td align="left" style="white-space: nowrap; width: 37px; vertical-align: top;">
                                                <asp:Label ID="Label10" runat="server"
                                                    Text="Name"></asp:Label>
                                            </td>
                                            <td style="text-align: left; width: 7px">:
                                            </td>
                                            <td align="justify" valign="top">
                                                <asp:Label ID="lblname" runat="server" style="text-transform:uppercase;"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 37px; white-space: nowrap;" valign="top">
                                                <asp:Label ID="Label13" runat="server"
                                                    Text="DOB"></asp:Label>
                                            </td>
                                            <td style="text-align: left; width: 7px">:
                                            </td>
                                            <td align="justify" valign="top">
                                                <asp:Label ID="lbldob" runat="server"></asp:Label>
                                                <%-- &nbsp;&nbsp;|&nbsp;&nbsp;
                                                    <asp:Label ID="Label15" runat="server"
                                                        Text="Age : "></asp:Label>
                                                <asp:Label ID="lblage" runat="server"></asp:Label>
                                                <asp:Label ID="Label19" runat="server"
                                                    Text=" Yrs"></asp:Label>--%>
                                            &nbsp;|&nbsp;Bl. Gr :
                                                <asp:Label ID="lblbloodgroup" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <%-- <tr>
                                            <td style="text-align: left; width: 37px; white-space: nowrap; vertical-align: top;">Blood Gr</td>
                                            <td style="text-align: left; width: 7px">:</td>
                                            <asp:Label ID="Label6" runat="server"
                                                        T "></asp:Label>
                                            <td>
                                                
                                            </td>

                                        </tr>--%>
                                        <tr>

                                            <td style="text-align: left; width: 37px; white-space: nowrap; vertical-align: top;">Mobile No</td>
                                            <td style="text-align: left; width: 7px">:</td>
                                            <td>
                                                <asp:Label ID="lblmobile" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="text-align: left; vertical-align: top;">
                                                <asp:Label ID="Label20" runat="server"
                                                    Text="Address "></asp:Label>
                                            </td>
                                            <td style="text-align: left; width: 7px; vertical-align: top">:
                                            </td>
                                            <td style="max-height: 80px; overflow: hidden !important; display: block;">
                                                <asp:Label ID="lblpaddress" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left; vertical-align: top;">
                                                <asp:Label ID="Label9" runat="server"
                                                    Text="P.S. "></asp:Label>
                                            </td>
                                            <td style="text-align: left; width: 7px; vertical-align: top">:
                                            </td>
                                            <td style="max-height: 80px; overflow: hidden !important; display: block;">
                                                <asp:Label ID="lblPS" runat="server"></asp:Label>
                                            </td>
                                        </tr>
										<tr>
										
                                            <td align="left" style="white-space: nowrap; vertical-align: top;" colspan="3">
                                                
                                            </td>
                                        
										</tr>
                                    </table>
                                </div>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="margin-top: 0; text-align: left; font-size: 9px; float: left;">
                                    <img id="imgsignature" runat="server" src="../Images/photo.png" style="width: 75px; height: 38px; border: 1px solid #fff" /><br/>
                                    <div style="font-size: 9px;">Sign. of Card Holder</div>
                                </div>
                                <div style="float: right; text-align: center; font-size: 9px; margin-top: -10px;">
                                    <img src="img/commissioner_sign.png" style="margin-left: -75px;height:30px;" />
                                    <br /><div style="font-size: 9px;">
                                    <asp:Label ID="Label28" runat="server"
                                        Text="Dy. Commissioner of Police (HQRS),"></asp:Label><br/>
										<asp:Label ID="lblSig" runat="server"
                                        Text="Bhubaneswar-cuttack"></asp:Label></div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div style="clear: both"></div>
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        <div id="PrintBack" runat="server" width="345px" style="display: block; margin: 0 auto;"
            cssclass="prntRecept" font-size="12px" font-names="arial">
            <div id="div2" runat="server" style="border: 1px solid #eeeeee; margin: 5px auto; padding: 1px; width: 340px; font-family: Arial; height: 210px;">
                <div style="margin: 0 auto; height: 220px; width: 325px; max-height: 220px; font-family: Arial;">
                    <table style="margin: 0 auto; width: 325px;">
                        <tr>
                            <td style="height: 44px">
                                <div style="">
                                    <div style="float: left; width: 260px; text-align: center">
                                        <asp:Label ID="Label11" runat="server" Style="white-space: nowrap; font-size: 12px; margin-top: 3px; font-weight: bold;"
                                            Text="SENIOR CITIZEN ID PROOF"></asp:Label><br />
                                        <asp:Label ID="Label40" runat="server" Font-Bold="True"
                                            Font-Size="10px" Text="Emergency contact person details"></asp:Label>
                                    </div>

                                    <div id="divQR" style="float: right; width: 50px; height: 50px; margin: 0;">
                                        <uc2:QRCodeSr ID="QRCodeSr1" runat="server" />
                                    </div>
                                </div>

                            </td>
                        </tr>
                        <tr>
                            <!-----------Emergency contact person details from relative details tb---->
                            <td id="emergencydetail" runat="server">
                                <table style="margin: -12px auto; width: 300px; line-height: 12px;" cellpadding="0" cellspacing="0">

                                    <tr>
                                        <td style="text-align: left; vertical-align: bottom; width: 10px">
                                            <asp:Label ID="Label41" runat="server" Font-Size="12px"
                                                Text="*"></asp:Label>
                                        </td>
                                        <td style="width: 55px; vertical-align: middle">
                                            <asp:Label ID="Label42" runat="server" Font-Size="10px"
                                                Text="Name"></asp:Label>
                                        </td>
                                        <td style="width: 7px; vertical-align: middle">:
                                        </td>
                                        <td>
                                            <asp:Label ID="lblrelativename" runat="server" Font-Size="10px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="">
                                            <asp:Label ID="Label44" runat="server" Font-Size="12px"
                                                Text="*"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label45" runat="server" Font-Size="10px"
                                                Text="Mobile No."></asp:Label>
                                        </td>
                                        <td style="width: 7px">:
                                        </td>
                                        <td>
                                            <asp:Label ID="lblrelativemobile" runat="server" Font-Size="10px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="">
                                            <asp:Label ID="Label238" runat="server" Font-Size="12px" Text="*"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label237" runat="server" Font-Size="10px"
                                                Text="Address"></asp:Label>
                                        </td>
                                        <td>:</td>
                                        <td>
                                            <asp:Label ID="lblrelativeaddress" runat="server" Font-Size="10px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-top: 1px dashed #000; text-align: justify;"></td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True"
                                    Font-Size="10px" Font-Underline="True" Text="INFORMATION"></asp:Label></td>
                        </tr>

                        <tr>
                            <td align="center">
                                <table style="margin: 0 auto; width: 300px; line-height: 12px;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="text-align: left; vertical-align: top; width: 10px;">
                                            <asp:Label ID="Label27" runat="server" Font-Size="10px"
                                                Text="1. "></asp:Label>
                                        </td>
                                        <td style="text-align: left; vertical-align: top;">
                                            <asp:Label ID="Label29" runat="server" Font-Size="10px"
                                                Text="If the card is lost, immediately inform the local Police Station or Dy. Comm. of Police Headquator. Bhubaneswar - Cuttack"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; vertical-align: top; width: 10px;">
                                            <asp:Label ID="Label30" runat="server" Font-Size="10px"
                                                Text="2. "></asp:Label>
                                        </td>
                                        <td style="text-align: left; vertical-align: top;">
                                            <asp:Label ID="Label31" runat="server" Font-Size="10px"
                                                Text="Please display this card as proof of your Identity."></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; vertical-align: top; width: 10px;">
                                            <asp:Label ID="Label32" runat="server" Font-Size="10px"
                                                Text="3. "></asp:Label>
                                        </td>
                                        <td style="text-align: left; vertical-align: top;">
                                            <asp:Label ID="Label33" runat="server" Font-Size="10px"
                                                Text="This card is not transfarable."></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; vertical-align: top; width: 10px;"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>



                    </table>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />



        <div style="margin: 0 auto; text-align: center;">
            <input type="button" value="Print Front" onclick="printDiv('PrintFront')" style="margin: 20px; background-color: #09C; color: #fff; padding: 10px 20px; border: 0; border-radius: 2px;" />
            <input type="button" value="Print Back" onclick="printDiv('PrintBack')" style="margin: 20px; background-color: #09C; color: #fff; padding: 10px 20px; border: 0; border-radius: 2px;" />
        </div>
    </form>
</body>
</html>
