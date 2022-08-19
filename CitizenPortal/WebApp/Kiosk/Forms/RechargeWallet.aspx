<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="RechargeWallet.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.RechargeWallet" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
        <uc1:Infomation runat="server" ID="Infomation" />
        <%---Start of Instruction----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Wallet Recharge
                    </h4>
                </div>
                <div class="">
                    <ul class="list-group">
                        <li class="list-group-item list-group-item-info">
                            <span><i class="fa fa-gear fa-fw"></i>Instruction</span>
                            <ul class="">
                                <li>All asterisk (*) marked field are mandatory
                                </li>
                                <li>UID / Voter Id No / PAN No is mandatory
                                </li>
                            </ul>
                        </li>
                        <li class="list-group-item list-group-item-success">
                            <span class=""><i class="fa fa-gear fa-fw"></i>Applicant Photograph</span>
                            <ul class="">
                                <li>The file format needs to be in .bmp / .jpg / .png
                                </li>
                                <li>Size Photograph should be between 5KB to 500KB.
                                </li>
                                <li>The width of the photograph should be 160 pixels
                                </li>

                            </ul>
                        </li>
                        <li class="list-group-item list-group-item-info">
                            <span><i class="fa fa-gear fa-fw"></i>Verification</span>
                            <ul class="">
                                <li>Verify the mobile and email id, through verification code send through SMS and email
                                </li>
                                <li>Enter the captcha to verify youself
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <%----END of Instruction-----%>

        <%---Start of Balance Detail----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Balance Detail
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="" for="Village">
                                Current Balance
                            </label>
                            <asp:Label ID="txtBalance" runat="server" CssClass="form-control" Text="Label"></asp:Label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="" for="Village">
                                Recharge Amount
                            </label>
                            <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" Text=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="" for="Village">
                                Balance After Recharge
                            </label>
                            <asp:Label ID="lblTotal" runat="server" CssClass="form-control" Text="Label"></asp:Label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="" for="Village">
                                Payment Mode
                            </label>
                            <asp:DropDownList ID="ddl_PaymentMode" runat="server" AppendDataBoundItems="True"
                                CssClass="form-control" ToolTip="Select Mode of Payment (mandatory)"
                                AutoPostBack="True">
                                <asp:ListItem Text="Select" Value="Select" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="ON">Online</asp:ListItem>
                                <asp:ListItem Text="Cheque" Value="CQ"></asp:ListItem>
                                <asp:ListItem Value="DD">Demand Draft</asp:ListItem>
                                <asp:ListItem Text="Cash" Value="CS"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="" for="Village">
                                Transaction Date
                            </label>
                            <asp:TextBox ID="txt_Date" runat="server" CssClass="form-control"></asp:TextBox>
                            <%--<asp:CalendarExtender ID="txt_Date_CalendarExtender" runat="server" Enabled="True"
                                Format="dd/MM/yyyy" TargetControlID="txt_Date" OnClientDateSelectionChanged="checkDate"
                                PopupPosition="TopLeft">
                            </asp:CalendarExtender>--%>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="" for="Village">
                                Reference / Deposit / Cheque/ Demand Draft No
                            </label>
                            <asp:TextBox ID="txtNo" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <%----END of Filter-----%>
        <%---Start of Bank Detail----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Bank Detail
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="state">
                                State
                            </label>
                            <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" CssClass="form-control"
                                ToolTip="Select the State name (mandatory)">
                                <asp:ListItem Text="Select Division" Value="0"> </asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="" for="district">
                                District 
                            </label>
                            <asp:DropDownList ID="ddl_District" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                CssClass="form-control" ToolTip="Select the District name (mandatory)">
                                <asp:ListItem Text="Select District" Value="0"> </asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="Village">
                                Subdistrict
                            </label>
                            <asp:DropDownList ID="ddl_Subdistrict" runat="server" AppendDataBoundItems="True" CssClass="form-control"
                                AutoPostBack="True" ToolTip="Select Subdistrict name (mandatory)">
                                <asp:ListItem>Select Subdistrict</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlGender">
                                Village
                            </label>
                            <asp:DropDownList ID="ddl_City" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                CssClass="form-control" ToolTip="Select City or Town name (if doesnot exist select other)">
                                <asp:ListItem>Select Village / City / Town</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlGender">
                                Amount Deposited (Bank)
                            </label>
                            <asp:DropDownList ID="ddl_Bank" runat="server" AppendDataBoundItems="True" CssClass="form-control"
                                ToolTip="Select Bank (mandatory)">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlGender">
                                Account Holders Bank
                            </label>
                            <asp:DropDownList ID="ddlMOLBank" runat="server" AppendDataBoundItems="True" CssClass="form-control"
                                ToolTip="Select MOL Bank (mandatory)">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <%----END of Filter-----%>
        <%---Start of Bank Detail----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Upload Receipt
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-4">
                        <div class="">
                            <label class="manadatory" for="ddlGender">
                                Upload Payment Receipt
                            </label>                            
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6">
                        <div class="">                            
                            <asp:FileUpload ID="FileUpload" runat="server" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <%----END of Filter-----%>
        <%---Start of Button----%>
        <div class="row">
            <div class="col-md-12 box-container" id="divBtn">
                <div class="box-body box-body-open" style="text-align: center;">  
                    <asp:Button ID="btnSubmit" runat="server" CausesValidation="False" CssClass="btn btn-success"
                        OnClientClick="javascript:return Search(); "
                        Text="Submit" />
                    <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel"
                        CssClass="btn btn-danger" PostBackUrl="~/DashBoard/Login.aspx"
                        Text="Cancel" />
                </div>
            </div>
            <div class="clearfix">
            </div>
        </div>
        <%----END of Button-----%>
    </div>
</asp:Content>
