<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="UGAndPGMarksEntry.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.PG.UGAndPGMarksEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../../Scripts/jquery-ui-1.11.4.min.js" type="text/javascript"></script>
    <link href="../../../PortalStyles/jquery-ui.min.css" type="text/css" rel="stylesheet" />
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/WebApp/Kiosk/PG/bootbox.min.js"></script>
    <%--<script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>--%>
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <%--<script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>--%>
    <script type="text/javascript" src="/WebApp/Kiosk/PG/MarksEntry.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

        });

        var bool = 0;
        function ckhInfo() {
            if (bool == 1) {
                bool = 0;
                $('#divInfo').slideDown(500);
            }
            else {
                bool = 1;
                $('#divInfo').slideUp(500);
            }
        }
        function fuShowHideDiv(divID, isTrue) {
            debugger;
            //alert(divID);
            if (isTrue == "1") {
                $('#' + divID).show(800);
            }
            if (isTrue == "0") {
                $('#' + divID).hide(800);
            }
        }

    </script>
    <style type="text/css">
        .othrinfohd {
            background-color: #ececec !important;
            padding: 10px 12px;
        }

        #divOtherInfo label {
            display: inline !important;
        }

        .othrinfosubhd2 {
            padding-left: 0;
            padding-right: 0;
            background-color: #f4f4f4;
            border-right: 1px solid #e8e8e8;
            border-bottom: 1px solid #e8e8e8;
            border-left: 1px solid #e8e8e8;
            padding-top: 10px;
        }

        .msgBoxContainer {
            height: auto;
            max-height: 400px;
            overflow-y: scroll;
        }

        #AppcntFatherName, #AppcntMotherName {
            text-transform: uppercase;
        }

        #LoadingDiv {
            position: absolute;
            width: 100%;
            height: 100%;
            background-color: #000;
            right: 0;
            z-index: 1000;
        }

        #load {
            width: 100%;
            height: 100%;
            position: fixed;
            font-size: 20px;
            padding-top: 420px;
            top: 5px;
            text-align: center;
            color: #fff;
            z-index: 9999;
            background: url("/g2c/img/loading.gif") no-repeat;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-color: rgba(0,0,0,0.5);
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="load">Please Wait While Processing Your Request...</div>
    <!----Modal popup show confirmation/acceptance message in eligibility criteria---->
    <div id="PopupModal" class="modal" data-easein="flipBounceXIn" tabindex="-1" role="dialog" aria-labelledby="costumModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>--%>
                    <h4 class="modal-title mdlHd-txt text-center" style="background-color: #dc4444 !important;">Eligibility Criteria </h4>
                </div>
                <div class="modal-body">
                    <div class="col-xs-12 col-sm-6 col-md-12 col-lg-12 text-center">
                        <label id="lblMsg"></label>
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop15"></div>
                </div>
                <div class="modal-footer" style="text-align: center !important;">
                    <input type="button" id="btnyes" class="btn btn-primary" value="OK" data-dismiss="modal" aria-hidden="true" />
                    <%-- <input type="button" id="btnno" class="btn btn-danger" value="NO" data-dismiss="modal" aria-hidden="true" />--%>
                    <%--<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">
                        Close
                    </button>--%>
                </div>
            </div>
        </div>
    </div>

    <div id="page-wrapper" style="min-height: 367px;">
        <div class="row">
            <div class="col-lg-12">
                <h2 class="form-heading mtop5" style="text-transform: none;"><i class="fa fa-pencil-square-o fa-fw pright10"></i>Admission Marks Entry Form
                </h2>
            </div>

            <div class="clearfix"></div>

            <!--Programme and subject details-->
            <div class="col-md-12 box-container" id="">
                <div class="box-heading">
                    <h4 class="box-title">Select Programme</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label id="lblDegree" class="manadatory">Select Department</label>
                            <select id="ddlDepartment" class="form-control">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label id="lblCourseType" class="manadatory">Select Course</label>
                            <select id="ddlCourseType" class="form-control" onchange="GetSUProgrammList();">
                                <option value="0">-Select-</option>
                                <option value="Regular">Regular</option>
                                <option value="Self Financing">Self Financing</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory" for="ddlApplication">Select Programme</label>
                            <select name="" id="ddlProgram" class="form-control">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>

                    <div class="clearfix"></div>
                </div>
            </div>
            <!--End Here-->
            <div class="clearfix"></div>

            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title" style="padding-top: 8px;">Education Qualification of Graduation (+3)/Equivalent</h4>
                </div>
                <div class="box-body box-body-open" id="DivBSCTab">
                    <!----------------Message for doc-------------->

                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="MsgInfo">
                        <div class="alert alert-danger">
                            <i class="fa fa-hand-o-right"></i>
                            <b><span id="txtMsgInfo"></span></b>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="QualifyingExamDiv">
                        <div class="form-group">
                            <label class="manadatory" for="ddlApplication">Select Qualifying Exam</label>
                            <select name="" id="ddlApplyFor" class="form-control">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="LLBDiv3YrsCourse">
                        <div class="form-group">
                            <label for="">
                                Graduate Under 3 Yrs LL.B. Course
                            </label>
                            <select id="ddlLLM3YrsCourse" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="Honours graduate with LLB">Honours graduate with LLB</option>
                                <option value="Pass Graduate/Equivalent with LLB">Pass Graduate /Equivalent with LLB</option>
                            </select>
                        </div>
                    </div>
                    <%--Other than LLB & MBA--%>
                    <!---------------Only for Honours---------------->
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="GrdDivHons1">
                        <div class="form-group">
                            <label for="">
                                Total Marks in Honours
                            </label>
                            <input type="text" id="txtMarksHons" class="form-control" placeholder="Total Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtMarksHons');" onchange="return MarksValidate('txtMarksHons', 'txtMarksSecuredHons');" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="GrdDivHons2">
                        <div class="form-group">
                            <label for="">
                                Total Secured Marks in Honours
                            </label>
                            <input type="text" id="txtMarksSecuredHons" class="form-control" placeholder="Secured Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtMarksSecuredHons');" onchange="return MarksValidate('txtMarksHons', 'txtMarksSecuredHons');" />
                        </div>
                    </div>
                    <!---------------Only for Pass---------------->
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="GrdDivPass1">
                        <div class="form-group">
                            <label for="">
                                Total Marks in Pass
                            </label>
                            <input type="text" id="txtMarksPass" class="form-control" placeholder="Total Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtMarksPass');" onchange="return MarksValidate('txtMarksPass', 'txtMarksSecuredPass');" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="GrdDivPass2">
                        <div class="form-group">
                            <label for="">
                                Total Secured Marks in Pass
                            </label>
                            <input type="text" id="txtMarksSecuredPass" class="form-control" placeholder="Secured Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtMarksSecuredPass');" onchange="return MarksValidate('txtMarksPass', 'txtMarksSecuredPass');" />
                        </div>
                    </div>
                    <!--------Self Finacing Work Exp for MBA--------->
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="WorkExp_MBA">
                        <div class="form-group">
                            <label for="">
                                Work Experience in Year
                            </label>
                            <input type="text" id="txtWorkExp_MBA" class="form-control" placeholder="Work Experience" maxlength="2"
                                onkeypress="return isNumberKeyDecimal(event,'txtWorkExp_MBA');" />
                        </div>
                    </div>
                    <!--------Self Finacing M.Tech Division--------->
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="DivMTech_GraduateDivision">
                        <div class="form-group">
                            <label for="">
                                +3 Honours Division
                            </label>
                            <select id="ddlMTechGrdDivision" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="1st Division">1st Division</option>
                                <option value="2nd Division">2nd Division</option>
                                <option value="3rd Division">3rd Division</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="DivMTech_MscDivision">
                        <div class="form-group">
                            <label for="">
                                M.Sc. Division
                            </label>
                            <select id="ddlMTechMscDivision" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="1st Division">1st Division</option>
                                <option value="2nd Division">2nd Division</option>
                                <option value="3rd Division">3rd Division</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="DivMTech_BTechDivision">
                        <div class="form-group">
                            <label for="">
                                B.E/B.Tech Division
                            </label>
                            <select id="ddlMTechBTechDivision" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="1st Class Hons">1st Class Hons</option>
                                <option value="1st Class">1st Class</option>
                                <option value="2nd Class">2nd Class</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="DivMTech_PG_RSAndGIS">
                        <div class="form-group">
                            <label for="" id="lblPGDivision">
                                PG Diploma Division
                            </label>
                            <select id="ddlMTech_PG_RSAndGIS" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="1st Division">1st Division</option>
                                <option value="2nd Division">2nd Division</option>
                                <%--<option value="3rd Division">3rd Division</option>--%>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="DivBEBTechBscTotalMark">
                        <div class="form-group">
                            <label for="">
                                Total Marks in Aggregate
                            </label>
                            <input type="text" id="txtBEBTechBscTotalMark" class="form-control" placeholder="Secured Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtBEBTechBscTotalMark');" onchange="return MarksValidate('txtBEBTechBscTotalMark', 'txtBEBTechBscMarkSecure');" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="DivBEBTechBscMarkSecure">
                        <div class="form-group">
                            <label for="">
                                Marks Secured in Aggregate
                            </label>
                            <input type="text" id="txtBEBTechBscMarkSecure" class="form-control" placeholder="Secured Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtBEBTechBscMarkSecure');" onchange="return MarksValidate('txtBEBTechBscTotalMark', 'txtBEBTechBscMarkSecure');" />
                        </div>
                    </div>
                    <!------------Msc Nanoo Science Division---------------->
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="DivHonsDivision">
                        <div class="form-group">
                            <label for="">
                                Hons Division
                            </label>
                            <select id="ddlHonsDiv" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="1st Division">1st Division</option>
                                <option value="2nd Division">2nd Division</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="DivPassDivision">
                        <div class="form-group">
                            <label for="">
                                Pass Division
                            </label>
                            <select id="ddlPassDiv" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="1st Division">1st Division</option>
                            </select>
                        </div>
                    </div>
                    <%--Only for LLB & MBA--%>

                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="LLBDiv5Yrs1">
                        <div class="form-group">
                            <label for="">
                                Total Marks in 5 Yrs.
                            </label>
                            <input type="text" id="txtLLMTotalMarks5Yrs" class="form-control" placeholder="Total Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtLLMTotalMarks5Yrss');" onchange="return MarksValidate('txtLLMTotalMarks5Yrs', 'txtLLMmarksSecured5Yrs');" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="LLBDiv5Yrs2">
                        <div class="form-group">
                            <label for="">
                                Max.Marks Secured in Aggregate
                            </label>
                            <input type="text" id="txtLLMmarksSecured5Yrs" class="form-control" placeholder="Secured Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtLLMmarksSecured5Yrs');" onchange="return MarksValidate('txtLLMTotalMarks5Yrs', 'txtLLMmarksSecured5Yrs');" />
                        </div>
                    </div>


                    <%--Only for LLB Graduate with 3 Years--%>

                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="LLBDiv3YrsDivision">
                        <div class="form-group">
                            <label for="">
                                Division In Graduation
                            </label>
                            <select id="ddlLLBHonsDivision" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="1st Div">1st Division</option>
                                <option value="2nd Div">2nd Division</option>
                            </select>
                        </div>
                    </div>
                    <!-------LLB Honours---------->
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="LLBDiv3YrsHons1">
                        <div class="form-group">
                            <label for="">
                                Total Mark in LLB 
                            </label>
                            <input type="text" id="txtLLBHonsTotalMark" class="form-control" placeholder="Total Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtLLBHonsTotalMark');" onchange="return MarksValidate('txtLLBHonsTotalMark', 'txtLLBHonsMarksSecured');" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="LLBDiv3YrsHons2">
                        <div class="form-group">
                            <label for="">
                                Max. Mark Secured in LLB
                            </label>
                            <input type="text" id="txtLLBHonsMarksSecured" class="form-control" placeholder="Secured Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtLLBHonsMarksSecured');" onchange="return MarksValidate('txtLLBHonsTotalMark', 'txtLLBHonsMarksSecured');" />
                        </div>
                    </div>
                    <!-------------LLB Pass------------>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="LLBDiv3YrsPass1">
                        <div class="form-group">
                            <label for="">
                                Total Mark in LLB 
                            </label>
                            <input type="text" id="txtLLBPassTotalMark" class="form-control" placeholder="Total Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtLLBPassTotalMark');" onchange="return MarksValidate('txtLLBPassTotalMark', 'txtLLBPassMarksSecured');" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="LLBDiv3YrsPass2">
                        <div class="form-group">
                            <label for="">
                                Max. Mark Secured in LLB
                            </label>
                            <input type="text" id="txtLLBPassMarksSecured" class="form-control" placeholder="Secured Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtLLBPassMarksSecured');" onchange="return MarksValidate('txtLLBPassTotalMark', 'txtLLBPassMarksSecured');" />
                        </div>
                    </div>

                    <%--Only for MBA Students--%>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="MBADivMark">
                        <div class="form-group">
                            <label for="">
                                Total Mark in Grad./equivalent
                            </label>
                            <input type="text" id="txtMBA_GrdTotalMarks" class="form-control" placeholder="Total Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtMBA_GrdTotalMarks');" onchange="return MarksValidate('txtMBA_GrdTotalMarks', 'txtMBA_GrdTotalMarksSecure');" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="MBADivMarkSecure">
                        <div class="form-group">
                            <label for="">
                                Max. Mark Secured in Graduation 
                            </label>
                            <input type="text" id="txtMBA_GrdTotalMarksSecure" class="form-control" placeholder="Marks Secured" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtMBA_GrdTotalMarksSecure');" onchange="return MarksValidate('txtMBA_GrdTotalMarks', 'txtMBA_GrdTotalMarksSecure');" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="MBADivMATScore">
                        <div class="form-group">
                            <label for="">
                                MAT Score</label>
                            <input type="text" id="txtMBA_MATScore" class="form-control" placeholder="MAT Secured" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtMBA_MATScore');" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <div class="clearfix"></div>
            <%--Experience Details--%>

            <div class="clearfix"></div>
            <%--Other Information Details--%>
            <div id="divOtherInfo">
                <div class="col-md-12 box-container">
                    <div class="box-heading ">
                        <h4 class="box-title manadatory">Other Information</h4>
                    </div>

                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="alert alert-danger">
                                <i class="fa fa-hand-o-right"></i>
                                <b>If select yes the candidate need to upload relevant document for the same.</b>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                        <!-----------Section 9--------------->
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="DivSection10">

                            <div class="col-lg-12 othrinfohd mtop5">
                                <div class="col-md-9 pleft0">
                                    <p><span><span class="fom-Numbx">10.</span>   Whether the Candidate has passed graduation with distinction? </span></p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="radio13" id="DistinctionYes" value="yes" />
                                        <label for="HostelYes">Yes</label>

                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="radio13" id="DistinctionNo" value="no" />
                                        <label for="HostelNo">No</label>
                                    </div>
                                </div>
                            </div>

                            <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center mtop15 mbtm20">
            <input type="button" id="btnSubmit" class="btn btn-verify" value="SUBMIT" style="min-width: 180px;" />
        </div>
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" Value="388" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSizeOfPhoto" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFUIDData" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64Sign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSizeOfSign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />
    </div>

</asp:Content>
