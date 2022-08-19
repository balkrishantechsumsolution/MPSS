<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProvisionalMark.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.ProvisionalMark" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/Scripts/jquery-2.2.3.min.js"></script>
    <link href="../../Styles/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/CommonScript.js"></script>
    <script>
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
        <div>
            <div class="box-body box-body-open">
                <div id="" style="margin: 10px auto; width: 1000px; height: 50px; /*height: 1220px; overflow: auto; */">
                </div>
                <div id="divPrint" style="margin: 0 auto; width: 800px; /*height: 1080px; height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; height: 750px; width: 794px; padding: 3px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 0 auto; height: 740px; width: 785px; border: 1px solid #000; background-image: url('../images/ouatlogobg.png'); background-size: 400px; background-repeat: no-repeat; background-position: center center;">
                            <%---------Start Header section --------%>
                            <div style="height: 114px; width: 100%; border-bottom: 1px solid #999;">
                                <table style="width: 100%; vertical-align: middle; text-align: center;">
                                    <tr>
                                        <td>
                                            <img alt="Logo" src="/webApp/kiosk/Images/OUAT.png" style="width: 80px; margin: 10px 0 0 6px;" />
                                        </td>
                                        <td style="text-align: center; vertical-align: middle;">

                                            <br />
                                            <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 18px; font-weight: bolder; text-transform: none;">ORISSA UNIVERSITY OF AGRICULTURE AND TECHNOLOGY
                                                <br />BHUBANESWAR–751003
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <div style="width: 75px; text-align: center; margin: 0 auto;"></div>
                                            <uc1:QRCode runat="server" ID="QRCode1" style="width: 80px !important" />

                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <%----------End Header section ---------%><%---------Start Title section --------%>
                            <div style="display: block; text-align: center; overflow: auto; font-size: 18px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                                <div style="float: left; text-align: center; width: 500px;">
                                    <span style="text-align: center; font-size: 18px; font-weight: bold; color: #fff;">OUAT UG Provisional Weightage &amp; RANK-2017</span>&nbsp;
                                </div>
                                <div style="float: right; width: 250px; text-align: right;">
                                    <b>Roll No.: </b>
                                    <asp:Label runat="server" ID="lblRollNo" Style="font-weight: bolder; text-transform: none; white-space: nowrap;" Text="AK041004"></asp:Label>
                                </div>
                            </div>
                            <%----------End title section ---------%><%---------Start Applicant Section --------%>
                            <div style="margin: 5px auto; width: 770px; font-size: 13px;">
                                <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                            <b style="text-transform: uppercase;">Applicant Details</b></td>
                                        <td rowspan="5" style="padding: 0; border: 1px solid #999; text-align: center; vertical-align: top;" class="auto-style2">
                                            <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 130px;" id="ProfilePhoto" />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 100px;">
                                            <asp:Label ID="Label5" runat="server" Text="Application No."></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblAppID" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap;">
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
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                            <asp:Label ID="lblAppname" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
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
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 250px;">
                                            <asp:Label ID="lblMother" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Mobile No.</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                            <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr style="">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblFather1" runat="server">Father's Name</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblFather" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">
                                            <asp:Label ID="Label29" runat="server" Text="Date of Birth"></asp:Label>
                                            &nbsp;(<asp:Label ID="lblFather0" runat="server">Age</asp:Label>
                                            )</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                            &nbsp;(<asp:Label ID="lblAge" runat="server"></asp:Label>
                                            )</td>
                                    </tr>
                                    <tr style="">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Email ID</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                            <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                            <asp:Label ID="lblCategory" runat="server" Visible="False"></asp:Label>
                                        </td>
                                        <td rowspan="2" style="padding: 0; border: 1px solid #999; text-align: center; vertical-align: top;" class="auto-style2">
                                            <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto0" style="margin: 1px; width: 130px; height: 54px;" id="ProfileSign" /></td>
                                    </tr>
                                    <tr style="">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Exam Center</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                            <asp:Label ID="lblVenue" runat="server" Text=""></asp:Label>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border: none" colspan="5">&nbsp;</td>
                                    </tr>
                                </table>

                                <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: none; font-family: Arial; font-size: 12px;">
                                    <tr>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;" colspan="7">
                                            <b class="text-uppercase">Provisional Weightage For OUAT UG Admission - 2017</b></td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 20px">SL.</td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 120px">Examination</td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 70px">Total Mark</td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 80px">Marks Obtain</td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 70px">Percentage</td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 70px">Weightage</td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">Remarks</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">A</td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">10th Exam.</td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblTM10" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblMO10" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblPER10" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblWEG10" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">25% of the 10th Percentage</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">B</td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">+2 Science
                                            (<asp:Label ID="lblPCMB" runat="server"></asp:Label>

                                            )</td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblTM12" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblMO12" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblPER12" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblWEG12" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">25% of PCM/PCB wbich ever is higher in +2</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">C</td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">OUAT UG Entrance</td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblTMEE" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblMOEE" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblPEREE" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblWEGEE" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">50% of the OUAT UG Entrance-2017</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">D</td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">Total Weightage</td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                            <strong>
                                                <asp:Label ID="lblTOLWEG" runat="server"></asp:Label>

                                            </strong>

                                        </td>
                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: none; font-family: Arial; font-size: 11px;">
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;" colspan="6">
                                            <b style="text-transform: capitalize;font-size: 12px;">PROVISIONAL RANK DETAILS
                                            <b class="text-uppercase">For OUAT UG Admission - 2017</b></b></td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;" colspan="4">WO <span style="font-size: 10px; font-weight: normal;">(Reserved for Horticulture Course, Chiplima)</span></td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">&nbsp;</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">&nbsp;</td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width:90px">Category</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center; width: 55px">GEN </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center; width: 55px">ST</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center; width: 55px">SC</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center; width: 55px">GCH</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center; width: 55px">PH</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center; width: 55px">SC</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center; width: 55px">ST</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center; width: 55px">GCH</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center; width: 55px">GEN</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center; width: 55px">OUAT</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center; width: 55px">NRI</td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">Rank</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankGen" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankST" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankSC" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankGCH" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankPH" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankWOSC" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankWOST" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankWOGCH" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankWOGen" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankOE" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankNRI" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    </table>
                                <br />
                                <div>
                                    <p style="margin: 0"><b>NOTE: </b><span style="margin-left: 5px;">Please refer the Clause No.- 4.2 of OUAT UG Prospectus 2017 for Provisional Weightage formula and calculation.</span></p>
                                    <p style="margin: 0 0 0 50px; display: none"><span style="">2. Any discrepancies in <b style="text-transform: uppercase">Provisional Weightage Calculation</b> only please write e-mail to <b>ouatugentrance@gmail.com</b> with applicant details by 03/07/2017 23:59:59 Hrs. (No request shall be entertained after due date)</span></p>
                                    <br />
                                    <asp:Label ID="lblMsg" runat="server" Style="color: red; font-size: 20px;" Text=""></asp:Label>
                                </div>
                                <div style="clear: both; margin: 0; padding: 0; width: 100%; display: none">
                                    <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0;">
                                        <tr>
                                            <td style="border: 1px solid #999; padding: 5px; text-align: center; white-space: nowrap;">
                                                <img runat="server" src="../Images/asst_registrar_signature_ouat.png" name="ProfilePhoto1" style="margin: 1px; width: 130px; height: 54px;" id="OUATAddRegSig" />
                                                <%--<img runat="server" src="/webApp/kiosk/Images/OUATAddRegSig.png" name="ProfilePhoto1" style="margin: 1px; width: 130px; height: 54px;" id="OUATAddRegSig" />--%></td>
                                            <td style="border: 1px solid #999; padding: 5px; text-align: left; white-space: nowrap; height: 70px; width: 250px;">&nbsp;</td>
                                            <td style="border: 1px solid #999; padding: 5px; text-align: left; white-space: nowrap; text-align: center;">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; text-align: center; vertical-align: bottom; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium;">
                                                <asp:Label ID="Label30" Font-Size="10px" runat="server" Text="Signature of Asst. Registrar (Acd.)"></asp:Label></td>
                                            <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; text-align: center; vertical-align: bottom; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium;">&nbsp;</td>
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


                    <%--<div class="clear" style="page-break-before: always;">
                        &nbsp;
                    </div>--%>
                </div>
                <%---Start of Button----%>
                <div class="clearfix">
                    <div class="col-md-12 box-container" id="divBtn" style="margin: 25px 0;">
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
        </div>
    </form>
</body>
</html>
