<%@ Page Title="" Language="C#" MasterPageFile="~/Sambalpur/master/Home.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Result.SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--For Date Picker--%>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <%--For Date Picker--%>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <link href="../../Styles/style.admin.css" type="text/css" rel="stylesheet" />
    <link href="/WebApp/Common/Styles/StyleSheet1.css" type="text/css" rel="stylesheet" />
    <link href="/WebApp/Common/Styles/StyleSheet3.css" type="text/css" rel="stylesheet" />
    <link href="/WebApp/Common/Styles/StyleSheet4.css" type="text/css" rel="stylesheet" />
    <link href="/WebApp/Common/Styles/style.admin.css" type="text/css" rel="stylesheet" />
    <link href="../../Styles/sb-admin-2.css" type="text/css" rel="stylesheet" />

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
            var FirstName = $("#txtStudentName");
            var MobileNo = $("#txtMobile");
            var AppNo = $("#txtApplicationNO");
            var DOB = $("#txtBirthDate");
            var AdmissionNo = $("#txtAdmissionNo");
            var captcha = $("#captcha");


            if (AdmissionNo.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Admission Number. ";
                AdmissionNo.attr('style', 'border:1px solid #d03100 !important;');
                AdmissionNo.css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            //if (DOB.val() == '') {
            //    text += "<BR>" + " \u002A" + " Please enter Date of Birth. ";
            //    DOB.attr('style', 'border:1px solid #d03100 !important;');
            //    DOB.css({ "background-color": "#fff2ee" });
            //    opt = 1;
            //}
            if (MobileNo.val() == '' && FirstName.val() == '' && AppNo.val() == '') {
                text += "<BR>" + " \u002A" + " And any of one either Mobile No OR Student Name OR Reference No. ";
                //FirstName.attr('style', 'border:1px solid #d03100 !important;');
                //FirstName.css({ "background-color": "#fff2ee" });
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

        .modalBackground {
            background-color: #000;
            filter: alpha(opacity=90);
            opacity: 0.6;
            left: 0;
            position: absolute;
            top: 0;
            width: 100%;
            z-index: 10000;
            height: 1000%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="progressbar" class="modalBackground" runat="server" clientidmode="Static" style="height: 700%; border: 1px solid #ccc; display: none">
        <div style="z-index: 105; left: 40%; position: absolute; top: 70%;" class="text-center">
            <img id="imgloader" alt="" runat="server" src="/WebApp/Kiosk/Images/loading.gif" style="height: 200px;" />
            <p class="text-danger">
                Please do not refresh or click back button<br />
                as Request is Processing....
            </p>
        </div>
    </div>

    <section class="home-contentbox">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div style="float: left; width: 100%">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>
                        Search Student Semester Exam Result 
                    </h2>
                </div>
                <%--<div style="float: right; width: 15%">
                    <h2 class="form-heading"><i class="fa fa-download"></i><a href="../../../Sambalpur/pdf/department_manual.pdf" target="_blank">Help Manual</a></h2>
                </div>--%>
            </div>
        </div>
        <div class="row" style="display:none">
            <div class="col-md-12 box-container" id="">
                <div class="box-heading">
                    <h4 class="box-title">Instruction to Fill the Semester Exam Form 
                                <span class="col-md-6 pull-right" style="font-style: normal; cursor: pointer; font-size: 12px; text-align: right; padding: 0;" onclick="ckhInfo();">
                                    <i class="fa fa-info-circle" style="cursor: pointer; font-size: 15px;" title="Information">&nbsp;&nbsp;</i><span id="lblInfo">Hide</span>&nbsp;&nbsp;<i class="fa fa-eye"></i></span><span class="clearfix"></span>
                    </h4>
                </div>
                <div class="box-body box-body-open" id="divInfo">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div id="spnINnfo" style="line-height: 25px; margin-bottom: 5px;">


                            <div class="form-group padding10">
                                <div>
                                    <strong>STEP 1</strong>: <strong>Search Student Record</strong>

                                </div>
                                <div class="padding20 ptop0">
                                    a. Enter <span style="color: red">*</span><b>CSVTU Enrollment Number</b> mandatory
                            <br />
                                    b. <span style="color: red">*</span><b>Date of Birth</b> (as entered in while enrolling in CSVTU) mandatory
                            <br />
                                    c. <span style="color: red">*</span><b>CSVTU Roll Number</b> (as assigned by University) mandatory
                            <br />
                                    d. Name of the Student (as entered in admission form) optional
                            <br />
                                    e. Student Father's Name (as entered in admission form) optional
                            <br />
                                    f. <span style="color: red">*</span><b>Captcha</b> (enter the text as displayed in the image) mandatory.
                                </div>
                                If facing any problem in searching the record, please contact your college's DEO for details - CSVTU Enrollment No, Date of Birth, CSVTU Roll No etc.
                                        
                            </div>

                        </div>

                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <%--<uc1:ServiceInformation runat="server" ID="ServiceInformation" />--%>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="">
                <div id="divErr" class="danger error bg-warning">
                    Please enter 
                    <strong>Student Roll No.</strong> &amp; <strong>Date of Birth</strong> &amp; <strong>Exam Session</strong> &amp; <strong>Semester</strong> as Mandatory Fields to search Semester Exam Result.
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="mtop10"></div>
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Examinee Details
                    </h4>
                </div>

                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label for="txtRollNo">
                                Roll Number</label>
                            <asp:TextBox ID="txtRollNo" runat="server" class="form-control" MaxLength="20" placeholder="CSVTU Roll No."
                                value="" ClientIDMode="Static"></asp:TextBox>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2"  style="display:none">
                        <div class="form-group">
                            <label class="manadatory">
                                Enrollment Number</label>
                            <asp:TextBox ID="txtRegNo" runat="server" CssClass="form-control" placeholder="CSVTU Enrollment Number" ClientIDMode="Static" MaxLength="6"></asp:TextBox>

                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="txtBirthDate">
                                Date of Birth</label>
                            <asp:TextBox ID="txtBirthDate" runat="server" MaxLength="10" CssClass="form-control" placeholder="DD/MM/YYYY"
                                value="" ClientIDMode="Static"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="ddlSession">
                                Session
                            </label>
                            <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                <asp:ListItem Selected="True" Value="Nov-Dec 2021" Text="Nov-Dec 2021"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" InitialValue="0" ControlToValidate="ddlSession" Display="Dynamic"
                                ErrorMessage="Please select SESSION" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlSemester">
                                    Semester
                                </label>
                                <asp:dropdownlist id="ddlSemester" runat="server" cssclass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem> 
                                    <asp:ListItem Value="1 SEMESTER" Text="1 SEMESTER"></asp:ListItem>
                                    <asp:ListItem Value="2 SEMESTER" Text="2 SEMESTER"></asp:ListItem>
                                    <asp:ListItem Value="3 SEMESTER" Text="3 SEMESTER"></asp:ListItem>
                                    <asp:ListItem Value="4 SEMESTER" Text="4 SEMESTER"></asp:ListItem>
                                    <asp:ListItem Value="5 SEMESTER" Text="5 SEMESTER"></asp:ListItem>
                                    <asp:ListItem Value="5 SMESTER" Text="5 SMESTER"></asp:ListItem>
                                    <asp:ListItem Value="6 SEMESTER" Text="6 SEMESTER"></asp:ListItem>
                                    <asp:ListItem Value="7 SEMESTER" Text="7 SEMESTER"></asp:ListItem>
                                    <asp:ListItem Value="8 SEMESTER" Text="8 SEMESTER"></asp:ListItem>
                                    <asp:ListItem Value="9 SEMESTER" Text="9 SEMESTER"></asp:ListItem>
                                    <asp:ListItem Value="10 " Text="10 SEMESTER"></asp:ListItem>
                                    <asp:ListItem Value="1 Year" Text="1 Year"></asp:ListItem>
                                    <asp:ListItem Value="2 Year" Text="2 Year"></asp:ListItem>
                                    <asp:ListItem Value="Session 1" Text="Session 1"></asp:ListItem>                                   
                                </asp:dropdownlist>
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
                                <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                <asp:ListItem Value="Regular" Text="Regular"></asp:ListItem>
                                <asp:ListItem Value="Backlog" Text="Backlog"></asp:ListItem>
                                <asp:ListItem Value="AggBacklog" Text="Agg.Backlog"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlExamType" InitialValue="0" Display="Dynamic"
                                ErrorMessage="Please select exam type." ValidationGroup="G" ForeColor="Red" />
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

                    <div class="form-group col-lg-12 text-center">
                        <label class="" for="">
                            &nbsp;
                        </label>
                        <asp:Button ID="btnSubmit" runat="server" OnClientClick="return ValidateForm();" OnClick="btnSubmit_Click"
                            class="btn btn-primary" Text="Search Student" />
                        <input id="btnHome" type="button" class="btn btn-danger" value="Close" onclick="window.close();" />
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <%----END of Filter-----%>
        </div>
        <div style="display:none">
        <div class="row" id="divResult" runat="server" visible="false">
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title"> Semester Exam Detail
                    </h4>
                </div>
                <br />
                <br />

                 <div>
            <asp:Button ID="btnbk" runat="server" Text="Back" class="btn btn-warning no-print" Style="float: right; margin-right: 16px; margin-top: 20px;display:none" OnClick="btnbk_Click" />
        </div>
        <div>
            <img src="/Sambalpur/img/sambalpur-university-logo.png" class="imght" />
            <span class="hdr" style="margin-left: 122px; font-size: 30px; margin-top: 20px; margin-bottom: 5px;">CHHATTISGARH SWAMI VIVEKANAND TECHNICAL UNIVERSITY,BHILAI</span><br />
            <div class="mrg" style="margin-left: 530px; font-weight: 700; border: 1px solid black; width: 362px; text-align: center;">TABULATION OF RESULT(TR SHEET)</div>
        </div>
        <hr />
        <div class="heading" style="font-family: Arial, Helvetica, sans-serif; font-size: 14px; text-align: right;">
        </div>
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="col-md-2 col-sm-4 col-xs-3 chngemob11">
                <label style="line-height: 23px;">STUDENT NAME:</label>
                <%--<asp:Label runat="server" ID="NOC"></asp:Label>--%>
                <br />
                <label style="line-height: 23px;">COURSE&nbsp;/&nbsp;BRANCH:</label>
                <%--<asp:Label runat="server" ID="NOEx"></asp:Label>--%>
                <br />
                <label style="line-height: 23px;">SEM&nbsp;/&nbsp;LEVEL&nbsp;/&nbsp;YEAR:</label>
                <%--<asp:Label runat="server" ID="sem"></asp:Label>--%>
                <br />
                <label style="line-height: 23px;">ROLL NUMBER:</label>
                <%--<asp:Label runat="server" ID="roll_no"></asp:Label>--%>
                <br />
                <label style="margin-right: 26px;">INSTITUTE NAME:</label>
                <%--<asp:Label runat="server" ID="NOI"></asp:Label>--%>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-3 chngemob11">
                <asp:Label runat="server" ID="NOC" style="line-height: 23px;"></asp:Label>
                <br />
                <asp:Label runat="server" ID="NOEx" style="line-height: 27px;"></asp:Label>
                <br />
                <asp:Label runat="server" ID="sem" style="line-height: 23px;"></asp:Label>
                <br />
                <asp:Label runat="server" ID="roll_no" style="line-height: 34px;"></asp:Label>
                <br />
                <asp:Label runat="server" ID="NOI" style="line-height: 30px;"></asp:Label>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-3 chngemob11">
                <label style="line-height: 23px;">FATHER'S NAME:</label>
                <br />
                <label style="line-height: 23px;">EXAM SESSION:</label>
                <br />
                <label style="line-height: 23px;">EXAM TYPE:</label>
                <br />
                <label style="line-height: 23px;">ENROLLMENT No:</label>
            </div>
             <div class="col-md-4 col-sm-2 col-xs-3 chngemob11">
                <asp:Label runat="server" ID="Fname"  style="line-height: 26px;"></asp:Label>
                  <br />
                <asp:Label runat="server" ID="ext" style="line-height: 23px;"></asp:Label>
                 <br />
                <asp:Label runat="server" ID="lblstat" style="line-height: 34px;"></asp:Label>
                 <br />
                <asp:Label runat="server" ID="enroll" style="line-height: 25px;"></asp:Label>
                 </div>
            <div class="text-center">
            </div>
        </div>
        <table class="table table-bordered table-striped">
            <%--<td style="width: auto" class="list-group-item-danger">--%>
                <asp:GridView runat="server" ID="GdUnReport" AutoGenerateColumns="false"
                    EmptyDataRowStyle-BackColor="green" DataKeyNames=""
                    EmptyDataText="Record Not Found" OnRowDataBound="GdUnReport_RowDataBound"
                    CssClass="table table-striped table-hover">
                    <Columns>
                        <asp:TemplateField HeaderText="S.No." HeaderStyle-Width="5%" HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                            <HeaderStyle CssClass="table_04" HorizontalAlign="Left"></HeaderStyle>
                            <ItemStyle CssClass="table_02" HorizontalAlign="Left"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Subject_code" HeaderText="Code" />
                        <asp:BoundField DataField="Subjectname" HeaderText="Subject" />
                        <asp:BoundField DataField="maxese" HeaderText="MAX" />
                        <asp:BoundField DataField="maxesetimes" HeaderText="OBT" /><%--NullDisplayText="AB"--%>
                        <asp:BoundField DataField="maxct" HeaderText="MAX" />
                        <asp:BoundField DataField="max_ctobt" HeaderText="OBT" />
                        <asp:BoundField DataField="maxta" HeaderText="MAX" />
                        <asp:BoundField DataField="max_taobt" HeaderText="OBT" />
                        <asp:BoundField DataField="total" HeaderText="MAX" />
                        <asp:BoundField DataField="totalobt" HeaderText="OBT" />
                        <asp:BoundField DataField="LetterGrade" HeaderText="Letter Grade" />
                        <asp:BoundField DataField="gradepoint" HeaderText="Grade Point" />
                        <asp:BoundField DataField="CreditPoint" HeaderText="Credit Point" />
                    </Columns>
                    <EmptyDataRowStyle BackColor="green" />
                </asp:GridView>
            <%--</td>--%>
        </table>
        <hr />
        <div class="row">
            <div class="col-md-2 col-sm-2 col-xs-2">
            <asp:Label ID="SPIlbl" runat="server" Style="font-weight: 600;">SPI:</asp:Label>
            <asp:Label ID="spi" runat="server"></asp:Label>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2">
                  <label style="font-weight: 600;">CPI:</label>
                <asp:Label runat="server" ID="cpivalue"></asp:Label></div>
             <div class="col-md-2 col-sm-2 col-xs-2"></div>
            <div class="col-md-2 col-sm-2 col-xs-2" style="width: 16%;"></div>
            <div class="col-md-2 col-sm-2 col-xs-2" style="width: 5%;">
                <asp:Label runat="server" ID="mxmarks"></asp:Label></div>
            <div class="col-md-1 col-sm-2 col-xs-2" style="width: 7%;">
             <asp:Label runat="server" ID="obtmarks" ></asp:Label></div>
             <div class="col-md-1"></div>
            <div class="col-md-1"></div>
            <div class="col-md-2">
                 <asp:Label ID="rslt" runat="server" Style="font-weight: 600;">RESULT :</asp:Label>
            <asp:Label ID="Result" runat="server" Style="font-weight: 600;"></asp:Label>
            </div>
            </div>
               <hr style="margin-top: 1px;"/>
        <div style="margin-bottom:5px">
            <asp:label runat="server" ID="date"></asp:label>
             <img src="../images/sign_arora.jpg" style="margin-top: -16px;margin-right: 89px;height: 34px;float:right"/>
        </div>
        <div>
            <b>This is a Computer Generated Document</b>            
            <b style="float: right;margin-right: 20px;">Exam Controller Signature</b>
        </div>
                <div class="col-md-12 col-sm-12 col-xs-12" runat="server" visible="false">
            <div class="col-md-4 col-sm-4 col-xs-4" style="width: 38%">
                <asp:Label ID="tomw" runat="server">Total Marks In Words :</asp:Label>
                <asp:Label ID="mkstot" runat="server" Style="font-weight: 600;"></asp:Label>&nbsp;<b>ONLY.</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <asp:TextBox ID="txtdivident" runat="server" Style="border-radius: 10px; width: 78%;" Visible="false"></asp:TextBox>
                <asp:TextBox ID="txtdivisor" runat="server" Style="border-radius: 10px; width: 78%;" Visible="false"></asp:TextBox>
                <asp:TextBox ID="txtcurrsemdividenr" runat="server" Style="border-radius: 10px; width: 78%;" Visible="false"></asp:TextBox>
                <asp:TextBox ID="txtcurrsemdivis" runat="server" Style="border-radius: 10px; width: 78%;" Visible="false"></asp:TextBox>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4" style="float: right">
                <asp:Label ID="lblfig" runat="server">In Figure:</asp:Label>
                <asp:Label ID="totfig" runat="server" Style="font-weight: 600;"> </asp:Label>
            </div>
        </div>
               <div class="col-md-4 col-sm-4 col-xs-4" runat="server" visible="false">
            <asp:Label ID="lbtce" runat="server">Total Credits Earned:</asp:Label>
            <asp:Label ID="tocrearn" runat="server" Style="font-weight: 600;"></asp:Label><br />
            <br />
        </div>
               <div class="col-md-4 col-sm-4 col-xs-4">
            <asp:Label ID="DIvi" runat="server">Division:</asp:Label>
            <asp:Label ID="lbDiv" runat="server" Style="font-weight: 600;"></asp:Label>
        </div>

                <br />
                <br />

                
                <div class="clearfix">
                </div>
            </div>
        </div>
        </div>
    </section>

</asp:Content>
