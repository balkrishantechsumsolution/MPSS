<%@ Page Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="ServiceOfficerMapping.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.DBInterface.ServiceOfficerMapping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <%--  ----%>
    <script src="../../Login/js/jquery-3.1.1.min.js"></script>
    <script src="../../../Scripts/jquery.msgBox.js"></script>
    <link href="../../../PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <link href="../../../PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="DbInterface.js"></script>
    
    <script src="../../Scripts/CommonScript.js"></script>
    <script type="text/javascript">
        function Validate() {
            var val = document.getElementById('txtDesignatedOfficer').value;

            if (!val.match(/^[a-zA-Z]+$/)) {
                alert('Only alphabets are allowed');
                return false;
            }

            return true;
        }
    </script>

    <script>
        function validateEmail(emailField) {
            var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

            if (reg.test(emailField.value) == false) {
                alert('Invalid Email Address !');
                document.getElementById("txtEmail").style.border = "1px solid red";
                return '';
            }

            return true;

        }

    </script>
    <style>
        .card-form .form-body {
            /*padding: 10px;*/
        }

            .card-form .form-body p {
                font-size: 14px;
                color: #546E7A;
                font-weight: bold;
                padding: 0;
                margin: 5px auto;
            }

            .card-form .form-body .row {
                /*display: flex;*/
                justify-content: space-around;
            }

        .w80 {
            width: 79% !important;
        }

        .w84 {
            width: 83% !important;
        }

        .editModetxt {
            background-color: lightslategray !important;
            color: #fff !important;
        }

        .submitBtn {
            display: inline-block;
            line-height: 28px;
            min-width: 150px;
            border: none;
            border-radius: 5px;
            padding: 5px 15px;
            background: #FF5722;
            color: #fff;
            margin-right: 10px;
            font-size: 14px;
        }

        .editBtn {
            display: inline-block;
            line-height: 28px;
            min-width: 150px;
            border-radius: 5px;
            padding: 5px 15px;
            background-color: none;
            border: 1px solid #546E7A;
            color: #546E7A;
            margin-right: 10px;
            font-size: 14px;
        }

        .addinfoBtn {
            display: inline-block;
            line-height: 28px;
            width: 100%;
            border-radius: 5px;
            padding: 5px 15px;
            background-color: none;
            border: 1px solid #546E7A;
            color: #546E7A;
            margin-right: 10px;
            font-size: 14px;
        }

        #LeftPanel_pnlMenu {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <div class="w95 card-form">
     
        <h1>Service & Officer Mapping</h1>
        <div class="form-body col-lg-12">
            <div class="row">
                <div class="col-lg-3">                    
                    <p>District </p>

                    <asp:DropDownList ID="ddlDistrict" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged"></asp:DropDownList>

                <%-- <asp:TextBox ID="txtDistrict" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>--%>

                <%--    <label runat="server" id="lblDistrict"></label>--%>
                </div>
                <div class="col-lg-4">
                    <p>Services</p>
                    <asp:DropDownList ID="ddlServices" runat="server" OnSelectedIndexChanged="ddlServices_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-lg-4">
                    <p>Departments</p>
                    <asp:DropDownList ID="ddlDepartment" runat="server"  OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-lg-1">
                    <p>Time Limit</p>
                    <asp:TextBox ID="txtTimeLimit" onkeypress="return isNumber(event); checkLength"   maxlength = "2" runat="server" class="form-control" ></asp:TextBox>
                </div>
            </div>

            <div class="row reqPadding">
                <div class="col-lg-12">
                    <p class="ptop10">Revisional Authority<span style="color: red;">*</span></p>
                </div>
            </div>
            <div class="row reqPadding">
                <%--<div class="col-lg-2">
                    <asp:DropDownList ID="ddlRevisionOffice" runat="server" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                   
                    <span>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" GridLines="None" ShowHeader="false">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkRevisionalAuthority" CssClass="grid_Result" runat="server" Font-Underline="false" Text='<%#Eval("RevisionalOfficerName") %>' OnClick="lnkRevisionalAuthority_Click"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </span>
                </div>--%>

                <div class="col-lg-3"> 
                <asp:DropDownList ID="ddlRevisionOfficerName"  MaxLength="50"  runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlRevisionOfficerName_SelectedIndexChanged"></asp:DropDownList>
                    <asp:TextBox ID="txtRevisionalOffice" MaxLength="50" runat="server" placeholder="Officer Name*" CssClass="form-control" onkeypress="return ValidateAlpha(event);" AutoCompleteType="Disabled"></asp:TextBox>
                 </div>
                
                <%--<div class="col-lg-2">
                    <asp:TextBox ID="txtRevisionalAuthority" MaxLength="50" runat="server" placeholder="Designation*" class="form-control w80" AutoCompleteType="Disabled" onkeypress="return ValidateAlpha(event);" Width="158px"></asp:TextBox></div>--%>
                <div class="col-lg-3">

                    <asp:TextBox ID="txtRevisionalOfficeAddress" MaxLength="50" runat="server" placeholder="Office Address*" CssClass="form-control" AutoCompleteType="Disabled" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                </div>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtRevisionalEmailID" MaxLength="40" runat="server" placeholder="Email ID*" CssClass="form-control"  AutoCompleteType="Disabled" onchange="Emailcheck3();"></asp:TextBox>
                </div>
                <div class="col-lg-2">
                    <asp:TextBox ID="txtRevisionalMobileNo" runat="server" MaxLength="10" placeholder="Mobile No*" CssClass="form-control"  AutoCompleteType="Disabled" onchange="checkmobile3();" onkeypress="return isNumber(event);"></asp:TextBox>
                </div>
                <div class="col-lg-1">
                <asp:HiddenField ID="hdCommand" runat="server" />
                <asp:Button ID="btnAddRevisional" runat="server" Text="Add" class="btn btn-success w100" OnClick="btnAddRevisional_Click" />
                    <asp:Button ID="btnReset" runat="server" Text="Reset" class="addinfoBtn" OnClick="btnReset_Click" />
                    </div>
            </div>
         <%--   ----%>
            <div class="row reqPadding">
                <div class="col-lg-12">
                    <p class="ptop10">
                        <asp:HiddenField ID="hdnRevisionalOfficerName" runat="server" />
                        <asp:HiddenField ID="hdnRevisionlAddress" runat="server" />
                        <asp:HiddenField ID="hdnRevisionalEmail" runat="server" />
                        <asp:HiddenField ID="hdnRevisionalMobile" runat="server" />

                        <asp:HiddenField ID="hdnAppelateOfficerName" runat="server" />
                        <asp:HiddenField ID="hdnAppellateAddress" runat="server" />
                        <asp:HiddenField ID="hdnAppellateEmail" runat="server" />
                        <asp:HiddenField ID="hdnAppellateMobile" runat="server" />

                         <asp:HiddenField ID="hdnDesignatedOfficerName" runat="server" />
                        <asp:HiddenField ID="hdnDesignatedAddress" runat="server" />
                        <asp:HiddenField ID="hdnDesignatedeMail" runat="server" />
                        <asp:HiddenField ID="hdnDesignatedMobile" runat="server" />
                        <asp:HiddenField   ID="hdnDistrictCode"  runat="server"></asp:HiddenField>
                         <asp:HiddenField   ID="HiddenField1"  runat="server"></asp:HiddenField>
                    <%-- ----%>
                        Appellate Authority<span style="color: red;">*</span></p>
                </div>
            </div>
            <div class="row reqPadding">
                <div class="col-lg-3">
                    <asp:TextBox ID="txtAppellateOffice" MaxLength="50" runat="server" placeholder="Office Name*" CssClass="form-control"  AutoCompleteType="Disabled" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                   
                </div>

                <%--    <div class="col-lg-2">
                    <asp:TextBox ID="txtAppellateAuthority" MaxLength="50" runat="server" placeholder="Designation*" class="form-control w80" AutoCompleteType="Disabled" onkeypress="return ValidateAlpha(event);"></asp:TextBox></div>--%>
                <div class="col-lg-4">
                    <asp:TextBox ID="txtAppellateOfficeAddress" MaxLength="50" runat="server" placeholder="Office*" CssClass="form-control" AutoCompleteType="Disabled" onkeypress="return ValidateAlpha(event);"></asp:TextBox>
                </div>
                <div class="col-lg-3 col-xs-12">
                    <asp:TextBox ID="txtAppellateEmailID" MaxLength="40" runat="server" placeholder="Email ID*" CssClass="form-control"  AutoCompleteType="Disabled" onchange="Emailcheck2();"></asp:TextBox>
                </div>
                <div class="col-lg-2 col-xs-12">
                    <asp:TextBox ID="txtAppellateMobileNo" MaxLength="10" runat="server" placeholder="Mobile No*" CssClass="form-control"  AutoCompleteType="Disabled" onchange="checkmobile2();" onkeypress="return isNumber(event);"></asp:TextBox>
                </div>
                <div class="col-lg-1 col-xs-12"> <asp:Button ID="btnAddAppellate" runat="server" Text="Add" class="btn btn-success w100" OnClick="btnAddAppellate_Click"  />
                    <asp:Button ID="btnResetForAppellate" runat="server" Text="Reset" class="addinfoBtn" OnClick="btnResetForAppellate_Click"  /></div>
            </div>

            <div class="row reqPadding">
                <div class="col-lg-12">
                    <p class="ptop10">Designated Officer<span style="color: red;">*</span></p>
                </div>
            </div>
            <div class="row reqPadding">
                <div class="col-lg-3">
                    <asp:TextBox ID="txtDesignatedOffice" MaxLength="50" runat="server" placeholder="Officer Name*" CssClass="form-control"  AutoCompleteType="Disabled" onkeypress="return ValidateAlpha(event);"></asp:TextBox>
                    <%--                    <span>
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false" GridLines="None" ShowHeader="false">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkOfficerName" CssClass="grid_Result" runat="server" Font-Underline="false" Text='<%#Eval("DesignatedOfficerName") %>' OnClick="lnkOfficerName_Click"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </span>--%>
                </div>
                <%--                <div class="col-lg-2">
                    <asp:TextBox ID="txtDesignatedOfficer" MaxLength="50" runat="server" placeholder="Designation*" class="form-control w80" AutoCompleteType="Disabled" onkeypress="return ValidateAlpha(event);"></asp:TextBox></div>--%>
                <div class="col-lg-4">
                    <asp:TextBox ID="txtDesignatedOfficeAddress" MaxLength="50" runat="server" placeholder="Office*" CssClass="form-control"  AutoCompleteType="Disabled" onkeypress="return ValidateAlpha(event);"></asp:TextBox>
                </div>
                <div class="col-lg-3 col-xs-12">
                    <asp:TextBox ID="txtDesignatedEmailID" MaxLength="40" runat="server" placeholder="Email ID*" CssClass="form-control"  AutoCompleteType="Disabled" onchange="Emailcheck1();"></asp:TextBox>
                </div>
                <div class="col-lg-2 col-xs-12">
                    <asp:TextBox ID="txtDesignatedMobileNo" MaxLength="10" runat="server" placeholder="Mobile No*" CssClass="form-control"  AutoCompleteType="Disabled" onchange="checkmobile1();" onkeypress="return isNumber(event);"></asp:TextBox>
                </div>
                <div class="col-lg-1 col-xs-12"> <asp:Button ID="btnAddDesignated" runat="server" Text="Add" class="btn btn-success w100" OnClick="btnAddDesignated_Click" />
                    <asp:Button ID="btnResetForDesignated" runat="server" Text="Reset" class="addinfoBtn" OnClick="btnResetForDesignated_Click" /></div>

            </div>
            <div class="rule"></div>
            <div class="form-footer mtop20" style="text-align: center;">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="submitBtn"
                    OnClientClick="return ValidateForm();" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnEdit" runat="server" Text="Update" class="editBtn" Visible="false" OnClick="btnEdit_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="editBtn" Visible="false" OnClick="btnCancel_Click" />
            </div>
            <br />
            <br />
            <br />
        </div>
    </div>
</asp:Content>






