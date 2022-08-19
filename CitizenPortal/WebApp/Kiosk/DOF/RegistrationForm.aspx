<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.DOF.RegistrationForm" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>
<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/dofStylesheet.css" rel="stylesheet" />
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="FisheriesRegistration.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
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

        function FisheriesRegDeclaration(chk) {
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" class="pleft10 pright10" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>FORM I<br />
                            <span style="display: block;">Form of application for Registration / Renewal of Fishing Vessels</span>
                        </h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title">Vessel Basic Details</h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="FhngVslNme">
                                        Name of the fishing vessel</label>
                                    <input id="FhngVslNme" class="form-control mtop0" placeholder="Vessel Name" name="Fishing Vessel Name" value="" maxlength="10" autofocus="" onkeypress="return ValidateAlpha(event);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 pright0" id="divareatank">
                                <div class="form-group">
                                    <label class="manadatory" for="VslRegNo">
                                        Registration No.</label>
                                    <input id="VslRegNo" class="form-control mtop0" placeholder="Vessel Registration No" name="Vessel Registration No" value="" maxlength="10" autofocus="" onkeypress="return AlphaNumeric(event);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5" id="divVillage">
                                <div class="form-group">
                                    <label class="manadatory" for="WhnVslSeurd">
                                        Where and when the fishing vessel was secured
                                    </label>
                                    <div class="col-xs-6 pleft0">
                                        <input id="WhereVslSeurd" class="form-control" placeholder="Where" name="Where" value="" autofocus="" maxlength="12" onkeypress="return AlphaNumeric(event);" />
                                    </div>
                                    <div class="col-xs-6 pright0">
                                        <input id="WhnVslSeurd" class="form-control" placeholder="When" name="When" value="" autofocus="" maxlength="8" onkeypress="return ValidateAlpha(event);" />
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title">Additional Vessel Details</h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="BoatType">
                                        Types of Boat
                                    </label>
                                    <select class="form-control" data-val="true" data-val-required="Please select." name="Boat Type" id="BoatType" onchange="VesselDetailValidation()">
                                        <option value="0">Select </option>
                                        <option value="Mechanized">Mechanized</option>
                                        <option value="NonMechanized">Non Mechanized</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5 pright0">
                                <div class="form-group">
                                    <div class="col-xs-6 pleft0">
                                        <label class="manadatory" for="BoatMaterialUsed">
                                            Materials 
                                        </label>
                                        <select class="form-control" data-val="true" data-val-required="Please select." name="Material Used to Make Boat" id="BoatMaterialUsed">
                                            <option value="0">Select </option>
                                            <option value="Wooden">Wooden</option>
                                            <option value="Steel">Steel</option>
                                            <option value="FRP">FRP</option>
                                            <option value="FerroCement">Ferro Cement</option>
                                        </select>
                                    </div>
                                    <div class="col-xs-6">
                                        <label class="manadatory" for="BoatShtngUsed">
                                            Sheathing 
                                        </label>
                                        <select class="form-control" data-val="true" data-val-required="Please select." name="Boat Sheating" id="BoatShtngUsed">
                                            <option value="0">Select </option>
                                            <option value="Copper">Copper</option>
                                            <option value="GRP">G.R.P</option>
                                            <option value="Aluminium">Aluminium</option>
                                            <option value="NoSheathing">No sheathing</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label class="manadatory" for="BoatLngth">
                                            Boat Length
                                        </label>
                                        <input id="BoatLngth" class="form-control" placeholder="Length in Mtr" name="Boat Length" value="" autofocus="" maxlength="3" onkeypress="return isNumberKey(event);" />
                                    </div>
                                    <div class="col-xs-6 pright0">
                                        <label class="manadatory" for="BoatBrdth">
                                            Boat Breadth
                                        </label>
                                        <input id="BoatBrdth" class="form-control" placeholder="Breadth in Mtr" name="Boat Breadth" value="" autofocus="" maxlength="3" onkeypress="return isNumberKey(event);" />
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label for="EngneVHP">
                                        V.	H. P. of the engine
                                    </label>
                                    <input id="EngneVHP" class="form-control" placeholder="Engine V.H.P" name="EngneVHP" value="" maxlength="10" autofocus="" onkeypress="return AlphaNumeric(event);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5 pright0">
                                <div class="form-group">
                                    <div class="col-xs-6 pleft0">
                                        <label for="EngneNo">
                                            Engine No.
                                        </label>
                                        <input id="EngneNo" class="form-control" placeholder="Engine No." name="EngneNo" value="" maxlength="10" autofocus="" onkeypress="return AlphaNumeric(event);" />
                                    </div>
                                    <div class="col-xs-6">
                                        <label for="TradeMark">Trade Mark</label>
                                        <input id="TradeMrk" class="form-control" placeholder="Type here" name="TradeMark" value="" maxlength="30" autofocus="" onkeypress="return AlphaNumeric(event);" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label class="manadatory" for="VesselType">Type of vessel</label>
                                        <select class="form-control" data-val="true" data-val-required="Please select." name="Lease Tank Category" id="VslType">
                                            <option value="0">Select </option>
                                            <option value="LongLiner">Long Liner </option>
                                            <option value="Trawler">Trawler</option>
                                            <option value="GillNetter">Gill Netter </option>
                                            <option value="FRPBLC">FRP BLC</option>
                                            <option value="CountryBoatWithIBE">Country boat with IBE </option>
                                            <option value="CountryBoatWithOBE">Country boat with OBE </option>
                                        </select>
                                    </div>
                                    <div class="col-xs-6 pright0">
                                        <label class="manadatory" for="VslGearType">
                                            Type of gear to be used
                                        </label>
                                        <select class="form-control" data-val="true" data-val-required="Please select." name="Lease Tank Category" id="VslGearType">
                                            <option value="0">Select </option>
                                            <option value="Trawl Net">Trawl Net </option>
                                            <option value="Gillnet">Gillnet</option>
                                            <option value="PurseSeine">Purse Seine</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="VslConstructedPlce">
                                        Place where Boat Constructed 
                                    </label>
                                    <select class="form-control" data-val="true" data-val-required="Please select." name="Lease Tank Category" id="VslConstructedPlce">
                                        <option value="0">Select </option>
                                        <option value="InsideOdisha">Inside Odisha </option>
                                        <option value="OutSideOdisha">Out side Odisha</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5 pright0">
                                <div class="form-group">
                                    <div class="col-xs-6 pleft0">
                                        <label for="NmeBBYard">
                                            Name of the Boat Building yard
                                        </label>
                                        <input id="NmeBBYard" class="form-control" placeholder="Yard Name" name="EngneNo" value="" maxlength="10" autofocus="" onkeypress="return AlphaNumeric(event);" />
                                    </div>
                                    <div class="col-xs-6">
                                        <label for="KhataNo">
                                            Year of construction of the vessel
                                        </label>
                                        <input id="VslCnstrtnYear" class="form-control" placeholder="Year" name="VslCnstrtnYear" value="" maxlength="5" autofocus="" onkeypress="return isNumberKey(event);" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5 pright0">
                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="OperateBase">
                                            Base where it is proposed to operate
                                        </label>
                                        <input id="OperateBase" class="form-control" placeholder="Vessel Construction Year" name="OperateBase" value="" maxlength="10" autofocus="" onkeypress="return AlphaNumeric(event);" />
                                    </div>
                                    <div class="col-xs-2 pleft0 pright0">
                                        <label for="CrewsNo">
                                            No.of Crews
                                        </label>
                                        <input id="CrewsNo" class="form-control" placeholder="No" name="CrewsNo" value="" maxlength="2" autofocus="" onkeypress="return isNumberKey(event);" />
                                    </div>
                                    <div class="col-xs-4">
                                        <label for="CrewsDesignation">
                                            Crews Designation 
                                        </label>
                                        <input id="CrewsDesignation" class="form-control" placeholder="Designation" name="CrewsDesignation" value="" maxlength="120" autofocus="" onkeypress="return ValidateAlpha(event);" />
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 box-container" id="Div2">
                        <div class="box-heading">
                            <h4 class="box-title manadatory">{{resourcesData.lblDeclaration}}</h4>
                            <div class="clearfix"></div>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-sm-6 col-md-6 col-lg-12">
                                <div class="text-danger text-danger-green mt0">
                                    <p class="text-justify">
                                        <input type="checkbox" runat="server" onclick="javascript: FisheriesRegDeclaration(this.checked);" />{{resourcesData.i}},
                                                <b><span id="spndecl" style="text-transform: uppercase;"></span></b>
                                        <%--</b>{{resourcesData.sonwife}}--%>
                                        <span id="lblFthrName" style="text-transform: uppercase;"></span>{{resourcesData.lblFisheriesRegistrationText}}
                                    </p>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 box-container" style="margin-top: 5px;">
                    <div class="box-body box-body-open" style="text-align: center; border-top: 1px solid #ccc;">
                        <input type="button" id="btnSubmit" class="btn btn-success" value="Submit" onclick="SubmitData();" title="Proceed to Upload Necessary Document" />
                        <input type="submit" name="" value="Cancel" id="Button1" title="Refresh the page" class="btn btn-danger" />
                    </div>
                </div>
                <div class="clearfix">
                </div>
            </div>
        </div>
    </div>
</asp:Content>