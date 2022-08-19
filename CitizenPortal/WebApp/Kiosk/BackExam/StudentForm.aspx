<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="StudentForm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.BackExam.StudentForm" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/AddressScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Citizen/Script/ValidateUser.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            if ($("#HFb64").val() != '') {
                $("#myImg").attr('src', $("#HFb64").val());
                $("#mySign").attr('src', $("#HFb64Sign").val());
            }
            $('#TxtDOB').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '-1d',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    debugger;
                    var t_DOB = $("#TxtDOB").val();
                    t_DOB = t_DOB.replace("-", "/");
                    var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
                    var Age = calage1(t_DOB);
                    if (Age != null && Age < 15) {
                        alertPopup("Age Validate", "Age allow minimum 15 year's");
                        $("#TxtDOB").val('');
                        $('#Age').val('');
                    }
                    else {
                        $('#Age').val(Age);
                    }


                }
            });
        });

        function calage1(dob) {
            var D1 = dob.split('/');
            var calday = D1[0];
            var calmon = D1[1];
            var calyear = D1[2];

            var curd = new Date(curyear, curmon - 1, curday);
            var cald = new Date(calyear, calmon - 1, calday);
            var diff = Date.UTC(curyear, curmon, curday, 0, 0, 0) - Date.UTC(calyear, calmon, calday, 0, 0, 0);
            var dife = datediff(curd, cald);
            return dife[0];
        }

        function imgChanged(th) {
            if (th.files && th.files[0]) {

                var imgsizee = th.files[0].size;
                var sizekb = imgsizee / 1024;
                sizekb = sizekb.toFixed(0);

                $('#HFSizeOfPhoto').val(sizekb);
                if (sizekb < 10 || sizekb > 50) {
                    // $('#imgupload').attr('src', null);
                    alert('The size of the photograph should fall between 20KB to 50KB. Your Photo Size is ' + sizekb + 'kb.');
                    return false;
                }
                var ftype = th;
                var fileupload = ftype.value;
                if (fileupload == '') {
                    alert("Photograph only allows file types of PNG, JPG, JPEG. ");
                    return;
                }
                else {
                    var Extension = fileupload.substring(fileupload.indexOf('.') + 1);
                    if (Extension == "png" || Extension == "jpeg" || Extension == "jpg") {
                    }
                    else {
                        alert("Photograph only allows file types of PNG, JPG, JPEG. ");
                        return;
                    }
                }

                var FR = new FileReader();
                FR.onload = function (e) {
                    $("#myImg").attr('src', e.target.result);
                    $("#HFb64").val(e.target.result);
                };
                FR.readAsDataURL(th.files[0]);
            }
        };
        function imgsignChanged(th) {
            if (th.files && th.files[0]) {

                var imgsizee = th.files[0].size;
                var sizekb = imgsizee / 1024;
                sizekb = sizekb.toFixed(0);

                $('#HFSizeOfSign').val(sizekb);
                if (sizekb < 5 || sizekb > 20) {
                    // $('#imgupload').attr('src', null);
                    alert('The size of the signature should fall between 10KB to 20KB. Your signature Size is ' + sizekb + 'kb.');
                    return false;
                }

                var ftype = th; //document.getElementById('File1');
                var fileupload = ftype.value;
                if (fileupload == '') {
                    alert("Signature only allows file types of PNG, JPG, JPEG. ");
                    return;
                }
                else {
                    var Extension = fileupload.substring(fileupload.indexOf('.') + 1);
                    if (Extension == "png" || Extension == "jpeg" || Extension == "jpg") {
                    }
                    else {
                        alert("Signature only allows file types of PNG, JPG, JPEG. ");
                        return;
                    }
                }

                var FR = new FileReader();
                FR.onload = function (e) {
                    $("#mySign").attr('src', e.target.result);
                    $("#HFb64Sign").val(e.target.result);
                };
                FR.readAsDataURL(th.files[0]);
            }
        };

        function ValidateForm(event) {
            var text = "";
            var opt = "";

            // Basic Information 
            var AadhaarNo = $("#UID")
            var FirstName = $("#TxtFirstName");
            var MobileNo = $("#txtMobileNo");
            var EmailID = $("#txtEmailID");
            var DOB = $("#TxtDOB");
            var Age = $("#Age");
            var Nationality = $("#ddlnationality option:selected").text();
            var Gender = $("#ddlGender option:selected").text();
            var religion = $("#ddlreligion option:selected").text();
            //Permanent  address
            var Father = $("#TxtFatherName");
            var Mother = $("#TxtMotherName");
            var Category = $("#ddlCategory option:selected").text();

            /*
            if (AadhaarNo.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Aadhaar Number. ";
                AadhaarNo.attr('style', 'border:1px solid #d03100 !important;');
                AadhaarNo.css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                AadhaarNo.attr('style', '1px solid #cdcdcd !important;');
                AadhaarNo.css({ "background-color": "#ffffff" });
            }*/

            if (FirstName.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Full Name. ";
                FirstName.attr('style', 'border:1px solid #d03100 !important;');
                FirstName.css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                FirstName.attr('style', '1px solid #cdcdcd !important;');
                FirstName.css({ "background-color": "#ffffff" });
            }
            if (Father.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Father Name. ";
                Father.attr('style', 'border:1px solid #d03100 !important;');
                Father.css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                Father.attr('style', 'border:1px solid #cdcdcd !important;');
                Father.css({ "background-color": "#ffffff" });
            }

            if (Mother.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Mother Name. ";
                Mother.attr('style', 'border:1px solid #d03100 !important;');
                Mother.css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                Mother.attr('style', 'border:1px solid #cdcdcd !important;');
                Mother.css({ "background-color": "#ffffff" });
            }


            if (Category != null && (Category == '' || Category == 'Select' || Category == '-Select-')) {
                text += "<BR>" + " \u002A" + " Please select Category.";
                $('#ddlcategory').attr('style', 'border:1px solid #d03100 !important;');
                $('#ddlcategory').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            if (DOB.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Date of Birth. ";
                DOB.attr('style', 'border:1px solid #d03100 !important;');
                DOB.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                DOB.attr('style', 'border:1px solid #cdcdcd !important;');
                DOB.css({ "background-color": "#ffffff" });
            }

            if ((Gender == '' || Gender == 'Select' || Gender == "0")) {
                text += "<BR>" + " \u002A" + " Please Select Gender. ";
                $("#ddlGender").attr('style', 'border:1px solid #d03100 !important;');
                $("#ddlGender").css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $("#ddlGender").attr('style', 'border:1px solid #cdcdcd !important;');
                $("#ddlGender").css({ "background-color": "#ffffff" });
            }

            if ((religion == '' || religion == '--Select--' || religion == "0")) {
                text += "<BR>" + " \u002A" + " Please Select Religion. ";
                $("#ddlreligion").attr('style', 'border:1px solid #d03100 !important;');
                $("#ddlreligion").css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $("#ddlreligion").attr('style', 'border:1px solid #cdcdcd !important;');
                $("#ddlreligion").css({ "background-color": "#ffffff" });
            }
            if (MobileNo.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Mobile No. ";
                MobileNo.attr('style', 'border:1px solid #d03100 !important;');
                MobileNo.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {

            }



            var MotherTongue = $('#ddlTongue option:selected').text();

            if (MotherTongue != null && (MotherTongue == '' || MotherTongue == 'Select')) {
                text += "<BR>" + " \u002A" + " Please select MotherTongue.";
                $('#txtTongue').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtTongue').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            if (MobileNo.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Mobile No. ";
                MobileNo.attr('style', 'border:1px solid #d03100 !important;');
                MobileNo.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                //MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
                //MobileNo.css({ "background-color": "#ffffff" });
            }

            if (EmailID.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Email ID. ";
                EmailID.attr('style', 'border:1px solid #d03100 !important;');
                EmailID.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                EmailID.attr('style', 'border:1px solid #cdcdcd !important;');
                EmailID.css({ "background-color": "#ffffff" });
            }
            if ($("#HFb64").val() == '') {
                text += "<BR>" + " \u002A" + " Please Upload Profile Photo. ";
                $("#HFb64").attr('style', 'border:1px solid #d03100 !important;');
                $("#HFb64").css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $("#HFb64").attr('style', 'border:1px solid #cdcdcd !important;');
                $("#HFb64").css({ "background-color": "#ffffff" });
            }
            if ($("#HFb64Sign").val() == '') {
                text += "<BR>" + " \u002A" + " Please Your Signature. ";
                $("#HFb64Sign").attr('style', 'border:1px solid #d03100 !important;');
                $("#HFb64Sign").css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $("#HFb64Sign").attr('style', 'border:1px solid #cdcdcd !important;');
                $("#HFb64Sign").css({ "background-color": "#ffffff" });
            }
            if (opt == "1") {
                alertPopup("Please fill following information.", text);
                event.preventDefault();
                return false;
            }
            return true;
        }

    </script>
    <script type="text/javascript">
        function SUDeclaration(chk) {

            debugger;

            if (chk) {
                if ($('#TxtFirstName').val() == "" || $('#TxtFatherName').val() == "") {
                    //alert("Please enter the all the mandatory fields.");
                    alert("Please enter your Full Name, Father Name  to continue.");
                    chkPhysical.checked = false;
                    return false;
                }



                var name = $('#TxtFirstName').val();
                var fname = $('#TxtFatherName').val();
                //alert(name);
                $("#lblName").text(name);
                $("#lblApplicant").text(name);
                $("#lblNameAadhaar").text(name);
                $("#lblPhsclFthrName").text(fname);

                $('#btnSubmit').prop('disabled', false);


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
                $('#divDeclaration').show();
            }
        }
    </script>
    <style>
        #GV {
            margin: 0 auto;
        }

        #GV1 {
            margin-left: 5px;
        }

        #LblRollNo {
            font-weight: bold;
            background-color: #eaeaea;
            border: 2px dotted #ddd;
            height: 35px;
            display: block;
            padding: 6px 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                        <%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
                        <h2 class="form-heading mtop5"><i class="fa fa-pencil-square-o fa-fw pright10"></i>Back Student Registration &amp; Examination Form Fillup- (Batch - 2016-17) 
                        </h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-9 pleft0">
                        <div id="divDetails" class="col-md-12 box-container">
                            <div class="box-heading" id="Div4">
                                <h4 class="box-title">Student Details
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="row">
                                        <div class="form-group col-lg-4" style="display:none">
                                            <label for="UID" class="manadatory">
                                                Aadhaar No.</label>
                                            <asp:TextBox ID="UID" runat="server" placeholder="Enter 12 digit Aadhaar Number" MaxLength="14" CssClass="form-control" onkeypress="return isNumberKey(event);" autofocus=""></asp:TextBox>

                                        </div>
                                        <div class="form-group col-lg-4">
                                            <label for="UID" class="">
                                                Registration No.</label>
                                            <asp:TextBox ID="txtRedgNo" runat="server" CssClass="form-control"></asp:TextBox>

                                        </div>
                                        <div class="form-group col-lg-4 pull-right">
                                            <label for="LblRollNo" style="margin-bottom: 4px;">
                                                Roll No</label>
                                            <asp:Label ID="LblRollNo" runat="server" Text="Label" Font-Bold="true"></asp:Label>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="firstname">
                                            Name of the Student</label>
                                        <asp:TextBox ID="TxtFirstName" runat="server" MaxLength="40" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="firstname">
                                            College Name</label>
                                        <asp:TextBox ID="TxtCollegeName" runat="server" MaxLength="40" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="FatherName">
                                            Father's Name</label>
                                        <asp:TextBox ID="TxtFatherName" runat="server" MaxLength="40" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="MotherName">
                                            Mother's Name</label>
                                        <asp:TextBox ID="TxtMotherName" runat="server" MaxLength="40" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="DOB">
                                            Date of Birth <span style=""></span>
                                        </label>
                                        <asp:TextBox ID="TxtDOB" runat="server" MaxLength="12" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 pright0">
                                    <div class="form-group">
                                        <label for="Age">
                                            Age as on Date</label>
                                        <input id="Age" class="form-control" placeholder="Age (in years)" name="Age" maxlength="2" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlGender">
                                            Gender</label>
                                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            <asp:ListItem Value="M">Male</asp:ListItem>
                                            <asp:ListItem Value="F">Female</asp:ListItem>
                                            <asp:ListItem Value="T">Transgender</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="MobileNo">
                                            Religion</label>
                                        <asp:DropDownList ID="ddlreligion" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="Select Religion">--Select--</asp:ListItem>
                                            <asp:ListItem Value="Hndu">Hindu</asp:ListItem>
                                            <asp:ListItem Value="Mslm">Islam</asp:ListItem>
                                            <asp:ListItem Value="Jnsm">Jain</asp:ListItem>
                                            <asp:ListItem Value="Skhsm">Sikh</asp:ListItem>
                                            <asp:ListItem Value="Crstn">Christian</asp:ListItem>
                                            <asp:ListItem Value="Budhist">Budhist</asp:ListItem>
                                            <asp:ListItem Value="Othr">Other's</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtTongue">
                                            Mother Tongue</label>
                                        <asp:DropDownList ID="ddlTongue" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">--Select Mother Tongue--</asp:ListItem>
                                            <asp:ListItem Value="Assamese (Asamiya)">Assamese (Asamiya)</asp:ListItem>
                                            <asp:ListItem Value="Bengali (Bangla)">Bengali (Bangla)</asp:ListItem>
                                            <asp:ListItem Value="Bodo">Bodo</asp:ListItem>
                                            <asp:ListItem Value="Dogri">Dogri</asp:ListItem>
                                            <asp:ListItem Value="English">English</asp:ListItem>
                                            <asp:ListItem Value="Gujarati">Gujarati</asp:ListItem>
                                            <asp:ListItem Value="Hindi">Hindi</asp:ListItem>
                                            <asp:ListItem Value="Kannada">Kannada</asp:ListItem>
                                            <asp:ListItem Value="Kashmiri">Kashmiri</asp:ListItem>
                                            <asp:ListItem Value="Konkani">Konkani</asp:ListItem>
                                            <asp:ListItem Value="Maithili">Maithili</asp:ListItem>
                                            <asp:ListItem Value="Malayalam">Malayalam</asp:ListItem>
                                            <asp:ListItem Value="Marathi">Marathi</asp:ListItem>
                                            <asp:ListItem Value="Meitei (Manipuri)">Meitei (Manipuri)</asp:ListItem>
                                            <asp:ListItem Value="Nepali">Nepali</asp:ListItem>
                                            <asp:ListItem Value="Odia">Odia</asp:ListItem>
                                            <asp:ListItem Value="Punjabi">Punjabi</asp:ListItem>
                                            <asp:ListItem Value="Sanskrit">Sanskrit</asp:ListItem>
                                            <asp:ListItem Value="Santali">Santali</asp:ListItem>
                                            <asp:ListItem Value="Sindhi">Sindhi</asp:ListItem>
                                            <asp:ListItem Value="Tamil">Tamil</asp:ListItem>
                                            <asp:ListItem Value="Telugu">Telugu</asp:ListItem>
                                            <asp:ListItem Value="Urdu">Urdu</asp:ListItem>
                                            <asp:ListItem Value="Other">Other</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="nationality">
                                            Nationality</label>
                                        <asp:DropDownList ID="ddlnationality" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="Indian">Indian</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="Category">Category</label>
                                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            <asp:ListItem Value="General">General</asp:ListItem>
                                            <asp:ListItem Value="SC">SC</asp:ListItem>
                                            <asp:ListItem Value="ST">ST</asp:ListItem>
                                            <asp:ListItem Value="OB">OBC</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="MobileNo">
                                            Mobile Number</label>
                                        <asp:TextBox ID="txtMobileNo" runat="server" MaxLength="10" placeholder="Mobile Number" CssClass="form-control" onkeypress="return isNumberKey(event);"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="EmailID" class="manadatory">
                                            Email ID</label>
                                        <asp:TextBox ID="txtEmailID" runat="server" MaxLength="30" placeholder="Email Id" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" runat="server" id="divAppID">
                                    <div class="form-group">
                                        <label for="txtAppID" class="manadatory">
                                            Email ID</label>
                                        <asp:TextBox ID="txtAppID" runat="server" MaxLength="30" placeholder="App Id" CssClass="form-control" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-xs-12" style="display: none">
                                    <p class="ptop10"><i class="fa fa-info-circle pright5" style="color: #000;"></i>SC,ST SEBC candidates should attach self attested copy of respective Caste Certificate.<span style="color: red;">*</span></p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div id="" class="col-lg-3 p0">

                        <div id="divPhoto" class="col-md-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title manadatory">Applicant Photograph
                                </h4>
                            </div>
                            <div class="box-body box-body-open p0">
                                <div class="col-lg-12">
                                    <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="height: 220px" id="myImg" />
                                    <asp:FileUpload ID="ApplicantImage" runat="server" onChange="imgChanged(this);" />
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div id="divSign" class="col-md-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title manadatory">Applicant Signature
                                </h4>
                            </div>
                            <div class="box-body box-body-open p0">
                                <div class="col-lg-12">
                                    <img class="form-control" src="/WebApp/Kiosk/OISF/img/signature.png" name="signaturecustomer" style="height: 150px" id="mySign" />
                                    <asp:FileUpload ID="ApplicantSign" runat="server" onChange="imgsignChanged(this);" />
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    
                    <div class="clearfix" style="text-align:center;color:maroon;font-size:15px" >
                        <asp:Label ID="lblStatus" runat="server" Text="" style="text-align:center;color:maroon;font-size:15px"></asp:Label><br />
                    </div>
                    <div class="col-md-6 box-container">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Paper Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <asp:GridView ID="GV" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                                <Columns>
                                    <asp:TemplateField HeaderText="SI No.">
                                        <ItemTemplate>
                                            <asp:Label ID="Lbl_SlNo" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Paper Code">
                                        <ItemTemplate>
                                            <asp:Label ID="Lbl_Sub" runat="server" Text='<%#Eval("PaperCode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Paper">
                                        <ItemTemplate>
                                            <asp:Label ID="Lbl_Subcode" runat="server" Text='<%#Eval("PaperName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SubjectCode" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="Lbl_Subcode" runat="server" Text='<%#Eval("SubjectCode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="col-md-6 box-container">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Payment Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">

                            <asp:GridView ID="GV1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" ShowFooter="true" FooterStyle-Font-Bold="true" Width="99%">
                                <Columns>
                                    <asp:TemplateField HeaderText="Description">
                                        <ItemTemplate>
                                            <asp:Label ID="Lbl_var" runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount (Rs)" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" HeaderStyle-Width="100">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_Amount" runat="server" Text='<%#Eval("Amount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                </div>
                <div id="divPay" runat="server">
                    <div class="row">
                        <div class="col-md-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title manadatory" id="lblDeclaration">
                                    <input name="" type="checkbox" id="chkPhysical" onclick="javascript: SUDeclaration(this.checked);" />Declaration
                                </h4>
                            </div>
                            <div class="box-body box-body-open" id="divDeclaration" style="display: none;">
                                <div class="col-sm-12 col-md-12 col-lg-12">
                                    <div class="text-danger text-danger-green mt0">
                                        <p class="text-justify">
                                            I <b>
                                                <span id="lblName" style="text-transform: uppercase;"></span>
                                            </b>,
                <span id="lblGender" style="font-size: 1.1em;"></span><b><span id="lblPhsclFthrName" style="text-transform: uppercase;"></span></b>
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
                                                        Full Name of the Candidate</span></td>
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
                    <div class="row">
                        <div class="col-md-12 box-container" style="margin-top: 5px;">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <asp:Button ID="btnPayment" runat="server" Text="Proceed to Payment" CssClass="btn btn-success" OnClick="btnPayment_Click"  Visible="false" Enabled="false"  />
                                <asp:Button ID="btnSubmit" runat="server" Text="Register &amp; Proceed" CssClass="btn btn-success" OnClick="btnSubmit_Click" OnClientClick="ValidateForm(event);" />
                                <%--<input type="button" id="btnSubmit" class="btn btn-success" value="Register &amp; Proceed" title="Proceed to Upload Necessary Document" disabled="" />--%>
                                <%--<input type="submit" name="" value="Cancel" id="Button1" title="Refresh the page" class="btn btn-danger" />
                    <input type="submit" name="" value="Home" id="btnHome" title="Back to Home Page" class="btn btn-primary" />--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" Value="1451" />
    <asp:HiddenField ID="HFb64" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSizeOfPhoto" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64Sign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSizeOfSign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFCollegecode" runat="server" />
</asp:Content>
