<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentExamData.aspx.cs" Inherits="CitizenPortal.WebApp.Examination.StudentExamData" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Semester Examination Data</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../../../Sambalpur/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../../Sambalpur/js/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script src="../../../Sambalpur/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="../../../Sambalpur/css/homestyle.css" type="text/css" rel="stylesheet" />
    <link href="../../../Sambalpur/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <link href="/WebApp/Common/Styles/style.admin.css" rel="stylesheet" />
    <link href="../../../Sambalpur/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../Sambalpur/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../../../Sambalpur/css/homestyle.css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet1.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

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
                                                            <asp:Label ID="lblDOB" runat="server"></asp:Label>
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
                                                            <asp:Label ID="EmailID" runat="server"></asp:Label>
                                                        </td>
                                                        <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                            <b>Mobile Number</b></td>
                                                        <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                            <asp:Label ID="MobileNo" runat="server"></asp:Label>
                                                        </td>
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
                                    <asp:GridView ID="grdBacklog" runat="server" Width="100%" AutoGenerateColumns="false" CssClass="table table-striped table-bordered">
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
                                                    <asp:CheckBox ID="chkBacklog" runat="server" onclick="return fnCalBackSubject(this);" Enabled="false" />
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
                                                    <asp:CheckBox ID="chkAgg" runat="server" onclick="return fnCalExamFee(this);" Enabled="false" />

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

                        <!---------------Declaration----------->

                        <!---------------Button----------->
                    </div>

                    <div class="clearfix"></div>
                </div>
            </div>


        </div>


        <asp:HiddenField ID="hdfRegularAmt" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="hdfBacklogAmt3" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="hdfBacklogAmt4" runat="server"></asp:HiddenField>
    </form>
</body>
</html>


