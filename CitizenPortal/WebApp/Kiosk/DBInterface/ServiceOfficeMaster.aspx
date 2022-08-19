<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="ServiceOfficeMaster.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.DBInterface.ServiceOfficeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="../../Scripts/CommonScript.js"></script>
    <script src="ServiceOfficeMaster.js"></script>
    <style type="text/css">
        .fldupload {
            position: absolute;
            margin: -40px 0 0 8px;
            opacity: 0;
            -ms-filter: 'alpha(opacity=0)';
            direction: ltr;
            cursor: pointer;
        }

        .fldupload {
            width: 120px;
            height: 30px;
        }

        .error {
        }

        .btnUpload {
            color: #fff;
            background-color: #5cb85c;
            border-color: #4cae4c;
            display: inline-block;
            padding: 6px 12px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;
            content: "\f019";
        }
        .subhdBox{ background-color:#E0E0E0; color:#37485F; font-size:15px; font-weight:600; letter-spacing:0.03em; padding:10px;  margin:0 auto 10px;}

        .mtop0{ margin-top:0 !important;}
    </style>
    <style type="text/css">
        .divError {
            font-family: Arial;
            font-size: 20px;
            text-align: center;
            margin: 10px auto;
        }

            .divError img {
                float: left;
                width: 50px;
                margin: 0 20px 0 10px;
            }

            .divError div {
                float: left;
                color: red;
                font-size: .8em;
            }

            .divError h1 {
                float: left;
                margin: 0;
                padding: 0;
                font-size: .9em;
                color: maroon;
            }

        .info, .success, .warning, .error, .validation {
            /*border: 1px solid;*/
            margin: 10px 0px;
            padding: 15px 10px 15px 15px;
            background-repeat: no-repeat;
            background-position: 10px left;
            text-align: left;
            font: 13px Tahoma,sans-serif;
        }

        .success {
            color: #4F8A10;
            background-color: #DFF2BF;
        }

        .error {
            color: #D8000C;
            background-color: #FFBABA;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row mt20">
        <div class="col-lg-10 col-md-push-1 box-container">
            <div class="box-heading">
                <h4 class="box-title">Service Map </h4>
            </div>
            <div runat="server" class="danger error bg-warning" id="divErr">
                <div class="divError">
                </div>
            </div>
            <div class="box-body box-body-open">
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 subhdBox mtop0">
                   Designated Officer Details
               </div>
                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">

                    <div class="form-group">
                        <label class="manadatory" for="district">
                            District for Designated Officer</label>
                        <asp:DropDownList ID="ddlDistrict" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged"></asp:DropDownList>


                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">

                    <div class="form-group">
                        <label class="" for="district">
                            Block for Designated Officer</label>
                        <asp:DropDownList ID="ddlBlock" CssClass="form-control" runat="server"></asp:DropDownList>


                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">

                    <div class="form-group">
                        <label class="manadatory" for="department">
                            Department</label>
                        <asp:DropDownList ID="ddlDept" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDept_SelectedIndexChanged"></asp:DropDownList>

                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="manadatory" for="district">Designated Officer</label>
                        <asp:DropDownList ID="ddlDesignatedOfficer" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDesignatedOfficer_SelectedIndexChanged"></asp:DropDownList>

                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <div class="form-group">
                        <label for=""></label>
                        <input type="button" id="" class="btn btn-primary mt20" value="Add" />
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">

                    <div class="form-group">
                        <label class="manadatory" for="officeName">Office Name</label>
                        <%--<input name="" type="text" id="" class="form-control" placeholder="Office Name" maxlength="40" autofocus="" />--%>
                        <asp:TextBox ID="txtDesignatedOfficer" MaxLength="40" runat="server" placeholder="Designated Officer*" CssClass="form-control" AutoCompleteType="Disabled" onkeypress="return ValidateAlpha(event);"></asp:TextBox>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">

                    <div class="form-group">
                        <label class="manadatory" for="officeAddress">Office Address</label>
                        <%--<input name="" type="text" id="" class="form-control" placeholder="Office Address" maxlength="40" autofocus="" />--%>
                        <asp:TextBox ID="txtDesignatedAddress" MaxLength="40" runat="server" placeholder="Designated Officer Address*" CssClass="form-control" AutoCompleteType="Disabled" onkeypress="return ValidateAlpha(event);"></asp:TextBox>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 subhdBox">
                   Appellate Authority Details
               </div>

                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                    <div class="form-group">
                        <label class="manadatory" for="officeAddress">District for Appellate Authority</label>
                        <asp:DropDownList ID="ddlDistrict2" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDistrict2_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                    <div class="form-group">
                        <label class="" for="officeAddress">Block for Appellate Authority</label>
                        <asp:DropDownList ID="ddlBlock2" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                    <div class="form-group">
                        <label class="manadatory" for="officeAddress">Department for Appellate Authority</label>
                        <asp:DropDownList ID="ddlDept2" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDept2_SelectedIndexChanged"></asp:DropDownList>

                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="manadatory" for="district">Appellate Authority</label>
                        <asp:DropDownList ID="ddlAppellateAuthority" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlAppellateAuthority_SelectedIndexChanged"></asp:DropDownList>

                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <div class="form-group">
                        <label for=""></label>
                        <input type="button" id="" class="btn btn-primary mt20" value="Add" />
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="manadatory" for="officeAddress">Office Name</label>
                        <%--<input name="" type="text" id="" class="form-control" placeholder="Office Address" maxlength="40" autofocus="" />--%>
                        <asp:TextBox ID="txtAppellateAuthority" MaxLength="40" runat="server" placeholder="Appellate Authority*" CssClass="form-control" AutoCompleteType="Disabled" onkeypress="return ValidateAlpha(event);"></asp:TextBox>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="manadatory" for="officeAddress">Office Address</label>
                        <%--<input name="" type="text" id="" class="form-control" placeholder="Office Address" maxlength="40" autofocus="" />--%>
                        <asp:TextBox ID="txtAppellateAddress" MaxLength="40" runat="server" placeholder="Appellate Authority Address*" CssClass="form-control" AutoCompleteType="Disabled" onkeypress="return ValidateAlpha(event);"></asp:TextBox>
                    </div>
                </div>
                <div class="clearfix"></div>
                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 subhdBox">
                   Revisional Authority Details
               </div>

                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                    <div class="form-group">
                        <label class="manadatory" for="officeAddress">District for Revisional Authority</label>
                        <asp:DropDownList ID="ddlDistrict3" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDistrict3_SelectedIndexChanged"></asp:DropDownList>



                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                    <div class="form-group">
                        <label class="" for="officeAddress">Block for Revisional Authority</label>
                        <asp:DropDownList ID="ddlBlock3" CssClass="form-control" runat="server"></asp:DropDownList>



                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                    <div class="form-group">
                        <label class="manadatory" for="officeAddress">Department for Revisional Authority</label>
                        <asp:DropDownList ID="ddlDept3" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDept3_SelectedIndexChanged"></asp:DropDownList>


                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="manadatory" for="district">Revisional Authority</label>
                        <asp:DropDownList ID="ddlRevisionalAuthority" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlRevisionalAuthority_SelectedIndexChanged"></asp:DropDownList>

                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <div class="form-group">
                        <label for=""></label>
                        <input type="button" id="" class="btn btn-primary mt20" value="Add" />
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="manadatory" for="officeAddress">Office Name</label>
                        <%--<input name="" type="text" id="" class="form-control" placeholder="Office Name" maxlength="40" autofocus="" />--%>
                        <asp:TextBox ID="txtRevisionalAuthority" MaxLength="40" runat="server" placeholder="Revisional Authority*" CssClass="form-control" AutoCompleteType="Disabled" onkeypress="return ValidateAlpha(event);"></asp:TextBox>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="manadatory" for="officeAddress">Office Address</label>
                        <%--<input name="" type="text" id="" class="form-control" placeholder="Office Address" maxlength="40" autofocus="" />--%>
                        <asp:TextBox ID="txtRevisionalAddress" MaxLength="40" runat="server" placeholder="Revisional Authority Address*" CssClass="form-control" AutoCompleteType="Disabled" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <b>Departments</b>
                    <div class="form-group">
                        <label class="">
                            <input type="checkbox" value="" />Department 1</label>
                        <label class="">
                            <input type="checkbox" value="" />Department 2</label>
                        <label class="">
                            <input type="checkbox" value="" />Department 3</label>
                        <label class="">
                            <input type="checkbox" value="" />Department 4</label>

                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <b>Services</b>
                    <div class="form-group">
                        <label class="">
                            <input type="checkbox" value="" />Service 1</label>
                        <label class="">
                            <input type="checkbox" value="" />Service 2</label>
                        <label class="">
                            <input type="checkbox" value="" />Service 3</label>
                        <label class="">
                            <input type="checkbox" value="" />Service 4</label>

                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-10 col-md-push-1 box-container">
            <div class="box-body box-body-open text-center">
                <%--<input type="button" id="" class="btn btn-success" value="Map" />--%>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-success"
                    OnClientClick="return ValidateForm();" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
</asp:Content>
