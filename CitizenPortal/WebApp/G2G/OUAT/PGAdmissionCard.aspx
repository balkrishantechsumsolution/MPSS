<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="PGAdmissionCard.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OUAT.PGAdmissionCard" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Data Entry Report View</title>
    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/WebApp/Login/js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>
    <script src="/WebApp/Scripts/CommonScript.js"></script>
    <script src="/WebApp/Scripts/AddressScript.js"></script>
    <script src="/WebApp/KIOSK/DTE/Script/DTEDashboard.js"></script>

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />

    <link href="/WebApp/Login/css/bootstrap.css" rel="stylesheet" />
    <link href="/g2c/css/hmepge.bootstrap.css" rel="stylesheet" />
    <link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />

    <script type="text/javascript">
        function AdmissionCardPrint(strid) {
            debugger;
            var rollno = $("#lblRollNo").text();
            var appid = $("#lblAppID").text();

            //EPassLog(rollno, appid);
            var prtContent = document.getElementById(strid);
            var WinPrint = window.open('', '', 'letf=0,top=0,width=800,height=700,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }
    </script>
    <style>
        .form-heading {
            color: #820000;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            text-transform: uppercase;
            font-weight: bold;
            font-size: x-large;
        }

        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <div class="container-fluid">
        <div id="page-wrapper" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12 cscPgehd">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Issue Admission Letter to OUAT PG/PhD Candidate</h2>
                </div>
            </div>
            <%---Start of Filter----%>
            <div class="row" style="">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Search Filter
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="txtAppID">Seach Roll No.</label>
                                <asp:TextBox runat="server" ID="txtRoll" class="form-control" placeholder="Roll No" name="txtRollNo" MaxLength="6" onkeypress="return isNumberKey(event);"
                                    type="text" value=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 text-right">
                            <div class="form-group">
                                <label class="" style="">
                                    &nbsp;
                                </label>
                                <asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-success"
                                    Text="Search" OnClick="btnSearch_Click" />
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
                <div runat="server" id="divSubmit">
                    <div class="col-lg-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title">Admission Details</h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlProgram">Select Programme</label>
                                    <asp:DropDownList ID="ddlProgram" runat="server" Width="95%" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged">
                                        <asp:ListItem Selected="True" Text="-Select Programme-" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Master Programme" Value="MasterProgramme"></asp:ListItem>
                                        <asp:ListItem Text="Doctoral Programme" Value="DoctoroalProgramme"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlCollege">Select College</label>
                                    <asp:DropDownList ID="ddlCollege" runat="server" Width="95%" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlCollege_SelectedIndexChanged">
                                        <asp:ListItem Selected="True" Text="-Select College-" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label id="lblDegree">Select Degree</label>
                                    <asp:DropDownList ID="ddlDegree" runat="server" Width="95%" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlDegree_SelectedIndexChanged">
                                        <asp:ListItem Selected="True" Text="-Select Degree-" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4" id="divSubject">
                                <div class="form-group">
                                    <label id="lblSubject0">Select Subject</label>
                                    <asp:DropDownList ID="ddlSubject" runat="server" Width="95%" CssClass="form-control" OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged">
                                        <asp:ListItem Selected="True" Text="-Select Subject-" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label class="" for="">
                                        Document Wanting
                                    </label>
                                    <div style="font-weight: normal;">

                                        <table style="width: 100%; font-weight: normal !important;">
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkCLC" runat="server" Text="College Leaving Certificate" />
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <asp:CheckBox ID="chkCC" runat="server" Text="Conduct Certificate" /></td>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <asp:CheckBox ID="chkMC" runat="server" Text="Migration Certificate" /></td>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <asp:CheckBox ID="chkMFC" runat="server" Text="Medical Fitness Certificate" /></td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>

                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="" for="txtAddNo">Admission No.</label>
                                    <asp:TextBox runat="server" ID="txtAddNo" class="form-control" placeholder="Admission No" name="txtAddNo"
                                        type="text" value=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 text-right">
                                <div class="form-group">
                                    <label class="" style="">
                                        &nbsp;
                                    </label>
                                    <asp:Button ID="btnSubmit" runat="server" CausesValidation="False" CssClass="btn btn-primary"
                                        Text="Submit" OnClick="btnSubmit_Click" />
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>


            </div>

            <%----END of Filter-----%>

            <div class="row" style="" runat="server" id="divStudentDetails">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Applicant Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="clearfix" style="clear: both"></div>
                        <div style="margin: 0 auto; text-align: center; width: 800px;">
                            <asp:Label ID="lblMsg" runat="server" Style="color: red; font-size: 20px;" Text=""></asp:Label>
                        </div>
                        <br />
                        <div  style="">
                            <div id="divPrint" style="margin: 35px auto 30px; width: 800px; /*height: 1080px; height: 1220px; overflow: auto; */">
                                <div style="margin: 0 auto; height: 1000px; width: 794px; padding: 3px; border: 3px solid #000; padding: 1px; font-family: Arial">
                                    <div style="margin: 0 auto; height: 992px; width: 785px; border: 1px solid #000; background-image: url('../images/ouatlogobg.png'); background-size: 400px; background-repeat: no-repeat; background-position: center center;">
                                        <%---------Start Header section --------%>
                                        <div style="height: 114px; width: 100%; border-bottom: 1px solid #999;">
                                            <table style="width: 100%; vertical-align: middle; text-align: center;">
                                                <tr>
                                                    <td>
                                                        <img alt="Logo" src="/webApp/kiosk/Images/OUAT.png" style="width: 80px; margin: 10px 0 0 6px;" />
                                                    </td>
                                                    <td style="text-align: center; vertical-align: middle;">

                                                        <span style="text-align: center; font-size: 24px; font-weight: bold; color: #d43300;">PG/PhD ADMISSION LETTER - 2017</span>
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
                                            <div style="float: left; width: 350px; text-align: left;" runat="server" id="divAppID">
                                                <b>Admission No.: </b>
                                                <asp:Label runat="server" ID="lblAdmission" Style="font-weight: bolder; text-transform: uppercase; white-space: nowrap;"></asp:Label>
                                            </div>
                                            <div style="float: right; width: 350px; text-align: right;">
                                                <b>Entrance Roll No.: </b>
                                                <asp:Label runat="server" ID="lblRollNo" Style="font-weight: bolder; text-transform: none; white-space: nowrap;text-transform:uppercase"></asp:Label>
                                            </div>
                                        </div>
                                        <%----------End title section ---------%><%---------Start Applicant Section --------%>
                                        <div style="margin: 5px auto; width: 770px; font-size: 12px;">
                                            <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0; font-size: 11px;">
                                                <tr>
                                                    <td style="padding: 2px; border: 1px solid #999; text-align: left;" colspan="4">
                                                        <b style="text-transform: uppercase;">Applicant Details</b></td>
                                                    <td rowspan="6" style="padding: 0; border: 1px solid #999; text-align: center; vertical-align: middle; width: 70px;">
                                                        <img runat="server" src="" name="ProfilePhoto" style="margin: 1px; width: 65px; height: 95px" id="ProfilePhoto" /><br />
                                                        <img runat="server" src="" name="ProfileSign" style="margin: 1px; width: 65px; display: none" id="Img1" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 100px;white-space: nowrap;">
                                                        <asp:Label ID="Label5" runat="server" Text="Application No."></asp:Label>
                                                    </td>
                                                    <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblAppID" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 2px; border: 1px solid #999; text-align: left; white-space: nowrap; width: 100px;">
                                                        <asp:Label ID="Label7" runat="server" Text="Aadhaar No."></asp:Label>
                                                    </td>
                                                    <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblAadhaar" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 2px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                                        <asp:Label ID="Label28" runat="server" Text="Applicant Name"></asp:Label>
                                                    </td>
                                                    <td style="padding: 2px; border: 1px solid #999; text-align: left;">
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
                                                    <td style="padding: 2px; border: 1px solid #999; text-align: left; white-space: nowrap;">Email ID</td>
                                                    <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 250px;">
                                                        <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 2px; border: 1px solid #999; text-align: left;">Mobile No.</td>
                                                    <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 2px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                                        <asp:Label ID="lblEmail2" runat="server">Stream </asp:Label>
                                                    </td>
                                                    <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 250px;">
                                                        <asp:Label ID="lblStream" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 2px; border: 1px solid #999; text-align: left;">Subject</td>
                                                    <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblSubject" runat="server"></asp:Label>

                                                    </td>
                                                </tr>
                                                <tr id="trRank" runat="server">
                                                    <td style="padding: 2px; border: 1px solid #999; text-align: left; white-space: nowrap;">Written Exam Marks</td>
                                                    <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 250px;">
                                                        <asp:Label ID="lblMarks" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 2px; border: 1px solid #999; text-align: left; white-space: nowrap;">Provisional Rank</td>
                                                    <td style="padding: 2px; border: 1px solid #999; text-align: left;">
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
                                            <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0; font-size: 11px;">
                                                <tr>
                                                    <td style="border: none" colspan="4">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                                        <b class="text-uppercase">Correspondance Address</b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                                        <asp:Label ID="lblAddress" Font-Size="12px" runat="server" Text="Address Details"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblDistrict0" Font-Size="12px" runat="server" Text="District : "></asp:Label><asp:Label ID="lblDistrict" Font-Size="12px" runat="server" Text="KHURDA"></asp:Label></td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblSubdistrict0" Font-Size="12px" runat="server">Block : </asp:Label><asp:Label ID="lblSubdistrict" Font-Size="12px" runat="server"></asp:Label></td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblVillage0" Font-Size="12px" runat="server">Town / Village :</asp:Label>&nbsp;<asp:Label ID="lblVillage" Font-Size="12px" runat="server"></asp:Label></td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="1">
                                                        <asp:Label ID="lblPin0" runat="server">PIN : </asp:Label>
                                                        <asp:Label ID="lblPin" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border: none" colspan="4">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                                        <b class="text-uppercase">Admission Details</b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        Programme Name</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                        <asp:Label ID="lblProgramme" runat="server">_______________</asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="Label1" runat="server" Text="College Name"></asp:Label></td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                        <asp:Label ID="lblCollege" runat="server">_______________</asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Course Name</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                        <asp:Label ID="lblCourse" runat="server">_______________</asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Subject Name</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                        <asp:Label ID="lblSubjectName" runat="server">_______________</asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: none; font-family: Arial; font-size: 12px;">

                                                <tr style="">
                                                    <td style="padding: 0;">
                                                        <div style="clear: both; margin: 0; padding: 0; width: 100%">
                                                            <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0;">
                                                                <tr>
                                                                    <td style="padding: 5px; text-align: left;">
                                                                        <p>
                                                                            You have been provisionally admitted to 
                                                <asp:Label ID="lblCourseName" runat="server" Font-Bold="True">_______________</asp:Label>
                                                                            , in the  
                                                <asp:Label ID="lblCollegeName" runat="server" Font-Bold="True">_______________</asp:Label>
                                                                            .&nbsp; Your Admission Number is 
                                                <asp:Label ID="lblAdmissionNo" runat="server" Font-Bold="True" Style="text-transform: uppercase">_______________</asp:Label>
                                                                            .&nbsp; You are informed to attend the Orientation Programme at <b>DR. M.S. SWAMINATHAN CONFERENCE HALL, 2nd FLOOR, OUAT ADMINISTRATIVE BUILDING, BHUBANESWAR-3</b> on <b>Wednesday, 16th August 2017 at 10:00 AM</b>                                                                        </p>
                                                                    </td>
                                                                </tr>
                                                            </table>

                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                            <div style="clear: both; margin: 0; padding: 0;" class="nav-justified">
                                                <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0;">
                                                    <tr>
                                                        <td style="padding: 5px; text-align: left; white-space: nowrap;">
                                                            <asp:Label ID="lblCourse1" Font-Size="12px" runat="server">Date :   </asp:Label>
                                                            <asp:Label ID="lblDate" Font-Size="12px" runat="server"></asp:Label>&nbsp;<%--<img runat="server" src="/webApp/kiosk/Images/OUATAddRegSig.png" name="ProfilePhoto1" style="margin: 1px; width: 130px; height: 54px;" id="OUATAddRegSig" />--%></td>
                                                        <td style="padding: 5px; text-align: right; white-space: nowrap;">
                                                            <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto0" style="margin: 1px; width: 130px; height: 54px;" id="ProfileSign" visible="False" /></td>
                                                        <td style="padding: 5px; text-align: right; white-space: nowrap;">
                                                            <img runat="server" src="../../Kiosk/Images/asst_registrar_signature_ouat.png" name="ProfilePhoto1" style="margin: 1px; width: 130px; height: 54px;" id="OUATAddRegSig" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left; vertical-align: bottom; white-space: nowrap;">&nbsp;</td>
                                                        <td style="text-align: right; vertical-align: bottom; white-space: nowrap;">&nbsp;</td>
                                                        <td style="text-align: right; vertical-align: bottom; white-space: nowrap;">
                                                            <asp:Label ID="Label30" Font-Size="10px" runat="server" Text="Signature of Asst. Registrar (Acd.)"></asp:Label></td>
                                                    </tr>
                                                </table>

                                            </div>
                                            <br />
                                            <br />

                                            <div runat="server" id="divDoc">
                                                <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: none; font-family: Arial; font-size: 12px;">
                                                    <tr>
                                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;" colspan="3">
                                                            <b class="text-uppercase">PENDING DOCUMENTS</b></td>
                                                    </tr>
                                                    <tr style="font-weight: bold;">
                                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; width: 20px">SL.</td>
                                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;" class="auto-style1">Document Name</td>
                                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;" class="auto-style1">Status</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">1.</td>
                                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                                            <asp:Label ID="lblCLC" runat="server" Text="College Leaving Certificate"></asp:Label>
                                                        </td>
                                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                                            <asp:Label ID="lblCLCYN" runat="server" Text="Submitted"></asp:Label>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">2.</td>
                                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                                            <asp:Label ID="lblCC" runat="server" Text="Conduct Certificate"></asp:Label></td>
                                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                                            <asp:Label ID="lblCCYN" runat="server" Text="Submitted"></asp:Label>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">3.</td>
                                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                                            <asp:Label ID="lblMC" runat="server" Text="Migration Certificate"></asp:Label></td>
                                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                                            <asp:Label ID="lblMCYN" runat="server" Text="Submitted"></asp:Label>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 2px; border: 1px solid #999; text-align: center;">4.</td>
                                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                                            <asp:Label ID="lblMFC" runat="server" Text="Medical Fitness Certificate"></asp:Label></td>
                                                        <td style="padding: 2px; border: 1px solid #999; text-align: left;">
                                                            <asp:Label ID="lblMFCYN" runat="server" Text="Submitted"></asp:Label></td>
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
                                <div class="col-md-12 box-container" id="divBtn">
                                    <div class="box-body box-body-open" style="text-align: center;">
                                        <input type="button" id="btnPrint" class="btn btn-danger" value="Print" onclick="javascript: AdmissionCardPrint('divPrint');" />
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                            <br />
                            <br />
                            <%----END of Button-----%>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</asp:Content>
