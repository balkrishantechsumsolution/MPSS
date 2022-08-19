<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ServiceInformation.ascx.cs" Inherits="CitizenPortal.WebApp.Control.ServiceInformation" %>



<script type="text/javascript">

    $(document).ready(function () {
        debugger;

        var qs = getQueryStrings();


        Information();

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

    function Information() {
        //alert(chk);
        debugger;

        var qs = getQueryStrings();
        var SVID = qs["SvcID"];

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/webapp/kiosk/forms/basicdetail.aspx/GetSVIDdetail',
            //data: '{"prefix": ""}',
            //data: '{"UID": '+uid+'}',
            data: '{"SVCID":"' + SVID + '"}',
            processData: false,
            dataType: "json",
            success: function (response) {
                var arr = eval(response.d);
                var html = "";
                var name = arr[0].Name;
                //alert(name);
                $("#spnINnfo").html(name);

            },
            error: function (a, b, c) {
                alert("1." + a.responseText);
            }
        });
    }


</script>

<div class="box-body box-body-open" id="divInfo">
    <div class="col-sm-12 col-md-12 col-lg-12">
        <p class="text-justify">
            <span id="spnINnfo" style="margin-bottom: 5px">Instruction to fill the form:<br />
            </span>            
        </p>
    </div>
    <div class="clearfix">
    </div>
</div>
