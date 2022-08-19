<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeniorCitizenCertificate.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.SeniorCitizenCertificate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Styles/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/style.admin.css" rel="stylesheet" />
    <link href="../../bootstrap.min.css" rel="stylesheet" />
    <link href="../../Styles/style.admin.css" rel="stylesheet" />
    <link href="../../Styles/bootstrap.min.css" rel="stylesheet" />

    <script src="../../../Scripts/angular.min.js"></script>
    <script src="../../../PortalScripts/ServiceLanguage.js"></script>
</head>

<body>
    <form id="form1" runat="server">
        <div id="htmlContent" runat="server" ng-app="appmodule">

            <div id="page-wrapper" class="box-container" style="min-height: 500px !important; width: 500px; margin: 50px auto;" ng-controller="ctrl">
                <%---Start of Application Details----%>
                <div class="row">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title">Senior Citizen Certificate Output
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group">
                                    <asp:Panel ID="Panel3" runat="server" Width="345px" Style="display: block; margin: 0 auto;"
                                        CssClass="prntRecept" Font-Size="12px" Font-Names="arial">
                                        <div id="divDemo" runat="server" style="border: 3px solid #000000; margin: 5px auto; padding: 1px; width: 321px; height: 210px;">
                                            <div style="margin: 0 auto; background-image: url(../Images/Untitled.png); background-repeat: no-repeat; background-position: center; border: 1px solid #000; height: 202px; width: 313px; max-height: 202px;">
                                                <table style="width: 100%; height: 100%;">
                                                    <tr>
                                                        <td>
                                                            <div style="text-align: center; border-bottom: 1px solid #808080; margin-bottom: 2px; padding: 2px 0;">
                                                                <div style="float: left;">
                                                                    <asp:Image ID="Image1" runat="server" ImageUrl="../Images/logo.png" Style="width: 50px; margin-top: -5px;" />
                                                                </div>

                                                                <div style="float: right">
                                                                    <asp:Image ID="Image2" runat="server" ImageUrl="../Images/logo_orissa.gif" Style="width: 20px; margin-top: -5px;" />
                                                                </div>
                                                                <div style="width: 115px; margin: 0 auto;">
                                                                    <asp:Label ID="lblSenCertHeading" runat="server" Font-Bold="True"
                                                                        Style="display: block; white-space: nowrap;"
                                                                        Text="SENIOR CITIZEN">{{resourcesData.lblSenCertHeading}}</asp:Label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr style="vertical-align: top;">
                                                        <td>
                                                            <div style="margin: 5px; float: left; text-align: center; width: 80px;">
                                                                <div>
                                                                    <asp:Image ID="Image4" runat="server" BorderColor="#333333" BorderStyle="Solid" BorderWidth="1px"
                                                                        Height="80px" ImageUrl="../Images/photo.png" Style="width: 75px" />
                                                                </div>
                                                                <div style="margin-top: 5px; text-align: left; font-size: 10px;">
                                                                    <asp:Label ID="BloodGroup" runat="server"
                                                                        Text="Blood Group:">{{resourcesData.BloodGroup}}</asp:Label>
                                                                    <asp:Label ID="lblBloodGrp" runat="server" Text="B+"></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div style="margin: 5px 5px 5px 0px; float: right; width: 205px; height: 115px;">
                                                                <table cellpadding="0" cellspacing="0" style="margin: 0 3px 0 3px; width: 200px">
                                                                    <tr>
                                                                        <td align="left" nowrap="nowrap" style="width: 37px;" valign="top">
                                                                            <asp:Label ID="serialno" runat="server"
                                                                                Text="Serial No.">{{resourcesData.serialno}}</asp:Label>
                                                                        </td>
                                                                        <td align="left" style="" valign="top" width="7px">:
                                                                        </td>
                                                                        <td align="justify" valign="top">
                                                                            <asp:Label ID="lblOutwardNo" runat="server" Font-Bold="true">000085263</asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left" nowrap="nowrap" style="width: 37px;" valign="top">
                                                                            <asp:Label ID="name" runat="server"
                                                                                Text="Name">{{resourcesData.name}}</asp:Label>
                                                                        </td>
                                                                        <td align="left" style="" valign="top" width="7px">:
                                                                        </td>
                                                                        <td align="justify" valign="top">
                                                                            <asp:Label ID="lblSal" runat="server">Mr.</asp:Label>
                                                                            <asp:Label ID="lblName" runat="server">Niraj Gupta</asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left" nowrap="nowrap" style="width: 37px; white-space: nowrap;" valign="top">
                                                                            <asp:Label ID="DOB" runat="server"
                                                                                Text="DOB">{{resourcesData.DOB}}</asp:Label>
                                                                        </td>
                                                                        <td align="left" style="" valign="top" width="7px">:
                                                                        </td>
                                                                        <td align="justify" valign="top">
                                                                            <asp:Label ID="lblDOB" runat="server">01-20-1950</asp:Label>
                                                                            |
                                                    <asp:Label ID="Label45" runat="server"
                                                        Text="Age  :  "></asp:Label>
                                                                            <asp:Label ID="age1" runat="server">66 </asp:Label>
                                                                            <asp:Label ID="years" runat="server"
                                                                                Text=" Yrs">{{resourcesData.years}}</asp:Label>
                                                                        </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td align="left" nowrap="nowrap" valign="top">
                                                                            <asp:Label ID="address" runat="server"
                                                                                Text="Address ">{{resourcesData.address}}</asp:Label>
                                                                        </td>
                                                                        <td align="left" style="" valign="top" width="7px">:
                                                                        </td>
                                                                        <td align="justify" style="max-height: 80px; overflow: hidden !important; display: block;"
                                                                            valign="top">
                                                                            <asp:Label ID="AddressApplicant" runat="server"
                                                                                Text="101, 1st Floor, Nagar Nigaam Bhawan, M G Road."></asp:Label>
                                                                            <asp:Label ID="AVill" runat="server">Sahadra</asp:Label>
                                                                            &nbsp;<asp:Label ID="taluka" runat="server"
                                                                                Text="Taluka">{{resourcesData.taluka}}</asp:Label>
                                                                            <asp:Label ID="ATeh" runat="server">West Delhi</asp:Label>
                                                                            &nbsp;<asp:Label ID="district" runat="server"
                                                                                Text="District">{{resourcesData.district}}</asp:Label>
                                                                            <asp:Label ID="ADist" runat="server">Delhi - 110011</asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div style="float: left; width: 45%; text-align: center">
                                                                <asp:Label ID="tehsil" runat="server" Font-Bold="True"
                                                                    Text="Tahasildar">{{resourcesData.tehsil}}</asp:Label>
                                                            </div>
                                                            <div style="float: right; width: 45%; text-align: center">
                                                                <asp:Label ID="Label1" runat="server" Font-Bold="True"
                                                                    Text="Niraj Gupta"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>



                                            </div>
                                        </div>

                                        <div id="div1" runat="server" style="border: 3px solid #000000; margin: 5px auto; padding: 1px; width: 321px; font-family: Arial; height: 210px;">
                                            <div style="margin: 0 auto; background-image: url(../Images/Untitled.png); background-repeat: no-repeat; background-position: center; border: 1px solid #000; height: 202px; width: 313px; max-height: 202px; font-family: Arial;">
                                                <table style="margin: 0 auto; width: 313px;">
                                                    <tr>
                                                        <td height="44px">
                                                            <div id="Div1" class="Renderbarcode" style="text-align: center; position: relative; top: 2px; right: 0px;">
                                                                <img src="../Images/logo_orissa.gif" style="float: left; height: 45px;" />
                                                                <img src="../Images/QRCode.png" style="float: right; height: 45px; margin-right: 3px;" />
                                                                <asp:Label ID="govtorissa" runat="server" Font-Bold="True"
                                                                    Style="display: block; white-space: nowrap;"
                                                                    Text="GOVERNMENT OF ODISA">{{resourcesData.govtorissa}}</asp:Label><br />
                                                                <asp:Label ID="srcitcert" runat="server" Font-Bold="True"
                                                                    Style="display: block; white-space: nowrap;"
                                                                    Text="SENIOR CITIZEN CERTIFICATE">{{resourcesData.tehsil}}</asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                            <table style="margin: -3px auto; width: 300px;" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td align="center" valign="top" colspan="2" style="line-height: 15px">
                                                                        <asp:Label ID="information" runat="server" Font-Bold="True"
                                                                            Font-Size="10px" Font-Underline="True" Text="INFORMATION">{{resourcesData.information}}</asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" valign="top" style="line-height: 13px;" width="10px">
                                                                        <asp:Label ID="lbl1" runat="server" Font-Size="10px"
                                                                            Text="1. ">{{resourcesData.lbl1}}</asp:Label>
                                                                    </td>
                                                                    <td align="justify" valign="top" style="line-height: 13px;">
                                                                        <asp:Label ID="lbl1txt" runat="server" Font-Size="10px"
                                                                            Text="Please keep and use the card">{{resourcesData.lbl1txt}}</asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" valign="top" style="line-height: 13px;" width="10px">
                                                                        <asp:Label ID="lbl2" runat="server" Font-Size="10px"
                                                                            Text="2. ">{{resourcesData.lbl2}}</asp:Label>
                                                                    </td>
                                                                    <td align="justify" valign="top" style="line-height: 13px;">
                                                                        <asp:Label ID="lbl2txt" runat="server" Font-Size="10px"
                                                                            Text=" If the card is misused, the legal action will be taken">{{resourcesData.lbl2txt}}</asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" valign="top" class="style1" style="line-height: 13px;" width="10px">
                                                                        <asp:Label ID="lbl3" runat="server" Font-Size="10px"
                                                                            Text="3. ">{{resourcesData.lbl3}}</asp:Label>
                                                                    </td>
                                                                    <td align="justify" valign="top" style="line-height: 13px;">
                                                                        <asp:Label ID="lbl3txt" runat="server" Font-Size="10px"
                                                                            Text="If the card is lost, immediately inform the relevant office">{{resourcesData.lbl3txt}}</asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" valign="top" class="style1" style="line-height: 13px;" width="10px">
                                                                        <asp:Label ID="lbl4" runat="server" Font-Size="10px"
                                                                            Text="4. ">{{resourcesData.lbl4}}</asp:Label>
                                                                    </td>
                                                                    <td align="justify" valign="top" style="line-height: 13px;">
                                                                        <asp:Label ID="appage" runat="server" Font-Size="10px"
                                                                            Text="Applicant Age"></asp:Label>
                                                                        &nbsp;<asp:Label ID="lblCurrentDate" runat="server" Font-Size="10px"></asp:Label>
                                                                        &nbsp;<asp:Label ID="on" runat="server" Font-Size="10px"
                                                                            Text="on">{{resourcesData.on}}</asp:Label>
                                                                        <asp:Label ID="lblAge" runat="server" Font-Size="10px"></asp:Label>
                                                                        &nbsp;<asp:Label ID="year" runat="server" Font-Size="10px"
                                                                            Text="years">{{resourcesData.years}}</asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" valign="middle" style="line-height: 11px">
                                                            <asp:Label ID="emgperson" runat="server" Font-Bold="True"
                                                                Font-Size="10px" Text="Emergency contact person details">{{resourcesData.emgperson}}</asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table style="margin: 0 auto; line-height: 13px; width: 300px;" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td align="left" valign="bottom" width="10px" style="line-height: 9px;">
                                                                        <asp:Label ID="Label17" runat="server" Font-Size="12px"
                                                                            Text="*"></asp:Label>
                                                                    </td>
                                                                    <td align="justify" style="width: 75px" valign="top">
                                                                        <asp:Label ID="Label235" runat="server" Font-Size="10px"
                                                                            Text="" Width="75px">{{resourcesData.name}}</asp:Label>
                                                                    </td>
                                                                    <td align="left" style="width: 7px" valign="top">:
                                                                    </td>
                                                                    <td align="justify" valign="top">
                                                                        <asp:Label ID="ContactPersonname" runat="server" Font-Size="10px">Gunwan Saini</asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" valign="bottom" width="10px" style="line-height: 9px;">
                                                                        <asp:Label ID="Label18" runat="server" Font-Size="12px"
                                                                            Text="*"></asp:Label>
                                                                    </td>
                                                                    <td align="justify" style="width: 75px" valign="top">
                                                                        <asp:Label ID="mobileno" runat="server" Font-Size="10px"
                                                                            Text="Mobile No." Width="75px">{{resourcesData.mobileno}}</asp:Label>
                                                                    </td>
                                                                    <td align="left" style="width: 7px" valign="top">:
                                                                    </td>
                                                                    <td align="justify" valign="top">
                                                                        <asp:Label ID="Mob" runat="server" Font-Size="10px">9909909901</asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="justify" style="border-top: 1px dashed #000;">
                                                            <div style="width: 300px; margin: 3px auto; line-height: 9px; font-size: 8px;">
                                                                <asp:Label ID="lblfooter" runat="server" Font-Size="10px"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <%--<asp:Panel ID="Panel3" runat="server" Width="345px" Style="display: block; margin: 0 auto;"
                                        CssClass="prntRecept" Font-Size="12px" Font-Names="arial">
                                        <div id="divDemo" runat="server" style="border: 3px solid #000000; margin: 5px auto; padding: 1px; width: 321px; height: 210px;">
                                            <div style="margin: 0 auto; background-image: url(../Images/Untitled.png); background-repeat: no-repeat; background-position: center; border: 1px solid #000; height: 202px; width: 313px; max-height: 202px;">
                                                <table style="width: 100%; height: 100%;">
                                                    <tr>
                                                        <td>
                                                            <div style="text-align: center; border-bottom: 1px solid #808080; margin-bottom: 2px; padding: 2px 0;">
                                                                <div style="float: left;">
                                                                    <asp:Image ID="Image1" runat="server" ImageUrl="../Images/logo.png" Style="width: 50px; margin-top: -5px;" />
                                                                </div>

                                                                <div style="float: right">
                                                                    <asp:Image ID="Image2" runat="server" ImageUrl="../Images/logo_orissa.gif" Style="width: 20px; margin-top: -5px;" />
                                                                </div>
                                                                <div style="width: 115px; margin: 0 auto;">
                                                                    <asp:Label ID="Label233" runat="server" Font-Bold="True"
                                                                        Style="display: block; white-space: nowrap;"
                                                                        Text="SENIOR CITIZEN"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr style="vertical-align: top;">
                                                        <td>
                                                            <div style="margin: 5px; float: left; text-align: center; width: 80px;">
                                                                <div>
                                                                    <asp:Image ID="Image4" runat="server" BorderColor="#333333" BorderStyle="Solid" BorderWidth="1px"
                                                                        Height="80px" ImageUrl="../Images/photo.png" Style="width: 75px" />
                                                                </div>
                                                                <div style="margin-top: 5px; text-align: left; font-size: 10px;">
                                                                    <asp:Label ID="Label11" runat="server"
                                                                        Text="Blood Group:"></asp:Label>
                                                                    <asp:Label ID="lblBloodGrp" runat="server" Text="B+"></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div style="margin: 5px 5px 5px 0px; float: right; width: 205px; height: 115px;">
                                                                <table cellpadding="0" cellspacing="0" style="margin: 0 3px 0 3px; width: 200px">
                                                                    <tr>
                                                                        <td align="left" nowrap="nowrap" style="width: 37px;" valign="top">
                                                                            <asp:Label ID="Label13" runat="server"
                                                                                Text="Serial No."></asp:Label>
                                                                        </td>
                                                                        <td align="left" style="" valign="top" width="7px">:
                                                                        </td>
                                                                        <td align="justify" valign="top">
                                                                            <asp:Label ID="lblOutwardNo" runat="server" Font-Bold="true">000085263</asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left" nowrap="nowrap" style="width: 37px;" valign="top">
                                                                            <asp:Label ID="Label22" runat="server"
                                                                                Text="Name"></asp:Label>
                                                                        </td>
                                                                        <td align="left" style="" valign="top" width="7px">:
                                                                        </td>
                                                                        <td align="justify" valign="top">
                                                                            <asp:Label ID="lblSal" runat="server">Mr.</asp:Label>
                                                                            <asp:Label ID="lblName" runat="server">Niraj Gupta</asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left" nowrap="nowrap" style="width: 37px; white-space: nowrap;" valign="top">
                                                                            <asp:Label ID="Label14" runat="server"
                                                                                Text="DOB"></asp:Label>
                                                                        </td>
                                                                        <td align="left" style="" valign="top" width="7px">:
                                                                        </td>
                                                                        <td align="justify" valign="top">
                                                                            <asp:Label ID="lblDOB" runat="server">01-20-1950</asp:Label>
                                                                            |
                                                    <asp:Label ID="Label45" runat="server"
                                                        Text="Age  :  "></asp:Label>
                                                                            <asp:Label ID="age1" runat="server">66 </asp:Label>
                                                                            <asp:Label ID="Label5" runat="server"
                                                                                Text=" Yrs"></asp:Label>
                                                                        </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td align="left" nowrap="nowrap" valign="top">
                                                                            <asp:Label ID="Label4" runat="server"
                                                                                Text="Address "></asp:Label>
                                                                        </td>
                                                                        <td align="left" style="" valign="top" width="7px">:
                                                                        </td>
                                                                        <td align="justify" style="max-height: 80px; overflow: hidden !important; display: block;"
                                                                            valign="top">
                                                                            <asp:Label ID="AddressApplicant" runat="server"
                                                                                Text="101, 1st Floor, Nagar Nigaam Bhawan, M G Road."></asp:Label>
                                                                            <asp:Label ID="AVill" runat="server">Sahadra</asp:Label>
                                                                            &nbsp;<asp:Label ID="Label2" runat="server"
                                                                                Text="Taluka"></asp:Label>
                                                                            <asp:Label ID="ATeh" runat="server">West Delhi</asp:Label>
                                                                            &nbsp;<asp:Label ID="Label3" runat="server"
                                                                                Text="District"></asp:Label>
                                                                            <asp:Label ID="ADist" runat="server">Delhi - 110011</asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div style="float: left; width: 45%; text-align: center">
                                                                <asp:Label ID="tehsil" runat="server" Font-Bold="True"
                                                                    Text="Tahasildar"></asp:Label>
                                                            </div>
                                                            <div style="float: right; width: 45%; text-align: center">
                                                                <asp:Label ID="Label1" runat="server" Font-Bold="True"
                                                                    Text="Niraj Gupta"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>



                                            </div>
                                        </div>

                                        <div id="div1" runat="server" style="border: 3px solid #000000; margin: 5px auto; padding: 1px; width: 321px; font-family: Arial; height: 210px;">
                                            <div style="margin: 0 auto; background-image: url(../Images/Untitled.png); background-repeat: no-repeat; background-position: center; border: 1px solid #000; height: 202px; width: 313px; max-height: 202px; font-family: Arial;">
                                                <table style="margin: 0 auto; width: 313px;">
                                                    <tr>
                                                        <td height="44px">
                                                            <div id="Div1" class="Renderbarcode" style="text-align: center; position: relative; top: 2px; right: 0px;">
                                                                <img src="../Images/logo_orissa.gif" style="float: left; height: 45px;" />
                                                                <img src="../Images/QRCode.png" style="float: right; height: 45px; margin-right: 3px;" />
                                                                <asp:Label ID="Label7" runat="server" Font-Bold="True"
                                                                    Style="display: block; white-space: nowrap;"
                                                                    Text="GOVERNMENT OF ODISA<br/>
                                                SENIOR CITIZEN CERTIFICATE"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                            <table style="margin: -3px auto; width: 300px;" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td align="center" valign="top" colspan="2" style="line-height: 15px">
                                                                        <asp:Label ID="Label240" runat="server" Font-Bold="True"
                                                                            Font-Size="10px" Font-Underline="True" Text="INFORMATION"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" valign="top" style="line-height: 13px;" width="10px">
                                                                        <asp:Label ID="Label6" runat="server" Font-Size="10px"
                                                                            Text="1. "></asp:Label>
                                                                    </td>
                                                                    <td align="justify" valign="top" style="line-height: 13px;">
                                                                        <asp:Label ID="Label8" runat="server" Font-Size="10px"
                                                                            Text="Please keep and use the card"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" valign="top" style="line-height: 13px;" width="10px">
                                                                        <asp:Label ID="Label28" runat="server" Font-Size="10px"
                                                                            Text="2. "></asp:Label>
                                                                    </td>
                                                                    <td align="justify" valign="top" style="line-height: 13px;">
                                                                        <asp:Label ID="Label9" runat="server" Font-Size="10px"
                                                                            Text=" If the card is misused, the legal action will be taken"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" valign="top" class="style1" style="line-height: 13px;" width="10px">
                                                                        <asp:Label ID="Label24" runat="server" Font-Size="10px"
                                                                            Text="3. "></asp:Label>
                                                                    </td>
                                                                    <td align="justify" valign="top" style="line-height: 13px;">
                                                                        <asp:Label ID="Label10" runat="server" Font-Size="10px"
                                                                            Text="If the card is lost, immediately inform the relevant office"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" valign="top" class="style1" style="line-height: 13px;" width="10px">
                                                                        <asp:Label ID="Label12" runat="server" Font-Size="10px"
                                                                            Text="4. "></asp:Label>
                                                                    </td>
                                                                    <td align="justify" valign="top" style="line-height: 13px;">
                                                                        <asp:Label ID="Label15" runat="server" Font-Size="10px"
                                                                            Text="Applicant Age"></asp:Label>
                                                                        &nbsp;<asp:Label ID="lblCurrentDate" runat="server" Font-Size="10px"></asp:Label>
                                                                        &nbsp;<asp:Label ID="Label16" runat="server" Font-Size="10px"
                                                                            Text="on"></asp:Label>
                                                                        <asp:Label ID="lblAge" runat="server" Font-Size="10px"></asp:Label>
                                                                        &nbsp;<asp:Label ID="Label19" runat="server" Font-Size="10px"
                                                                            Text="years"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" valign="middle" style="line-height: 11px">
                                                            <asp:Label ID="ContactPersonname0" runat="server" Font-Bold="True"
                                                                Font-Size="10px" Text="Emergency contact person details"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table style="margin: 0 auto; line-height: 13px; width: 300px;" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td align="left" valign="bottom" width="10px" style="line-height: 9px;">
                                                                        <asp:Label ID="Label17" runat="server" Font-Size="12px"
                                                                            Text="*"></asp:Label>
                                                                    </td>
                                                                    <td align="justify" style="width: 75px" valign="top">
                                                                        <asp:Label ID="Label235" runat="server" Font-Size="10px"
                                                                            Text="Name" Width="75px"></asp:Label>
                                                                    </td>
                                                                    <td align="left" style="width: 7px" valign="top">:
                                                                    </td>
                                                                    <td align="justify" valign="top">
                                                                        <asp:Label ID="ContactPersonname" runat="server" Font-Size="10px">Gunwan Saini</asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" valign="bottom" width="10px" style="line-height: 9px;">
                                                                        <asp:Label ID="Label18" runat="server" Font-Size="12px"
                                                                            Text="*"></asp:Label>
                                                                    </td>
                                                                    <td align="justify" style="width: 75px" valign="top">
                                                                        <asp:Label ID="Label236" runat="server" Font-Size="10px"
                                                                            Text="Mobile No." Width="75px"></asp:Label>
                                                                    </td>
                                                                    <td align="left" style="width: 7px" valign="top">:
                                                                    </td>
                                                                    <td align="justify" valign="top">
                                                                        <asp:Label ID="Mob" runat="server" Font-Size="10px">9909909901</asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="justify" style="border-top: 1px dashed #000;">
                                                            <div style="width: 300px; margin: 3px auto; line-height: 9px; font-size: 8px;">
                                                                <asp:Label ID="lblfooter" runat="server" Font-Size="10px"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </asp:Panel>--%>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>
                <%----END of Application Details-----%>

                <%---Start of Button----%>
                <%--                <div class="row">
                    <div class="col-md-12 box-container" id="divBtn">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <asp:Button ID="btnExportExcel" runat="server" CausesValidation="False" CssClass="btn btn-primary"
                                Text="Save as PDF" />
                            <asp:Button ID="btnSubmit" runat="server" CausesValidation="False" CssClass="btn btn-success"
                                OnClientClick="javascript:return Search();" Text="Print" />
                            <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel"
                                CssClass="btn btn-danger" PostBackUrl=""
                                Text="Cancel" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>--%>
                <%----END of Button-----%>
            </div>
        </div>
    </form>
</body>
</html>
