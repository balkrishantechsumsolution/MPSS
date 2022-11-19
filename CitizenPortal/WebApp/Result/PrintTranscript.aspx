<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintTranscript.aspx.cs" Inherits="CitizenPortal.WebApp.Result.PrintTranscript" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Print Transcript</title>
    <link href="/WebApp/Login/css/bootstrap.css" rel="stylesheet" />
    <script>
        function CallPrint(strid) {
            var prtContent = document.getElementById('divPrint');
            var WinPrint = window.open('', '', 'left=0,top=0,width=900,height=700,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }
    </script>
   

</head>
<body>
    <form id="form1" runat="server">

        <div id="page-iframe" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-md-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title" style="text-align: center;">Download Transcript</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                            <table style="width: 794px; height: 60%; background-color: #f9f9f9; padding: 10px; border-top-left-radius: 2px; border-top-right-radius: 2px; border-top: 8px solid #8bbbea; box-shadow: 3px 3px 5px #e0e0e0; margin: 0 auto;">
                                <tr>
                                    <td colspan="2" style="color: red; font-weight: bold; text-align: center">
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="row" style="">
                                            <div class="col-md-12 box-container">
                                                <div class="box-heading">
                                                    <h4 class="box-title register-num" style="padding-left: 12px;">Search Filter
                                                    </h4>
                                                </div>

                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                    <div class="form-group">
                                                        <label class="" for="ddlCollege">
                                                            College</label>
                                                        <asp:DropDownList ID="ddlCollege" runat="server" Width="100%" CssClass="form-control">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlCollege" InitialValue="0" Display="Dynamic"
                                                            ErrorMessage="Please select College" ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                    <div class="form-group">
                                                        <label class="" for="ddlBranch">
                                                            Branch/Course Name
                                                        </label>
                                                        <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" AutoPostBack="true">
                                                            <asp:ListItem>Select Branch</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlBranch" InitialValue="0" Display="Dynamic"
                                                            ErrorMessage="Please select Branch" ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlProgram">
                                                            Program
                                                        </label>
                                                        <asp:DropDownList ID="ddlProgram" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged" AutoPostBack="true">
                                                            <asp:ListItem Value="0">Select Program</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" InitialValue="0" ControlToValidate="ddlProgram" Display="Dynamic"
                                        ErrorMessage="Please select Program" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlExamType">
                                                            Exam Type
                                                        </label>
                                                        <asp:DropDownList ID="ddlExamType" runat="server" CssClass="form-control">
                                                            <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                            <asp:ListItem Value="Regular" Text="Regular"></asp:ListItem>
                                                            <asp:ListItem Value="BackLog" Text="BackLog"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlExamType" InitialValue="0" Display="Dynamic"
                                                            ErrorMessage="Please select exam type." ValidationGroup="G" ForeColor="Red" />
                                                    </div>

                                                </div>

                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <label class="" for="ddlSession">
                                                            Session/Exam Year
                                                        </label>
                                                        <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control">
                                                            <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                            <asp:ListItem Value="Nov-Dec 2021" Text="Nov-Dec 2021"></asp:ListItem>
                                                            <asp:ListItem Value="Apr-May 2022" Text="Apr-May 2022"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" InitialValue="0" ControlToValidate="ddlSession" Display="Dynamic"
                                                            ErrorMessage="Please select SESSION" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <label class="" for="ddlSemester">
                                                            Semester
                                                        </label>
                                                        <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control">
                                                            <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                            <asp:ListItem Value="7 SEMESTER" Text="7 SEMESTER"></asp:ListItem>
                                                            <asp:ListItem Value="8 SEMESTER" Text="8 SEMESTER"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="0" ControlToValidate="ddlSemester" Display="Dynamic"
                                                            ErrorMessage="Please select SEMESTER." ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <label class="" for="ddl_range">
                                                            Range
                                                        </label>
                                                        <asp:DropDownList ID="ddlRange" runat="server" CssClass="form-control">
                                                            <asp:ListItem Value="" Text="--Select--"></asp:ListItem>
                                                            <asp:ListItem Value="0" Text="1-25"></asp:ListItem>
                                                            <asp:ListItem Value="25" Text="26-50"></asp:ListItem>
                                                            <asp:ListItem Value="50" Text="51-75"></asp:ListItem>
                                                            <asp:ListItem Value="75" Text="76-100"></asp:ListItem>
                                                            <asp:ListItem Value="100" Text="101-125"></asp:ListItem>
                                                            <asp:ListItem Value="125" Text="126-150"></asp:ListItem>
                                                            <asp:ListItem Value="150" Text="151-175"></asp:ListItem>
                                                            <asp:ListItem Value="175" Text="176-200"></asp:ListItem>
                                                            <asp:ListItem Value="200" Text="201-225"></asp:ListItem>
                                                            <asp:ListItem Value="225" Text="226-250"></asp:ListItem>
                                                            <asp:ListItem Value="250" Text="251-275"></asp:ListItem>
                                                            <asp:ListItem Value="275" Text="276-300"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="" ControlToValidate="ddlRange" Display="Dynamic"
                                                            ErrorMessage="Please select Range." ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <label class="" for="TxtRollNo">
                                                            Roll No
                                                        </label>
                                                        <asp:TextBox ID="TxtRollNo" runat="server" CssClass="form-control" ToolTip=""></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
                                                    <asp:Button ID="btnSearch" runat="server" CssClass="btn-success" Text="Search" OnClick="btnSearch_Click" ValidationGroup="G" />
                                                    <%--<asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" Height="36px" Width="115px" />--%>
                                                    <input type="button" id="btnPrint" class="btn-primary" value="Print" onclick="javascript: CallPrint('divPrint');" />
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2" style="padding: 20px;">
                                        <div id="divPrint" style="margin: 0 auto; width: 100%;" align="center">
                                            <asp:DataList ID="grdAttendanceSheet" runat="server" Width="805px" RepeatColumns="1" RepeatDirection="Horizontal" OnItemDataBound="grdAttendanceSheet_ItemDataBound">
                                                <ItemTemplate>
                                                    <div style="margin: 0 auto;width: 800px /* margin-left: 212px; */;margin-top: -10px;">
                                                    <div style="margin: 0 auto 50px;width: 794px;/* min-height: 144px; */height: 100%;margin-bottom: 133px;position: relative;border: none;padding: 1px;font-family: Arial, Helvetica, sans-serif;">
                                                       <h2 style="margin-left: 344px;">TRANSCRIPT</h2>
                                                        <img src="../../Sambalpur/img/university-logo-bottom.png" style="margin-top: -63px;float: left;margin-top: -13px;"/>
                                                       <br>
                                                        <span style="margin-left: 26px;font-size: 22px;margin-top: 20px;font-weight: 700;">छत्तीसगढ़ स्वामी विवेकानंद तकनीकी विश्वविद्यालय, भिलाई (छ.ग.) इंडिया</span><br>
                                                        <span style="margin-left: 25px;font-size: 16px;margin-top: 20px;font-weight: 700;margin-top: -12px;">CHHATTISGARH SWAMI VIVEKANAND TECHNICAL UNIVERSITY,BHILAI(C.G.) INDIA</span>
                                                            </div>
                                                        <table style="width: 100%;font-family: Arial, Helvetica, sans-serif;font-size: 12px;margin-top: -75px;" cell-padding="0" cell-spacing="0">
                                                            <tr>
                                                                <td>
                                                                    <table style="width: 100%;font-family: Arial, Helvetica, sans-serif;font-size: 12px;" cell-padding="0" cell-spacing="0">
                                                                        <tr style="line-height: 1.5;">
                                                                            <td style="font-size: 12px; width: 200px; text-align: left">NAME OF THE EXAMINATION: 
                                                                            </td>
                                                                            <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; text-transform: uppercase; width: 25%">
                                                                                <b>
                                                                                    <asp:Label ID="lblprogramname" runat="server" Text='<%# Eval("programname").ToString() %>'></asp:Label>
                                                                                </b>
                                                                            </td>
                                                                            <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; text-transform: uppercase; width: 50px">&nbsp;</td>
                                                                            <td style="font-size: 12px; width: 85px">SEMESTER:
                                                                            </td>
                                                                            <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px;">
                                                                                <b>
                                                                                    <asp:Label ID="lblSemester" runat="server" Text='<%# Eval("Semester").ToString() %>'></asp:Label>
                                                                                </b>
                                                                            </td>
                                                                            <td style="font-size: 12px; width: 85px;">SESSION: 
                                                                            </td>
                                                                            <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; width: 110px;">
                                                                                <b>
                                                                                    <asp:Label ID="lblexamsession" runat="server" Text='<%# Eval("examsession").ToString() %>'></asp:Label>
                                                                                </b>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="line-height: 1.5;">
                                                                            <td style="font-size: 12px;">NAME OF THE CANDIDATE:
                                                                            </td>

                                                                            <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; text-transform: uppercase;">
                                                                                <b>
                                                                                    <asp:Label ID="lblname" runat="server" Text='<%# Eval("name").ToString() %>'></asp:Label>
                                                                                </b>
                                                                            </td>

                                                                            <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; text-transform: uppercase;">&nbsp;</td>
                                                                            <td style="font-size: 12px;">ROLL NO: 
                                                                            </td>
                                                                            <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; width: 120px">
                                                                                <b>
                                                                                    <asp:Label ID="lblRollNo" runat="server" Text='<%# Eval("RollNo").ToString() %>'></asp:Label>
                                                                                </b>
                                                                            </td>
                                                                            <td style="font-size: 12px; white-space: nowrap">ENROLL NO: 
                                                                            </td>
                                                                            <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px;">
                                                                                <b>
                                                                                    <asp:Label ID="lblEnrollmentNo" runat="server" Text='<%# Eval("EnrollmentNo").ToString() %>'></asp:Label>
                                                                                </b>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="line-height: 1.5;">
                                                                            <td style="font-size: 12px; white-space: nowrap">FATHER'S/HUSBAND'S NAME:
                                                                            </td>
                                                                            <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; text-transform: uppercase;">
                                                                                <b>
                                                                                    <asp:Label ID="lblFather" runat="server" Text='<%# Eval("Father").ToString() %>'></asp:Label>
                                                                                </b>
                                                                            </td>
                                                                            <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; text-transform: uppercase;">&nbsp;</td>
                                                                            <td></td>
                                                                            <td></td>
                                                                            <td style="font-size: 12px;">STATUS:
                                                                            </td>
                                                                            <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px;">
                                                                                <b>
                                                                                    <asp:Label ID="lblstat" runat="server" Text='<%# Eval("ExamType").ToString() %>'></asp:Label>
                                                                                </b>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="line-height: 1.5;">
                                                                            <td style="font-size: 12px;">NAME OF INSTITUTION: 
                                                                            </td>
                                                                            <td colspan="6" style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; text-transform: uppercase;">
                                                                                <b>
                                                                                    <asp:Label ID="lblNOI" runat="server" Text='<%# Eval("collegename").ToString() %>'></asp:Label>
                                                                                </b>
                                                                            </td>
                                                                        </tr>
                                                                    </table>

                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>

                                                                    <table style="width: 100%; font-family: Arial, Helvetica, sans-serif; font-size: 11px;" cell-padding="0" cell-spacing="0">
                                                                        <tr>
                                                                            <td colspan="20">
                                                                                <div style="text-align: justify; font-size: 1.8pt; font-weight: bold; color: #000000; font-weight: bold; letter-spacing: 0px; -ms-transform: rotate(360deg); transform: rotate(360deg); width: 100%">
                                                                                    CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CS
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td rowspan="5" style="text-align: center;width:30px">S.NO</td>
                                                                            <td rowspan="5" style="text-align: center">
                                                                                <div style="margin-left: -34px; font-size: 1.8px; color: #000000; font-weight: bold; letter-spacing: 0px; position: absolute; -ms-transform: rotate(90deg); transform: rotate(90deg);">
                                                                                    CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU
                                                                                </div>
                                                                            </td>
                                                                            <td rowspan="5" style="text-align: center;width:75px">CODE</td>

                                                                            <td style="text-align: center; width: 250px" rowspan="5">SUBJECT</td>
                                                                            <td style="text-align: center" rowspan="5">
                                                                                <div style="margin-left: -34px; font-size: 1.8px; color: #000000; font-weight: bold; letter-spacing: 0px; position: absolute; -ms-transform: rotate(90deg); transform: rotate(90deg);">
                                                                                    CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU
                                                                                </div>
                                                                            </td>
                                                                            <td colspan="6" style="text-align: center">EXAMINATION</td>
                                                                            <td style="text-align: center" rowspan="5">
                                                                                <div style="margin-left: -34px; font-size: 1.8px; color: #000000; font-weight: bold; letter-spacing: 0px; position: absolute; -ms-transform: rotate(90deg); transform: rotate(90deg);">
                                                                                    CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU
                                                                                </div>
                                                                            </td>
                                                                            <td colspan="2" style="text-align: center" rowspan="3">TOTAL MARKS</td>
                                                                            <td style="text-align: center" rowspan="5">
                                                                                <div style="margin-left: -34px; font-size: 1.8px; color: #000000; font-weight: bold; letter-spacing: 0px; position: absolute; -ms-transform: rotate(90deg); transform: rotate(90deg);">
                                                                                    CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU
                                                                                </div>
                                                                            </td>
                                                                            <td style="text-align: center" rowspan="5">LETTER<br />GRADE</td>
                                                                            <td style="text-align: center" rowspan="5">
                                                                                <div style="margin-left: -34px; font-size: 1.8px; color: #000000; font-weight: bold; letter-spacing: 0px; position: absolute; -ms-transform: rotate(90deg); transform: rotate(90deg);">
                                                                                    CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU
                                                                                </div>
                                                                            </td>
                                                                            <td style="text-align: center" rowspan="5">GRADE<br />POINT</td>
                                                                            <td style="text-align: center" rowspan="5">
                                                                                <div style="margin-left: -34px; font-size: 1.8px; color: #000000; font-weight: bold; letter-spacing: 0px; position: absolute; -ms-transform: rotate(90deg); transform: rotate(90deg);">
                                                                                    CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU
                                                                                </div>
                                                                            </td>
                                                                            <td style="text-align: center" rowspan="5">CREDITS<br />EARNED</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="6">
                                                                                <div style="width:100%;font-size: 1.8px; color: #000000; font-weight: bold; letter-spacing: 0px; text-align: justify; -ms-transform: rotate(360deg); transform: rotate(360deg);">
                                                                                    CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CS
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" style="text-align: center">ESE</td>
                                                                            <td colspan="2" style="text-align: center">CT</td>
                                                                            <td colspan="2" style="text-align: center">TA</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="6">
                                                                                <div style="width:100%;font-size: 1.8px; color: #000000; font-weight: bold; letter-spacing: 0px; text-align: justify; -ms-transform: rotate(360deg); transform: rotate(360deg);">
                                                                                     CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CS
                                                                                </div>
                                                                            </td>
                                                                            <td colspan="2">
                                                                                <div style="font-size: 1.8px; color: #000000; font-weight: bold; letter-spacing: 0px; text-align: justify; -ms-transform: rotate(360deg); transform: rotate(360deg);">
                                                                                    CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CS
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: center;">MAX </td>
                                                                            <td style="text-align: center;">OBT</td>
                                                                            <td style="text-align: center;">MAX </td>
                                                                            <td style="text-align: center;">OBT</td>
                                                                            <td style="text-align: center;">MAX</td>
                                                                            <td style="text-align: center;">OBT</td>
                                                                            <td style="text-align: center;">MAX</td>
                                                                            <td style="text-align: center;">OBT</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="20">
                                                                                <div style="text-align: justify; font-size: 1.8pt; font-weight: bold; color: #000000; font-weight: bold; letter-spacing: 0px; -ms-transform: rotate(360deg); transform: rotate(360deg); width: 100%">
                                                                                    CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CS
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height:331px;vertical-align:top;padding-bottom: 36px;border-collapse:separate;border-spacing:0 1em">
                                                                    <div style="margin-top: 10px; display: contents; vertical-align:top">
                                                                        <asp:GridView runat="server" ID="GrdRslt" AutoGenerateColumns="false" Font-Bold="True" 
                                                                            DataKeyNames="" BorderColor="transparent" style="border-collapse:separate;border-spacing:0 4px"
                                                                            EmptyDataText="Record Not Found" ShowHeader="False" Width="100%" BorderWidth="0" Font-Names="Arial, Helvetica, sans-serif" Font-Size="12px" AlternatingRowStyle-VerticalAlign="Top">
                                                                           <rowstyle Height="20px" />
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="S.No." ItemStyle-Width="40px" HeaderStyle-HorizontalAlign="Left" >
                                                                                    <ItemTemplate>
                                                                                        &nbsp;&nbsp;<%# Container.DataItemIndex + 1 %>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                                                                </asp:TemplateField>
                                                                                <asp:BoundField DataField="Subject_code" HeaderText="Code" ItemStyle-Width="75px"></asp:BoundField>
                                                                                <asp:BoundField DataField="SubjectName" HeaderText="Code" ItemStyle-Width="250px"></asp:BoundField>
                                                                                <asp:BoundField DataField="maxese" HeaderText="MAX" ItemStyle-Width="28px"></asp:BoundField>
                                                                                <asp:BoundField DataField="maxesetimes" HeaderText="OBT" ItemStyle-Width="27px"></asp:BoundField>
                                                                                <asp:BoundField DataField="maxct" HeaderText="MAX" ItemStyle-Width="28px"></asp:BoundField>
                                                                                <asp:BoundField DataField="max_ctobt" HeaderText="OBT" ItemStyle-Width="27px"></asp:BoundField>
                                                                                <asp:BoundField DataField="maxta" HeaderText="MAX" ItemStyle-Width="27px"></asp:BoundField>
                                                                                <asp:BoundField DataField="max_taobt" HeaderText="OBT" ItemStyle-Width="30px"></asp:BoundField>
                                                                                <asp:BoundField DataField="total" HeaderText="MAX" ItemStyle-Width="40px"></asp:BoundField>
                                                                                <asp:BoundField DataField="totalobt" HeaderText="OBT" ItemStyle-Width="35px"></asp:BoundField>                                                  
                                                                                <asp:BoundField DataField="LetterGrade" HeaderText="Letter Grade" ItemStyle-Width="45px">
                                                                                    <%--<ItemStyle HorizontalAlign="Center" />--%>
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="gradepoint" HeaderText="Grade Point"></asp:BoundField>
                                                                                <asp:BoundField DataField="CreditPoint" HeaderText="Credit Point"></asp:BoundField>
                                                                                               </Columns>                                                                            
                                                                        </asp:GridView>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table style="width: 100%; margin-top: 10px">
                                                                        <tr>
                                                                            <td style="width: 70%; font-size: 13px; padding-left: 28px;">Total Marks In Words :  <b style="font-family: Arial, Helvetica, sans-serif; font-size: 12px;">
                                                                                <asp:Label runat="server" ID="totmks"></asp:Label>
                                                                                ONLY</b>
                                                                            </td>
                                                                            <td style="font-size: 13px;">In Figure :<b><asp:Label runat="server" ID="infig"></asp:Label></b>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div style="text-align: justify; font-size: 1.8pt; font-weight: bold; color: #000000; font-weight: bold; letter-spacing: 0px; -ms-transform: rotate(360deg); transform: rotate(360deg); width: 100%">
                                                                        CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CSVTU CS
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table style="width: 100%; font-family: Arial, Helvetica, sans-serif; font-size: 12px;" cell-padding="0" cell-spacing="0">
                                                                        <tr>
                                                                            <td style="width: 70%">
                                                                                <div style="font-size: 13px; padding-left: 28px;">
                                                                                    Total Credits Earned: <b style="font-family: Arial, Helvetica, sans-serif;">
                                                                                        <asp:Label ID="totCredits" runat="server"></asp:Label>
                                                                                    </b>
                                                                                </div>
                                                                            </td>
                                                                            <td>&nbsp;</td>
                                                                            <td style="width: 150px;">
                                                                                <div style="font-size: 13px; width: 100px">
                                                                                    SPl = <b style="font-family: Arial, Helvetica, sans-serif;">
                                                                                        <asp:Label ID="lblSpi" runat="server"></asp:Label></b>
                                                                                </div>
                                                                            </td>
                                                                            <td style="width: 150px;">
                                                                                <div style="font-size: 13px;">
                                                                                    CPI = <b style="font-family: Arial, Helvetica, sans-serif;">
                                                                                        <asp:Label ID="lblCPI" runat="server"></asp:Label>
                                                                                    </b>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>&nbsp;</td>
                                                                            <td>&nbsp;</td>
                                                                            <td style="width: 150px;">
                                                                                <div>
                                                                                    Result : <b style="font-family: Arial, Helvetica, sans-serif;">
                                                                                        <asp:Label ID="lblResult" runat="server"></asp:Label>
                                                                                    </b>
                                                                                </div>
                                                                            </td>
                                                                            <td style="width: 150px;">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>&nbsp;</td>
                                                                            <td>&nbsp;</td>
                                                                            <td style="width: 150px;">
                                                                                 <asp:Panel ID= "pnlDivision"  runat = "server">
                                                                                <div>
                                                                                    Division : <b style="font-family: Arial, Helvetica, sans-serif;">
                                                                                        <asp:Label runat="server" ID="LblDivision" Style="position: absolute"></asp:Label>
                                                                                    </b>
                                                                                </div>
                                                                                      </asp:Panel>
                                                                            </td>
                                                                            <td style="width: 150px;">&nbsp;</td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                           <%-- <tr>
                                                                <td>&nbsp;</td>
                                                            </tr>--%>
                                                            <tr>
                                                                <td style="bottom: 0; vertical-align: bottom">
                                                                    <table style="width: 100%; font-family: Arial, Helvetica, sans-serif; font-size: 12px;" cell-padding="0" cell-spacing="0">
                                                                        <tr>
                                                                            <td style="vertical-align: top">
                                                                                 <table style="border: 1px solid black; border-collapse: collapse; font-size: 12px;" cell-padding="5">
                                                                                    <tr>
                                                                                        <td colspan="2" style="text-align: center;padding:5px; border: 1px solid black; ">Grace Marks
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="text-align: center; border: 1px solid black;padding:5px; border-collapse: collapse;">Subject Code
                                                                                        </td>
                                                                                        <td style="text-align: center; border: 1px solid black;padding:5px; border-collapse: collapse;">Subject Code
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="text-align: center; border: 1px solid black;padding:5px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="Label1">&nbsp;</asp:Label></b>
                                                                                        </td>
                                                                                        <td style="text-align: center; border: 1px solid black;padding:5px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="Label2">&nbsp;</asp:Label></b>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                <table style="border: 1px solid black;border-collapse: collapse;font-size: 12px;margin-top: -75px;margin-left: 180px;">
                                                                                    <tr>
                                                                                        <td colspan="2" style="text-align: center;padding:5px; border: 1px solid black; ">Semester Total of Marks
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="text-align: center; border: 1px solid black;padding:5px; border-collapse: collapse;">Maximum
                                                                                        </td>
                                                                                        <td style="text-align: center; border: 1px solid black;padding:5px; border-collapse: collapse;">Obtained
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; text-align: center;padding:5px; border: 1px solid black; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="total"></asp:Label></b>
                                                                                        </td>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; text-align: center;padding:5px; border: 1px solid black; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="totalobt"></asp:Label></b>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                <br />
                                                                                 <asp:Panel ID= "pnltotal"  runat = "server">
                                                                                <table runat="server" id="totalsems" style="border: 1px solid black; border-collapse: collapse; font-size: 12px;" cell-padding="5">
                                                                                    <tr style="border: 1px solid black; border-collapse: collapse; text-align: center;">
                                                                                        <td style="border: 1px solid black;padding:3px; border-collapse: collapse;">SEM
                                                                                        </td>
                                                                                        <td style="border: 1px solid black;padding:3px; border-collapse: collapse;">1
                                                                                        </td>
                                                                                        <td style="border: 1px solid black;padding:3px; border-collapse: collapse;">2
                                                                                        </td>
                                                                                        <td style="border: 1px solid black;padding:3px; border-collapse: collapse;">3
                                                                                        </td>
                                                                                        <td style="border: 1px solid black;padding:3px; border-collapse: collapse;">4
                                                                                        </td>
                                                                                        <td style="border: 1px solid black;padding:3px; border-collapse: collapse;">5
                                                                                        </td>
                                                                                        <td style="border: 1px solid black;padding:3px; border-collapse: collapse;">6
                                                                                        </td>
                                                                                        <td style="border: 1px solid black;padding:3px; border-collapse: collapse;">7
                                                                                        </td>
                                                                                        <td style="border: 1px solid black;padding:3px; border-collapse: collapse;">Final
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="border: 1px solid black;padding:3px; border-collapse: collapse; text-align: center;">
                                                                                        <td style="border: 1px solid black;padding:3px; border-collapse: collapse;">MARKS
                                                                                        </td>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black;padding:3px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="obt1"></asp:Label>
                                                                                            </b>
                                                                                        </td>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black;padding:3px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="obt2"></asp:Label></b>
                                                                                        </td>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black;padding:3px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="obt3"></asp:Label></b>
                                                                                        </td>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black;padding:3px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="obt4"></asp:Label></b>
                                                                                        </td>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black;padding:3px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="obt5"></asp:Label></b>
                                                                                        </td>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black;padding:3px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="obt6"></asp:Label></b>
                                                                                        </td>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black;padding:3px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="obt7"></asp:Label></b>
                                                                                        </td>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black;padding:3px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="totalofallsem"></asp:Label></b>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="border: 1px solid black; border-collapse: collapse; text-align: center;">
                                                                                        <td style="border: 1px solid black;padding:3px; border-collapse: collapse;">OUT OF
                                                                                        </td>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black;padding:3px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="tot1"></asp:Label></b>
                                                                                        </td>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black;padding:3px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="tot2"></asp:Label></b>
                                                                                        </td>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black;padding:3px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="tot3"></asp:Label></b>
                                                                                        </td>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black;padding:3px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="tot4"></asp:Label></b>
                                                                                        </td>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black;padding:3px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="tot5"></asp:Label></b>
                                                                                        </td>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black;padding:3px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="tot6"></asp:Label></b>
                                                                                        </td>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black;padding:3px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="tot7"></asp:Label></b>
                                                                                        </td>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black;padding:3px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="totalsumofsem"></asp:Label></b>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                     </asp:Panel>
                                                                                <asp:Panel ID= "PnlCumuBox"  runat = "server">
                                                                                <table runat="server" id="Table1" style="border: 1px solid black;border-collapse: collapse;font-size: 12px;width: 65%;" cell-padding="5">
                                                                                    <tr style="border: 1px solid black; border-collapse: collapse; text-align: center;">
                                                                                        <td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CUMULATIVE TOTAL OF MARKS
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="border: 1px solid black;padding:3px; border-collapse: collapse; text-align: center;">
                                                                                        <td style="border: 1px solid black;padding:3px; border-collapse: collapse;">MAXIMUM
                                                                                        </td>
                                                                                        <td style="border: 1px solid black;padding:3px; border-collapse: collapse;">OBTAINED
                                                                                        </td>
                                                                                        <td style="border: 1px solid black;padding:3px; border-collapse: collapse;">DIVISION
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="border: 1px solid black; border-collapse: collapse; text-align: center;">
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black;padding:3px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="maxmks"></asp:Label></b>
                                                                                        </td>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black;padding:3px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="obtmks"></asp:Label></b>
                                                                                        </td>
                                                                                        <td style="font-family: Arial, Helvetica, sans-serif; border: 1px solid black;padding:3px; border-collapse: collapse;">
                                                                                            <b>
                                                                                                <asp:Label runat="server" ID="cumudivision"></asp:Label></b>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                     </asp:Panel>
                                                                            </td>
                                                                            <td style="width: 300px">
                                                                                <div style="float: right">
                                                                                    <p style="margin-bottom: 4px; font-size: 15px; text-align: center">Abbreviation</p>
                                                                                    <table style="border: 1px solid black; border-collapse: collapse; height: 170px; font-size: 10px; width: 316px;">
                                                                                        <tr style="line-height: 1.4;">
                                                                                            <td>&nbsp;*  
                                                                                            </td>
                                                                                            <td>Indicates the number of extra attempts after the 1° regular one
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr style="line-height: 1.4;">
                                                                                            <td>&nbsp;@/RT
                                                                                            </td>
                                                                                            <td>Indicates Marks/Result after Retotalling
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr style="line-height: 1.4;">
                                                                                            <td>&nbsp;#/RV
                                                                                            </td>
                                                                                            <td>Indicates Marks/Result after Revaluation
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr style="line-height: 1.4;">
                                                                                            <td>&nbsp;$/RRV
                                                                                            </td>
                                                                                            <td>Indicates Marks/Result after Re-revaluation
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr style="line-height: 1.4;">
                                                                                            <td>&nbsp;^/ABR
                                                                                            </td>
                                                                                            <td style="white-space: nowrap;">Indicates Marks/Result after Appelcate Body Review
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr style="line-height: 1.4;">
                                                                                            <td>&nbsp;G
                                                                                            </td>
                                                                                            <td>Indicates grace marks in the Subject(s)
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr style="line-height: 1.4;">
                                                                                            <td>&nbsp;ABS
                                                                                            </td>
                                                                                            <td>Indicates ‘Absent’ in the Subject(s)
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr style="line-height: 1.4;">
                                                                                            <td>&nbsp;F
                                                                                            </td>
                                                                                            <td>Indicates failure in the Subject(s) Total
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr style="line-height: 1.4;">
                                                                                            <td>&nbsp;ESE
                                                                                            </td>
                                                                                            <td>End Semester Exam
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr style="line-height: 1.4;">
                                                                                            <td>&nbsp;CT
                                                                                            </td>
                                                                                            <td>Class Tests
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr style="line-height: 1.4;">
                                                                                            <td>&nbsp;SPI
                                                                                            </td>
                                                                                            <td>Semester Performance Index
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr style="line-height: 1.4;">
                                                                                            <td>&nbsp;CPI
                                                                                            </td>
                                                                                            <td>Cumulative Performance Index
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>&nbsp;</td>
                                                                            <td>&nbsp;</td>
                                                                            <td>&nbsp;</td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <%----------End Document Section ---------%>
                                                    </div>
                                                    <asp:Label runat="server" ID="datetoday" Style="margin-left:290px"></asp:Label>
                                                    </div>
                                                        <br />
                                                    <%--<p style="page-break-before: always"></p>--%>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:DataList>
                                            <br />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                        <%--<div class="clearfix"></div>--%>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
