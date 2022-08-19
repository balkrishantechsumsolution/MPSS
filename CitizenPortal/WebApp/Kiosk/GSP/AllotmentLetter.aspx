<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllotmentLetter.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.GSP.AllotmentLetter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Allotment Letter</title>
    <script src="../../../Sambalpur/js/jquery-2.2.3.min.js" type="text/javascript"></script>
    <link href="../../Styles/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../Scripts/CommonScript.js" type="text/javascript"></script>
    <script type="text/javascript">
        function PrintLetter(strid) {
            debugger;

            var prtContent = document.getElementById(strid);
            var WinPrint = window.open('', '', 'letf=0,top=0,width=800,height=700,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="box-body box-body-open">
                <div style="margin: 10px auto; width: 800px; height: 50px; display: none">
                    <div class="">
                        <div class="col-md-12 box-container" id="divBtn1">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <input type="button" id="btnPrint1" class="btn btn-success" value="Print" onclick="javascript: EPassPrint('divPrint');" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div id="divPrint" style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; width: 794px; height: auto; padding: 3px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 1px auto; width: 99.5%; padding: 0; height: auto; border: 1px solid #000; background-image: url(''); background-size: 650px; background-repeat: no-repeat; background-position: center center; -webkit-print-color-adjust: exact;">
                            <%---------Start Header section --------%>
                            <div style="height: 114px; width: 100%; border-bottom: 1px solid #999;">
                                <table style="width: 100%; vertical-align: middle; text-align: center;">
                                    <tr>
                                        <td>
                                            <img src="" style="width: 90px; -webkit-print-color-adjust: exact;" alt="GSP Logo" />

                                        </td>
                                        <td style="text-align: center; vertical-align: middle;">

                                            <span style="text-align: center; font-size: 28px; font-weight: bold; color: #B65838;">Directorate of Skill Development</span>
                                            <span style="display: block; font-size: 16px; font-weight: bold;">Government of M.P., Jabalpur/Bhopal<br />
                                                Online Off-Campus counselling - 2018</span>
                                            <b style="font-size: 20px">GSP-CC (First Round)</b>
                                        </td>
                                        <td style="width: 155px; font-size: 9px; vertical-align: middle; text-align: center; height: 113px;">
                                            <img src="" style="width: 90px; -webkit-print-color-adjust: exact;" alt="ITEES logo" /></td>
                                    </tr>
                                </table>
                            </div>
                            <%----------End Header section ---------%><%---------Start Title section --------%>
                            <div style="display: block; text-align: center; overflow: auto; font-size: 18px; font-weight: bolder; padding: 5px; background-color: #6C4B3C; color: #fff;">
                                <div style="float: left; text-align: left; width: 475px;">
                                    <span id="lblSemester" style="text-align: center; font-weight: bold; color: #fff;">PROVISIONAL ALLOTMENT LETTER</span>
                                </div>
                                <div style="float: right; width: 250px; text-align: right;">
                                    <b>RANK.: </b>
                                    <asp:Label runat="server" ID="lblRank" Style="font-weight: bolder; text-transform: none; white-space: nowrap;"></asp:Label>
                                </div>
                            </div>
                            <%----------End title section ---------%><%---------Start Applicant Section --------%>
                            <div style="margin: 5px auto; width: 770px; font-size: 13px;">
                                <table cellspacing="0" class="" style="width: 100%; border: 0; font-size: 12px;">
                                    <tr>
                                        <td rowspan="8" style="padding: 2px; border: 1px solid #999; width: 130px; text-align: center; vertical-align: middle">
                                            <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; height: 115px; -webkit-print-color-adjust: exact;" id="ProfilePhoto" />
                                            <br />
                                            &nbsp;<img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto0" style="margin: 1px; width: 115px; height: 45px; -webkit-print-color-adjust: exact;" id="ProfileSignature" /></td>
                                        <td style="padding: 2px; background-color: #37495f; color: #fff; font-size: 12px; text-align: left; border: 1px solid #999;" colspan="4">
                                            <b style="text-transform: uppercase;">Applicant Details</b>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; width: 110px;">
                                            <asp:Label ID="Label32" runat="server" Text="Application Number<br/>आवेदन क्रमांक"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; width: 200px;">
                                            <asp:Label ID="lblAppNo" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; width: 100px;">&nbsp;<asp:Label ID="Label36" runat="server" Text="Application Date<br>आवेदन तिथि"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999;">
                                            <asp:Label ID="lblAppDate" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999;">
                                            <asp:Label ID="Label33" runat="server" Text="Name<br/>नाम"></asp:Label>
                                        </td>
                                        <td colspan="3" style="padding: 2px; border: 1px solid #999;">
                                            <asp:Label ID="lblCanddidateName" runat="server"></asp:Label>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999;width:155px">
                                            <asp:Label ID="Label28" runat="server" Text="Father's / Husband's Name<br/>पिता/पति का नाम"></asp:Label>
                                        </td>
                                        <td colspan="3" style="padding: 2px; border: 1px solid #999;">
                                            <asp:Label ID="FatherName" runat="server"></asp:Label>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999;">
                                            <asp:Label ID="Label34" runat="server" Text="Gender&lt;br/&gt;लिंग"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999;">
                                            <asp:Label ID="lblGender" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999;">
                                            <asp:Label ID="Label35" runat="server" Text="Category&lt;br/&gt;श्रेणी"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999;">
                                            <asp:Label ID="lblCategory" runat="server"></asp:Label>
                                        </td>
                                    </tr>

                                </table>
                                
                                <br />
                                <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0; font-size: 12px;">
                                    <tr>
                                        <td colspan="4" style="padding: 20px 20px" colspan="2">संचानालय कौशल  विकास, आपके द्वारा दी गयी जानकारी के आधार पर निम्नानुसार संस्था एवं व्यवसाय आवंटित कर रहा है | आवेदन सही पाए जाए पर तथा मूल दस्तावेजों के सत्यापन एवं फीस जमा होने के उपरांत ही प्रवेश मन जायेगा |</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="" colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="background-color: #37495f; color: #fff; font-size: 12px; text-align: left; border: 1px solid #999;" colspan="2">
                                            <b style="text-transform: uppercase;">Admission Details</b></td>
                                    </tr>
                                    <tr style="">
                                        <td style="background-color: #F8F8F8; border: 1px solid #ccc; font-size: 12px; text-align: left;">
                                            <asp:Label ID="Label37" runat="server" Text="Qualifying percentage<br/>अर्हकारी प्रतिशत"></asp:Label>
                                        </td>
                                        <td style="border: 1px solid #ccc; text-align: left; font-size: 12px;">
                                            <asp:Label ID="lblPercentage" runat="server"></asp:Label>
                                        </td>
                                        <td style="background-color: #F8F8F8; border: 1px solid #ccc; text-align: left; font-size: 12px;">
                                            <asp:Label ID="Label39" runat="server" Text="Common Rank<br/>कोमन रैंक"></asp:Label>
                                        </td>
                                        <td style="border: 1px solid #ccc; text-align: left; font-size: 12px;">
                                            <asp:Label ID="lblCommonRank" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr style="">
                                        <td style="background-color: #F8F8F8; border: 1px solid #ccc; font-size: 12px; text-align: left;width:215px;">
                                            <asp:Label ID="Label41" runat="server" Text="Reporting Date for Admission <br/>प्रवेश हेतु निर्धारित तिथि (DD/MM/YYYY)"></asp:Label>
                                        </td>
                                        <td style="border: 1px solid #ccc; text-align: left; font-size: 12px;">
                                            <asp:Label ID="lblReportDate" runat="server" Text="Saturday, 29/09/2018"></asp:Label>
                                        </td>
                                        <td style="background-color: #F8F8F8; border: 1px solid #ccc; text-align: left; font-size: 12px;">&nbsp;</td>
                                        <td style="border: 1px solid #ccc; text-align: left; font-size: 12px;">&nbsp;</td>
                                    </tr>
                                    <tr style="">
                                        <td style="background-color: #F8F8F8; border: 1px solid #ccc; font-size: 12px; text-align: left;">
                                            <asp:Label ID="Label42" runat="server" Text="Institute Name &lt;br/&gt;संस्था का नाम"></asp:Label>
                                        </td>
                                        <td style="border: 1px solid #ccc; text-align: left; font-size: 12px;" colspan="3">
                                            <asp:Label ID="lblInstitute" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr style="">
                                        <td style="background-color: #F8F8F8; border: 1px solid #ccc; font-size: 12px; text-align: left;">
                                            <asp:Label ID="Label43" runat="server" Text="Course name  &lt;br/&gt;कोर्स "></asp:Label>
                                        </td>
                                        <td style="border: 1px solid #ccc; text-align: left; font-size: 12px;">
                                            <asp:Label ID="lblCourse" runat="server"></asp:Label>
                                        </td>
                                        <td style="background-color: #F8F8F8; border: 1px solid #ccc; text-align: left; font-size: 12px;">
                                            <asp:Label ID="Label47" runat="server">Admission Category<br />आवंटित श्रेणी</asp:Label>
                                        </td>
                                        <td style="border: 1px solid #ccc; text-align: left; font-size: 12px;">
                                            <asp:Label ID="lblAdminCategory" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                                <br />
                                <table style="border: 0; font-size: 12px; font-family: Arial; margin: 20px">

                                    <tr>
                                        <td style="padding: 1px; text-align: center; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium; text-align: left" colspan="2">अभ्यर्थी को GSP-CC में प्रवेश लेने हेतु अपने समस्त मूल प्रमाण पत्र, आवश्यक प्रशिक्षण शुल्क तथा वेबसाइट से प्राप्त आवंटन पत्र का प्रिंट आउट, सम्पूर्ण मूल दस्तावेजों की चाय प्रति के दो सेट एवं दो फोटोग्राफ एवं निम्नलिखित दस्तावेज़ लेकर सम्बंधित संस्था में स्वयं उपस्थित होना पड़ेगा |</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1px; text-align: center; vertical-align: middle;"></td>
                                        <td style="padding: 1px; text-align: left; vertical-align: middle;">•	अर्हकारी परीक्षा की अंक सूचि (ITI/B.E./B.Tech/Diploma).<br />
                                            •	म.प्र. का मूल निवासी / स्थानीय / वास्तविक निवासी प्रमाण पत्र.<br />
                                            •	स्थायी जाती प्रमाण पत्र सक्षम प्राधिकारी द्वारा जरी (आरक्षित प्रवर्ग के अभ्यर्थी के लिए)|<br />
                                            •	अन्य पिछड़ा वर्ग के सभी अभ्यर्थियों को वर्तमान वित्तीय वर्ष का आय प्रमाण पत्र (जो 3 माह से अधिक पुराना न हो) |जो तहसीलदार द्वारा जरी किया गया हो, लाना आवश्यक है|<br />
                                            •	विकलांग अभ्यर्थी के लिए अधिकृत प्राधिकारी द्वारा जरी जिला चिकित्सा मंडल द्वारा विकलांगता प्रमाण पत्र |<br />
                                            •	स्थानान्तरण प्रमाण पत्र (T.C.)<br />

                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />

                                <table cellpadding="2" cellspacing="0" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="text-align: left; white-space: nowrap; text-align: left; vertical-align: middle; font-size: 11px;" rowspan="2">
                                            <asp:Label ID="Label11" Font-Size="12px" runat="server" Text="आवंटन जरी करने की दिनांक"></asp:Label>
                                            &nbsp;:
                                            <asp:Label ID="lblAllotmentDate" runat="server"></asp:Label>
                                        </td>
                                        <td style="text-align: left; white-space: nowrap;" rowspan="2">&nbsp;</td>
                                        <td style="text-align: center; white-space: nowrap; width: 30%;">
                                            <img runat="server" src="" name="ProfilePhoto1" style="margin: 1px; width: 130px; height: 54px; -webkit-print-color-adjust: exact;" id="ARExamSig" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center; vertical-align: bottom; white-space: nowrap;">
                                            <asp:Label ID="Label30" Font-Size="12px" runat="server" Text="संचानालय कौशल विकास&lt;br/&gt;म.प्र. जबलपुर"></asp:Label></td>

                                    </tr>
                                </table>
                                <br />
                                <br />

                            </div>
                            <%----------End Document Section ---------%>
                        </div>
                    </div>


                </div>
                <%---Start of Button----%>
                <div style="margin-top: 20px;">
                    <div class="col-md-12 box-container" id="divBtn">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <input type="button" id="btnPrint" class="btn btn-success" value="Print" onclick="javascript: PrintLetter('divPrint');" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <br />
                <br />
                <%----END of Button-----%>
            </div>
        </div>
    </form>
</body>
</html>
