<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ApplicationSteps.ascx.cs" Inherits="CitizenPortal.WebApp.Control.ApplicationSteps" %>
<style type="text/css">
    .stepfinish {
        background-color: rgb(81, 155, 3);
        border: 1px solid rgb(56, 102, 2);
    }

    .stepactive {
        background-color: rgb(255, 177, 27);
        border: 1px solid rgb(210, 138, 0);
    }
</style>
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
    color: #fff;
    border: 0;
    border:1px solid #ebebeb;
    border-top: 2px solid #2dc3e8;
    border-bottom-color: transparent;
    background-color: #37495f;
    z-index: 12;
    line-height: 16px;
    margin-top: 7px;
    
    /*box-shadow: 0 -2px 3px 0 rgba(0, 0, 0, 0.15);*/
}
    
    .nav-tabs > li:first-child > a {
    margin-left: 0;
    /*border-left: 1px solid #ebebeb;*/
}
</style>
<script type="text/javascript">
    $(document).ready(function () {
       
    });


    function getQueryStrings() {
        var assoc = {};
        var decode = function (s) { return decodeURIComponent(s.replace(/\+/g, " ")); };
        var queryString = location.search.substring(1);
        var keyValues = queryString.split('&');

        for (var i in keyValues) {
            var key = keyValues[i].split('=');
            if (key.length > 1) {
                assoc[decode(key[0])] = decode(key[1]);
            }
        }

        return assoc;
    }

    function fnBasic() {
        
        $("#liBasic").addClass("active");
        $("#liService").removeClass("active");
        $("#liDetails").removeClass("active");
        $("#liDoc").removeClass("active");
        $("#liPayment").removeClass("active");
        window.location.replace("../Forms/BasicDetail.aspx");
    }
    function fnServices() {
        
        var qs = getQueryStrings();
        var uid = qs["UID"];        


        $("#liBasic").removeClass("active");
        $("#liService").addClass("active");
        $("#liDetails").removeClass("active");
        $("#liDoc").removeClass("active");
        $("#liPayment").removeClass("active");
        window.location.replace("../Forms/Services.aspx?UID=" + uid);
    }
    function fnServicesDtls() {
        alert('Please select deparment and service');
        $("#liBasic").removeClass("active");
        $("#liService").removeClass("active");
        $("#liDetails").removeClass("active");
        $("#liDoc").removeClass("active");
        $("#liPayment").removeClass("active");
        $("#liService").addClass("active");
        return false;
    }
    function fnDoc() {
        
        $("#liBasic").removeClass("active");
        $("#liService").removeClass("active");
        $("#liDetails").removeClass("active");
        $("#liDoc").addClass("active");
        $("#liPayment").removeClass("active");
        window.location.replace("../Forms/Attachment.aspx");
    }
    function fnPayment() {
        
        $("#liBasic").removeClass("active");
        $("#liService").removeClass("active");
        $("#liDetails").removeClass("active");
        $("#liDoc").removeClass("active");
        $("#liPayment").addClass("active");
        window.location.replace("../Forms/ConfirmPayment.aspx");
    }
</script>
<div class="" style="display:none">
    <div class="box-body box-body-open text-danger text-danger-green">
        <div class="col-md-12" style="margin: 0 auto 15px; width: 100%;">
            <div class="step1" id="step1">
                <p class="steptext">
                    1
                </p>
                <p class="optiontext">
                    Services & Officer
                </p>
            </div>
            <div class="arrow-line">
            </div>
            <div class="step2" id="step2">
                <p class="steptext">
                    2
                </p>
                <p class="optiontext">
                    User Detail (eKYC)
                </p>
            </div>
            <div class="arrow-line">
            </div>
            <div class="step3" id="step3">
                <p class="steptext">
                    3
                </p>
                <p class="optiontext">
                    Service Information
                </p>
            </div>
            <div class="arrow-line">
            </div>
            <div class="step4" id="step4">
                <p class="steptext">
                    4
                </p>
                <p class="optiontext">
                   Upload Documents
                </p>
            </div>
            <div class="arrow-line">
            </div>
            <div class="step5" id="step5">
                <p class="steptext">
                    5
                </p>
                <p class="optiontext">
                    Payment
                </p>
            </div>                     
        </div>
        <div class="clearfix">
        </div>
    </div>
</div>
<div class="" style="display:none;">
<ul class="nav nav-tabs">
    <li class="active" id="liBasic" runat="server"><a aria-expanded="true" data-toggle="tab" href="#TabsInWidget-1" id="tabBasic" runat="server" onclick="fnBasic();" >Basic Detail</a></li>
    <li class="" id="liService" runat="server"><a aria-expanded="false" data-toggle="tab" href="#TabsInWidget-1" id="tabService" runat="server" onclick="fnServices();">Services</a></li>
    <li class="" id="liDetails" runat="server"><a aria-expanded="false" data-toggle="tab" href="#TabsInWidget-3" id="tabDetails" runat="server" onclick="fnServicesDtls();">Services Details</a></li>
    <li class="" id="liDoc" runat="server"><a aria-expanded="false" data-toggle="tab" href="#TabsInWidget-4" id="tabDoc" runat="server" onclick="fnDoc();">Attachment</a></li>
    <li class="" id="liPayment" runat="server"><a aria-expanded="false" data-toggle="tab" href="#TabsInWidget-5" id="tabPayment" runat="server" onclick="fnPayment();">Payment</a></li>    
</ul></div>
