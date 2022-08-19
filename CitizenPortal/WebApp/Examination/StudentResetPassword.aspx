<%@ Page Title="" Language="C#" MasterPageFile="~/Sambalpur/master/Home.Master" AutoEventWireup="true" CodeBehind="StudentResetPassword.aspx.cs" Inherits="CitizenPortal.WebApp.Examination.StudentResetPassword" %>

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
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="StudentResetPassword.js"></script>
    <link href="../../Styles/sb-admin-2.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript">
       

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

    <div id="progressbar" class="modalBackground" runat="server" clientidmode="Static" style="height: 150%; border: 1px solid #ccc; display: none">
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
                <div style="float: left; width: 84%">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i> Reset Password for accessing Digivarsity Portal 
                    </h2>
                </div>
                <div style="float: right; width: 15%">
                    <h2 class="form-heading"><i class="fa fa-download"></i><a href="../../Download/SemExam_MockDril_V-1.0.pdf" target="_blank">Help Manual</a></h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 p0">
                <div id="divPhoto" class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title manadatory">Student Photograph</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-lg-12">
                            <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="height: 220px" id="myImg" />
                            <input class="camera" id="ApplicantImage" name="Photoupload" type="file" />
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div id="divSign" class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title manadatory">Student Signature
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-lg-12">
                            <img class="form-control" src="/WebApp/Kiosk/Images/signature.png" name="signature" style="height: 150px" id="mySign" />
                            <input class="camera" id="ApplicantSign" name="Photoupload" type="file" />
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 p0">
                <div id="divDetails" class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Student Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtEnrollmentNo">Enrollment No</label>
                                <input id="RegdNo" class="form-control" placeholder="Enrollment No" name="txtEnrollmentNo" type="text" readonly="readonly" disabled="disabled" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtRollNo">Roll No</label>
                                <input id="RollNo" class="form-control" placeholder="Roll No" name="txtRollNo" type="text" readonly="readonly" disabled="disabled" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-2 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="txtCourse">Course</label>
                                <input id="txtCourse" class="form-control" placeholder="Full Name" name="Course" type="text" readonly="readonly" disabled="disabled" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-5">
                            <div class="form-group">
                                <label class="manadatory" for="txtProgram">Program Name</label>
                                <input id="txtProgram" class="form-control" name="txtProgram" placeholder="Program Name" type="text" autocomplete="off" readonly="readonly" disabled="disabled" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtAdmissionYear">Admission Year</label>
                                <input id="txtAdmissionYear" class="form-control" placeholder="Full Name" name="Admission Year" type="text" readonly="readonly" disabled="disabled" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="Session">Batch</label>
                                <input id="Session" class="form-control" placeholder="Batch" name="txtSession" type="text" readonly="readonly" disabled="disabled" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="CurrentSemester">Current Semester</label>
                                <input id="CurrentSemester" class="form-control" placeholder="Full Name" name="Course" type="text" readonly="readonly" disabled="disabled" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory" for="CollegeName">College Name</label>
                                <input id="CollegeName" class="form-control" placeholder="College Name" name="txtCollege" type="text" readonly="readonly" disabled="disabled" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="txtName">Student's Name</label>
                                <input id="txtName" class="form-control" placeholder="Student Name" name="txtName"  readonly="readonly" disabled="disabled" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlGender">
                                    Gender</label>
                                <select class="form-control" data-val="true" data-val-number="Gender" data-val-required="Please select gender." id="ddlGender" name="Gender"  readonly="readonly" disabled="disabled">
                                    <option value="0">-Select-</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Transgender">Transgender</option>
                                </select>
                            </div>
                        </div>



                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="MobileNo">Mobile Number</label>
                                <input id="mobileNo" class="form-control" maxlength="10" name="MobileNo" placeholder="Mobile Number" onkeypress="return isNumberKey(event); " type="text" autocomplete="off" onchange="MobileValidation('mobileNo');" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label for="EmailID" class="manadatory ">Email ID</label>
                                <input type="email" id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" maxlength="50" onchange="ValiateEmail();" />
                            </div>
                        </div>
                        <div style="color:red;padding: 0 15px;float:right"><b>Note</b>: Please check <b>Mobile No</b> & <b>Email Id</b> as communication will be made through it.</div>
                        <div class="clearfix"></div>
                    </div>
                </div>

                <%----Start of Login Credential-----%>
                <div class="" id="divLogin" runat="server">
                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title">Student Login Details
                            </h4>
                        </div>

                        <div class="box-body box-body-open">

                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="col-xs-12 col-sm-6 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtUserID">
                                            Login Id
                                        </label>
                                        <input id="txtUserID" class="form-control" name="txtUserID" type="text" disabled="disabled" autocomplete="off" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtPassword">
                                            Password
                                        </label>
                                        <input id="txtPassword" class="form-control" name="txtPassword" placeholder="Enter Password" type="password" value="" maxlength="20"
                                            autocomplete="off" autofocus ncopy="return false;" oncut="return false;" onpaste="return false;" onchange="javascript:return pwdStrength(this);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtConfirm">
                                            Confirm Password
                                        </label>
                                        <input class="form-control" id="txtConfirm" name="txtConfirm" type="password" placeholder="Confirm Password" value="" maxlength="20" onchange="fnCompairPassword();"
                                            oncopy="return false;" oncut="return false;"
                                            onpaste="return false;" onchange="javascript:return repass(document.getElementById('txtPassword'), this);" autocomplete="off" />
                                    </div>
                                </div>

                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="alert-info col-sm-12 col-md-12 col-lg-12 padding10 mb10" id="">
                                    <span style="font-weight: bold; margin-bottom: 10px;color:maroon">Student Login Id:</span><br />
                                    <span>Login Id / User Id of the Student will be 6 digit University Enrollment No
                                    </span>
                                    <br />
                                    <span style="font-weight: bold; margin-bottom: 10px;color:maroon">Password must include:</span><br />
                                    <span>1. Minimum of Eight (8) character<br />
                                        2. One character must be in CAPS (Capital Alphabet A-Z)<br />
                                        3. One character must be in Numeric&nbsp;(0-9) and<br />
                                        4. One character must be special character (! @ # $ % ^ *)
                                    </span><br/>
									<span style="font-weight: bold; margin-bottom: 10px;color:maroon">Example of Password:</span> 
                                    <span>Abcd@1234<br />
									</span>
                                </div>
                                <div class="alert alert-success" id="divMsg1">
                                    <p class="text-justify" id="divMsgTitle1" style="font-weight: bold">
                                    </p>
                                    <p class="text-justify" id="divMsgDtls1">
                                    </p>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>
                <%-----End of Login Credential------%>
            </div>
            <div class="">
                            <div class="col-md-12 box-container" id="divBtn">
                                <div class="box-body box-body-open" style="text-align: center;">
                                    <input type="button" id="btnSubmit" class="btn btn-success" value="Submit Application" onclick="SubmitData();" />
                                    <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Cancel" id="btnCancel" class="btn btn-danger" />
                                    <input type="submit" name="ctl00$ContentPlaceHolder1$btnHome" value="Home" id="btnHome" title="Back to Home Page" class="btn btn-primary" />
                                </div>
                            </div>
                        </div>


            <%----END of Filter-----%>
        </div>

    </section>
    <asp:HiddenField ID="hdnLoginID" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFServiceID" runat="server" Value="388" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSizeOfPhoto" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFUIDData" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64Sign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSizeOfSign" runat="server" ClientIDMode="Static" />
</asp:Content>
