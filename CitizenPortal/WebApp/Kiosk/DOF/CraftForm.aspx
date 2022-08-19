<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="CraftForm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.DOF.CraftForm" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>
<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>
<%@ Register Src="~/WebApp/Control/Declaration.ascx" TagPrefix="uc1" TagName="Declaration" %>
<%@ Register Src="~/WebApp/Control/OISFDeclaration.ascx" TagPrefix="uc1" TagName="OISFDeclaration" %>
<%@ Register Src="~/WebApp/Control/OISFSelfDeclaration.ascx" TagPrefix="uc1" TagName="OISFSelfDeclaration" %>
<%@ Register Src="~/WebApp/Control/ServiceInformation.ascx" TagPrefix="uc1" TagName="ServiceInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <script src="/WebApp/Kiosk/DOF/CRAFT.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

    <script>
        //Other Information DIV SHOW/HIDE//
        function fuShowHideDiv(divID1, divID2, isTrue) {
            debugger;
            //alert(divID);
            if (isTrue == "1") {
                $('#' + divID1).show(500);
                $('#' + divID2).show(500);
            }
            if (isTrue == "0") {
                $('#' + divID1).hide(500);
                $('#' + divID2).hide(500);
            }
        }

        function fuShowHideDiv1(divID, isTrue) {
            debugger;
            //alert(divID);//
            if (isTrue == "1") {
                $('#' + divID).show(500);
            }
            if (isTrue == "0") {
                $('#' + divID).hide(500);
            }
        }
    </script>

    <script type="text/javascript">

        $(document).ready(function () {
            debugger;
            $('#boatOtherinfo').hide();
            $('#HideAddDtl').hide();

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

        function CRAFTdeclaration(chk) {
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

    <style>
        .instn {
            background-color: #E6F2FF;
            border-right: 2px solid #C4E0FF;
            border-bottom: 2px solid #C4E0FF;
            border-left: 2px solid #C4E0FF;
            padding-left: 15px;
            font-size: 14px;
            color: #000;
            line-height: 22px;
        }

        .ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year {
            width: 45%;
            color: #333 !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" class="pleft5 pright5" style="min-height: 500px !important;">
                <div class="col-lg-12">
                    <div class="row">
                        <%--<div class="col-lg-12">
                            <h1>Motorization Of Traditional Craft<br />
                                <span style="display: block;">Application Form for Availing Engine under Motorisation of Traditional Craft (CSS) (With or Without Bank Finance)</span>
                            </h1>
                        </div>--%>
                        <div class="clearfix">
                            <%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
                            <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>{{titleData.lblTitle}}
                            </h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title">Instruction to Fill the Form
                                    <span class="col-md-6 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding: 0;">
                                        <i class="fa fa-info-circle" style="cursor: pointer; font-size: 20px;" title="Information" onclick="ckhInfo();"></i>
                                    </span>
                                    <span class="clearfix"></span>
                                </h4>
                            </div>
                            <div class="instn" id="divInfo">
                                <p><b style="color: #000; padding-top: 10px;">Document to be attached</b></p>
                                <ul>
                                    <li>1.	Aadhaar Card </li>
                                    <li>2.	Identity proof (Please enclose the scan of EPIC / PAN / MFID Card)</li>
                                    <li>3.	Caste Certificate (SC / ST / OBC)</li>
                                    <li>4.	Residential proof (Please enclose the scan of ROR / Electricity bill / LPG Consumer card / Telephone Bill / Ration Card) </li>
                                    <li>5.	Attached scan copy of the boat registration and license certificate</li>
                                    <li>6.	Attach present photo with beneficiary</li>
                                    <li>7.	First page of Bank Account passbook.</li>
                                    <li>8.	Last 2 years IT Return (Incase of income exceed 2,50,000per annum)</li>
                                    <li>9.	Biometric Card of Fisherman </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title pleft0">Boat Condition
                                </h4>
                            </div>
                            <div class="clearfix"></div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0 ">
                                                <p>
                                                    <span><span class="fom-Numbx">1.</span>Whether the Applicant opts Engine for 1st Time?</span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio1" id="good" value="Good" onchange="return BadBoat();" onclick="return fuShowHideDiv('boatOtherinfo', 'HideAddDtl', 1);" />
                                                    Yes<label for="yes"></label>
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio1" id="bad" value="Bad" onchange="return BadBoat();" onclick="return fuShowHideDiv('boatOtherinfo', 'HideAddDtl', 1);" />
                                                    No<label for="no"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col-lg-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title">Additional Details</h4>
                            </div>
                            <div class="box-body box-body-open" id="HideAddDtl">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                                    <div class="form-group">
                                        <label class="manadatory" for="Occupation">
                                            APL / BPL Category.
                                        </label>
                                        <select class="form-control" id="BPLCategory" name="BPLCategory" onchange="return BplAplCategory();">
                                            <option value="0">-Select-</option>
                                            <option value="102">APL</option>
                                            <option value="101">BPL</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                                    <div class="form-group">
                                        <label for="BPLNo" id="AplBplNo">
                                            Apl / BPL
                                        </label>
                                        <input id="BPLNo" class="form-control" placeholder="APL / BPL" name="BPLNo" value="" maxlength="7" autofocus="" onkeypress="return isNumberKey(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 pright0">
                                    <div class="form-group">
                                        <label for="AplBPLYr" id="AplBplYr">Year.</label>
                                        <select name="AplBPLYr" id="BPLYr" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select Apl / BPL Year.">
                                            <option value="0">-Select-</option>
                                            <option value="2010">2010</option>
                                            <option value="2011">2011</option>
                                            <option value="2012">2012</option>
                                            <option value="2013">2013</option>
                                            <option value="2013">2013</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="MobileNo">
                                            Police Station</label>
                                        <input id="PoliceStatn" class="form-control inputbox_bluebdr " maxlength="20" name="PoliceStatn" placeholder="Police Station Name" type="text" value="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <label class="manadatory" for="BoatRegNo">Registration No. of Boat </label>
                                    <div class="form-group">
                                        <input id="BoatRegNo" class="form-control mtop0" placeholder="Registration No." name="BoatRegNo" value="" maxlength="10" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 pleft0">
                                    <div class="form-group">
                                        <label class="manadatory" for="BoatRegNo">Valid Upto </label>
                                        <input id="FishinglincValid" class="form-control mtop0 text-center" placeholder="Valid upto DD/MM/YYYY" name="FishinglincValid" value="" maxlength="0" autofocus="" onkeydown=" return allowBackspace(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                                    <div class="form-group">
                                        <label for="TankArea">
                                            Boat Specification (in ft.)
                                        </label>
                                        <div class="col-xs-4 pleft0">
                                            <input id="BoardLngth" class="form-control mtop0 text-center" placeholder="OAL" name="BoardLngth" value="" maxlength="3" autofocus="" onkeypress="return isNumberKey(event);" />
                                        </div>
                                        <div class="col-xs-4 pleft0">
                                            <input id="BoardDpth" class="form-control mtop0 text-center" placeholder="Depth" name="BoardDpth" value="" maxlength="3" autofocus="" onkeypress="return isNumberKey(event);" />
                                        </div>
                                        <div class="col-xs-4 pleft0">
                                            <input id="BoardWdth" class="form-control mtop0 text-center" placeholder="Width" name="BoardWdth" value="" maxlength="3" autofocus="" onkeypress="return isNumberKey(event);" />
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                                    <div class="form-group">
                                        <label class="manadatory" for="Category">Categeory</label>
                                        <select name="Category" id="lblCategory" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                            <option value="0">-Select-</option>
                                            <option value="SC">SC</option>
                                            <option value="ST">ST</option>
                                            <option value="OBC">OBC</option>
                                            <option value="SEBC">SEBC</option>
                                            <option value="General">General</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                                    <div class="form-group">
                                        <label class="manadatory" for="AnualIncom">Annual Income</label>
                                        <input id="lblAnualIncom" maxlength="7" class="form-control" placeholder="Annual Income" name="AnualIncom" type="text" value="" autofocus="" onkeypress="return isNumberKey(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                                    <div class="form-group">
                                        <label for="BPLYr">Engine Name</label>

                                        <select name="EngneType1" id="EngneType1" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                            <option value="0">-Select-</option>
                                            <option value="Crompton Greives">Crompton Greives</option>
                                            <option value="Kirloskar">Kirloskar</option>
                                            <option value="Other Type Of Engine">Other</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label for="MobileNo">Engine Name(If Other)</label>
                                        <input id="OtherTypeOfEngineDetail" class="form-control" placeholder="Engine Name(If Other)" name="engineHP" type="text" value="" autofocus="" disabled="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pleft0">
                                    <div class="form-group">
                                        <label class="manadatory" for="MnftureDate">Manufacture Date</label>
                                        <input id="MnftureDateBox" class="form-control" placeholder="Engine Manufacture Date" name="MnftureDate" type="text" value="" autofocus="" onkeypress="return ValidateAlpha(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 pleft0">
                                    <div class="form-group">
                                        <label>Engine Type</label>
                                        <select name="EngneType2" id="EngneType2" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                            <option value="0">-Select-</option>
                                            <option value="In-Board">InBoard</option>
                                            <option value="Out-Board">OutBoard</option>
                                            <option value="Engine Type - Other">Other</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                                    <div class="form-group">
                                        <div class="col-xs-6 pright0 pleft0">
                                            <label for="BPLYr">Engine HP</label>
                                            <select name="engineHP" id="engineHP" class="form-control" data-val="true" data-val-number="Board" disabled="">
                                                <option value="0">-Select-</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-6 pright0">
                                            <label for="BPLYr">HP Detail</label>
                                            <input id="otherdDtl" placeholder="Engine HP" class="form-control" name="engineHP" type="text" value="" autofocus="" disabled="" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-10 pright0" id="FirstTimeEngine" style="display: none">
                                    <div class="form-group">
                                        <div class="col-xs-2 ">
                                            <label>Engine No</label>
                                            <input id="EngineNo" class="form-control" placeholder="Engine No" maxlength="15" />
                                        </div>
                                        <div class="col-xs-2 ">
                                            <label>Engine Make</label>
                                            <input id="EngineMake" class="form-control" placeholder="Engine Make" maxlength="25" />
                                        </div>
                                        <div class="col-xs-2 ">
                                            <label>Engine Capacity</label>
                                            <input id="EngineCapacity" class="form-control" placeholder="Engine Capacity" maxlength="10" />
                                        </div>
                                        <div class="col-xs-2 ">
                                            <label>Finance Year</label>
                                            <input id="FinaceYear" class="form-control" placeholder="Finance Year" maxlength="10" />
                                        </div>
                                        <div class="col-xs-2">
                                            <label>Financing Bank</label>
                                            <input id="FinaceBank" class="form-control" placeholder="Finance Bank" maxlength="25" />
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
                                <h4 class="box-title pleft0">Other Information
                                </h4>
                            </div>
                            <div class="clearfix"></div>
                            <div class="box-body box-body-open" id="boatOtherinfo">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0 ">
                                                <p>
                                                    <span><span class="fom-Numbx">1.</span>
                                                        Whether you need engine with  bank finance?
                                                    </span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio2" id="yes" value="yes" onclick="return fuShowHideDiv1('needBnkFin', 1);" />
                                                    Yes<label for="yes"></label>
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio2" id="no" value="no" onclick="return fuShowHideDiv1('needBnkFin', 0);" />
                                                    No<label for="no"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div id="needBnkFin" class="form-group" style="display: none;">
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Bank Name 1	</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <input id="BnkNme1LoanAval" class="form-control" name="BnkNme1LoanAval" placeholder="Bank Name 1" type="text" value="" autofocus="" onkeypress="return ValidateAlpha(event);" />
                                            </div>
                                        </div>
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Address of Bank</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <input id="Bnk1Address" class="form-control" name="Bnk1Address" placeholder="Address of Bank" type="text" value="" autofocus="" onkeypress="return ValidateAlpha(event);" />
                                            </div>
                                        </div>
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Bank Name 2</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <input id="BnkNme2LoanAval" class="form-control" name="BnkNme2LoanAval" placeholder="Bank Name 2" type="text" value="" onkeypress="return ValidateAlpha(event);" />
                                            </div>
                                        </div>
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Address of Bank</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <input id="Bnk2Address" class="form-control" name="Bnk2Address" placeholder="Address of Bank" type="text" value="" autofocus="" onkeypress="return ValidateAlpha(event);" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <%--<div class="form-group mtop5">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0">
                                                <p><span><span class="fom-Numbx">2.</span>Engine required?</span></p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio3" id="Mmbr" value="yes" onclick="return fuShowHideDiv1('engne_reqrd', 1);" />
                                                    Yes<label for="Mrd"></label>
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio3" id="NtMmbr" value="no" onchange="return BadBoat();" onclick="return fuShowHideDiv1('engne_reqrd', 0);" />
                                                    No<label for="UnMrd"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div id="engne_reqrd" class="form-group" style="display: none;">
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Type of engine required</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <select name="EngneType1" id="EngneType1" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                                        <option value="0">Select</option>
                                                        <option value="Crompton Greives">Crompton Greives</option>
                                                        <option value="Kirloskar">Kirloskar</option>
                                                        <option value="OtherTypeOfEngine">Other's</option>
                                                    </select>
                                                </div>
                                                <div class="col-xs-6 pright0">
                                                    <select name="EngneType2" id="EngneType2" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                                        <option value="0">Select</option>
                                                        <option value="InBoard">Inboard</option>
                                                        <option value="OutBoard">Outboard</option>
                                                        <option value="OtherEngineType">Other's</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Please Describe Engine Type</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <input id="OtherTypeOfEngineDetail" class="form-control" name="engineHP" type="text" value="" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>HP of the engine</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <select name="engineHP" id="engineHP" class="form-control" data-val="true" data-val-number="Board"></select>
                                                </div>
                                                <div class="col-xs-6 pright0">
                                                    <input id="otherdDtl" placeholder="HP of the Engine" class="form-control" name="engineHP" type="text" value="" autofocus="" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group mtop5">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0">
                                                <p><span><span class="fom-Numbx">3.</span>Mention Date of Manufacture</span></p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio4" id="MntnMftreDateYes" value="yes" onclick="return fuShowHideDiv1('MnftureDte', 1);" />
                                                    Yes<label for="exarmy"></label>
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio4" id="MntnMftreDateNot" value="no" onclick="return fuShowHideDiv1('MnftureDte', 0);" />
                                                    No<label for="sptprsn"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div id="MnftureDte" style="display: none;">
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Mention Date</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-12 pleft0 pright0">
                                                    <input id="MnftureDateBox" class="form-control" name="SupplrNme" type="text" value="" autofocus="" onkeypress="return ValidateAlpha(event);" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="clearfix"></div>
                                    <div class="form-group mtop5">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0">
                                                <p><span><span class="fom-Numbx">4.</span>Having name of the approved supplier / dealer?</span></p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio4" id="hveLoan" value="yes" onclick="return fuShowHideDiv1('hnvg_loan', 1);" />
                                                    Yes<label for="exarmy"></label>
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio4" id="nthveLoan" value="no" onclick="return fuShowHideDiv1('hnvg_loan', 0);" />
                                                    No<label for="sptprsn"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div id="hnvg_loan" style="display: none;">
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Supplier Name</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-12 pleft0 pright0">
                                                    <input id="SupplrNme" class="form-control" name="SupplrNme" type="text" value="" placeholder="Supplier Name" autofocus="" onkeypress="return ValidateAlpha(event);" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Dealer Name</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <input id="DelrNme" class="form-control" name="DelrNme" type="text" value="" autofocus="" placeholder="Dealer Name" onkeypress="return ValidateAlpha(event);" style="margin-bottom:8px;" />
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>--%>
                                    <div class="form-group mtop5">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0">
                                                <p><span><span class="fom-Numbx">2.</span> Whether Direct Purchase / Purchased through Department?</span></p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio5" id="BoatPrchseDtlYes" value="Direct Purchase" onclick="return fuShowHideDiv1('DrtDeptPchseDtl', 1);" />
                                                    Direct<label for="exarmy"></label>
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio5" id="BoatPrchseDtlNo" value="Department Purchase" onclick="return fuShowHideDiv1('DrtDeptPchseDtl', 0);" />
                                                    Department<label for="sptprsn"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div id="DrtDeptPchseDtl" style="display: none;">
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Purchase From</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-12 pleft0 pright0">
                                                    <select name="DrtPurchaseThrough" id="DirectPurchase" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                                        <option value="0">Select</option>
                                                        <option value="Royal Enterprise">Royal Enterprise, Puri</option>
                                                        <option value="Eastern India">Eastern India, Puri </option>
                                                        <option value="Others">Other</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Other</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <input id="OthrPrchse" class="form-control" name="DelrNme" type="text" value="" autofocus="" onkeypress="return ValidateAlpha(event);" style="margin-bottom: 8px;" />
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- <div class="row">
                        <div class="col-md-12 box-container" id="Div2">
                            <div class="box-heading">
                                <h4 class="box-title manadatory">{{resourcesData.lblDeclaration}}
                                </h4>
                            </div>
                            <uc1:Declaration runat="server" ID="Declaration" />
                        </div>
                    </div>--%>
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
                                            <input type="checkbox" runat="server" onclick="javascript: CRAFTdeclaration(this.checked);" />{{resourcesData.i}}, <b>
                                                <span id="spndecl" style="text-transform: uppercase;"></span>
                                            </b>{{resourcesData.sonwife}}
                                            <span id="lblFthrName" style="text-transform: uppercase;"></span>{{resourcesData.lblDeclarationTextCraft}}
                                        </p>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 box-container" style="margin-top: 5px;">
                        <div class="box-body box-body-open" style="text-align: center; border-top: 1px solid #ccc;">
                            <input type="button" id="btnSubmit" class="btn btn-success" value="Submit" onclick="SubmitData();" />
                            <input type="submit" name="Button1" value="Cancel" id="Button1" class="btn btn-danger" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>