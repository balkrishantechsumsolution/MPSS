<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdmissionCard.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.AdmissionCard" %>

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

            .form-heading span {
                font-size: 25px;
                padding-left: 0;
            }

        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        .pagination {
            color: #000 !important;
            display: block !important;
            margin: 0 !important;
            padding: 10px;
        }

            .pagination label {
                display: inline-block;
                max-width: 100%;
                margin-bottom: 5px;
                font-weight: bold;
            }

        .SrvDiv {
            background-color: #fff;
            border: solid 1px #ddd;
            color: #045abc;
            width: 32.1%;
            margin: .5%;
            float: left;
            padding: .5%;
            overflow: auto;
            font-size: 18px;
            border-radius: 5px;
            border-left: solid 5px #438bc8;
        }

            .SrvDiv a {
                color: #000;
                font-size: .9em;
                text-decoration: none;
                font-weight: bold;
            }

                .SrvDiv a:hover {
                    color: #5AB1D0;
                    font-size: .9em;
                    text-decoration: none;
                    font-weight: bolder;
                }

            .SrvDiv img {
                margin-right: 10px;
                border: none;
            }

            .SrvDiv span {
                line-height: 20px;
                margin: 10px 0 0 0;
                color: #767676;
                font-size: .65em;
            }

        
        .auto-style1 {
            font-weight: bold;
        }
        .auto-style2 {
            height: 18px;
        }

        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="box-body box-body-open">
                <div id="" style="margin: 10px auto; width: 1000px; height: 50px; /*height: 1220px; overflow: auto; */">
                    <div id="page-wrapper" style="min-height: 500px !important;">
                       <div class="clearfix">
                            <%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
                            <h2 class="form-heading">
                                <span class="col-lg-10 p0"><i class="fa fa-pencil-square-o"></i>Issue Admission Letter to OUAT UG Candidate <%--{{resourcesData.lblOISFTitle}}--%>
                                </span>
                                <span class="clearfix"></span>
                            </h2>
                        </div>
                        <%---Start of Filter----%>
                        <div class="row" style="">

                            <div class="col-md-12 box-container">
                                
                                <div class="box-body box-body-open">
                                    
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display:none">
                                        <div class="form-group">
                                            <label class="manadatory" for="category">Application Type</label>
                                            <asp:DropDownList ID="ddlCategory" runat="server" Width="95%" CssClass="form-control">
                                                <asp:ListItem Selected="True" Text="-Select-" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="FORM-A" Value="403"></asp:ListItem>
                                                <asp:ListItem Text="AgroFORM-A" Value="409"></asp:ListItem>
                                                <asp:ListItem Text="FORM-B" Value="405"></asp:ListItem>
                                                <asp:ListItem Text="AgroFORM-B" Value="000"></asp:ListItem>
                                                <asp:ListItem Text="PG" Value="419"></asp:ListItem>
                                                <asp:ListItem Text="Diploma" Value="000"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    
                                    
                                    
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label class="" for="txtAppID">Search Roll No.</label>
                                            <asp:TextBox runat="server" ID="txtRoll" class="form-control" placeholder="Roll No" name="txtRollNo" MaxLength="7" onkeypress="return isNumberKey(event);"
                                                type="text" value=""></asp:TextBox>
                                        </div>
                                    </div>
                                    
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 text-right">
                                        <div class="form-group">
                                            <label class="" style="margin-top: 26px">
                                                &nbsp;
                                            </label>
                                            <asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-success"
                                                Text="Search" OnClick="btnSearch_Click"  />
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                    <div runat="server" id="divSubmit">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <div class="form-group">
                                                <label class="" for="txtAddNo">Admission No.</label>
                                                <asp:TextBox runat="server" ID="txtAddNo" class="form-control" placeholder="Admission No" name="txtAddNo"  
                                                    type="text" value=""></asp:TextBox>
                                            </div>
                                        </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="category">College Name</label>
                                            <asp:DropDownList ID="ddlCollege" runat="server" Width="95%" CssClass="form-control" OnSelectedIndexChanged="ddlCollege_SelectedIndexChanged" AutoPostBack="True">
                                                <asp:ListItem Selected="True" Text="-Select College-" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="College of Veterinary Sc. & A.H.,Bhubaneswar" Value="B.V.Sc. & A.H."></asp:ListItem>
                                                <asp:ListItem Text="College of Agriculture, Bhubaneswar" Value="B.Sc.(Hons.) Agriculture"></asp:ListItem>
                                                <asp:ListItem Text="College of Agriculture, Chiplima" Value="B.Sc.(Hons.) Agriculture2"></asp:ListItem>
                                                <asp:ListItem Text="College of Agriculture, Bhawanipatna" Value="B.Sc.(Hons.) Agriculture3"></asp:ListItem>
                                                <asp:ListItem Text="College of Horticulture, Chiplima" Value="B.Sc. (Hons.) Horticulture"></asp:ListItem>
                                                <asp:ListItem Text="College of Agril.Engg. & Technology,Bhubaneswar" Value="B.Tech. (Agril. Engg.)"></asp:ListItem>
                                                <asp:ListItem Text="College of Forestry, Bhubaneswar" Value="B.Sc. (Forestry)"></asp:ListItem>
                                                <asp:ListItem Text="College of Fisheries, Rangailunda, Berhampur" Value="B.F.Sc."></asp:ListItem>
                                                <asp:ListItem Text="College of Community Science, Bhubaneswar" Value="B.Sc.(Hons.) Community Science"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="category">Course Name</label>
                                             <asp:TextBox runat="server" ID="txtCourse" class="form-control" placeholder="Course Name" name="txtCourse" ReadOnly  
                                                    type="text" value=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 text-right">
                                        <div class="form-group">
                                            <label class="" style="margin-top: 20px;">
                                                &nbsp;
                                            </label>
                                            <asp:Button ID="btnSubmit" runat="server" CausesValidation="False" CssClass="btn btn-primary"
                                                Text="Submit" OnClick="btnSubmit_Click"  />
                                        </div>
                                    </div>

                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="" for="">
                                                Document Wanting
                                            </label>
                                                <div style="font-weight:normal;">
                                                    
                                                    <table style="width:100%;font-weight:normal !important;">
                                                        <tr>
                                                            <td>
                                                                <asp:CheckBox ID="chkCLC" runat="server" Text="College Leaving Certificate" />
                                                            </td>
                                                            <td>&nbsp;</td>
                                                            <td><asp:CheckBox ID="chkCC" runat="server" Text="Conduct Certificate" /></td>
                                                            <td>&nbsp;</td>
                                                            <td><asp:CheckBox ID="chkMC" runat="server" Text="Migration Certificate" /></td>
                                                            <td>&nbsp;</td>
                                                            <td><asp:CheckBox ID="chkMFC" runat="server" Text="Medical Fitness Certificate" /></td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    <div class="clearfix">
                                    </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div style="margin:0 auto;text-align:center;width:800px;"><asp:Label ID="lblMsg" runat="server" Style="color: red; font-size: 20px;" Text=""></asp:Label></div>
                <br />
                <div runat="server" id="divStudentDetails">
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

                                                <span style="text-align: center; font-size: 24px; font-weight: bold; color: #d43300;">UG ADMISSION LETTER - 2017</span>
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
                                        <asp:Label runat="server" ID="lblRollNo" Style="font-weight: bolder; text-transform: none; white-space: nowrap;"></asp:Label>
                                    </div>
                                </div>
                                <%----------End title section ---------%><%---------Start Applicant Section --------%>
                                <div style="margin: 5px auto; width: 770px; font-size: 13px;">
                                    <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0;">
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="8">
                                                <b style="text-transform: uppercase;">Applicant Details</b></td>
                                            <td rowspan="6" style="padding: 0; border: 1px solid #999; text-align: center; vertical-align: top;" class="auto-style2">
                                                <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 130px;" id="ProfilePhoto" />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 100px;">
                                                <asp:Label ID="Label5" runat="server" Text="Application No."></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;" colspan="3">
                                                <asp:Label ID="lblAppID" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap;" colspan="3">
                                                <asp:Label ID="Label7" runat="server" Text="Aadhaar No."></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                                <asp:Label ID="lblAadhaar" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                                <asp:Label ID="Label28" runat="server" Text="Applicant Name"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;" colspan="3">
                                                <asp:Label ID="lblAppname" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
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
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 250px;" colspan="3">
                                                <asp:Label ID="lblMother" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">Mobile No.</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                                <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="">
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="lblFather1" runat="server">Father's Name</asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                <asp:Label ID="lblFather" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap" colspan="3">
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
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                                <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">Category</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                                <asp:Label ID="lblCategory" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border: none" colspan="9">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="9">
                                                <b class="text-uppercase">Correspondance Address</b></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="9">
                                                <asp:Label ID="lblAddress" Font-Size="12px" runat="server" Text="Address Details"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                                <asp:Label ID="lblDistrict0" Font-Size="12px" runat="server" Text="District : "></asp:Label><asp:Label ID="lblDistrict" Font-Size="12px" runat="server" Text="KHURDA"></asp:Label></td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                <asp:Label ID="lblSubdistrict0" Font-Size="12px" runat="server">Block : </asp:Label><asp:Label ID="lblSubdistrict" Font-Size="12px" runat="server"></asp:Label></td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                <asp:Label ID="lblVillage0" Font-Size="12px" runat="server">Town / Village :</asp:Label>&nbsp;<asp:Label ID="lblVillage" Font-Size="12px" runat="server"></asp:Label></td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="1">
                                                <asp:Label ID="lblPin0" runat="server">PIN : </asp:Label>
                                                <asp:Label ID="lblPin" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border: none" colspan="9">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="9">
                                                <b class="text-uppercase">Admission Details</b></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                                <asp:Label ID="Label1" runat="server" Text="College Name"></asp:Label></td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="7">
                                                <asp:Label ID="lblCollege" runat="server">_______________</asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">Course Name</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="7">
                                                <asp:Label ID="lblCourse" runat="server">_______________</asp:Label></td>
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
                                                <asp:Label ID="lblAdmissionNo" runat="server" Font-Bold="True" style="text-transform:uppercase">_______________</asp:Label>
                                                                    .&nbsp; You are informed to report to the college on <b>Monday, 31st July 2017</b> for Orientation Programme and Starting of course programme
                                                                </p>
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
                                                    <img runat="server" src="../Images/asst_registrar_signature_ouat.png" name="ProfilePhoto1" style="margin: 1px; width: 130px; height: 54px;" id="OUATAddRegSig" /></td>
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
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; " class="auto-style1">Document Name</td>
                                        <td style="padding: 2px; border: 1px solid #999; text-align: left; " class="auto-style1">Status</td>
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
                        <div style="width: 780px; margin: 5px auto; font-weight: bolder; font-size: 15px; text-align: center; padding: 5px 0; border: 2px solid #000; border-left: none; border-right: none; display: none;">
                            (DU 01234567) The Candidate has to bring a copy of e-receipt to the examination centre.<br />
                            (This is a sample copy only for reference of students . For more details see Clause -6.1)

                        </div>
                        <div style="width: 780px; margin: 25px auto; font-size: 14px; display: none;">
                            <b style="font-size: 14px;">INSTRUCTIONS TO THE CANDIDATES FOR ENTRANCE EXAMINATION</b>
                            <ul>
                                <li>The candidates shall be present at the Examination Centre with admit card by 09:30 A.M.</li>
                                <li>No candidate will be allowed to enter into the Entrance Examination Hall after 15 minutes of commencement of the Examination.</li>
                                <li>All candidates should continue to stay in the examination hall till the examination is over.</li>
                                <li>Use Black Ball Point Pen for marking the OMR Sheet.</li>
                                <li>Disfiguring of OMR Sheet in any manner or putting any sign/ symbol etc. therein as identifying mark, will make the OMR Sheet liable for rejection.</li>
                                <li>Adopting unfair means or indulging in any objectionable conduct in the examination hall will make the candidate liable to be debarred from the examination.</li>
                                <li>Mobile phone, calculator & other electronic gadgets etc. are strictly prohibited in the Examination Centre. </li>
                                <li>Obey the instructions of the centre superintendent and University authorized officials at the examination centre.</li>
                                <li><b>The request for change of city/centre of examination will not be entertained.</b></li>
                                <li><b>Submission of Application Form-B online is compulsory (see clause No.-6 of the Prospectus).</b></li>
                                <li><b>No negative marks for incorrect answer.</b></li>
                                <li>No marks will be awarded for multiple response to single question.</li>
                            </ul>
                            <b>NOTE: </b><span style="margin-left: 5px;">Bring ID Proof in original to the Examination Centre for verification (reference see Clause No.- 5.5 of the Prospectus).</span><br />

                            <br />
                            <asp:Label ID="lblMsg1" runat="server" Style="color: red; font-size: 20px;" Text=""></asp:Label>
                        </div>

                        <%--<div class="clear" style="page-break-before: always;">
                        &nbsp;
                    </div>--%>
                    </div>
                    <%---Start of Button----%>
                    <div class="clearfix">
                        <div class="col-md-12 box-container" id="divBtn">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <input type="button" id="btnPrint" class="btn btn-danger" value="Print" onclick="javascript: EPassPrint('divPrint');" />
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
        </div>
    </form>
</body>
</html>
