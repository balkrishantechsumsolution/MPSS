<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Birth.Search" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />

    <style type="text/css">
    /*.nav {
    padding-left: 0;
    margin-bottom: 0;
    list-style: none;
}*/
    .nav-tabs {
    margin-bottom: 0;
    margin-left: 0;
    border: 0;
    top: 2px;
    /*background-color: #eeeeee;
    -webkit-box-shadow: 0 0 4px rgba(0, 0, 0, 0.3);
    -moz-box-shadow: 0 0 4px rgba(0, 0, 0, 0.3);
    box-shadow: 0 0 4px rgba(0, 0, 0, 0.3);*/
}
    .nav-tabs > li {
    margin-bottom: -2px;
}
    .nav-tabs > li {
    float: left;
    margin-bottom: -1px;
}
    /*.nav > li {
    position: relative;
    display: block;
}*/
        
    .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
    color: #262626;
    border: 0;
    border:1px solid #ebebeb;
    border-top: 2px solid #2dc3e8;
    border-bottom-color: transparent;
    background-color: #fbfbfb;
    z-index: 12;
    line-height: 16px;
    margin-top: 7px;
    
    /*box-shadow: 0 -2px 3px 0 rgba(0, 0, 0, 0.15);*/
}
    
    .nav-tabs > li:first-child > a {
    margin-left: 0;
    border-left: 1px solid #ebebeb;
}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
                <uc1:FormTitle runat="server" ID="FormTitle" />
                <div class="clearfix">
                    
                </div>
                <ul class="nav nav-tabs">
                    <li class="active"><a aria-expanded="true" data-toggle="tab" href="#TabsInWidget-1" id="tabProfile" runat="server" onclick="fnRegNo();">Register No.</a></li>
                    <li class=""><a aria-expanded="false" data-toggle="tab" href="#TabsInWidget-1" id="tabPhoto" runat="server" onclick="fnphoto();">Instituation No.</a></li>
                    <li class=""><a aria-expanded="false" data-toggle="tab" href="#TabsInWidget-3" id="tabBasic" runat="server" onclick="fnbasic();">Other Details</a></li>
                </ul>
                <div class="row" id="divBirthDetails" runat="server">
                    <div class="row">
                        <div class="col-md-12">
                            <%---Start of BirthDetails----%>
                            <div class="col-md-12 box-container mTop15">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">Search By Registration No.
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                                        <div class="form-group">
                                            <label class="manadatory" for="firstname">
                                                {{resourcesData.child}}</label>
                                            <input id="txtChildName" class="form-control" placeholder="Name of Account Holder" name="AccountHolder" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlGender">
                                                {{resourcesData.lblAppGender}}</label>
                                            <select class="form-control" data-val="true" data-val-number="Gender."
                                                data-val-required="Please select gender." id="ddlGender" name="Gender">
                                                <option>Select Gender</option>
                                                <option>Male</option>
                                                <option>Female</option>
                                                <option>Transgender</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="FatherName">
                                                {{resourcesData.father}}</label>
                                            <input id="FatherName" class="form-control" placeholder="Father Name" name="Father Name" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="MotherName">
                                                {{resourcesData.lblAppMotherName}}</label>
                                            <input id="MotherName" class="form-control" placeholder="Mother Name" name="Mother Name" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="applicantname">
                                                {{resourcesData.lblAppName}}</label>
                                            <input id="applicantname" class="form-control" placeholder="Applicanat Name" name="Applicanat Name" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="applicantrelation">
                                                {{resourcesData.relationwithchild}}</label>
                                            <input id="applicantrelation" class="form-control" placeholder="Relation with Beneficiary" name="Beneficiary Name" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="DOB">
                                                {{resourcesData.lblAppDOB}}</label>
                                            <input id="DOB" class="form-control" placeholder="dd/MM/yyyy" name="Date of Birth" type="text" value="" maxlength="10"
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-8 col-lg-8">
                                        <div class="form-group">
                                            <label class="manadatory" for="POB">
                                                {{resourcesData.lblPOB}}</label>
                                            <input id="lblPOB" class="form-control" placeholder="Birth Place" name="Place of Birth" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <%----End of BirthDetails-----%>
                            
                            <%---Start of Button----%>
                            <div class="" id="divBtn" runat="server">
                                <div class="col-md-12 box-container">
                                    <div class="box-body box-body-open" style="text-align: center;">

                                        <input type="button" id="btnSubmit" class="btn btn-success" value="Next =>>" onclick="fnNext();" />
                                        <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel"
                                            CssClass="btn btn-danger" PostBackUrl=""
                                            Text="Cancel" />
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                            <%---End of Button----%>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" Value="993" />
</asp:Content>
