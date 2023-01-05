<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocketMPSOS.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.DocketMPSOS" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admit For Enrollment form Admission into </title>

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
            padding: 5px;
            border: 1px solid black;
            border-collapse: collapse;
        }

        th {
            text-align: center;
            padding: 5px;
       
          
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
                    <div style="width: 100%; margin: 0 auto; height: auto; border: 1px solid #000; background-image: url(''); background-image: url(''); background-size: 590px; background-repeat: no-repeat; background-position: center center;">

                        <table cellpadding="5" cellspacing="0" style="width: 100%; margin: 0 auto; text-align: center">
                            <tr>
                                <td>
                                    <div style="width: 165px; margin: 5px 0 0 5px; float: left; height: 115px;">
                                        <img alt="Logo" src="../Images/MPGOVLOGO.png" style="width: 85px; margin: 16px 0px 0px 33px;" />
                                    </div>
                                </td>
                                <td style="vertical-align: middle">
                                    <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 22px; font-weight: bolder; text-transform: uppercase; text-align: center">
                                        लोक शिक्षण संचालनालय मध्य प्रदेश परीक्षा आयोजक<br />
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
                    <%----------End Header section ---------%><%---------Start Title section --------%>
                    <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; background-color: #808080; color: #fff;">
                        <span style="font-size: 20px">डॉकेट पत्र</span>
                    </div>
                    <%----------End title section ---------%><%---------Start Applicant Section --------%>
                    <div style="margin: 10px 0; width: 100%; height: auto; font-size: 13px;">


                        <%--Programme Table--%>
                        <%--Applicant Table--%>
                        <div id="divENT" runat="server" class="table-responsive">
                            <div id="div1" runat="server" class="table-responsive">
                                <asp:DataList ID="ItemsList"
                                    BorderColor="black"
                                    CellPadding="5"
                                    CellSpacing="5"
                                    RepeatDirection="Vertical"
                                    RepeatLayout="Table"
                                    RepeatColumns="3"
                                    OnItemDataBound="ItemsList_ItemDataBound"
                                    runat="server">
                                    <HeaderTemplate>
                                        <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                                            <tbody>
                                                <tr colspan="10">
                                                    <td colspan="10" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;">
                                                        <b>केंद्र  का विवरण</b>

                                                    </td>


                                                </tr>
                                            </tbody>
                                            <td colspan="1">
                                                परीक्षा केंद्र
                                         
                                            </td>
                                            <td colspan="4">
                                                <asp:Label ID="txtCentreName" runat="server" Text='<%#Eval("EXAMCENTERNAME") %>' Font-Bold="true" />

                                            </td>
                                            <tr>
                                                <td colspan="1">
                                                    परीक्षा केंद्र कोड
                                         
                                                </td>
                                                <td  colspan="1">
                                                    <asp:Label ID="TXTCentre_Code" runat="server" Text='<%#Eval("CENTER_CODE") %>' Font-Bold="true" />
                                                </td>
                                                  <td colspan="1">
                                                     कक्षा
                                         
                                                </td>
                                                <td  colspan="1">
                                                     <asp:Label ID="LBLCLASS" runat="server" Text='<%#Eval("CLASS") %>' Font-Bold="true" />
                                                </td>



                                            </tr>
                                            </table>
                                        <table style="border: 1px solid black; border-collapse: collapse;table-layout: fixed; ">
                                             <tr>
                                                <th style="border: 1px solid black; border-collapse: collapse;width:100px">
                                                    रोलनंबर
                                         
                                                </th>
                                               
                                                <th style="border: 1px solid black; border-collapse: collapse;width:180px">
                                                    टिप्पणियां
                                         
                                                </th>

                                               
                                        
                                          

                                           
                                                <th style="border: 1px solid black; border-collapse: collapse;width:100px">
                                                    रोलनंबर
                                         
                                                </th>
                                               

                                                <th style="border: 1px solid black; border-collapse: collapse;width:180px">
                                                    टिप्पणियां
                                         
                                                </th>


                                           
                                                <th style="border: 1px solid black; border-collapse: collapse;width:100px">
                                                    रोलनंबर
                                         
                                                </th>
                                               

                                                <th style="border: 1px solid black; border-collapse: collapse;width:180px">
                                                    टिप्पणियां
                                         
                                                </th>


                                          

                                            </tr>
                                        </table>
                                    </HeaderTemplate>



                                    <ItemTemplate>
                                        <table style="border: 1px solid black; border-collapse: collapse;width:100px;table-layout: fixed; ">
                                           
                                            <tr>
                                                <td style="border: 1px solid black; border-collapse: collapse;width:100px">
                                                    <asp:Label ID="txtRollNUmbers" runat="server" Text='<%#Eval("ROLLNUMBER") %>' Font-Bold="true" />

                                                </td>
                                              
                                                <td style="border: 1px solid black; border-collapse: collapse;width:150px"></td>
                                            </tr>

                                        </table>
                                    </ItemTemplate>




                                    <FooterTemplate>
                                        <table style="border: 1px solid black; border-collapse: collapse;width:780px; ">
                                            <tr><td colspan="6" style="border: 1px solid black; border-collapse:collapse;">डॉकेट फॉर्म में पर रोल नंबर की पर्सनलाइज्ड ओएमआर शीट का विवरण</td></tr>
                                            <tr>
                                                <td style="border: 1px solid black; border-collapse:collapse;">इस डॉकेट फॉर्म पर छपे रोल नंबर की संख्या</td>
                                                <td style="border: 1px solid black; border-collapse:collapse;"></td>
                                                <td style="border: 1px solid black; border-collapse:collapse;">इस पैकेट में ‘ABS’प्रकरणों की संख्या</td>
                                                <td style="border: 1px solid black; border-collapse:collapse;"></td>
                                                <td style="border: 1px solid black; border-collapse:collapse;">इस पैकेट में ‘UFM’ प्रकरणों की संख्या</td>
                                                <td style="border: 1px solid black; border-collapse:collapse;"></td>

                                            </tr>
                                            <tr>
                                                <td style="border: 1px solid black; border-collapse:collapse;">केंद्राध्यक्ष के हस्ताक्षर</td>
                                                <td style="border: 1px solid black; border-collapse:collapse;width:150px;table-layout: fixed; "></td>
                                                <td style="border: 1px solid black; border-collapse:collapse;">केंद्र क्रमांक</td>
                                                <td style="border: 1px solid black; border-collapse:collapse;width:150px;table-layout: fixed; "></td>
                                                <td style="border: 1px solid black; border-collapse:collapse;">केंद्र की मुद्रा</td>
                                                <td style="border: 1px solid black; border-collapse:collapse;width:150px;table-layout: fixed; "></td>

                                            </tr>
                                            <tr><td colspan="6" style="border: 1px solid black; border-collapse:collapse;">1.प्रत्येक पैकेट में इस डॉकेट में दर्शाया गया रोल नंबर केवल उपस्थित पर्सनलाइज्ड ओएमआर शीट को क्रम से लगाकर रखें |</td></tr>
                                            <tr><td colspan="6" style="border: 1px solid black; border-collapse:collapse;">2. अनुपस्थित रोल नंबर की ओएमआर शीट अलग से लिफाफे में रखकर कक्षा वार जमा करें |</td></tr>
                                            <tr><td colspan="6" style="border: 1px solid black; border-collapse:collapse;">3. अनुचित साधन प्रयोग करने वाले रोल नंबर पर लाल शाही से गोला लगाकर उसके सम्मुख रिमार्क के कॉलम में ‘UFM’ लिखा जावे एवं इसकी ओएमआर शीट इस बंडल में ना रखी जावे |</td></tr>
                                            <tr><td colspan="6" style="border: 1px solid black; border-collapse:collapse;">4. अनुपस्थित छात्र के रोल नंबर पर लाल शाही  से गोला लगाकर उसके सम्मुख रिमार्क  के कॉलम में 'ABS’ लिखा जावे|</td></tr>
                                        </table>
                                    </FooterTemplate>
                                </asp:DataList>
                            </div>
                            <br />
                            <div style="width: 165px; float: right; margin: 5px 60px 0 5px">
                                <asp:Label ID="Label1" runat="server">परीक्षा केंद्र अध्यक्ष के सील सहित हस्ताक्षर</asp:Label>
                            </div>

                            <br />
                            <br />

                            
                        </div>

                        <br />
                    </div>
                </div>
            </div>

            <div style="text-align: center; margin-top: 15px; margin-bottom: 10px;">
                <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />

            </div>
    </form>
</body>
</html>
