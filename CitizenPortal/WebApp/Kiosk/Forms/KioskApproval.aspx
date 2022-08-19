<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="KioskApproval.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.KioskApproval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
        <%---Start of Information----%>
        <div class="row mt10 mb5">
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-primary mb5">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-2">
                                <i class="fa fa-calendar fa-4x"></i>
                            </div>
                            <div class="col-xs-10 text-right">
                                <div class="huge">
                                    04
                                </div>
                                <div>
                                    September 2016
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-green  mb5">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-rupee fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    90832
                                </div>
                                <div>
                                    Total Kiosk
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-red mb5">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-tasks fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    2401
                                </div>
                                <div>
                                    Pending Kiosk
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-yellow mb5">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-support fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    1300
                                </div>
                                <div>
                                    Approved Certificate
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%----END of Information-----%>
        <%---Start of Instruction----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">KIOSK Approval
                    </h4>
                </div>
                <div class="">
                    <ul class="list-group">
                        <li class="list-group-item list-group-item-info">
                            <span><i class="fa fa-gear fa-fw"></i>Instruction</span>
                            <ul class="">
                                <li>All astric (*) marked field are mandatory
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

        <%---Start of Filter----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Search Filter
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlYearTerm">
                                From Date
                            </label>
                            <asp:TextBox ID="txt_FromDate" runat="server" CssClass="form-control"></asp:TextBox>
                            <%--<asp:CalendarExtender ID="txt_FromDate_CalendarExtender" runat="server" Enabled="True"
                                Format="dd/MM/yyyy" TargetControlID="txt_FromDate">
                            </asp:CalendarExtender>--%>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="" for="Village">
                                To Date
                            </label>
                            <asp:TextBox ID="txt_ToDate" runat="server" CssClass="form-control"></asp:TextBox>
                            <%--<asp:CalendarExtender ID="txt_ToDate_CalendarExtender" runat="server" Enabled="True"
                                Format="dd/MM/yyyy" TargetControlID="txt_ToDate">
                            </asp:CalendarExtender>--%>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="" for="Village">
                                Status
                            </label>
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Select" Value="0"> </asp:ListItem>
                                <asp:ListItem Text="Approved" Value="A"> </asp:ListItem>
                                <asp:ListItem Text="Rejected" Value="R"> </asp:ListItem>
                                <asp:ListItem Text="Pending" Value="P"> </asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

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
                                Application ID
                            </label>
                            <asp:TextBox ID="txt_AppID" runat="server" CssClass="form-control" ToolTip=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                Filter Count/Total Count
                            </label>
                            <label class="form-control" for="ddlGender">
                                55 / 300
                            </label>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 right">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                &nbsp;</label><asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="fa-align-center fa-search fa-2x btn-"
                                    ToolTip="Click to search the filtered record"
                                    OnClick="btnExportExcel_Click" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <%----END of Filter-----%>
        <%---Start of Infrastructure----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Applicant's Detail
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlYearTerm">
                                Application No.:
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="Village">
                                Application Date:
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="Village">
                                User ID:
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlYearTerm">
                                No. of computers
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                No. of Scanner
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                No. of printer
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="PIN">
                                No. of Camera
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="PIN">
                                Average User
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="PIN">
                                Nearby Institute
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory" for="PIN">
                                Nearby Offices
                            </label>
                        </div>
                    </div>

                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <%----END of Infrastructure-----%>
        <div class="row">
            <%---Start Photograph of VLE----%>
            <div class="col-md-3 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Applicant Photograph
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-lg-12">
                        <img class="form-control" src="../Images/photo.png" name="photocustomer" style="height: 220px" />
                    </div>
                    <div class="clearfix">
                    </div>
                </div>

            </div>
            <%---END Photograph of VLE-----%>
            <%---Start of Verification----%>
            <div class="col-md-5 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Personal Details
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="" for="lblAadhar">
                                UID Aadhar No. : 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="" for="lblPanNo">
                                PAN No. : 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="" for="lblVoterId">
                                Voter ID No. : 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="" for="lblMobileNo">
                                Mobile No. : 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group">
                            <label class="" for="lblEmailId">
                                Email Id : 
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group">
                            <label class="" for="ddlYearTerm">
                                Full Name
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group">
                            <label class="" for="ddlYearTerm">
                                Guardian (Father / Husband) Name
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group">
                            <label class="" for="Village">
                                Mother's Maiden Name
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="" for="">
                                Is Divine Body
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="" for="">
                                Divine Part
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-8">
                        <div class="form-group">
                            <label class="" for="Village">
                                Date of Birth
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="" for="ddlYearTerm">
                                Age
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="ddlGender">
                                Gender
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="" for="ddlYearTerm">
                                Family Anual Income
                            </label>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <%---END of Verification-----%>
            <%---Start Kisok Photograph----%>
            <div class="col-md-4 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">KIOSK Photograph
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-lg-12">
                        <img class="form-control" src="../Images/photo1.png" name="photoshop" style="height: 220px" />
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <%----End Photograph of Kiosk-----%>
        </div>
        <div class="row">
            <%---Start of PostalAddress----%>
            <div class="col-md-6 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Postal Address
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group">
                            <label class="manadatory" for="ddlYearTerm">
                                Address Line-1 (Care of)
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group">
                            <label class="" for="Village">
                                Address Line-2 (Building)
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="ddlGender">
                                State
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="ddlGender">
                                District
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="ddlGender">
                                Taluka
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="ddlGender">
                                City/Town/Village
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="PIN">
                                PIN
                            </label>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <%---END of PostalAddress-----%>

            <%---Start of KioskAddress----%>
            <div class="col-md-6 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Kiosk Address
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group">
                            <label class="manadatory" for="ddlYearTerm">
                                Address Line-1 (Care of)
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group">
                            <label class="" for="Village">
                                Address Line-2 (Building)
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="ddlGender">
                                State
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="ddlGender">
                                District
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="ddlGender">
                                Taluka
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="ddlGender">
                                City/Town/Village
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="PIN">
                                PIN
                            </label>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <%---END of PostalAddress-----%>
        </div>
        <%---Start of Infrastructure----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Infrastructure Details
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlYearTerm">
                                Internet connection type
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="Village">
                                Power-cut time
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="Village">
                                Back-up power time
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlYearTerm">
                                No. of computers
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                No. of Scanner
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                No. of printer
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="PIN">
                                No. of Camera
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="PIN">
                                Average User
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="" for="PIN">
                                Nearby Institute
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory" for="PIN">
                                Nearby Offices
                            </label>
                        </div>
                    </div>
                    
                <div class="clearfix">
                    </div>
            </div>
        </div>
            </div>
        <%----END of Infrastructure-----%>
        <%---Start of Operators Information----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Operator Information
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlYearTerm">
                                Educational Qualification
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="Village">
                                Computer Experience
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="Village">
                                Computer Certification
                            </label>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <%----END of KIOSKAddress-----%>
        <%---Start of Document----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Supporting Documents
                    </h4>
                </div>

                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlYearTerm">
                                Shop Establishment
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlYearTerm">
                                Proof of Divine Body
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlYearTerm">
                                Residencial Proof
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="" for="ddlYearTerm">
                                Aadhar Card
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlYearTerm">
                                PAN Card
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlYearTerm">
                                Highest Qualification Document
                            </label>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>

            </div>
        </div>
        <%----END of Document-----%>
        <%---Start of Button----%>
        <div class="row">
            <div class="col-md-12 box-container" id="divBtn">
                <div class="box-body box-body-open" style="text-align: center;">
                    <asp:Button ID="btnExportExcel" runat="server" CausesValidation="False" CssClass="btn btn-blue"
                        Text="Export to Excel"
                        OnClick="btnExportExcel_Click" />
                    <asp:Button ID="btnPrevious" runat="server" CausesValidation="False" CssClass="btn btn-success"
                        OnClientClick="javascript:return Search();" Text="&lt;= 10 Previous" OnClick="btnPrevious_Click" />

                    <asp:Button ID="btnNext" runat="server" CausesValidation="False" CssClass="btn btn-success"
                        OnClick="btnNext_Click" OnClientClick="javascript:return Search(); "
                        Text="Next 10 =&gt;" />
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
