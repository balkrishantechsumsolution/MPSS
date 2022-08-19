<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Address.ascx.cs" Inherits="CitizenPortal.WebApp.Control.Address" %>
<%--<script src="/WebApp/Scripts/AddressScript.js?v=<%=Guid.NewGuid()%>"></script>--%>
<script src="/WebApp/Scripts/AddressScript.js"></script>

<script type="text/javascript">

    $(document).ready(function () {
        debugger;
        //$.ajax({
        //    type: "POST",
        //    contentType: "application/json; charset=utf-8",
        //    url: '../../Registration/KioskRegistration.aspx/GetState',
        //    data: '{"prefix": ""}',
        //    processData: false,
        //    dataType: "json",
        //    success: function (response) {
        //        var arr = eval(response.d);
        //        var html = "";
        //        $("[id*=ddlState]").empty();
        //        $("[id*=ddlState]").append('<option value = "0">-Select-</option>');
        //        $.each(arr, function () {
        //            $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
        //            //console.log(this.Id + ',' + this.Name);
        //        });

        //    },
        //    error: function (a, b, c) {
        //        alert("1." + a.responseText);
        //    }
        //});


        var StateControl = "ctl00$ContentPlaceHolder1$Address2$ddlState";
        var DistrictControl = "ctl00$ContentPlaceHolder1$Address2$ddlDistrict";
        var TalukaControl = "ctl00$ContentPlaceHolder1$Address2$ddlTaluka";
        var VillageControl = "ctl00$ContentPlaceHolder1$Address2$ddlVillage";

        //$("[name='" + TalukaControl + "']")

        var sPath = window.location.pathname;
        //var sPage = sPath.substring(sPath.lastIndexOf('\\') + 1);
        var sPage = sPath.substring(sPath.lastIndexOf('/') + 1);
        //alert(sPage);

        if (sPage == "BasicDetail.aspx" || sPage == "CitizenProfile.aspx") {

        }
        //else if (sPage == "CitizenProfile.aspx") {

        //}
        else {
            //GetStateV2("", StateControl); commented by niraj for binding state of ODISHA only and its taluka
            var objState = "ContentPlaceHolder1_Address1_ddlState";
            var objDistrict = "ContentPlaceHolder1_Address1_ddlDistrict";
            var objTaluka = "ContentPlaceHolder1_Address1_ddlTaluka";
            var objVillage = "ContentPlaceHolder1_Address1_ddlVillage";
            
            GetStateOdisha(objState, objDistrict, objTaluka, objVillage);
        }
        $("[name='" + StateControl + "']").bind("change", function (e) { return GetDistrict("", $("[name='" + StateControl + "']").val(), DistrictControl); });
        $("[name='" + DistrictControl + "']").bind("change", function (e) { return GetSubDistrict("", DistrictControl, TalukaControl); });
        $("[name='" + TalukaControl + "']").bind("change", function (e) { return GetVillage("", TalukaControl, VillageControl); });
        //$("#btnConfirm").bind("click", function (e) { return CheckDeclaration(); });

    });
    //function GetDistrict(category) {
    //    var SelIndex = $("#ddlState").val();

    //    $.ajax({
    //        type: "POST",
    //        contentType: "application/json; charset=utf-8",
    //        url: '../../Registration/KioskRegistration.aspx/GetDistrict',
    //        data: '{"prefix":"' + category + '","StateCode":"' + SelIndex + '"}',
    //        processData: false,
    //        dataType: "json",
    //        success: function (response) {
    //            var Category = eval(response.d);
    //            var html = "";
    //            var catCount = 0;
    //            $("[id=ddlDistrict]").empty();
    //            $("[id=ddlDistrict]").append('<option value = "0">-Select-</option>');
    //            $.each(Category, function () {
    //                $("[id=ddlDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
    //                //console.log(this.Id + ',' + this.Name);
    //                catCount++;
    //            });
                
    //        },
    //        error: function (a, b, c) {
    //            alert("2." + a.responseText);
    //        }
    //    });

    //}

    //function GetSubDistrict(category) {
    //    var SelIndex = $("#ddlDistrict").val();

    //    $.ajax({
    //        type: "POST",
    //        contentType: "application/json; charset=utf-8",
    //        url: '../../Registration/KioskRegistration.aspx/GetSubDistrict',
    //        data: '{"prefix":"' + category + '","DistrictCode":"' + SelIndex + '"}',
    //        processData: false,
    //        dataType: "json",
    //        success: function (response) {
    //            var Category = eval(response.d);
    //            var html = "";
    //            var catCount = 0;
    //            $("[id=ddlTaluka]").empty();
    //            $("[id=ddlTaluka]").append('<option value = "0">-Select-</option>');
    //            $.each(Category, function () {
    //                $("[id=ddlTaluka]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
    //                //console.log(this.Id + ',' + this.Name);
    //                catCount++;
    //            });


    //        },
    //        error: function (a, b, c) {
    //            alert("3." + a.responseText);
    //        }
    //    });

    //}

    //function GetVillage(category) {
    //    var SelIndex = $("#ddlTaluka").val();

    //    $.ajax({
    //        type: "POST",
    //        contentType: "application/json; charset=utf-8",
    //        url: '../../Registration/KioskRegistration.aspx/GetVillage',
    //        data: '{"prefix":"' + category + '","SubDistrictCode":"' + SelIndex + '"}',
    //        processData: false,
    //        dataType: "json",
    //        success: function (response) {
    //            var Category = eval(response.d);
    //            var html = "";
    //            var catCount = 0;
    //            $("[id=ddlVillage]").empty();
    //            $("[id=ddlVillage]").append('<option value = "0">-Select-</option>');
    //            $.each(Category, function () {
    //                $("[id=ddlVillage]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
    //                //console.log(this.Id + ',' + this.Name);
    //                catCount++;
    //            });


    //        },
    //        error: function (a, b, c) {
    //            alert("4." + a.responseText);
    //        }


    //    });

    //}
</script>

<%---Start of PostalAddress----%>
<div class="box-body box-body-open">
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
        <div class="form-group">
            <label class="manadatory" for="AddressLine1">
                {{resourcesData.lblAppAddress}}
            </label>
            <input id="AddressLine1" class="form-control" placeholder="First Line Address" name="Address Line-1 (Care of)" type="text" value="" maxlength="100"
                autofocus runat="server" />
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
        <div class="form-group">
            <label class="" for="AddressLine2">
                {{resourcesData.lblAppBuilding}}
            </label>
            <input id="AddressLine2" class="form-control" placeholder="Second Line Address" name="Address Line-2 (Building)" type="text" value="" maxlength="100"
                autofocus runat="server" />
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
        <div class="form-group">
            <label class="manadatory" for="RoadStreetName">
                {{resourcesData.lblAppStreet}}
            </label>
            <input id="RoadStreetName" class="form-control" placeholder="Road / Street Name" name="Road / Street Name" type="text" value="" maxlength="100"
                autofocus runat="server" />
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
        <div class="form-group">
            <label class="" for="LandMark">
                {{resourcesData.lblAppLandmark}}
            </label>
            <input id="LandMark" class="form-control" placeholder="Landmark" name="Landmark" type="text" value="" maxlength="100"
                autofocus runat="server" />
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
        <div class="form-group">
            <label class="manadatory" for="Locality">
                {{resourcesData.lblAppLocality}}
            </label>
            <input id="Locality" class="form-control" placeholder="Locality" name="Locality" type="text" value="" maxlength="100"
                autofocus runat="server" />
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
        <div class="form-group">
            <label class="manadatory" for="ddlState">
                {{resourcesData.lblAppState}}
            </label>
            <select class="form-control" data-val="true" data-val-number="State."
                data-val-required="Please select state" id="ddlState" name="ddlState" runat="server">
                <option>Select State</option>                
            </select>
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
        <div class="form-group">
            <label class="manadatory" for="ddlDistrict">
                {{resourcesData.lblAppDistrict}}
            </label>
            <select class="form-control" data-val="true" data-val-number="District."
                data-val-required="Please select District." id="ddlDistrict" name="ddlDistrict" runat="server">
                <option>Select District</option>                
            </select>
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
        <div class="form-group">
            <label class="manadatory" for="ddlTaluka">
                {{resourcesData.lblappsubdis}}
            </label>
            <select class="form-control" data-val="true" data-val-number="Taluka."
                data-val-required="Please select block." id="ddlTaluka" name="ddlTaluka" runat="server">
                <option>Select Block</option>
            </select>
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
        <div class="form-group">
            <label class="manadatory text-nowrap" for="ddlVillage">
                {{resourcesData.lblAppVillage}}
            </label>
            <select class="form-control" data-val="true" data-val-number="State."
                data-val-required="Please select panchayat" id="ddlVillage" name="ddlVillage" runat="server">
                <option>Select Panchayat</option>
            </select>
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
        <div class="form-group">
            <label class="manadatory" for="PIN">
                {{resourcesData.lblAppPincode}}
            </label>
            <input id="PinCode" class="form-control" placeholder="PIN" name="PIN" type="text" value="" maxlength="6" onkeypress="return isNumberKey(event);"
                autofocus runat="server" />
        </div>
    </div>
    <div class="clearfix">
    </div>
</div>
<%---END of PostalAddress-----%>