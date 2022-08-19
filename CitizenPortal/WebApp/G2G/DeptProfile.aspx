<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="DeptProfile.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.DeptProfile" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--For Datepicker Js & Css--%>    
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/ValidationScript.js"></script>
    <script src="/WebApp/Scripts/CommonScript.js"></script>
    <script src="DeptProfile.js"></script>

    <%--For Datepicker Js & Css--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#JoiningDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "0:+0",
                maxDate: '0',
            });
        });
        function ValidateAlpha(evt) {
            //var Name = $('#AccountHolder').val();
            //var charCode;
            var e = evt; // for trans-browser compatibility
            Name = (e.which) ? e.which : event.keyCode;
            //charCode = (evt.which) ? evt.which : event.keyCode;
            if (Name >= 97 && Name <= 122 || Name >= 65 && Name <= 90 || Name == 8 || Name == 32) {
                return true;
            }
            else {
                return false;
            }
        }
        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }

        function checkmobile() {
            var text = "";
            var opt = "";
            var mobileno = $("#BMobile").val();
            if (mobileno != null) {
                if (isNaN(mobileno) || mobileno.indexOf(" ") != -1) {
                    text += "<br /> Please Enter A Valid Mobile Number.";
                    opt = 1;
                }
                if (mobileno.length > 10 || mobileno.length < 10) {
                    text += "<br /> Mobile No. Should Be Atleast 10 Digit.";
                    opt = 1;
                }
                if (!(mobileno.charAt(0) == "9" || mobileno.charAt(0) == "8" || mobileno.charAt(0) == "7")) {
                    text += "<br /> Mobile No. Should Start With 9 ,8 or 7.";
                    opt = 1;
                }
            }
            if (opt == "1") {
                alertPopup("Please Fill The Following Information.", text);
                $("#BMobile").val("");

                return false;
            }
            return true;
        }
        function EmailValidation() {
            var emailid = document.getElementById('MailID').value;
            var reg = /[a-zA-Z0-9\.\-]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
            if (emailid.match(reg)) {
                $('#MailID').attr('style', 'border:1px solid #ddd !important;');
                $('#MailID').css({ "background-color": "#ffffff" });
            }
            else {
                alertPopup("Please Enter Email-ID.", "</BR> Please Enter A Valid Email-ID in Proper Format");
                $('#MailID').attr('style', 'border:2px solid red !important;');
                $('#MailID').val('');
            }
        }

        function isAlphabet() {
            var Designation = document.getElementById('Designation').value;
            var reg = /^[a-zA-Z\s]+$/;
            if (Designation.match(reg)) {
                $('#Designation').attr('style', 'border:1px solid #ddd !important;');
                $('#Designation').css({ "background-color": "#ffffff" });
            }
            else {
                alertPopup("Please Enter Designation.", "</BR> Please Enter Valid Designation");
                $('#Designation').attr('style', 'border:2px solid red !important;');
                $('#Designation').val('');
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12">
                <h2 class="form-heading mtop5" style="text-transform:none;"><i class="fa fa-pencil-square-o fa-fw pright10"></i>User Profile
                </h2>
            </div>
            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num" style="padding-top: 8px;">Profile Details
                    </h4>
                </div>
               
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-5">
                        <div class="form-group">
                            <label class="manadatory">
                                Full Name
                            </label>
                            <input name="" type="text" id="Name" class="form-control" placeholder="Type Your Full Name" onkeypress="return ValidateAlpha(event, this);" maxlength="25"/>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-5">
                        <div class="form-group">
                            <label class="manadatory">
                                Designation
                            </label>
                            <input name="" type="text" id="Designation" class="form-control" placeholder="Your Designation" onchange="return isAlphabet();" onkeypress="return ValidateAlpha()" maxlength="25" oncopy="return false" onpaste="return false" oncut="return false"/>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                                <label class="manadatory" for="ddlGender">
                                    Gender</label>
                            <select class="form-control" data-val="true" data-val-number="Gender" data-val-required="Please select gender." id="ddlGender" name="Gender" >
                                    <option value="">-Select-</option>
                                    <option value="M">Male</option>
                                    <option value="F">Female</option>
                                    <option value="T">Transgender</option>
                                </select>

                            </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">
                                Mobile
                            </label>
                            <input name="" type="text" id="Mobile" class="form-control" placeholder="Mobile No" maxlength="10" onkeypress="return isNumber(event);" onchange="checkmobile();" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" style="display: none;">
                        <div class="form-group">
                            <label>
                                Telephone No
                            </label>
                            <input name="" type="text" id="PhoneNo" class="form-control" placeholder="Landline No" onkeypress="return isNumber(event);" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-5 col-lg-5">
                        <div class="form-group">
                            <label class="manadatory">
                                Email Id
                            </label>
                            <input name="" type="text" id="MailID" class="form-control" placeholder="Type Your Email" maxlength="30" onchange="EmailValidation();" />
                        </div>
                    </div>
              
                    
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">
                                Date of Incharge
                            </label>
                            <input name="" id="JoiningDate" type="text" id="DOJ" class="form-control" placeholder="DD/MM/YYYY" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2" style="display: none;">
                        <div class="form-group">
                            <label>
                                Employee Code
                            </label>
                            <input name="" type="text" id="EmpCode" class="form-control" placeholder="Employee Code" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" style="display:none">
                        <div class="form-group">
                            <label class="">
                               Aadhaar No
                            </label>
                            <input name="" type="text" id="AadhaarNo" class="form-control" placeholder="Aadhaar No" maxlength="12" onkeypress="return isNumber(event);"/>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-7 col-lg-7 text-right">
                        <p style="padding-top:25px;">(<span style="color:red; font-weight:bold;">*</span> Marked as Mandatory Fields)</p>
                        </div>
                    <div class="clearfix"></div>
                </div>
                
            </div>

            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3 pleft0 pright0">
                <div id="divPhoto" class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title manadatory">Upload's
                        </h4>
                    </div>
                    <div class="box-body box-body-open p0">
                        <div class="col-lg-12">
                            <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="height:180px" id="myImg"/>
                            <input class="camera" id="File1" name="Photoupload" type="file"/>
                            <img class="form-control" src="/WebApp/Kiosk/OISF/img/signature.png" name="signaturecustomer" style="height: 110px" id="mySign"/>
                            <input class="camera" id="File2" name="Photoupload" type="file"/>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                </div>
            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 col-lg-push-1 text-center">
                 <input type="button" id="btnSubmit" class="btn btn-verify" value="SUBMIT" style="min-width:180px;" />
                 </div>
        </div>
    </div>
    
    <asp:HiddenField ID="HFServiceID" runat="server" Value="" />
    <asp:HiddenField ID="HFb64" runat="server" />
    <asp:HiddenField ID="HFSizeOfPhoto" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFUIDData" runat="server" />
    <asp:HiddenField ID="HFb64Sign" runat="server" />
    <asp:HiddenField ID="HFSizeOfSign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFLID" runat="server" ClientIDMode="Static" />


</asp:Content>
