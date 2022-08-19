<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Declaration.ascx.cs" Inherits="CitizenPortal.WebApp.Control.Declaration" %>
<%--<%@ Register Src="~/WebApp/Control/Declaration.ascx" TagPrefix="uc1" TagName="Declaration" %>--%>


<script type="text/javascript">

    $(document).ready(function () {
        debugger;
        var qs = getQueryStrings();
        
        if (qs["UID"] != null && qs["UID"] != "") {
            $('#btnSubmit').prop('disabled', true);
        }
        
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

    function declaration(chk) {
        //alert(chk);
        debugger;
        if (chk) {
            var qs = getQueryStrings();
            var uid = qs["UID"];

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/webapp/kiosk/forms/basicdetail.aspx/GetDeclaration',
                //data: '{"prefix": ""}',
                //data: '{"UID": '+uid+'}',
                data: '{"prefix":"","UID":"' + uid + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {
                    var arr = eval(response.d);
                    var html = "";
                    var name = arr[0].Name;
                    $("#spndecl").html(name);
                    //alert($('#spndecl').text(arr[0].Name));
                    //$.each(arr, function () {
                    //    $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    //    //console.log(this.Id + ',' + this.Name);
                    //});
                    if (qs["UID"] != null && qs["UID"] != "") {
                        $('#btnSubmit').prop('disabled', false);
                    }
                },
                error: function (a, b, c) {
                    alert("1." + a.responseText);
                }
            });
        }
        else {
            $("#spndecl").html("");
            $('#btnSubmit').prop('disabled', true);
        }
    }
</script>
<div class="box-body box-body-open">
    <div class="col-sm-6 col-md-6 col-lg-12">
        <div class="text-danger text-danger-green mt0">
            <p class="text-justify">
                <input type="checkbox" runat="server" id="disclaimercheck" onclick="javascript: declaration(this.checked);" /> {{resourcesData.lblI}} 
                <span id="spndecl" style="font-weight:bold;text-transform:uppercase;"></span>
                {{resourcesData.lblDeclarationText}}                                        
            </p>
        </div>
    </div>
    <div class="clearfix">
    </div>

</div>
