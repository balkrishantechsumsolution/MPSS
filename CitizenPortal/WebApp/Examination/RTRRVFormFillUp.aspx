<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Citizen/Master/Citizen.Master" AutoEventWireup="true"
    CodeBehind="RTRRVFormFillUp.aspx.cs" Inherits="CitizenPortal.WebApp.Examination.RTRRVFormFillUp" %>

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
            $('#ContentPlaceHolder1_GenrateBatch').prop('disabled', true);
            var MobileNo = $("#ContentPlaceHolder1_MobileNo");
            var EmailID = $("#ContentPlaceHolder1_EmailID");

            //$('#ContentPlaceHolder1_divSearch').hide();

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
                    $('#ContentPlaceHolder1_GenrateBatch').prop('disabled', true);
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

            }
            else {
                $('#divDeclaration').hide(500);
                $('#ContentPlaceHolder1_GenrateBatch').prop('disabled', true);
            }
        }

        function fnCalSubject(p_RowID) {
            debugger;
            var t_Id = "ContentPlaceHolder1_grdSubject_chkSubject_" + p_RowID;
            //CPH_gvDetail_chk_TopUp_0
            var strText = p_RowID.id.split('_');
            var p_ID = strText[3];

            var RollNo = $('#ContentPlaceHolder1_lblRoll').text();
            var t_PaperCount = parseInt($('#ContentPlaceHolder1_lblSubjectSelected').text());
            var t_BackTotal = "00.00";
            var TotalAmount = "00.00";
            if (document.getElementById("ContentPlaceHolder1_grdSubject_chkSubject_" + p_ID).checked) {
                t_PaperCount = parseInt(t_PaperCount) + 1;
                $('#ContentPlaceHolder1_lblSubjectSelected').text(t_PaperCount)

            }
            else {
                if (t_PaperCount != 0) {
                    t_PaperCount = parseInt(t_PaperCount) - 1;

                    $('#ContentPlaceHolder1_lblSubjectSelected').text(t_PaperCount)
                }
            }
            //$('#ContentPlaceHolder1_lblSelectTotal').text(parseInt(t_PaperCount));

            //t_BackTotal = CalculateExamFees(RollNo, 'Backlog', t_PaperCount);

            var TotalAmount = t_PaperCount * $('#ContentPlaceHolder1_ddlFees option:selected').text();

            $('#ContentPlaceHolder1_lblTotalAmount').text('Rs. ' + TotalAmount);
            $('#ContentPlaceHolder1_btnSubmit').text("Payable Amount Rs. " + TotalAmount);
        }

        function fnCalSubjectRT(p_RowID) {
            debugger;
            var t_Id = "ContentPlaceHolder1_grdSubject_chkSubjectRT_" + p_RowID;
            //CPH_gvDetail_chk_TopUp_0
            var strText = p_RowID.id.split('_');
            var p_ID = strText[3];

            var RollNo = $('#ContentPlaceHolder1_lblRoll').text();
            var t_PaperCount = parseInt($('#ContentPlaceHolder1_lblSubjectSelectedRT').text());
            var t_BackTotal = "00.00";
            var TotalAmount = "00.00";
            
            if (document.getElementById("ContentPlaceHolder1_grdSubject_chkSubjectRT_" + p_ID).checked) {
                t_PaperCount = parseInt(t_PaperCount) + 1;
                $('#ContentPlaceHolder1_lblSubjectSelectedRT').text(t_PaperCount)

            }
            else {
                if (t_PaperCount != 0) {
                    t_PaperCount = parseInt(t_PaperCount) - 1;

                    $('#ContentPlaceHolder1_lblSubjectSelectedRT').text(t_PaperCount)
                }
            }
            //$('#ContentPlaceHolder1_lblSelectTotal').text(parseInt(t_PaperCount));

            //t_BackTotal = CalculateExamFees(RollNo, 'Backlog', t_PaperCount);
            if (t_PaperCount > 4) {
                document.getElementById("ContentPlaceHolder1_grdSubject_chkSubjectRT_" + p_ID).checked = false;
                if (t_PaperCount != 0) {
                    t_PaperCount = parseInt(t_PaperCount) - 1;

                    $('#ContentPlaceHolder1_lblSubjectSelectedRT').text(t_PaperCount)
                }
                alert('You cannot select more then 4 RT Subject!');
                return;
            }


            var TotalAmount = t_PaperCount * $('#ContentPlaceHolder1_lblAmountRT').text();

            $('#ContentPlaceHolder1_lblTotalAmountRT').text(TotalAmount);
            var payableAmount = parseInt($('#ContentPlaceHolder1_lblTotalAmountRV').text()) + parseInt($('#ContentPlaceHolder1_lblTotalAmountRT').text());
            $('#ContentPlaceHolder1_btnSubmit').text("Payable Amount Rs. " + payableAmount);

            //$('#ContentPlaceHolder1_btnSubmit').text("Payable Amount Rs. " + parseInt($('#ContentPlaceHolder1_lblTotalAmountRV').text()) + parseInt($('#ContentPlaceHolder1_lblTotalAmountRT').text()));
        }

        function fnCalSubjectRV(p_RowID) {
            debugger;
            var t_Id = "ContentPlaceHolder1_grdSubject_chkSubjectRV_" + p_RowID;
            //CPH_gvDetail_chk_TopUp_0
            var strText = p_RowID.id.split('_');
            var p_ID = strText[3];

            var RollNo = $('#ContentPlaceHolder1_lblRoll').text();
            var t_PaperCount = parseInt($('#ContentPlaceHolder1_lblSubjectSelectedRV').text());
            var t_BackTotal = "00.00";
            var TotalAmount = "00.00";
            
            if (document.getElementById("ContentPlaceHolder1_grdSubject_chkSubjectRV_" + p_ID).checked) {
                t_PaperCount = parseInt(t_PaperCount) + 1;
                $('#ContentPlaceHolder1_lblSubjectSelectedRV').text(t_PaperCount)

            }
            else {
                if (t_PaperCount != 0) {
                    t_PaperCount = parseInt(t_PaperCount) - 1;

                    $('#ContentPlaceHolder1_lblSubjectSelectedRV').text(t_PaperCount)
                }
            }
            //$('#ContentPlaceHolder1_lblSelectTotal').text(parseInt(t_PaperCount));

            //t_BackTotal = CalculateExamFees(RollNo, 'Backlog', t_PaperCount);

            if (t_PaperCount > 4) {
                document.getElementById("ContentPlaceHolder1_grdSubject_chkSubjectRV_" + p_ID).checked = false;
                if (t_PaperCount != 0) {
                    t_PaperCount = parseInt(t_PaperCount) - 1;

                    $('#ContentPlaceHolder1_lblSubjectSelectedRV').text(t_PaperCount)
                }
                alert('You cannot select more then 4 RV subject!');
                return;
            }

            var TotalAmount = t_PaperCount * $('#ContentPlaceHolder1_lblAmountRV').text();

            $('#ContentPlaceHolder1_lblTotalAmountRV').text(TotalAmount);
            var payableAmount = parseInt($('#ContentPlaceHolder1_lblTotalAmountRV').text()) + parseInt($('#ContentPlaceHolder1_lblTotalAmountRT').text());
            $('#ContentPlaceHolder1_btnSubmit').text("Payable Amount Rs. " + payableAmount);
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
            $('#ContentPlaceHolder1_lblSelectTotal').text(parseInt(t_PaperCount) + parseInt($('#ContentPlaceHolder1_lblRegularSelected').text()) + parseInt($('#ContentPlaceHolder1_lblSubjectSelected').text()))

            //t_BackTotal = CalculateExamFees(RollNo, 'AggBacklog', t_PaperCount);

            if (t_PaperCount > 4) {
                document.getElementById("ContentPlaceHolder1_grdSubject_chkSubjectRV_" + p_ID).checked = false;
                alert('You cannot select more then 4 RV Subject!');
                return;
            }

            var TotalAmount = t_PaperCount * $('#ddlFees').val();

            $('#ContentPlaceHolder1_lblTotalAmount').text(TotalAmount);
            $('#ContentPlaceHolder1_btnSubmit').text("Payable Amount Rs. " + TotalAmount);
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
                            TotalAmount = parseInt($('#ContentPlaceHolder1_lblRegularAmount').text()) + parseInt(t_total) + parseInt($('#ContentPlaceHolder1_lblSubjectAmount').text());
                        }
                        else {
                            $('#ContentPlaceHolder1_lblSubjectAmount').text(t_total);
                            TotalAmount = parseInt($('#ContentPlaceHolder1_lblRegularAmount').text()) + parseInt(t_total) + parseInt($('#ContentPlaceHolder1_lblAggregateAmount').text());
                        }


                        $('#ContentPlaceHolder1_lblTotalAmount').text(TotalAmount);
                        $('#ContentPlaceHolder1_btnSubmit').text("Payable Amount Rs. " + TotalAmount);


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
    </style>
    <%--<asp:TemplateField>
        <ItemTemplate>
            <asp:CheckBox ID="chkSubject" runat="server" onclick="return EnableControls(this);" />
            <asp:HiddenField ID="HdfAppID" runat="server" Value='<%#Eval("AppID")%>' />
            <asp:HiddenField ID="hfPayflag" runat="server" Value='<%#Eval("PayFlag")%>' />
        </ItemTemplate>
    </asp:TemplateField>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <div id="page-wrapper" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12 cscPgehd">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Semester RT / RRV / RRV / ABR Form Fill-up</h2>
                </div>
            </div>

            <!---------------Instruction Detail----------->
            <div class="row">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Instruction to Fill the Form
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!---------------Student Detail----------->
            <div class="row">
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
                                                    <td style="/*padding: 3px; */ border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: center; vertical-align: top; width: 135px" rowspan="8">
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
                                                        <%--<asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSubject" runat="server" onclick="return EnableControls(this);" />
                                                        <asp:HiddenField ID="HdfAppID" runat="server" Value='<%#Eval("AppID")%>' />
                                                        <asp:HiddenField ID="hfPayflag" runat="server" Value='<%#Eval("PayFlag")%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                        <asp:TextBox ID="lblDOB" runat="server" placeholder="DD/MM/YYYY" onkeypress="return ValidateAlpha(event);" onkeydown=" return allowBackspace(event);" MaxLength="10"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="lblDOB" Display="Dynamic"
                                                            ErrorMessage="Bate of Borth is blank" ValidationGroup="K" ForeColor="Red" />
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
                                                        <b>Email Id</b></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:TextBox ID="EmailID" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="EmailID" Display="Dynamic"
                                                            ErrorMessage="Email Id is blank" ValidationGroup="K" ForeColor="Red" />
                                                    </td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                        <b>Mobile Number</b></td>
                                                    <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                        <asp:TextBox ID="MobileNo" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="MobileNo" Display="Dynamic"
                                                            ErrorMessage="Mobile No. is blank" ValidationGroup="K" ForeColor="Red" />
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

                </div>
            </div>

            <!---------------Search Filter----------->
            <div class="row">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Semester Examination Detail
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">Application Type</label>
                                <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlType_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="0">--Select Application--</asp:ListItem>
                                </asp:DropDownList>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlType" InitialValue="0" Display="Dynamic"
                                    ErrorMessage="Please select Application" ValidationGroup="A" ForeColor="Red" />

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlSession">
                                    Exam Session
                                </label>
                                <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" InitialValue="0" ControlToValidate="ddlSession" Display="Dynamic"
                                    ErrorMessage="Please select Session" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlSemester">
                                    Semester
                                </label>
                                <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" InitialValue="0" ControlToValidate="ddlSemester" Display="Dynamic" Style="white-space: nowrap"
                                    ErrorMessage="Please select Semester" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlExamType">
                                    Exam Type
                                </label>
                                <asp:DropDownList ID="ddlExamType" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>

                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="" for="">
                                    Start Date - End Date
                                </label>
                                <asp:Label ID="lblExamDate" runat="server" CssClass="form-control"></asp:Label>
                            </div>

                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2" id="divFees" runat="server" style="display:none">
                            <div class="form-group">
                                <label class="" for="">
                                    Fees Per Subject
                                </label>
                                <asp:DropDownList ID="ddlFees" runat="server" CssClass="form-control" Enabled="false">
                                </asp:DropDownList>
                            </div>

                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2  text-right">
                            <div class="form-group">
                                <label>
                                    &nbsp;</label>
                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" ValidationGroup="A" />
                            </div>

                        </div>
                        <div class="clearfix"></div>
                    </div>

                </div>
            </div>

            <div id="divSearch" runat="server">
                <!---------------Subject Details----------->
                <div class="row">
                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Select Subject for Retotaling
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;">
                                <div class="form-group">
                                    <asp:GridView ID="grdSubject" runat="server" Width="100%" AutoGenerateColumns="false" CssClass="table table-striped table-bordered" OnRowDataBound="grdSubject_RowDataBound">
                                        <Columns>
                                            <%--<asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSubject" runat="server" onclick="return EnableControls(this);" />
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
                                            <asp:TemplateField HeaderText="Select" Visible="false">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkSubject" runat="server" onclick="return fnCalSubject(this);" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Select RT">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkSubjectRT" runat="server" onclick="return fnCalSubjectRT(this);" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Select RV">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkSubjectRV" runat="server" onclick="return fnCalSubjectRV(this);" />
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
                                            <asp:TemplateField HeaderText="Attendance" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblToAppear" runat="server" Text='<%#Eval("Attendance") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ForRT" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblForRT" runat="server" Text='<%#Eval("ForRT") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ForRT" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblForRV" runat="server" Text='<%#Eval("ForRV") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>

                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>

                <!---------------Payment / Declaration----------->
                <div class="row">

                    <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5 box-container">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Payment Summary
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;">
                                <div class="form-group">
                                    <table cellpadding="5" cellspacing="0" class="table table-striped table-bordered" style="width: 100%; margin: 0;">
                                        <tr style="font-weight: bold;">
                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;vertical-align:middle" rowspan="2">Particulars</td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: center;" colspan="3">Subject Count</td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: center;" rowspan="2">Amount</td>
                                        </tr>
                                        <tr style="font-weight: bold;">
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: center;">Rate</td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: center;">Total</td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: center;">Selected</td>
                                        </tr>
                                        <tr id="trService" runat="server">
                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; white-space: nowrap"><b>
                                                <asp:Label ID="lblAppType" runat="server"></asp:Label>
                                                &nbsp;</b></td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                <asp:Label ID="lblAmount" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                <asp:Label ID="lblSubjectCount" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                <asp:Label ID="lblSubjectSelected" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                <asp:Label ID="lblTotalAmount" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr id="trRT" runat="server">
                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; white-space: nowrap"><b>
                                                <asp:Label ID="Label1" runat="server">Re-Totaling (RT)</asp:Label>
                                                &nbsp;</b></td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">Rs.<asp:Label ID="lblAmountRT" runat="server">70</asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                <asp:Label ID="lblSubjectCountRT" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;"><asp:Label ID="lblSubjectSelectedRT" runat="server">0</asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">Rs.<asp:Label ID="lblTotalAmountRT" runat="server">0</asp:Label>
                                            </td>
                                        </tr>
                                        <tr id="trRV" runat="server">
                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; white-space: nowrap"><b>
                                                <asp:Label ID="Label5" runat="server">Re-Evaluation (RV)</asp:Label>
                                                &nbsp;</b></td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">Rs.<asp:Label ID="lblAmountRV" runat="server">400</asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                <asp:Label ID="lblSubjectCountRV" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;"><asp:Label ID="lblSubjectSelectedRV" runat="server">0</asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">Rs.<asp:Label ID="lblTotalAmountRV" runat="server">0</asp:Label>
                                            </td>
                                        </tr>
                                        <%-- <%# Container.DataItemIndex + 1 %>--%>
                                        <tr style="display:none">
                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">&nbsp;</td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">&nbsp;</td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">&nbsp;</td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">&nbsp;</td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">&nbsp;</td>
                                        </tr>
                                        <tr style="">
                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: center;" colspan="5">

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
                    <div class="col-xs-12 col-sm-12 col-md-7 col-lg-7 box-container">
                        <div class="box-heading">
                            <h4 class="box-title manadatory" id="lblDeclaration">
                                <input name="" type="checkbox" id="chkDeclaration" runat="server" onclick="javascript: SUDeclaration(this.checked);" />Declaration
                            </h4>
                        </div>
                        <div class="box-body box-body-open" id="divDeclaration" style="display: none">
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
        </div>

        <div class="clearfix"></div>

    </div>

    <asp:HiddenField ID="hdfRegularAmt" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="hdfBacklogAmt3" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="hdfBacklogAmt4" runat="server"></asp:HiddenField>

</asp:Content>

