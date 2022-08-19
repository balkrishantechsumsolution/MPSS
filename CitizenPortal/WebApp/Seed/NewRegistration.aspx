<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="NewRegistration.aspx.cs" Inherits="CitizenPortal.WebApp.Seed.NewRegistration" %>

<%@ Register Src="~/ClientSideCrop/ImageCrop.ascx" TagPrefix="uc1" TagName="ImageCrop" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>::SEED LICENSING APPLICATION FORM ::</title>
    <script src="../../Scripts/jquery-2.2.3.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#rdoCompanyType").change(function () {
                var radioValue = $("#rdoCompanyType :checked").val();
                if (radioValue) {

                    if (radioValue == '4') {
                        $("#TbleOwnComanyDtls").show();
                        $("#txtCompanyName").show();
                        $("#ddlCompanyName").hide();
                    }
                    else if (radioValue == '1') {
                        $("#ddlCompanyName").show();
                        $("#txtCompanyName").hide();
                        $("#TbleOwnComanyDtls").hide();
                    }

                    else if (radioValue == '2' || radioValue == '3') {
                        $("#txtCompanyName").show();
                        $("#TbleOwnComanyDtls").hide();
                        $("#ddlCompanyName").hide();
                        if (radioValue == '2') {
                            $("#txtCompanyName").val("NSC");
                            $('#txtCompanyName').attr('readonly', 'true');
                        }
                        else {
                            $("#txtCompanyName").val("");
                            $('#txtCompanyName').removeAttr('readonly');
                        }

                    }

                }
            });

        });

    </script>
    <style>
        input[type="checkbox"], input[type="radio"] {
            opacity: 1;
            position: inherit !important;
            width: 14px;
            cursor: pointer;
        }

        td div {
            width: 100%;
        }

        .bs-callout-info {
            border-left-color: #1b809e;
        }

        .bs-callout {
            background-color: #fff;
            padding: 20px;
            margin: 20px 0;
            border: 1px solid #eee;
            border-left-width: 5px;
            border-radius: 3px;
        }

        .msg {
            display: inline;
            font-size: small;
            padding-bottom: inherit;
            padding-top: 5px;
            border-width: 1px 1px 1px 2px;
            padding-left: 10px;
            -moz-border-top-colors: none;
            -moz-border-right-colors: none;
            -moz-border-bottom-colors: none;
            -moz-border-left-colors: none;
            border-image: none;
            border-radius: inherit;
            color: red;
            text-transform: capitalize;
        }

        input[type="checkbox"], input[type="radio"] {
            margin: 4px 4px 0 4px !important;
        }

        td label {
            padding: 5px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading" id="Div4">
                    <h4 class="box-title register-num">SEED LICENSING APPLICATION FORM
                    </h4>
                </div>

            </div>
        </div>
        <div class="row">
            <div class="col-md-3 box-container">
                <div class="box-heading mTop15">
                    <h4 class="box-title">Attach Photograph
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <uc1:ImageCrop runat="server" id="ImageCrop" />
                </div>
            </div>

            <div class="col-md-9 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">DETAILS ABOUT SRC ISSUING AUTHORITY
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group col-lg-2">
                            <asp:Label ID="Label2" runat="server" Text="Notified Authority" CssClass="manadatory "></asp:Label>
                        </div>
                        <div class="form-group col-lg-10">
                            <asp:Label runat="server" ID="lblNotifyAthority"></asp:Label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group col-lg-2">
                            <asp:Label runat="server" ID="lblHeadingAthorityPlaceorDistrict" CssClass="manadatory "></asp:Label>

                        </div>
                        <div class="form-group col-lg-10">
                            <asp:Label runat="server" ID="lblAthorityPlace"></asp:Label>
                            <asp:DropDownList ID="ddlAthorityPlaceorDistrict" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvinput1" runat="server" ControlToValidate="ddlAthorityPlaceorDistrict" Display="Dynamic" InitialValue="0" ErrorMessage="Please Select Athority district" SetFocusOnError="true" ValidationGroup="validateAll" CssClass="msg"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group col-lg-2">
                            <asp:Label runat="server" ID="lblHeadingAthorityStateorOffice" CssClass="manadatory "></asp:Label>
                        </div>
                        <div class="form-group col-lg-10">
                            <asp:Label runat="server" ID="lblAthorityState"></asp:Label>

                            <asp:DropDownList ID="ddlAthorityStateorOffice" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvinput2" runat="server" ControlToValidate="ddlAthorityStateorOffice" Display="Dynamic" InitialValue="0" ErrorMessage="Please Select Athority DAO Office" SetFocusOnError="true" ValidationGroup="validateAll" CssClass="msg"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>



        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">APPLICANT'S INFORMATION 
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="lblBussinessType">
                                Bussiness Type
                            </label>
                            <asp:Label runat="server" ID="lblBussinessType" Text="Dealer"></asp:Label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="lbltodaydate">
                                Application Date
                            </label>
                            <asp:Label ID="lbltodaydate" runat="server"> </asp:Label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="txtFirmName">
                                Name of Firm
                            </label>
                            <asp:TextBox ID="txtFirmName" runat="server" CssClass="form-control" placeholder="Name of Firm" required></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="ddlAppType">
                                Applicant Type
                            </label>
                            <asp:DropDownList ID="ddlAppType" runat="server" CssClass="form-control">
                            </asp:DropDownList>


                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlAppType" Display="Dynamic" InitialValue="0" ErrorMessage="Please Select Applicant Type" SetFocusOnError="true" ValidationGroup="validateAll" CssClass="msg"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="txtApplicantName">
                                Applicant's Name
                            </label>
                            <asp:TextBox ID="txtApplicantName" runat="server" CssClass="form-control" placeholder="Applicant's Name" required></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="txtPAddress">
                                Postal Address
                            </label>
                            <asp:TextBox ID="txtPAddress" runat="server" CssClass="form-control" placeholder="Postal Address"
                                TextMode="MultiLine" required></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="lblPState">
                                State
                            </label>
                            <asp:Label ID="lblPState" Text='Odisha' runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="ddlPDistrict">
                                District
                            </label>
                            <asp:DropDownList ID="ddlPDistrict" runat="server" CssClass="form-control">
                            </asp:DropDownList>


                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlPDistrict" Display="Dynamic" InitialValue="0" ErrorMessage="Please Select District" SetFocusOnError="true" ValidationGroup="validateAll" CssClass="msg"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="ddlPBlock">
                                Block/NAC/Municipality
                            </label>
                            <asp:DropDownList ID="ddlPBlock" runat="server" CssClass="form-control">
                            </asp:DropDownList>


                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlPBlock" Display="Dynamic" InitialValue="0" ErrorMessage="Please Select Block/NAC/Municipality" SetFocusOnError="true" ValidationGroup="validateAll" CssClass="msg"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="txtPEmail">
                                Email-ID
                            </label>
                            <asp:TextBox ID="txtPEmail" runat="server" CssClass="form-control" placeholder="Email-ID" TextMode="Email" required></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="txtPPinCode">
                                Pin Code
                            </label>
                            <asp:TextBox ID="txtPPinCode" runat="server" CssClass="form-control" placeholder="Pin Code" MaxLength="6" required></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="txtPmobileNo">
                                Mobile No
                            </label>
                            <asp:TextBox ID="txtPmobileNo" runat="server" CssClass="form-control" placeholder="Mobile No" MaxLength="10" required></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label for="txtPtelephoneNo">
                                Telephone No
                            </label>
                            <asp:TextBox ID="txtPtelephoneNo" runat="server" CssClass="form-control" MaxLength="15" placeholder="Telephone No"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlPhotoIdType">
                                Photo ID Type
                            </label>
                            <asp:DropDownList ID="ddlPhotoIdType" runat="server" CssClass="form-control">
                            </asp:DropDownList>


                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlPhotoIdType" Display="Dynamic" InitialValue="0" ErrorMessage="Please Select Photo ID Type" SetFocusOnError="true" ValidationGroup="validateAll" CssClass="msg"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label for="txtPhotoIdNumber">
                                Photo ID Number
                            </label>
                            <asp:TextBox ID="txtPhotoIdNumber" runat="server" CssClass="form-control" placeholder="Photo ID Number" required></asp:TextBox>
                        </div>
                    </div>

                    <div class="clearfix">
                    </div>
                </div>

            </div>
        </div>


        <div class="row">
            <div class="col-md-6 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">BUSINESS ADDRESS DETAILS
                    </h4>
                </div>
                <div class="box-body box-body-open">


                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="txtBAddress">
                                Address
                            </label>
                            <asp:TextBox ID="txtBAddress" runat="server" CssClass="form-control" placeholder="Business Address"
                                TextMode="MultiLine" required></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="lblBstate">
                                State
                            </label>
                            <asp:Label ID="lblBstate" runat="server" Text="Odisha"> </asp:Label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group">
                            <label class="manadatory" for="ddlBdistrict">
                                District
                            </label>
                            <asp:DropDownList ID="ddlBdistrict" runat="server" CssClass="form-control">
                            </asp:DropDownList>


                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlBdistrict" Display="Dynamic" InitialValue="0" ErrorMessage="Please Select District" SetFocusOnError="true" ValidationGroup="validateAll" CssClass="msg"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="txtBPinCode">
                                Pin Code
                            </label>
                            <asp:TextBox ID="txtBPinCode" runat="server" CssClass="form-control" placeholder="Pin Code" MaxLength="6" required></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="ddlBBlock">
                                Block/Municipality/NAC
                            </label>
                            <asp:DropDownList ID="ddlBBlock" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlBBlock" Display="Dynamic" InitialValue="0" ErrorMessage="Please Select Block/Municipality/NAC" SetFocusOnError="true" ValidationGroup="validateAll" CssClass="msg"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group">
                            <label for="lblGP">
                                <asp:Label runat="server" ID="lblGP"></asp:Label>
                            </label>
                            <asp:DropDownList ID="ddlGP" runat="server" CssClass="form-control">
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlGP" Display="Dynamic" InitialValue="0" ErrorMessage="Please Select GP" SetFocusOnError="true" ValidationGroup="validateAll" CssClass="msg"></asp:RequiredFieldValidator>
                        </div>
                    </div>


                    <div class="clearfix">
                    </div>
                </div>

            </div>

            <div class="col-md-6 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">SOURCE OF SEED <span style="color: rgb(243, 103, 103);">NOTE : PLEASE FILL THE INDIVIDUAL SOURCE OF SEED AND SAVE.</span>
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="rdoCompanyType">
                                Company Type
                            </label>
                            <asp:RadioButtonList ID="rdoCompanyType" runat="server" RepeatDirection="Horizontal">
                            </asp:RadioButtonList>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="rdoCompanyType" Display="Dynamic" ErrorMessage="Please Select Company Type" SetFocusOnError="true" ValidationGroup="validateAll" CssClass="msg"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="ddlCompanyName">
                                Company Name
                            </label>
                            <asp:DropDownList ID="ddlCompanyName" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                            <asp:TextBox ID="txtCompanyName" runat="server" Style="display: none;" CssClass="form-control" placeholder="Company Name"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group">
                            <label class="manadatory" for="txtSourceOfSeedAddress">
                                Address
                            </label>
                            <asp:TextBox ID="txtSourceOfSeedAddress" runat="server" CssClass="form-control" placeholder="Address"
                                TextMode="MultiLine" required></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group">
                            <label class="manadatory" for="FuPrincipalCertificate">
                                Principal Certificate
                            </label>
                            <asp:FileUpload ID="FuPrincipalCertificate" runat="server" CssClass="list-group-item list-group-item-danger btn-file col-lg-12"></asp:FileUpload>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="FuPrincipalCertificate" Display="Dynamic" ErrorMessage="Please Add Principal Certificate " SetFocusOnError="true" ValidationGroup="validateAll" CssClass="msg"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div id="TbleOwnComanyDtls">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="txtProcessRegNo">
                                    Processing Regd. No
                                </label>
                                <asp:TextBox ID="txtProcessRegNo" runat="server" CssClass="form-control" placeholder="Processing Regd. No"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="txtIssueDate">
                                    Issue Date
                                </label>
                                <asp:TextBox ID="txtIssueDate" runat="server" CssClass="form-control" placeholder="dd/mm/yyyy"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="txtProcessRegNo">
                                    Valid Upto
                                </label>
                                <asp:TextBox ID="txtValiUpto" runat="server" CssClass="form-control" placeholder="dd/mm/yyyy"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>                
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">DOCUMENTS DETAILS <span style="color: rgb(243, 103, 103);">NOTE : PLEASE TAKE THE FOLLOWING DOCUMENTS TO THE NOTIFIED AUTHORITY </span>
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <asp:CheckBoxList ID="chkDocDtls" runat="server" RepeatDirection="Vertical" RepeatLayout="OrderedList">
                            </asp:CheckBoxList>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <div class="col-md-6 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">PAYMENT DETAILS
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="txtTreasuryName">
                                Treasury Name
                            </label>
                            <asp:TextBox ID="txtTreasuryName" runat="server" CssClass="form-control" placeholder="Treasury Name" required></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="txtChallanNumber">
                                Challan Number
                            </label>
                            <asp:TextBox ID="txtChallanNumber" runat="server" CssClass="form-control" placeholder="Challan Number" required></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="txtChallanDate">
                                Challan Date
                            </label>
                            <asp:TextBox ID="txtChallanDate" runat="server" CssClass="form-control" placeholder="Challan Date" required></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="txtAmount">
                                Amount
                            </label>
                            <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" placeholder="Amount" required></asp:TextBox>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 box-container" id="divBtn">
                <div class="box-body box-body-open" style="text-align: center;">
                    <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-info" Text="submit" OnClick="btnsubmit_Click" />
                    <%--ValidationGroup="validateAll"--%>
                </div>
            </div>
            <div class="clearfix">
            </div>
        </div>
    </div>
</asp:Content>
