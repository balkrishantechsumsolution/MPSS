<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttendanceSheet.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.SU.AttendanceSheet" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Attendance Sheet</title>
    <link href="../OISF/css/allocationCenterStylesheet.css" rel="stylesheet" />
    <link href="/WebApp/Login/css/bootstrap.css" rel="stylesheet" />

    <style>
        @media print {
            input {
                display: none;
            }
        .auto-style1 {
            width: 35px;
        }
        .auto-style2 {
            width: 100px;
        }
        .auto-style3 {
            width: 340px;
        }
    </style>
  
</head>
<body>
    <form id="form1" runat="server">

        <div id="page-iframe" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-md-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title" style="text-align: center;">Attendance Sheet</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                            <table style="width: 794px; height: 60%; background-color: #f9f9f9; padding: 10px; border-top-left-radius: 2px; border-top-right-radius: 2px; border-top: 8px solid #8bbbea; box-shadow: 3px 3px 5px #e0e0e0; margin: 0 auto;">
                                <tr>
                                    <td colspan="2" style="color: red; font-weight: bold; text-align: center">Note : For Best View And Avoid Printing Problem, Use Firefox Browser.<br />
                                        <br />
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="row" style="">
                                            <div class="col-md-12 box-container">
                                                <div class="box-heading">
                                                    <h4 class="box-title register-num" style="padding-left:12px;">Search Filter
                                                    </h4>
                                                </div>

                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                    <div class="form-group">
                                                        <label class="" for="ddlBranch">
                                                            Branch/Cource Name
                                                        </label>
                                                        <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control">
                                                            <asp:ListItem>Select Branch</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                    <div class="form-group">
                                                        <label class="" for="ddlCollege">
                                                            College</label>
                                                        <asp:DropDownList ID="ddlCollege" runat="server" Width="100%" CssClass="form-control">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                    <div class="form-group">
                                                        <label class="manadatory" for="ddlExamType">
                                                            Exam Type
                                                        </label>
                                                        <asp:DropDownList ID="ddlExamType" runat="server" CssClass="form-control">
                                                            <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                            <asp:ListItem Value="1" Text="Regular"></asp:ListItem>
                                                            <asp:ListItem Value="2" Text="Back"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlExamType" InitialValue="0" Display="Dynamic"
                                                            ErrorMessage="Please select exam type." ValidationGroup="G" ForeColor="Red" />
                                                    </div>

                                                </div>

                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                                    <div class="form-group">
                                                        <label class="" for="ddlSession">
                                                            Session/Exam Year
                                                        </label>
                                                        <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control">
                                                            <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>                                                            
                                                            <asp:ListItem Value="2018" Text="2018"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" InitialValue="0" ControlToValidate="ddlSession" Display="Dynamic"
                                                            ErrorMessage="Please select SESSION" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                                    <div class="form-group">
                                                        <label class="" for="ddlSemester">
                                                            Semester
                                                        </label>
                                                        <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged" AutoPostBack="True">
                                                            <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                            <asp:ListItem Value="1SEM" Text="1st SEM"></asp:ListItem>
                                                            <asp:ListItem Value="2SEM" Text="2nd SEM"></asp:ListItem>
                                                            <asp:ListItem Value="3SEM" Text="3rd SEM"></asp:ListItem>
                                                            <asp:ListItem Value="4SEM" Text="4th SEM"></asp:ListItem>
                                                            <asp:ListItem Value="5SEM" Text="5th SEM"></asp:ListItem>
                                                            <asp:ListItem Value="6SEM" Text="6th SEM"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="0" ControlToValidate="ddlSemester" Display="Dynamic"
                                                            ErrorMessage="Please select SEMESTER." ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                                    <div class="form-group">
                                                        <label class="" for="ddlSemester">
                                                            Range
                                                        </label>
                                                        <asp:DropDownList ID="ddlRange" runat="server" CssClass="form-control">
                                                            <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                            <asp:ListItem Value="1" Text="1-25"></asp:ListItem>
                                                            <asp:ListItem Value="2" Text="26-50"></asp:ListItem>
                                                            <asp:ListItem Value="3" Text="51-75"></asp:ListItem>
                                                            <asp:ListItem Value="4" Text="76-100"></asp:ListItem>
                                                            <asp:ListItem Value="5" Text="101-125"></asp:ListItem>
                                                            <asp:ListItem Value="6" Text="126-150"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="0" ControlToValidate="ddlRange" Display="Dynamic"
                                                            ErrorMessage="Please select Range." ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                                    <div class="form-group">
                                                        <label class="" for="ddlGender">
                                                            Roll No
                                                        </label>
                                                        <asp:TextBox ID="TxtRollNo" runat="server" CssClass="form-control" ToolTip=""></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="clearfix"> </div>
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
                                                      <asp:Button ID="btnSearch" runat="server" Text="Search" Height="36px" Width="115px" OnClick="btnSearch_Click" />
                                        <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" Height="36px" Width="115px" />
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2" style="padding:20px;">
                                        <asp:DataList ID="grdAttendanceSheet" runat="server" Width="785px" RepeatColumns="2" OnItemDataBound="grdAttendanceSheet_ItemDataBound" RepeatDirection="Horizontal">


                                            <ItemTemplate>
                                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0; font-family: Arial !important; font-size: 11px;">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0; font-family: Arial !important; font-size: 11px;">
                                                                    <tr>
                                                                        <td style="padding: 0; border: 1px solid #999; text-align: left; vertical-align: top; " rowspan="4" class="auto-style1">
                                                                            <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SNo").ToString() %>'></asp:Label>
                                                                        </td>
                                                                        <td rowspan="4" style="padding: 0; border: 1px solid #999; text-align: center; " class="auto-style2">
                                                                            <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 90px; height: 100px;" id="ProfilePhoto" /><br />
                                                                        </td>
                                                                        <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 115px;white-space:nowrap;">Roll No.</td>
                                                                        <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 340px;" colspan="3">
                                                                            <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNo").ToString() %>'></asp:Label>
                                                                        </td>
                                                                        
                                                                        <td rowspan="2" style="padding: 3px; border: 1px solid #999; text-align: left; vertical-align: bottom; text-align: center; font-size: 10px; width: 350px">
                                                                            <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto0" style="margin: 1px; height: 35px; width: 100px;" id="Img1" />
                                                                            <br />Applicant's Signature
                                                                           </td>
                                                                        
                                                                    </tr>
                                                                    <tr>
                                                                         <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 100px;">Name :</td>
                                                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;" colspan="3">
                                                                            <asp:Label ID="lblApplicantName" runat="server" Text='<%# Eval("Name").ToString() %>'></asp:Label>
                                                                        </td>
                                                                       
                                                                       
                                                                     
                                                                    </tr>
                                                                    <tr>
                                                                         <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 340px;">Gender</td>
                                                                        <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 340px;">
                                                                            <asp:Label ID="lblSubject" runat="server" Text='<%# Eval("Gender").ToString() %>'></asp:Label>
                                                                        </td>
                                                                        <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 100px;">Category</td>
                                                                        <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Category").ToString() %>'></asp:Label>
                                                                        </td>
                                                                        <td rowspan="2" style="padding: 3px; border: 1px solid #999; text-align: center; vertical-align:bottom;font-size:8px" class="auto-style3">Student Sign. Here</td>
                                                                    </tr>
                                                                    <tr>
                                                                         <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 340px;">DOB</td>
                                                                        <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 340px;white-space:nowrap">
                                                                            <asp:Label ID="lblDegree" runat="server" Text='<%# Eval("dob").ToString() %>'></asp:Label>
                                                                        </td>
                                                                        <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 380px; white-space:nowrap;">Exam Type</td>
                                                                        <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 380px;">
                                                                            <asp:Label ID="lblReferenceId" runat="server" Text='<%# Eval("ExamType").ToString() %>'></asp:Label>
                                                                        </td>
                                                                    </tr>                                                                   
                                                                    <%--<tr>
                                                                        <td style="padding: 0; border: 1px solid #999; text-align: left; vertical-align: top; width: 35px;">&nbsp;</td>
                                                                        <td style="padding: 0; border: 1px solid #999; text-align: center; width: 100px">&nbsp;</td>
                                                                        <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 340px;">&nbsp;</td>
                                                                        <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 340px;white-space:nowrap">&nbsp;</td>
                                                                        <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 380px; white-space:nowrap;">&nbsp;</td>
                                                                        <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 380px;">&nbsp;</td>
                                                                        <td style="padding: 3px; border: 1px solid #999; text-align: center; width: 340px;vertical-align:bottom;font-size:8px">&nbsp;</td>
                                                                    </tr>--%>
                                                                    <tr>
                                                                        <td colspan="7" style="text-align: left; vertical-align: top; padding:0">
                                                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="100%" CellPadding="3" style="padding: 3px; border: 1px solid #999;font-size:10px">
                                                                                <Columns>
                                                                                    <asp:BoundField DataField="SNo" HeaderText="S.">
                                                                                        <ItemStyle Wrap="false" />
                                                                                    </asp:BoundField>
                                                                                    <asp:BoundField DataField="PaperCode" HeaderText="Paper Code">
                                                                                        <ItemStyle Wrap="false" />
                                                                                    </asp:BoundField>
                                                                                    <asp:BoundField DataField="SubjectType" HeaderText="Subject Type">
                                                                                        <ItemStyle Wrap="false" />
                                                                                    </asp:BoundField>
                                                                                    <asp:BoundField DataField="PaperName" HeaderText="Paper Name">
                                                                                        <ItemStyle Wrap="false" />
                                                                                    </asp:BoundField>
                                                                                    <asp:BoundField DataField="Attendance" HeaderText="Sign.">
                                                                                        <ItemStyle Wrap="false" />
                                                                                    </asp:BoundField>
                                                                                </Columns>                                                                                
                                                                            </asp:GridView>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>

                                                        </tr>
                                                    </tbody>
                                                </table>

                                            </ItemTemplate>


                                        </asp:DataList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
