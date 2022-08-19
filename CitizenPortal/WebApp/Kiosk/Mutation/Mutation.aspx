<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="Mutation.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Mutation.Mutation" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>
<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="../../Scripts/CommonScript.js"></script>
    <script src="../../Scripts/ValidationScript.js"></script>
    <script src="mutation.js"></script>
    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        .table > tbody > tr > th {
            padding: 5px !important;
            text-align: center;
            vertical-align: middle !important;
        }

        .table > tbody > tr > td {
            padding: 10px !important;
        }

        .othrinfohd {
            background-color: #ececec !important;
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
                <div class="clearfix">
                    <uc1:FormTitle runat="server" ID="FormTitle" />
                </div>
                <div class="clearfix">
                    <uc1:ApplicationSteps runat="server" ID="ApplicationSteps" />
                </div>
                <div class="row" id="divDetails" runat="server">
                    <div class="col-md-6 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title">Ownership Details 
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="txtAllottee">
                                        Name of the Original Allottee
                                    </label>
                                    <input id="txtAllottee" class="form-control" placeholder="Original Allottee Name" name="txtAllottee" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="txtFather">
                                        Father's Name
                                    </label>
                                    <input id="txtFather" class="form-control" placeholder="Allottee Father's Name" name="txtFather" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlVillage">
                                        Death Certificate issued by Concern Authority
                                    </label>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="txtIncome">
                                        Issuing Authority Name</label>
                                    <input id="txtDeathIssue" class="form-control" placeholder="Death Certificate Issuing Authority." name="txtDeathIssue" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtIncome">
                                        Death Letter No.</label>
                                    <input id="txtLetter" class="form-control" placeholder="Death Letter No." name="txtLetter" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtRegistration">
                                        Date of Issue
                                    </label>
                                    <input id="DODLI" class="form-control" placeholder="DD/MM/YYYY" name="DODLI" type="text" value="" maxlength="10"
                                        autofocus />

                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label class="manadatory" for="txtDrawing">
                                        Legal Heirs Certificate issued by Concern Authority</label>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="txtHeirship">
                                        Legal heirship Issuing Authority Name</label>
                                    <input id="txtHeirship" class="form-control" placeholder="Issuing Authority Name" name="txtHeirship" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtCaseno">
                                        Misc Case No.</label>
                                    <input id="txtCaseno" class="form-control" placeholder="Enter Case No" name="txtCaseno" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="DOIOH">
                                        Date of Issue
                                    </label>
                                    <input id="DOIOH" class="form-control" placeholder="DD/MM/YYYY" name="DOIOH" type="text" value="" maxlength="10"
                                        autofocus />

                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title">Property Address
                            </h4>
                        </div>
                        <div class="box-body box-body-open">

                            <uc1:Address runat="server" ID="Address2" ClientIDMode="Inherit" />

                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row" id="div3" runat="server">
                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Detail legal heirs/Successor‐in‐interest
                            </h4>
                        </div>
                        <div class="box-body box-body-open" style="">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 0px; margin-top: -15px">
                                <div class="form-group error" id="divmore" runat="server" style="display: none;">
                                </div>
                                <div id="divSuspect">
                                </div>
                                <div class="form-group" style="margin-bottom: 0 !important;">
                                    <table style="width: 100%; margin-bottom: 0;" class="table table-striped table-bordered">
                                        <tbody>
                                            <tr>
                                                <th style="text-align: center;">
                                                    <label class="manadatory" for="txtAccused">
                                                        Name of the legal heirs/Successor‐in‐interest</label>
                                                </th>
                                                <th style="text-align: center;">
                                                    <label for="txtAddress">
                                                        Father's/Husband's Name</label>
                                                </th>
                                                <th style="text-align: center; width: 190px">
                                                    <label for="txtContact">
                                                        Relation to Lessee</label>
                                                </th>
                                                <th style="text-align: center;">
                                                    <label class="" for="txtRemark">
                                                        Remarks</label>
                                                </th>
                                                <th style="text-align: center; width: 100px;">Add</th>
                                            </tr>
                                            <tr>
                                                <td style="">
                                                    <input id="txtHeirshipName" class="form-control" placeholder="Name of the legal heirs/Successor‐in‐interest" name="txtHeirshipName" type="text" value=""
                                                        autofocus />
                                                </td>
                                                <td style="">
                                                    <input id="txtHeirshipFather" class="form-control" placeholder="Name of Father's/Husband's" name="txtHeirshipFather" type="text" value=""
                                                        autofocus />
                                                </td>
                                                <td style="">
                                                    <input id="txtLesseeRelation" class="form-control" placeholder="Relation Name withLessee" name="txtLesseeRelation" type="text" value=""
                                                        autofocus maxlength="99" />
                                                </td>
                                                <td style="">
                                                    <input id="txtRemark" class="form-control" placeholder="Remarks if any" name="txtRemark" type="text" value=""
                                                        autofocus />
                                                </td>
                                                <td align="center">
                                                    <input id="btnAdd" type="button" value="Add" onclick="AddHeirs('');" class="btn btn-success" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row" id="div2" runat="server">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title">Property Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlMouza">
                                        Mouza/Village
                                    </label>
                                    <select class="form-control" data-val="true" data-val-number="Mouza"
                                        data-val-required="Please select Village" id="ddlMouza" name="ddlMouza">
                                        <option>Select Mouza</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtDrawingPlot">
                                        Drawing Plot No.</label>
                                    <input id="txtDrawingPlot" class="form-control" placeholder="Drawing Plot No." name="txtDrawingPlot" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtDrawing">
                                        Drawing No.</label>
                                    <input id="txtDrawing" class="form-control" placeholder="Drawing No." name="txtDrawing" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="txtArea">
                                        Allotted Area</label>
                                    <input id="txtArea" class="form-control" placeholder="Measurment of Allotted Area" name="txtArea" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-1 col-lg-1">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlUnit">
                                        Unit</label>
                                    <select class="form-control" data-val="true" data-val-number="Unit"
                                        data-val-required="Please select Village" id="ddlUnit" name="ddlUnit">
                                        <option value="0">Select Unit</option>
                                        <option value="Sqft">Square Feet</option>
                                        <option value="Acre">Acre</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtPlot">
                                        Revenue Plot No. (As per lease deed)</label>
                                    <input id="txtPlot" class="form-control" placeholder="Revenue Plot No." name="txtPlot" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtIncome">
                                        Date of Physical Possession</label>
                                    <input id="DOPossission" class="form-control" placeholder="DD/MM/YYYY" name="AnnualIncome" type="text" value="" maxlength="10"
                                        autofocus />
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" id="div4" runat="server">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title">Details of Registered Lease Deed
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="txtRegistration">
                                        Registration No.
                                    </label>
                                    <input id="txtRegistration" class="form-control" placeholder="Registration No." name="txtRegistration" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-1">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlYear">
                                        Year
                                    </label>
                                    <select class="form-control" data-val="true" data-val-number="Lease Deed Year"
                                        data-val-required="Please Select Pension Type" id="ddlYear" name="ddlYear">
                                        <option value="0">--Lease Deed Year--</option>
                                        <option value="101">2016</option>
                                        <option value="102">2015</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="txtDeedBook">
                                        Lease Deed Book No.
                                    </label>
                                    <input id="txtDeedBook" class="form-control" placeholder="Lease Deed Book No." name="txtDeedBook" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="txtVolume">
                                        Lease Deed Volume No
                                    </label>
                                    <input id="txtVolume" class="form-control" placeholder="Lease Deed Volume No." name="txtVolume" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtVolume">
                                        Page No of Deed
                                    </label>
                                    <div class="col-lg-2" style="margin-top: -2px;padding: 0;">From Page</div>
                                    <div class="col-lg-4">
                                        <input id="txtPagefrom" class="form-control" placeholder="From Page No." name="txtPagefrom" type="text" value="" style="width: 50px"
                                            autofocus />
                                    </div>
                                    <div class="col-lg-2" style="margin-top: -2px;padding: 0; width: 35px;">To Page</div>
                                    <div class="col-lg-4">
                                        <input id="txtPageTo" class="form-control" placeholder="To Page No." name="txtPageTo" type="text" value="" style="width: 50px"
                                            autofocus />
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlLandType">
                                        Land Used Type
                                    </label>
                                    <select class="form-control" data-val="true" data-val-number="ComplaintType"
                                        data-val-required="Please Select Pension Type" id="ddlLandType" name="ddlLandType">
                                        <option value="0">--Select Land Used Type--</option>
                                        <option value="101">Residential</option>
                                        <option value="102">Shop Cum Residential</option>
                                        <option value="103">Commercial</option>
                                        <option value="104">Industrial</option>
                                        <option value="105">Institutional</option>
                                    </select>
                                </div>
                            </div>


                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>

                <div id="divOtherInfo" class="col-md-12 box-container pleft0 pright0">
                    <div class="box-heading">
                        <h4 class="box-title pleft0">{{resourcesData.otherInformation}}
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">1.</span> Whether lease deed is executed and registered</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="rbtnLeese" id="rbtnLeeseY" value="yes" onclick="return fuShowHideDiv('divDeed', 1);" />{{resourcesData.yes}}
                                            <label for="rbtnLeeseY"></label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="rbtnLeese" id="rbtnLeeseN" value="no" onclick="return fuShowHideDiv('divDeed', 0);" />
                                            {{resourcesData.no}}
                                            <label for="rbtnLeeseN"></label>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div id="divDeed" class="form-group">
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Deed No</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-12 pleft0 pright0">
                                            <input id="txtDeedNo" class="form-control" name="txtDeedNo" placeholder="Enter Deed No" type="text" value="" autofocus="" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Deed Date</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-12 pleft0 pright0">
                                            <input id="txtDeedDate" class="form-control" name="txtDeedDate" placeholder="Enter Deed Date" type="text" value="" autofocus="" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">2.</span> Whether building has been constructed as per approved plan?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="rbtnBuild" id="rbtnBuildY" value="yes" />{{resourcesData.yes}}
                                            <label for="rbtnBuildY"></label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="rbtnBuild" id="rbtnBuildN" value="no" />
                                            {{resourcesData.no}}
                                            <label for="rbtnBuildN"></label>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">3.</span> Is holding tax assessed?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="rbtnTax" id="rbtnTaxY" value="yes" />{{resourcesData.yes}}
                                            <label for="Mrd"></label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="rbtnTax" id="rbtnTaxN" value="no" />
                                            {{resourcesData.no}}
                                            <label for="UnMrd"></label>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">4.</span> Whether the property stands Mortgaged?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="rbtMortgage" id="rbtMortgageY" value="yes" onclick="return fuShowHideDiv('divMortgage', 1);" />{{resourcesData.yes}}
                                            <label for="rbtnLeeseY"></label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="rbtMortgage" id="rbtMortgageN" value="no" onclick="return fuShowHideDiv('divMortgage', 0);" />
                                            {{resourcesData.no}}
                                            <label for="rbtnLeeseN"></label>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div id="divMortgage" class="form-group">
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Mortgage Permission Order No</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-12 pleft0 pright0">
                                            <input id="txtPermission" class="form-control" name="txtDeedNo" placeholder="Enter Deed No" type="text" value="" autofocus="" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Name of the Bank</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-12 pleft0 pright0">
                                            <input id="txtBank" class="form-control" name="txtBank" placeholder="Enter Deed Date" type="text" value="" autofocus="" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Name of the Branch</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-12 pleft0 pright0">
                                            <input id="txtBranch" class="form-control" name="txtBranch" placeholder="Enter Deed Date" type="text" value="" autofocus="" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">5.</span> Whether, any disputepending in the court of law regarding title of the property?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="rbtLaw" id="rbtLawY" value="yes" />{{resourcesData.yes}}
                                            <label for="rbtnLeeseY"></label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="rbtLaw" id="rbtLawN" value="no" />
                                            {{resourcesData.no}}
                                            <label for="rbtnLeeseN"></label>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">6.</span> Whether any application for Mutation for ROR is pending with Tahasildar, Bhubaneswar?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="rbtROR" id="rbtRORY" value="yes" />{{resourcesData.yes}}
                                            <label for="rbtRORY"></label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="rbtROR" id="rbtRORN" value="no" />
                                            {{resourcesData.no}}
                                            <label for="rbtRORN"></label>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">7.</span> Whether there is any unauthorised construction in the premises?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="rbtAuth" id="rbtAuthY" value="yes" />{{resourcesData.yes}}
                                            <label for="rbtRORY"></label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="rbtAuth" id="rbtAuthN" value="no" />
                                            {{resourcesData.no}}
                                            <label for="rbtRORN"></label>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">8.</span> Whether upto date ground rent along with interest, if any, has been paid?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="rbtRent" id="rbtRentY" value="yes" onclick="return fuShowHideDiv('divRent', 1);" />{{resourcesData.yes}}
                                            <label for="rbtRORY"></label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="rbtRent" id="rbtRentN" value="no" onclick="return fuShowHideDiv('divRent', 0);" />
                                            {{resourcesData.no}}
                                            <label for="rbtRORN"></label>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div id="divRent" class="form-group">
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Amount of Ground Rent(Rs)</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-12 pleft0 pright0">
                                            <input id="txtRent" class="form-control" name="txtRent" placeholder="Enter Rent Amount" type="text" value="" autofocus="" />
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>

                <%---Start of Button----%>
                <div class="row" id="divButton" runat="server">
                    <div class="col-md-12 box-container" id="divBtn">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <input type="button" id="btnSubmit" class="btn btn-success" value="Next =>>" />
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
    <asp:HiddenField ID="HFServiceID" runat="server" />
    <input type="text" ng-show="false" id="ngServiceID" name="ServiceID" ng-value="ServiceID" value="100" ng-model="ServiceID" runat="server" visible="false" />
</asp:Content>
