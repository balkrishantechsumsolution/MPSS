<%@ Page Title="" Language="C#" MasterPageFile="~/Sambalpur/master/Home.Master" AutoEventWireup="true" CodeBehind="SearchForm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Enrolement.SearchForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--For Date Picker--%>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <%--For Date Picker--%>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <link href="../../Styles/style.admin.css" type="text/css" rel="stylesheet" />


    <script type="text/javascript">
        $(document).ready(function () {

            $('#txtBirthDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                onSelect: function (date) {

                }
            });
            $('#txtDOA').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    // Add validations
                    //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
                }
            });
        });

        //search form validate
        function ValidateForm() {
            debugger;
            var text = "";
            var opt = "";
            var EnrolementNumber = $("#txtEnrolementNumber");
            //var MobileNo = $("#txtMobileNo");
            var DOB = $("#txtBirthDate");
            var Branch = $("#ContentPlaceHolder1_ddlBranch");
            var StudentName = $("#txtStudentName");
            var captcha = $("#captcha");


            if (EnrolementNumber.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Enrolement Number. ";
                EnrolementNumber.attr('style', 'border:1px solid #d03100 !important;');
                EnrolementNumber.css({ "background-color": "#fff2ee" });
                opt = 1;
            }

            //if (MobileNo.val() == '') {
            //    text += "<BR>" + " \u002A" + " Please enter Registration Number. ";
            //    MobileNo.attr('style', 'border:1px solid #d03100 !important;');
            //    MobileNo.css({ "background-color": "#fff2ee" });
            //    opt = 1;
            //}

            //if (DOB.val() == '') {
            //    text += "<BR>" + " \u002A" + " Please enter Date of Birth. ";
            //    DOB.attr('style', 'border:1px solid #d03100 !important;');
            //    DOB.css({ "background-color": "#fff2ee" });
            //    opt = 1;
            //}

            if (Branch.val() == '0') {
                text += "<BR>" + " \u002A" + " Please select Branch Name. ";
                Branch.attr('style', 'border:1px solid #d03100 !important;');
                Branch.css({ "background-color": "#fff2ee" });
                opt = 1;
            }

            if (StudentName.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Student Name. ";
                StudentName.attr('style', 'border:1px solid #d03100 !important;');
                StudentName.css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            if (captcha.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter captcha code. ";
                captcha.attr('style', 'border:1px solid #d03100 !important;');
                captcha.css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            if (opt == "1") {
                alertPopup("Please fill following information.", text);
                return false;
            }
            return true;
        }


    </script>
    <style>
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
            margin: 1.5%;
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

        .table > tbody > tr > th {
            padding: 5px !important;
            text-align: center;
            vertical-align: middle !important;
        }

        .table > tbody > tr > td {
            padding: 5px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="home-contentbox">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>
                    Search for Enrollment of Batch 2020-21&nbsp;
                </h2>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="">
                <div id="divErr" class="danger error bg-warning">
                    Please enter 
                    <strong>DTE Registration No.</strong> select <strong>Branch Name </strong>and <strong>Student Name</strong> as Mandatory Fields to access the information.
                    (Entered data must be same as entered during DTE Registration Form)</div>
            </div>
            <div class="clearfix"></div>
            <div class="mtop10"></div>
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Applicant Details 
                    </h4>
                </div>

                <div class="box-body box-body-open">

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="txtEnrolementNumber">
                                DTE Registration Number</label>
                            <asp:TextBox ID="txtEnrolementNumber" runat="server" CssClass="form-control" placeholder="Enrolement Number" ClientIDMode="Static" MaxLength="14"></asp:TextBox>

                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label for="txtRegistrationNumber">
                                DTE Roll No</label>
                            <asp:TextBox MaxLength="12" ID="txtMobileNo" runat="server" class="form-control" placeholder="Mobile No" onkeypress="return isNumberKey(event);"
                                value="" ClientIDMode="Static"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label  for="DOB">
                                Date of Birth</label>
                            <asp:TextBox ID="txtBirthDate" runat="server" MaxLength="10" CssClass="form-control" placeholder="DD/MM/YYYY"
                                value="" ClientIDMode="Static"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="ddlBranch">
                                Branch</label>
                            <asp:DropDownList ID="ddlBranch" runat="server" class="form-control" AppendDataBoundItems="true">
                                <asp:ListItem Text="Select" Value="0" Selected="True"></asp:ListItem>
                            </asp:DropDownList>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="txtStudentName">
                                Name of the Student</label>
                            <asp:TextBox MaxLength="100" ID="txtStudentName" runat="server" class="form-control" placeholder="Student Full Name"
                                value="" ClientIDMode="Static"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2">
                        <div style="margin-top: -12px;">
                            <label>
                                <img src="/Account/GetCaptcha" alt="verification code" class=".gov.inform-control" />
                            </label>
                            <asp:TextBox MaxLength="6" ID="captcha" runat="server" class="form-control" placeholder="Enter Captcha" ClientIDMode="Static"></asp:TextBox>
                        </div>
                    </div>


                    <div>
                        <asp:GridView ID="gvShow" runat="server" CssClass="table table-striped table-bordered"
                            HorizontalAlign="Center" RowStyle-HorizontalAlign="Center">
                            <EmptyDataTemplate><span style="color: red">No Record Found!</span></EmptyDataTemplate>
                        </asp:GridView>
                        <asp:Label ID="lblMsg" runat="server" ></asp:Label>
                    </div>


                    <div class="form-group col-lg-12 text-center">
                        <label class="" for="">
                            &nbsp;
                        </label>
                        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" OnClientClick="return ValidateForm();"
                            class="btn btn-primary" Text="Search Application" />
                        <input id="btnHome" type="button" class="btn btn-danger" value="Close" onclick="window.close();" />
                    </div>
                    <div class="clearfix"></div>
                    <div class="mt10"></div>
                    <%----END of Filter-----%>
                    <%---Start of Application Details----%>
                    <div class="row" style="display: none;">
                        <div class="col-md-12 box-container mTop15">
                            <%-- <div class="box-heading">
                    <h4 class="box-title register-num">List of Application <asp:Label ID="lblHeading" runat="server"></asp:Label>
                        
                    </h4>
                </div>--%>
                            <div class="box-body box-body-open p0" style="height: 350px; overflow: auto;">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 p0">
                                    <div class="form-group p0">
                                        <asp:GridView ID="gridview" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered"
                                            HorizontalAlign="Center" RowStyle-HorizontalAlign="Center">
                                            <Columns>
                                                <%-- <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Application No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAppID" runat="server" Text='<%#Eval("AppID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Applicant Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="name" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Admission No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAdmissionNo" runat="server" Text='<%#Eval("AdmissionNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Admission Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="admissiondate" runat="server" Text='<%#Eval("Admissiondate") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Branch">
                                                    <ItemTemplate>
                                                        <asp:Label ID="course" runat="server" Text='<%#Eval("BranchName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Action">
                                                    <ItemTemplate>
                                                        <asp:HyperLink ID="HPLAdmissionForm" runat="server" NavigateUrl='<%# string.Format("~/WebApp/Kiosk/CBCS/AdmissionForm.aspx?AppId={0}",
                                                      HttpUtility.UrlEncode(Eval("AppID").ToString())) %>'
                                                            Text="View" CssClass="btn btn-info btn-sm"
                                                            Font-Underline="false" ToolTip="View +3 Admission Form"></asp:HyperLink>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
