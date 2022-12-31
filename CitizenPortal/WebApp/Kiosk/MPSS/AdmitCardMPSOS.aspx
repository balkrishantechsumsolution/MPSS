<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdmitCardMPSOS.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.AdmitCardMPSOS" %>

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
                        <span style="font-size: 20px">श्रमोदय (आवासीय) विद्यालय प्रवेश परीक्षा 2023-24 की प्रवेश पत्र</span>
                    </div>
                    <%----------End title section ---------%><%---------Start Applicant Section --------%>
                    <div style="margin: 10px 0; width: 100%; height: auto; font-size: 13px;">

                       
                        <%--Programme Table--%>
                        <%--Applicant Table--%>
                        <div id="divENT" runat="server" class="table-responsive">
                            <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                                <tbody>
                                    <tr>
                                        <td colspan="5" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>केंद्र  का विवरण</b></td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <th style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="manadatory">पंजीकरण क्रमाक</th>
                                        <th style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="manadatory">
जन्म तिथि
                                        </th>

                                        <th style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="manadatory">रोल नंबर
                                        </th>
                                        <th style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; text-align: left;" class="auto-style1">Unique Code</th>
                                        <th style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">केंद्र क्रमाक
                                        </th>
                                        
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="txtRegNo" runat="server"></asp:Label>
                                        </td>
                                         <td>
                                            <asp:Label ID="txtDOB" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="txtRollNo" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="txtUniqueCode" runat="server"></asp:Label>
                                            </td>
                                        <td>
                                            <asp:Label ID="txtCentreNo" runat="server"></asp:Label>

                                        </td>
                                       
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <br />
                        <table style="width: 98%; margin: 0 auto;">
                            <tr>
                                <td colspan="2">
                                    <table class="table-bordered" style="width: 100%">
                                        <tr>
                                            <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>छात्रा/छात्र का विवरण</b></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top;">
                                    <table border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; font-size: 11px; text-align: center; height: 155px; width: 155px; vertical-align: top;">
                                                <img runat="server" src="/webApp/kiosk/Images/photo.png" style="margin: 1px; width: 145px;" id="ProfilePhoto" />
                                                <b>छात्रा/छात्र का फोटो</b>
                                            </td>
                                        </tr>

                                    </table>
                                </td>
                                <td style="vertical-align: top;">
                                    <table cellpadding="5" cellspacing="0" class="table-bordered" style="margin: 0; width: 100%">
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>छात्रा/छात्र का नाम</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="FullName" runat="server"></asp:Label>
                                            </td>
                                             </tr>

                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>पिता का नाम</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="FatherName" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>माता का नाम</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; white-space: nowrap;">
                                                <asp:Label ID="MotherName" runat="server"></asp:Label></td>
                                             </tr>

                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>परीक्षा केंद्र</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="txtCentreName" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr style="display:none;">
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                <b>परीक्षा का नाम
                                                </b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="txtExamName" runat="server"></asp:Label></td>
                                             </tr>
                                         <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b> कक्षा</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; white-space: nowrap;">
                                                <asp:Label ID="txtClass" runat="server"></asp:Label> </td>
                                             </tr>
                                        <tr style="display:none;">
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>स्कूल के नाम</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="txtSchoolName" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                         <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>परीक्षा तिथि</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="Label1" runat="server"> 08-Jan-2023</asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b> परीक्षा का समय</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; white-space: nowrap;">
                                                <asp:Label ID="Label2" runat="server"></asp:Label>  09:45 AM to 12:15 PM (2 Hours)</td>
                                             </tr>
                                       
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />

                        <div style="width: 165px; float: right;margin: 5px 60px 0 5px">
                                       
                                        <img alt="Logo" src="../Images/signatureAssit.jpeg" style="width: 185px; margin: 16px 0px 0px 33px;" />
                                    </div>
                       <%--  <div id="div3" runat="server" style="text-align:left">
                              &nbsp; &nbsp;
                             08-Jan-2023
                               &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
                             परीक्षा का समय
                             <br /> <br />
                                &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
                          
                             </div>--%>
                          <br />
                        <br />
                          <br />
                        <br />
                          <br />
                        <br />
                        <div id="div4" runat="server" >
                          
                             </div>
                        <br />
                        <br />
                        <br />
                        <div id="div1" runat="server" >
                         <div style="text-align: center;">  महत्त्वपूर्ण निर्देश</div><br />
                                            <br />
                          


   &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;(1) डाउनलोड किये गये फोटोयुक्त प्रवेश पत्र के आधार पर परीक्षार्थी परीक्षा केन्द्र में प्रवेश कर सकता है। 
                                           <br />
                                            <br />

                            
  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;(2) परीक्षार्थी को परीक्षा केंद्र पर प्रातः 9:00 बजे तक उपस्थित होना अनिवार्य है, विलम्ब की स्थिति में परीक्षार्थी स्वयं जिम्मेदार

होगा।   <br />
                                            <br />


 &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;(3) परीक्षा केन्द्र संबंधी कोई समस्या होने पर प्रवेश पत्र प्राप्त होते ही केंद्राध्यक्ष से

तत्काल संपर्क करें।   <br />
                                            <br />


 &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;(4) परीक्षार्थी को परीक्षा केन्द्र पर प्रवेश-पत्र, फोटो युक्त परिचय पत्र एवं काली स्याही के 02 "बालपाइंट पेन'" साथ लाना अनिवार्य है।
                               <br />
                                            <br />
&nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;(5) अन्य परीक्षा संबंधित जानकारी हेतु 0755-2552106 पर संपर्क करें एवं www.mpsos.nic.in पर निर्देश प्राप्त करें।

                        </div>
                        <br />
                        <div id="div2" runat="server" class="table-responsive" style="display:none;">
                            <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                                <tbody>
                                    <tr>
                                        <td style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Education Details</b></td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <th style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                            <table class="table tab;e-border">
                                                <tr class="table-dark">
                                                    <th style="">विद्यालय का नाम *</th>
                                                    <th style="">विद्यालय का प्रकार </th>
                                                    <th style="">जिले का नाम</th>
                                                    <th style="display: none">विकास खण्ड</th>
                                                    <th style="">कक्षा</th>
                                                      <th style="">उत्तीर्ण वर्ष</th>

                                                </tr>
                                                <tr>
                                                    <td>
                                                        
                                                         <asp:Label ID="PreviousSchoolName" runat="server"></asp:Label>
                                                       
                                                    </td>

                                                    <td>
                                                         <asp:Label ID="lblSchoolType" runat="server"></asp:Label>
                                                        
                                                    </td>

                                                    <td>
                                                         <asp:Label ID="lblSchoolPreDist" runat="server"></asp:Label>
                                                        
                                                    </td>
                                                    <td style="display: none">

                                                        <asp:TextBox ID="TextBox3" runat="server" ToolTip="Father Full Name"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                         <asp:Label ID="lblSchoolClass" runat="server"></asp:Label>
                                                       
                                                    </td>
                                                      <td>
                                                        <asp:Label ID="lblSchoolYear" runat="server"></asp:Label>

                                                       
                                                    </td>

                                                </tr>
                                                <tr class="table-dark">
                                                  
                                                    <th style="">प्राप्तांक</th>
                                                    <th style="">पूर्णांक</th>
                                                    <th style="">परिणाम प्रतिशत(%)</th>
                                                    <th style="">परिणाम ग्रेड</th>
                                                     <th style=""></th>
                                                </tr>
                                                <tr>
                                                  
                                                    <td>
                                                         <asp:Label ID="txtMarksObtain" runat="server"></asp:Label>
                                                        </td>
                                                    <td>
                                                         <asp:Label ID="txtTotalMarks" runat="server"></asp:Label>
                                                        </td>

                                                    <td>
                                                         <asp:Label ID="txtMarksPercentage" runat="server"></asp:Label>
                                                        </td>
                                                    <td>
                                                         <asp:Label ID="txtGrade" runat="server"></asp:Label>
                                                         </td>
                                                     <td>
                                                         
                                                        </td>
                                                      
                                                </tr>
                                            </table>
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <br />
                        <table id="tblCaste" runat="server" cellpadding="0" visible="false" cellspacing="0" width="600" style="margin: 0 auto; width: 98%;">
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;" colspan="5"><b>Caste Certificate Details</b></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap">Caste Issuing Date</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblCasteDate" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap">Caste Certificate No.</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                    <asp:Label ID="lblCasteNo" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">Caste Certificate Issuing Authority</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                    <asp:Label ID="lblCaste" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <%--Applicant Address Table--%>
                        <table width="600" style="width: 100%;display:none;">
                            <tr>
                                <td style="text-align: left; vertical-align: top">
                                    <table id="PerAddress" runat="server" width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                                        <tr>
                                            <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Permanent Address</b></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 135px;">
                                                <b>Address</b>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                                <asp:Label ID="PAddressLine1" runat="server"></asp:Label>&nbsp;<asp:Label ID="PAddressLine2" runat="server"></asp:Label>&nbsp;<asp:Label ID="PRoadStreetName" runat="server"></asp:Label>&nbsp;<asp:Label ID="PLandMark" runat="server"></asp:Label>
                                                &nbsp;<asp:Label ID="PLocality" runat="server"></asp:Label></td>
                                        </tr>

                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>District</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="PddlDistrict" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                <b>State</b>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="PddlState" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Pincode</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="PPinCode" runat="server"></asp:Label></td>
                                        </tr>
                                    </table>

                                </td>
                                <td style="text-align: left; display: none;">
                                    <table id="PreAddress" runat="server" width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                                        <tr>
                                            <td colspan="2" style="padding: 8px; border-left: 1px solid #fff; border-right: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Present Address</b></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 135px;">
                                                <b>Address</b>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                                <asp:Label ID="CAddressLine1" runat="server"></asp:Label>&nbsp;<asp:Label ID="CAddressLine2" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td width="210" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 135px;"><b>Road/Street Name</b></td>
                                            <td width="276" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 190px;">
                                                <asp:Label ID="CRoadStreetName" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                <b>Landmark</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="CLandMark" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Locality</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="CLocality" runat="server"></asp:Label></td>
                                        </tr>

                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>District</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="CddlDistrict" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                <b>State</b>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="CddlState" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Pincode</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="CPinCode" runat="server"></asp:Label></td>
                                        </tr>
                                    </table>

                                </td>
                            </tr>
                        </table>

                        <br />
                        <table id="DivEdu" runat="server" width="500" cellpadding="5" cellspacing="0" class="table-bordered" style="display: none; width: 98%; border: 1px solid #999; margin: 0 auto;">
                            <tr>
                                <td style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Academic Profile of Applicant</b></td>
                            </tr>
                            <tr style="">
                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                    <asp:GridView ID="grdEducation" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin-bottom: 0; width: 98%; margin: 0 auto;" ClientIDMode="Static" Width="100%">
                                    </asp:GridView>
                                </td>
                            </tr>

                        </table>
                        <br />
                        <%--<div style="page-break-after: always;"></div>--%><%--Academic Profile Table--%>
                        <%--Reservation Quota Details Table--%><%--Domicile Table--%><%--Other Information Table--%>
                        <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="display: none; width: 98%; border: 1px solid #999; margin: 0 auto;">
                            <tr>
                                <td colspan="5" class="hdbg" style="padding: 5px; text-align: left; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; -webkit-print-color-adjust: exact;">
                                    <b>Other Information    </b>
                                </td>
                            </tr>
                            <tr>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">1. </td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">Have you Enrolled earlier for any course in ?</td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; font-weight: normal">
                                    <asp:Label ID="lblIsEnroll" runat="server" CssClass="t_trans"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trCourse" runat="server">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">Enrollment No.</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblReg" runat="server" CssClass="t_trans"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">2. </td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">Do you have any gap in Educational Qualifications?</td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; font-weight: normal">
                                    <asp:Label ID="lblGap" runat="server" CssClass="t_trans"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trGAP" runat="server">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">Education Gap Year</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblGapYear" runat="server" CssClass="t_trans"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">3. </td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">Have you received Migration Certificate from other Board/University?</td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; font-weight: normal">
                                    <asp:Label ID="lblMigration" runat="server" CssClass="t_trans"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trMigration" runat="server">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="Label4" runat="server" CssClass="t_trans">Migration Certificate No.</asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblMigrationNo" runat="server" CssClass="t_trans"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="Label32" runat="server" CssClass="t_trans">Migration Issue Date</asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblMigrationDate" runat="server" CssClass="t_trans"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">4. </td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">Do you have DTE Counselling Entrance Exam Score Card?</td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; font-weight: normal">
                                    <asp:Label ID="lblIsScore" runat="server" CssClass="t_trans"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trScore" runat="server">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                    <table width="100%" cellpadding="5" cellspacing="0" class="table table-bordered">
                                        <tr>
                                            <th style="border: 1px solid #999">Examination Roll No</th>
                                            <th style="border: 1px solid #999">Name of Competitive Examination Passed</th>
                                            <th style="border: 1px solid #999">Marks Scored (%)</th>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid #999">
                                                <asp:Label ID="lblEntranceNo" runat="server" CssClass="t_trans"></asp:Label>
                                            </td>
                                            <td style="border: 1px solid #999">
                                                <asp:Label ID="lblExamName" runat="server" CssClass="t_trans"></asp:Label>
                                            </td>
                                            <td style="border: 1px solid #999">
                                                <asp:Label ID="lblScoreCard" runat="server" CssClass="t_trans"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <div id="divQualification" runat="server">
                            <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="display: none; width: 98%; border: 1px solid #999; margin: 0 auto;">
                                <tbody>
                                    <tr>
                                        <td colspan="4" class="hdbg" style="padding: 5px; text-align: left; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; -webkit-print-color-adjust: exact;"><b>Qualifiaction Details</b></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table class="table1 table-bordered" style="width: 100%; margin: auto 0">
                                                <thead>
                                                    <tr>
                                                        <th style="white-space: nowrap">Sl. No.</th>
                                                        <th style="white-space: nowrap">Name of Subject</th>
                                                        <th style="white-space: nowrap">Total Marks</th>
                                                        <th style="white-space: nowrap">Marks Secured</th>
                                                        <th style="white-space: nowrap">%</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>1.</td>
                                                        <td>
                                                            <asp:Label ID="lblPhySubject" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                        <td>&nbsp;<asp:Label ID="txtPhyTotalMarks" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                        <td>&nbsp;<asp:Label ID="txtPhyMarkSecure" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                        <td>&nbsp;<asp:Label ID="txtPhyPercentage" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>2.</td>
                                                        <td>
                                                            <asp:Label ID="lblCheSubject" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                        <td>&nbsp;<asp:Label ID="txtCheTotalMarks" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                        <td>&nbsp;<asp:Label ID="txtCheMarkSecure" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                        <td>&nbsp;<asp:Label ID="txtChePercentage" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>3.</td>
                                                        <td>
                                                            <asp:Label ID="lblMatSubject" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                        <td>&nbsp;<asp:Label ID="txtMatTotalMarks" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                        <td>&nbsp;<asp:Label ID="txtMatMarkSecure" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                        <td>&nbsp;<asp:Label ID="txtMatPercentage" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <br />
                        </div>
                        <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="display: none; width: 98%; border: 1px solid #999; margin: 0 auto;">
                            <tbody>
                                <tr>
                                    <td colspan="4" class="hdbg" style="padding: 5px; text-align: left; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; -webkit-print-color-adjust: exact;"><b>List of essential documents to be enclosed with the application</b></td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="table table-bordered" style="margin: 0 auto; width: 98%;">
                                            <tr>
                                                <th style="width: 20px; text-align: left">Select</th>
                                                <th style="width: 200px; text-align: left">Document Name</th>
                                            </tr>
                                            <tr id="trClassX" runat="server">
                                                <td style="text-align: center">
                                                    <input name="" type="checkbox" id="chkClassX" runat="server" disabled="disabled" /></td>
                                                <td>Photocopy of Class-X Mark Sheet</td>
                                            </tr>
                                            <tr id="trClassXII" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkClassXII" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td>Photocopy of Class-XII Mark Sheet </td>
                                            </tr>
                                            <tr id="trClassDiploma" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkDiploma" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td>Photocopy of Diploma Mark Sheet</td>
                                            </tr>
                                            <tr id="trUG" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkUG" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td>Photocopy of Graduation Mark Sheet</td>
                                            </tr>
                                            <tr id="trPG" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkPG" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td>Photocopy of Post Graduate Mark Sheet</td>
                                            </tr>
                                            <tr id="trMig" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkMig" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td>Orginal Migration Certificate</td>
                                            </tr>
                                            <tr id="trCasteDoc" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkCaste" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td>Photocopy of Caste Certificate</td>
                                            </tr>
                                            <tr id="trDomicileDoc" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkDomicile" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td>Photocopy of Domicile Certificate</td>
                                            </tr>
                                            <tr id="trGAPDoc" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkGap" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td>Original for Gap in Education </td>
                                            </tr>
                                            <tr id="trScoreDoc" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkScore" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td style="white-space: nowrap">Photo Copy of Original Entrance Examination Score Card </td>
                                            </tr>
                                            <tr id="trOtherDoc" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkOtherDoc" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td>Any other Document </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                        <table id="Table1" runat="server" cellpadding="0" cellspacing="0" width="600" style="margin: 0 auto; width: 98%;display:none;">
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;" colspan="4"><b>Document Details</b></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">1.</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="Label6" runat="server">पूर्व कक्षा की अंक सूची स्कैन कापी संलग्न। यदि परिणाम प्रतीक्षित मार्कशीट अटैचमेंट की आवश्यकता नहीं है</asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="Label7" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">2.</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <span style="color: rgb(51, 51, 51); font-family: Heebo-Regular, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(249, 249, 249); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">विकलांगता प्रमाणपत्र की स्कैन कापी संलग्न<span>&nbsp;</span></span></td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="Label33" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">3. </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <span style="color: rgb(51, 51, 51); font-family: Heebo-Regular, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">जाति प्रमाणपत्र की स्कैन कापी संलग्न<span>&nbsp;</span></span></td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="Label34" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">4.</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <span style="color: rgb(51, 51, 51); font-family: Heebo-Regular, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(249, 249, 249); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">मध्य प्रदेश के मूल निवासी प्रमाणपत्र की स्कैन कापी संलग्न<span>&nbsp;</span></span></td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="Label35" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>

                        <table cellpadding="0" cellspacing="0" width="600" style="margin: 0 auto; width: 98%; display: none;">
                            <tbody>
                                <tr>
                                    <td colspan="4" class="hdbg" style="padding: 5px; text-align: left; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; -webkit-print-color-adjust: exact;"><b>Application History</b></td>
                                </tr>
                            </tbody>
                        </table>
                        <div>
                            <asp:GridView ID="grdHistory" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin-bottom: 0; width: 98%; margin: 0 auto;" ClientIDMode="Static" Width="100%">
                            </asp:GridView>
                        </div>
                    </div>
                    <%---------End Applicant Section --------%>
                </div>
            </div>
        </div>

        <br />
        <div style="text-align: center; margin-top: 15px; margin-bottom: 10px;">
            <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />
            
        </div>
    </form>
</body>
</html>
