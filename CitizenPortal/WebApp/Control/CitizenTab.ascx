<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CitizenTab.ascx.cs" Inherits="CitizenPortal.WebApp.Control.CitizenTab" %>
<script type="text/javascript">

    function fnprofile() {
        $('#ContentPlaceHolder1_divAadhar').show();
        $('#ContentPlaceHolder1_divPhoto').show();
        $('#ContentPlaceHolder1_divDetails').show();
        $('#ContentPlaceHolder1_divAddress').show();
        $('#ContentPlaceHolder1_divApplication').show();
        $('#ContentPlaceHolder1_divDocument').show();
        $('#ContentPlaceHolder1_divBtn').hide();
    }
    function fnphoto() {
        $('#ContentPlaceHolder1_divAadhar').hide();
        $('#ContentPlaceHolder1_divPhoto').show();
        $('#ContentPlaceHolder1_divDetails').hide();
        $('#ContentPlaceHolder1_divAddress').hide();
        $('#ContentPlaceHolder1_divApplication').hide();
        $('#ContentPlaceHolder1_divDocument').hide();
        $('#ContentPlaceHolder1_divBtn').hide();
    }
    function fnbasic() {
        $('#ContentPlaceHolder1_divAadhar').hide();
        $('#ContentPlaceHolder1_divPhoto').hide();
        $('#ContentPlaceHolder1_divDetails').show();
        $('#ContentPlaceHolder1_divAddress').hide();
        $('#ContentPlaceHolder1_divApplication').hide();
        $('#ContentPlaceHolder1_divDocument').hide();
        $('#ContentPlaceHolder1_divBtn').hide();
    }
    function fnAddress() {
        $('#ContentPlaceHolder1_divAadhar').hide();
        $('#ContentPlaceHolder1_divPhoto').hide();
        $('#ContentPlaceHolder1_divDetails').hide();
        $('#ContentPlaceHolder1_divAddress').show();
        $('#ContentPlaceHolder1_divApplication').hide();
        $('#ContentPlaceHolder1_divDocument').hide();
        $('#ContentPlaceHolder1_divBtn').hide();
    }
    function fnDoc() {
        $('#ContentPlaceHolder1_divAadhar').hide();
        $('#ContentPlaceHolder1_divPhoto').hide();
        $('#ContentPlaceHolder1_divDetails').hide();
        $('#ContentPlaceHolder1_divAddress').hide();
        $('#ContentPlaceHolder1_divApplication').hide();
        $('#ContentPlaceHolder1_divDocument').show();
        $('#ContentPlaceHolder1_divBtn').hide();

    }
</script>
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
<ul class="nav nav-tabs">
    <li class="active"><a aria-expanded="true" data-toggle="tab" href="#TabsInWidget-1" id="tabProfile" runat="server" onclick="fnprofile();" >Profile</a></li>
    <li class=""><a aria-expanded="false" data-toggle="tab" href="#TabsInWidget-1" id="tabPhoto" runat="server" onclick="fnphoto();">Photograph</a></li>
    <li class=""><a aria-expanded="false" data-toggle="tab" href="#TabsInWidget-3" id="tabBasic" runat="server" onclick="fnbasic();">Basic Details</a></li>
    <li class=""><a aria-expanded="false" data-toggle="tab" href="#TabsInWidget-4" id="tabAddress" runat="server" onclick="fnAddress();">Address</a></li>
    <li class=""><a aria-expanded="false" data-toggle="tab" href="#TabsInWidget-5" id="tabDoc" runat="server" onclick="fnDoc();">Document Briefcase</a></li>    
</ul>
