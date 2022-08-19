<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="GeneralAffidavitCertificate.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.GeneralAffidavitCertificate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
        <uc1:infomation runat="server" ID="Infomation" />

        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">GENERAL AFFIDAVIT CERTIFICATE
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <asp:Panel ID="Panel3" runat="server" Width="710px" Style="display: block; margin: 0 auto;"
                        CssClass="prntRecept" Font-Names="Sakal Marathi" Font-Size="13px">
                        <asp:Panel ID="Panel1" runat="server" Width="710px" Style="margin: 0 auto;" Font-Names="Sakal Marathi"
                            Font-Size="13px">
                            <div style="display: block; margin: 5px auto; padding: 1px; width: 700px;">
                                <table style="margin: 0 auto; font-family: Sakal Marathi; font-size: 13px;" width="698px">
                                    <tr>
                                        <td width="20px">&nbsp;
                                        </td>
                                        <td width="658px">&nbsp;
                                        </td>
                                        <td width="20px">&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="20px">&nbsp;
                                        </td>
                                        <td width="658px">
                                            <table style="margin: 0 auto" width="100%">
                                                <tr>
                                                    <td style="text-align: left; padding: 5px">
                                                        <div style="float: left;">
                                                            <img src="../PICS/MahaShasanlogo.png" alt="Maharashtra Shasan Logo" width="110px" />
                                                        </div>
                                                    </td>
                                                    <td>

                                                        <div id="Div1" class="Renderbarcode">
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td align="right" width="200px"></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="20px">&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="20px">&nbsp;
                                        </td>
                                        <td width="658px">&nbsp;
                                        </td>
                                        <td width="20px">&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="20px">&nbsp;
                                        </td>
                                        <td width="658px" align="center">
                                            <asp:Label ID="Label6" runat="server" Font-Bold="true" Font-Names="arial" Font-Size="13px"
                                                Text="IN THE PRESENCE OF HON'BLE EXECUTIVE MAGISTRATE COURT,"></asp:Label>
                                        </td>
                                        <td width="20px">&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="20px">&nbsp;
                                        </td>
                                        <td align="center" width="658px">
                                            <asp:Label ID="Tehsil" runat="server" Font-Bold="true" Font-Names="arial" Font-Size="13px"></asp:Label>
                                        </td>
                                        <td width="20px">&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="20px">&nbsp;
                                        </td>
                                        <td align="right" width="658px"></td>
                                        <td width="20px">&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="20px">&nbsp;
                                        </td>
                                        <td align="right" width="658px">&nbsp;
                                        </td>
                                        <td width="20px">&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="20px">&nbsp;
                                        </td>
                                        <td align="center" width="658px">
                                            <asp:Label ID="Affiname" runat="server" Font-Bold="true" Font-Names="arial" Font-Size="13px"
                                                Font-Underline="true"></asp:Label>
                                        </td>
                                        <td width="20px">&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="20px">&nbsp;
                                        </td>
                                        <td align="center" width="658px">
                                            <table style="margin: 5px auto; width: 100%">
                                                <tr>
                                                    <td align="left" width="110px">
                                                        <asp:Label ID="lblname" runat="server" Font-Bold="true" Font-Names="Arial" Font-Size="13px"
                                                            Text="Applicant Name"></asp:Label>
                                                    </td>
                                                    <td align="center" width="20px">:
                                                    </td>
                                                    <td align="left" colspan="3">
                                                        <asp:Label ID="Appname" runat="server" Font-Names="Arial" Font-Size="13px"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" width="100px">
                                                        <asp:Label ID="lblage" runat="server" Font-Bold="True" Font-Names="arial" Font-Size="13px"
                                                            Text="Age"></asp:Label>
                                                    </td>
                                                    <td align="center" width="20px">:
                                                    </td>
                                                    <td align="left" style="height: 5px;" width="135px">
                                                        <asp:Label ID="Age" runat="server" Font-Names="Arial" Font-Size="13px"></asp:Label>
                                                    </td>
                                                    <td width="50px"></td>
                                                    <td align="left" width="100px"></td>
                                                    <td align="center" width="20px"></td>
                                                    <td align="left" width="135px"></td>
                                                </tr>
                                                <tr>
                                                    <td align="left" width="100px">
                                                        <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="13px"
                                                            Text="Occupation"></asp:Label>
                                                    </td>
                                                    <td align="center" width="20px">:
                                                    </td>
                                                    <td align="left" width="135px">
                                                        <asp:Label ID="Occ" runat="server" Font-Names="Arial" Font-Size="13px"></asp:Label>
                                                    </td>
                                                    <td width="50px"></td>
                                                    <td align="left" width="100px">&nbsp;
                                                    </td>
                                                    <td align="center" width="20px">&nbsp;
                                                    </td>
                                                    <td align="left" width="135px">&nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" valign="top" width="100px">
                                                        <asp:Label ID="Label19" runat="server" Font-Bold="true" Font-Names="arial" Font-Size="13px"
                                                            Text="Address"></asp:Label>
                                                    </td>
                                                    <td align="center" valign="top" width="20px">:
                                                    </td>
                                                    <td align="left" colspan="5" valign="top">
                                                        <asp:Label ID="AddressApplicant" runat="server" Font-Bold="False" Font-Names="Arial"
                                                            Font-Size="13px"></asp:Label>
                                                        <asp:Label ID="Label232" runat="server" Text=","></asp:Label>
                                                        <asp:Label ID="AVill" runat="server" Font-Names="arial" Font-Size="13px"></asp:Label>
                                                        <asp:Label ID="Label32" runat="server" Text=","></asp:Label>
                                                        <asp:Label ID="ATeh" runat="server" Font-Names="arial" Font-Size="13px"></asp:Label>
                                                        <asp:Label ID="Label36" runat="server" Text=","></asp:Label>
                                                        <asp:Label ID="ADist" runat="server" Font-Names="arial" Font-Size="13px"></asp:Label>
                                                        <asp:Label ID="Label28" runat="server" Text=","></asp:Label>
                                                        <asp:Label ID="APin1" runat="server" Font-Names="arial" Font-Size="13px"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="20px">&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="20px">&nbsp;
                                        </td>
                                        <td align="center" width="658px">&nbsp;
                                        </td>
                                        <td width="20px">&nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:Panel>
                       
                        <asp:Panel ID="Panel2" runat="server" Width="710px" Style="display: block; margin: 0 auto;"
                            CssClass="prntRecept" Font-Names="Sakal Marathi" Font-Size="13px">
                            <table style="margin: 0 auto; font-family: Sakal Marathi; font-size: 13px;" width="698px">
                                <tr>
                                    <td width="20px">&nbsp;
                                    </td>
                                    <td align="center" width="658px">
                                        <table style="margin-top: 5px; float: left; font-family: Sakal Marathi; font-size: 12px;">
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="Label131" runat="server" Font-Bold="true" Font-Names="arial" Font-Size="13px"
                                                        Font-Underline="true" Text="Reason For Affidavit :"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="Resons" runat="server" Font-Names="arial" Font-Size="13px" textmode="multiline"
                                                        Width="600px" wrap="true"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="20px">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20px">&nbsp;
                                    </td>
                                    <td align="left" width="658px">
                                        <asp:Label ID="Label1" runat="server" Font-Names="Arial" Font-Size="13px" Text="The information stated above is true and correct to the best of my knowledge.Hence this Affidavit is made."></asp:Label>
                                    </td>
                                    <td width="20px">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20px">&nbsp;
                                    </td>
                                    <td align="center" width="658px">
                                        <table style="margin: 5px auto; width: 100%">
                                            <tr>
                                                <td align="center" colspan="7">&nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" width="110px">
                                                    <asp:Label ID="Label16" runat="server" Font-Bold="true" Font-Names="arial" Font-Size="13px"
                                                        Text="Place"></asp:Label>
                                                </td>
                                                <td align="center" width="20px">:
                                                </td>
                                                <td align="left" colspan="3">
                                                    <asp:Label ID="Place" runat="server" Font-Names="arial" Font-Size="13px" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" width="100px">
                                                    <asp:Label ID="Label4" runat="server" Font-Bold="true" Font-Names="arial" Font-Size="13px"
                                                        Text="Date "></asp:Label>
                                                </td>
                                                <td align="center" width="20px">:
                                                </td>
                                                <td align="left" style="height: 5px;" width="135px">
                                                    <asp:Label ID="Adate" runat="server" Font-Names="arial" Font-Size="13px" Text=""></asp:Label>
                                                </td>
                                                <td width="50px"></td>
                                                <td align="left" width="100px"></td>
                                                <td align="center" width="20px"></td>
                                                <td align="left" width="135px"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="20px">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20px">&nbsp;
                                    </td>
                                    <td align="center" width="658px">&nbsp;
                                    </td>
                                    <td width="20px">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20px">&nbsp;
                                    </td>
                                    <td align="center" width="658px">&nbsp;
                                    </td>
                                    <td width="20px">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20px">&nbsp;
                                    </td>
                                    <td align="right" width="658px">
                                        <asp:Label ID="Label5" runat="server" Font-Names="arial" Font-Size="13px" Text="Signature of Affidavit Holder" />
                                    </td>
                                    <td width="20px">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20px">&nbsp;
                                    </td>
                                    <td align="center" width="658px">
                                        <asp:Label ID="Label33" runat="server" Font-Bold="true" Font-Names="arial" Font-Size="13px"
                                            Text="Declaration"></asp:Label>
                                    </td>
                                    <td width="20px">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20px">&nbsp;
                                    </td>
                                    <td align="center" width="658px">&nbsp;
                                    </td>
                                    <td width="20px">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20px">&nbsp;
                                    </td>
                                    <td align="left" width="658px">
                                        <asp:Label ID="Label34" runat="server" Font-Names="arial" Font-Size="13px" Text="I"></asp:Label>
                                        <asp:Label ID="Salutation" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="13px"></asp:Label>
                                        <asp:Label ID="AppName1" runat="server" Font-Bold="true" Font-Names="arial" Font-Size="13px"></asp:Label>
                                        <asp:Label ID="Label17" runat="server" Font-Names="arial" Font-Size="13px" Text=" solemnly affirm that the details furnished in the above Affidavit is true and correct to the best of my knowledge and if anything contray to the above is found, I will be liable for punishment/penalty under Section193(2),199 &amp; 200 of the Indian Penal Code. "></asp:Label>
                                    </td>
                                    <td width="20px">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20px">&nbsp;
                                    </td>
                                    <td align="center" width="658px">
                                        <table style="margin: 5px auto; width: 100%">
                                            <tr>
                                                <td align="center" colspan="7">&nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" width="110px">
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="true" Font-Names="arial" Font-Size="13px"
                                                        Text="Place"></asp:Label>
                                                </td>
                                                <td align="center" width="20px">:
                                                </td>
                                                <td align="left" colspan="3">
                                                    <asp:Label ID="Tehsil1" runat="server" Font-Names="arial" Font-Size="13px" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" width="100px">
                                                    <asp:Label ID="Label3" runat="server" Font-Bold="true" Font-Names="arial" Font-Size="13px"
                                                        Text="Date"></asp:Label>
                                                </td>
                                                <td align="center" width="20px">:
                                                </td>
                                                <td align="left" style="height: 5px;" width="135px">
                                                    <asp:Label ID="ADate1" runat="server" Font-Names="arial" Font-Size="13px" Text=""></asp:Label>
                                                </td>
                                                <td width="50px"></td>
                                                <td align="left" width="100px"></td>
                                                <td align="center" width="20px"></td>
                                                <td align="left" width="135px"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="20px">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20px">&nbsp;
                                    </td>
                                    <td align="center" width="658px">&nbsp;
                                    </td>
                                    <td width="20px">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20px">&nbsp;
                                    </td>
                                    <td align="center" width="658px">&nbsp;
                                    </td>
                                    <td width="20px">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20px">&nbsp;
                                    </td>
                                    <td align="right" width="658px">
                                        <asp:Label ID="Label9" runat="server" Font-Names="arial" Font-Size="13px" Text="Signature of Affidavit Holder" />
                                    </td>
                                    <td width="20px">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20px">&nbsp;
                                    </td>
                                    <td align="right" width="658px">&nbsp;
                                    </td>
                                    <td width="20px">&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:Panel>
                </div>
            </div>

            <%---Start of Button----%>
            <div class="row">
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
            </div>
            <%----END of Button-----%>
        </div>
    </div>
</asp:Content>
