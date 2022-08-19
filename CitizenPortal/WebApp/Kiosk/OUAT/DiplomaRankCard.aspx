<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DiplomaRankCard.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.DiplomaRankCard" %>

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
        .auto-style1 {
            font-weight: bold;
        }
    </style>
    
    </head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="box-body box-body-open">
                <div id="" style="margin: 10px auto;  width: 1000px; height: 50px; /*height: 1220px; overflow: auto; */">
                </div>
                <div id="divPrint" style="margin: 0 auto; width: 800px;margin-bottom:60px; /*height: 1080px; height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; height: 1033px; width: 794px; padding: 2px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 0 auto; height: 1025px; width: 785px; border: 1px solid #000; background-image: url('../images/ouatlogobg.png'); background-size: 400px; background-repeat: no-repeat; background-position: center center;">
                            <%---------Start Header section --------%>
                            <div style="height: 95px; width: 100%; border-bottom: 1px solid #999;">
                                <table style="width: 100%; vertical-align: middle; text-align: center;">
                                    <tr>
                                        <td>
                                            <img alt="Logo" src="/webApp/kiosk/Images/OUAT.png" style="width: 70px; margin: 10px 0 0 6px;" />
                                        </td>
                                        <td style="text-align: center; vertical-align: middle;">

                                            <br />
                                            <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 18px; font-weight: bolder; text-transform: none;">ORISSA UNIVERSITY OF AGRICULTURE AND TECHNOLOGY
                                                <br />BHUBANESWAR–751003
                                            </asp:Label>
                                            <br />
                                            <asp:Label runat="server">Counselling for Admission into AgroPolytechnic Diploma Courses - 2017</asp:Label>
                                        </td>
                                        <td>
                                            <div style="width: 75px; text-align: center; margin: 0 auto;"></div>
                                            <uc1:QRCode runat="server" ID="QRCode1" style="width: 80px !important" />

                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <%----------End Header section ---------%><%---------Start Title section --------%>
                            <div style="display: block; text-align: center; overflow: auto; font-size: 20px; font-weight: bolder; padding: 2px; text-transform: uppercase; background-color: #808080; color: #fff;">
                                <div style="text-align: center; width: 500px;margin:0 auto">
                                    <span style="text-align: center; font-size: 20px; font-weight: bold; color: #fff;">INTIMATION-CUM-RANK CARD-2017</span>&nbsp;
                                </div>
                                <%--<div style="float: right; width: 250px; text-align: right;">
                                </div>--%>
                            </div>
                            <%----------End title section ---------%><%---------Start Applicant Section --------%>
                            <div style="margin: 5px auto; width: 770px; font-size: 12px;">
                                <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0;font-size:11px;">
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;" colspan="4">
                                            <b style="text-transform: uppercase;">Applicant Details</b></td>
                                        <td rowspan="6" style="padding: 0; border: 1px solid #999; text-align: center; vertical-align: top;width: 70px;">
                                            <img runat="server" src="" name="ProfilePhoto" style="margin: 1px; width: 65px;" id="ProfilePhoto" /><br />
                                            <img runat="server" src="" name="ProfilePhoto0" style="margin: 1px; width: 65px;" id="ProfileSign" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 100px;">
                                            <asp:Label ID="Label5" runat="server" Text="Application No."></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblAppID" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; white-space: nowrap; width: 100px;">
                                            <asp:Label ID="Label7" runat="server" Text="Application Date"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblAppDate" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                            <asp:Label ID="Label28" runat="server" Text="Applicant Name"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 175px;">
                                            <asp:Label ID="lblAppname" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblGender0" runat="server">Gender</asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; ">
                                            <asp:Label ID="lblGender" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                            Email ID</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 250px;">
                                            <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                            </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">Mobile No.</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; ">
                                            <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                            <asp:Label ID="Label29" runat="server" Text="Date of Birth"></asp:Label>
                                            &nbsp;(<asp:Label ID="lblFather0" runat="server">Age</asp:Label>
                                            )</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 250px;">
                                            <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                            &nbsp;(<asp:Label ID="lblAge" runat="server"></asp:Label>
                                            )</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">Category</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; ">
                                            <asp:Label ID="lblCategory" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                            Provisional Weightage</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 250px;">
                                            <asp:Label ID="lblWeightage" runat="server"></asp:Label>
                                            </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">Rank</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; ">
                                            <asp:Label ID="lblRank" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border: none" colspan="5">
                                            <asp:Label ID="lblFather2" runat="server" Visible="False">Mother's Name</asp:Label>
                                            <asp:Label ID="lblMother" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="lblFather1" runat="server" Visible="False">Father's Name</asp:Label>
                                            <asp:Label ID="lblFather" runat="server" Visible="False"></asp:Label>
                                    <asp:Label runat="server" ID="lblRollNo" Style="font-weight: bolder; text-transform: none; white-space: nowrap;" Text=""></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                                
                                <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: none; font-family: Arial; font-size: 11px;">
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;" colspan="6">
                                            <b style="text-transform: capitalize">RANK DETAILS</b></td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;width:100px">Category</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">GEN </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">ST</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">SC</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">GCH</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">PH</td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">Rank</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankGen" runat="server">0</asp:Label>
                                            </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankST" runat="server">0</asp:Label>
                                            </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankSC" runat="server">0</asp:Label>
                                            </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankGCH" runat="server">0</asp:Label>
                                            </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankPH" runat="server">0</asp:Label>
                                            </td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 2px; border: none; text-align: left;" colspan="6">&nbsp;</td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">Venue</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;" colspan="5">
                                            <asp:Label ID="lblVenue" runat="server" style="font-size:11px;font-weight:bold;white-space:nowrap" Text="Dr. M.S. Swaminathan Conference Hall, 2nd Floor, OUAT Administrative Building, Bhubanesware-3"></asp:Label>

                                        </td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 2px; border: none; text-align: left;" colspan="6">&nbsp;</td>
                                    </tr>
                                </table>
                                
                                
                                <table cellspacing="0" class="" style="width: 100%; border: none; font-family: Arial; font-size: 11px;">
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;" colspan="6">
                                            <b>COUNSELLING DETAILS</b></td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; ">SL.</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;" class="auto-style1">Date</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center; " class="auto-style1">Category</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center; " class="auto-style1">Seats</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center; " class="auto-style1">Rank</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center; ">Reporting Time</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;" rowspan="2">1.</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;" rowspan="2">17.08.2017</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;" rowspan="2">General</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;" rowspan="3">143</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">01 - 200</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">09:00 - 09:30 am</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">201 - 420</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">02:30 - 03:00 pm</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;" rowspan="5">2.</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;" rowspan="5">18.08.2017</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">General</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">421 - 569</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">09:00 - 09:30 am</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">Schedule Caste</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">17</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;" rowspan="4">All
                                            <br />
                                            Candidate</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">12:00 - 12:30 pm</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">Schedule Tribe</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">23</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">02:30 - 03:00 pm</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">Physically Handicap</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">07</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">03:30 - 04:00 pm</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">Green Card Holder</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">10</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">03:30 - 04:00 pm</td>
                                    </tr>
                                </table>
                                

                                <div>

                                    <table style="font-size: 11px; width: 100%">
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><b>Note:</b></td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top; text-align: left; width: 25px;">1.</td>
                                            <td style="vertical-align: top; text-align: left;">Candidate seeking admission into Diploma Course in Agro-Polytechnic under OUAT  based on their merit should bring <b>Demand Draft of Rs. 7574/-(Rupees seven thousand five hundred seventy four only)  of any Nationalized Bank drawn in favour of “COMPTROLLER, OUAT”, Bhubaneswar, payable at Bhubaneswar </b>should be deposited by the candidate at the time of  Admission. Payment can also be made by SBI collect through net banking facility available in Counseling Hall.</td>
                                        </tr>
                                        

                                    </table>
                                    
                                    <table style="font-size: 11px; width: 100%">
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><b>DOCUMENTS IN ORIGINAL &  PHOTO COPY (ONE SET SELF ATTESTED) REQUIRED AT THE TIME OF ADMISSION:</b></td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top; text-align: left; width: 25px;">1.</td>
                                            <td style="vertical-align: top; text-align: left;"><b>Print out of Online submitted Application Form with photocopy of relevant documents.</b></td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top; text-align: left;">2.</td>
                                            <td style="vertical-align: top; text-align: left;">Mark Sheet & Certificate of 10th and +2 Science/equivalent.</td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top; text-align: left;">3.</td>
                                            <td style="vertical-align: top; text-align: left;">College Leaving Certificate, Conduct Certificate and Migration Certificate from the Head of Institution last attended.</td>
                                        </tr>                                       
                                        <tr>
                                            <td style="vertical-align: top; text-align: left;">4.</td>
                                            <td style="vertical-align: top; text-align: left;">Documents in support of Reserved Category, if any.(ST/SC/GCH/PH)</td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top; text-align: left;">5.</td>
                                            <td style="vertical-align: top; text-align: left;">Domicile/Residential Certificate for Inside State Candidates residing Outside Odisha and for those candidates who do not have odia in HSC/equivalent level.</td>
                                        </tr>                                       
                                        <tr>
                                            <td style="vertical-align: top; text-align: left;">6.</td>
                                            <td style="vertical-align: top; text-align: left;">Medical Certificate in prescribed format (Annexure-II of the AgroPolytechnic prospectus)</td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top; text-align: left;">7.</td>
                                            <td style="vertical-align: top; text-align: left;">Self declaration – For discontinuation of study (in prescribed proforma, Annexure-III).</td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top; text-align: left;">8.</td>
                                            <td style="vertical-align: top; text-align: left;">Aadhaar Card</td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top; text-align: left;">9.</td>
                                            <td style="vertical-align: top; text-align: left;">Permission Letter from the employer in case of  In-Service Candidate.</td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top; text-align: left;">10.</td>
                                            <td style="vertical-align: top; text-align: left;">Five Passport size Photographs as used in admit card.</td>
                                        </tr>
                                    </table>
                                    
                                    <div style="clear: both;  padding: 0; width: 100%;">
                                        <table cellspacing="0" class="" style="width: 100%; border: 0;margin-top: -80px;">
                                            <tr>
                                                <td style="padding: 2px; text-align: center; white-space: nowrap;"></td>
                                                <td style="padding: 2px; text-align: left; white-space: nowrap; height: 70px; width: 250px;">&nbsp;</td>
                                                <td style="border: 1px solid #999; border: none; padding: 2px; text-align: left; white-space: nowrap; text-align: center; width: 250px;">
                                                    <img runat="server" src="../Images/Chairman_signature_ouat.png" name="ProfilePhoto1" style="margin: 1px; width: 130px; height: 54px;" id="OUATAddRegSig" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="">
                                                    <asp:Label ID="Label30" Font-Size="10px" runat="server" Text=""></asp:Label></td>
                                                <td style="">&nbsp;</td>
                                                <td style="border: 1px solid #999; border: none; text-align: center; vertical-align: bottom; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium;">
                                                    <asp:Label ID="Label11" Font-Size="10px" runat="server" Text="Signature of the Chaiman Admission Board"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>

                                    </div>
                                    
                                    <table style="font-size: 11px; width: 100%;">
                                        <tr>
                                            <td colspan="2"><b>N.B.:</b></td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top; text-align: left; width: 25px">1.</td>
                                            <td style="vertical-align: top; text-align: left; font-weight: bold; font-style: initial;"><u>This intimation is not ensuring any seat but only to attend the counseling for admission. Admission  depends on availability of seat and the candidates’ eligibility after verification of original documents.</u></td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top; text-align: left;">2.</td>
                                            <td style="vertical-align: top; text-align: left;font-weight: bold;"><u>The Admission Board reserves the right to deny admission to any candidate who has submitted wrong information in APPLICATION FORM</u></td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top; text-align: left;">2.</td>
                                            <td style="vertical-align: top; text-align: left;">Once a candidate is admitted into a Course on exercising option before the Admission Board, change over to another course shall not be allowed under any circumstances.</td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top; text-align: left;">3.</td>
                                            <td style="vertical-align: top; text-align: left;">This card is to be signed and submitted in original at the time of counseling.</td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top; text-align: left;">4.</td>
                                            <td style="vertical-align: top; text-align: left;">A copy of the rank card may be retained by the candidate for future requirement.</td>
                                        </tr>
                                    </table>

                                    <br />
                                    <asp:Label ID="lblMsg" runat="server" Style="color: red; font-size: 20px;" Text=""></asp:Label>
                                </div>

                            </div>
                            <%----------End Document Section ---------%>
                        </div>
                    </div>

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
