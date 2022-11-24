<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/MPSSMaster.Master" AutoEventWireup="true" CodeBehind="NewRegistration.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.NewRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>

    <%--<script src="bootstrap-datetimepicker.min.js"></script>--%>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/WebApp/Login/js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="/WebApp/Login/css/bootstrap.css" rel="stylesheet" />

    <link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />

    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/g2c/css/hmepge.bootstrap.css" rel="stylesheet" />


    <%--<link href="bootstrap-datetimepicker.css" rel="stylesheet" />
    <link href="bootstrap-datetimepicker.min.css" rel="stylesheet" />--%>

    <script type="text/javascript">
        $(document).ready(function () {

            $('#ContentPlaceHolder1_txtBirthdate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                maxDate: '0',

            });


            //$("#btnShow").click(function () {
            //    $('#divSTUDENT').show();
            //});
        });


        function ValidateMobile() {
            var opt = "";
            var text = "";


            var txtMobie = $('#ContentPlaceHolder1_txtMobie').val();
            if (txtMobie == null || txtMobie == "") {
                //text += "<br />" + " \u002A" + " Please Enter Mobile No.";
                text += "<br /> -Please Enter Mobile No. ";
                $('#ContentPlaceHolder1_txtMobie').attr('style', 'border:1px solid #d03100 !important;');
                $('#ContentPlaceHolder1_txtMobie').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else if (txtMobie != null) {
                $('#ContentPlaceHolder1_txtMobie').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ContentPlaceHolder1_txtMobie').css({ "background-color": "#ffffff" });

                if (txtMobie != '' || txtMobie != null) {
                    var mobmatch1 = /^[6789]\d{9}$/;
                    if (!mobmatch1.test(txtMobie)) {
                        text += "<br />" + " \u002A" + " Please Enter Valid Mobile Number.";
                        $("#ContentPlaceHolder1_txtMobie").attr('style', 'border:1px solid #d03100 !important;');
                        $("#ContentPlaceHolder1_txtMobie").css({ "background-color": "#fff2ee" });
                        opt = 1;
                    }
                }
            }
            if (opt == "1") {
                //alert("Please fill following information."+text);              
                alertPopup("Please fill following information.", text);
                return false;
            }
            return true;
        }

        function ValidateDate(p_Date) {

            var inputText = p_Date;
            if (inputText != null && inputText != '') {
                var dateformat = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;
                // Match the date format through regular expression  
                if (dateformat.test(inputText)) {
                    var DOB = inputText.split('/');
                    var Y = DOB[2];
                    var M = DOB[1];
                    var D = DOB[0];
                    if (M < 10) {
                        if (M.length == 1) {
                            M = '0' + M;
                        }
                        else
                            M = M;
                    }
                    if (D < 10) {
                        if (D.length == 1) {
                            D = '0' + D;
                        }
                        else
                            D = D;
                    }

                    var NewDOB = D + '/' + M + '/' + Y;
                    $('#ContentPlaceHolder1_txtIssueDate').val(NewDOB);

                    return true;
                }
                else {
                    alert("Invalid date format!");
                    //document.form1.text1.focus();
                    $('#ContentPlaceHolder1_txtIssueDate').val('');
                    return false;
                }
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid p0" id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-md-12 box-container" runat="server" id="div5">

                        <div class="box-heading form_hd">
                            <h2>{{resourcesData.lblStEnroll}} 2022-23</h2>

                        </div>


                    </div>
                    <div class="col-lg-12">
                        <div class="alert alert-success">
                            <p><b>{{resourcesData.lblInstruction}}</b></p>

                        </div>
                    </div>

                </div>
                <div class="row">

                    <div class="col-md-12 box-container" runat="server" id="div1">
                        <div class="box-heading">
                            <h4 class="box-title register-num">{{resourcesData.lblStFilter}}
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <label class="manadatory">{{resourcesData.lblSchool}}</label>
                                        <asp:DropDownList ID="ddlSchool" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>                                            
                                        </asp:DropDownList>




                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <label class="manadatory">{{resourcesData.lblClass}}</label>
                                        <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            <asp:ListItem Value="8">8</asp:ListItem>
                                        </asp:DropDownList>



                                    </div>
                                </div>

                                <div class="clearfix"></div>

                                <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 col-lg-push-1 text-center">
                                    <asp:Button runat="server" type="button" ID="btnShow" class="btn btn-verify" Text="Show" Style="min-width: 180px;" OnClick="btnShow_Click" />
                                </div>
                            </div>


                        </div>
                    </div>

                </div>
                <div id="divSTUDENT" runat="server" visible="false">
                    <div class="row">
                        <div class="col-md-12 box-container" runat="server" id="div2">
                            <div class="box-heading">
                                <h4 class="box-title register-num">{{resourcesData.lblSchoolClassDtl}}
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">{{resourcesData.lblCode}}</label>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" id="lblSchool" runat="server"></label>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">{{resourcesData.lblClass}}</label>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory"  id="lblClass" runat="server"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 box-container">
                            <div class="box-heading">
                                <h4 class="box-title register-num" style="padding-top: 8px;">{{resourcesData.lblStudentProfile}}
                                </h4>
                            </div>

                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                    <div class="form-group">
                                        <label class="manadatory">
                                            {{resourcesData.lblPassExam}}
                                        </label>


                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                    <div class="form-group">
                                        <asp:RadioButton ID="rbnpass1" runat="server" Text="Yes" GroupName="pass" />

                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                    <div class="form-group">

                                        <asp:RadioButton ID="rbnpass2" runat="server" Text="No" GroupName="pass" Checked="true" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlFullName">
                                            {{resourcesData.lblFullName}}
                                        </label>


                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtFullName" runat="server" ToolTip="Full Name" CssClass="form-control" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>
                                        <div class="col-xs-12 pleft0">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFullName" Display="Dynamic"
                                                ErrorMessage="Please enter Student Name" ValidationGroup="G" ForeColor="Red" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlFullName">
                                            {{resourcesData.lblFatherFullName}}
                                        </label>


                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtFatherName" runat="server" ToolTip="Father Full Name" CssClass="form-control" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>
                                        <div class="col-xs-12 pleft0">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFatherName" Display="Dynamic"
                                                ErrorMessage="Please enter Father Name" ValidationGroup="G" ForeColor="Red" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlFullName">
                                            {{resourcesData.lblMotherFullName}}
                                        </label>


                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtMotherName" runat="server" ToolTip="Mother Name" CssClass="form-control" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>
                                        <div class="col-xs-12 pleft0">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMotherName" Display="Dynamic"
                                                ErrorMessage="Please enter Mother Name" ValidationGroup="G" ForeColor="Red" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlFullName">
                                            {{resourcesData.lblStDOB}}
                                              {{resourcesData.lblStAge}}                                            
                                        </label>


                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtBirthdate" runat="server" ToolTip="dd/mm/yyyy" CssClass="form-control"></asp:TextBox>
                                        <div class="col-xs-12 pleft0">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtBirthdate" Display="Dynamic"
                                                ErrorMessage="Please enter Date of Birth" ValidationGroup="G" ForeColor="Red" />
                                        </div>
                                    </div>
                                </div>


                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory">
                                            {{resourcesData.lblStCategory}}
                                            
                                        </label>

                                        <asp:DropDownList ID="ddlCaste" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        </asp:DropDownList>


                                        <div class="col-xs-12 pleft0 p5">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlCaste" InitialValue="0" Display="Dynamic"
                                                ErrorMessage="Please select Category." ValidationGroup="G" ForeColor="Red" />

                                        </div>
                                    </div>
                                </div>
                               



                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                    <div class="form-group">
                                        <label class="manadatory">
                                            {{resourcesData.lblStGender}}                                            
                                        </label>
                                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        </asp:DropDownList>


                                        <div class="col-xs-12 pleft0 p5">
                                            <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="ddlGender" InitialValue="0" Display="Dynamic"
                                                ErrorMessage="Please select Gender." ValidationGroup="G" ForeColor="Red" />

                                        </div>
                                    </div>



                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                        <div class="form-group">
                                            <label class="manadatory">
                                                {{resourcesData.lblStNative}}
                                           
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:RadioButton ID="rbnNative1" runat="server" Text="Yes" GroupName="native" />

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">

                                            <asp:RadioButton ID="rbnNative2" runat="server" Text="No" GroupName="native" />
                                        </div>
                                    </div>

                                    <div class="clearfix"></div>
                                </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3 pleft0 pright0">
                            <div id="divPhoto" class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title manadatory">{{resourcesData.lblStUpload}}
                                      
                                    </h4>
                                </div>
                                <div class="box-body box-body-open p0">
                                    <div class="col-lg-12">
                                        <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" Style="height: 180px" ID="myImg" />
                                        <input class="camera" id="File1" name="Photoupload" type="file" runat="server" />
                                        <asp:Button ID="btnPhoto" type="submit" Text="Upload" runat="server" OnClick="btnPhoto_Click"></asp:Button>
                                        <asp:Panel ID="frmConfirmationPhoto" Visible="False" runat="server">
                                            <asp:Label ID="lblUploadResultPhoto" runat="server"></asp:Label>
                                        </asp:Panel>

                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div id="divTC" class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title manadatory">{{resourcesData.lblStTCUpload}}
                                    </h4>
                                </div>
                                <div class="box-body box-body-open p0">
                                    <div class="col-lg-12">
                                        {{resourcesData.lblStTCUpload}}
                                        
                                <asp:Image runat="server" class="form-control" name="ProfilePhoto" ID="ImageTC" />
                                        <input id="oFile" type="file" runat="server" name="oFile" />
                                        <asp:Button ID="btnUpload" type="submit" Text="Upload" runat="server" OnClick="btnUpload_Click"></asp:Button>
                                        <asp:Panel ID="frmConfirmation" Visible="False" runat="server">
                                            <asp:Label ID="lblUploadResult" runat="server"></asp:Label>
                                        </asp:Panel>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 box-container" runat="server" id="div3">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">{{resourcesData.lblStApplicantAddress}}
                                        
                                    </h4>
                                </div>
                                <div class="clearfix"></div>
                                <div class="box-body box-body-open">
                                    <div class="row">
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                    {{resourcesData.lblStHouseNo}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtHouse" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtHouse" Display="Dynamic"
                                                        ErrorMessage="Please enter House No." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                    {{resourcesData.lblStColony}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtColony" runat="server" ToolTip="Colony" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtColony" Display="Dynamic"
                                                        ErrorMessage="Please enter Colony." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                    {{resourcesData.lblStCity}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtCity" runat="server" ToolTip="City" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCity" Display="Dynamic"
                                                        ErrorMessage="Please enter City/Vilage." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                    {{resourcesData.lblStBlock}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtBlock" runat="server" ToolTip="Block" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtBlock" Display="Dynamic"
                                                        ErrorMessage="Please enter Block." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblStDistrict}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtDistrict" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtDistrict" Display="Dynamic"
                                                        ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                    {{resourcesData.lblStPinCode}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtPinCode" runat="server" ToolTip="Pin Code" CssClass="form-control" onkeydown="return AllowOnlyNumeric(event);" MaxLength="6"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtPinCode" Display="Dynamic"
                                                        ErrorMessage="Please enter Pin No." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblStSamagraID}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtSamagraNo" runat="server" ToolTip="Samagra No" onkeydown="return AllowOnlyNumeric(event);" MaxLength="9" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtSamagraNo" Display="Dynamic"
                                                        ErrorMessage="Please enter SamagraNo." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                    {{resourcesData.lblStMoblie}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtMobie" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" onChange="ValidateMobile();" MaxLength="10"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtMobie" Display="Dynamic"
                                                        ErrorMessage="Please enter Mobie." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>


                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 box-container" runat="server" id="div4">

                                <div class="clearfix"></div>
                                <div class="box-body box-body-open">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <asp:CheckBox ID="chkDecl" runat="server" />
                                                {{resourcesData.lblStDeclaration}}
                                              
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 col-lg-push-1 text-center">

                                    <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page"
                                        CssClass="btn btn-danger" PostBackSection=""
                                        Text="Cancel" />
                                    <asp:Button ID="btnSubMain" runat="server" CausesValidation="True" ToolTip="Proceed to Payment"
                                        CssClass="btn btn-success" Text="Submit" ValidationGroup="G" OnClick="btnSubMain_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="hdnImage" runat="server" />
        <asp:HiddenField ID="hdnTC" runat="server" />

    </div>

</asp:Content>
