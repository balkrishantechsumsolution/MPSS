<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpotAdmission.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.SpotAdmission" %>

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

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="box-body box-body-open">
                <div id="" style="margin: 10px auto; width: 1000px; min-height: 50px;text-align:center;vertical-align:middle; /*height: 1220px; overflow: auto; */">
                                    <asp:Label ID="lblMsg" runat="server" Style="color: red; font-size: 20px;" Text=""></asp:Label>
                                    <br />
                            <asp:Button ID="btnPayment" runat="server" CausesValidation="False" CssClass="btn btn-danger" OnClick="btnPayment_Click" Text="Proceed to Payment" />
                </div>
                <div id="divPrint" style="margin: 0 auto; width: 800px; margin-bottom: 60px; /*height: 1080px; height: 1220px; overflow: auto; */">
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
                                            <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 18px; font-weight: bolder; text-transform: none;">ORISSA UNIVERSITY OF AGRICULTURE AND TECHNOLOGY <br />BHUBANESWAR–751003 </asp:Label>
                                            <br />
                                            <asp:Label runat="server">Spot Admission Application for OUAT UG Courses - 2017</asp:Label>
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
                                <div style="float: left; text-align: center; width: 500px;">
                                    UG SPOT ADMISSION APPLICA<span style="text-align: center; font-size: 20px; font-weight: bold; color: #fff;">TION</span>
                                </div>
                                <div style="float: right; width: 250px; text-align: right;">
                                    <b>Roll No.: </b>
                                    <asp:Label runat="server" ID="lblRollNo" Style="font-weight: bolder; text-transform: none; white-space: nowrap;" Text=""></asp:Label>
                                </div>
                            </div>
                            <%----------End title section ---------%><%---------Start Applicant Section --------%>
                            <div style="margin: 5px auto; width: 770px; font-size: 12px;">
                                <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0; font-size: 11px;">
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;" colspan="4">
                                            <b style="text-transform: uppercase;">Applicant Details</b></td>
                                        <td rowspan="4" style="padding: 0; border: 1px solid #999; text-align: center; vertical-align: top;">
                                            <img runat="server" src="" name="ProfilePhoto" style="margin: 1px; width: 65px;" id="ProfilePhoto" /><br />
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 100px;">
                                            <asp:Label ID="Label5" runat="server" Text="Application No."></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblAppID" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; white-space: nowrap; width: 100px;">
                                            <asp:Label ID="Label7" runat="server" Text="Aadhaar No."></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 150px;">
                                                <asp:Label ID="lblAadhaar" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 100px;">
                                            <asp:Label ID="lblFather1" runat="server">Father's Name</asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblFather" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; white-space: nowrap; width: 100px;">
                                            <asp:Label ID="lblFather2" runat="server">Mother's Name</asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblMother" runat="server"></asp:Label>
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
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblGender" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                            <asp:Label ID="Label29" runat="server" Text="Date of Birth"></asp:Label>
                                            &nbsp;(<asp:Label ID="lblFather0" runat="server">Age</asp:Label>
                                            )</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 175px;">
                                            <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                            &nbsp;(<asp:Label ID="lblAge" runat="server"></asp:Label>
                                            )</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">Category</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblCategory" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 0; border: 1px solid #999; text-align: center; vertical-align: top; width: 70px;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; white-space: nowrap;">Email ID</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 250px;">
                                            <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">Mobile No.</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                        </td>
                                        <td rowspan="2" style="padding: 0; border: 1px solid #999; text-align: center; vertical-align: top;">
                                            <img runat="server" src="" name="ProfilePhoto0" style="margin: 1px; width: 65px; height: 30px" id="ProfileSign" /></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; white-space: nowrap;">Provisional Weightage</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 250px;">
                                            <asp:Label ID="lblProvisional" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">Rank</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblRankGen" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border: none" colspan="5">&nbsp;</td>
                                    </tr>
                                </table>


                                <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: none; font-family: Arial; font-size: 11px; display: none;">
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;" colspan="7">
                                            <b style="text-transform: capitalize">Provisional Weightage For OUAT UG Admission - 2017</b></td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 20px">SL.</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 120px">Examination</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 70px">Total Mark</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 80px">Marks Obtain</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 70px">Percentage</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 70px">Weightage</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">Remarks</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">A</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">10th Exam.</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblTM10" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblMO10" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblPER10" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblWEG10" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">25% of the 10th Percentage</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">B</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">+2 Science
                                            (<asp:Label ID="lblPCMB" runat="server"></asp:Label>

                                            )</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblTM12" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblMO12" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblPER12" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblWEG12" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">25% of PCM/PCB wbich ever is higher in +2</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">C</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">OUAT UG Entrance</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblTMEE" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblMOEE" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblPEREE" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblWEGEE" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">50% of the OUAT UG Entrance-2017</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">D</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">Total Weightage</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                            <strong>
                                                <asp:Label ID="lblTOLWEG" runat="server"></asp:Label>

                                            </strong>

                                        </td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                    </tr>
                                </table>


                                <div>

                                    <div style="clear: both; padding: 0; width: 100%;">
                                        <table style="clear: both; padding: 0; width: 100%; font-size: 13px">
                                            <tr>
                                                <td colspan="3" style="padding: 5px 2px; border: 1px solid #999; text-align: left;"><b>COLLEGE &amp; COURSE PREFERENCE</b></td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 5px 2px; border: 1px solid #999; text-align: left;">
                                                    <label class="manadatory" for="ddlCenter">
                                                        First College Preference</label></td>
                                                <td style="padding: 5px 2px; border: 1px solid #999; text-align: left;">
                                                    <label class="manadatory" for="ddlCenter">
                                                        First College Preference</label></td>
                                                <td style="padding: 5px 2px; border: 1px solid #999; text-align: left;">
                                                    <label class="manadatory" for="ddlCenter">
                                                        First Course Preference</label></td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 5px 2px; border: 1px solid #999; text-align: left;">
                                                    <asp:DropDownList ID="ddlFirstPref" runat="server" Width="220px" AutoPostBack="True" OnSelectedIndexChanged="ddlFirstPref_SelectedIndexChanged">
                                                        <asp:ListItem Selected="True" Text="-Select 1st College Preferance-" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="College of Horticulture, Chiplima" Value="B.Sc. (Hons.) Horticulture"></asp:ListItem>
                                                        <asp:ListItem Text="College of Forestry, Bhubaneswar" Value="B.Sc. (Forestry)"></asp:ListItem>
                                                        <asp:ListItem Text="College of Community Science, Bhubaneswar" Value="B.Sc.(Hons.) Community Science"></asp:ListItem>


                                                    </asp:DropDownList></td>
                                                <td style="padding: 5px 2px; border: 1px solid #999; text-align: left;">
                                                    <asp:Label ID="lblCollegeName" runat="server"></asp:Label>
                                                </td>
                                                <td style="padding: 5px 2px; border: 1px solid #999; text-align: left;">
                                                    <asp:Label ID="lblCourseName" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <div runat="server" id="divPref">
                                            <tr>
                                                <td style="padding: 5px 2px; border: 1px solid #999; text-align: left;">
                                                    <label for="ddlCenter2">
                                                        Second College Preference</label></td>
                                                <td style="padding: 5px 2px; border: 1px solid #999; text-align: left;">
                                                    <label for="ddlCenter2">
                                                        Second College Preference</label></td>
                                                <td style="padding: 5px 2px; border: 1px solid #999; text-align: left;">
                                                    <label for="ddlCenter2">
                                                        Second Course Preference</label></td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 5px 2px; border: 1px solid #999; text-align: left;">
                                                    <asp:DropDownList ID="ddlSeconPref" runat="server" Width="220px" AutoPostBack="True" OnSelectedIndexChanged="ddlSeconPref_SelectedIndexChanged">
                                                        <asp:ListItem Selected="True" Text="-Select 2nd College Preferance-" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="College of Horticulture, Chiplima" Value="B.Sc. (Hons.) Horticulture"></asp:ListItem>
                                                        <asp:ListItem Text="College of Forestry, Bhubaneswar" Value="B.Sc. (Forestry)"></asp:ListItem>
                                                        <asp:ListItem Text="College of Community Science, Bhubaneswar" Value="B.Sc.(Hons.) Community Science"></asp:ListItem>
                                                    </asp:DropDownList></td>
                                                <td style="padding: 5px 2px; border: 1px solid #999; text-align: left;">
                                                    <asp:Label ID="lblCollegeName0" runat="server"></asp:Label>
                                                </td>
                                                <td style="padding: 5px 2px; border: 1px solid #999; text-align: left;">
                                                    <asp:Label ID="lblCourseName0" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td style="padding: 5px 2px; border: 1px solid #999; text-align: left;">
                                                    <label for="ddlCenter3">
                                                        Third College Preference</label></td>
                                                <td style="padding: 5px 2px; border: 1px solid #999; text-align: left;">
                                                    <label for="ddlCenter3">
                                                        Third College Preference</label></td>
                                                <td style="padding: 5px 2px; border: 1px solid #999; text-align: left;">
                                                    <label for="ddlCenter3">
                                                        Third Course Preference</label></td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 5px 2px; border: 1px solid #999; text-align: left;">
                                                    <asp:DropDownList ID="ddlThirdPref" runat="server" Width="220px" AutoPostBack="True" OnSelectedIndexChanged="ddlThirdPref_SelectedIndexChanged">
                                                        <asp:ListItem Selected="True" Text="-Select 3rd College Preferance-" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="College of Horticulture, Chiplima" Value="B.Sc. (Hons.) Horticulture"></asp:ListItem>
                                                        <asp:ListItem Text="College of Forestry, Bhubaneswar" Value="B.Sc. (Forestry)"></asp:ListItem>
                                                        <asp:ListItem Text="College of Community Science, Bhubaneswar" Value="B.Sc.(Hons.) Community Science"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="padding: 5px 2px; border: 1px solid #999; text-align: left;">
                                                    <asp:Label ID="lblCollegeName1" runat="server"></asp:Label>
                                                </td>
                                                <td style="padding: 5px 2px; border: 1px solid #999; text-align: left;">
                                                    <asp:Label ID="lblCourseName1" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                                </div>
                                            </table>
                                    </div>
                                    <br />
                                    <div style="font-size:15px;font-weight:bold;">
                                        &nbsp;<asp:CheckBox ID="chkDeclare" runat="server" OnCheckedChanged="chkDeclare_CheckedChanged" AutoPostBack="True" />
                                        &nbsp; DECLARATION
                                    </div>
                                    <div id="divDecl" runat="server" style="width: 98%;margin: 0 auto;">

                                        <table style="width: 100%; font-size: 14px">
                                            <tr>
                                                <td style="font-size: 15px; font-weight: bold" colspan="5"></td>
                                            </tr>
                                            <tr id="trDeclaration" runat="server">
                                                <td colspan="5">
                                        I&nbsp;<asp:Label ID="lblAppname1" runat="server" Font-Bold="True"></asp:Label>
                                                    &nbsp;Application No
                                            <asp:Label ID="lblAppID0" runat="server" Font-Bold="True"></asp:Label>
                                                    , Entrance Roll No.
                                                    <asp:Label runat="server" ID="lblRollNo0" Font-Bold="True"></asp:Label>
                                                    , am willing to participate in the OUAT Under Graduate Spot Admission to be held on&nbsp;&nbsp;as 
                                                    per the rules and regulation of OUAT UG Prospectus-2017.</td>

                                            </tr>
                                            <tr>
                                                <td colspan="5">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td style="text-align: center">
                                                    <asp:Label ID="lblAppname0" runat="server" Font-Bold="True"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Date:<asp:Label ID="lblDate" runat="server" Style="font-weight: bold"></asp:Label>


                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td style="text-align: center">
                                                    Applicant Name</td>
                                            </tr>
                                            </table>

                                    </div>
                                    <br />
                                    <div id="divTrans" runat="server">
                                        <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td colspan="4" style="padding: 5px; border: 1px solid #999; text-align: left;"><b>Payment Details</b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label26" runat="server" CssClass="lbl_property" Text="Reference ID"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                        <asp:Label ID="lblRef" runat="server" CssClass="lbl_value"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label31" runat="server" CssClass="lbl_property" Text="Payment Status"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                        <asp:Label ID="PayStatus" runat="server" CssClass="lbl_value" Font-Bold="True">UNPAID</asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Amount</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">Rs.&nbsp;
                                                        <asp:Label ID="lblTransAmt" runat="server">000.00</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Date</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                        <asp:Label ID="lblTransDate" runat="server">--/--/----</asp:Label>
                                                    </td>
                                                </tr>
                                                </table>

                                    </div>
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
                            <asp:Button ID="btnSubmit" runat="server" CausesValidation="False" CssClass="btn btn-primary" OnClick="btnSubmit_Click" Text="Submit" />
&nbsp;
                            <input type="button" id="btnPrint" runat="server" class="btn btn-success" value="Print" onclick="javascript: EPassPrint('divPrint');" />
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
