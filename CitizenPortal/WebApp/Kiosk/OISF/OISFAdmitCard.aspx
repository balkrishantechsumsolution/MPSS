<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OISFAdmitCard.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OISF.OISFAdmitCard" %>

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
                    url: '/WebApp/Kiosk/OISF/OISFAdmitCard.aspx/EAdmitCardLog',
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
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="box-body box-body-open">
                <div id="" style="margin: 10px auto; width: 800px;height: 50px; /*height: 1220px; overflow: auto; */">
                    <div class="">
                    <div class="col-md-12 box-container" id="divBtn1">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <input type="button" id="btnPrint1" class="btn btn-success" value="Print" onclick="javascript: EPassPrint('divPrint');" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                </div>
                <div id="divPrint" style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; height: 545px; width: 794px; padding: 3px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 0 auto; height: 535px; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-size: 300px; background-repeat: no-repeat; background-position: center center;">
                            <%---------Start Header section --------%>
                            <div style="height: 114px; width: 100%; border-bottom: 1px solid #999;">
                                <table style="width: 100%; vertical-align: middle; text-align: center;">
                                    <tr>
                                        <td>
                                            <img alt="Logo" src="img/odisha_policelogo.jpg" style="width: 90px;" />
                                        </td>
                                        <td style="text-align: center;vertical-align:middle;">
                                            
                                            <span style="text-align: center; font-size: 15px; font-weight: bold; color: #d43300;">COMMON APPLICATION PORTAL</span>
                                            <br />
                                            <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 18px; font-weight: bolder; text-transform: none;">Recruitment of Constable in 9th SIRB - 2016-17</asp:Label>
                                            </td>
                                        <td style="width: 155px; font-size: 9px; vertical-align: middle; text-align:center; height: 113px;">
                                            <div style="width: 75px; text-align: center; margin: 0 auto;"></div>
                                            <uc1:QRCode runat="server" ID="QRCode1" style="width: 80px !important" />

                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <%----------End Header section ---------%>
                            <%---------Start Title section --------%>
                            <div style="display:block;text-align: center;overflow:auto;font-size: 20px; font-weight: bolder; padding: 5px; background-color: #808080; color: #fff;">
                              <div style="float:left;text-align: left;width: 475px;">  <span style="text-align: center; font-size: 22px; font-weight: bold; color: #fff;">e-Pass for Written Examination&nbsp; 2016-17</span>
                                </div><div style="float:right;width: 250px;text-align: right;"><b>Roll No.: </b><asp:Label runat="server" ID="lblRollNo" Style="font-weight: bolder; text-transform: none;white-space:nowrap;"></asp:Label></div></div>
                            <%----------End title section ---------%>
                            <%---------Start Applicant Section --------%>
                            <div style="margin: 5px auto; width: 770px; font-size: 13px;">
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td rowspan="7" style="padding: 0; border: 1px solid #999; text-align: center; width: 135px;">
                                            <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 130px; height: 160px" id="ProfilePhoto" />
                                            <br />
                                            <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto0" style="margin: 1px; width: 130px; height: 54px;" id="ProfileSign" /></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                            <b style="text-transform: uppercase;">Applicant Details</b></td>
                                        
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 100px;">
                                            <asp:Label ID="Label5" runat="server" Text="Reference ID"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblAppID" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 100px; white-space: nowrap;">
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
                                            <asp:Label ID="lblFather1" runat="server">Father's Name</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                            <asp:Label ID="lblFather" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr style="display: none;">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Mobile No.</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Email ID</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 0; border: 1px solid #999; text-align: left;" colspan="7">
                                            <table style="width: 100%;" cellspacing="0" cellpadding="5" class="">
                                                <tr>
                                                    <td style="padding: 5px 0; border-right: 1px solid #999; width: 113px; padding-left: 5px; white-space: nowrap">
                                                        <asp:Label ID="Label29" runat="server" Text="Date of Birth (Age)"></asp:Label>
                                                    </td>
                                                    <td style="border-right: 1px solid #999; width: 150px; padding-left: 5px; white-space: nowrap">
                                                        <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                                        (<asp:Label ID="lblAge" runat="server"></asp:Label>)
                                                    </td>
                                                    <td style="border-right: 1px solid #999; white-space: nowrap; width: 130px; padding-left: 5px">
                                                        <asp:Label ID="lblFather0" runat="server" Visible="False">Religion (Category)</asp:Label>
                                                    </td>
                                                    <td style="padding-left: 5px; width: 166px;">
                                                        <asp:Label ID="lblCategory" runat="server" Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                            <b style="text-transform: uppercase;">WritteN Examination Centre Details</b></td>
                                    </tr>
                                    <tr style="">
                                        <td style="border: none;" colspan="4">
                                            <div style="clear: both; margin: 0; padding: 0; width: 100%">
                                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                    <tr>
                                                        <td style="width: 90px;border:none !important; border-bottom:1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999 !important; padding: 5px; text-align: center; white-space: nowrap;" rowspan="2">
                                                            <asp:Label ID="Father" runat="server">Center Name <br />&<br />Address</asp:Label>

                                                        </td>
                                                        <td style="width: 200px; padding: 5px; border: 1px solid #999; text-align: left; border-top: none;" rowspan="2">
                                                            <asp:Label ID="lblVenue" runat="server" Text=""></asp:Label>

                                                        </td>
                                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 124px; border-top: none;">
                                                            <asp:Label ID="lblBPLYear" Font-Size="12px" runat="server" Text="Date of Examination"></asp:Label></td>
                                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; border-top: none;">
                                                            <asp:Label ID="lblDate" runat="server">09-04-2017</asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                            <asp:Label ID="lblBPLYear0" Font-Size="12px" runat="server" Text="Reporting Time "></asp:Label></td>
                                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                            <asp:Label ID="lblTime" runat="server">7:00 - 8:00 AM</asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>

                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <div style="clear: both; margin: 0; padding: 0; width: 100%">
                                    <div style="width: 769px; margin: 5px auto; font-size: 11px; border: 1px solid #999; padding: 5px; line-height: 15px;">
                                        <div><b>Note: </b></div>
                                        <div style="margin-left: 45px; margin-top: -15px;">
                                            •	Candidates have to produce the <b>e-Pass</b> before entry to examination centre. 
                            <br />
                                            •	No candidates without e-Pass will be allowed to enter in the examination hall.
                            <br />
                                            •	The candidates are requested to bring the e-Pass, <b>one passport size photograph</b> (should be same as in the e-Pass for Physical Measurement/Physical Efficiency Test) to be pasted in the Attendance Sheet.
                            <br />
                                            •	One Black/Blue ball Point Pen, one Hard Card Clip Board to hold an A-4 size OMR Sheet. 
                            <br />
                                            •	The Hard Card Clip Board should not have any writing/scribbling on it. 
                            <br />
                                            •	No electronic gadgets like Cell Phone, Blue tooth device, calculator etc. shall be allowed to the Examination Hall.
                            <br />
                                            •	Candidates will keep their luggage on their own risk before entry to examination hall. Any missing the Board shal not be held responsible.
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%----------End Document Section ---------%>
                        </div>
                    </div>
                    <asp:Label ID="lblMsg" runat="server" Style="color: red; font-size: 20px;" Text=""></asp:Label>                    

                    <div style="width: 793px; margin: 5px auto;">
                        <table cellpadding="5" cellspacing="0" class="" style="border: 0; font-size: 12px;font-family:Arial;">
                            <tr>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; padding: 3px; text-align: center; border-top: 1px solid #999" colspan="4">
                                    <b style="text-transform: uppercase;">Instruction for Written Examination </b></td>
                            </tr>
                            <tr>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; padding: 3px; text-align: center; border-top-style: none; border-top-color: inherit; border-top-width: medium;width:50%; font-weight: bolder" colspan="2">DO&#39;s</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; padding: 3px; text-align: center; border-top-style: none; border-top-color: inherit; border-top-width: medium;width:50%; font-weight: bolder" colspan="2">DONT&#39;s</td>
                            </tr>
                            <tr>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">1.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">Reach the Written Examination Centre before time in order to avoid last minute rush and traffic jam in route and congestion.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">1.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">Don’t reach late at the Written Examination venue.</td>
                            </tr>
                            <tr>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">2.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">Reach the City where the examination venue is located preferably before night to avoid last minute rush.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">2.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">Don’t eat spicy, masla, oily and fast food to avoid any type of stomach problems prior and during the Written Examination.</td>
                            </tr>
                            <tr>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">3.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">Always keep wet towel, cap, drinking water, ORS, Glucose etc to avoid sunstroke due to rising heat of summer.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">3.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">Any cheating or cross talking during the examination will result in disqualification.</td>
                            </tr>
                            <tr>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">4.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">Maintain queue at the entrance Gate to avoid unnecessary chaos.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">4.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">Don’t bring any electronic gadgets such as Mobile, Blue Tooth Device, Calculator , chits etc. to examination Hall/room or Gallery, as it will result in disqualification.</td>
                            </tr>
                            <tr>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">5.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">Visit the written Examination venue prior to the day of the Written Examination date to know the exact location of the venue.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">5.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">Avoid to bring unnecessary luggage, bags etc. to Examination Venue as there will be no safe place to keep them during the Written Examination time. You should make your own arrangement in this regard.</td>
                            </tr>
                            <tr>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">6.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">Take the help of Google Maps/GPS, our Help Desk at Railway Station/Bus Stand of Cuttack and Bhubaneswar to know the location of Written Examination venue.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">6.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">If any middle man/tout try to mislead you then contact the Board members immediately. You should not believe any tout.</td>
                            </tr>
                            <tr>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">7.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">As advertised earlier keep the necessary documents/articles like e-Pass for Written Examination, Hard Card Board (A-4 Size),Colour pass port size Photograph/Black/Blue Ball point pen etc required for Written Examination. </td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">7.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">Don’t take any type of tobacco/alcohol/drugs during the Written Examination time.</td>
                            </tr>
                            <tr>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">8.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">Know your Seating Arrangement inside the venue from the Flex Board outside the main gate of each venue.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">8.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">Don’t write any type of symbol, marks etc. on the OMR Sheet. It will to result in disqualification.</td>
                            </tr>
                            <tr>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">9.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">Maintain silence in the examination hall/rooms or gallery to listen to the instruction about OMR pattern Written Examination carefully.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">&nbsp;</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">10.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">Go through the tutorial uploaded in the website https://lokaseba-odisha.in to know how to fill up the OMR Sheet.</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">&nbsp;</td>
                                <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;padding:3px;text-align: left; vertical-align: middle; border-top-style: none; border-top-color: inherit; border-top-width: medium;">&nbsp;</td>
                            </tr>
                        </table><br />
                    </div>
                    <%--<div class="clear" style="page-break-before: always;">
                        &nbsp;
                    </div>
                    <div style="margin: 0 auto; height: 1100px; width: 794px; padding: 3px; border: 3px solid #000; padding: 5px;">
                        <img src="img/Map-KIIT-U.jpg" style="width: 777px;text-align:center" />
                    </div>--%>
                </div>
                <%---Start of Button----%>
                <div style="margin-top:20px;">
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
        </div>
    </form>
</body>
</html>
