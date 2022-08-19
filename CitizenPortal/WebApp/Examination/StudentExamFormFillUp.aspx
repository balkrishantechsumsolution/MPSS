<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Citizen/Master/Citizen.Master" AutoEventWireup="true"
    CodeBehind="StudentExamFormFillUp.aspx.cs" Inherits="CitizenPortal.WebApp.Examination.StudentExamFormFillUp" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentExamFormFillUp.aspx.cs" Inherits="CitizenPortal.WebApp.Examination.StudentExamFormFillUp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Semester Examination Form Fillup</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <link href="../../../Sambalpur/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../../Sambalpur/js/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script src="../../../Sambalpur/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="../../../Sambalpur/css/homestyle.css" type="text/css" rel="stylesheet" />
    <link href="../../../Sambalpur/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <script src="../../Scripts/CommonScript.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Citizen/Script/ValidateUser.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //$('#accordion .collapse').collapse('show');
            //$('#lblPayableAmt').show();

            var MobileNo = $("#ContentPlaceHolder1_MobileNo");
            var EmailID = $("#ContentPlaceHolder1_EmailID");

            MobileNo.attr('style', 'border:1px solid #d03100 !important;');
            MobileNo.css({ "background-color": "#fff2ee" });

            EmailID.attr('style', 'border:1px solid #d03100 !important;width:210px !important;');
            EmailID.css({ "background-color": "#fff2ee" });

            $('#ContentPlaceHolder1_lblDOB').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-50:+0",
                maxDate: '0',

            });

            

        });

        var baseUrl = "<%= Page.ResolveUrl("~/") %>";

        function ResolveUrl(url) {
            if (url.indexOf("~/") == 0) {
                url = baseUrl + url.substring(2);
            }
            return url;
        }

        function ViewDoc(m_ServiceID, m_AppID, m_Path) {
            var t_URL = "";
            t_URL = m_Path;//+ "&SvcID=" + m_ServiceID + "&AppID=" + m_AppID;
            t_URL = ResolveUrl(t_URL);
            window.open(t_URL, "");
        }

        function ViewReceipt(m_ServiceID, m_AppID, m_Path) {
            var t_URL = "";
            t_URL = m_Path + "?SvcID=" + m_ServiceID + "&AppID=" + m_AppID;
            t_URL = ResolveUrl(t_URL);
            window.open(t_URL, "");
        }

    </script>

    <script type="text/javascript">
        function SUDeclaration(chk) {

            debugger;



            if (chk) {
                if ($('#ContentPlaceHolder1_FullName').text() == "" || $('#ContentPlaceHolder1_FullName').text() == "") {
                    //alert("Please enter the all the mandatory fields.");
                    alert("Please enter your Full Name, Father Name  to continue.");
                    $('#divDeclaration').hide();
                    chkDeclaration.checked = false;
                    return false;
                }


                var name = $('#ContentPlaceHolder1_FullName').text();
                var rollno = $('#ContentPlaceHolder1_lblRoll').text();
                //alert(name);
                $("#lblName").text(name);
                $("#lblApplicant").text(name);
                $("#lblRollNo").text(rollno);

                $('#ContentPlaceHolder1_GenrateBatch').prop('disabled', false);


                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth() + 1; //January is 0!

                var yyyy = today.getFullYear();
                if (dd < 10) {
                    dd = '0' + dd
                }
                if (mm < 10) {
                    mm = '0' + mm
                }
                var today = dd + '/' + mm + '/' + yyyy;
                $("#currntdte").text(today);
                $('#divDeclaration').show(500);

                //$("div[id$='LoadingDiv']").hide(800);
                //$("div[id$='DisplayGrid']").show(800);
                //$('#DivAmt').hide();

                ////calculate sum of selected rows
                //$('[id*=chkBacklog]').on('change', function () {
                //    var value = 0;
                //    $('[id*=chkBacklog]:checked').each(function () {
                //        var row = $(this).closest('tr');
                //        value = value + parseInt(row.find('[id*=lbltotalamt]').html());
                //    });
                //    $('#tamt').text(value);
                //    if (value != null && value != '') {
                //        $('#DivAmt').show(800);
                //    }
                //});
            }
            else {
                $('#divDeclaration').hide(500);
                //var chkdeclaration = 0;
                //if ($('#chkDeclaration').is(":checked")) {
                //    // it is checked
                //    chkdeclaration = 1;
                //}

                //if (chkdeclaration == 0) {
                //    //chkAbility
                //    text += "<BR>" + " \u002A" + "  Please check Declaration and read it. ";
                //    opt = 1;
                //    $('#lblDeclaration').attr('style', 'color:red !important;');
                //    $('#lblDeclaration').css({ "color": "red" });
                //}
                //else {
                //    $('#lblDeclaration').attr('style', 'color:#000000 !important;');
                //    $('#lblDeclaration').css({ "color": "#000000 " });
                //}

            }
        }

        function fnCalBackSubject(p_RowID) {
            debugger;
            var t_Id = "ContentPlaceHolder1_grdBacklog_chkBacklog_" + p_RowID;
            //CPH_gvDetail_chk_TopUp_0
            var strText = p_RowID.id.split('_');
            var p_ID = strText[3];

            var RollNo = $('#ContentPlaceHolder1_lblRoll').text();
            var t_PaperCount = parseInt($('#ContentPlaceHolder1_lblBacklogSelected').text());
            var t_BackTotal = "00.00";
            var TotalAmount = "00.00";
            if (document.getElementById("ContentPlaceHolder1_grdBacklog_chkBacklog_" + p_ID).checked) {
                t_PaperCount = parseInt(t_PaperCount) + 1;
                $('#ContentPlaceHolder1_lblBacklogSelected').text(t_PaperCount)

            }
            else {
                if (t_PaperCount != 0) {
                    t_PaperCount = parseInt(t_PaperCount) - 1;

                    $('#ContentPlaceHolder1_lblBacklogSelected').text(t_PaperCount)
                }
            }
            $('#ContentPlaceHolder1_lblSelectTotal').text(parseInt(t_PaperCount) + parseInt($('#ContentPlaceHolder1_lblRegularSelected').text()) + parseInt($('#ContentPlaceHolder1_lblAggregateSelected').text()))

            t_BackTotal = CalculateExamFees(RollNo, 'Backlog', t_PaperCount);


        }

        function fnCalAggBackSubject(p_RowID) {
            debugger;
            var t_Id = "ContentPlaceHolder1_grdAgg_chkAgg_" + p_RowID;
            //CPH_gvDetail_chk_TopUp_0
            var strText = p_RowID.id.split('_');
            var p_ID = strText[3];

            var RollNo = $('#ContentPlaceHolder1_lblRoll').text();
            var t_PaperCount = parseInt($('#ContentPlaceHolder1_lblAggregateSelected').text());
            var t_BackTotal = "00.00";
            var TotalAmount = "00.00";
            if (document.getElementById("ContentPlaceHolder1_grdAgg_chkAgg_" + p_ID).checked) {
                t_PaperCount = parseInt(t_PaperCount) + 1;
                $('#ContentPlaceHolder1_lblAggregateSelected').text(t_PaperCount)

            }
            else {
                if (t_PaperCount != 0) {
                    t_PaperCount = parseInt(t_PaperCount) - 1;

                    $('#ContentPlaceHolder1_lblAggregateSelected').text(t_PaperCount)
                }
            }
            $('#ContentPlaceHolder1_lblSelectTotal').text(parseInt(t_PaperCount) + parseInt($('#ContentPlaceHolder1_lblRegularSelected').text()) + parseInt($('#ContentPlaceHolder1_lblBacklogSelected').text()))

            t_BackTotal = CalculateExamFees(RollNo, 'AggBacklog', t_PaperCount);


        }

        function CalculateExamFees(RollNo, ExamType, SubjectCount) {
            debugger;
            var t_total = "00.00";
            if (SubjectCount != '0') {

                $.when(
                  $.ajax({
                      type: "POST",
                      contentType: "application/json; charset=utf-8",
                      url: '/WebApp/Examination/StudentExamFormFillUp.aspx/CalculateExamFees',
                      data: '{"RollNo":"' + RollNo + '","ExamType":"' + ExamType + '","SubjectCount":"' + SubjectCount + '"}',
                      processData: false,
                      dataType: "json",
                      success: function (response) {

                      },
                      error: function (a, b, c) {
                          alert("1." + a.responseText);
                      }
                  })

                ).then(function (data, textStatus, jqXHR) {
                    var obj = jQuery.parseJSON(data.d);
                    var arrExamFees = obj.ExamFees;

                    if (arrExamFees[0].Result != "0") {

                        t_total = obj.ExamFees[0].Total;
                        if (ExamType = "AggBacklog") {
                            $('#ContentPlaceHolder1_lblAggregateAmount').text(t_total);
                            TotalAmount = parseInt($('#ContentPlaceHolder1_lblRegularAmount').text()) + parseInt(t_total) + parseInt($('#ContentPlaceHolder1_lblBacklogAmount').text());
                        }
                        else {
                            $('#ContentPlaceHolder1_lblBacklogAmount').text(t_total);
                            TotalAmount = parseInt($('#ContentPlaceHolder1_lblRegularAmount').text()) + parseInt(t_total) + parseInt($('#ContentPlaceHolder1_lblAggregateAmount').text());
                        }
                        

                        $('#ContentPlaceHolder1_lblTotalAmount').text(TotalAmount);
                        $('#ContentPlaceHolder1_btnSubmit').text("Payable Amount Rs. "+TotalAmount);
                       
                        
                    }
                });


            }
        }

    </script>

    <style type="text/css">
        .fsize1em {
            font-size: 1em;
        }

        .demo {
            padding-top: 60px;
            padding-bottom: 60px;
        }

        .more-less {
            float: right;
            color: #fff;
        }

        .panel-box {
            margin-bottom: 20px;
        }

        /*.collapse {
            height: 300px !important;
        }*/
        .auto-style1 {
            left: 0px;
            top: 0px;
        }

        .auto-style6 {
            width: 526px;
        }
    </style>
    <%--</head>
<body>
    <form id="form1" runat="server">--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div class="row text-center" id="LoadingDiv" runat="server">
        <div>Please Wait While Data Is Being Loaded...</div>
        <img src="/WebApp/Login/Loading_hourglass_88px.gif" />
    </div>--%>
    <div class="container-fluid">
        <div id="page-wrapper" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12 cscPgehd">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Semester Examination Form Fill-up</h2>
                </div>
            </div>
            <%---Start of Filter----%>
            <div class="row" style="">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Student Detail
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <table cellspacing="0" cellpadding="0" style="width: 100%; margin: 0 auto;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; margin: 0;">
                                                <tr>
                                                    <td style="/*padding: 3px; */ border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: center; vertical-align: top; width: 135px" rowspan="9">
                                                        <table border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td style="border: 1px solid #ccc; width: 135px; height: 157px; vertical-align: top; padding: 3px;">
                                                                    <img runat="server" src="/webApp/kiosk/Images/photo.png" style="margin: 1px; width: 120px; height: 145px" id="ProfilePhoto" />

                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="border: 1px solid #ccc; width: 135px; vertical-align: top; padding: 3px;">
                                                                    <img runat="server" src="~/WebApp/Kiosk/Images/signature.png" id="ProfileSignature" style="width: 120px; height: 50px;" />

                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Roll Number </b></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblRoll" runat="server"></asp:Label></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1"><b>Enrollment Number</b></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 13px; font-weight: bold;">
                                                        <asp:Label ID="lblRegNo" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Name of the Student</b></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="FullName" runat="server"></asp:Label></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Date of Birth</b></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 13px;">
                                                        <%--<asp:Label ID="" runat="server"></asp:Label>--%>
                                                        <asp:TextBox ID="lblDOB" runat="server" placeholder="DD/MM/YYYY" onkeypress="return ValidateAlpha(event);" onkeydown=" return allowBackspace(event);" maxlength="10" ></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>College</b></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;" colspan="3">
                                                        <asp:Label ID="lblCollege" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Course Name</b></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblBrnachName" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1"><b>Program Name</b></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblProgram" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                        <b>
                                                            <span>Gender</span></b></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="gender" runat="server"></asp:Label></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1"><b>
                                                        <span>Category</span></b></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="Category" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                        <b>Admission Year</b></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblAdmissionYear" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                        <b>Session</b></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblSession" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                        <b>Exam Year</b></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblExamYear" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                        <b>Current Semester</b></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblCurrentSemester" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                        <b>Email Id</b></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:TextBox ID="EmailID" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                        <b>Mobile Number</b></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:TextBox ID="MobileNo" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; color: red" colspan="4">Please check and update your own personal Email Id and Mobile Number as all future communication will made on it.</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                    <div id="PrintRegular" runat="server"></div>
                    <div class="box-heading">
                        <h4 class="box-title register-num">Regular Subject List
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;">
                            <div class="form-group">
                                <asp:GridView ID="GridViewSubject" runat="server" Width="100%" AutoGenerateColumns="false" CssClass="table table-striped table-bordered">
                                    <Columns>
                                        <%--<asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkBacklog" runat="server" onclick="return EnableControls(this);" />
                                                        <asp:HiddenField ID="HdfAppID" runat="server" Value='<%#Eval("AppID")%>' />
                                                        <asp:HiddenField ID="hfPayflag" runat="server" Value='<%#Eval("PayFlag")%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Sl.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                                <asp:HiddenField ID="HdfAppID" runat="server" Value='<%#Eval("RowID")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Semester">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSemester" runat="server" Text='<%#Eval("Semester") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkRegular" Enabled="false" Checked="true" runat="server" />

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--<asp:TemplateField HeaderText="Theory" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkTheory" runat="server" onclick="return fnCalExamFee(this);" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Subject Type" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubjectType" runat="server" Text='<%#Eval("SubjectType") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Subject Code" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubjectCode" runat="server" Text='<%#Eval("SubjectCode") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Subject Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubjectName" runat="server" Text='<%#Eval("SubjectName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ExamYear">
                                            <ItemTemplate>
                                                <asp:Label ID="lblExamYear" runat="server" Text='<%#Eval("ExamYear") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Exam Type">
                                            <ItemTemplate>
                                                <asp:Label ID="lblExamType" runat="server" Text='<%#Eval("ExamType") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="RollNo" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRollNo" runat="server" Text='<%#Eval("RollNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="EnrollmentNo" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEnrollmentNo" runat="server" Text='<%#Eval("EnrollmentNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix">
                    </div>
                    <!---------------Backlog Fields----------->
                    <div id="PrintBacklog" runat="server"></div>
                    <div class="box-heading">
                        <h4 class="box-title register-num">Backlog Subject List
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;">
                            <div class="form-group">
                                <asp:GridView ID="grdBacklog" runat="server" Width="100%" AutoGenerateColumns="false" CssClass="table table-striped table-bordered" OnRowDataBound="grdBacklog_RowDataBound">
                                    <Columns>
                                        <%--<asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkBacklog" runat="server" onclick="return EnableControls(this);" />
                                                        <asp:HiddenField ID="HdfAppID" runat="server" Value='<%#Eval("AppID")%>' />
                                                        <asp:HiddenField ID="hfPayflag" runat="server" Value='<%#Eval("PayFlag")%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Sl.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                                <asp:HiddenField ID="HdfAppID" runat="server" Value='<%#Eval("RowID")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Semester">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSemester" runat="server" Text='<%#Eval("Semester") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkBacklog" runat="server" onclick="return fnCalBackSubject(this);" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Subject Type" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubjectType" runat="server" Text='<%#Eval("SubjectType") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Subject Code" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubjectCode" runat="server" Text='<%#Eval("SubjectCode") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Subject Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubjectName" runat="server" Text='<%#Eval("SubjectName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ExamYear">
                                            <ItemTemplate>
                                                <asp:Label ID="lblExamYear" runat="server" Text='<%#Eval("ExamYear") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Exam Type">
                                            <ItemTemplate>
                                                <asp:Label ID="lblExamType" runat="server" Text='<%#Eval("ExamType") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="RollNo" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRollNo" runat="server" Text='<%#Eval("RollNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="EnrollmentNo" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEnrollmentNo" runat="server" Text='<%#Eval("EnrollmentNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ToAppear" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblToAppear" runat="server" Text='<%#Eval("ToAppear") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>

                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix">
                    </div>
                    <!---------------Aggregate Fields----------->
                    <div id="PrintAggregate" runat="server"></div>
                    <div class="box-heading">
                        <h4 class="box-title register-num">Aggregate Fail Subject List
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;">
                            <div class="form-group">
                                <asp:GridView ID="grdAgg" runat="server" Width="100%" AutoGenerateColumns="false" CssClass="table table-striped table-bordered">
                                    <Columns>
                                        <%--<asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkBacklog" runat="server" onclick="return EnableControls(this);" />
                                                        <asp:HiddenField ID="HdfAppID" runat="server" Value='<%#Eval("AppID")%>' />
                                                        <asp:HiddenField ID="hfPayflag" runat="server" Value='<%#Eval("PayFlag")%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Sl.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                                <asp:HiddenField ID="HdfAppID" runat="server" Value='<%#Eval("RowID")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Semester">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSemester" runat="server" Text='<%#Eval("Semester") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkAgg" runat="server" onclick="return fnCalAggBackSubject(this);" />

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--<asp:TemplateField HeaderText="Theory" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkTheory" runat="server" onclick="return fnCalExamFee(this);" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Subject Type" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubjectType" runat="server" Text='<%#Eval("SubjectType") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Subject Code" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubjectCode" runat="server" Text='<%#Eval("SubjectCode") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Subject Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubjectName" runat="server" Text='<%#Eval("SubjectName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ExamYear">
                                            <ItemTemplate>
                                                <asp:Label ID="lblExamYear" runat="server" Text='<%#Eval("ExamYear") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Exam Type">
                                            <ItemTemplate>
                                                <asp:Label ID="lblExamType" runat="server" Text='<%#Eval("ExamType") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="RollNo" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRollNo" runat="server" Text='<%#Eval("RollNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="EnrollmentNo" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEnrollmentNo" runat="server" Text='<%#Eval("EnrollmentNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix">
                    </div>
                    <!---------------Payment Summery Fields----------->

                    <div class="">
                        <div class="col-lg-9" style="display:none">
                            <div id="divDetails" class="col-md-12 box-container p0">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">Payment Detail
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;">
                                        <div class="form-group">
                                            <asp:GridView ID="grdPayment" runat="server" CellPadding="5" CssClass="table table-striped table-bordered" Style="margin-bottom: 0; margin: 0 auto;" Font-Size="11px" OnRowDataBound="grdPayment_RowDataBound">
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>

                        <!---------------Remarks Fields----------->

                        <div class="col-lg-3 pleft0">
                            <div class="col-md-12 box-container p0">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">Payment Summary
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;">
                                        <div class="form-group">
                                            <table cellpadding="5" cellspacing="0" class="table table-striped table-bordered" style="width: 100%; margin: 0;">
                                                <tr style="font-weight: bold;">
                                                    <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;" rowspan="2">Particulars</td>
                                                    <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: center;" colspan="2">Subject Count</td>
                                                    <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: center;" rowspan="2">Amount</td>
                                                </tr>
                                                <tr style="font-weight: bold;">
                                                    <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: center;">Total</td>
                                                    <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: center;">Selected</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Regular </b></td>
                                                    <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblRegularCount" runat="server"></asp:Label></td>
                                                    <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblRegularSelected" runat="server"></asp:Label></td>
                                                    <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblRegularAmount" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Backlog </b></td>
                                                    <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblBacklogCount" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblBacklogSelected" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblBacklogAmount" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Aggregate </b></td>
                                                    <td style="white-space: nowrap; padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblAggregateCount" runat="server"></asp:Label></td>
                                                    <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblAggregateSelected" runat="server"></asp:Label></td>
                                                    <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblAggregateAmount" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                        <b>Total</b></td>
                                                    <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblTotalCount" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblSelectTotal" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblTotalAmount" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr style="display: none;">
                                                    <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                        <b>Payable Amount</b></td>
                                                    <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;" class="auto-style6" colspan="2">&nbsp;</td>
                                                    <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblPayableAmount" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr style="">
                                                    <td style="padding: 5px; border: 1px solid #ccc;  color: #383E4B; text-align: left;" colspan="4">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr style="">
                                                    <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: center;" colspan="4">
                                                        
                                                        <asp:Label ID="btnSubmit" CssClass="btn btn-primary" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>

                    </div>
                    <!---------------Declaration----------->
                    <div class="row">
                        <div class="col-md-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title manadatory" id="lblDeclaration">
                                    <input name="" type="checkbox" id="chkDeclaration" runat="server" onclick="javascript: SUDeclaration(this.checked);" />Declaration
                                </h4>
                            </div>
                            <div class="box-body box-body-open" id="divDeclaration" style="display:none" >
                                <div class="col-sm-12 col-md-12 col-lg-12">
                                    <div class="text-danger text-danger-green mt0">
                                        <p class="text-justify">
                                            I <b>
                                                <span id="lblName" style="text-transform: uppercase;"></span>
                                            </b>,
                Roll No. <b><span id="lblRollNo" style="text-transform: uppercase;"></span></b>
                                            hereby affirm that the information given by me in the application is complete and true to the best of my knowledge and belief and that I have made the application with the consent and approval of my parents/guardian.
                                        </p>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <br />
                                                    </td>

                                                    <td rowspan="2"><span class="pull-right" style="color: #000;"><span id="lblApplicant" style="text-transform: uppercase; float: right; color: #777; padding-right: 50px;"></span>
                                                        <br />
                                                        Full Name of the Student</span></td>
                                                </tr>
                                                <tr>
                                                    <td><b style="color: #000;"><span class="pull-left" style="padding-right: 3px;">Date : </span>
                                                        <label id="currntdte" style="font-weight: bold"></label>
                                                    </b></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>

                            </div>
                        </div>
                    </div>

                    <!---------------Button----------->
                    <div class="row">
                        <div class="col-md-12 box-container" style="margin-top: 5px;">
                            <div class="box-body box-body-open" style="text-align: center;">
                                
                                <asp:Button ID="GenrateBatch" runat="server" CausesValidation="true" CssClass="btn btn-success" Text="Proceed for Payment" OnClick="GenrateBatch_Click" ValidationGroup="K" />&nbsp;
                                <input id="btnHome" type="button" class="btn btn-danger" value="Close" onclick="window.close();" />
                            </div>
                        </div>

                    </div>
                </div>

                <div class="clearfix"></div>
            </div>
        </div>


    </div>


    <asp:HiddenField ID="hdfRegularAmt" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="hdfBacklogAmt3" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="hdfBacklogAmt4" runat="server"></asp:HiddenField>
    <%--    </form>
</body>
</html>--%>
</asp:Content>

