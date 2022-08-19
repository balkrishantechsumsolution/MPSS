<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhysicalPass.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OISF.PhysicalPass" %>

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
                    url: '/WebApp/Kiosk/OISF/OISF_Closed.aspx/EPassLog',
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
                    
                </div>
                <div id="divPrint" style="margin: 0 auto; width: 800px;height: 701px; /*height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; height: 591px; width: 794px; padding: 3px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 0 auto; height: 585px; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-size: 300px; background-repeat: no-repeat; background-position: center center;">
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
                                        <td>
                                            <div style="width: 75px; text-align: center; margin: 0 auto;"></div>
                                            <uc1:QRCode runat="server" ID="QRCode1" style="width: 80px !important" />

                                        </td>
                                        <td style="width:155px;border-left: 1px solid #999;font-size:9px;vertical-align:bottom;height: 113px;">
                                            Seal Stamp & Date<br />with inital of the Officer-in-charge</td>
                                    </tr>
                                </table>
                            </div>
                            <%----------End Header section ---------%>
                            <%---------Start Title section --------%>
                            <div style="display:block;text-align: center;overflow:auto;font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                              <div style="float:left;text-align: left;width: 500px;">  <span style="text-align: center; font-size: 22px; font-weight: bold; color: #fff;">E-Pass for SIRB Examination&nbsp; 2016-17</span>
                                </div><div style="float:right;width: 250px;text-align: right;"><b>Roll No.: </b><asp:Label runat="server" ID="lblRollNo" Style="font-weight: bolder; text-transform: none;white-space:nowrap;"></asp:Label></div></div>
                            <%----------End title section ---------%>
                            <%---------Start Applicant Section --------%>
                            <div style="margin: 5px auto; width: 770px; font-size: 13px;">
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                            <b style="text-transform: uppercase;">Applicant Details</b></td>
                                        <td rowspan="7" style="padding: 0; border: 1px solid #999; text-align: center; width: 135px;">
                                            <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 130px; height: 160px" id="ProfilePhoto" />
                                            <br />
                                            <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto0" style="margin: 1px; width: 130px; height: 54px;" id="ProfileSign" /></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width:100px; ">
                                            <asp:Label ID="Label5" runat="server" Text="Reference ID"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblAppID" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 100px; white-space: nowrap;">
                                            <asp:Label ID="Label7" runat="server" Text="Application Date"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblAppDate" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap; ">
                                            <asp:Label ID="Label28" runat="server" Text="Applicant Name"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 175px; ">
                                            <asp:Label ID="lblAppname" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblFather1" runat="server">Father's Name</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 175px; ">
                                            <asp:Label ID="lblFather" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr style="display:none;">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; ">Mobile No.</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Email ID</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 0; border: 1px solid #999; text-align: left;" colspan="4">
                                            <table style="width: 100%;" cellspacing="0" cellpadding="5" class="">
                                                <tr>
                                                    <td style="border-right: 1px solid #999; width: 113px;padding-left:5px;white-space:nowrap">
                                                        <asp:Label ID="Label29" runat="server" Text="Date of Birth (Age)"></asp:Label>
                                                    </td>
                                                    <td style="border-right: 1px solid #999;width: 150px;padding-left:5px;white-space:nowrap">
                                                        <asp:Label ID="lblDOB" runat="server"></asp:Label> (<asp:Label ID="lblAge" runat="server"></asp:Label>)
                                                    </td>                                                                                                       
                                                    <td style="border-right: 1px solid #999; white-space: nowrap; width: 130px;padding-left:5px">
                                                        <asp:Label ID="lblFather0" runat="server">Religion (Category)</asp:Label>
                                                    </td>
                                                    <td style="padding-left:5px;width: 166px;">
                                                        <asp:Label ID="lblCategory" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                            <b style="text-transform: uppercase;">Examination Venue Details</b></td>
                                    </tr>
                                    <tr style="">
                                        <td style="border: none;"colspan="4">
                                            <div style="clear: both; margin: 0; padding: 0; width: 100%">
                                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                    <tr>
                                                        <td style="width: 90px; border-left: 1px solid #999;border-right: 1px solid #999; border-bottom: 1px solid #999; padding: 5px; text-align: center; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium;"  rowspan="2">
                                                            <asp:Label ID="Father" runat="server">Venue Name <br />&<br />Address</asp:Label>
                                                            
                                                        </td>
                                                        <td style="width: 200px;padding: 5px; border: 1px solid #999; text-align: left;border-top:none;" rowspan="2">
                                                            <asp:Label ID="lblVenue" runat="server" Text=""></asp:Label>
                                                            
                                                        </td>
                                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 124px;border-top:none;">
                                                            <asp:Label ID="lblBPLYear" Font-Size="12px" runat="server" Text="Date of Examination"></asp:Label></td>
                                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 120px;border-top:none;border-right:none;">
                                                            <asp:Label ID="lblDate" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                            <asp:Label ID="lblBPLYear0" Font-Size="12px" runat="server" Text="Reporting Time "></asp:Label></td>
                                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;border-right:none;">
                                                            <asp:Label ID="lblTime" runat="server">6:00 AM (Morning)</asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>

                                            </div>
                                        </td>
                                    </tr>
                                    </table>
                                    
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;font-family:Arial;font-size:12px;">
                                    <tr>
                                        <td style="text-transform: uppercase;border: 1px solid #999; padding: 5px; text-align: left;font-size:13px;font-weight:bolder;" colspan="9">
                                            Event Details</td>
                                    </tr>
                                    <tr style="font-weight:bold;">
                                        <td style="border: 1px solid #999; padding: 5px; width: 45px">
                                            Event
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 175px;white-space:nowrap">Event Name</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center;"  colspan="2">Result</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;border-bottom:none;border-top:none" rowspan="6">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 45px">Event</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 175px;white-space:nowrap">Event Name</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center;" colspan="2">Result</td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 5px; width: 45px">
                                            A.</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Physical Measurment</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">Qualified</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">Disqualified</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 45px">B.</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Bio-metric</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">Done</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 5px; width: 45px">
                                            C.</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Medical Fitness</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">Fit</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">Unfit</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 45px">D.</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Rope Climbing</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">Qualified</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">Disqualified</td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 5px; width: 45px">
                                            E.</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">High Jump</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">Qualified</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">Disqualified</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 45px">F.</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Broad Jump</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">Qualified</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">Disqualified</td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 5px; width: 45px">
                                            G.</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Running (1.6 KM)</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">Qualified</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">Disqualified</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 45px">H.</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Cross Country</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">Qualified</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">Disqualified</td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 5px; width: 45px">
                                            I.</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Swimming</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">Qualified</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">Disqualified</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 45px">J.</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Driving (if applicable)</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">Qualified</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;width: 20px;">Disqualified</td>
                                    </tr>
                                    </table>
                            </div>
                            <%----------End Document Section ---------%>
                        </div>
                    </div>
                    
                    <div style="width:780px; margin:5px auto;font-size:12px">
                        <b>Note: </b><span>Candidates have to produce the e-Pass to the examiner before commencement of each event.</span><br />
                        <span style="margin-left:35px;">The e-Pass will be seized immediately by the examiner in case the candidate is disqualified in any event.</span><br />
                    <span style="margin-left:35px;">The candidates are required to arrange their own accommodation. The State Selection Board will not provide any accommodation<br />&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;facilities to the candidates at any venue.</span><br />
                    <span style="margin-left:35px;">Candidates are requested to bring Medical Fitness Certificate from <b>CDMO / Medical Officer</b> of their District Hdqrs to participate in the<br />&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;recruitment test.</span>
                        <br />
                        <br />
                <asp:Label ID="lblMsg" runat="server" style="color:red; font-size:20px;" Text=""></asp:Label>
                    </div>
                    <%--<div class="clear" style="page-break-before: always;">
                        &nbsp;
                    </div>--%>

                </div>
                <%---Start of Button----%>
                <div class="">
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
