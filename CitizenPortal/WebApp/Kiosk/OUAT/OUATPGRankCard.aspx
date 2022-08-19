<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OUATPGRankCard.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.OUATPGRankCard" %>


<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rank Card - PG Admission 2017-18</title>
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
        .auto-style1 {
            width: 50px;
        }

        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box-body box-body-open">
            <div id="" style="margin: 10px auto; width: 1000px; height: 50px; /*height: 1220px; overflow: auto; */">
            </div>
            <div id="divPrint" style="margin: 0 auto; width: 800px; /*height: 1080px; height: 1220px; overflow: auto; */">
                <div style="margin: 0 auto; height: 1035px; width: 794px; padding: 3px; border: 3px solid #000; padding: 1px; font-family: Arial">
                    <div style="margin: 0 auto; height: 1031px; width: 785px; border: 1px solid #000; background-image: url('../images/ouatlogobg.png'); background-size: 400px; background-repeat: no-repeat; background-position: center center;">
                        <%---------Start Header section --------%>
                        <div style="height: 105px; width: 100%; border-bottom: 1px solid #999;">
                            <table style="width: 100%; vertical-align: middle; text-align: center;">
                                <tr>
                                    <td>
                                        <img alt="Logo" src="/webApp/kiosk/Images/OUAT.png" style="width: 80px; margin: 10px 0 0 6px;" />
                                    </td>
                                    <td style="text-align: center; vertical-align: middle;">
                                        <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 18px; font-weight: bolder; text-transform: none;">ORISSA UNIVERSITY OF AGRICULTURE AND TECHNOLOGY
                                                <br />BHUBANESWAR–751003
                                        </asp:Label>
                                        <br />
                                        <asp:Label runat="server">Counselling &amp; Admission into Masters&#39; &amp; Doctoral Programme 2017-18</asp:Label>
                                    </td>
                                    <td>
                                        <div style="width: 75px; text-align: center; margin: 0 auto;"></div>
                                        <uc1:QRCode runat="server" ID="QRCode" style="width: 80px !important" />

                                    </td>
                                </tr>
                            </table>
                        </div>
                        <%----------End Header section ---------%><%---------Start Title section --------%>
                        <div style="display: block; text-align: left; overflow: auto; font-size: 20px; font-weight: bolder; padding: 0px 5px; text-transform: unset; background-color: #808080; color: #fff;">
                            <div style="float: left; width: 510px;">
                                <span style="text-align: left; font-size: 20px; font-weight: bold; color: #fff;">Intimation-cum-Rank for PG/PhD Courses - 2017</span>
                            </div>
                            <div style="float: right; width: 250px; text-align: right;">
                                <b>Roll No.: </b>
                                <asp:Label runat="server" ID="lblRollNo" Style="font-weight: bolder; text-transform: none; white-space: nowrap;"></asp:Label>
                            </div>
                        </div>
                        <%----------End title section ---------%><%---------Start Applicant Section --------%>
                        <div style="margin: 5px auto; width: 770px; font-size: 13px;">
                            <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0; font-size: 11px;">
                                <tr>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left;" colspan="4">
                                        <b style="text-transform: uppercase;">Applicant Details</b></td>
                                    <td rowspan="6" style="padding: 0; border: 1px solid #999; text-align: center; vertical-align: middle; width: 70px;">
                                        <img runat="server" src="" name="ProfilePhoto" style="margin: 1px; width: 65px; height: 95px" id="ProfilePhoto" /><br />
                                        <img runat="server" src="" name="ProfileSign" style="margin: 1px; width: 65px; display: none" id="ProfileSign" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left; width: 100px;">
                                        <asp:Label ID="Label5" runat="server" Text="Application No."></asp:Label>
                                    </td>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblAppID" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left; white-space: nowrap; width: 100px;">
                                        <asp:Label ID="Label7" runat="server" Text="Aadhaar No."></asp:Label>
                                    </td>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblAadhaarNo" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                        <asp:Label ID="Label28" runat="server" Text="Applicant Name"></asp:Label>
                                    </td>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblAppname" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblGender0" runat="server">Gender</asp:Label>
                                    </td>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblGender" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left; white-space: nowrap;">Email ID</td>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left; width: 250px;">
                                        <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left;">Mobile No.</td>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                        <asp:Label ID="lblEmail2" runat="server">Stream </asp:Label>
                                    </td>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left; width: 250px;">
                                        <asp:Label ID="lblStream" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left;">Subject</td>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblSubject" runat="server"></asp:Label>

                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left; white-space: nowrap;">Written Exam Marks</td>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left; width: 250px;">
                                        <asp:Label ID="lblMarks" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left; white-space: nowrap;">Provisional Rank</td>
                                    <td style="padding: 1px; border: 1px solid #999; text-align: left;">
                                        <strong>
                                            <asp:Label ID="lblRank" runat="server"></asp:Label>

                                        </strong>

                                    </td>
                                </tr>
                                <tr>
                                    <td style="border: none" colspan="5">
                                        <asp:Label ID="lblCategory" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="lblFather2" runat="server" Visible="False">Mother's Name</asp:Label>
                                        <asp:Label ID="lblMother" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="lblFather1" runat="server" Visible="False">Father's Name</asp:Label>
                                        <asp:Label ID="lblFather" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="Label29" runat="server" Text="Date of Birth" Visible="False"></asp:Label>
                                        <asp:Label ID="lblFather0" runat="server" Visible="False">Age</asp:Label>
                                        <asp:Label ID="lblDOB" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="lblAge" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>

                            <%----------End Document Section ---------%>

                            <div>
                                <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: none; font-family: Arial; font-size: 11px;">
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;" colspan="8">
                                            <b style="text-transform: capitalize">RANK DETAILS</b></td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left; width: 60px;">Category</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center; width: 55px">GEN </td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center; width: 55px">ST</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center; width: 55px">SC</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center; width: 55px" >Other State</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center; width: 55px">PH</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center; width: 55px">NRI</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center; width: 55px">Hoticulture</td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">Rank</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankGen" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankST" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankSC" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankGCH" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankPH" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankNRI" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblRankHoti" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <div>
                                <table cellspacing="0" class="" style="width: 100%; border: none; font-family: Arial; font-size: 11px; display: none">
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;" colspan="9">
                                            <b>FEE STRUCTURE AND MODE OF PAYMENT DETAILS (in Rupees)</b></td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left; width: 25px;" rowspan="2">SL.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left; width: 120px;" rowspan="2">Course Nmae</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;" colspan="2">GENERAL</td>
                                        <td style="padding: 1px; border: 1px solid #999;" class="auto-style1" rowspan="5">&nbsp;</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center; width: 25px;" rowspan="2">Sl.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center; width: 120px;" rowspan="2">Course Name</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;" colspan="2">GENERAL</td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center; width: 70px">CASH</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center; width: 70px">D.D.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center; width: 70px">CASH</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center; width: 70px">D.D.</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">1.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">M.F.Sc.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">2115/-</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">61,900/-</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">2.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">M.V.Sc.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">2115/-</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">61,900/-<br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">3.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">M.Sc. (Agriculture)</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">2079/-</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">40,700/-</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">4.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">M.Tech (Agril. Engg.)</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">2079/-</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">40,700/-<br />
                                            1,00,000/-</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">5.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">M.Sc. (Forestry)</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">&nbsp;</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">&nbsp;</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">6.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">M.Sc. (Home Science)</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">&nbsp;</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;" colspan="9"></td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;" rowspan="2">Sl.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;" rowspan="2">Course Nmae</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;" colspan="5" rowspan="2">Subject Name</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;" colspan="2">GENERAL</td>
                                    </tr>

                                    <tr style="font-weight: bold">
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center; width: 70px">CASH</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center; width: 70px">D.D.</td>
                                    </tr>

                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">7.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">Ph.D.F.Sc.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left; font-size: 9px;" colspan="5">Aquaculture</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">2115/-</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">61,900/-</td>
                                    </tr>

                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">8.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">Ph.D. (Agriculture)</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left; font-size: 9px;" colspan="5">Agril. Biotechnology, Agril. Economics, Agronomy, Extension Education, Entomology, Floriculture &amp; Land Scaping, Fruit Science &amp; Horticultural Technology, Nematology, Plant Breeding &amp; Genetics Plant Pathology, Soil Sc. &amp; Agril. Chemistry, Seed Science &amp; Technology, Vegetable Science</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">2079/-</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">40,700/-</td>
                                    </tr>

                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">9.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">Ph.D. (Agril. Engg.)</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left; font-size: 9px;" colspan="5">Farm Machinery & Power Engineering, 
Processing &amp; Food Engineering, Soil &amp; Water Conservation Engineering</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">61,900/-</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">2,115/-</td>
                                    </tr>

                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">10.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">Ph.D (Vety. Science)</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left; font-size: 9px;" colspan="5">Animal Breeding &amp; Genetics, Animal Nutrition, Live Stock Production and Management, Veterinary Anatomy &amp; Histology Animal Reproduction, Gynecology &amp; Obstetrics, Veterinary Clinical Medicine, Ethics and Jurisprudence, Veterinary Parasitology, Veterinary Bio-chemistry, Veterinary Pathology, Veterinary Pharmacology and Toxicology, Veterinary Surgery &amp; Radiology</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">40,700/-<br />
                                        </td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">2,079/-</td>
                                    </tr>

                                    <tr style="display: none;">
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">&nbsp;</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">&nbsp;</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">&nbsp;</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">&nbsp;</td>
                                    </tr>

                                </table>

                            </div>
                            <div>
                                <table cellspacing="0" class="" style="width: 100%; border: none; font-family: Arial; font-size: 11px;">
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;" colspan="4">
                                            <b>COUNSELLING DETAILS</b></td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left; width: 10px">SL.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left; width: 100px">DATE OF COUNSELLING</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">COURSE NAME</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">SEATS</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">OTHER STATE<br />
                                            QUOTA</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">RANK &amp; 
                                            <br />
                                            CATEGORY</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">REPORTING<br />
                                            TIME</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;" rowspan="5">1.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;" rowspan="5"><span lang="EN-US">09/08/2017</span></td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;"><span lang="EN-US">M.Tech (Ag. Engg.)</span></td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;"><span lang="EN-US">21</span></td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">03</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">All Candidate</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">9:00 AM</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;"><span lang="EN-US">M.Sc. (Forestry)</span></td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">25</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">05</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">All Candidate</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">11:45 AM</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;"><span lang="EN-US">M.F.Sc.</span></td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">07</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">01</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">All Candidate</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">1:30 PM</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;"><span lang="EN-US">M.Sc. (Community Science)</span></td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">15</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">03</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">All Candidate</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">3:00 PM</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;"><span lang="EN-US">M.V.Sc.</span></td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">64</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">16</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">All Candidate</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">3:20 PM</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;" rowspan="2">2.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;" rowspan="2"><span lang="EN-US">10/08/2017</span></td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;" rowspan="2"><span lang="EN-US">M.Sc. (Ag.)</span></td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;" rowspan="2">132</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;" rowspan="2">16</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">PH, UR (All Category) &amp; Horticulture</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">9:00 AM</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;"><span lang="EN-US">SC,</span> <span lang="EN-US">ST, </span>&nbsp;<span lang="EN-US">Other State &amp; NRI</span></td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">3:00 PM</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;" rowspan="4">3.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;" rowspan="4"><span lang="EN-US">11/08/2017</span></td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;"><span lang="EN-US">Ph.D (Ag. Engg.)</span></td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">03</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">03</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">All Candidate</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">9:00 AM</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;"><span lang="EN-US">Ph.D (Fishery Science)</span></td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">03</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">01</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">All Candidate</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">10:30 AM</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;"><span lang="EN-US">Ph.D (Vety. Science)</span></td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">01</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">12</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">All Candidate</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">11:00 AM</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;"><span lang="EN-US">Ph. D (Ag.)</span></td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">38</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">14</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">All Candidate</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">2:30 PM</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left; font-weight: bold" colspan="2">Counselling Venue</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;" colspan="5">
                                            <asp:Label ID="lblVenue" runat="server" Style="font-size: 11px; font-weight: bold" Text="Dr. M.S. Swaminathan Conference Hall, 2nd Floor, OUAT Administrative Building, Bhubanesware-3"></asp:Label>

                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div>
                                <table cellspacing="0" class="" style="width: 100%; border: none; font-family: Arial; font-size: 11px;">
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;" colspan="5">
                                            <b>FEE STRUCTURE AND MODE OF PAYMENT DETAILS (in Rupees)</b></td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left; width: 10px" rowspan="2">SL.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left; width: 100px" rowspan="2">Course Nmae</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center; width: 60px;">GENERAL</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center; width: 335px;">COST SHARING</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">NRI</td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">D.D.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">D.D.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">D.D.</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">1.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">Master Course Programme</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">23,889/-</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">a). Rs.43,889/- for Seed Science Technology 
                                            <br />
&nbsp;&nbsp;&nbsp;&nbsp; &amp; Other Departments having cost sharing Seats<br />
                                            b). Rs.48,889/- for Agri Biotechnology only</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">a). Rs.1,23,889/- for Seed Science Technology
                                            <br />
                                            b). Rs.1,73,889/- for Agri Biotechnology only
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">2.</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: left;">Doctoral Course Programme</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: right;">29,912/-</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">--</td>
                                        <td style="padding: 1px; border: 1px solid #999; text-align: center;">--</td>
                                    </tr>
                                </table>
                            </div>


                            <div>

                                <table style="font-size: 11px; width: 100%">
                                    <tr>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top; text-align: left; width: 35px; vertical-align: top"><b>Note: </b></td>
                                        <td style="vertical-align: top; text-align: left;">A Demand Draft of the required amount of any Nationalized Bank drawn in favour of “COMPTROLLER, OUAT”, Bhubaneswar,  payable  at Bhubaneswar should be deposited by the candidate at the time of  Admission. Payment can also be made by SBI collect through net banking, this facility will be available in Counseling Hall.</td>
                                    </tr>

                                </table>

                                <table style="font-size: 10px !important; width: 100%">
                                    <tr>
                                        <td colspan="2"><b>DOCUMENTS IN ORIGINAL &  PHOTO COPY (ONE SET SELF ATTESTED) REQUIRED AT THE TIME OF ADMISSION:</b></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top; text-align: left; width: 25px;">1.</td>
                                        <td style="vertical-align: top; text-align: left;"><b>Print out of submitted Application Form with photocopy of relevant documents.</b></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top; text-align: left;">2.</td>
                                        <td style="vertical-align: top; text-align: left;">Mark Sheet & Certificate of 10th and +2 Science/equivalent, Bachelor&#39;s Degree &amp; Masterr&#39;s Degree for Ph.D.</td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top; text-align: left;">3.</td>
                                        <td style="vertical-align: top; text-align: left;">College Leaving Certificate, Conduct Certificate and Migration Certificate from the Head of Institution last attended.</td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top; text-align: left;">4.</td>
                                        <td style="vertical-align: top; text-align: left;">Documents in support of Reserved Category, if any (ST/SC/PH).</td>
                                    </tr>                                    
                                    <tr>
                                        <td style="vertical-align: top; text-align: left;">5.</td>
                                        <td style="vertical-align: top; text-align: left;">Medical Certificate in prescribed format (Annexure-I of the PG prospectus - 2017)</td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top; text-align: left;">6.</td>
                                        <td style="vertical-align: top; text-align: left;">Aadhaar Card</td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top; text-align: left;">7.</td>
                                        <td style="vertical-align: top; text-align: left;">Five Passport size Photographs as used in admit card.</td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top; text-align: left;">8.</td>
                                        <td style="vertical-align: top; text-align: left;">Domicile/Residential Certificate for Inside State Candidates residing Outside Odisha and for those candidates<br />who do not have odia in HSC/equivalent level.</td>
                                    </tr>
                                </table>

                                <div style="clear: both; padding: 0; width: 100%;">
                                    <table cellspacing="0" class="" style="width: 100%; border: 0; margin-top: -80px;">
                                        <tr>
                                            <td style="padding: 1px; text-align: center; white-space: nowrap;"></td>
                                            <td style="padding: 1px; text-align: left; white-space: nowrap; height: 70px; width: 250px;">&nbsp;</td>
                                            <td style="border: 1px solid #999; border: none; padding: 1px; text-align: left; white-space: nowrap; text-align: center; width: 250px;">
                                                <img runat="server" src="../Images/Chairman_Admission_ouat.png" name="ProfilePhoto1" style="margin: 1px; width: 130px; height: 54px;" id="OUATAddRegSig" />
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
                                        <td style="vertical-align: top; text-align: left; width: 25px">1.</td>
                                        <td style="vertical-align: top; text-align: left; font-weight: bold; font-style: initial;"><u>This intimation is not ensuring any seat but only to attend the counseling for admission. Admission  depends on availability of seat and the candidates’ eligibility after verification of original documents.</u></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top; text-align: left;">2.</td>
                                        <td style="vertical-align: top; text-align: left;">The Admission Board reserves the right to deny admission to any candidate who fails to submit relevant original documents or fails to fulfil the eligibility requirement as per the CLAUSE-2 of Prospectus for Post Graduate Course Programme 2017-18</td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top; text-align: left;">3.</td>
                                        <td style="vertical-align: top; text-align: left;">Once a candidate is admitted into a Course on exercising option before the Admission Board, change over to another course shall not be allowed under any circumstances.</td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top; text-align: left;">4.</td>
                                        <td style="vertical-align: top; text-align: left;">This card is to be signed and submitted in original at the time of counseling.</td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top; text-align: left;">5.</td>
                                        <td style="vertical-align: top; text-align: left;">A copy of the Intimation cum Rank Card may be retained by the candidate for future requirement.</td>
                                    </tr>
                                </table>

                                <br />
                                <asp:Label ID="lblMsg" runat="server" Style="color: red; font-size: 20px;" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
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
