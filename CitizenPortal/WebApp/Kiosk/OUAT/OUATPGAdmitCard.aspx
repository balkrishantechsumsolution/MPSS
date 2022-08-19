<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OUATPGAdmitCard.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.OUATPGAdmitCard" %>


<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admit Card - PG Entrance Exam 2017-18</title>
        <script src="/Scripts/jquery-2.2.3.min.js"></script>
    <link href="../../Styles/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/CommonScript.js"></script>
    <script type="text/javascript">
        function EPassPrint(strid) {
            debugger;
            var rollno = $("#lblRollNo").text();
            var appid = $("#lblAppID").text();

            EPassLog(rollno, appid);
            var prtContent = document.getElementById(strid);
            var WinPrint = window.open('', '', 'letf=0,top=0,width=800,height=700,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }

        function EPassLog(rollno, appid) {
            var category = "";
            $.when(
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Kiosk/OUAT/AdmitCard.aspx/PrintAdmitLog',
                    data: '{"prefix":"' + category + '","RollNo":"' + rollno + '","AppID":"' + appid + '"}',
                    processData: false,
                    dataType: "json",
                    success: function (response) {

                    },
                    error: function (a, b, c) {
                        result = false;
                        alert("5." + a.responseText);
                    }
                })
                ).then(function (data, textStatus, jqXHR) {
                    debugger;
                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    RegNo = obj.AppID;
                    result = true;

                    if (result) {
                        //alert('Please')
                    }
                });// end of Then function of main Data Insert Function

            return false;
        }
    </script>
    <style type="text/css">
        .auto-style2 {
            width: 135px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="box-body box-body-open">
                <div id="" style="margin: 10px auto; width: 1000px; height: 50px; /*height: 1220px; overflow: auto; */">
                </div>
                <div id="divPrint" style="margin: 0 auto; width: 800px; /*height: 1080px; height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; height: 758px; width: 794px; padding: 3px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 0 auto; height: 750px; width: 785px; border: 1px solid #000; background-image: url('../images/ouatlogobg.png'); background-size: 400px; background-repeat: no-repeat; background-position: center center;">
                            <%---------Start Header section --------%>
                            <div style="height: 114px; width: 100%; border-bottom: 1px solid #999;">
                                <table style="width: 100%; vertical-align: middle; text-align: center;">
                                    <tr>
                                        <td>
                                            <img alt="Logo" src="/webApp/kiosk/Images/OUAT.png" style="width: 80px; margin: 10px 0 0 6px;" />
                                        </td>
                                        <td style="text-align: center; vertical-align: middle;">

                                            <span style="text-align: center; font-size: 24px; font-weight: bold; color: #d43300;">COMMON ENTRANCE EXAMINATION - 2017-18</span>
                                            <br />
                                            <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 18px; font-weight: bolder; text-transform: none;">ORISSA UNIVERSITY OF AGRICULTURE AND TECHNOLOGY
                                                <br />BHUBANESWAR–751003
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <div style="width: 75px; text-align: center; margin: 0 auto;"></div>
                                            <uc1:QRCode runat="server" ID="QRCode" style="width: 80px !important" />

                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <%----------End Header section ---------%><%---------Start Title section --------%>
                            <div style="display: block; text-align: center; overflow: auto; font-size: 20px; font-weight: bolder; padding: 5px; text-transform:unset; background-color: #808080; color: #fff;">
                                <div style="float: left; width: 510px;">
                                    <span style="text-align: left; font-size: 20px; font-weight: bold; color: #fff;">OUAT PG & Ph.D ENT. EXAM-2017, ADMIT CARD</span></div>
                                <div style="float: right; width: 250px; text-align: right;">
                                    <b>Roll No.: </b>
                                    <asp:Label runat="server" ID="lblRollNo" Style="font-weight: bolder; text-transform: none; white-space: nowrap;" Text="AK041004"></asp:Label>
                                </div>
                            </div>
                            <%----------End title section ---------%><%---------Start Applicant Section --------%>
                            <div style="margin: 5px auto; width: 770px; font-size: 13px;">
                                <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="6">
                                            <b style="text-transform: uppercase;">Applicant Details</b></td>
                                        <td rowspan="6" style="padding: 0; border: 1px solid #999; text-align: center; vertical-align: top;" class="auto-style2">
                                            <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 130px; " id="ProfilePhoto" />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 100px;">
                                            <asp:Label ID="Label5" runat="server" Text="Application No."></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;" colspan="2">
                                            <asp:Label ID="lblAppID" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap;" colspan="2">
                                            <asp:Label ID="Label7" runat="server" Text="Application Date"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblAppDate" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                            <asp:Label ID="Label28" runat="server" Text="Applicant Name"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;" colspan="2">
                                            <asp:Label ID="lblAppname" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                            <asp:Label ID="lblGender0" runat="server">Gender</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                            <asp:Label ID="lblGender" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                            <asp:Label ID="lblFather2" runat="server">Mother's Name</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 250px;" colspan="2">
                                            <asp:Label ID="lblMother" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                            Mobile No.</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                            <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr style="">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblFather1" runat="server">Father's Name</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                            <asp:Label ID="lblFather" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;white-space:nowrap" colspan="2">
                                                        <asp:Label ID="Label29" runat="server" Text="Date of Birth"></asp:Label>
                                                    &nbsp;(<asp:Label ID="lblFather0" runat="server">Age</asp:Label>
                                                    )</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                        &nbsp;(<asp:Label ID="lblAge" runat="server"></asp:Label>
                                                        )</td>
                                    </tr>
                                    <tr style="">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        Email ID</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="5">
                                            <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                                        <asp:Label ID="lblCategory" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border: none" colspan="7">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="7">
                                            <b class="text-uppercase">Correspondance Address</b></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="7">
                                            <asp:Label ID="lblAddress" Font-Size="12px" runat="server" Text="Address Details"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                            <asp:Label ID="lblDistrict0" Font-Size="12px" runat="server" Text="District : "></asp:Label><asp:Label ID="lblDistrict" Font-Size="12px" runat="server" Text="KHURDA"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                            <asp:Label ID="lblSubdistrict0" Font-Size="12px" runat="server">Block : </asp:Label><asp:Label ID="lblSubdistrict" Font-Size="12px" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                            <asp:Label ID="lblVillage0" Font-Size="12px" runat="server">Town / Village :</asp:Label>&nbsp;<asp:Label ID="lblVillage" Font-Size="12px" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="1">
                                            <asp:Label ID="lblPin0" runat="server">PIN : </asp:Label>
                                            <asp:Label ID="lblPin" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                                <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: none; font-family: Arial; font-size: 12px;">
                                    <tr>
                                        <td style="">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-transform: uppercase; border: 1px solid #999; padding: 5px; text-align: left; font-size: 13px; font-weight: bolder;">
                                            <b style="text-transform: uppercase;">Examination Center Details</b></td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td style="border: 1px solid #999; padding: 0;">
                                            <div style="clear: both; margin: 0; padding: 0; width: 100%">
                                                <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0;">
                                                    <tr>
                                                        <td style="width: 90px; border-right: 1px solid #999; padding: 5px; text-align: center; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium; border-bottom: none;" rowspan="2">
                                                            <asp:Label ID="Father" runat="server">Center Name <br />&<br />Address</asp:Label>

                                                        </td>
                                                        <td style="width: 200px; padding: 5px; border: 1px solid #999; text-align: left; border-top: none; border-bottom: none;" rowspan="2">
                                                            <asp:Label ID="lblVenue" runat="server" Text=""></asp:Label>

                                                        </td>
                                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 124px; border-top: none;">
                                                            <asp:Label ID="lblBPLYear" Font-Size="12px" runat="server" Text="Date of Examination"></asp:Label></td>
                                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; border-top: none; border-right: none; border-bottom: none; white-space: nowrap;">
                                                            <asp:Label ID="lblDate" runat="server">16.07.2017 (11:00 AM to 1:00 PM)</asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; border-bottom: none;">
                                                            <asp:Label ID="lblBPLYear0" Font-Size="12px" runat="server" Text="Reporting Time "></asp:Label></td>
                                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; border-right: none; border-bottom: none;">
                                                            <asp:Label ID="lblTime" runat="server"> 10:00 AM (Morning)</asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>

                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <div style="clear: both; margin: 0; padding: 0; width: 100%">
                                    <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0;">
                                        <tr>
                                            <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; padding: 5px; text-align: center; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium;">
                                                <img runat="server" src="../Images/asst_registrar_signature_ouat.png" name="ProfilePhoto1" style="margin: 1px; width: 130px; height: 54px;" id="OUATAddRegSig" />
                                                <%--<img runat="server" src="/webApp/kiosk/Images/OUATAddRegSig.png" name="ProfilePhoto1" style="margin: 1px; width: 130px; height: 54px;" id="OUATAddRegSig" />--%></td>
                                            <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; padding: 5px; text-align: left; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium; height: 70px;width: 250px;">&nbsp;</td>
                                            <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; padding: 5px; text-align: left; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium; text-align: center;">
                                                <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto0" style="margin: 1px; width: 130px; height: 54px;" id="ProfileSign" /></td>
                                        </tr>
                                        <tr>
                                            <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; text-align: center; vertical-align: bottom; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium;">
                                                <asp:Label ID="Label30" Font-Size="10px" runat="server" Text="Signature of Asst. Registrar (Acd.)"></asp:Label></td>
                                            <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; text-align: center; vertical-align: bottom; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium;">
                                                <asp:Label ID="Label6" Font-Size="10px" runat="server" Text="Signature of the Invigilator"></asp:Label></td>
                                            <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; text-align: center; vertical-align: bottom; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium;">
                                                <asp:Label ID="Label11" Font-Size="10px" runat="server" Text="Signature of the Candidate"></asp:Label>
                                            </td>
                                        </tr>
                                        </table>

                                </div>
                            </div>
                            <%----------End Document Section ---------%>
                        </div>
                    </div>
                    <div style="width: 780px; margin: 5px auto; font-weight: bolder; font-size: 15px; text-align: center; padding: 5px 0; border: 2px solid #000; border-left: none; border-right: none;display:none;">
                        (DU 01234567) The Candidate has to bring a copy of e-receipt to the examination centre.<br />
                        (This is a sample copy only for reference of students. For more details see Clause-6.1)

                    </div>
                    <div style="width: 780px; margin: 25px auto; font-size: 14px">
                        <b style="font-size: 14px;">INSTRUCTIONS TO THE CANDIDATES FOR ENTRANCE EXAMINATION</b>
                        <ul>
                            <li>The candidates shall be present at the Examination Centre with admit card by 10:00 A.M.</li>
                            <li>No candidate will be allowed to enter into the Entrance Examination Hall after 15 minutes of commencement of the Examination.</li>
                            <li>All candidates should continue to stay in the examination hall till the examination is over.</li>
                            <li>Adopting unfair means or indulging in any objectionable conduct in the examination hall will make the candidate liable to be debarred from the examination.</li>
                            <li>Mobile phone, calculator & other electronic gadgets etc. are strictly prohibited in the Examination Centre. </li>
                            <li>Obey the instructions of the Centre Superintendent and University authorized officials at the examination centre.</li>
                            <li><b>The request for change of centre of examination will not be entertained.</b></li>
                            <li><b>No negative marks for incorrect answer.</b></li>
                            <li><b>No marks will be awarded for multiple response to single question.</b></li>
                        </ul>
                        <b>NOTE: </b><span style="margin-left:5px;">Bring ID Proof in original to the Examination Centre for verification (reference see Clause No.- 5.5 of the Prospectus).</span><br />

                        <br />
                        <asp:Label ID="lblMsg" runat="server" Style="color: red; font-size: 20px;" Text=""></asp:Label>
                    </div>

                    <%--<div class="clear" style="page-break-before: always;">
                        &nbsp;
                    </div>--%>
                </div>
                <%---Start of Button----%>
                <div class="clearfix">
                    <div class="col-md-12 box-container" id="divBtn">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <input type="button" id="btnPrint" class="btn btn-success" value="Print" onclick="javascript: EPassPrint('divPrint');" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <br />
                <br />
                <%----END of Button-----%>
            </div>
    </form>
</body>
</html>
