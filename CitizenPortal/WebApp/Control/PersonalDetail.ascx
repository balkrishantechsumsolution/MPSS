<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PersonalDetail.ascx.cs" Inherits="CitizenPortal.WebApp.Control.PersonalDetail" %>

<script type="text/javascript">

    function fngender() {
        var tid = $('#ddlSalutation :selected').val();
        if (tid != 0) {

            if (tid == 1) {
                //$("#ddlGender option[value='M']").attr("selected", "selected");
                $("#ddlGender").val('M');
                //$('#ddlStatus').val('M004') = "";
            }
            if (tid == 2) {
                //$("#ddlGender option[value='F']").attr("selected", "selected");
                $("#ddlGender").val('F');

            }

        }
        else {
            $("#ddlGender").val('S');

        }

    }
    function fntitle() {
        var Gid = $('#ddlGender :selected').val();
        if (Gid !='S') {

            if (Gid == 'M') {
                //$("#ddlGender option[value='M']").attr("selected", "selected");
                $("#ddlSalutation").val(1);
            }
            if (Gid == 'F') {
                //$("#ddlGender option[value='F']").attr("selected", "selected");
                $("#ddlSalutation").val(2);
            }

        }
        else {
            $("#ddlSalutation").val(0);

        }

    }
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

    $(document).ready(function () {
        var qs = getQueryStrings();
        if (qs['UserID'] != null) {
            fnFetchUserDetails(qs['UserID']);
        }

        $('#Age').attr("readonly", true);
        $('#DOB').datepicker({
            dateFormat: "dd/mm/yy",
            changeMonth: true,
            changeYear: true,
            maxDate: '-1d',
            yearRange: "-150:+0",
            onSelect: function (date) {
                
                var t_DOB = $("#DOB").val();
                /*
                var D1 = t_DOB.split('/');
                var calday = D1[0];
                var calmon = D1[1];
                var calyear = D1[2];

                var S_date = calyear.toString() + "/" + calmon.toString() + "/" + calday.toString();  //new Date(calyear, calmon - 1, calday);

                var Age = calage(S_date);
                */
                t_DOB = t_DOB.replace("-", "/");
                var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
                //var Age = calage(S_date);
                var Age = calage1(t_DOB);

                $('#Age').val(Age);
                
            }
        });

        $(function () {
            $("#Photo").change(function () {
                if (this.files && this.files[0]) {
                    var reader = new FileReader();
                    reader.onload = imageIsLoaded;
                    reader.readAsDataURL(this.files[0]);
                }
            });
        });

        function imageIsLoaded(e) {
            $('#imgPhoto').attr('src', e.target.result);
        };

        m_ServiceID = $('#HFServiceID').val();
        
    });

    function calage1(dob) {
        var D1 = dob.split('/');
        var calday = D1[0];
        var calmon = D1[1];
        var calyear = D1[2];

        var curd = new Date(curyear, curmon - 1, curday);
        var cald = new Date(calyear, calmon - 1, calday);
        var diff = Date.UTC(curyear, curmon, curday, 0, 0, 0) - Date.UTC(calyear, calmon, calday, 0, 0, 0);
        var dife = datediff(curd, cald);
        return dife[0];
    }
   
    function fnFetchUserDetails(UserID) {
        $.when(
          $.ajax({
              type: "POST",
              contentType: "application/json; charset=utf-8",
              url: '/webapp/citizen/forms/basicdetails.aspx/GetUserDetails',
              //data: '{"prefix": ""}',
              //data: '{"UID": '+uid+'}',
              data: '{"prefix":"","UID":"' + UserID + '"}',
              processData: false,
              dataType: "json",
              success: function (response) {

              },
              error: function (a, b, c) {   
                  alert("1." + a.responseText);
              }
          })
           ).then(function (data, textStatus, jqXHR) {
               var obj = jQuery.parseJSON(data.d);
               var AppID = obj.AppID;
               var arr = eval(data.d);
               var html = "";
               var name = arr[0].Name;
               if (name != null && name != "") {
                   $('#FirstName').val(name);
                   $('#FirstName').prop('disabled', true);
               }
               var email = arr[0].EmailID;
               if (email != null && email != "") {
                   $('#EmailID').val(email);
                   $('#EmailID').prop('disabled', true);
               }
               var mobile = arr[0].Mobile;
               if (mobile != null && mobile != "") {
                   $('#MobileNo').val(mobile);
                   $('#MobileNo').prop('disabled', true);
               }
           });
    }
</script>
<style>
    .ui-widget-header {
        color: #333 !important;
        font-weight: normal !important;
    }
</style>
<div class="box-body box-body-open">
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
        <div class="form-group">
            <label class="manadatory" for="ddlSalutation">
                {{resourcesData.lblAppSal}}
            </label>
            <select class="form-control" data-val="true" data-val-number="Salutation."
                data-val-required="Please select Salutation." id="ddlSalutation" name="Salutation" onchange="fngender();">
                <option value="0">Select Title</option>
                <option value="1">Mr</option>
                <option value="2">Ms.</option>  
                <option value="3">Other</option>             
            </select>
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
        <div class="form-group">
            <label class="manadatory" for="firstname">
                {{resourcesData.fullname}}</label>
            <input id="FirstName" class="form-control" placeholder="Full Name" name="Full Name" type="text" value=""
                autofocus />
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
        <div class="form-group">
            <label class="manadatory" for="ddlGender">
                {{resourcesData.lblAppGender}}</label>
            <select class="form-control" data-val="true" data-val-number="Gender"
                data-val-required="Please select gender." id="ddlGender" name="Gender" onchange="fntitle();" >
                <option value="S">Select Gender</option>
                <option value="M">Male</option>
                <option value="F">Female</option>
                <option value="T">Transgender</option>
            </select>
        </div>
    </div>    
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
        <div class="form-group">
            <label class="manadatory" for="FatherName">
                {{resourcesData.lblAppFatherName}}</label>
            <input id="FatherName" class="form-control" placeholder="Father Name" name="Father Name" type="text" value="" maxlength="40" onkeypress="return ValidateAlpha(event)"
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
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
        <div class="form-group">
            <label class="" for="Age">
                {{resourcesData.lblAppAge}}</label>
            <input id="Age" class="form-control" placeholder="Age" name="Age" value="" maxlength="3"
                autofocus />
        </div>
    </div>    
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
        <div class="form-group">
            <label class="" for="EmailID">
                {{resourcesData.lblAppEmail}}</label>
            <input id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" type="email" value="" maxlength="50"
                autofocus />
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
        <div class="form-group">
            <label class="manadatory" for="MobileNo">
                {{resourcesData.lblAppMobile}}</label>
            <input id="MobileNo" class="form-control" placeholder="Mobile No." name="Mobile No." value="" maxlength="10" onkeypress="return isNumberKey(event);"
                autofocus />
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
        <div class="form-group">
            <label class="" for="phoneno">
                Alternate Mobile No.</label>
            <input id="phoneno" class="form-control" placeholder="Alternate Mobile No." name="Alt Mobile No." value="" maxlength="10" onkeypress="return isNumberKey(event);"
                autofocus />
        </div>
    </div>


    <div class="clearfix">
    </div>
</div>
