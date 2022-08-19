<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="UGMarksEntry.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.UGMarksEntry" %>


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
    <script src="UGMarksEntry.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

      <script type="text/javascript">
        $(document).ready(function () {
           
            $("#divMarks").hide();
            $("#div1").hide();
            
        });

        function Declaration(chk) {
            //debugger;
            // $('#btnSubmit').prop('disabled', true);
            if (chk) {

                $("#DeclarationChk").show(800);
                                
                $("#div1").show();
            }
            else {

                //  $('#btnSubmit').prop('disabled', true);
                $("#DeclarationChk").hide(800);
                                
                $("#div1").hide();
            }
        }
        
          </script>
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

        #CheckBoxList1 > tbody > tr > td {
            padding: 0px 20px 10px 10px !important;
        }

        .form-heading {
            color: #820000;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            text-transform: uppercase;
            font-weight: bold;
            font-size: x-large;
        }

            .form-heading span {
                font-size: 30px;
                padding-left: 0;
            }

        #instn p {
            line-height: 20px;
            color: #777;
            display: flex;
        }

        #instn .mleft10 {
            margin-left: 10px !important;
        }

        #instn li {
            color: #777;
            display: flex;
        }

        .msgBox {
            width: 600px !important;
            overflow: auto;
            height: 656px;
        }

        .msgBoxContent {
            width: 468px !important;
        }

        .msgError {
            background-color: yellow;
        }

        .div.msgBoxImage {
            margin: 5px 5px 0 5px;
            display: inline-block;
            float: left;
            height: 75px;
            width: 75px;
        }

        #divOtherInfo label {
            display: inline !important;
        }

        p {
            color: #000000 !important;
            font-family: Arial !important;
        }

        .modalBackground {
            background-color: #000;
            filter: alpha(opacity=90);
            opacity: 0.6;
            left: 0;
            position: absolute;
            top: 0;
            width: 100%;
            z-index: 10000;
            height: 1000%;
        }

        #progressbar12 {
            width: 300px;
            height: 14px;
            background-color: #00aeff;
            filter: progid:DXImageTransform.Microsoft.gradient(GradientType=1,startColorstr=#00aeff, endColorstr=#ff0000);
            background-image: -moz-linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: -webkit-linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: -o-linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: -ms-linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: -webkit-gradient(linear, left bottom, right bottom, color-stop(40%,#00aeff), color-stop(80%,#ff0000),color-stop(100%,#2fff00));
        }

        .text-danger {
            color: maroon !important;
            font-size: 20px;
            font-family: Arial;
        }

        .auto-style1 {
            left: -1px;
            top: 0px;
        }
    </style>

    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
     <div id="page-wrapper" style="min-height: 311px;">
      <div class="row mtop10" id="divCitizenProfile">
           <div class="col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">
                         <input type="checkbox" id="chkDeclaration" runat="server" onclick="javascript: Declaration(this.checked);" />                       
                        Declaration</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="text-danger text-danger-green mt0" id="DeclarationChk" style="display:none;">
                        <p class="text-justify ng-binding">
                           I, <b><span id="lblName" style="text-transform: uppercase;"></span></b>
                            <span id="lblDeclaration" class="ng-binding">hereby affirm that the information given by me in the application is complete and true to the best of my knowledge and belief. I agree to pay Rs. 100/- towards editing of Marks for OUAT UG Admission.
                                 </span>
                        </p>
                    </div>
                </div>
            </div>
    <div class="row" id="div1" runat="server">
                            <div class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">Select Marks Pattern and enter the marks scrored in 10+2 Science Examination
                                    </h4>
                                </div>
                                <div class="box-body box-body-open " style="padding: 0px;">
                                    <table style="width: 98%; margin: 0 auto;" class="table-striped table-bordered table mtop10">
                                        <tr>
                                            <td>
                                                <input type="radio" name="marks" id="rbtnMarkN" value="yes2"  onclick="return fuMarksPartern('1');" />CHSE Marks Pattern (Separate marks for Theory & Practical)
                                             </td>
                                            <td>                                                
                                                <input type="radio" name="marks" id="rbtnMarkY" value="yes1"  onclick="return fuMarksPartern('0');" />ICSE / CBSE & Other Board Marks Pattern (Combined marks including Theory & Practical)
                                           
                                                </td>

                                        </tr>
                                    </table>
                                    <div style="color: #820000; font-weight: bold;" class="pleft15 ptop10">
                                        <p style="color: #820000 !important;">For CHSE : Enter zero (0 as numeric) for mathematics or Botany and Zoology if not studied.</p>
                                        <p style="color: #820000 !important;">For CBSE, ICSC and other boards: Enter zero (0 as numeric) for Mathematics or Biology if not studied. </p>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                    <div class="row" id="divMarks">
                                        <div class="form-group col-md-12" style="margin-bottom: 0 !important;">
                                            <table style="width: 98%; margin:0 auto 10px;" class="table table-striped table-bordered">
                                                <tbody>
                                                    <tr>
                                                        <th style="text-align: center;">
                                                            <asp.Label for="">
                                                                Sl. No.</asp.Label></th>
                                                        <th style="text-align: center; width: 20%;">
                                                            <label class="manadatory" for="">
                                                                Name of Subject</label>
                                                        </th>
                                                        <th style="text-align: center;">
                                                            <label id="lblTheoryTotal">
                                                                Total Mark in Theory</label>
                                                        </th>
                                                        <th style="text-align: center;">
                                                            <label id="lblTheoryObtain">
                                                                Mark Obtain in Theory</label>
                                                        </th>
                                                        <th style="text-align: center;" id="thPTM">
                                                            <label id="lblPractTotal">
                                                                Total Mark<br />
                                                                in Practical</label>
                                                        </th>
                                                        <th style="text-align: center;" id="thPMO">
                                                            <label id="lblPractObtain">
                                                                Marks Obtain<br />
                                                                Practical</label>
                                                        </th>
                                                        <th style="text-align: center;"><label id="lblMarks">
                                                               </label></th>
                                                        <th style="text-align: center;"><label id="lblObtain">
                                                                </label></th>
                                                    </tr>
                                                    <tr>
                                                        <td style="">1.</td>
                                                        <td style="">
                                                            <select name="ddlSubject" id="ddlSubjectPhysics" class="form-control" data-val="true" data-val-number="Village." data-val-required="Please select subject">

                                                                <option value="Physics">Physics</option>

                                                            </select>
                                                        </td>
                                                        <td style="">
                                                            <input id="txtTMT_Physics" class="form-control" placeholder="0" name="txtTotalPhysics0" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus /></td>
                                                        <td style="">
                                                            <input id="txtMOT_Physics" class="form-control" placeholder="0" name="txtTotalPhysics1" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus /></td>
                                                        <td style="" id="tdPTMP">
                                                            <input id="txtTMP_Physics" class="form-control" placeholder="0" name="txtTotalPhysics" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus />
                                                        </td>
                                                        <td style="" id="thPMOP">
                                                            <input id="txtMOP_Physics" class="form-control" placeholder="0" name="txtMarksObtainPhysics" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus maxlength="99" />
                                                        </td>
                                                        <td style="">
                                                            <input id="txtTMTP_Physics" class="form-control" placeholder="0" name="txtTotalPhysics15" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus readonly="true" /></td>
                                                        <td style="">
                                                            <input id="txtTMOTP_Physics" class="form-control" placeholder="0" name="txtTotalPhysics10" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus readonly="true" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="">2.</td>
                                                        <td style="">
                                                            <select name="ddlSubject" id="ddlSubjectChemistry" class="form-control" data-val="true" data-val-required="Please select subject">

                                                                <option value="Chemistry">Chemistry</option>

                                                            </select>
                                                        </td>
                                                        <td>
                                                            <input id="txtTMT_Chemistry" class="form-control" placeholder="0" name="txtTotalPhysics2" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus /></td>
                                                        <td>
                                                            <input id="txtMOT_Chemistry" class="form-control" placeholder="0" name="txtTotalPhysics3" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus /></td>
                                                        <td id="tdPTMC">
                                                            <input id="txtTMP_Chemistry" class="form-control" placeholder="0" name="txtTotalChemistry" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus />
                                                        </td>
                                                        <td style="text-align: right" id="thPMOC">
                                                            <input id="txtMOP_Chemistry" class="form-control" placeholder="0" name="txtMarksObtainChemistry" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus maxlength="99" />
                                                        </td>
                                                        <td style="text-align: right">
                                                            <input id="txtTMTP_Chemistry" class="form-control" placeholder="0" name="txtTotalPhysics16" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus readonly="true" /></td>
                                                        <td style="text-align: right"> 
                                                            <input id="txtTMOTP_Chemistry" class="form-control" placeholder="0" name="txtTotalPhysics11" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus readonly="true" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="">3.</td>
                                                        <td style="">
                                                            <select name="ddlSubject" id="ddlSubjectMath" class="form-control" data-val="true" data-val-required="Please select subject">

                                                                <option value="Mathematics">Mathematics</option>
                                                            </select>
                                                        </td>
                                                        <td style="">
                                                            <input id="txtTMT_Maths" class="form-control" placeholder="0" name="txtTotalPhysics4" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus /></td>
                                                        <td style="">
                                                            <input id="txtMOT_Maths" class="form-control" placeholder="0" name="txtTotalPhysics5" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus /></td>
                                                        <td style="" id="tdPTMPM">
                                                            <input id="txtTMP_Maths" class="form-control" placeholder="0" name="txtTotalMath" type="text" value="0" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus readonly="true" />
                                                        </td>
                                                        <td style="" id="thPMOM">
                                                            <input id="txtMOP_Maths" class="form-control" placeholder="0" name="txtMarksObtainMath" type="text" value="0" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus readonly="true" />
                                                        </td>
                                                        <td style="">
                                                            <input id="txtTMTP_Maths" class="form-control" placeholder="0" name="txtTotalPhysics17" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus readonly="true" /></td>
                                                        <td style="">
                                                            <input id="txtTMOTP_Maths" class="form-control" placeholder="0" name="txtTotalPhysics12" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus readonly="true" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="">4.</td>
                                                        <td style="">
                                                            <%--<select name="ddlSubject" id="ddlSubjectBio" class="form-control" data-val="true" data-val-required="Please select subject">

                                                                <option value="Biology">Botany</option>
                                                            </select>--%>
                                                            <span id="ddlSubjectBio">Botany</span>
                                                        </td>
                                                        <td style="">
                                                            <input id="txtTMT_Botany" class="form-control" placeholder="0" name="txtTotalPhysics6" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus /></td>
                                                        <td style="">
                                                            <input id="txtMOT_Botany" class="form-control" placeholder="0" name="txtTotalPhysics7" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus /></td>
                                                        <td style="" id="tdPTMB">
                                                            <input id="txtTMP_Botany" class="form-control" placeholder="0" name="txtTotalBio" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus />
                                                        </td>
                                                        <td style="" id="thPMOB">
                                                            <input id="txtMOP_Botany" class="form-control" placeholder="0" name="txtMarksObtainBio" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus maxlength="99" />
                                                        </td>
                                                        <td style="">
                                                            <input id="txtTMTP_Botany" class="form-control" placeholder="0" name="txtTotalPhysics18" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus readonly="true" /></td>

                                                        <td style="">
                                                            <input id="txtTMOTP_Botany" class="form-control" placeholder="0" name="txtTotalPhysics13" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus readonly="true" /></td>

                                                    </tr>
                                                    <tr id="trZoo">
                                                        <td style="">5.</td>
                                                        <td style="">
                                                            <select name="ddlSubjectZoo" id="ddlSubjectZoo" class="form-control" data-val="true" data-val-required="Please select subject">

                                                                <option value="Zoology">Zoology</option>
                                                            </select>
                                                        </td>
                                                        <td style="">
                                                            <input id="txtTMT_Zoology" class="form-control" placeholder="0" name="txtTotalPhysics8" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus /></td>
                                                        <td style="">
                                                            <input id="txtMOT_Zoology" class="form-control" placeholder="0" name="txtTotalPhysics9" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus /></td>
                                                        <td style="" id="tdPTMPZ">
                                                            <input id="txtTMP_Zoology" class="form-control" placeholder="0" name="txtTotalZoo" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus />
                                                        </td>
                                                        <td style="" id="thPMOZ">
                                                            <input id="txtMOP_Zoology" class="form-control" placeholder="0" name="txtMarksObtainZoo" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus maxlength="99" />
                                                        </td>
                                                        <td style="">
                                                            <input id="txtTMTP_Zoology" class="form-control" placeholder="0" name="txtTotalPhysics19" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus readonly="true" /></td>

                                                        <td style="">
                                                            <input id="txtTMOTP_Zoology" class="form-control" placeholder="0" name="txtTotalPhysics14" type="text" value="" style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                autofocus readonly="true" /></td>

                                                    </tr>
                                                    <tr style="font-weight: bold; display: none;">
                                                        <td style="text-align: left; font-weight: bold;" colspan="2">TOTAL</td>
                                                        <td style="text-align: right; font-weight: bold;">
                                                            <label runat="server" style="font-weight: bolder;" id="txtTMT_Total">0</label></td>
                                                        <td style="text-align: right; font-weight: bold;">
                                                            <label runat="server" style="font-weight: bolder;" id="txtMOT_Total">0</label></td>
                                                        <td style="text-align: right; font-weight: bold;" id="tdPTMPT">
                                                            <label runat="server" style="font-weight: bolder;" id="txtTMP_Total">0</label></td>
                                                        <td style="text-align: right; font-weight: bold;" id="thPMOT">
                                                            <label runat="server" style="font-weight: bolder;" id="txtMOP_Total">0</label></td>
                                                        <td style="text-align: right; font-weight: bold;">
                                                            <label runat="server" style="font-weight: bolder;" id="txtTMTP_Total">0</label></td>
                                                        <td style="text-align: right; font-weight: bold;">
                                                            <label runat="server" style="font-weight: bolder;" id="txtTMOTP_Total">0</label></td>

                                                    </tr>
                                                    <tr style="font-weight: bold">
                                                        <td style="" colspan="2">Marks in PCM
                                                            <label runat="server" style="font-weight: bolder; margin-left: 20px; width: 50px; float: right;" id="lblPCM">(  0%  )</label></td>
                                                        <td style="text-align: right; font-weight: bold;">
                                                            <label runat="server" id="txtTMT_PCM">0</label></td>
                                                        <td style="text-align: right; font-weight: bold;">
                                                            <label runat="server" id="txtMOT_PCM">0</label></td>
                                                        <td style="text-align: right; font-weight: bold;" id="tdPTMPTPCM">
                                                            <label runat="server" id="txtTMP_PCM">0</label></td>
                                                        <td style="text-align: right; font-weight: bold;" id="thPMOPCM">
                                                            <label runat="server" id="txtMOP_PCM">0</label></td>
                                                        <td style="text-align: right; font-weight: bold;">
                                                            <label runat="server" id="txtTMTP_PCM">0</label></td>
                                                        <td style="text-align: right; font-weight: bold;">
                                                            <label runat="server" id="txtTMOTP_PCM">0</label></td>

                                                    </tr>
                                                    <tr style="font-weight: bold">
                                                        <td style="" colspan="2">Marks in PCB
                                                            <label runat="server" style="font-weight: bolder; margin-left: 20px; width: 50px; float: right;" id="lblPCB">(  0%  )</label></td>
                                                        <td style="text-align: right; font-weight: bold;">
                                                            <label runat="server" id="txtTMT_PCB">0</label></td>
                                                        <td style="text-align: right; font-weight: bold;">
                                                            <label runat="server" id="txtMOT_PCB">0</label></td>
                                                        <td style="text-align: right; font-weight: bold;" id="tdPTMPTPCB">
                                                            <label runat="server" id="txtTMP_PCB">0</label></td>
                                                        <td style="text-align: right; font-weight: bold;" id="thPMOPCB">
                                                            <label runat="server" id="txtMOP_PCB">0</label></td>
                                                        <td style="text-align: right; font-weight: bold;">
                                                            <label runat="server" id="txtTMTP_PCB">0</label></td>
                                                        <td style="text-align: right; font-weight: bold;">
                                                            <label runat="server" id="txtTMOTP_PCB">0</label></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
    
                <div id="divBtn" class="row">
                    <div class="col-md-12 box-container" style="margin-top: 5px;">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <input type="button" id="btnSubmit" class="btn btn-success" value="Submit"   title="Proceed to Upload Necessary Document" onclick="SubmitData();" />
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page"
                                CssClass="btn btn-danger" PostBackUrl=""
                                Text="Cancel" />
                             <input type="button" id="BtnHome" class="btn btn-primary" title="Back to Home Page"
                                value="Home" onclick="HomePage();" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
          </div>
         </div>
    <asp:HiddenField ID="HFServiceID" runat="server" Value="388" />
    <asp:HiddenField ID="HFb64" runat="server" />
    <asp:HiddenField ID="HFSizeOfPhoto" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFUIDData" runat="server" />
    <asp:HiddenField ID="HFb64Sign" runat="server" />
    <asp:HiddenField ID="HFSizeOfSign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />
</asp:Content>
