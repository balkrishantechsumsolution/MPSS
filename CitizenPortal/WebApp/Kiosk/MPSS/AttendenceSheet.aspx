<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttendenceSheet.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.AttendenceSheet" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>उपस्थिति पत्रक</title>

    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
    <%--<script src="../../Scripts/CommonScript.js"></script>--%>
    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />

    <style>
        .hdbg {
            background-color: #383E4B;
            color: #fff;
        }

        .sub_hdbg {
            background-color: #F8F8F8;
            color: #383E4B;
            font-weight: bold;
        }

        .t_trans {
            text-transform: capitalize;
        }

        .auto-style1 {
            color: #383E4B;
        }

        td {
            text-align: center;
            padding: 10px;
        }

        th {
            text-align: center;
            padding: 10px;
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {

        });
        function CallPrint(strid) {
            var prtContent = document.getElementById(strid);
            var WinPrint = window.open('', '', 'letf=0,top=0,width=860,height=2010,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }

        function CreateDialog(src, FileName) {
            var dialog = '<div  title="' + FileName + '" style="overflow:hidden;">';
            dialog += '<iframe  src="' + src + '" height="100%" width="100%"></iframe>';
            dialog += '</div>';
            console.log(dialog);
            $(dialog).dialog({ width: '890', height: '600' });

        }

        var baseUrl = "<%= Page.ResolveUrl("~/") %>";

        function ResolveUrl(url) {
            if (url.indexOf("~/") == 0) {
                url = baseUrl + url.substring(2);
            }
            return url;
        }

        function ViewDoc(m_ServiceID, m_AppID, m_Path) {
            var t_URL = "";
            t_URL = m_Path;//+ "&SvcID=" + m_ServiceID + "&AppID=" + m_AppID;
            t_URL = ResolveUrl(t_URL);
            window.open(t_URL, "");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="box-body box-body-open">
            <div id="divPrint" style="margin: 0 auto; width: 100%;">
                <div style="width: 850px; margin: 0 auto; height: auto; border: 3px solid #000; padding: 1px; font-family: Arial">

                    <%----------End title section ---------%><%---------Start Applicant Section --------%>
                    <div style="margin: 10px 0; width: 100%; height: auto; font-size: 13px;">


                        <%--Programme Table--%>
                        <%--Applicant Table--%>

                        <page size="A4">
                            <div id="divENT" runat="server" class="table-responsive">
                                <asp:DataList ID="ItemsList"
                                    BorderColor="black"
                                    CellPadding="5"
                                    CellSpacing="5"
                                    RepeatDirection="Vertical"
                                    RepeatLayout="Table"
                                    OnItemDataBound="ItemsList_ItemDataBound"
                                    runat="server">
                                    <HeaderTemplate>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Panel ID="pnlHeader" runat="server" Visible="false">
                                            <div style="width: 820px; margin: 0 auto; height: auto; border: 3px solid #000; padding: 1px; font-family: Arial">
                                                <div style="width: 100%; margin: 0 auto; height: auto; border: 1px solid #000; background-image: url(''); background-image: url(''); background-size: 590px; background-repeat: no-repeat; background-position: center center;">

                                                    <table cellpadding="5" cellspacing="0" style="width: 100%; margin: 0 auto; text-align: center">
                                                        <tr>
                                                            <td>
                                                                <div style="width: 165px; margin: 5px 0 0 5px; float: left; height: 115px;">
                                                                    <img alt="Logo" src="../Images/MPGOVLOGO.png" style="width: 85px; margin: 16px 0px 0px 33px;" />
                                                                </div>
                                                            </td>
                                                            <td style="vertical-align: middle">
                                                                <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 20px; font-weight: bolder; text-transform: uppercase; text-align: center">
                                      लोक शिक्षण संचालनालय मध्य प्रदेश परीक्षा <br />आयोजक<br />
                                        मध्य प्रदेश राज्य मुक्त स्कूल शिक्षा बोर्ड
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <div style="width: 165px; float: right; margin: 5px 0 0 5px">

                                                                    <img alt="Logo" src="../Images/MPSOSLogo.jpg" style="width: 85px; margin: 16px 0px 0px 33px;" />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                            <%----------End Header section ---------%><%---------Start Title section --------%>
                                            <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; background-color: #808080; color: #fff;">
                                                <span style="font-size: 20px">उपस्थिति पत्रक</span>
                                            </div>
                                            <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                                                <tbody>
                                                    <tr>
                                                        <td colspan="5" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>केंद्र  का विवरण</b></td>
                                                    </tr>
                                                </tbody>
                                                <tbody>
                                                    <tr>
                                                        <td>परीक्षा केंद्र
                                         
                                                        </td>
                                                        <td>

                                                            <asp:Label ID="txtCentreName" runat="server" Text='<%#Eval("EXAMCENTERNAME") %>' Font-Bold="true" />



                                                        </td>
                                                        <td>परीक्षा केंद्र कोड
                                         
                                                        </td>
                                                        <td>


                                                            <asp:Label ID="TXTCentre_Code" runat="server" Text='<%#Eval("CENTER_CODE") %>' Font-Bold="true" />

                                                        </td>





                                                    </tr>
                                                    <tr>

                                                        <td>परीक्षा का नाम
                                         
                                                        </td>
                                                        <td style="text-align: center;">


                                                            <asp:Label ID="LBLEXAMNAME" runat="server" Text='<%#Eval("EXAMNAME") %>' Font-Bold="true" />

                                                        </td>

                                                        <td>आवेदित कक्षा
                                         
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="LBLCLASS" runat="server" Text='<%#Eval("CLASS") %>' Font-Bold="true" />
                                                        </td>



                                                    </tr>
                                                </tbody>

                                            </table>

                                        </asp:Panel>

                                        <table>
                                            <tr id="trHeader" runat="server">
                                                <th>क्र.सं
                                                </th>
                                                <th>परीक्षार्थी का नाम व फोटो
                                                </th>
                                                <th>रोलनंबर
                                                </th>


                                                <th>प्रश्न पुस्तिका क्रमाक
                                                </th>
                                                <th>ओ.एम.आर. शीट नंबर
                                                </th>
                                                <th>परीक्षार्थी के हस्ताक्षर
                                                </th>
                                                <th>पर्यवेक्षक हस्ताक्षर
                                                </th>

                                            </tr>
                                            <tr style="border: 1px solid black; border-collapse: collapse;" id="tdRow" runat="server">
                                                <td style="border: 1px solid black; border-collapse: collapse;">
                                                    <b>
                                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("SNO") %>' Font-Bold="true" />
                                                    </b>
                                                </td>
                                                <td style="border: 1px solid black; border-collapse: collapse;">
                                                    <img runat="server" src='<%# Eval("IMG") %>' style="margin: 1px; width: 45px; height: 55px" id="ProfilePhoto" />
                                                    <br />
                                                    <b>
                                                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("STUDENTNAME") %>' Font-Bold="true" /></b>
                                                </td>
                                                <td style="border: 1px solid black; border-collapse: collapse;">
                                                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("ROLLNUMBER") %>' Font-Bold="true" />
                                                </td>
                                                <td style="border: 1px solid black; border-collapse: collapse; display: none;">
                                                    <asp:Label ID="Label5" runat="server" Text='<%#Eval("APPID") %>' Font-Bold="true" /></asp:Label>
                                                </td>

                                                <td style="border: 1px solid black; border-collapse: collapse;"></td>
                                                <td style="border: 1px solid black; border-collapse: collapse;"></td>
                                                <td style="border: 1px solid black; border-collapse: collapse;"></td>
                                                <td style="border: 1px solid black; border-collapse: collapse;"></td>



                                            </tr>

                                        </table>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                    </FooterTemplate>
                                </asp:DataList>
                                <br />
                                <br />

                                <div style="width: 165px; float: right; margin: 5px 60px 0 5px">
                                    <asp:Label ID="Label1" runat="server">परीक्षा केंद्र अध्यक्ष के सील सहित हस्ताक्षर</asp:Label>
                                </div>
                            </div>
                        </page>

                        <br />
                        <div style="text-align: center; margin-top: 15px; margin-bottom: 10px;">
                            <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
