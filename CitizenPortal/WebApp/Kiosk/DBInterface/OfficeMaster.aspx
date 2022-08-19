<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="OfficeMaster.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.DBInterface.OfficeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="OfficeMaster.js"></script>
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

        .subhdBox{ background-color:#E0E0E0; color:#37485F; font-size:15px; font-weight:600; letter-spacing:0.03em; padding:10px; margin:10px auto;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row mt20">
        <div class="col-lg-8 col-md-push-2 box-container">
            <div class="box-heading">
                <h4 class="box-title">Office Master</h4>
            </div>
            <div runat="server" class="danger error bg-warning" id="divErr">
                                <div class="divError">                                  
                                </div>
                            </div>
            <div class="box-body box-body-open">
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">

                    <div class="form-group">
                        <label class="manadatory" for="district">
                            District</label>
                        <asp:DropDownList ID="ddlDistrict" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged"></asp:DropDownList>

                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">

                    <div class="form-group">
                        <label class="" for="district">
                            Block</label>
                        <asp:DropDownList ID="ddlBlock" CssClass="form-control" runat="server"></asp:DropDownList>

                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">

                    <div class="form-group">
                        <label class="manadatory" for="department">
                            Department</label>
                        <asp:DropDownList ID="ddlDept" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                </div>
                
                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="manadatory" for="district">Office Name</label>
                        <asp:DropDownList ID="ddlOffice" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlOffice_SelectedIndexChanged"></asp:DropDownList>

                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="manadatory" for="district">Sub Office Name</label>
                        <asp:DropDownList ID="ddlOfficeSub" CssClass="form-control" runat="server"  placeholder="Sub Officer*"  AutoPostBack="true"></asp:DropDownList>
                    </div>
                </div>
                <div class="clearfix"></div>
               <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 subhdBox">
                   Designated Officer Details
               </div>
                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">

                    <div class="form-group">
                        <label class="manadatory" for="department">
                            Designation</label>
                        <asp:DropDownList ID="ddlDesignation" CssClass="form-control" runat="server"></asp:DropDownList>

                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">

                    <div class="form-group">
                        <label class="manadatory" for="officeName">Designated Officer</label>
                        <%--<input name="" type="text" id="" class="form-control" placeholder="Office Name" maxlength="40" autofocus="" />--%>
                        <asp:TextBox ID="txtDesignatedOfficer" MaxLength="40" runat="server" placeholder="Designated Officer*" CssClass="form-control" AutoCompleteType="Disabled" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                    <div class="form-group">
                        <label class="manadatory" for="officeAddress">Office Address</label>
                        <%--<input name="" type="text" id="" class="form-control" placeholder="Office Address" maxlength="40" autofocus="" />--%>
                        <asp:TextBox ID="txtDesignatedOfficeAddress" MaxLength="50" runat="server" placeholder="Office*" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>

                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                    <div class="form-group">
                        <label class="manadatory" for="pincode">Pincode</label>
                        <%--<input name="" type="text" id="" class="form-control" placeholder="Pincode" maxlength="40" autofocus="" />--%>
                        <asp:TextBox ID="txtDesignatedPinCode" MaxLength="6" runat="server" placeholder="PinCode*" CssClass="form-control" AutoCompleteType="Disabled" onchange="checkmobile1();" onkeypress="return isNumber(event);"></asp:TextBox>

                    </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                    <div class="form-group">
                        <label class="manadatory" for="emailid">Email Id</label>
                        <%--<input name="" type="text" id="" class="form-control" placeholder="Email Id" maxlength="40" autofocus="" />--%>
                        <asp:TextBox ID="txtDesignatedEmailID" MaxLength="40" runat="server" placeholder="Email ID*" CssClass="form-control" AutoCompleteType="Disabled" onchange="Emailcheck1();"></asp:TextBox>

                    </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                    <div class="form-group">
                        <label class="manadatory" for="mobileno">Mobile No.</label>
                        <%--<input name="" type="text" id="" class="form-control" placeholder="Mobile No" maxlength="40" autofocus="" />--%>
                        <asp:TextBox ID="txtDesignatedMobileNo" MaxLength="10" runat="server" placeholder="Mobile No*" CssClass="form-control" AutoCompleteType="Disabled" onchange="checkmobile1();" onkeypress="return isNumber(event);"></asp:TextBox>

                    </div>
                </div>
                <div class="clearfix"></div>

            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8 col-md-push-2 box-container">
            <div class="box-body box-body-open text-center">
                <%--<input type="button" id="" class="btn btn-success" value="Submit" title="Proceed to Upload Necessary Document" />--%>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-success"
                    OnClientClick="return ValidateForm();" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
</asp:Content>
